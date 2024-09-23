@implementation HMCameraProfile(HFAdditions)

- (HFCameraManager)hf_cameraManager
{
  HFCameraManager *v4;

  objc_getAssociatedObject(a1, a2);
  v4 = (HFCameraManager *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = -[HFCameraManager initWithCameraProfile:]([HFCameraManager alloc], "initWithCameraProfile:", a1);
    objc_setAssociatedObject(a1, a2, v4, (void *)1);
  }
  return v4;
}

- (BOOL)hf_supportsBidirectionalAudio
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "speakerControl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "microphoneControl");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)hf_supportsRecordingEvents
{
  void *v1;
  unint64_t v2;

  objc_msgSend(a1, "userSettings");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "supportedFeatures");

  return (v2 >> 1) & 1;
}

- (uint64_t)hf_shouldDisableLiveStream
{
  void *v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  if (+[HFUtilities isPressDemoModeEnabled](HFUtilities, "isPressDemoModeEnabled"))
    return 1;
  objc_msgSend(a1, "userSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "currentAccessMode");

  v3 = 1;
  if (v5 && v5 != 3)
  {
    objc_msgSend(a1, "userSettings");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v1, "isCameraManuallyDisabled");
  }
  if (v5 && v5 != 3)

  return v3;
}

- (unint64_t)hf_thermalShutdownMode
{
  void *v1;
  void *v2;
  void *v3;
  unint64_t v4;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_firstObjectPassingTest:", &__block_literal_global_81);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "lastKnownOperatingStateAbnormalReasons") & 2) != 0)
    v4 = 2;
  else
    v4 = ((unint64_t)objc_msgSend(v3, "lastKnownOperatingStateAbnormalReasons") >> 2) & 1;

  return v4;
}

- (BOOL)hf_thermalShutdownModeActive
{
  return objc_msgSend(a1, "hf_thermalShutdownMode") != 0;
}

- (BOOL)hf_cameraIsNotSetToRecord
{
  void *v2;
  _BOOL8 v3;
  void *v4;

  objc_msgSend(a1, "userSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "accessModeForPresenceType:", 3) == 2)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(a1, "userSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "accessModeForPresenceType:", 4) != 2;

  }
  return v3;
}

- (BOOL)hf_hasDoorbellService
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hf_serviceOfType:", *MEMORY[0x1E0CB9A08]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (uint64_t)hf_supportsReachabilityNotifications
{
  uint64_t result;
  void *v3;
  void *v4;
  uint64_t v5;

  result = objc_msgSend(a1, "hf_supportsRecordingEvents");
  if ((_DWORD)result)
  {
    objc_msgSend(a1, "accessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hf_supportsReachabilityNotifications");

    return v5;
  }
  return result;
}

- (id)hf_doorbellNotificationBulletin
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hf_serviceOfType:", *MEMORY[0x1E0CB9A08]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bulletinBoardNotification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hf_doorbellChimeMuteCharacteristic
{
  void *v1;
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__11;
  v10 = __Block_byref_object_dispose__11;
  v11 = 0;
  objc_msgSend(a1, "accessory");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__HMCameraProfile_HFAdditions__hf_doorbellChimeMuteCharacteristic__block_invoke;
  v5[3] = &unk_1EA731930;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)hf_updateDoorbellChime:()HFAdditions
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HFCharacteristicValueSet *v13;
  void *v14;
  id v15;
  void *v16;
  _DWORD v17[2];
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "hf_doorbellChimeMuteCharacteristic");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C9AAB0];
  if (a3)
    v8 = (void *)MEMORY[0x1E0C9AAA0];
  v9 = v8;
  HFLogForCategory(0xEuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 67109378;
    v17[1] = objc_msgSend(v9, "BOOLValue");
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1DD34E000, v10, OS_LOG_TYPE_DEFAULT, "Attempt to update doorbell chime - should mute = %{BOOL}d for characteristic:%@", (uint8_t *)v17, 0x12u);
  }

  if (v7)
  {
    objc_msgSend(v6, "hf_characteristicValueManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_new();
    objc_msgSend(v11, "beginTransactionWithReason:readPolicy:logger:", CFSTR("HFDoorbellMute-Toggle"), v12, 0);

    v13 = objc_alloc_init(HFCharacteristicValueSet);
    -[HFCharacteristicValueSet setValue:forCharacteristic:](v13, "setValue:forCharacteristic:", v9, v7);
    objc_msgSend(v6, "hf_characteristicValueManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v14, "writeValuesForCharacteristics:", v13);

    objc_msgSend(v6, "hf_characteristicValueManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "commitTransactionWithReason:", CFSTR("HFDoorbellMute-Toggle"));

  }
}

+ (uint64_t)hf_cameraAccessModeSelectedOptionForCameraProfiles:()HFAdditions presenceType:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id obj;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[6];

  v25[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25[0] = CFSTR("HFCameraStreamingOptionOff");
  v25[1] = CFSTR("HFCameraStreamingOptionDetectActivity");
  v25[2] = CFSTR("HFCameraStreamingOptionStream");
  v25[3] = CFSTR("HFCameraStreamingOptionStreamAndRecord");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "userSettings");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "accessModeForPresenceType:", a4);

        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __96__HMCameraProfile_HFAdditions__hf_cameraAccessModeSelectedOptionForCameraProfiles_presenceType___block_invoke;
        v19[3] = &__block_descriptor_40_e18_B16__0__NSString_8l;
        v19[4] = v13;
        objc_msgSend(v6, "na_firstObjectPassingTest:", v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "indexOfObject:", v14) > v9)
          v9 = objc_msgSend(v6, "indexOfObject:", v14);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  objc_msgSend(v6, "objectAtIndex:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = cameraStreamingOptionFromString(v15);

  return v16;
}

- (id)hf_significantEventWithIdentifier:()HFAdditions
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, a1);
  v5 = (void *)MEMORY[0x1E0D519C0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__HMCameraProfile_HFAdditions__hf_significantEventWithIdentifier___block_invoke;
  v9[3] = &unk_1EA72F630;
  objc_copyWeak(&v11, &location);
  v6 = v4;
  v10 = v6;
  objc_msgSend(v5, "futureWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

- (id)hf_faceCropImageForSignificantEvent:()HFAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  id v16;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)MEMORY[0x1E0D519C0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__HMCameraProfile_HFAdditions__hf_faceCropImageForSignificantEvent___block_invoke;
  v15[3] = &unk_1EA72BB28;
  v15[4] = a1;
  v7 = v4;
  v16 = v7;
  objc_msgSend(v6, "futureWithCompletionHandlerAdapterBlock:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "flatMap:", &__block_literal_global_40_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __68__HMCameraProfile_HFAdditions__hf_faceCropImageForSignificantEvent___block_invoke_3;
  v13[3] = &unk_1EA726968;
  v14 = v7;
  v10 = v7;
  objc_msgSend(v9, "addFailureBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
