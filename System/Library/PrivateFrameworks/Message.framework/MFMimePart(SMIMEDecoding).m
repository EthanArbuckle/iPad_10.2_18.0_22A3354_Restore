@implementation MFMimePart(SMIMEDecoding)

- (id)decodeMultipartSigned
{
  char v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 28);
  objc_msgSend(MEMORY[0x1E0D460F0], "log");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if ((v2 & 1) != 0)
  {
    if (v4)
    {
      *(_DWORD *)buf = 138412290;
      v20 = a1;
      _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_DEFAULT, "[S/MIME] Decoding multipart/signed with MessageSecurity: %@", buf, 0xCu);
    }

    objc_msgSend(a1, "firstChildPart");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentsForTextSystem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __50__MFMimePart_SMIMEDecoding__decodeMultipartSigned__block_invoke;
      v18[3] = &unk_1E4E8ED98;
      v18[4] = a1;
      objc_msgSend(a1, "_decodeWithBlock:", v18);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v7;
      if (v7)
        v9 = (void *)v7;
      else
        v9 = v6;
      v10 = v9;

    }
    else
    {
      MFLookupLocalizedString(CFSTR("SMIME_UNREADABLE_SIG"), CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      MFLookupLocalizedString(CFSTR("SMIME_SIG_TITLE"), CFSTR("Unable to verify message signature"), CFSTR("Delayed"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setShortDescription:", v14);

      +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setError:", v13);

      objc_msgSend(MEMORY[0x1E0D460F0], "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v13, "ef_publicDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v20 = v17;
        _os_log_impl(&dword_1A4F90000, v16, OS_LOG_TYPE_DEFAULT, "[S/MIME] Failed to decode first child part for multipart/signed with error: %{public}@", buf, 0xCu);

      }
      v10 = 0;
    }

    return v10;
  }
  else
  {
    if (v4)
    {
      *(_DWORD *)buf = 138412290;
      v20 = a1;
      _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_DEFAULT, "[S/MIME] Decoding multipart/signed with SecCMS: %@", buf, 0xCu);
    }

    objc_msgSend(a1, "_decodeMultipartSignedWithSecCMS");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)decodeApplicationPkcs7_mime
{
  char v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  _QWORD v7[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0D1E1A8], "preferenceEnabled:", 28);
  objc_msgSend(MEMORY[0x1E0D460F0], "log");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if ((v2 & 1) != 0)
  {
    if (v4)
    {
      *(_DWORD *)buf = 138412290;
      v9 = a1;
      _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_DEFAULT, "[S/MIME] Decoding application/pkcs7-mime with MessageSecurity: %@", buf, 0xCu);
    }

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __56__MFMimePart_SMIMEDecoding__decodeApplicationPkcs7_mime__block_invoke;
    v7[3] = &unk_1E4E8ED98;
    v7[4] = a1;
    objc_msgSend(a1, "_decodeWithBlock:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4)
    {
      *(_DWORD *)buf = 138412290;
      v9 = a1;
      _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_DEFAULT, "[S/MIME] Decoding application/pkcs7-mime with SecCMS: %@", buf, 0xCu);
    }

    objc_msgSend(a1, "_decodeApplicationPkcs7MimeWithSecCMS");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_decodeWithBlock:()SMIMEDecoding
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void (**v40)(id, unsigned __int8 *, unsigned __int8 *, id, id *);
  id v41;
  id v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v40 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "SMIMEError");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decryptedMessageBodyIsEncrypted:isSigned:", 0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v44 = 1;
  v43 = 1;
  if (!(v5 | v6))
  {
    v42 = 0;
    v40[2](v40, &v44, &v43, v4, &v42);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (uint64_t)v42;
    if (v7)
    {
      v41 = 0;
      objc_msgSend(a1, "_messageBodyFromData:outUnwrappedMessage:", v7, &v41);
      v6 = objc_claimAutoreleasedReturnValue();
      v8 = v41;
      v9 = v8;
      if (v8)
      {
        objc_msgSend(v8, "subject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_setWrappedSubject:", v10);

      }
      if (v6)
      {
        v11 = v5;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D460F0], "log");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          -[MFMimePart(SMIMEDecoding) _decodeWithBlock:].cold.2();

        if (v44 || !v43)
        {
          MFLookupLocalizedString(CFSTR("SMIME_CANT_DECRYPT_MESSAGE"), CFSTR("This message is encrypted.  Install a profile containing your encryption identity to decrypt this message."), CFSTR("Delayed"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1035, v13);
          v14 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          MFLookupLocalizedString(CFSTR("SMIME_UNREADABLE_SIG"), CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, v13);
          v14 = objc_claimAutoreleasedReturnValue();
        }
        v11 = v14;

      }
      v5 = v11;
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(a1, "_setDecryptedMessageBody:isEncrypted:isSigned:", v6, v44, v43);

  }
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SecureMimePart.m"), 337, CFSTR("The message body should be a MFMimeBody."));

    }
    objc_msgSend((id)v6, "topLevelPart");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentsForTextSystem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "copySigners");
    objc_msgSend(v4, "addObjectsFromArray:", v17);

    if (!v5)
    {
      objc_msgSend(v15, "SMIMEError");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v15, "wrappedSubject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(a1, "wrappedSubject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19 == 0;

      if (v20)
      {
        objc_msgSend(v15, "wrappedSubject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_setWrappedSubject:", v21);

      }
    }
    objc_msgSend(v15, "signatureInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(a1, "signatureInfo");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23 == 0;

      if (v24)
      {
        objc_msgSend(v15, "signatureInfo");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFMimePart _setSignatureInfo:](a1, v25);

      }
    }

  }
  else
  {
    v16 = 0;
  }
  if (objc_msgSend(v4, "count"))
  {
    -[MFMimePart _setSigners:](a1, v4);
    objc_msgSend(a1, "mimeBody");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setSigners:", v4);

  }
  v27 = v44;
  objc_msgSend(a1, "mimeBody");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setIsEncrypted:", v27 != 0);

  if (v5)
  {
    objc_msgSend((id)v5, "mf_shortDescription");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29 == 0;

    if (v30)
    {
      if (objc_msgSend((id)v5, "code") == 1036)
        MFLookupLocalizedString(CFSTR("SMIME_SIG_TITLE"), CFSTR("Unable to verify message signature"), CFSTR("Delayed"));
      else
        MFLookupLocalizedString(CFSTR("SMIME_CANT_DECRYPT_TITLE"), CFSTR("Unable to decrypt message"), CFSTR("Delayed"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v5, "setShortDescription:", v31);

    }
    -[MFMimePart _setSMIMEError:](a1, (void *)v5);
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setError:", v5);

    objc_msgSend(MEMORY[0x1E0D460F0], "log");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v5, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MFMimePart(SMIMEDecoding) _decodeWithBlock:].cold.1();
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "threadDictionary");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setObject:forKey:", v36, *MEMORY[0x1E0D45F80]);

  return v16;
}

- (id)_decodeEncodedData:()SMIMEDecoding detachedContentData:isEncrypted:isSigned:signers:error:
{
  id v14;
  void *v15;
  id v16;
  int v17;
  int v18;
  char v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v28 = a4;
  v29 = a7;
  v32 = 0;
  v27 = v14;
  objc_msgSend(MEMORY[0x1E0D1E698], "decoderForEncodedData:detachedContentData:outError:", v14, v28, &v32);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v32;
  if (!v15)
  {
    v20 = 0;
    v21 = 0;
    if (!a8)
      goto LABEL_22;
LABEL_16:
    if (v16)
    {
      MFLookupLocalizedString(CFSTR("SMIME_UNREADABLE_SIG"), CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = *MEMORY[0x1E0CB3388];
      v34[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1036, v23, 0, v24);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      v21 = 0;
    }
    else
    {
      v21 = 0;
      *a8 = 0;
    }
    goto LABEL_22;
  }
  v17 = objc_msgSend(v15, "isEncrypted");
  v18 = objc_msgSend(v15, "isSigned");
  v19 = v18;
  if (v17)
  {
    objc_msgSend(v15, "decryptedContentData");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (!v18)
  {
    v20 = 0;
LABEL_19:
    v21 = 0;
    if (!a5)
      goto LABEL_11;
LABEL_10:
    *a5 = v17;
    goto LABEL_11;
  }
  v30 = 0;
  v31 = 0;
  objc_msgSend(a1, "_verifySignatureWithDecoder:signedData:error:", v15, &v31, &v30);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v31;
  v21 = v30;
  if (v22)
    objc_msgSend(v29, "addObjectsFromArray:", v22);

  if (a5)
    goto LABEL_10;
LABEL_11:
  if (a6)
    *a6 = v19;
  if (a8)
  {
    if (v21)
    {
      v21 = objc_retainAutorelease(v21);
      *a8 = v21;
      goto LABEL_22;
    }
    goto LABEL_16;
  }
LABEL_22:
  v25 = v20;

  return v25;
}

- (id)_verifySignatureWithDecoder:()SMIMEDecoding signedData:error:
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  id v25;
  id v26;
  uint64_t *v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v28 = 0;
  objc_msgSend(a3, "extractSignatureInfoAndSignedData:outError:", a4, &v28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v28;
  if (v7)
  {
    objc_msgSend(a1, "mimeBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "message");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstSender");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v11;
    objc_msgSend(v12, "emailAddressValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "simpleAddress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(v12, "stringValue");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v16;

    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__20;
    v33 = __Block_byref_object_dispose__20;
    v34 = 0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __74__MFMimePart_SMIMEDecoding___verifySignatureWithDecoder_signedData_error___block_invoke;
    v24[3] = &unk_1E4E8EDC0;
    v27 = &v29;
    v24[4] = a1;
    v20 = v19;
    v25 = v20;
    v18 = v12;
    v26 = v18;
    objc_msgSend(v7, "ef_compactMap:", v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMimePart _setSignatureInfo:](a1, v22);

    }
    if (a5)
      *a5 = objc_retainAutorelease((id)v30[5]);

    _Block_object_dispose(&v29, 8);
    goto LABEL_18;
  }
  MFLogGeneral();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v8, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    -[MFMimePart(SMIMEDecoding) _verifySignatureWithDecoder:signedData:error:].cold.1();
  }

  if (a5)
  {
    if (v8)
    {
      v35 = *MEMORY[0x1E0CB3388];
      v36[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    MFLookupLocalizedString(CFSTR("SMIME_SIG_TITLE"), CFSTR("Unable to verify message signature"), CFSTR("Delayed"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1036, v20, 0, v18);
    v21 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

    goto LABEL_19;
  }
  v21 = 0;
LABEL_19:

  return v21;
}

- (SecTrustRef)_signingTrustForAddress:()SMIMEDecoding signatureInfo:encryptionTrust:error:
{
  id v10;
  id v11;
  const void *v12;
  __SecPolicy *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SecTrustRef v19;
  __SecTrust *v21;
  void *v22;
  void *v23;
  OSStatus v24;
  const void *v25;
  __SecPolicy *v26;
  uint64_t v27;
  SecTrustRef v28;
  SecTrustRef trust;

  v10 = a3;
  v11 = a4;
  v12 = (const void *)objc_msgSend(v11, "signingCertificate");
  if (!v12)
  {
    MFLookupLocalizedString(CFSTR("SMIME_SIG_TITLE"), CFSTR("Unable to verify message signature"), CFSTR("Delayed"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  trust = 0;
  v13 = +[MFMessageKeychainManager copySMIMESigningPolicyForAddress:](MFMessageKeychainManager, "copySMIMESigningPolicyForAddress:", v10);
  v14 = SecTrustCreateWithCertificates(v12, v13, &trust);
  if (v13)
    CFRelease(v13);
  if (!(_DWORD)v14)
  {
    v21 = trust;
    if (trust)
    {
      objc_msgSend(a1, "mimeBody");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "message");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = SecTrustSetVerifyDate(v21, (CFDateRef)objc_msgSend(v23, "dateReceived"));

      if (!v24)
      {
        v25 = (const void *)objc_msgSend(v11, "preferredEncryptionCertificate");
        if (v25)
        {
          v26 = +[MFMessageKeychainManager copySMIMEEncryptionPolicyForAddress:](MFMessageKeychainManager, "copySMIMEEncryptionPolicyForAddress:", v10);
          v28 = 0;
          v27 = SecTrustCreateWithCertificates(v25, v26, &v28);
          if (v26)
            CFRelease(v26);
          if ((_DWORD)v27)
          {
            MFLookupLocalizedString(CFSTR("SMIME_SIG_TITLE"), CFSTR("Unable to verify message signature"), CFSTR("Delayed"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_signingErrorWithStatus:localizedDescription:", v27, v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_6;
          }
          if (a5)
            *a5 = v28;
        }
        v19 = trust;
        goto LABEL_10;
      }
    }
    MFLookupLocalizedString(CFSTR("SMIME_SIG_TITLE"), CFSTR("Unable to verify message signature"), CFSTR("Delayed"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    *a6 = v18;

    goto LABEL_9;
  }
  MFLookupLocalizedString(CFSTR("SMIME_SIG_TITLE"), CFSTR("Unable to verify message signature"), CFSTR("Delayed"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_signingErrorWithStatus:localizedDescription:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  *a6 = v16;

LABEL_9:
  v19 = 0;
LABEL_10:

  return v19;
}

- (id)_signingErrorWithStatus:()SMIMEDecoding localizedDescription:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v7 = (void *)objc_msgSend(v6, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], a3, 0);
  v11 = *MEMORY[0x1E0CB3388];
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1036, v5, 0, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_messageBodyFromData:()SMIMEDecoding outUnwrappedMessage:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "mimeBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "message");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MFMessage messageWithRFC822Data:withParentPart:](MFMailMessage, "messageWithRFC822Data:withParentPart:", v6, a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMessagePropertiesFromMessage:", v8);
  objc_msgSend(a1, "_associateAttachmentsFrom:to:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bodyDataForMessage:isComplete:isPartial:downloadIfNecessary:", v9, 0, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && _os_feature_enabled_impl())
  {
    objc_msgSend(v10, "topLevelPart");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "type");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqualToString:", CFSTR("message")) & 1) != 0)
    {
      objc_msgSend(v21, "subtype");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("rfc822"));

      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0D460F0], "log");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v23 = a1;
          _os_log_impl(&dword_1A4F90000, v16, OS_LOG_TYPE_DEFAULT, "[S/MIME] Unwrapping message: %@", buf, 0xCu);
        }

        +[MFMessage messageWithRFC822Data:](MFMailMessage, "messageWithRFC822Data:", v12);
        v17 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1, "_associateAttachmentsFrom:to:", v8, v17);
        v18 = objc_claimAutoreleasedReturnValue();

        v15 = 1;
        v9 = (void *)v17;
        v10 = (void *)v18;
      }
    }
    else
    {

      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }
  if (a4)
  {
    if (v15)
      v19 = v9;
    else
      v19 = 0;
    *a4 = objc_retainAutorelease(v19);
  }

  return v10;
}

- (id)_associateAttachmentsFrom:()SMIMEDecoding to:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  MFDecryptedAttachmentDataProvider *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isLibraryMessage"))
  {
    v7 = (void *)MEMORY[0x1E0C99E98];
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "messageID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@://%@"), CFSTR("x-attach-SMIME"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLWithString:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "messageURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "setMessageURL:", v11);
  objc_msgSend(v6, "messageBody");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "topLevelPart");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "attachmentURLs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URLByDeletingLastPathComponent");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = -[MFDecryptedAttachmentDataProvider initWithDecryptedMessage:]([MFDecryptedAttachmentDataProvider alloc], "initWithDecryptedMessage:", v6);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    +[MFAttachmentManager allManagers](MFAttachmentManager, "allManagers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v24;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v18);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v21++), "addProvider:forBaseURL:", v17, v16);
        }
        while (v19 != v21);
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v19);
    }

  }
  return v12;
}

- (id)_decodeMultipartSignedWithSecCMS
{
  void *v2;
  _BOOL4 v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t i;
  int v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  void *v30;
  char *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v38;
  void *v39;
  _QWORD *InnerContent;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  uint8_t buf[24];
  uint64_t v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "firstChildPart");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentsForTextSystem");
  v56 = (id)objc_claimAutoreleasedReturnValue();
  if (!v56)
  {
    MFLookupLocalizedString(CFSTR("SMIME_UNREADABLE_SIG"), CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, v21);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "mf_shortDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      MFLookupLocalizedString(CFSTR("SMIME_SIG_TITLE"), CFSTR("Unable to verify message signature"), CFSTR("Delayed"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setShortDescription:", v23);

      if (!v4)
        goto LABEL_40;
      goto LABEL_37;
    }
LABEL_15:
    if (!v4)
      goto LABEL_40;
    goto LABEL_37;
  }
  v59 = 0;
  v3 = -[MFMimePart _needsSignatureVerification:](a1, &v59);
  v4 = v59;
  if (!v3 || !objc_msgSend(a1, "usesKnownSignatureProtocol"))
    goto LABEL_15;
  objc_msgSend(a1, "mimeBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataForMimePart:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "length"))
  {
    objc_msgSend(a1, "signedData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7;
    goto LABEL_26;
  }
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(a1, "bodyParameterForKey:", CFSTR("boundary"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("--%@"), v9);

  objc_msgSend(v10, "mf_dataUsingEncoding:", 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "mf_rangeOfData:options:range:", v11, 0, 0, objc_msgSend(v7, "length"));
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v14 = v12;
    if (v12)
    {
      v15 = objc_msgSend(v7, "length");
      v16 = objc_retainAutorelease(v7);
      v17 = objc_msgSend(v16, "bytes");
      for (i = v13 + v14; ; ++i)
      {
        v19 = *(unsigned __int8 *)(v17 + i);
        if (v19 != 13 && v19 != 10)
          break;
      }
      v25 = v15 - i;
      objc_msgSend(v16, "mf_subdataWithRange:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = objc_msgSend(v7, "mf_rangeOfData:options:range:", v11, 0, 0, v25);
      if (!v26)
      {
        v27 = 0;
        goto LABEL_24;
      }
      if (v26 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v7, "mf_subdataWithRange:", 0, v26 - 1);
        v27 = objc_claimAutoreleasedReturnValue();
LABEL_24:

        v7 = (void *)v27;
      }
    }
  }

  v24 = v7;
LABEL_26:

  if (v24)
  {
    v28 = v4;
  }
  else
  {
    MFLogGeneral();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v29, OS_LOG_TYPE_INFO, "#SMIMEErrors Missing signed data!", buf, 2u);
    }

    MFLookupLocalizedString(CFSTR("SMIME_UNREADABLE_SIG"), CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, v30);
    v28 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v28)
  {
    v31 = 0;
LABEL_33:

    v4 = v28;
LABEL_34:
    objc_msgSend(v4, "mf_shortDescription");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32 == 0;

    if (v33)
    {
      MFLookupLocalizedString(CFSTR("SMIME_SIG_TITLE"), CFSTR("Unable to verify message signature"), CFSTR("Delayed"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setShortDescription:", v34);

    }
    -[MFMimePart _setSMIMEError:](a1, v4);
LABEL_37:
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setError:", v4);

    MFLogGeneral();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MFMimePart(SMIMEDecoding) _decodeMultipartSignedWithSecCMS].cold.1();
    }

    goto LABEL_40;
  }
  objc_msgSend(v2, "nextSiblingPart");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "bodyData");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v39)
  {
    MFLogGeneral();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v42, OS_LOG_TYPE_INFO, "#SMIMEErrors Missing signature part!", buf, 2u);
    }

    MFLookupLocalizedString(CFSTR("SMIME_UNREADABLE_SIG"), CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, v43);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    v31 = 0;
LABEL_51:
    if (v28)
      goto LABEL_33;
    goto LABEL_52;
  }
  v58 = 0;
  v31 = -[_MFSecCMSDecoder initWithPartData:error:]((char *)[_MFSecCMSDecoder alloc], v39, &v58);
  v28 = v58;

  if (v28)
    goto LABEL_33;
  if (v31)
  {
    if (*((_QWORD *)v31 + 2))
    {
      InnerContent = (_QWORD *)SecCmsContentInfoGetInnerContent();
      if (InnerContent)
      {
        if (*InnerContent)
        {
          +[MFError errorWithDomain:code:userInfo:](MFError, "errorWithDomain:code:userInfo:", CFSTR("MFMessageErrorDomain"), 1036, 0);
          v28 = (id)objc_claimAutoreleasedReturnValue();
          MFLookupLocalizedString(CFSTR("SMIME_SIG_TITLE"), CFSTR("Unable to verify message signature"), CFSTR("Delayed"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setLocalizedDescription:", v41);

          goto LABEL_51;
        }
      }
    }
  }
LABEL_52:
  objc_msgSend(v24, "mf_dataByConvertingUnixNewlinesToNetwork");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = MFDataConsumerConsumeCompleteData();

  if (v45 < 0)
  {
    if (v31 && (v51 = *((int *)v31 + 2), (_DWORD)v51))
    {
      v52 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v53 = (void *)objc_msgSend(v52, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v51, 0);
      v61 = *MEMORY[0x1E0CB3388];
      v62[0] = v53;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v54 = 0;
    }
    +[MFError errorWithDomain:code:userInfo:](MFError, "errorWithDomain:code:userInfo:", CFSTR("MFMessageErrorDomain"), 1036, v54);
    v28 = (id)objc_claimAutoreleasedReturnValue();
    MFLookupLocalizedString(CFSTR("SMIME_UNREADABLE_SIG"), CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed"));
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setLocalizedDescription:", v55);

    if (v28)
      goto LABEL_33;
  }
  objc_msgSend(v31, "done");
  objc_msgSend(a1, "mimeBody");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "message");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "senders");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  -[_MFSecCMSDecoder verifyAgainstSenders:signingError:]((uint64_t)v31, v48, &v57);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v49 = v57;

  if (v31)
    v50 = (void *)*((_QWORD *)v31 + 4);
  else
    v50 = 0;
  -[MFMimePart _setSigners:](a1, v50);
  if (!v4)
    v4 = v49;

  if (v4)
    goto LABEL_34;
LABEL_40:

  return v56;
}

- (id)_decodeApplicationPkcs7MimeWithSecCMS
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  MFDecryptedAttachmentDataProvider *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _BOOL4 v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v61;
  _BOOL4 v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  unsigned int v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  id v77;
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "SMIMEError");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "decryptedMessageBodyIsEncrypted:isSigned:", 0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v69 = a2;
  if (v5 | v6)
  {
    v14 = 1;
    v8 = 1;
    goto LABEL_45;
  }
  objc_msgSend(a1, "bodyData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;
  if (v7)
  {
    v77 = 0;
    v9 = -[_MFSecCMSDecoder initWithPartData:error:]((char *)[_MFSecCMSDecoder alloc], v7, &v77);
    v10 = v77;
    v70 = (uint64_t)v9;
    -[_MFSecCMSDecoder signedData](v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "mf_dataByConvertingUnixNewlinesToNetwork");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MFDataConsumerConsumeCompleteData();

    if (v13 >= 0)
    {
      objc_msgSend((id)v70, "done");
      if (v70)
      {
        v14 = *(_BYTE *)(v70 + 56) != 0;
        if (*(_QWORD *)(v70 + 40))
        {
          objc_msgSend(a1, "mimeBody");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "message");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "senders");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = 0;
          -[_MFSecCMSDecoder verifyAgainstSenders:signingError:](v70, v17, &v76);
          v5 = objc_claimAutoreleasedReturnValue();
          v71 = v76;

          objc_msgSend(v4, "addObjectsFromArray:", *(_QWORD *)(v70 + 32));
          goto LABEL_14;
        }
      }
      else
      {
        v14 = 0;
      }
      v68 = 0;
      v71 = 0;
      v5 = (uint64_t)v10;
      if (v10)
        goto LABEL_15;
      goto LABEL_18;
    }
    if (v70 && (v20 = *(int *)(v70 + 8), (_DWORD)v20))
    {
      v21 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v22 = (void *)objc_msgSend(v21, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v20, 0);
      v23 = objc_alloc(MEMORY[0x1E0C99D80]);
      v24 = (void *)objc_msgSend(v23, "initWithObjectsAndKeys:", v22, *MEMORY[0x1E0CB3388], 0);

    }
    else
    {
      v24 = 0;
    }
    +[MFError errorWithDomain:code:userInfo:](MFError, "errorWithDomain:code:userInfo:", CFSTR("MFMessageErrorDomain"), 1035, v24);
    v5 = objc_claimAutoreleasedReturnValue();

    MFLookupLocalizedString(CFSTR("SMIME_CANT_DECRYPT_MESSAGE"), CFSTR("This message is encrypted.  Install a profile containing your encryption identity to decrypt this message."), CFSTR("Delayed"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v5, "setLocalizedDescription:", v25);

    v71 = 0;
    v14 = 1;
LABEL_14:
    v68 = 1;
    if (v5)
    {
LABEL_15:
      v26 = 0;
      v6 = 0;
LABEL_43:

      v19 = v68;
      goto LABEL_44;
    }
LABEL_18:
    objc_msgSend((id)v70, "data");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27)
    {
      -[_MFSecCMSDecoder signedData]((_QWORD *)v70);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v28 = (void *)objc_msgSend(v27, "mutableCopy");
    objc_msgSend(v28, "mf_convertNetworkLineEndingsToUnix");
    objc_msgSend(v28, "mf_makeImmutable");
    v67 = v28;

    if (v28)
    {
      objc_msgSend(a1, "mimeBody");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "message");
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      +[MFMessage messageWithRFC822Data:withParentPart:](MFMailMessage, "messageWithRFC822Data:withParentPart:", v28, a1);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "setMessagePropertiesFromMessage:", v64);
      if (objc_msgSend(v64, "isLibraryMessage"))
      {
        v30 = (void *)MEMORY[0x1E0C99E98];
        v31 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v64, "messageID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "stringWithFormat:", CFSTR("%@://%@"), CFSTR("x-attach-SMIME"), v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "URLWithString:", v33);
        v34 = objc_claimAutoreleasedReturnValue();

        v35 = v34;
      }
      else
      {
        objc_msgSend(v64, "messageURL");
        v35 = objc_claimAutoreleasedReturnValue();
      }
      v65 = (void *)v35;
      objc_msgSend(v66, "setMessageURL:");
      objc_msgSend(v66, "messageBody");
      v6 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v6, "topLevelPart");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "attachmentURLs");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "lastObject");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "URLByDeletingLastPathComponent");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        v40 = -[MFDecryptedAttachmentDataProvider initWithDecryptedMessage:]([MFDecryptedAttachmentDataProvider alloc], "initWithDecryptedMessage:", v66);
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v63 = v7;
        +[MFAttachmentManager allManagers](MFAttachmentManager, "allManagers");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v7 != 0;
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
        if (v42)
        {
          v43 = *(_QWORD *)v73;
          do
          {
            for (i = 0; i != v42; ++i)
            {
              if (*(_QWORD *)v73 != v43)
                objc_enumerationMutation(v41);
              objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * i), "addProvider:forBaseURL:", v40, v39);
            }
            v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
          }
          while (v42);
        }

        v7 = v63;
        v8 = v62;

      }
    }
    else
    {
      v6 = 0;
    }
    v5 = (uint64_t)v71;
    if (!(v5 | v6))
    {
      MFLogGeneral();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        -[MFMimePart(SMIMEDecoding) _decodeApplicationPkcs7MimeWithSecCMS].cold.2();

      if (v14 | v68 ^ 1)
      {
        MFLookupLocalizedString(CFSTR("SMIME_CANT_DECRYPT_MESSAGE"), CFSTR("This message is encrypted.  Install a profile containing your encryption identity to decrypt this message."), CFSTR("Delayed"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1035, v46);
      }
      else
      {
        MFLookupLocalizedString(CFSTR("SMIME_UNREADABLE_SIG"), CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, v46);
      }
      v5 = objc_claimAutoreleasedReturnValue();

      v6 = 0;
    }
    v26 = v67;
    goto LABEL_43;
  }
  MFLookupLocalizedString(CFSTR("SMIME_CANT_DECRYPT_MESSAGE"), CFSTR("This message is encrypted.  Install a profile containing your encryption identity to decrypt this message."), CFSTR("Delayed"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1035, v18);
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = 0;
  v71 = 0;
  v14 = 1;
  v19 = 1;
LABEL_44:
  objc_msgSend(a1, "_setDecryptedMessageBody:isEncrypted:isSigned:", v6, v14, v19);

LABEL_45:
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", v69, a1, CFSTR("SecureMimePart.m"), 860, CFSTR("The message body should be a MFMimeBody."));

    }
    objc_msgSend((id)v6, "topLevelPart");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "contentsForTextSystem");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v47, "copySigners");
    objc_msgSend(v4, "addObjectsFromArray:", v49);

    if (!v5)
    {
      objc_msgSend(v47, "SMIMEError");
      v5 = objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v48 = 0;
  }
  if (objc_msgSend(v4, "count"))
  {
    -[MFMimePart _setSigners:](a1, v4);
    objc_msgSend(a1, "mimeBody");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setSigners:", v4);

  }
  objc_msgSend(a1, "mimeBody");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setIsEncrypted:", v14);

  if (v5)
  {
    objc_msgSend((id)v5, "mf_shortDescription");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52 == 0;

    if (v53)
    {
      if (objc_msgSend((id)v5, "code") == 1036)
        MFLookupLocalizedString(CFSTR("SMIME_SIG_TITLE"), CFSTR("Unable to verify message signature"), CFSTR("Delayed"));
      else
        MFLookupLocalizedString(CFSTR("SMIME_CANT_DECRYPT_TITLE"), CFSTR("Unable to decrypt message"), CFSTR("Delayed"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v5, "setShortDescription:", v54);

    }
    -[MFMimePart _setSMIMEError:](a1, (void *)v5);
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setError:", v5);

    MFLogGeneral();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend((id)v5, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MFMimePart(SMIMEDecoding) _decodeApplicationPkcs7MimeWithSecCMS].cold.1();
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "threadDictionary");
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "setObject:forKey:", v59, *MEMORY[0x1E0D45F80]);

  return v48;
}

- (void)_decodeWithBlock:()SMIMEDecoding .cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v3, (uint64_t)v3, "[S/MIME] Failed to decode part with error: %{public}@", v4);

  OUTLINED_FUNCTION_1();
}

- (void)_decodeWithBlock:()SMIMEDecoding .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, v0, v1, "[S/MIME] There was no error while decrypting the message but there was no body either!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)_verifySignatureWithDecoder:()SMIMEDecoding signedData:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v3, (uint64_t)v3, "#SMIMEErrors Signature verification failed: %{public}@", v4);

  OUTLINED_FUNCTION_1();
}

- (void)_decodeMultipartSignedWithSecCMS
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_1(&dword_1A4F90000, v3, (uint64_t)v3, "#SMIMEErrors decodeMultipartSigned failed with %{public}@", v4);

  OUTLINED_FUNCTION_1();
}

- (void)_decodeApplicationPkcs7MimeWithSecCMS
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, v0, v1, "#SMIMEErrors There was no error while decrypting the message but there was no body either!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

@end
