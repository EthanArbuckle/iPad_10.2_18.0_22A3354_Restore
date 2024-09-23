@implementation _MFSecCMSDecoder

- (char)initWithPartData:(_QWORD *)a3 error:
{
  id v5;
  int v6;
  int *v7;
  NSObject *v8;
  id v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v14;
  NSObject *v15;
  uint64_t ContentWithTag;
  uint64_t started;
  NSObject *v18;
  objc_super v19;
  uint8_t buf[24];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    if (a3)
      *a3 = 0;
    v19.receiver = a1;
    v19.super_class = (Class)_MFSecCMSDecoder;
    a1 = (char *)objc_msgSendSuper2(&v19, sel_init);
    if (a1)
    {
      v6 = SecCmsDecoderCreate();
      *((_DWORD *)a1 + 2) = v6;
      v7 = (int *)(a1 + 8);
      if (v6)
      {
        MFLogGeneral();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[_MFSecCMSDecoder initWithPartData:error:].cold.3();

      }
      else
      {
        v9 = objc_retainAutorelease(v5);
        objc_msgSend(v9, "bytes");
        objc_msgSend(v9, "length");
        v10 = SecCmsDecoderUpdate();
        *v7 = v10;
        if (v10)
        {
          MFLogGeneral();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            -[_MFSecCMSDecoder initWithPartData:error:].cold.2(*v7, buf, objc_msgSend(v9, "length"), v11);

        }
        else
        {
          v14 = SecCmsDecoderFinish();
          *v7 = v14;
          if (*((_QWORD *)a1 + 2))
          {
            a1[56] = SecCmsMessageIsEncrypted() != 0;
            v14 = *((_DWORD *)a1 + 2);
          }
          if (v14)
          {
            MFLogGeneral();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              -[_MFSecCMSDecoder initWithPartData:error:].cold.1();

          }
          *((_QWORD *)a1 + 6) = _ExtractContentWithTag(*((_QWORD *)a1 + 2), 27);
          ContentWithTag = _ExtractContentWithTag(*((_QWORD *)a1 + 2), 26);
          *((_QWORD *)a1 + 5) = ContentWithTag;
          if (ContentWithTag)
          {
            if (!SecCmsSignedDataHasDigests())
            {
              SecCmsSignedDataGetDigestAlgs();
              started = SecCmsDigestContextStartMultiple();
              *((_QWORD *)a1 + 3) = started;
              if (!started)
              {

                MFLogGeneral();
                v18 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1A4F90000, v18, OS_LOG_TYPE_INFO, "#SMIMEErrors SecCmsDigestContextStartMultiple failed", buf, 2u);
                }

                if (a3)
                {
                  +[MFError errorWithDomain:code:userInfo:](MFError, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 12, 0);
                  a1 = 0;
                  *a3 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  a1 = 0;
                }
              }
            }
          }
        }
      }
      if (a1 && a3 && *((_DWORD *)a1 + 2))
      {
        MFLookupLocalizedString(CFSTR("SMIME_UNREADABLE_SIG"), CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, v12);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
  }

  return a1;
}

- (id)verifyAgainstSenders:(id *)a3 signingError:
{
  int *v5;
  void *v6;
  NSObject *v7;
  int v8;
  __int128 v9;
  int v10;
  uint64_t SignerInfo;
  int v12;
  void *v13;
  uint64_t v14;
  MFMessageSigner *SignerEmailAddress;
  uint64_t VerificationStatus;
  NSObject *v17;
  const void *ValueAtIndex;
  __SecPolicy *v19;
  OSStatus v20;
  NSObject *v21;
  const void *v22;
  NSObject *v23;
  NSObject *v24;
  const __CFArray *v25;
  const __CFArray *v26;
  int v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  NSObject *v33;
  const char *v34;
  void *v35;
  __int128 v37;
  void *v38;
  int v39;
  __SecPolicy *v40;
  id v41;
  id v42;
  uint8_t v43;
  _BYTE v44[15];
  _BYTE trust[12];
  __int16 v46;
  int v47;
  __int16 v48;
  const __CFString *v49;
  uint8_t buf[4];
  OSStatus v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v41 = a2;
  if (!a1)
  {
    v42 = 0;
    goto LABEL_67;
  }
  if (a3)
    *a3 = 0;
  v5 = (int *)(a1 + 8);
  if (*(_DWORD *)(a1 + 8))
  {
    MFLookupLocalizedString(CFSTR("SMIME_UNREADABLE_SIG"), CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, v6);
    v42 = (id)objc_claimAutoreleasedReturnValue();

    MFLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[_MFSecCMSDecoder verifyAgainstSenders:signingError:].cold.3();
    goto LABEL_66;
  }
  if (objc_msgSend(v41, "count"))
  {
    objc_msgSend(v41, "objectAtIndex:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  if (!SecCmsSignedDataHasDigests())
  {
    MFLookupLocalizedString(CFSTR("SMIME_UNREADABLE_SIG"), CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, v32);
    v42 = (id)objc_claimAutoreleasedReturnValue();

    MFLogGeneral();
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      goto LABEL_65;
    *(_WORD *)trust = 0;
    v34 = "#SMIMEErrors There were no digests in the message";
LABEL_59:
    _os_log_impl(&dword_1A4F90000, v33, OS_LOG_TYPE_INFO, v34, trust, 2u);
    goto LABEL_65;
  }
  if (!v7)
  {
    MFLookupLocalizedString(CFSTR("SMIME_UNREADABLE_SIG"), CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, v35);
    v42 = (id)objc_claimAutoreleasedReturnValue();

    MFLogGeneral();
    v33 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      goto LABEL_65;
    *(_WORD *)trust = 0;
    v34 = "#SMIMEErrors The message sender is missing";
    goto LABEL_59;
  }
  v8 = SecCmsSignedDataSignerInfoCount();
  v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v8);
  if (v8)
  {
    v40 = +[MFMessageKeychainManager copySMIMESigningPolicyForAddress:](MFMessageKeychainManager, "copySMIMESigningPolicyForAddress:", v7);
    if (v8 >= 1)
    {
      v39 = v8;
      v10 = 0;
      v42 = 0;
      *(_QWORD *)&v9 = 67109120;
      v37 = v9;
      while (1)
      {
        SignerInfo = SecCmsSignedDataGetSignerInfo();
        v12 = SecCmsSignedDataVerifySignerInfo();
        *v5 = v12;
        if (!v12)
          break;
        MFLookupLocalizedString(CFSTR("SMIME_UNREADABLE_SIG"), CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, v13);
        v14 = objc_claimAutoreleasedReturnValue();

        if (SignerInfo)
          SignerEmailAddress = (MFMessageSigner *)SecCmsSignerInfoGetSignerEmailAddress();
        else
          SignerEmailAddress = 0;
        MFLogGeneral();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v30 = *v5;
          v31 = CFSTR("(Unknown)");
          if (!SignerEmailAddress)
            v31 = 0;
          *(_DWORD *)trust = 134218498;
          *(_QWORD *)&trust[4] = v30;
          v46 = 1024;
          v47 = v10;
          v48 = 2112;
          v49 = v31;
          _os_log_error_impl(&dword_1A4F90000, v23, OS_LOG_TYPE_ERROR, "#SMIMEErrors SecCmsSignedDataVerifySignerInfo returned %ld for #%d:%@", trust, 0x1Cu);
        }

        v42 = (id)v14;
LABEL_43:

        if (v39 == ++v10)
          goto LABEL_62;
      }
      if (!SignerInfo)
      {
        v24 = v7;
        v22 = 0;
        VerificationStatus = 2;
        goto LABEL_35;
      }
      VerificationStatus = SecCmsSignerInfoGetVerificationStatus();
      v17 = v7;
      ValueAtIndex = (const void *)SecCmsSignerInfoCopyCertFromEncryptionKeyPreference();
      if (!ValueAtIndex)
      {
        v25 = SecTrustCopyCertificateChain(0);
        v26 = v25;
        if (v25)
        {
          if (CFArrayGetCount(v25) < 1)
          {
            v27 = 0;
            ValueAtIndex = 0;
          }
          else
          {
            ValueAtIndex = CFArrayGetValueAtIndex(v26, 0);
            if (ValueAtIndex && (SecCertificateGetKeyUsage() & 0x14) != 0)
            {
              ValueAtIndex = CFRetain(ValueAtIndex);
              v27 = 1;
            }
            else
            {
              v27 = 0;
            }
          }
          CFRelease(v26);
          if (!v27)
          {
LABEL_24:
            v22 = 0;
LABEL_35:

            SignerEmailAddress = -[MFMessageSigner initWithSender:signingTrust:encryptionTrust:verification:]([MFMessageSigner alloc], "initWithSender:signingTrust:encryptionTrust:verification:", v7, 0, v22, VerificationStatus);
            if (v22)
              CFRelease(v22);
            if (a3)
            {
              -[MFMessageSigner error](SignerEmailAddress, "error");
              v28 = (id)objc_claimAutoreleasedReturnValue();
              *a3 = v28;
              if (v28)
              {
                MFLogGeneral();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(*a3, "ef_publicDescription");
                  objc_claimAutoreleasedReturnValue();
                  -[_MFSecCMSDecoder verifyAgainstSenders:signingError:].cold.1();
                }

              }
            }
            objc_msgSend(v38, "addObject:", SignerEmailAddress, v37);
            goto LABEL_43;
          }
        }
        else
        {
          ValueAtIndex = 0;
        }
      }
      v19 = +[MFMessageKeychainManager copySMIMEEncryptionPolicyForAddress:](MFMessageKeychainManager, "copySMIMEEncryptionPolicyForAddress:", v17, v37);
      *(_QWORD *)trust = 0;
      v20 = SecTrustCreateWithCertificates(ValueAtIndex, v19, (SecTrustRef *)trust);
      CFRelease(v19);
      CFRelease(ValueAtIndex);
      if (v20)
      {
        MFLogGeneral();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v37;
          v51 = v20;
          _os_log_error_impl(&dword_1A4F90000, v21, OS_LOG_TYPE_ERROR, "#SMIMEErrors SecTrustCreateWithCertificates returned %d", buf, 8u);
        }
      }
      else
      {
        v22 = *(const void **)trust;
        if (*(_QWORD *)trust)
          goto LABEL_35;
        MFLogGeneral();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[_MFSecCMSDecoder verifyAgainstSenders:signingError:].cold.2(&v43, v44, v21);
      }

      goto LABEL_24;
    }
    v42 = 0;
LABEL_62:
    if (v40)
      CFRelease(v40);
  }
  else
  {
    v42 = 0;
  }
  v33 = *(NSObject **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v38;
LABEL_65:

LABEL_66:
LABEL_67:

  return v42;
}

- (_QWORD)signedData
{
  if (InnerContent)
  {
    InnerContent = (_QWORD *)InnerContent[5];
    if (InnerContent)
    {
      SecCmsSignedDataGetContentInfo();
      InnerContent = (_QWORD *)SecCmsContentInfoGetInnerContent();
      if (InnerContent)
        InnerContent = (_QWORD *)objc_msgSend(objc_alloc(MEMORY[0x1E0D46100]), "initWithBytesNoCopy:length:freeWhenDone:", InnerContent[1], *InnerContent, 0);
    }
  }
  return InnerContent;
}

- (void)dealloc
{
  SecCmsDigestContextStr *digest;
  objc_super v4;

  digest = self->_digest;
  if (digest)
    MEMORY[0x1A85B0164](digest, a2);
  if (self->_message)
    SecCmsMessageDestroy();
  v4.receiver = self;
  v4.super_class = (Class)_MFSecCMSDecoder;
  -[_MFSecCMSDecoder dealloc](&v4, sel_dealloc);
}

- (int64_t)appendData:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int64_t v7;
  uint8_t v9[16];

  v4 = a3;
  v5 = v4;
  if (self->_SecCMSError)
  {
    MFLogGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_MFSecCMSDecoder appendData:].cold.1();
LABEL_4:

    v7 = -1;
    goto LABEL_5;
  }
  if (!self->_signedData)
  {
    if (self->_envelopedData)
    {
      v7 = objc_msgSend(v4, "length");
      goto LABEL_5;
    }
    MFLogGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1A4F90000, v6, OS_LOG_TYPE_INFO, "#SMIMEErrors -appendData: called on _MFSecCMSDecoder with no signed or enveloped data!", v9, 2u);
    }
    goto LABEL_4;
  }
  v7 = objc_msgSend(v4, "length");
  if (self->_digest)
  {
    objc_msgSend(objc_retainAutorelease(v5), "bytes");
    SecCmsDigestContextUpdate();
  }
LABEL_5:

  return v7;
}

- (void)done
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v0, v1, "#SMIMEErrors SecCmsSignedDataSetDigestContext on -done returned %ld", v2);
  OUTLINED_FUNCTION_5();
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signers, 0);
}

- (void)initWithPartData:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v0, v1, "#SMIMEErrors SecCmsDecoderFinish returned %ld", v2);
  OUTLINED_FUNCTION_5();
}

- (void)initWithPartData:(uint64_t)a3 error:(os_log_t)log .cold.2(int a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218240;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = a3;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "#SMIMEErrors SecCmsDecoderUpdate returned %ld for %lu bytes", buf, 0x16u);
}

- (void)initWithPartData:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v0, v1, "#SMIMEErrors SecCmsDecoderCreate returned %ld", v2);
  OUTLINED_FUNCTION_5();
}

- (void)verifyAgainstSenders:signingError:.cold.1()
{
  void *v0;
  _DWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_2();
  *v1 = 138543362;
  *v3 = v2;
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v5, (uint64_t)v3, "#SMIMEErrors There was a signing error %{public}@", v4);

  OUTLINED_FUNCTION_1();
}

- (void)verifyAgainstSenders:(os_log_t)log signingError:.cold.2(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_1A4F90000, log, OS_LOG_TYPE_ERROR, "#SMIMEErrors SecTrustCreateWithCertificates returned a null SecTrustRef", buf, 2u);
}

- (void)verifyAgainstSenders:signingError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_7_2();
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v0, v1, "#SMIMEErrors _MFSecCMSDecoder asked to verify with pending error (%ld)", v2);
  OUTLINED_FUNCTION_5();
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

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, v0, v1, "#SMIMEErrors -appendData: called on _MFSecCMSDecoder after an error has occurred!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

@end
