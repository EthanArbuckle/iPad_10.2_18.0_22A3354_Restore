@implementation IMDSpotlightLinkDataProvider

+ (id)decontainerizedPathString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "pathComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = objc_msgSend(v5, "indexOfObject:", CFSTR("Library"));
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v3;
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v3;
        _os_log_impl(&dword_1ABB60000, v8, OS_LOG_TYPE_INFO, "Did not need to decontainerize path %@", (uint8_t *)&v12, 0xCu);
      }

      v7 = v3;
    }
  }
  else
  {
    objc_msgSend(v5, "removeObjectsInRange:", 0, v6);
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(&unk_1E5ADC2E8, "arrayByAddingObjectsFromArray:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pathWithComponents:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (id)attachmentPathsFromMessageRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v22;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1AF435474]();
  objc_msgSend(v3, "attachmentRecords");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = 0;
    goto LABEL_18;
  }
  v23 = v4;
  v24 = v3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v22 = v5;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v8)
    goto LABEL_16;
  v9 = v8;
  v10 = *(_QWORD *)v26;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v26 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags", v22);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isSpotlightDaemonDelegateEnabled");

      if (v14)
      {
        objc_msgSend(v12, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          goto LABEL_9;
      }
      else
      {
        v17 = (void *)objc_opt_class();
        objc_msgSend(v12, "path");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "decontainerizedPathString:", v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
LABEL_9:
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v15, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_12;
        }
      }
      v16 = 0;
LABEL_12:
      objc_msgSend(v16, "absoluteString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length");

      if (v20)
        objc_msgSend(v6, "addObject:", v16);

    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  }
  while (v9);
LABEL_16:

  v4 = v23;
  v3 = v24;
  v5 = v22;
LABEL_18:

  objc_autoreleasePoolPop(v4);
  return v6;
}

- (id)typeIdentifier
{
  return CFSTR("com.apple.metadata-importer.linkMetadata");
}

- (id)dataForGUID:(id)a3 error:(id *)a4
{
  __CFString *v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  int v11;
  int v12;
  NSObject *v14;
  void *v15;
  __CFString *v16;
  NSObject *v18;
  id v19;
  int v21;
  __CFString *v22;
  __int16 v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  v6 = (__CFString *)IMDMessageRecordCopyMessageForGUID(v5);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v21 = 138412290;
      v22 = v6;
      _os_log_impl(&dword_1ABB60000, v7, OS_LOG_TYPE_INFO, "Found message for data: %@", (uint8_t *)&v21, 0xCu);
    }

  }
  if (-[__CFString cacheHasAttachments](v6, "cacheHasAttachments"))
  {
    objc_msgSend((id)objc_opt_class(), "attachmentPathsFromMessageRecord:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  -[__CFString iMessageAppBundleID](v6, "iMessageAppBundleID");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[__CFString iMessageAppData](v6, "iMessageAppData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend((id)*MEMORY[0x1E0D375F8], "isEqual:", v9);
  if (v10)
    v12 = v11;
  else
    v12 = 0;
  if (v12 != 1 || v8 == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v21 = 138412546;
        v22 = v9;
        v23 = 2112;
        v24 = v10;
        _os_log_impl(&dword_1ABB60000, v14, OS_LOG_TYPE_INFO, "Failed to find data for spotlight because either bundleID was wrong (%@) or data was nil (%@)", (uint8_t *)&v21, 0x16u);
      }

    }
    v16 = 0;
  }
  else
  {
    v25[0] = CFSTR("attachmentPaths");
    v25[1] = CFSTR("payloadData");
    v26[0] = v8;
    v26[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 0, a4);
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        if (a4)
          v19 = *a4;
        else
          v19 = 0;
        v21 = 138412546;
        v22 = v16;
        v23 = 2112;
        v24 = v19;
        _os_log_impl(&dword_1ABB60000, v18, OS_LOG_TYPE_INFO, "Returning data %@ to spotlight with error %@", (uint8_t *)&v21, 0x16u);
      }

    }
  }

  return v16;
}

@end
