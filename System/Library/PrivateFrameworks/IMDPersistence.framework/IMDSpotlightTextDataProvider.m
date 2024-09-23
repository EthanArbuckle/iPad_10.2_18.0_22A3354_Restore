@implementation IMDSpotlightTextDataProvider

- (id)typeIdentifier
{
  return CFSTR("com.apple.metadata-importer.messages.plain-text");
}

- (id)dataForGUID:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[5];
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D39930]), "initWithEncodedMessagePartGUID:", v4);
  if (v29)
  {
    objc_msgSend(v29, "messageGUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = sub_1ABBB9200;
  v39 = sub_1ABBB9210;
  v40 = 0;
  +[IMDDatabase synchronousDatabase](IMDDatabase, "synchronousDatabase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = sub_1ABBB9218;
  v34[3] = &unk_1E5AB7658;
  v34[4] = &v35;
  objc_msgSend(v6, "fetchMessageRecordWithGUID:excludeRecoverableMessages:completionHandler:", v5, 1, v34);

  v7 = (void *)v36[5];
  if (v7)
  {
    objc_msgSend(v7, "attributedBodyText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D398F8]), "initWithMessageBody:messageGUID:", v8, v5);
      objc_msgSend(v27, "messageParts");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v47, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v31 != v11)
              objc_enumerationMutation(v9);
            v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            objc_msgSend(v13, "messagePartGUIDForMessageGUID:", v5);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "encodedMessagePartGUID");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v15, "isEqualToString:", v4) & 1) != 0)
            {
              v16 = objc_msgSend(v13, "messagePartRange");
              objc_msgSend(v8, "attributedSubstringFromRange:", v16, v17);
              v18 = objc_claimAutoreleasedReturnValue();

              v8 = (void *)v18;
            }

          }
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v47, 16);
        }
        while (v10);
      }

    }
    objc_msgSend(v8, "string");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    _IMStringStrippingControlCharacters();
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = CFSTR("text");
    v46 = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v21, 0, a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = a4;
        if (a4)
          v24 = *a4;
        *(_DWORD *)buf = 138412546;
        v42 = v22;
        v43 = 2112;
        v44 = v24;
        _os_log_impl(&dword_1ABB60000, v23, OS_LOG_TYPE_INFO, "Returning data %@ to spotlight with error %@", buf, 0x16u);
      }

    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v42 = v4;
        _os_log_impl(&dword_1ABB60000, v25, OS_LOG_TYPE_INFO, "Failed to find plain text for spotlight because no message was found for guid %@", buf, 0xCu);
      }

    }
    v22 = 0;
  }
  _Block_object_dispose(&v35, 8);

  return v22;
}

@end
