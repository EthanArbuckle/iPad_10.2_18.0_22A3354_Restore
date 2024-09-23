@implementation AFLocalGetMediaPlaybackVolumeNoCheck

void ___AFLocalGetMediaPlaybackVolumeNoCheck_block_invoke(uint64_t a1, float a2)
{
  NSObject *v4;
  id v5;
  double v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "_AFLocalGetMediaPlaybackVolumeNoCheck_block_invoke";
    v10 = 2048;
    v11 = a2;
    _os_log_impl(&dword_19AF50000, v4, OS_LOG_TYPE_INFO, "%s Got MRMediaRemoteGetMediaPlaybackVolume says %f", (uint8_t *)&v8, 0x16u);
  }
  v5 = objc_alloc_init(MEMORY[0x1E0D882E0]);
  *(float *)&v6 = a2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setVolumeValue:", v7);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
