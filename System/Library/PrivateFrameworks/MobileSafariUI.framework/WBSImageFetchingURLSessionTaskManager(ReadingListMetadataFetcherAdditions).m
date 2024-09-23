@implementation WBSImageFetchingURLSessionTaskManager(ReadingListMetadataFetcherAdditions)

- (void)fetchThumbnailForBookmark:()ReadingListMetadataFetcherAdditions completion:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "readingListIconURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v7, "readingListIconURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "URLWithString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C92C08], "sharedHTTPCookieStorage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "webui_safariCookieAcceptPolicyEnumValue");

    if (v13 == 1)
      v14 = 3;
    else
      v14 = 1;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __115__WBSImageFetchingURLSessionTaskManager_ReadingListMetadataFetcherAdditions__fetchThumbnailForBookmark_completion___block_invoke;
    v16[3] = &unk_1E9CF4E38;
    v18 = v6;
    v17 = v8;
    objc_msgSend(a1, "downloadImageWithURL:options:completionHandler:", v11, v14, v16);

  }
  else
  {
    v15 = WBS_LOG_CHANNEL_PREFIXReadingList();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[WBSImageFetchingURLSessionTaskManager(ReadingListMetadataFetcherAdditions) fetchThumbnailForBookmark:completion:].cold.1();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, 0);
  }

}

- (void)fetchThumbnailForBookmark:()ReadingListMetadataFetcherAdditions completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, v0, v1, "Unable to fetch thumbnail for Reading List item with invalid URL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
