@implementation _MFSecCMSEncoder

- (id)initForSigningWithSender:(id)a3 compositionSpecification:(id)a4 error:(id *)a5
{
  _MFSecCMSEncoder *v8;
  uint64_t v9;
  __SecIdentity *v10;
  uint64_t v11;
  SecCmsMessageStr *v12;
  int v13;
  int *p_SecCMSError;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint32_t v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  int v23;
  NSObject *v24;
  uint64_t v26;
  uint64_t v27;
  int v28;
  NSObject *v29;
  __SecIdentity *v30;
  SecCertificateRef v31;
  SecCertificateRef v32;
  NSObject *v33;
  SecCertificateRef certificateRef;
  objc_super v35;
  _BYTE buf[24];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)_MFSecCMSEncoder;
  v8 = -[MFBufferedDataConsumer init](&v35, sel_init);
  if (!v8)
    return v8;
  v9 = objc_msgSend(a4, "objectForKey:", CFSTR("SigningIdentity"));
  if (!v9)
  {
    v16 = MFLogGeneral();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      goto LABEL_20;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = a3;
    v17 = "#SMIMEErrors Found no identity for \"%@\";
    v18 = v16;
    v19 = 12;
LABEL_12:
    _os_log_impl(&dword_1C8839000, v18, OS_LOG_TYPE_INFO, v17, buf, v19);
    goto LABEL_20;
  }
  v10 = (__SecIdentity *)v9;
  v11 = SecCmsMessageCreate();
  if (!v11)
  {
    v20 = MFLogGeneral();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      goto LABEL_20;
    *(_WORD *)buf = 0;
    v17 = "#SMIMEErrors SecCmsMessageCreate for signing failed";
    v18 = v20;
    v19 = 2;
    goto LABEL_12;
  }
  v12 = (SecCmsMessageStr *)v11;
  if (!SecCmsSignedDataCreate())
  {
    v21 = MFLogGeneral();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
LABEL_19:
      SecCmsMessageDestroy();
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    v22 = "#SMIMEErrors SecCmsSignedDataCreate failed";
LABEL_15:
    _os_log_impl(&dword_1C8839000, v21, OS_LOG_TYPE_INFO, v22, buf, 2u);
    goto LABEL_19;
  }
  SecCmsMessageGetContentInfo();
  v13 = SecCmsContentInfoSetContentSignedData();
  p_SecCMSError = &v8->_SecCMSError;
  v8->_SecCMSError = v13;
  if (v13)
  {
    v15 = MFLogGeneral();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[_MFSecCMSEncoder initForSigningWithSender:compositionSpecification:error:].cold.4();
    goto LABEL_19;
  }
  SecCmsSignedDataGetContentInfo();
  v23 = SecCmsContentInfoSetContentData();
  *p_SecCMSError = v23;
  if (v23)
  {
    v24 = MFLogGeneral();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[_MFSecCMSEncoder initForSigningWithSender:compositionSpecification:error:].cold.3();
    goto LABEL_19;
  }
  v26 = SecCmsSignerInfoCreate();
  if (!v26)
  {
    v21 = MFLogGeneral();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      goto LABEL_19;
    *(_WORD *)buf = 0;
    v22 = "#SMIMEErrors SecCmsSignerInfoCreate failed";
    goto LABEL_15;
  }
  v27 = v26;
  v28 = SecCmsSignerInfoIncludeCerts();
  *p_SecCMSError = v28;
  if (v28)
  {
    v29 = MFLogGeneral();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[_MFSecCMSEncoder initForSigningWithSender:compositionSpecification:error:].cold.2();
    goto LABEL_19;
  }
  *(_QWORD *)buf = 0;
  v30 = (__SecIdentity *)objc_msgSend(a4, "objectForKey:", CFSTR("EncryptionIdentity"));
  if (v30)
    SecIdentityCopyCertificate(v30, (SecCertificateRef *)buf);
  certificateRef = 0;
  SecIdentityCopyCertificate(v10, &certificateRef);
  if (*(_QWORD *)buf)
    v31 = *(SecCertificateRef *)buf;
  else
    v31 = certificateRef;
  MEMORY[0x1CAA35988](v27, v31, 0);
  if (*(_QWORD *)buf)
    v32 = *(SecCertificateRef *)buf;
  else
    v32 = certificateRef;
  MEMORY[0x1CAA3597C](v27, v32, 0);
  if (*(_QWORD *)buf && !CFEqual(*(CFTypeRef *)buf, certificateRef))
    *p_SecCMSError = SecCmsSignedDataAddCertChain();
  if (certificateRef)
    CFRelease(certificateRef);
  if (*(_QWORD *)buf)
    CFRelease(*(CFTypeRef *)buf);
  if (*p_SecCMSError)
  {
    v33 = MFLogGeneral();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[_MFSecCMSEncoder initForSigningWithSender:compositionSpecification:error:].cold.1();
    goto LABEL_19;
  }
  CFAbsoluteTimeGetCurrent();
  SecCmsSignerInfoAddSigningTime();
  v8->_message = v12;
LABEL_20:
  if (!v8->_encoder && !v8->_message || v8->_SecCMSError)
  {
    if (a5)
      *a5 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("SMIME_CANT_SIGN_MESSAGE"), (uint64_t)CFSTR("An error occurred while trying to sign this message with a certificate from “%@”. Verify that your certificate for this address is correct, and that its private key is in your keychain."), CFSTR("Delayed")), a3));

    return 0;
  }
  return v8;
}

- (id)initForEncryptionWithCompositionSpecification:(id)a3 error:(id *)a4
{
  _MFSecCMSEncoder *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __SecIdentity *v13;
  CFIndex v14;
  unint64_t v15;
  uint64_t v16;
  const void **v17;
  size_t v18;
  int v19;
  int *p_SecCMSError;
  NSObject *v21;
  uint64_t v22;
  SecCmsMessageStr *v23;
  int v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  int v29;
  NSObject *v30;
  uint8_t buf[4];
  int v33;
  SecCertificateRef certificateRef;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;
  CFRange v42;

  v41 = *MEMORY[0x1E0C80C00];
  v39.receiver = self;
  v39.super_class = (Class)_MFSecCMSEncoder;
  v6 = -[MFBufferedDataConsumer init](&v39, sel_init);
  if (!v6)
    return v6;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("RecipientCertificates"));
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(v8, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i)));
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v10);
  }
  v13 = (__SecIdentity *)objc_msgSend(a3, "objectForKey:", CFSTR("EncryptionIdentity"));
  if (v13 || (v13 = (__SecIdentity *)objc_msgSend(a3, "objectForKey:", CFSTR("SigningIdentity"))) != 0)
  {
    certificateRef = 0;
    SecIdentityCopyCertificate(v13, &certificateRef);
    if (certificateRef)
    {
      objc_msgSend(v7, "addObject:");
      CFRelease(certificateRef);
    }
  }
  v14 = objc_msgSend(v7, "count");
  MEMORY[0x1E0C80A78]();
  v17 = (const void **)&buf[-v16];
  if (v15 >= 0x200)
    v18 = 512;
  else
    v18 = v15;
  bzero(&buf[-v16], v18);
  v17[v14] = 0;
  v42.location = 0;
  v42.length = v14;
  CFArrayGetValues((CFArrayRef)v7, v42, v17);
  LODWORD(certificateRef) = 128;
  v33 = 184;
  v19 = SecSMIMEFindBulkAlgForRecipients();
  p_SecCMSError = &v6->_SecCMSError;
  v6->_SecCMSError = v19;
  if (v19)
  {
    v21 = MFLogGeneral();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[_MFSecCMSEncoder initForEncryptionWithCompositionSpecification:error:].cold.3();
    goto LABEL_33;
  }
  v22 = SecCmsMessageCreate();
  if (!v22)
  {
    v26 = MFLogGeneral();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C8839000, v26, OS_LOG_TYPE_INFO, "#SMIMEErrors SecCmsMessageCreate for encryption failed", buf, 2u);
    }
    goto LABEL_33;
  }
  v23 = (SecCmsMessageStr *)v22;
  if (!SecCmsEnvelopedDataCreate())
  {
    v27 = MFLogGeneral();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
LABEL_32:
      SecCmsMessageDestroy();
      goto LABEL_33;
    }
    *(_WORD *)buf = 0;
    v28 = "#SMIMEErrors SecCmsEnvelopedDataCreate failed";
LABEL_28:
    _os_log_impl(&dword_1C8839000, v27, OS_LOG_TYPE_INFO, v28, buf, 2u);
    goto LABEL_32;
  }
  SecCmsMessageGetContentInfo();
  v24 = SecCmsContentInfoSetContentEnvelopedData();
  *p_SecCMSError = v24;
  if (v24)
  {
    v25 = MFLogGeneral();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[_MFSecCMSEncoder initForEncryptionWithCompositionSpecification:error:].cold.2();
    goto LABEL_32;
  }
  SecCmsEnvelopedDataGetContentInfo();
  v29 = SecCmsContentInfoSetContentData();
  *p_SecCMSError = v29;
  if (v29)
  {
    v30 = MFLogGeneral();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[_MFSecCMSEncoder initForEncryptionWithCompositionSpecification:error:].cold.1();
    goto LABEL_32;
  }
  if (v14)
  {
    do
    {
      if (!SecCmsRecipientInfoCreate())
        break;
      if (!--v14)
        goto LABEL_46;
      ++v17;
    }
    while (!*p_SecCMSError);
    v27 = MFLogGeneral();
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      goto LABEL_32;
    *(_WORD *)buf = 0;
    v28 = "#SMIMEErrors Failed to create all the required recipients";
    goto LABEL_28;
  }
LABEL_46:
  v6->_message = v23;
LABEL_33:

  if (!v6->_encoder && !v6->_message || *p_SecCMSError)
  {
    if (a4)
      *a4 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1035, MFLookupLocalizedString((uint64_t)CFSTR("SMIME_CANT_ENCRYPT_MESSAGE"), (uint64_t)CFSTR("An error occurred while trying to encrypt your message. Verify that you have valid certificates in your keychain for all of the recipients."), CFSTR("Delayed")));

    return 0;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_encoder)
    SecCmsEncoderDestroy();
  if (self->_message)
    SecCmsMessageDestroy();

  v3.receiver = self;
  v3.super_class = (Class)_MFSecCMSEncoder;
  -[MFBufferedDataConsumer dealloc](&v3, sel_dealloc);
}

- (int64_t)appendData:(id)a3
{
  int *p_SecCMSError;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  int v10;
  NSObject *v11;
  NSObject *v13;
  _QWORD v14[2];

  p_SecCMSError = &self->_SecCMSError;
  if (self->_SecCMSError)
  {
    v4 = MFLogGeneral();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[_MFSecCMSEncoder appendData:].cold.2(v4, v5, v6);
    return -1;
  }
  if (!self->_message)
  {
    v13 = MFLogGeneral();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl(&dword_1C8839000, v13, OS_LOG_TYPE_INFO, "#SMIMEErrors -appendData: called twice _MFSecCMSEncoder (only once is allowed for now)!", (uint8_t *)v14, 2u);
    }
    return -1;
  }
  v7 = objc_msgSend(a3, "length");
  v14[1] = objc_msgSend(a3, "bytes", v7);
  self->_singleShot = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0D46100]);
  v10 = SecCmsMessageEncode();
  *p_SecCMSError = v10;
  if (v10)
  {
    v11 = MFLogGeneral();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_MFSecCMSEncoder appendData:].cold.1();
    v7 = -1;
  }
  SecCmsMessageDestroy();
  self->_message = 0;
  return v7;
}

- (void)done
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_6(&dword_1C8839000, v0, v1, "#SMIMEErrors SecCmsEncoderFinish on -done returned %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)_appendBytes:(const void *)a3 length:(unint64_t)a4
{
  void *v5;
  objc_super v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46080]), "initWithBytesNoCopy:length:freeWhenDone:", a3, a4, 0);
  v6.receiver = self;
  v6.super_class = (Class)_MFSecCMSEncoder;
  -[MFBufferedDataConsumer appendData:](&v6, sel_appendData_, v5);

}

- (id)data
{
  id result;
  objc_super v4;

  result = self->_singleShot;
  if (!result)
  {
    v4.receiver = self;
    v4.super_class = (Class)_MFSecCMSEncoder;
    return -[MFBufferedDataConsumer data](&v4, sel_data);
  }
  return result;
}

- (int)lastSecCMSError
{
  return self->_SecCMSError;
}

- (void)initForSigningWithSender:compositionSpecification:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_6(&dword_1C8839000, v0, v1, "#SMIMEErrors SecCmsSignedDataAddCertChain returned %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)initForSigningWithSender:compositionSpecification:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_6(&dword_1C8839000, v0, v1, "#SMIMEErrors SecCmsSignerInfoIncludeCerts returned %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)initForSigningWithSender:compositionSpecification:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_6(&dword_1C8839000, v0, v1, "#SMIMEErrors SecCmsContentInfoSetContentData for signing returned %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)initForSigningWithSender:compositionSpecification:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_6(&dword_1C8839000, v0, v1, "#SMIMEErrors SecCmsContentInfoSetContentSignedData returned %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)initForEncryptionWithCompositionSpecification:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_6(&dword_1C8839000, v0, v1, "#SMIMEErrors SecCmsContentInfoSetContentData for encryption returned %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)initForEncryptionWithCompositionSpecification:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_6(&dword_1C8839000, v0, v1, "#SMIMEErrors SecCmsContentInfoSetContentEnvelopedData returned %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)initForEncryptionWithCompositionSpecification:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_6(&dword_1C8839000, v0, v1, "#SMIMEErrors SecSMIMEFindBulkAlgForRecipients returned %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)appendData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_6(&dword_1C8839000, v0, v1, "#SMIMEErrors SecCmsMessageEncode returned %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)appendData:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_7_1(&dword_1C8839000, a1, a3, "#SMIMEErrors -appendData: called on _MFSecCMSEncoder after an error has occurred!", v3);
  OUTLINED_FUNCTION_1_3();
}

@end
