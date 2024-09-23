@implementation MFMimePart(SMIMEEncoding)

- (id)newSignedPartWithData:()SMIMEEncoding sender:compositionSpecification:signatureData:
{
  id v10;
  id v11;
  int v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  MFError *v22;

  v22 = 0;
  v10 = -[_MFSecCMSEncoder initForSigningWithSender:compositionSpecification:error:]([_MFSecCMSEncoder alloc], "initForSigningWithSender:compositionSpecification:error:", a4, a5, &v22);
  v11 = 0;
  if (!v22)
  {
    objc_msgSend(a3, "mf_dataByConvertingUnixNewlinesToNetwork");
    if (MFDataConsumerConsumeCompleteData() < 0)
    {
      v12 = objc_msgSend(v10, "lastSecCMSError");
      if (v12)
      {
        v13 = v12;
        v14 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v15 = (void *)objc_msgSend(v14, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v13, 0);
        v16 = objc_alloc(MEMORY[0x1E0C99D80]);
        v17 = (void *)objc_msgSend(v16, "initWithObjectsAndKeys:", v15, *MEMORY[0x1E0CB3388], 0);

      }
      else
      {
        v17 = 0;
      }
      v22 = +[MFError errorWithDomain:code:userInfo:](MFError, "errorWithDomain:code:userInfo:", CFSTR("MFMessageErrorDomain"), 1036, v17);
      -[MFError setLocalizedDescription:](v22, "setLocalizedDescription:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("SMIME_CANT_SIGN_MESSAGE"), (uint64_t)CFSTR("An error occurred while trying to sign this message with a certificate from “%@”. Verify that your certificate for this address is correct, and that its private key is in your keychain."), CFSTR("Delayed")), a4));

    }
    if (v22)
    {
      v11 = 0;
    }
    else
    {
      v11 = objc_alloc_init((Class)objc_opt_class());
      objc_msgSend(v11, "setType:", CFSTR("multipart"));
      objc_msgSend(v11, "setSubtype:", CFSTR("signed"));
      objc_msgSend(v11, "setBodyParameter:forKey:", CFSTR("application/pkcs7-signature"), CFSTR("protocol"));
      objc_msgSend(v11, "setBodyParameter:forKey:", CFSTR("sha1"), CFSTR("micalg"));
      objc_msgSend(v11, "addSubpart:", a1);
      v18 = objc_alloc_init((Class)objc_opt_class());
      objc_msgSend(v18, "setType:", CFSTR("application"));
      objc_msgSend(v18, "setSubtype:", CFSTR("pkcs7-signature"));
      objc_msgSend(v18, "setDisposition:", CFSTR("attachment"));
      objc_msgSend(v18, "setDispositionParameter:forKey:", CFSTR("smime.p7s"), CFSTR("filename"));
      objc_msgSend(v18, "setBodyParameter:forKey:", CFSTR("smime.p7s"), CFSTR("name"));
      objc_msgSend(v11, "addSubpart:", v18);

      if (a6)
      {
        objc_msgSend(v10, "done");
        *a6 = (id)objc_msgSend(v10, "data");
      }
    }
  }

  if (v22)
  {
    if (!-[MFError mf_shortDescription](v22, "mf_shortDescription"))
      -[MFError setShortDescription:](v22, "setShortDescription:", MFLookupLocalizedString((uint64_t)CFSTR("SMIME_CANT_SIGN_TITLE"), (uint64_t)CFSTR("Unable to Sign"), CFSTR("Delayed")));
    objc_msgSend(a1, "_setSMIMEError:", v22);
    v19 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    objc_msgSend(v19, "setError:", v22);
    v20 = MFLogGeneral();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[MFMimePart(SMIMEEncoding) newSignedPartWithData:sender:compositionSpecification:signatureData:].cold.1((id *)&v22, v20);
  }
  return v11;
}

- (id)newEncryptedPartWithData:()SMIMEEncoding compositionSpecification:encryptedData:
{
  id v8;
  id v9;
  int v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  MFError *v19;

  v19 = 0;
  v8 = -[_MFSecCMSEncoder initForEncryptionWithCompositionSpecification:error:]([_MFSecCMSEncoder alloc], "initForEncryptionWithCompositionSpecification:error:", a4, &v19);
  v9 = 0;
  if (!v19)
  {
    objc_msgSend(a3, "mf_dataByConvertingUnixNewlinesToNetwork");
    if (MFDataConsumerConsumeCompleteData() < 0)
    {
      v10 = objc_msgSend(v8, "lastSecCMSError");
      if (v10)
      {
        v11 = v10;
        v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v13 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v11, 0);
        v14 = objc_alloc(MEMORY[0x1E0C99D80]);
        v15 = (void *)objc_msgSend(v14, "initWithObjectsAndKeys:", v13, *MEMORY[0x1E0CB3388], 0);

      }
      else
      {
        v15 = 0;
      }
      v19 = +[MFError errorWithDomain:code:userInfo:](MFError, "errorWithDomain:code:userInfo:", CFSTR("MFMessageErrorDomain"), 1035, v15);
      -[MFError setLocalizedDescription:](v19, "setLocalizedDescription:", MFLookupLocalizedString((uint64_t)CFSTR("SMIME_CANT_ENCRYPT_MESSAGE"), (uint64_t)CFSTR("An error occurred while trying to encrypt your message. Verify that you have valid certificates in your keychain for all of the recipients."), CFSTR("Delayed")));

    }
    if (v19)
    {
      v9 = 0;
    }
    else
    {
      v9 = objc_alloc_init((Class)objc_opt_class());
      objc_msgSend(v9, "setType:", CFSTR("application"));
      objc_msgSend(v9, "setSubtype:", CFSTR("pkcs7-mime"));
      objc_msgSend(v9, "setDisposition:", CFSTR("attachment"));
      objc_msgSend(v9, "setDispositionParameter:forKey:", CFSTR("smime.p7m"), CFSTR("filename"));
      objc_msgSend(v9, "setBodyParameter:forKey:", CFSTR("enveloped-data"), CFSTR("smime-type"));
      objc_msgSend(v9, "setBodyParameter:forKey:", CFSTR("smime.p7m"), CFSTR("name"));
      if (a5)
      {
        objc_msgSend(v8, "done");
        *a5 = (id)objc_msgSend(v8, "data");
      }
    }
  }

  if (v19)
  {
    if (!-[MFError mf_shortDescription](v19, "mf_shortDescription"))
      -[MFError setShortDescription:](v19, "setShortDescription:", MFLookupLocalizedString((uint64_t)CFSTR("SMIME_CANT_ENCRYPT_TITLE"), (uint64_t)CFSTR("Unable to Encrypt"), CFSTR("Delayed")));
    objc_msgSend(a1, "_setSMIMEError:", v19);
    v16 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    objc_msgSend(v16, "setError:", v19);
    v17 = MFLogGeneral();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[MFMimePart(SMIMEEncoding) newEncryptedPartWithData:compositionSpecification:encryptedData:].cold.1((id *)&v19, v17);
  }
  return v9;
}

- (void)newSignedPartWithData:()SMIMEEncoding sender:compositionSpecification:signatureData:.cold.1(id *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_6_1(a1);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_5(&dword_1C8839000, a2, v3, "#SMIMEErrors newSignedPart... failed with %{public}@", v4);
  OUTLINED_FUNCTION_2_1();
}

- (void)newEncryptedPartWithData:()SMIMEEncoding compositionSpecification:encryptedData:.cold.1(id *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_6_1(a1);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_5(&dword_1C8839000, a2, v3, "#SMIMEErrors newEncryptedPart... failed with %{public}@", v4);
  OUTLINED_FUNCTION_2_1();
}

@end
