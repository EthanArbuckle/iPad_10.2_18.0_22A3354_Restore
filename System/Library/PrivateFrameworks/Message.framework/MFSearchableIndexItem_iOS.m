@implementation MFSearchableIndexItem_iOS

+ (id)searchableIndexItemsFromMessages:(id)a3 type:(int64_t)a4
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__MFSearchableIndexItem_iOS_searchableIndexItemsFromMessages_type___block_invoke;
  v5[3] = &__block_descriptor_48_e53___EDSearchableIndexItem_16__0___EDPersistedMessage__8l;
  v5[4] = a1;
  v5[5] = a4;
  objc_msgSend(a3, "ef_map:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__MFSearchableIndexItem_iOS_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_29 != -1)
    dispatch_once(&log_onceToken_29, block);
  return (OS_os_log *)(id)log_log_29;
}

+ (id)suggestionsSearchableItemWithMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_bodyDataForMessage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "suggestionsSearchableItemWithMessage:bodyData:fetchBody:isEncrypted:includeEncryptedBody:", v4, v5, 1, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)searchableMessageAttachmentsForBaseMessage:(id)a3 includeEncryptedBody:(BOOL)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  BOOL v22;
  void *v23;
  id v24;
  void *v25;
  id v27;
  void *v28;
  void *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  +[MFAttachmentManager defaultManager](MFAttachmentManager, "defaultManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "attachmentsForMessage:withSchemes:updatingFlags:", v27, 0, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v29;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v11, "mimeType");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (v12)
          v14 = (const __CFString *)v12;
        else
          v14 = &stru_1E4F1C8F8;
        objc_msgSend(v4, "addObject:", v14);

        objc_msgSend(v11, "fileUTType");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
          v17 = (const __CFString *)v15;
        else
          v17 = &stru_1E4F1C8F8;
        objc_msgSend(v5, "addObject:", v17);

        objc_msgSend(v11, "fileName");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (v18)
          v20 = (const __CFString *)v18;
        else
          v20 = &stru_1E4F1C8F8;
        objc_msgSend(v6, "addObject:", v20);

        if (!objc_msgSend(v11, "isDataAvailableLocally")
          || (objc_msgSend(v11, "path"),
              v21 = (void *)objc_claimAutoreleasedReturnValue(),
              v22 = v21 == 0,
              v21,
              v22))
        {
          objc_msgSend(v7, "addObject:", &stru_1E4F1C8F8);
        }
        else
        {
          objc_msgSend(v11, "path");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v23);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v8);
  }

  v24 = objc_alloc(MEMORY[0x1E0D1EC38]);
  v25 = (void *)objc_msgSend(v24, "initWithNames:paths:UTIs:specificUTIs:mimeTypes:kinds:", v6, v7, v5, MEMORY[0x1E0C9AA60], v4, MEMORY[0x1E0C9AA60]);

  return v25;
}

+ (id)_bodyDataForMessage:(id)a3
{
  char v4;

  v4 = 0;
  objc_msgSend(a3, "bestAlternativePartAsData:usingEncoding:", &v4, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldExcludeFromIndex
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MFSearchableIndexItem_iOS;
  if (-[EDSearchableIndexItem shouldExcludeFromIndex](&v10, sel_shouldExcludeFromIndex))
    return 1;
  -[EDSearchableIndexItem baseMessage](self, "baseMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mailbox");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "mailbox");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "representedAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[LocalAccount localAccount](LocalAccount, "localAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v3 = 1;
  }

  return v3;
}

- (void)setNeedsAllAttributesIndexingType
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MFSearchableIndexItem_iOS;
  -[EDSearchableIndexItem setNeedsAllAttributesIndexingType](&v2, sel_setNeedsAllAttributesIndexingType);
}

- (void)setNeedsAllAttributesIncludingDataDetectionResultsIndexingType
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MFSearchableIndexItem_iOS;
  -[EDSearchableIndexItem setNeedsAllAttributesIncludingDataDetectionResultsIndexingType](&v2, sel_setNeedsAllAttributesIncludingDataDetectionResultsIndexingType);
}

- (BOOL)_shouldAutoDownloadAttachment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;

  v3 = a3;
  objc_msgSend(v3, "mimeType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("text/calendar"))
    && (unint64_t)objc_msgSend(v3, "encodedFileSize") >> 5 <= 0xC34)
  {
    objc_msgSend(v3, "contentID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("191AF69B-0088-47D2-AD66-6C9D08949C46")) ^ 1;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)fetchIndexableAttachments
{
  BOOL v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = -[MFSearchableIndexItem_iOS shouldExcludeFromIndex](self, "shouldExcludeFromIndex");
  if (-[EDSearchableIndexItem indexingType](self, "indexingType"))
    v3 = 1;
  -[EDSearchableIndexItem baseMessage](self, "baseMessage");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -604800.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dateSent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6;
  objc_msgSend(v4, "timeIntervalSince1970");
  v9 = v8;

  if (v7 < v9)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0D1EEC0], "nullFuture");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MFAttachmentManager defaultManager](MFAttachmentManager, "defaultManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_opt_new();
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v26, "attachmentsForMessage:withSchemes:updatingFlags:", v27, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v12);
          v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if ((objc_msgSend(v16, "isDataAvailableLocally") & 1) == 0
            && -[MFSearchableIndexItem_iOS _shouldAutoDownloadAttachment:](self, "_shouldAutoDownloadAttachment:", v16))
          {
            +[MFSearchableIndexItem_iOS log](MFSearchableIndexItem_iOS, "log");
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v16, "url");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "absoluteString");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v35 = v24;
              _os_log_debug_impl(&dword_1A4F90000, v17, OS_LOG_TYPE_DEBUG, "fetching attachment %@", buf, 0xCu);

            }
            objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v28[0] = MEMORY[0x1E0C809B0];
            v28[1] = 3221225472;
            v28[2] = __54__MFSearchableIndexItem_iOS_fetchIndexableAttachments__block_invoke;
            v28[3] = &unk_1E4E8E8E0;
            v19 = v18;
            v29 = v19;
            objc_msgSend(v16, "setFetchCompletionBlock:", v28);
            objc_msgSend(v16, "setWantsCompletionBlockOffMainThread:", 1);
            v20 = (id)objc_msgSend(v16, "fetchData");
            objc_msgSend(v19, "future");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "recover:", &__block_literal_global_58);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v11, "addObject:", v22);
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v13);
    }

    objc_msgSend(MEMORY[0x1E0D1EEC0], "join:", v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

@end
