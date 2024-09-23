@implementation AVPlayerItem

void __75__AVPlayerItem_AVKitAdditionsPrivate__avkit_airMessageSendExternalMetadata__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  _avairlog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315650;
    v7 = "-[AVPlayerItem(AVKitAdditionsPrivate) avkit_airMessageSendExternalMetadata]_block_invoke";
    v8 = 2048;
    v9 = a3;
    v10 = 2114;
    v11 = v4;
    _os_log_impl(&dword_1AC4B1000, v5, OS_LOG_TYPE_DEFAULT, "%s Result of sending external metadata: %ld [%{public}@]", (uint8_t *)&v6, 0x20u);
  }

}

@end
