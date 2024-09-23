@implementation MRMediaRemoteAdjustMediaPlaybackVolume

uint64_t __MRMediaRemoteAdjustMediaPlaybackVolume_block_invoke(_QWORD *a1, uint64_t a2)
{
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t result;
  int v10;
  const __CFString *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  _MRLogForCategory(0xAuLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __MRMediaRemoteAdjustMediaPlaybackVolume_block_invoke_cold_1(a1, a2, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = a1[4];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceDate:", a1[5]);
    v10 = 138543874;
    v11 = CFSTR("adjustMediaPlaybackVolume");
    v12 = 2114;
    v13 = v6;
    v14 = 2048;
    v15 = v8;
    _os_log_impl(&dword_193827000, v5, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned in %.4lf seconds", (uint8_t *)&v10, 0x20u);

  }
  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

@end
