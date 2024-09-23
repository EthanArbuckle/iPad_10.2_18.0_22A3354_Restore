@implementation SFReaderExtractor

void __45___SFReaderExtractor__scheduleLoadingTimeout__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXReaderExtraction();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A3B2D000, v2, OS_LOG_TYPE_DEFAULT, "Loading page for Reader data extraction timed out", v4, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.safariservices.readerExtractorErrorDomain"), 4, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_finishWithContent:error:", 0, v3);

  }
}

void __58___SFReaderExtractor__scheduleReaderDataExtractionTimeout__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXReaderExtraction();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A3B2D000, v2, OS_LOG_TYPE_DEFAULT, "Exctracting Reader data timed out", v4, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.safariservices.readerExtractorErrorDomain"), 5, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_finishWithContent:error:", 0, v3);

  }
}

@end
