@implementation _MFSecCMSEncoder

- (id)initForSigningWithSender:(void *)a3 compositionSpecification:(_QWORD *)a4 error:
{
  id v7;
  id v8;
  __SecIdentity *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  __SecIdentity *v18;
  SecCertificateRef v19;
  SecCertificateRef v20;
  NSObject *v21;
  SecCertificateRef certificateRef;
  objc_super v23;
  _BYTE buf[24];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (!a1)
    goto LABEL_30;
  v23.receiver = a1;
  v23.super_class = (Class)_MFSecCMSEncoder;
  a1 = objc_msgSendSuper2(&v23, sel_init);
  if (!a1)
    goto LABEL_30;
  v9 = (__SecIdentity *)objc_msgSend(v8, "objectForKey:", CFSTR("SigningIdentity"));
  if (!v9)
  {
    MFLogGeneral();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_1A4F90000, v12, OS_LOG_TYPE_INFO, "#SMIMEErrors Found no identity for \"%@\", buf, 0xCu);
    }
    goto LABEL_12;
  }
  v10 = SecCmsMessageCreate();
  if (!v10)
  {
    MFLogGeneral();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v12, OS_LOG_TYPE_INFO, "#SMIMEErrors SecCmsMessageCreate for signing failed", buf, 2u);
    }
LABEL_12:

    goto LABEL_24;
  }
  if (!SecCmsSignedDataCreate())
  {
    MFLogGeneral();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v11, OS_LOG_TYPE_INFO, "#SMIMEErrors SecCmsSignedDataCreate failed", buf, 2u);
    }
    goto LABEL_22;
  }
  SecCmsMessageGetContentInfo();
  *((_DWORD *)a1 + 10) = SecCmsContentInfoSetContentSignedData();
  if (*((_DWORD *)a1 + 10))
  {
    MFLogGeneral();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_MFSecCMSEncoder initForSigningWithSender:compositionSpecification:error:].cold.4();
LABEL_22:

LABEL_23:
    SecCmsMessageDestroy();
    goto LABEL_24;
  }
  SecCmsSignedDataGetContentInfo();
  *((_DWORD *)a1 + 10) = SecCmsContentInfoSetContentData();
  if (*((_DWORD *)a1 + 10))
  {
    MFLogGeneral();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_MFSecCMSEncoder initForSigningWithSender:compositionSpecification:error:].cold.3();
    goto LABEL_22;
  }
  v17 = SecCmsSignerInfoCreate();
  if (!v17)
  {
    MFLogGeneral();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v11, OS_LOG_TYPE_INFO, "#SMIMEErrors SecCmsSignerInfoCreate failed", buf, 2u);
    }
    goto LABEL_22;
  }
  *((_DWORD *)a1 + 10) = SecCmsSignerInfoIncludeCerts();
  if (*((_DWORD *)a1 + 10))
  {
    MFLogGeneral();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_MFSecCMSEncoder initForSigningWithSender:compositionSpecification:error:].cold.2();
    goto LABEL_22;
  }
  *(_QWORD *)buf = 0;
  v18 = (__SecIdentity *)objc_msgSend(v8, "objectForKey:", CFSTR("EncryptionIdentity"));
  if (v18)
    SecIdentityCopyCertificate(v18, (SecCertificateRef *)buf);
  certificateRef = 0;
  SecIdentityCopyCertificate(v9, &certificateRef);
  if (*(_QWORD *)buf)
    v19 = *(SecCertificateRef *)buf;
  else
    v19 = certificateRef;
  MEMORY[0x1A85B029C](v17, v19, 0);
  if (*(_QWORD *)buf)
    v20 = *(SecCertificateRef *)buf;
  else
    v20 = certificateRef;
  MEMORY[0x1A85B0290](v17, v20, 0);
  if (*(_QWORD *)buf && !CFEqual(*(CFTypeRef *)buf, certificateRef))
    *((_DWORD *)a1 + 10) = SecCmsSignedDataAddCertChain();
  if (certificateRef)
    CFRelease(certificateRef);
  if (*(_QWORD *)buf)
    CFRelease(*(CFTypeRef *)buf);
  if (*((_DWORD *)a1 + 10))
  {
    MFLogGeneral();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[_MFSecCMSEncoder initForSigningWithSender:compositionSpecification:error:].cold.1();

    goto LABEL_23;
  }
  CFAbsoluteTimeGetCurrent();
  SecCmsSignerInfoAddSigningTime();
  *((_QWORD *)a1 + 7) = v10;
LABEL_24:
  if (!*((_QWORD *)a1 + 6) && !*((_QWORD *)a1 + 7) || *((_DWORD *)a1 + 10))
  {
    if (a4)
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      MFLookupLocalizedString(CFSTR("SMIME_CANT_SIGN_MESSAGE"), CFSTR("An error occurred while trying to sign this message with a certificate from “%@”. Verify that your certificate for this address is correct, and that its private key is in your keychain."), CFSTR("Delayed"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", v14, v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, v15);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    a1 = 0;
  }
LABEL_30:

  return a1;
}

- (id)initForEncryptionWithCompositionSpecification:(_QWORD *)a3 error:
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __SecIdentity *v12;
  CFIndex v13;
  uint64_t v14;
  char *v15;
  char v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  id v22;
  uint64_t v24;
  _QWORD *v25;
  SecCertificateRef certificateRef[2];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;
  CFRange v34;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (!a1)
    goto LABEL_45;
  v31.receiver = a1;
  v31.super_class = (Class)_MFSecCMSEncoder;
  a1 = objc_msgSendSuper2(&v31, sel_init);
  if (!a1)
    goto LABEL_45;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v25 = a3;
  objc_msgSend(v5, "objectForKey:", CFSTR("RecipientCertificates"));
  v30 = 0u;
  v29 = 0u;
  v28 = 0u;
  v27 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObjectsFromArray:", v11);

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v8);
  }

  v12 = (__SecIdentity *)objc_msgSend(v5, "objectForKey:", CFSTR("EncryptionIdentity"));
  if (v12 || (v12 = (__SecIdentity *)objc_msgSend(v5, "objectForKey:", CFSTR("SigningIdentity"))) != 0)
  {
    certificateRef[0] = 0;
    SecIdentityCopyCertificate(v12, certificateRef);
    if (certificateRef[0])
    {
      objc_msgSend(v6, "addObject:");
      CFRelease(certificateRef[0]);
    }
  }
  v13 = objc_msgSend(v6, "count");
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((v16 & 1) == 0)
    memset(v15, 170, 8 * v13 + 8);
  *(_QWORD *)&v15[8 * v13] = 0;
  v34.location = 0;
  v34.length = v13;
  CFArrayGetValues((CFArrayRef)v6, v34, (const void **)v15);
  v17 = SecCmsMessageCreate();
  if (!v17)
  {
    MFLogGeneral();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(certificateRef[0]) = 0;
      _os_log_impl(&dword_1A4F90000, v19, OS_LOG_TYPE_INFO, "#SMIMEErrors SecCmsMessageCreate for encryption failed", (uint8_t *)certificateRef, 2u);
    }

    goto LABEL_38;
  }
  if (!SecCmsEnvelopedDataCreate())
  {
    MFLogGeneral();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
LABEL_37:

      SecCmsMessageDestroy();
      goto LABEL_38;
    }
    LOWORD(certificateRef[0]) = 0;
    v20 = "#SMIMEErrors SecCmsEnvelopedDataCreate failed";
LABEL_26:
    _os_log_impl(&dword_1A4F90000, v18, OS_LOG_TYPE_INFO, v20, (uint8_t *)certificateRef, 2u);
    goto LABEL_37;
  }
  SecCmsMessageGetContentInfo();
  *((_DWORD *)a1 + 10) = SecCmsContentInfoSetContentEnvelopedData();
  if (*((_DWORD *)a1 + 10))
  {
    MFLogGeneral();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[_MFSecCMSEncoder initForEncryptionWithCompositionSpecification:error:].cold.2();
    goto LABEL_37;
  }
  SecCmsEnvelopedDataGetContentInfo();
  *((_DWORD *)a1 + 10) = SecCmsContentInfoSetContentData();
  if (*((_DWORD *)a1 + 10))
  {
    MFLogGeneral();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[_MFSecCMSEncoder initForEncryptionWithCompositionSpecification:error:].cold.1();
    goto LABEL_37;
  }
  if (v13)
  {
    while (!*((_DWORD *)a1 + 10) && SecCmsRecipientInfoCreate())
    {
      v15 += 8;
      if (!--v13)
        goto LABEL_34;
    }
    MFLogGeneral();
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      goto LABEL_37;
    LOWORD(certificateRef[0]) = 0;
    v20 = "#SMIMEErrors Failed to create all the required recipients";
    goto LABEL_26;
  }
LABEL_34:
  *((_QWORD *)a1 + 7) = v17;
LABEL_38:
  if (!*((_QWORD *)a1 + 6) && !*((_QWORD *)a1 + 7) || *((_DWORD *)a1 + 10))
  {
    if (v25)
    {
      MFLookupLocalizedString(CFSTR("SMIME_CANT_ENCRYPT_MESSAGE"), CFSTR("An error occurred while trying to encrypt your message. Verify that you have valid certificates in your keychain for all of the recipients."), CFSTR("Delayed"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1035, v21);
      v22 = (id)objc_claimAutoreleasedReturnValue();
      *v25 = v22;

    }
    a1 = 0;
  }

LABEL_45:
  return a1;
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
  id v4;
  void *v5;
  NSObject *v6;
  int64_t v7;
  NSMutableData *v8;
  NSMutableData *singleShot;
  int v10;
  NSObject *v11;
  _QWORD v13[2];

  v4 = a3;
  v5 = v4;
  if (self->_SecCMSError)
  {
    MFLogGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_MFSecCMSEncoder appendData:].cold.2();
LABEL_4:

    v7 = -1;
    goto LABEL_11;
  }
  if (!self->_message)
  {
    MFLogGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_INFO, "#SMIMEErrors -appendData: called twice _MFSecCMSEncoder (only once is allowed for now)!", (uint8_t *)v13, 2u);
    }
    goto LABEL_4;
  }
  v7 = objc_msgSend(v4, "length");
  v13[1] = objc_msgSend(objc_retainAutorelease(v5), "bytes", v7);
  v8 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0D46100]);
  singleShot = self->_singleShot;
  self->_singleShot = v8;

  v10 = SecCmsMessageEncode();
  self->_SecCMSError = v10;
  if (v10)
  {
    MFLogGeneral();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[_MFSecCMSEncoder appendData:].cold.1();

    v7 = -1;
  }
  SecCmsMessageDestroy();
  self->_message = 0;
LABEL_11:

  return v7;
}

- (void)done
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v0, v1, "#SMIMEErrors SecCmsEncoderFinish on -done returned %ld", v2);
  OUTLINED_FUNCTION_5();
}

- (id)data
{
  NSMutableData *v3;
  objc_super v5;

  v3 = self->_singleShot;
  if (!v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)_MFSecCMSEncoder;
    -[MFBufferedDataConsumer data](&v5, sel_data);
    v3 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_singleShot, 0);
}

- (void)initForSigningWithSender:compositionSpecification:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v0, v1, "#SMIMEErrors SecCmsSignedDataAddCertChain returned %ld", v2);
  OUTLINED_FUNCTION_5();
}

- (void)initForSigningWithSender:compositionSpecification:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v0, v1, "#SMIMEErrors SecCmsSignerInfoIncludeCerts returned %ld", v2);
  OUTLINED_FUNCTION_5();
}

- (void)initForSigningWithSender:compositionSpecification:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v0, v1, "#SMIMEErrors SecCmsContentInfoSetContentData for signing returned %ld", v2);
  OUTLINED_FUNCTION_5();
}

- (void)initForSigningWithSender:compositionSpecification:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v0, v1, "#SMIMEErrors SecCmsContentInfoSetContentSignedData returned %ld", v2);
  OUTLINED_FUNCTION_5();
}

- (void)initForEncryptionWithCompositionSpecification:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v0, v1, "#SMIMEErrors SecCmsContentInfoSetContentData for encryption returned %ld", v2);
  OUTLINED_FUNCTION_5();
}

- (void)initForEncryptionWithCompositionSpecification:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v0, v1, "#SMIMEErrors SecCmsContentInfoSetContentEnvelopedData returned %ld", v2);
  OUTLINED_FUNCTION_5();
}

- (void)appendData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v0, v1, "#SMIMEErrors SecCmsMessageEncode returned %ld", v2);
  OUTLINED_FUNCTION_5();
}

- (void)appendData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, v0, v1, "#SMIMEErrors -appendData: called on _MFSecCMSEncoder after an error has occurred!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

@end
