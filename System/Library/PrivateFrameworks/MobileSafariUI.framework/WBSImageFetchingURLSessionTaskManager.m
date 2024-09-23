@implementation WBSImageFetchingURLSessionTaskManager

void __115__WBSImageFetchingURLSessionTaskManager_ReadingListMetadataFetcherAdditions__fetchThumbnailForBookmark_completion___block_invoke(uint64_t a1, id a2)
{
  NSObject *v3;
  id v4;

  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "safari_readingListThumbnailImageDataWithCGImage:", objc_msgSend(objc_retainAutorelease(a2), "CGImage"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
  else
  {
    v3 = WBS_LOG_CHANNEL_PREFIXReadingList();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __115__WBSImageFetchingURLSessionTaskManager_ReadingListMetadataFetcherAdditions__fetchThumbnailForBookmark_completion___block_invoke_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __115__WBSImageFetchingURLSessionTaskManager_ReadingListMetadataFetcherAdditions__fetchThumbnailForBookmark_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_1D7CA3000, v0, v1, "Unable to download thumbnail image for Reading List item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
