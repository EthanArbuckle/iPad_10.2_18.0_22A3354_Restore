@implementation _MFSecCMSDecoder

- (_MFSecCMSDecoder)initWithPartData:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  int v12;
  NSObject *v13;
  uint64_t ContentWithTag;
  uint64_t started;
  NSObject *v16;
  uint8_t v17[8];
  uint64_t v18;
  objc_super v19;

  if (a4)
    *a4 = 0;
  v19.receiver = self;
  v19.super_class = (Class)_MFSecCMSDecoder;
  v6 = -[_MFSecCMSDecoder init](&v19, sel_init);
  if (v6)
  {
    v18 = 0;
    v7 = SecCmsDecoderCreate();
    *((_DWORD *)v6 + 2) = v7;
    if (v7)
    {
      v8 = MFLogGeneral();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[_MFSecCMSDecoder initWithPartData:error:].cold.3();
    }
    else
    {
      objc_msgSend(a3, "bytes");
      objc_msgSend(a3, "length");
      v9 = SecCmsDecoderUpdate();
      *((_DWORD *)v6 + 2) = v9;
      if (v9)
      {
        v10 = MFLogGeneral();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[_MFSecCMSDecoder initWithPartData:error:].cold.2((int *)v6 + 2, a3, v10);
      }
      else
      {
        v12 = SecCmsDecoderFinish();
        *((_DWORD *)v6 + 2) = v12;
        v18 = 0;
        if (*((_QWORD *)v6 + 2))
        {
          *((_BYTE *)v6 + 56) = SecCmsMessageIsEncrypted() != 0;
          v12 = *((_DWORD *)v6 + 2);
        }
        if (v12)
        {
          v13 = MFLogGeneral();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            -[_MFSecCMSDecoder initWithPartData:error:].cold.1();
        }
        *((_QWORD *)v6 + 6) = _ExtractContentWithTag(*((_QWORD *)v6 + 2), 27);
        ContentWithTag = _ExtractContentWithTag(*((_QWORD *)v6 + 2), 26);
        *((_QWORD *)v6 + 5) = ContentWithTag;
        if (ContentWithTag)
        {
          if (!SecCmsSignedDataHasDigests())
          {
            SecCmsSignedDataGetDigestAlgs();
            started = SecCmsDigestContextStartMultiple();
            *((_QWORD *)v6 + 3) = started;
            if (!started)
            {

              v16 = MFLogGeneral();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)v17 = 0;
                _os_log_impl(&dword_1C8839000, v16, OS_LOG_TYPE_INFO, "#SMIMEErrors SecCmsDigestContextStartMultiple failed", v17, 2u);
              }
              v6 = 0;
              if (a4)
                *a4 = +[MFError errorWithDomain:code:userInfo:](MFError, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 12, 0);
            }
          }
        }
      }
    }
    if (v18)
      SecCmsDecoderDestroy();
    if (v6 && a4 && *((_DWORD *)v6 + 2))
      *a4 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, MFLookupLocalizedString((uint64_t)CFSTR("SMIME_UNREADABLE_SIG"), (uint64_t)CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed")));
  }
  return (_MFSecCMSDecoder *)v6;
}

- (void)dealloc
{
  SecCmsDigestContextStr *digest;
  objc_super v4;

  digest = self->_digest;
  if (digest)
    MEMORY[0x1CAA3585C](digest, a2);
  if (self->_message)
    SecCmsMessageDestroy();

  v4.receiver = self;
  v4.super_class = (Class)_MFSecCMSDecoder;
  -[_MFSecCMSDecoder dealloc](&v4, sel_dealloc);
}

- (int64_t)appendData:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  NSObject *v10;
  uint8_t v11[16];

  if (self->_SecCMSError)
  {
    v3 = MFLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[_MFSecCMSDecoder appendData:].cold.1(v3, v4, v5);
    return -1;
  }
  if (self->_signedData)
  {
    v6 = objc_msgSend(a3, "length");
    if (self->_digest)
    {
      objc_msgSend(a3, "bytes");
      SecCmsDigestContextUpdate();
    }
    return v6;
  }
  if (!self->_envelopedData)
  {
    v10 = MFLogGeneral();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1C8839000, v10, OS_LOG_TYPE_INFO, "#SMIMEErrors -appendData: called on _MFSecCMSDecoder with no signed or enveloped data!", v11, 2u);
    }
    return -1;
  }
  return objc_msgSend(a3, "length");
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
  OUTLINED_FUNCTION_0_6(&dword_1C8839000, v0, v1, "#SMIMEErrors SecCmsSignedDataSetDigestContext on -done returned %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (id)data
{
  _QWORD *envelopedData;

  envelopedData = self->_envelopedData;
  if (envelopedData)
  {
    SecCmsEnvelopedDataGetContentInfo();
    envelopedData = (_QWORD *)SecCmsContentInfoGetInnerContent();
    if (envelopedData)
      envelopedData = (_QWORD *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46100]), "initWithBytesNoCopy:length:freeWhenDone:", envelopedData[1], *envelopedData, 0);
  }
  return envelopedData;
}

- (id)verifyAgainstSenders:(id)a3 signingError:(id *)a4
{
  MFError *v7;
  NSObject *v8;
  uint64_t v10;
  int v11;
  NSArray *v12;
  __SecPolicy *v13;
  __SecPolicy *v14;
  int v15;
  int v16;
  const void *SignerInfo;
  int v18;
  const void *v19;
  uint64_t VerificationStatus;
  SecCertificateRef CertificateAtIndex;
  NSArray *v22;
  uint64_t v23;
  __SecPolicy *v24;
  OSStatus v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  MFMessageSigner *v29;
  MFError *v30;
  NSObject *v31;
  uint64_t SecCMSError;
  const __CFString *v33;
  NSObject *v34;
  const char *v35;
  int v36;
  __SecPolicy *v37;
  uint8_t v38;
  char v39[15];
  uint8_t v40[4];
  uint64_t v41;
  _BYTE trust[12];
  __int16 v43;
  int v44;
  __int16 v45;
  const __CFString *v46;
  uint8_t buf[4];
  OSStatus v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (a4)
    *a4 = 0;
  if (!self->_SecCMSError)
  {
    if (objc_msgSend(a3, "count"))
      v10 = objc_msgSend(a3, "objectAtIndex:", 0);
    else
      v10 = 0;
    if (SecCmsSignedDataHasDigests())
    {
      if (v10)
      {
        v11 = SecCmsSignedDataSignerInfoCount();
        v12 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v11);
        if (v11)
        {
          v13 = +[MFMessageKeychainManager copySMIMESigningPolicyForAddress:](MFMessageKeychainManager, "copySMIMESigningPolicyForAddress:", v10);
          v14 = v13;
          v36 = v11;
          if (v11 >= 1)
          {
            v15 = 0;
            v7 = 0;
            v16 = v36;
            v37 = v13;
            while (1)
            {
              SignerInfo = (const void *)SecCmsSignedDataGetSignerInfo();
              v18 = SecCmsSignedDataVerifySignerInfo();
              self->_SecCMSError = v18;
              if (!v18)
              {
                if (SignerInfo)
                {
                  VerificationStatus = SecCmsSignerInfoGetVerificationStatus();
                  SignerInfo = (const void *)SecCmsSignerInfoCopyCertFromEncryptionKeyPreference();
                  if (SignerInfo)
                  {
LABEL_22:
                    v22 = v12;
                    v23 = v10;
                    v24 = +[MFMessageKeychainManager copySMIMEEncryptionPolicyForAddress:](MFMessageKeychainManager, "copySMIMEEncryptionPolicyForAddress:", v10);
                    *(_QWORD *)trust = 0;
                    v25 = SecTrustCreateWithCertificates(SignerInfo, v24, (SecTrustRef *)trust);
                    CFRelease(v24);
                    CFRelease(SignerInfo);
                    if (v25)
                    {
                      v26 = MFLogGeneral();
                      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 67109120;
                        v48 = v25;
                        _os_log_error_impl(&dword_1C8839000, v26, OS_LOG_TYPE_ERROR, "#SMIMEErrors SecTrustCreateWithCertificates returned %d", buf, 8u);
                      }
                      SignerInfo = 0;
                      v10 = v23;
                      v12 = v22;
                      v16 = v36;
                    }
                    else
                    {
                      SignerInfo = *(const void **)trust;
                      v10 = v23;
                      v12 = v22;
                      v16 = v36;
                      if (!*(_QWORD *)trust)
                      {
                        v28 = MFLogGeneral();
                        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                          -[_MFSecCMSDecoder verifyAgainstSenders:signingError:].cold.2(&v38, v39, v28);
                        SignerInfo = 0;
                      }
                    }
                  }
                  else
                  {
                    CertificateAtIndex = SecTrustGetCertificateAtIndex(0, 0);
                    if ((SecCertificateGetKeyUsage() & 4) != 0)
                    {
                      SignerInfo = CFRetain(CertificateAtIndex);
                      goto LABEL_22;
                    }
                  }
                }
                else
                {
                  VerificationStatus = 2;
                }
                v29 = -[MFMessageSigner initWithSender:signingTrust:encryptionTrust:verification:]([MFMessageSigner alloc], "initWithSender:signingTrust:encryptionTrust:verification:", v10, 0, SignerInfo, VerificationStatus);
                if (SignerInfo)
                  CFRelease(SignerInfo);
                if (a4)
                {
                  v30 = -[MFMessageSigner error](v29, "error");
                  *a4 = v30;
                  if (v30)
                  {
                    v31 = MFLogGeneral();
                    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
                      -[_MFSecCMSDecoder verifyAgainstSenders:signingError:].cold.1(v40, a4, &v41, v31);
                  }
                }
                -[NSArray addObject:](v12, "addObject:", v29);

                goto LABEL_42;
              }
              v7 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, MFLookupLocalizedString((uint64_t)CFSTR("SMIME_UNREADABLE_SIG"), (uint64_t)CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed")));
              v19 = SignerInfo ? (const void *)SecCmsSignerInfoGetSignerEmailAddress() : 0;
              v27 = MFLogGeneral();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                break;
              if (v19)
                goto LABEL_29;
LABEL_42:
              v14 = v37;
              if (v16 == ++v15)
                goto LABEL_55;
            }
            SecCMSError = self->_SecCMSError;
            v33 = CFSTR("(Unknown)");
            if (!v19)
              v33 = 0;
            *(_DWORD *)trust = 134218498;
            *(_QWORD *)&trust[4] = SecCMSError;
            v43 = 1024;
            v44 = v15;
            v45 = 2112;
            v46 = v33;
            _os_log_error_impl(&dword_1C8839000, v27, OS_LOG_TYPE_ERROR, "#SMIMEErrors SecCmsSignedDataVerifySignerInfo returned %ld for #%d:%@", trust, 0x1Cu);
            if (!v19)
              goto LABEL_42;
LABEL_29:
            CFRelease(v19);
            goto LABEL_42;
          }
          v7 = 0;
LABEL_55:
          if (v14)
            CFRelease(v14);
        }
        else
        {
          v7 = 0;
        }
        self->_signers = v12;
        return v7;
      }
      v7 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, MFLookupLocalizedString((uint64_t)CFSTR("SMIME_UNREADABLE_SIG"), (uint64_t)CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed")));
      v34 = MFLogGeneral();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        return v7;
      *(_WORD *)trust = 0;
      v35 = "#SMIMEErrors The message sender is missing";
    }
    else
    {
      v7 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, MFLookupLocalizedString((uint64_t)CFSTR("SMIME_UNREADABLE_SIG"), (uint64_t)CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed")));
      v34 = MFLogGeneral();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        return v7;
      *(_WORD *)trust = 0;
      v35 = "#SMIMEErrors There were no digests in the message";
    }
    _os_log_impl(&dword_1C8839000, v34, OS_LOG_TYPE_INFO, v35, trust, 2u);
    return v7;
  }
  v7 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, MFLookupLocalizedString((uint64_t)CFSTR("SMIME_UNREADABLE_SIG"), (uint64_t)CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed")));
  v8 = MFLogGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[_MFSecCMSDecoder verifyAgainstSenders:signingError:].cold.3();
  return v7;
}

- (BOOL)isContentEncrypted
{
  return self->_isEncrypted;
}

- (BOOL)isContentSigned
{
  return self->_signedData != 0;
}

- (id)signedData
{
  _QWORD *signedData;

  signedData = self->_signedData;
  if (signedData)
  {
    SecCmsSignedDataGetContentInfo();
    signedData = (_QWORD *)SecCmsContentInfoGetInnerContent();
    if (signedData)
      signedData = (_QWORD *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46100]), "initWithBytesNoCopy:length:freeWhenDone:", signedData[1], *signedData, 0);
  }
  return signedData;
}

- (int)lastSecCMSError
{
  return self->_SecCMSError;
}

- (NSArray)signers
{
  return self->_signers;
}

- (void)initWithPartData:error:.cold.1()
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
  OUTLINED_FUNCTION_0_6(&dword_1C8839000, v0, v1, "#SMIMEErrors SecCmsDecoderFinish returned %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)initWithPartData:(NSObject *)a3 error:.cold.2(int *a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  v5 = 134218240;
  v6 = v4;
  v7 = 2048;
  v8 = objc_msgSend(a2, "length");
  _os_log_error_impl(&dword_1C8839000, a3, OS_LOG_TYPE_ERROR, "#SMIMEErrors SecCmsDecoderUpdate returned %ld for %lu bytes", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_2_1();
}

- (void)initWithPartData:error:.cold.3()
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
  OUTLINED_FUNCTION_0_6(&dword_1C8839000, v0, v1, "#SMIMEErrors SecCmsDecoderCreate returned %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)appendData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_7_1(&dword_1C8839000, a1, a3, "#SMIMEErrors -appendData: called on _MFSecCMSDecoder after an error has occurred!", v3);
  OUTLINED_FUNCTION_1_3();
}

- (void)verifyAgainstSenders:(uint64_t *)a3 signingError:(NSObject *)a4 .cold.1(uint8_t *a1, id *a2, uint64_t *a3, NSObject *a4)
{
  uint64_t v7;

  v7 = objc_msgSend(*a2, "ef_publicDescription");
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl(&dword_1C8839000, a4, OS_LOG_TYPE_ERROR, "#SMIMEErrors There was a signing error %{public}@", a1, 0xCu);
}

- (void)verifyAgainstSenders:(NSObject *)a3 signingError:.cold.2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_7_1(&dword_1C8839000, a3, (uint64_t)a3, "#SMIMEErrors SecTrustCreateWithCertificates returned a null SecTrustRef", a1);
}

- (void)verifyAgainstSenders:signingError:.cold.3()
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
  OUTLINED_FUNCTION_0_6(&dword_1C8839000, v0, v1, "#SMIMEErrors _MFSecCMSDecoder asked to verify with pending error (%ld)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
