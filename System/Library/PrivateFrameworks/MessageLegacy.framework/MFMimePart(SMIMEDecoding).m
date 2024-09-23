@implementation MFMimePart(SMIMEDecoding)

- (uint64_t)decodeMultipartSigned
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  MFError *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _MFSecCMSDecoder *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  int v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  uint8_t buf[16];
  MFError *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v31 = 0;
  v2 = (void *)objc_msgSend(a1, "firstChildPart");
  v3 = objc_msgSend(v2, "contentsForTextSystem");
  if (v3)
  {
    if (!objc_msgSend(a1, "_needsSignatureVerification:", &v31)
      || !objc_msgSend(a1, "usesKnownSignatureProtocol"))
    {
      goto LABEL_42;
    }
    v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "mimeBody"), "message"), "dataForMimePart:", a1);
    if (objc_msgSend(v4, "length"))
    {
      v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("--%@"), objc_msgSend(a1, "bodyParameterForKey:", CFSTR("boundary")));
      v6 = objc_msgSend(v5, "mf_dataUsingEncoding:", 4);

      v7 = objc_msgSend(v4, "mf_rangeOfData:options:range:", v6, 0, 0, objc_msgSend(v4, "length"));
      if (v7 == 0x7FFFFFFFFFFFFFFFLL || !v8)
        goto LABEL_21;
      v9 = v7 + v8;
      v10 = objc_msgSend(v4, "length");
      v11 = objc_msgSend(v4, "bytes");
      while (1)
      {
        v12 = *(unsigned __int8 *)(v11 + v9);
        if (v12 != 13 && v12 != 10)
          break;
        ++v9;
      }
      v16 = v10 - v9;
      v4 = (void *)objc_msgSend(v4, "mf_subdataWithRange:", v9, v16);
      v17 = objc_msgSend(v4, "mf_rangeOfData:options:range:", v6, 0, 0, v16);
      if (!v17)
        goto LABEL_24;
      if (v17 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_21:
        if (v4)
        {
          if (v31)
          {
LABEL_23:
            v18 = 0;
            goto LABEL_38;
          }
LABEL_27:
          v20 = objc_msgSend((id)objc_msgSend(v2, "nextSiblingPart"), "bodyData");
          if (v20)
          {
            v18 = -[_MFSecCMSDecoder initWithPartData:error:]([_MFSecCMSDecoder alloc], "initWithPartData:error:", v20, &v31);
            if (v31)
            {
LABEL_38:
              if (!v31)
              {
                *(_QWORD *)buf = 0;
                -[_MFSecCMSDecoder done](v18, "done");
                v31 = -[_MFSecCMSDecoder verifyAgainstSenders:signingError:](v18, "verifyAgainstSenders:signingError:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "mimeBody"), "message"), "senders"), buf);
                objc_msgSend(a1, "_setSigners:", -[_MFSecCMSDecoder signers](v18, "signers"));
                if (!v31)
                  v31 = *(MFError **)buf;
              }

              objc_msgSend(a1, "_setSMIMEError:", v31);
LABEL_42:
              v14 = v31;
              if (!v31)
                return v3;
              goto LABEL_43;
            }
          }
          else
          {
            v21 = MFLogGeneral();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C8839000, v21, OS_LOG_TYPE_INFO, "#SMIMEErrors Missing signature part!", buf, 2u);
            }
            v18 = 0;
            v31 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, MFLookupLocalizedString((uint64_t)CFSTR("SMIME_UNREADABLE_SIG"), (uint64_t)CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed")));
            if (v31)
              goto LABEL_38;
          }
          objc_msgSend(v4, "mf_dataByConvertingUnixNewlinesToNetwork");
          if (MFDataConsumerConsumeCompleteData() < 0)
          {
            v22 = -[_MFSecCMSDecoder lastSecCMSError](v18, "lastSecCMSError");
            if (v22)
            {
              v23 = v22;
              v24 = objc_alloc(MEMORY[0x1E0CB35C8]);
              v25 = (void *)objc_msgSend(v24, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v23, 0);
              v32 = *MEMORY[0x1E0CB3388];
              v33[0] = v25;
              v26 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);

            }
            else
            {
              v26 = 0;
            }
            v31 = +[MFError errorWithDomain:code:userInfo:](MFError, "errorWithDomain:code:userInfo:", CFSTR("MFMessageErrorDomain"), 1036, v26);
            -[MFError setLocalizedDescription:](v31, "setLocalizedDescription:", MFLookupLocalizedString((uint64_t)CFSTR("SMIME_UNREADABLE_SIG"), (uint64_t)CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed")));
          }
          goto LABEL_38;
        }
LABEL_24:
        v19 = MFLogGeneral();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C8839000, v19, OS_LOG_TYPE_INFO, "#SMIMEErrors Missing signed data!", buf, 2u);
        }
        v4 = 0;
        v31 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, MFLookupLocalizedString((uint64_t)CFSTR("SMIME_UNREADABLE_SIG"), (uint64_t)CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed")));
        if (v31)
          goto LABEL_23;
        goto LABEL_27;
      }
      v15 = objc_msgSend(v4, "mf_subdataWithRange:", 0, v17 - 1);
    }
    else
    {
      v15 = objc_msgSend(a1, "signedData");
    }
    v4 = (void *)v15;
    goto LABEL_21;
  }
  v14 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, MFLookupLocalizedString((uint64_t)CFSTR("SMIME_UNREADABLE_SIG"), (uint64_t)CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed")));
  v31 = v14;
  if (!v14)
    return v3;
LABEL_43:
  if (!-[MFError mf_shortDescription](v14, "mf_shortDescription"))
    -[MFError setShortDescription:](v31, "setShortDescription:", MFLookupLocalizedString((uint64_t)CFSTR("SMIME_SIG_TITLE"), (uint64_t)CFSTR("Unable to verify message signature"), CFSTR("Delayed")));
  v27 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
  objc_msgSend(v27, "setError:", v31);
  v28 = MFLogGeneral();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    -[MFMimePart(SMIMEDecoding) decodeMultipartSigned].cold.1((id *)&v31, v28);
  return v3;
}

- (uint64_t)decodeApplicationPkcs7_mime
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _MFSecCMSDecoder *v7;
  uint64_t v8;
  NSArray *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  _MFSecDataMessageStore *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  MFDecryptedAttachmentDataProvider *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  MFError *v37;
  id v38;
  const __CFString *v39;
  const __CFString *v40;
  id v41;
  NSObject *v42;
  void *v43;
  uint64_t v44;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  unint64_t v54;
  unint64_t v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v55 = objc_msgSend(a1, "SMIMEError");
  v4 = objc_msgSend(a1, "decryptedMessageBodyIsEncrypted:isSigned:", 0, 0);
  if (!(v55 | v4))
  {
    v54 = 0;
    v5 = objc_msgSend(a1, "bodyData");
    v6 = v5 != 0;
    if (!v5)
    {
      v10 = 0;
      v9 = 0;
      v55 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1035, MFLookupLocalizedString((uint64_t)CFSTR("SMIME_CANT_DECRYPT_MESSAGE"), (uint64_t)CFSTR("This message is encrypted.  Install a profile containing your encryption identity to decrypt this message."), CFSTR("Delayed")));
      v8 = 1;
      v13 = 1;
      goto LABEL_48;
    }
    v7 = -[_MFSecCMSDecoder initWithPartData:error:]([_MFSecCMSDecoder alloc], "initWithPartData:error:", v5, &v55);
    objc_msgSend(-[_MFSecCMSDecoder signedData](v7, "signedData"), "mf_dataByConvertingUnixNewlinesToNetwork");
    if (MFDataConsumerConsumeCompleteData() < 0)
    {
      v14 = -[_MFSecCMSDecoder lastSecCMSError](v7, "lastSecCMSError");
      if (v14)
      {
        v15 = v14;
        v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v17 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v15, 0);
        v18 = objc_alloc(MEMORY[0x1E0C99D80]);
        v19 = (void *)objc_msgSend(v18, "initWithObjectsAndKeys:", v17, *MEMORY[0x1E0CB3388], 0);

      }
      else
      {
        v19 = 0;
      }
      v55 = +[MFError errorWithDomain:code:userInfo:](MFError, "errorWithDomain:code:userInfo:", CFSTR("MFMessageErrorDomain"), 1035, v19);
      objc_msgSend((id)v55, "setLocalizedDescription:", MFLookupLocalizedString((uint64_t)CFSTR("SMIME_CANT_DECRYPT_MESSAGE"), (uint64_t)CFSTR("This message is encrypted.  Install a profile containing your encryption identity to decrypt this message."), CFSTR("Delayed")));

      v9 = 0;
      v8 = 1;
    }
    else
    {
      -[_MFSecCMSDecoder done](v7, "done");
      v8 = -[_MFSecCMSDecoder isContentEncrypted](v7, "isContentEncrypted");
      if (!-[_MFSecCMSDecoder isContentSigned](v7, "isContentSigned"))
      {
        v13 = 0;
        v9 = 0;
LABEL_20:
        if (v55)
        {
          v20 = 0;
        }
        else
        {
          v21 = -[_MFSecCMSDecoder data](v7, "data");
          if (!v21)
            v21 = -[_MFSecCMSDecoder signedData](v7, "signedData");
          v20 = (void *)objc_msgSend(v21, "mutableCopy");
          objc_msgSend(v20, "mf_convertNetworkLineEndingsToUnix");
          objc_msgSend(v20, "mf_makeImmutable");
        }

        v10 = 0;
        if (v20 && !v55)
        {
          v47 = v13;
          v22 = -[MFDataMessageStore initWithData:]([_MFSecDataMessageStore alloc], "initWithData:", v20);
          +[MFMessage setMessageClassForStore:](MFMailMessage, "setMessageClassForStore:", v22);
          -[MFDataMessageStore setStoragePath:](v22, "setStoragePath:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "mimeBody"), "message"), "attachmentStorageLocation"));
          v23 = -[MFDataMessageStore message](v22, "message");
          objc_msgSend(v23, "setMessagePropertiesFromMessage:", objc_msgSend((id)objc_msgSend(a1, "mimeBody"), "message"));
          v24 = (void *)objc_msgSend((id)objc_msgSend(a1, "mimeBody"), "message");
          v49 = a2;
          v48 = v8;
          if (objc_msgSend(v24, "isLibraryMessage"))
            v25 = objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@://%@"), CFSTR("x-attach-SMIME"), objc_msgSend(v24, "messageID")));
          else
            v25 = objc_msgSend(v24, "messageURL");
          objc_msgSend(v23, "setMessageURL:", v25);
          v10 = objc_msgSend(v23, "messageBody");
          v26 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v10, "topLevelPart"), "attachmentURLs"), "lastObject"), "URLByDeletingLastPathComponent");
          if (v26)
          {
            v27 = v26;
            v46 = v6;
            v28 = -[MFDecryptedAttachmentDataProvider initWithDecryptedMessage:]([MFDecryptedAttachmentDataProvider alloc], "initWithDecryptedMessage:", v23);
            v50 = 0u;
            v51 = 0u;
            v52 = 0u;
            v53 = 0u;
            v29 = +[MFAttachmentManager allManagers](MFAttachmentManager, "allManagers");
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
            if (v30)
            {
              v31 = v30;
              v32 = *(_QWORD *)v51;
              do
              {
                for (i = 0; i != v31; ++i)
                {
                  if (*(_QWORD *)v51 != v32)
                    objc_enumerationMutation(v29);
                  objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "addProvider:forBaseURL:", v28, v27);
                }
                v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
              }
              while (v31);
            }

            v6 = v46;
          }
          a2 = v49;
          v13 = v47;
          v8 = v48;
        }

        if (!v55)
        {
          v55 = v54;
          if (!(v10 | v54))
          {
            v34 = MFLogGeneral();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
              -[MFMimePart(SMIMEDecoding) decodeApplicationPkcs7_mime].cold.2(v34, v35, v36);
            if (((v8 | v13 ^ 1) & 1) != 0)
            {
              v37 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1035, MFLookupLocalizedString((uint64_t)CFSTR("SMIME_CANT_DECRYPT_MESSAGE"), (uint64_t)CFSTR("This message is encrypted.  Install a profile containing your encryption identity to decrypt this message."), CFSTR("Delayed")));
            }
            else
            {
              v37 = +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1036, MFLookupLocalizedString((uint64_t)CFSTR("SMIME_UNREADABLE_SIG"), (uint64_t)CFSTR("There was a problem reading the digital signature for this message."), CFSTR("Delayed")));
              v8 = 0;
            }
            v10 = 0;
            v55 = (unint64_t)v37;
          }
        }
LABEL_48:
        objc_msgSend(a1, "_setDecryptedMessageBody:isEncrypted:isSigned:", v10, v8, v13);
        if (!v10)
          goto LABEL_49;
        goto LABEL_7;
      }
      v55 = -[_MFSecCMSDecoder verifyAgainstSenders:signingError:](v7, "verifyAgainstSenders:signingError:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "mimeBody"), "message"), "senders"), &v54);
      v9 = -[_MFSecCMSDecoder signers](v7, "signers");
    }
    v13 = 1;
    goto LABEL_20;
  }
  v10 = v4;
  v9 = 0;
  v6 = 1;
  if (!v4)
  {
LABEL_49:
    v12 = 0;
    goto LABEL_50;
  }
LABEL_7:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SecureMimePart.m"), 472, CFSTR("The message body should be a MFMimeBody."));
  v11 = (void *)objc_msgSend((id)v10, "topLevelPart");
  v12 = objc_msgSend(v11, "contentsForTextSystem");
  if (!v9)
    v9 = (NSArray *)(id)objc_msgSend(v11, "copySigners");
  if (!v55)
    v55 = objc_msgSend(v11, "SMIMEError");
LABEL_50:
  if (v9)
    objc_msgSend(a1, "_setSigners:", v9);
  if (v55)
  {
    objc_msgSend(a1, "_setSMIMEError:");
    if (v55)
    {
      if (!objc_msgSend((id)v55, "mf_shortDescription"))
      {
        v38 = (id)v55;
        if (objc_msgSend((id)v55, "code") == 1036)
        {
          v39 = CFSTR("SMIME_SIG_TITLE");
          v40 = CFSTR("Unable to verify message signature");
        }
        else
        {
          v39 = CFSTR("SMIME_CANT_DECRYPT_TITLE");
          v40 = CFSTR("Unable to decrypt message");
        }
        objc_msgSend(v38, "setShortDescription:", MFLookupLocalizedString((uint64_t)v39, (uint64_t)v40, CFSTR("Delayed")));
      }
      v41 = +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
      objc_msgSend(v41, "setError:", v55);
      v42 = MFLogGeneral();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        -[MFMimePart(SMIMEDecoding) decodeApplicationPkcs7_mime].cold.1((id *)&v55, v42);
    }
  }
  v43 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "threadDictionary");
  v44 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  objc_msgSend(v43, "setObject:forKey:", v44, *MEMORY[0x1E0D45F80]);
  return v12;
}

- (void)decodeMultipartSigned
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_6_1(a1);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_5(&dword_1C8839000, a2, v3, "#SMIMEErrors decodeMultipartSigned failed with %{public}@", v4);
  OUTLINED_FUNCTION_2_1();
}

- (void)decodeApplicationPkcs7_mime
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_7_1(&dword_1C8839000, a1, a3, "#SMIMEErrors There was no error while decrypting the message but there was no body either!", v3);
  OUTLINED_FUNCTION_1_3();
}

@end
