@implementation MFMimePart(SMIMEEncoding)

- (id)newSignedPartWithData:()SMIMEEncoding sender:compositionSpecification:signatureData:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  id v25;
  uint8_t buf[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v25 = 0;
  objc_msgSend(a1, "_signatureDataForContentData:forSender:compositionSpecification:outError:", v10, v11, v12, &v25);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v25;
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "mf_shortDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16 == 0;

    if (v17)
    {
      MFLookupLocalizedString(CFSTR("SMIME_CANT_SIGN_TITLE"), CFSTR("Unable to Sign"), CFSTR("Delayed"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setShortDescription:", v18);

    }
    -[MFMimePart _setSMIMEError:](a1, v15);
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setError:", v15);

    objc_msgSend(MEMORY[0x1E0D460F0], "log");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v15, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MFMimePart(SMIMEEncoding) newSignedPartWithData:sender:compositionSpecification:signatureData:].cold.1();
    }

    v21 = 0;
  }
  else
  {
    v21 = objc_alloc_init((Class)objc_opt_class());
    if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 28)
      && objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 30))
    {
      objc_msgSend(v21, "setType:", CFSTR("application"));
      objc_msgSend(v21, "setSubtype:", CFSTR("pkcs7-mime"));
      objc_msgSend(v21, "setDisposition:", CFSTR("attachment"));
      objc_msgSend(v21, "setDispositionParameter:forKey:", CFSTR("smime.p7m"), CFSTR("filename"));
      objc_msgSend(v21, "setBodyParameter:forKey:", CFSTR("signed-data"), CFSTR("smime-type"));
      objc_msgSend(v21, "setBodyParameter:forKey:", CFSTR("smime.p7m"), CFSTR("name"));
      objc_msgSend(MEMORY[0x1E0D460F0], "log");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4F90000, v22, OS_LOG_TYPE_DEFAULT, "[S/MIME] Signing as application/pkcs7-mime.", buf, 2u);
      }
    }
    else
    {
      objc_msgSend(v21, "setType:", CFSTR("multipart"));
      objc_msgSend(v21, "setSubtype:", CFSTR("signed"));
      objc_msgSend(v21, "setBodyParameter:forKey:", CFSTR("application/pkcs7-signature"), CFSTR("protocol"));
      objc_msgSend(v21, "setBodyParameter:forKey:", CFSTR("sha-256"), CFSTR("micalg"));
      objc_msgSend(v21, "addSubpart:", a1);
      v22 = objc_alloc_init((Class)objc_opt_class());
      -[NSObject setType:](v22, "setType:", CFSTR("application"));
      -[NSObject setSubtype:](v22, "setSubtype:", CFSTR("pkcs7-signature"));
      -[NSObject setDisposition:](v22, "setDisposition:", CFSTR("attachment"));
      -[NSObject setDispositionParameter:forKey:](v22, "setDispositionParameter:forKey:", CFSTR("smime.p7s"), CFSTR("filename"));
      -[NSObject setBodyParameter:forKey:](v22, "setBodyParameter:forKey:", CFSTR("smime.p7s"), CFSTR("name"));
      objc_msgSend(v21, "addSubpart:", v22);
      objc_msgSend(MEMORY[0x1E0D460F0], "log");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4F90000, v23, OS_LOG_TYPE_DEFAULT, "[S/MIME] Signing as multipart/signed.", buf, 2u);
      }

    }
    if (a6)
      *a6 = objc_retainAutorelease(v13);
  }

  return v21;
}

- (id)_signatureDataForContentData:()SMIMEEncoding forSender:compositionSpecification:outError:
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 28))
    objc_msgSend(a1, "_signatureDataUsingMessageSecurity:forSender:compositionSpecification:outError:", v10, v11, v12, a6);
  else
    objc_msgSend(a1, "_signatureDataUsingSecCMSWithData:forSender:compositionSpecification:outError:", v10, v11, v12, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_signatureDataUsingMessageSecurity:()SMIMEEncoding forSender:compositionSpecification:outError:
{
  id v9;
  id v10;
  void *v11;
  __SecIdentity *v12;
  __SecIdentity *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  __int16 v21;
  SecCertificateRef certificateRef;

  v9 = a4;
  v10 = a5;
  objc_msgSend(a3, "mf_dataByConvertingUnixNewlinesToNetwork");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (__SecIdentity *)objc_msgSend(v10, "objectForKey:", CFSTR("SigningIdentity"));
  if (v12)
  {
    v13 = (__SecIdentity *)objc_msgSend(v10, "objectForKey:", CFSTR("EncryptionIdentity"));
    certificateRef = 0;
    if (v13)
    {
      SecIdentityCopyCertificate(v13, &certificateRef);
    }
    else
    {
      SecIdentityCopyCertificate(v12, &certificateRef);
      if ((SecCertificateGetKeyUsage() & 0x14) == 0)
      {
        objc_msgSend(MEMORY[0x1E0D460F0], "log");
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[MFMimePart(SMIMEEncoding) _signatureDataUsingMessageSecurity:forSender:compositionSpecification:outError:].cold.1();

        CFRelease(certificateRef);
        certificateRef = 0;
      }
    }
    v21 = 0;
    objc_msgSend(MEMORY[0x1E0D1E300], "encryptionLevelForSender:forAdvertisement:useGCM:encryptSubject:", v9, 1, (char *)&v21 + 1, &v21);
    objc_msgSend(MEMORY[0x1E0D1E6A0], "oidsForEncryptWithGCM:encryptSubject:", HIBYTE(v21), v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 30))
      objc_msgSend(MEMORY[0x1E0D1E6A0], "signedDataFromNetworkContentData:forSender:identity:encryptionCertificate:capabilities:outError:", v11, v9, v12, certificateRef, v19, a6);
    else
      objc_msgSend(MEMORY[0x1E0D1E6A0], "signatureDataFromNetworkContentData:forSender:identity:encryptionCertificate:capabilities:outError:", v11, v9, v12, certificateRef, v19, a6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (certificateRef)
      CFRelease(certificateRef);

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    MFLookupLocalizedString(CFSTR("SMIME_CANT_SIGN_MESSAGE"), CFSTR("An error occurred while trying to sign this message with a certificate from “%@”. Verify that your certificate for this address is correct, and that its private key is in your keychain."), CFSTR("Delayed"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v15, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, v16);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    v17 = 0;
  }

  return v17;
}

- (id)_signatureDataUsingSecCMSWithData:()SMIMEEncoding forSender:compositionSpecification:outError:
{
  id v9;
  id v10;
  id v11;
  int *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (int *)-[_MFSecCMSEncoder initForSigningWithSender:compositionSpecification:error:]([_MFSecCMSEncoder alloc], v10, v11, a6);
  if (!*a6)
  {
    objc_msgSend(v9, "mf_dataByConvertingUnixNewlinesToNetwork");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MFDataConsumerConsumeCompleteData();

    if (v14 < 0)
    {
      if (v12 && (v15 = v12[10], (_DWORD)v15))
      {
        v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v17 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v15, 0);
        v18 = objc_alloc(MEMORY[0x1E0C99D80]);
        v19 = (void *)objc_msgSend(v18, "initWithObjectsAndKeys:", v17, *MEMORY[0x1E0CB3388], 0);

      }
      else
      {
        v19 = 0;
      }
      +[MFError errorWithDomain:code:userInfo:](MFError, "errorWithDomain:code:userInfo:", CFSTR("MFMessageErrorDomain"), 1036, v19);
      v20 = (id)objc_claimAutoreleasedReturnValue();
      *a6 = v20;
      v21 = (void *)MEMORY[0x1E0CB3940];
      MFLookupLocalizedString(CFSTR("SMIME_CANT_SIGN_MESSAGE"), CFSTR("An error occurred while trying to sign this message with a certificate from “%@”. Verify that your certificate for this address is correct, and that its private key is in your keychain."), CFSTR("Delayed"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringWithFormat:", v22, v10);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setLocalizedDescription:", v23);

    }
  }
  objc_msgSend(v12, "done");
  objc_msgSend(v12, "data");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)newEncryptedPartWithData:()SMIMEEncoding compositionSpecification:encryptedData:
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v16 = 0;
  v17 = 0;
  objc_msgSend(a1, "_encryptedDataForContentData:compositionSpecification:contentType:error:", v8, v9, &v17, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;
  v12 = v16;
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0D460F0], "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MFMimePart(SMIMEEncoding) newEncryptedPartWithData:compositionSpecification:encryptedData:].cold.1();
    }
    v14 = 0;
  }
  else
  {
    v14 = objc_alloc_init((Class)objc_opt_class());
    objc_msgSend(v14, "setType:", CFSTR("application"));
    objc_msgSend(v14, "setSubtype:", CFSTR("pkcs7-mime"));
    objc_msgSend(v14, "setDisposition:", CFSTR("attachment"));
    objc_msgSend(v14, "setDispositionParameter:forKey:", CFSTR("smime.p7m"), CFSTR("filename"));
    objc_msgSend(v14, "setBodyParameter:forKey:", v11, CFSTR("smime-type"));
    objc_msgSend(v14, "setBodyParameter:forKey:", CFSTR("smime.p7m"), CFSTR("name"));
    if (a5)
      *a5 = objc_retainAutorelease(v10);
    objc_msgSend(MEMORY[0x1E0D460F0], "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = v11;
      _os_log_impl(&dword_1A4F90000, v13, OS_LOG_TYPE_DEFAULT, "[S/MIME] Encrypted as multipart/pkcs7-mime (smime-type=%{public}@).", buf, 0xCu);
    }
  }

  return v14;
}

- (id)_encryptedDataForContentData:()SMIMEEncoding compositionSpecification:contentType:error:
{
  id v10;
  id v11;
  void *v12;

  v10 = a3;
  v11 = a4;
  if (objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 28))
  {
    objc_msgSend(a1, "_encryptedDataUsingMessageSecurity:compositionSpecification:contentType:error:", v10, v11, a5, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_encryptedDataUsingSecCMS:compositionSpecification:error:", v10, v11, a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5)
      *a5 = CFSTR("enveloped-data");
  }

  return v12;
}

- (id)_encryptedDataUsingSecCMS:()SMIMEEncoding compositionSpecification:error:
{
  id v8;
  id v9;
  NSObject *v10;
  int *v11;
  id v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30[5];

  v30[4] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  MFLogGeneral();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[MFMimePart(SMIMEEncoding) _encryptedDataUsingSecCMS:compositionSpecification:error:].cold.2();

  v30[0] = 0;
  v11 = (int *)-[_MFSecCMSEncoder initForEncryptionWithCompositionSpecification:error:]([_MFSecCMSEncoder alloc], v9, v30);
  v12 = v30[0];
  if (v12)
    goto LABEL_4;
  objc_msgSend(v8, "mf_dataByConvertingUnixNewlinesToNetwork");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MFDataConsumerConsumeCompleteData();

  if (v22 >= 0)
    goto LABEL_12;
  if (v11 && (v24 = v11[10], (_DWORD)v24))
  {
    v25 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v26 = (void *)objc_msgSend(v25, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v24, 0);
    v27 = objc_alloc(MEMORY[0x1E0C99D80]);
    v28 = (void *)objc_msgSend(v27, "initWithObjectsAndKeys:", v26, *MEMORY[0x1E0CB3388], 0);

  }
  else
  {
    v28 = 0;
  }
  +[MFError errorWithDomain:code:userInfo:](MFError, "errorWithDomain:code:userInfo:", CFSTR("MFMessageErrorDomain"), 1035, v28);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  MFLookupLocalizedString(CFSTR("SMIME_CANT_ENCRYPT_MESSAGE"), CFSTR("An error occurred while trying to encrypt your message. Verify that you have valid certificates in your keychain for all of the recipients."), CFSTR("Delayed"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLocalizedDescription:", v29);

  if (v12)
  {
LABEL_4:
    objc_msgSend(v12, "mf_shortDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

    if (v14)
    {
      MFLookupLocalizedString(CFSTR("SMIME_CANT_ENCRYPT_TITLE"), CFSTR("Unable to Encrypt"), CFSTR("Delayed"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setShortDescription:", v15);

    }
    -[MFMimePart _setSMIMEError:](a1, v12);
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setError:", v12);

    MFLogGeneral();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MFMimePart(SMIMEEncoding) _encryptedDataUsingSecCMS:compositionSpecification:error:].cold.1();
    }

    v18 = 0;
    v19 = v12;
    if (a5)
    {
LABEL_13:
      *a5 = objc_retainAutorelease(v19);
      if (!v18)
        goto LABEL_14;
      goto LABEL_10;
    }
  }
  else
  {
LABEL_12:
    v19 = 0;
    v18 = 1;
    if (a5)
      goto LABEL_13;
  }
  if (!v18)
  {
LABEL_14:
    v20 = 0;
    goto LABEL_15;
  }
LABEL_10:
  objc_msgSend(v11, "done");
  objc_msgSend(v11, "data");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

  return v20;
}

- (id)_encryptedDataUsingMessageSecurity:()SMIMEEncoding compositionSpecification:contentType:error:
{
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  __SecIdentity *v14;
  int v15;
  char v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  __CFString *v26;
  void *v27;
  char v29;
  unsigned __int8 v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  char v35;
  uint8_t buf[8];
  SecCertificateRef certificateRef;

  v9 = a3;
  v10 = a4;
  MFLogGeneral();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[MFMimePart(SMIMEEncoding) _encryptedDataUsingMessageSecurity:compositionSpecification:contentType:error:].cold.1();

  certificateRef = 0;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v10, "objectForKey:", CFSTR("AddressMetadata"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (__SecIdentity *)objc_msgSend(v10, "objectForKey:", CFSTR("EncryptionIdentity"));
  if (v14 || (v14 = (__SecIdentity *)objc_msgSend(v10, "objectForKey:", CFSTR("SigningIdentity"))) != 0)
  {
    SecIdentityCopyCertificate(v14, &certificateRef);
    if (certificateRef)
    {
      v15 = objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 34);
      v16 = v15;
      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0D1E6A0], "oidStringsForAuthenticatedEncryption");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v18 = 0;
      }
      objc_msgSend(v10, "objectForKey:", CFSTR("RecipientCertificates"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __107__MFMimePart_SMIMEEncoding___encryptedDataUsingMessageSecurity_compositionSpecification_contentType_error___block_invoke;
      v31[3] = &unk_1E4E8EDE8;
      v35 = v16;
      v32 = v13;
      v33 = v18;
      v22 = v12;
      v34 = v22;
      v23 = v18;
      objc_msgSend(v21, "enumerateKeysAndObjectsUsingBlock:", v31);

      buf[0] = 0;
      v30 = 0;
      objc_msgSend(MEMORY[0x1E0D1E300], "encryptionLevelForSender:forAdvertisement:useGCM:encryptSubject:", 0, 0, buf, &v30);
      objc_msgSend(MEMORY[0x1E0D1E6A0], "oidsForEncryptWithGCM:encryptSubject:", buf[0], v30);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      objc_msgSend(MEMORY[0x1E0D1E6A0], "encryptedDataFromContentData:senderCertificate:senderCapabilities:recipients:outIsAuthenticated:outError:", v9, certificateRef, v24, v22, &v29, a6);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(certificateRef);
      if (a5)
      {
        if (v29)
          v26 = CFSTR("authEnveloped-data");
        else
          v26 = CFSTR("enveloped-data");
        *a5 = objc_retainAutorelease(v26);
      }

      goto LABEL_23;
    }
    MFLogGeneral();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v20 = "#SMIMEErrors Failed to obtain sender certificate for encryption";
LABEL_19:
      _os_log_impl(&dword_1A4F90000, v19, OS_LOG_TYPE_INFO, v20, buf, 2u);
    }
  }
  else
  {
    MFLogGeneral();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v20 = "#SMIMEErrors sender SecIdentityRef for encryption is nil";
      goto LABEL_19;
    }
  }

  if (a6)
  {
    MFLookupLocalizedString(CFSTR("SMIME_CANT_ENCRYPT_MESSAGE"), CFSTR("An error occurred while trying to encrypt your message. Verify that you have valid certificates in your keychain for all of the recipients."), CFSTR("Delayed"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1035, v27);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  v25 = 0;
LABEL_23:

  return v25;
}

- (void)newSignedPartWithData:()SMIMEEncoding sender:compositionSpecification:signatureData:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v3, (uint64_t)v3, "[S/MIME] Signing failed with error: %{public}@", v4);

  OUTLINED_FUNCTION_1();
}

- (void)_signatureDataUsingMessageSecurity:()SMIMEEncoding forSender:compositionSpecification:outError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, v0, v1, "[S/MIME] No encryption certificate found when signing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)newEncryptedPartWithData:()SMIMEEncoding compositionSpecification:encryptedData:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v3, (uint64_t)v3, "[S/MIME] Encryption failed with error: %{public}@", v4);

  OUTLINED_FUNCTION_1();
}

- (void)_encryptedDataUsingSecCMS:()SMIMEEncoding compositionSpecification:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v3, (uint64_t)v3, "#SMIMEErrors newEncryptedPart... failed with %{public}@", v4);

  OUTLINED_FUNCTION_1();
}

- (void)_encryptedDataUsingSecCMS:()SMIMEEncoding compositionSpecification:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7(&dword_1A4F90000, v0, v1, "#SMIMEErrors encrypting data using SecCMS", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_encryptedDataUsingMessageSecurity:()SMIMEEncoding compositionSpecification:contentType:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7(&dword_1A4F90000, v0, v1, "#SMIMEErrors encrypting data using message security", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

@end
