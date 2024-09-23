@implementation MRMediaRemoteGetSystemVolumeMuted

void __MRMediaRemoteGetSystemVolumeMuted_block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _MRLogForCategory(0xAuLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __MRMediaRemoteGetSystemVolumeMuted_block_invoke_cold_1(a1, v5, v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = a1[4];
    if ((_DWORD)a2)
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSinceDate:", a1[5]);
    v13 = 138544130;
    v14 = CFSTR("getSystemIsMuted");
    v15 = 2114;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    v19 = 2048;
    v20 = v11;
    _os_log_impl(&dword_193827000, v7, OS_LOG_TYPE_DEFAULT, "Response: %{public}@<%{public}@> returned <%@> in %.4lf seconds", (uint8_t *)&v13, 0x2Au);

  }
  v12 = a1[6];
  if (v12)
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, a2, v5);

}

@end
