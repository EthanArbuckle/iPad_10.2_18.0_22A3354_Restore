@implementation ARRecordingTechniquePublic

void __72__ARRecordingTechniquePublic_ARKitAdditions___saveVideoInPhotosLibrary___block_invoke(uint64_t a1, uint64_t a2)
{
  void (*v4)(uint64_t);
  id *v5;
  uint64_t v6;
  uint64_t v7;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  if (a2 == 3)
  {
    v7 = MEMORY[0x1E0C809B0];
    v4 = __72__ARRecordingTechniquePublic_ARKitAdditions___saveVideoInPhotosLibrary___block_invoke_2;
    v5 = (id *)&v7;
  }
  else
  {
    v6 = MEMORY[0x1E0C809B0];
    v4 = __72__ARRecordingTechniquePublic_ARKitAdditions___saveVideoInPhotosLibrary___block_invoke_3;
    v5 = (id *)&v6;
  }
  v5[1] = (id)3221225472;
  v5[2] = v4;
  v5[3] = &unk_1EA586C08;
  objc_copyWeak(v5 + 5, &location);
  v5[4] = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(v5 + 5);
  objc_destroyWeak(&location);
}

void __72__ARRecordingTechniquePublic_ARKitAdditions___saveVideoInPhotosLibrary___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "copyVideoToPhotoLibrary:", *(_QWORD *)(a1 + 32));

}

void __72__ARRecordingTechniquePublic_ARKitAdditions___saveVideoInPhotosLibrary___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Saved video to file at %@, but not in the photo library because the permission has not been granted."), *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, *MEMORY[0x1E0CB2D50]);
    ARErrorWithCodeAndUserInfo();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_fail:", v4);

  }
}

id __70__ARRecordingTechniquePublic_ARKitAdditions__copyVideoToPhotoLibrary___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(MEMORY[0x1E0CD13B0], "creationRequestForAssetFromVideoAtFileURL:", *(_QWORD *)(a1 + 32));
}

void __70__ARRecordingTechniquePublic_ARKitAdditions__copyVideoToPhotoLibrary___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[2];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    if (_ARLogTechnique_onceToken != -1)
      dispatch_once(&_ARLogTechnique_onceToken, &__block_literal_global_14);
    v6 = (void *)_ARLogTechnique_logObj;
    if (os_log_type_enabled((os_log_t)_ARLogTechnique_logObj, OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v19 = v9;
      v20 = 2048;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_1DCC73000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Saved video to file at %@ and to the photo library.", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "_finish:", 0);
  }
  else
  {
    v16[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Saved video to file at %@, but not in the photo library because of an error."), *(_QWORD *)(a1 + 40));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = *MEMORY[0x1E0CB3388];
    v17[0] = v12;
    v17[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = *(void **)(a1 + 32);
    ARErrorWithCodeAndUserInfo();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_fail:", v15);

  }
}

@end
