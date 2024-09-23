@implementation AVAudioSession(HUAudioSession)

- (void)setActive:()HUAudioSession forFeature:error:
{
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if ((a3 & 1) != 0 || objc_msgSend(a1, "currentFeature") == a4)
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Setting session active %d for %lu"), a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AVAudioSession(HUAudioSession) setActive:forFeature:error:]", 778, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_retainAutorelease(v10);
      v13 = v11;
      *(_DWORD *)buf = 136446210;
      v32 = objc_msgSend(v12, "UTF8String");
      _os_log_impl(&dword_1DE311000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    CSInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Setting session active %d for %lu"), a3, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AVAudioSession(HUAudioSession) setActive:forFeature:error:]", 779, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)*MEMORY[0x1E0D2F918];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_retainAutorelease(v15);
      v18 = v16;
      v19 = objc_msgSend(v17, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v32 = v19;
      _os_log_impl(&dword_1DE311000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    if ((_DWORD)a3)
      objc_msgSend(a1, "setCurrentFeature:", a4);
    objc_msgSend(a1, "setActive:error:", a3, a5);
  }
  else
  {
    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Skipping session change %d, %lu"), 0, a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AVAudioSession(HUAudioSession) setActive:forFeature:error:]", 788, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)*MEMORY[0x1E0D2F928];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F928], OS_LOG_TYPE_DEFAULT))
    {
      v23 = objc_retainAutorelease(v21);
      v24 = v22;
      *(_DWORD *)buf = 136446210;
      v32 = objc_msgSend(v23, "UTF8String");
      _os_log_impl(&dword_1DE311000, v24, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    CSInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Skipping session change %d, %lu"), 0, a4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[AVAudioSession(HUAudioSession) setActive:forFeature:error:]", 789, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)*MEMORY[0x1E0D2F918];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F918], OS_LOG_TYPE_DEFAULT))
    {
      v28 = objc_retainAutorelease(v26);
      v29 = v27;
      v30 = objc_msgSend(v28, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v32 = v30;
      _os_log_impl(&dword_1DE311000, v29, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
}

- (void)setCurrentFeature:()HUAudioSession
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &AVAS_PROPERTY_KEY, v2, (void *)1);

}

- (uint64_t)currentFeature
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, &AVAS_PROPERTY_KEY);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

@end
