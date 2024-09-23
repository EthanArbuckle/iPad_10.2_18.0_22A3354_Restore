@implementation MPFetchArtworkForAddedMediaItems

void __MPFetchArtworkForAddedMediaItems_block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.amp.mediaplayer", "SDKLibrary");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "persistentID");
    objc_msgSend(*(id *)(a1 + 32), "title");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 134218242;
    v6 = v3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_193B9B000, v2, OS_LOG_TYPE_DEFAULT, "Received artwork for %lld - %@", (uint8_t *)&v5, 0x16u);

  }
}

@end
