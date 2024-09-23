@implementation WebBookmark

- (id)safari_bestCurrentURL
{
  id v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;

  v1 = a1;
  if (!a1)
    return v1;
  if ((objc_msgSend(a1, "isReadingListItem") & 1) == 0
    || (objc_msgSend(MEMORY[0x1E0CFA9A8], "sharedNetworkObserver"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v3 = objc_msgSend(v2, "isNetworkReachable"),
        v2,
        v3))
  {
    objc_msgSend(v1, "address");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_web_bestURLForUserTypedString");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(v1, "isFullArchiveAvailable"))
  {
    v24 = 0;
    objc_msgSend(v1, "webarchivePathInReaderForm:fileExists:", 0, &v24);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
    {
      v7 = WBS_LOG_CHANNEL_PREFIXReadingList();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[WebBookmark safari_bestCurrentURL].cold.2(v7, v8, v9, v10, v11, v12, v13, v14);
      if (objc_msgSend(MEMORY[0x1E0DCCBA0], "lockSync"))
      {
        objc_msgSend(v1, "setArchiveStatus:", 6);
        objc_msgSend(MEMORY[0x1E0DCCBA0], "mainBookmarkCollection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "saveBookmark:", v1);

        objc_msgSend(MEMORY[0x1E0DCCBA0], "unlockSync");
      }
      else
      {
        v16 = WBS_LOG_CHANNEL_PREFIXReadingList();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[WebBookmark safari_bestCurrentURL].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
      }
      v1 = 0;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 0);
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v1 = (id)v5;
LABEL_6:

    return v1;
  }
  return 0;
}

- (void)safari_bestCurrentURL
{
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, a1, a3, "WebBookmark claims it has a web archive available, but file doesn't exist", a5, a6, a7, a8, 0);
}

@end
