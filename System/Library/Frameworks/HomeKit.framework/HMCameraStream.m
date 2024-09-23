@implementation HMCameraStream

- (HMCameraStream)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMCameraStream;
  return -[HMCameraSource init](&v3, sel_init);
}

- (HMCameraStream)initWithProfileUniqueIdentifier:(id)a3 sessionID:(id)a4 slotIdentifier:(id)a5 aspectRatio:(id)a6 audioStreamSetting:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  HMCameraStream *v17;
  uint64_t v18;
  NSString *sessionID;
  NSNumber *internalAudioVolume;
  HMCameraStream *result;
  HMCameraStream *v22;
  SEL v23;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (!v12)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v13)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v14)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v16 = v15;
  if (!v15)
  {
LABEL_11:
    v22 = (HMCameraStream *)_HMFPreconditionFailure();
    -[HMCameraStream dealloc](v22, v23);
    return result;
  }
  v24.receiver = self;
  v24.super_class = (Class)HMCameraStream;
  v17 = -[HMCameraSource initWithProfileUniqueIdentifier:slotIdentifier:aspectRatio:](&v24, sel_initWithProfileUniqueIdentifier_slotIdentifier_aspectRatio_, v12, v14, v15);
  if (v17)
  {
    v18 = objc_msgSend(v13, "copy");
    sessionID = v17->_sessionID;
    v17->_sessionID = (NSString *)v18;

    v17->_internalAudioStreamSetting = a7;
    internalAudioVolume = v17->_internalAudioVolume;
    v17->_internalAudioVolume = (NSNumber *)&unk_1E3B30988;

  }
  return v17;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[HMCameraSource context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deregisterReceiver:", self);

  v5.receiver = self;
  v5.super_class = (Class)HMCameraStream;
  -[HMCameraStream dealloc](&v5, sel_dealloc);
}

- (void)updateAudioStreamSetting:(HMCameraAudioStreamSetting)audioStreamSetting completionHandler:(void *)completion
{
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  HMCameraStream *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  HMCameraStream *v17;
  NSObject *v18;
  void *v19;
  id v20;
  _QWORD block[5];
  id v22;
  HMCameraAudioStreamSetting v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = completion;
  -[HMCameraSource context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMCameraStream updateAudioStreamSetting:completionHandler:]", CFSTR("completion"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1A1AC1AAC]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v19;
      v26 = 2112;
      v27 = (const char *)v15;
      _os_log_impl(&dword_19B1B0000, v18, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v16);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v15, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v20);
  }
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__HMCameraStream_updateAudioStreamSetting_completionHandler___block_invoke;
    block[3] = &unk_1E3AB5668;
    block[4] = self;
    v23 = audioStreamSetting;
    v22 = v6;
    dispatch_async(v9, block);

  }
  else
  {
    v10 = (void *)MEMORY[0x1A1AC1AAC]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v13;
      v26 = 2080;
      v27 = "-[HMCameraStream updateAudioStreamSetting:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v6 + 2))(v6, v14);

  }
}

- (void)updateAudioVolume:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  HMCameraStream *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  HMCameraStream *v18;
  NSObject *v19;
  void *v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMCameraSource context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMCameraStream updateAudioVolume:completionHandler:]", CFSTR("completion"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x1A1AC1AAC]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v20;
      v27 = 2112;
      v28 = (const char *)v16;
      _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v16, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__HMCameraStream_updateAudioVolume_completionHandler___block_invoke;
    block[3] = &unk_1E3AB5C58;
    block[4] = self;
    v23 = v6;
    v24 = v7;
    dispatch_async(v10, block);

  }
  else
  {
    v11 = (void *)MEMORY[0x1A1AC1AAC]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v26 = v14;
      v27 = 2080;
      v28 = "-[HMCameraStream updateAudioVolume:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v11);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v15);

  }
}

- (void)setAudioStreamSetting:(HMCameraAudioStreamSetting)audioStreamSetting
{
  -[HMCameraStream updateAudioStreamSetting:completionHandler:](self, "updateAudioStreamSetting:completionHandler:", audioStreamSetting, &__block_literal_global_13208);
}

- (void)_updateAudioStreamSetting:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  HMCameraStream *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  char *v14;
  void *v15;
  void *v16;
  void *v17;
  HMCameraStream *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMCameraStream *v24;
  NSObject *v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  uint64_t v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HMCameraSource context](self, "context");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMCameraStream _updateAudioStreamSetting:completionHandler:]", CFSTR("completion"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1A1AC1AAC]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v26;
      v34 = 2112;
      v35 = (const char *)v22;
      _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v22, 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v27);
  }
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1A1AC1AAC]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      HMCameraAudioStreamSettingAsString(a3);
      v14 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v13;
      v34 = 2112;
      v35 = v14;
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_INFO, "%{public}@Updating audio stream setting to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    if (a3 - 1 >= 2)
    {
      if (a3 == 3)
      {
        v17 = (void *)MEMORY[0x1A1AC1AAC]();
        v18 = v10;
        HMFGetOSLogHandle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v33 = v20;
          _os_log_impl(&dword_19B1B0000, v19, OS_LOG_TYPE_INFO, "%{public}@Requesting access for microphone", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v17);
        objc_msgSend(v8, "queue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __62__HMCameraStream__updateAudioStreamSetting_completionHandler___block_invoke;
        v28[3] = &unk_1E3AAF100;
        v28[4] = v18;
        v31 = 3;
        v30 = v6;
        v29 = v8;
        __HMPrivacyRequestAccessForService(*MEMORY[0x1E0DB1168], v21, v28);

      }
    }
    else
    {
      -[HMCameraStream _issueUpdateAudioStreamSettingRequest:completionHandler:](v10, "_issueUpdateAudioStreamSettingRequest:completionHandler:", a3, v6);
    }
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v33 = v15;
      v34 = 2080;
      v35 = "-[HMCameraStream _updateAudioStreamSetting:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v16);

  }
}

- (void)_updateAudioVolume:(id)a3 completionHandler:(id)a4
{
  char *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  HMCameraStream *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  HMCameraStream *v26;
  NSObject *v27;
  void *v28;
  id v29;
  _QWORD v30[5];
  char *v31;
  id v32;
  id v33;
  _QWORD v34[2];
  _QWORD v35[2];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = a4;
  -[HMCameraSource context](self, "context");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMCameraStream _updateAudioVolume:completionHandler:]", CFSTR("completion"));
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1A1AC1AAC]();
    v26 = self;
    HMFGetOSLogHandle();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v28;
      v38 = 2112;
      v39 = (const char *)v24;
      _os_log_impl(&dword_19B1B0000, v27, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v25);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v24, 0);
    v29 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v29);
  }
  v9 = (void *)v8;
  v10 = (void *)MEMORY[0x1A1AC1AAC]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v14;
      v38 = 2112;
      v39 = v6;
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating audio volume to %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    v15 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMCameraSource profileUniqueIdentifier](v11, "profileUniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithTarget:", v16);

    v34[0] = CFSTR("kCameraSessionID");
    -[HMCameraStream sessionID](v11, "sessionID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = CFSTR("HMCameraStreamAudioVolumeSettingMessageKey");
    v35[0] = v18;
    v35[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D285F8]), "initWithName:destination:payload:", CFSTR("HMCameraStreamSetAudioVolumeMessage"), v17, v19);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __55__HMCameraStream__updateAudioVolume_completionHandler___block_invoke;
    v30[3] = &unk_1E3AB4B08;
    v30[4] = v11;
    v31 = v6;
    v21 = v9;
    v32 = v21;
    v33 = v7;
    objc_msgSend(v20, "setResponseHandler:", v30);
    objc_msgSend(v21, "messageDispatcher");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sendMessage:", v20);

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v37 = v23;
      v38 = 2080;
      v39 = "-[HMCameraStream _updateAudioVolume:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v7 + 2))(v7, v17);
  }

}

- (void)_issueUpdateAudioStreamSettingRequest:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  HMCameraStream *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMCameraStream *v24;
  NSObject *v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  unint64_t v31;
  _QWORD v32[2];
  _QWORD v33[2];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HMCameraSource context](self, "context");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s: %@ cannot be nil"), "-[HMCameraStream _issueUpdateAudioStreamSettingRequest:completionHandler:]", CFSTR("completion"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1A1AC1AAC]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v26;
      v36 = 2112;
      v37 = (const char *)v22;
      _os_log_impl(&dword_19B1B0000, v25, OS_LOG_TYPE_ERROR, "%{public}@%@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v22, 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v27);
  }
  v8 = (void *)v7;
  if (v7)
  {
    v9 = objc_alloc(MEMORY[0x1E0D285D8]);
    -[HMCameraSource profileUniqueIdentifier](self, "profileUniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithTarget:", v10);

    v32[0] = CFSTR("kCameraSessionID");
    -[HMCameraStream sessionID](self, "sessionID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = CFSTR("kAudioStreamSetting");
    v33[0] = v12;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D285F8]), "initWithName:destination:payload:", CFSTR("HMCameraStreamSetAudioStreamSettingMessage"), v11, v14);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __74__HMCameraStream__issueUpdateAudioStreamSettingRequest_completionHandler___block_invoke;
    v28[3] = &unk_1E3AB14C0;
    v28[4] = self;
    v31 = a3;
    v16 = v8;
    v29 = v16;
    v30 = v6;
    objc_msgSend(v15, "setResponseHandler:", v28);
    objc_msgSend(v16, "messageDispatcher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sendMessage:", v15);

  }
  else
  {
    v18 = (void *)MEMORY[0x1A1AC1AAC]();
    v19 = self;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v21;
      v36 = 2080;
      v37 = "-[HMCameraStream _issueUpdateAudioStreamSettingRequest:completionHandler:]";
      _os_log_impl(&dword_19B1B0000, v20, OS_LOG_TYPE_ERROR, "%{public}@Nil context, invoking completion - %s", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v18);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v6 + 2))(v6, v11);
  }

}

- (void)_handleAudioStreamSettingUpdate:(unint64_t)a3 withError:(id)a4 context:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  HMCameraStream *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1A1AC1AAC]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v10)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v17;
      v23 = 2112;
      v24 = v10;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to update audio stream setting: %@", (uint8_t *)&v21, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v18;
      _os_log_impl(&dword_19B1B0000, v16, OS_LOG_TYPE_INFO, "%{public}@Successfully updated audio stream setting", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    -[HMCameraStream setInternalAudioStreamSetting:](v14, "setInternalAudioStreamSetting:", a3);
  }
  objc_msgSend(v11, "delegateCaller");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hmPublicError");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "callCompletion:error:", v12, v20);

}

- (NSString)sessionID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (unint64_t)internalAudioStreamSetting
{
  return self->_internalAudioStreamSetting;
}

- (void)setInternalAudioStreamSetting:(unint64_t)a3
{
  self->_internalAudioStreamSetting = a3;
}

- (NSNumber)internalAudioVolume
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setInternalAudioVolume:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalAudioVolume, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

uint64_t __74__HMCameraStream__issueUpdateAudioStreamSettingRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAudioStreamSettingUpdate:withError:context:completionHandler:", *(_QWORD *)(a1 + 56), a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __55__HMCameraStream__updateAudioVolume_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A1AC1AAC]();
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to update audio volume: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Successfully updated audio volume", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "setInternalAudioVolume:", *(_QWORD *)(a1 + 40));
  }
  objc_msgSend(*(id *)(a1 + 48), "delegateCaller");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "callCompletion:error:", *(_QWORD *)(a1 + 56), v5);

}

void __62__HMCameraStream__updateAudioStreamSetting_completionHandler___block_invoke(uint64_t a1, int a2)
{
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (a2)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v8;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Request for microphone access was granted", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(*(id *)(a1 + 32), "_issueUpdateAudioStreamSettingRequest:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v9;
      _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Request for microphone access was not granted", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 89);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_handleAudioStreamSettingUpdate:withError:context:completionHandler:", v11, v12, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

uint64_t __54__HMCameraStream_updateAudioVolume_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAudioVolume:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __61__HMCameraStream_updateAudioStreamSetting_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAudioStreamSetting:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t19_13228 != -1)
    dispatch_once(&logCategory__hmf_once_t19_13228, &__block_literal_global_37);
  return (id)logCategory__hmf_once_v20_13229;
}

void __29__HMCameraStream_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v20_13229;
  logCategory__hmf_once_v20_13229 = v0;

}

@end
