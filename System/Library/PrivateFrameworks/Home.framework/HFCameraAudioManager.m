@implementation HFCameraAudioManager

- (HFCameraAudioManager)initWithCameraProfile:(id)a3 cameraStream:(id)a4 valueManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  HFCameraAudioManager *v11;
  HFCameraAudioManager *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)HFCameraAudioManager;
  v11 = -[HFCameraAudioManager init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[HFCameraAudioManager setCameraProfile:](v11, "setCameraProfile:", v8);
    -[HFCameraAudioManager setCameraStream:](v12, "setCameraStream:", v9);
    -[HFCameraAudioManager setValueManager:](v12, "setValueManager:", v10);
  }

  return v12;
}

- (unint64_t)audioStreamSetting
{
  void *v2;
  unint64_t v3;

  -[HFCameraAudioManager cameraStream](self, "cameraStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "audioStreamSetting");

  return v3;
}

- (BOOL)isOutgoingAudioEnabled
{
  return -[HFCameraAudioManager audioStreamSetting](self, "audioStreamSetting") == 3;
}

- (BOOL)isIncomingAudioEnabled
{
  return -[HFCameraAudioManager audioStreamSetting](self, "audioStreamSetting") != 1;
}

- (float)incomingAudioVolume
{
  void *v2;
  void *v3;
  float v4;
  float v5;

  -[HFCameraAudioManager cameraStream](self, "cameraStream");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "audioVolume");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (id)setOutgoingAudioEnabled:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (a3)
  {
    v4 = 3;
  }
  else
  {
    -[HFCameraAudioManager cameraStream](self, "cameraStream");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "audioStreamSetting");

    if (v6 == 3)
      v4 = 2;
    else
      v4 = 1;
  }
  return -[HFCameraAudioManager updateAudioStreamSetting:](self, "updateAudioStreamSetting:", v4);
}

- (id)setIncomingAudioEnabled:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (a3)
  {
    -[HFCameraAudioManager cameraStream](self, "cameraStream");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "audioStreamSetting");

    if (v5 == 3)
      v6 = 3;
    else
      v6 = 2;
  }
  else
  {
    v6 = 1;
  }
  return -[HFCameraAudioManager updateAudioStreamSetting:](self, "updateAudioStreamSetting:", v6);
}

- (id)setIncomingAudioVolume:(float)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  float v10;
  uint8_t buf[4];
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  HFLogForCategory(0x1CuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v12 = a3;
    _os_log_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_DEFAULT, "Setting incoming audio volume to %.1f", buf, 0xCu);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__HFCameraAudioManager_setIncomingAudioVolume___block_invoke;
  v9[3] = &unk_1EA728DF0;
  v9[4] = self;
  v10 = a3;
  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "addFailureBlock:", &__block_literal_global_19);
  return v6;
}

void __47__HFCameraAudioManager_setIncomingAudioVolume___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "cameraStream");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = *(_DWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateAudioVolume:completionHandler:", v6, v4);

}

void __47__HFCameraAudioManager_setIncomingAudioVolume___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory(0x1CuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_ERROR, "Error setting incoming audio volume:%@", (uint8_t *)&v4, 0xCu);
  }

}

- (id)updateAudioStreamSetting:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v22[6];
  _QWORD v23[5];
  _QWORD v24[6];
  uint8_t buf[4];
  __CFString *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[HFCameraAudioManager cameraProfile](self, "cameraProfile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "streamControl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "streamState");

  HFLogForCategory(0x1CuLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if ((unint64_t)(v7 - 3) > 1)
  {
    if (v9)
    {
      if (a3 - 1 >= 3)
      {
        NSLog(CFSTR("Unknown HMCameraAudioStreamSetting: %lu"), a3);
        v11 = 0;
      }
      else
      {
        v11 = off_1EA728F78[a3 - 1];
      }
      -[HFCameraAudioManager cameraProfile](self, "cameraProfile");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hf_prettyDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v11;
      v27 = 2112;
      v28 = v16;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Updating audio stream setting to %@ for %@", buf, 0x16u);

    }
    v17 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __49__HFCameraAudioManager_updateAudioStreamSetting___block_invoke;
    v24[3] = &unk_1EA728E58;
    v24[4] = self;
    v24[5] = a3;
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithErrorOnlyHandlerAdapterBlock:", v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v18, "addFailureBlock:", &__block_literal_global_3_0);
    v23[0] = v17;
    v23[1] = 3221225472;
    v23[2] = __49__HFCameraAudioManager_updateAudioStreamSetting___block_invoke_4;
    v23[3] = &unk_1EA728EC8;
    v23[4] = self;
    v20 = (id)objc_msgSend(v18, "addCompletionBlock:", v23);
    v22[0] = v17;
    v22[1] = 3221225472;
    v22[2] = __49__HFCameraAudioManager_updateAudioStreamSetting___block_invoke_3;
    v22[3] = &unk_1EA728F30;
    v22[4] = self;
    v22[5] = a3;
    objc_msgSend(v18, "flatMap:", v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (v9)
    {
      if (a3 - 1 >= 3)
      {
        NSLog(CFSTR("Unknown HMCameraAudioStreamSetting: %lu"), a3);
        v10 = 0;
      }
      else
      {
        v10 = off_1EA728F78[a3 - 1];
      }
      -[HFCameraAudioManager cameraProfile](self, "cameraProfile");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "hf_prettyDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v10;
      v27 = 2112;
      v28 = v13;
      _os_log_impl(&dword_1DD34E000, v8, OS_LOG_TYPE_DEFAULT, "Ignoring request to update audio stream setting to %@ for %@, as the stream is stopping or has already stopped.", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v14;
}

void __49__HFCameraAudioManager_updateAudioStreamSetting___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "cameraStream");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateAudioStreamSetting:completionHandler:", *(_QWORD *)(a1 + 40), v4);

}

void __49__HFCameraAudioManager_updateAudioStreamSetting___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  HFLogForCategory(0x1CuLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1DD34E000, v3, OS_LOG_TYPE_DEFAULT, "Error updating audio stream setting:%@", (uint8_t *)&v4, 0xCu);
  }

}

void __49__HFCameraAudioManager_updateAudioStreamSetting___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__HFCameraAudioManager_updateAudioStreamSetting___block_invoke_2_6;
  v7[3] = &unk_1EA728EA0;
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "dispatchCameraObserverMessage:sender:", v7, 0);

}

void __49__HFCameraAudioManager_updateAudioStreamSetting___block_invoke_2_6(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "cameraStream");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cameraStream:didUpdateAudioStreamSettingWithError:", v3, *(_QWORD *)(a1 + 40));

  }
}

id __49__HFCameraAudioManager_updateAudioStreamSetting___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)objc_opt_new();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3 == 3)
  {
    objc_msgSend(*(id *)(a1 + 32), "enableRemoteSpeakerIfNecessary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

    v3 = *(_QWORD *)(a1 + 40);
  }
  if (v3 != 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "enableRemoteMicrophoneIfNecessary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v5);

  }
  objc_msgSend(MEMORY[0x1E0D519C0], "combineAllFutures:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "flatMap:", &__block_literal_global_13_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __49__HFCameraAudioManager_updateAudioStreamSetting___block_invoke_4()
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
}

- (id)enableRemoteSpeakerIfNecessary
{
  void *v3;
  void *v4;
  double v5;
  void *v6;

  -[HFCameraAudioManager cameraProfile](self, "cameraProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "speakerControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 0.5;
  -[HFCameraAudioManager _enableAudioIfNecessaryForAudioControl:minVolume:](self, "_enableAudioIfNecessaryForAudioControl:minVolume:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)enableRemoteMicrophoneIfNecessary
{
  void *v3;
  void *v4;
  double v5;
  void *v6;

  -[HFCameraAudioManager cameraProfile](self, "cameraProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "microphoneControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 0.5;
  -[HFCameraAudioManager _enableAudioIfNecessaryForAudioControl:minVolume:](self, "_enableAudioIfNecessaryForAudioControl:minVolume:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_enableAudioIfNecessaryForAudioControl:(id)a3 minVolume:(float)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  HFCameraAudioManager *v15;
  float v16;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mute");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_safeAddObject:", v8);

  objc_msgSend(v6, "volume");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "na_safeAddObject:", v9);

  if (objc_msgSend(v7, "count"))
  {
    -[HFCameraAudioManager _readValuesForCharacteristics:](self, "_readValuesForCharacteristics:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73__HFCameraAudioManager__enableAudioIfNecessaryForAudioControl_minVolume___block_invoke;
    v13[3] = &unk_1EA728F58;
    v16 = a4;
    v14 = v6;
    v15 = self;
    objc_msgSend(v10, "flatMap:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

id __73__HFCameraAudioManager__enableAudioIfNecessaryForAudioControl_minVolume___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  _BOOL4 v18;
  HFCharacteristicValueSet *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "mute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "characteristicType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseForCharacteristicType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueWithExpectedClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "volume");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "characteristicType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "responseForCharacteristicType:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "valueWithExpectedClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v13 = objc_msgSend(v8, "BOOLValue");
    if (v12)
    {
LABEL_3:
      objc_msgSend(*(id *)(a1 + 32), "volume");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "metadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hf_percentageForCharacteristicValue:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v16, "floatValue");
      v18 = v17 < *(float *)(a1 + 48);

      goto LABEL_6;
    }
  }
  else
  {
    v13 = 0;
    if (v12)
      goto LABEL_3;
  }
  v18 = 0;
LABEL_6:
  if (((v13 | v18) & 1) != 0)
  {
    v19 = objc_alloc_init(HFCharacteristicValueSet);
    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "mute");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFCharacteristicValueSet setValue:forCharacteristic:](v19, "setValue:forCharacteristic:", MEMORY[0x1E0C9AAA0], v20);

    }
    if (v18)
    {
      objc_msgSend(*(id *)(a1 + 32), "volume");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "metadata");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "hf_characteristicValueForPercentage:", *(float *)(a1 + 48));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(*(id *)(a1 + 32), "volume");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[HFCharacteristicValueSet setValue:forCharacteristic:](v19, "setValue:forCharacteristic:", v23, v24);

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_writeValuesForCharacteristics:", v19);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

- (id)_readValuesForCharacteristics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HFCameraAudioManager valueManager](self, "valueManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "beginTransactionWithReason:readPolicy:logger:", CFSTR("HFCameraAudioManagerReadReason"), v6, 0);

  -[HFCameraAudioManager valueManager](self, "valueManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "readValuesForCharacteristics:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCameraAudioManager valueManager](self, "valueManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commitTransactionWithReason:", CFSTR("HFCameraAudioManagerReadReason"));

  return v8;
}

- (id)_writeValuesForCharacteristics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HFCameraAudioManager valueManager](self, "valueManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "beginTransactionWithReason:readPolicy:logger:", CFSTR("HFCameraAudioManagerWriteReason"), v6, 0);

  -[HFCameraAudioManager valueManager](self, "valueManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeValuesForCharacteristics:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFCameraAudioManager valueManager](self, "valueManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "commitTransactionWithReason:", CFSTR("HFCameraAudioManagerWriteReason"));

  return v8;
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void)setCameraProfile:(id)a3
{
  objc_storeStrong((id *)&self->_cameraProfile, a3);
}

- (HMCameraStream)cameraStream
{
  return self->_cameraStream;
}

- (void)setCameraStream:(id)a3
{
  objc_storeStrong((id *)&self->_cameraStream, a3);
}

- (HFCharacteristicValueManager)valueManager
{
  return self->_valueManager;
}

- (void)setValueManager:(id)a3
{
  objc_storeStrong((id *)&self->_valueManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueManager, 0);
  objc_storeStrong((id *)&self->_cameraStream, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
}

@end
