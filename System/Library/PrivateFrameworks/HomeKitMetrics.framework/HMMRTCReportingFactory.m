@implementation HMMRTCReportingFactory

- (id)sessionWithServiceName:(id)a3 samplingUUID:(id)a4 containsRealtime:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  uint64_t v34;

  v5 = a5;
  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = *MEMORY[0x1E0D83888];
  v20 = *MEMORY[0x1E0D83880];
  v21 = v8;
  v27 = (const __CFString *)&unk_1E8991F00;
  v28 = &unk_1E8991F48;
  v9 = *MEMORY[0x1E0D83870];
  v22 = *MEMORY[0x1E0D838A8];
  v23 = v9;
  v10 = MEMORY[0x1E0C9AAB0];
  if (v5)
    v10 = MEMORY[0x1E0C9AAA0];
  v29 = &unk_1E8991F18;
  v30 = v10;
  v24 = *MEMORY[0x1E0D838A0];
  objc_msgSend(a4, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v11;
  v25 = *MEMORY[0x1E0D83890];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = *MEMORY[0x1E0D83878];
  v32 = v12;
  v33 = CFSTR("com.apple.HomeKitDaemon");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v20, 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *MEMORY[0x1E0D838B8];
  v20 = *MEMORY[0x1E0D838B0];
  v21 = v14;
  v27 = CFSTR("home");
  v28 = v7;
  v15 = (void *)MEMORY[0x1E0C99D80];
  v16 = v7;
  objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", &v27, &v20, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D83848]), "initWithSessionInfo:userInfo:frameworksToCheck:", v13, v17, 0);
  return v18;
}

@end
