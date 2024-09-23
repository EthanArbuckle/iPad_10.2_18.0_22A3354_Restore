@implementation IMAttachmentUtilities

+ (Class)__AVDataAssetClass
{
  if (qword_1EE503E30 != -1)
    dispatch_once(&qword_1EE503E30, &unk_1E3FB5988);
  return (Class)qword_1EE503E28;
}

+ (BOOL)asset:(id)a3 containsMetadataKey:(id)a4
{
  NSObject *v6;
  uint64_t v7;
  dispatch_time_t v8;
  NSObject *v9;
  char v10;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  _QWORD v19[5];
  uint8_t buf[4];
  id v21;
  __int16 v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = dispatch_semaphore_create(0);
  v24[0] = CFSTR("availableMetadataFormats");
  v7 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = sub_19E27C6B0;
  v19[3] = &unk_1E3FB58C8;
  v19[4] = v6;
  objc_msgSend(a3, "loadValuesAsynchronouslyForKeys:completionHandler:", v7, v19);
  v8 = dispatch_time(0, 100000000);
  if (dispatch_semaphore_wait(v6, v8))
  {
    if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v21 = a4;
        v22 = 2048;
        v23 = 0x4059000000000000;
        _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Failed to fetch metadata for %@: Timeout during async fetch(%f ms)", buf, 0x16u);
      }
    }
    dispatch_release(v6);
    return 0;
  }
  dispatch_release(v6);
  v12 = (void *)MEMORY[0x1E0C8B220];
  v13 = objc_msgSend(a3, "metadataForFormat:", *MEMORY[0x1E0C8A910]);
  v14 = (void *)objc_msgSend(v12, "metadataItemsFromArray:withKey:keySpace:", v13, a4, *MEMORY[0x1E0C8A9F0]);
  if (!objc_msgSend(v14, "count"))
  {
    if (IMOSLoggingEnabled())
    {
      v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v21 = a4;
        _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_INFO, "IMAttachmentUtilities failed to load metadata for key %@", buf, 0xCu);
      }
    }
    return 0;
  }
  v18 = 0;
  v15 = (void *)objc_msgSend((id)objc_msgSend(v14, "objectAtIndexedSubscript:", 0), "dataValue");
  v10 = objc_msgSend(v15, "isEqualToData:", objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v18, 4));
  if ((v10 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v21 = a4;
        _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_INFO, "IMAttachmentUtilities found %@ metadata with unexpected contents, assuming metadata doesn't exist", buf, 0xCu);
      }
    }
  }
  return v10;
}

+ (id)photosSupportedPreviewGeneratorClasses
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
}

@end
