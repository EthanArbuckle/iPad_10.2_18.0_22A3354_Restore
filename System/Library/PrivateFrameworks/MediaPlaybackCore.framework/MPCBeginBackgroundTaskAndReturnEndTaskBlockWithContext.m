@implementation MPCBeginBackgroundTaskAndReturnEndTaskBlockWithContext

void ___MPCBeginBackgroundTaskAndReturnEndTaskBlockWithContext_block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v1 = *MEMORY[0x24BE65AB8];
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) != *MEMORY[0x24BE65AB8])
  {
    MPSharedBackgroundTaskProvider();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endTask:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24));

    v4 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = a1[6];
      v6 = a1[4];
      v7 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
      v8 = 136315650;
      v9 = v5;
      v10 = 2114;
      v11 = v6;
      v12 = 2048;
      v13 = v7;
      _os_log_impl(&dword_210BD8000, v4, OS_LOG_TYPE_DEFAULT, "%s: BackgroundTask: End assertion for %{public}@ (%lli)", (uint8_t *)&v8, 0x20u);
    }

    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v1;
  }
}

@end
