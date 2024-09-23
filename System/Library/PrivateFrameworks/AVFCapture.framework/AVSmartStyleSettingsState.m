@implementation AVSmartStyleSettingsState

+ (id)smartStyleSettingsStateForBundleID:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initForBundleID:", a3);
}

+ (id)_smartStyleSettingsQueue
{
  if (_smartStyleSettingsQueue_onceToken != -1)
    dispatch_once(&_smartStyleSettingsQueue_onceToken, &__block_literal_global);
  return (id)_smartStyleSettingsQueue_sSmartStyleSettingsQueue;
}

dispatch_queue_t __53__AVSmartStyleSettingsState__smartStyleSettingsQueue__block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.cameracapture.smartstylesettings", 0);
  _smartStyleSettingsQueue_sSmartStyleSettingsQueue = (uint64_t)result;
  return result;
}

- (id)initForBundleID:(id)a3
{
  AVSmartStyleSettingsState *v4;
  __CFString *v5;
  AVCaptureSmartStyle *v6;
  AVCaptureSmartStyle *v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  char v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)AVSmartStyleSettingsState;
  v4 = -[AVSmartStyleSettingsState init](&v21, sel_init);
  if (v4)
  {
    v4->_bundleID = (NSString *)a3;
    v4->_queue = (OS_dispatch_queue *)+[AVSmartStyleSettingsState _smartStyleSettingsQueue](AVSmartStyleSettingsState, "_smartStyleSettingsQueue");
    v5 = AVSmartStyleSettingsSystemStyle;
    if ((objc_msgSend(a3, "isEqualToString:", AVSmartStyleSettingsSystemStyle) & 1) == 0)
      v5 = AVControlCenterPreferencesDomainForPreferencesDomain(a3);
    v4->_systemStyleKey = (NSString *)(id)AVSmartStyleSettingsSystemStylePreferenceKey(v5);
    v4->_systemStyleTimestampKey = (NSString *)(id)AVSmartStyleSettingsSystemStyleTimestampPreferenceKey(v5);
    v4->_systemStyleEnabledKey = (NSString *)(id)AVSmartStyleSettingsSystemStyleEnabledPreferenceKey();
    v6 = (AVCaptureSmartStyle *)+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", v4->_systemStyleKey);
    if (v6)
    {
      v7 = v6;
      v8 = -[AVCaptureSmartStyle objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", AVSmartStyleSettingsCastTypeKey);
      objc_msgSend((id)-[AVCaptureSmartStyle objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", AVSmartStyleSettingsCastIntensityKey), "floatValue");
      v10 = v9;
      objc_msgSend((id)-[AVCaptureSmartStyle objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", AVSmartStyleSettingsToneBiasKey), "floatValue");
      v12 = v11;
      objc_msgSend((id)-[AVCaptureSmartStyle objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", AVSmartStyleSettingsColorBiasKey), "floatValue");
      LODWORD(v14) = v13;
      LODWORD(v15) = v10;
      LODWORD(v16) = v12;
      v6 = +[AVCaptureSmartStyle styleWithCast:intensity:toneBias:colorBias:](AVCaptureSmartStyle, "styleWithCast:intensity:toneBias:colorBias:", v8, v15, v16, v14);
    }
    v4->_systemStyle = v6;
    v17 = +[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", v4->_systemStyleEnabledKey);
    if (v17 && (v18 = v17, objc_msgSend(v17, "objectForKeyedSubscript:", v4->_bundleID)))
      v19 = objc_msgSend((id)objc_msgSend(v18, "objectForKeyedSubscript:", v4->_bundleID), "BOOLValue");
    else
      v19 = objc_msgSend((id)sDisallowedFirstPartyAppsInSystemStyleEnabledList, "containsObject:", v4->_bundleID) ^ 1;
    v4->_systemStyleEnabled = v19;
  }
  return v4;
}

- (void)installProprietaryDefaultListeners
{
  uint64_t v3;
  NSString *systemStyleKey;
  NSString *systemStyleEnabledKey;
  _QWORD v6[5];
  _QWORD v7[5];

  v3 = MEMORY[0x1E0C809B0];
  systemStyleKey = self->_systemStyleKey;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__AVSmartStyleSettingsState_installProprietaryDefaultListeners__block_invoke;
  v7[3] = &unk_1E4216450;
  v7[4] = self;
  +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, systemStyleKey, 0, v7);
  if (!-[NSString isEqualToString:](self->_bundleID, "isEqualToString:", AVSmartStyleSettingsSystemStyle))
  {
    systemStyleEnabledKey = self->_systemStyleEnabledKey;
    v6[0] = v3;
    v6[1] = 3221225472;
    v6[2] = __63__AVSmartStyleSettingsState_installProprietaryDefaultListeners__block_invoke_2;
    v6[3] = &unk_1E4216450;
    v6[4] = self;
    +[AVCaptureProprietaryDefaultsSingleton addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:](AVCaptureProprietaryDefaultsSingleton, "addObserver:forKey:callHandlerForInitialValue:defaultChangedHandler:", self, systemStyleEnabledKey, 0, v6);
  }
}

uint64_t __63__AVSmartStyleSettingsState_installProprietaryDefaultListeners__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

uint64_t __63__AVSmartStyleSettingsState_installProprietaryDefaultListeners__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_proprietaryDefaultChanged:keyPath:", a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
}

- (void)dealloc
{
  objc_super v3;

  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_systemStyleKey);

  self->_systemStyleKey = 0;
  +[AVCaptureProprietaryDefaultsSingleton removeObserver:forKey:](AVCaptureProprietaryDefaultsSingleton, "removeObserver:forKey:", self, self->_systemStyleEnabledKey);

  self->_systemStyleEnabledKey = 0;
  self->_systemStyleTimestampKey = 0;

  self->_bundleID = 0;
  self->_systemStyle = 0;

  self->_queue = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVSmartStyleSettingsState;
  -[AVSmartStyleSettingsState dealloc](&v3, sel_dealloc);
}

- (void)_proprietaryDefaultChanged:(id)a3 keyPath:(id)a4
{
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  double v13;
  double v14;
  double v15;
  AVCaptureSmartStyle *v16;
  uint64_t v17;
  NSString *bundleID;
  void *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  AVCaptureSmartStyle *v23;
  NSString *v24;
  uint64_t v25;
  NSString *v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a4, "isEqualToString:", self->_systemStyleKey))
  {
    if (a3)
    {
      v7 = objc_msgSend(a3, "objectForKeyedSubscript:", AVSmartStyleSettingsCastTypeKey);
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", AVSmartStyleSettingsCastIntensityKey), "floatValue");
      v9 = v8;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", AVSmartStyleSettingsToneBiasKey), "floatValue");
      v11 = v10;
      objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", AVSmartStyleSettingsColorBiasKey), "floatValue");
      LODWORD(v13) = v12;
      LODWORD(v14) = v9;
      LODWORD(v15) = v11;
      v16 = +[AVCaptureSmartStyle styleWithCast:intensity:toneBias:colorBias:](AVCaptureSmartStyle, "styleWithCast:intensity:toneBias:colorBias:", v7, v14, v15, v13);
      if (-[AVCaptureSmartStyle isEqual:](v16, "isEqual:", self->_systemStyle))
        return;
      v17 = AVSmartStyleSettingsSystemStyleDidChangedNotification;
      bundleID = self->_bundleID;
      v29[0] = AVSmartStyleSettingsBundleIDKey;
      v29[1] = AVSmartStyleSettingsSmartStyleKey;
      v30[0] = bundleID;
      v30[1] = v16;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = v30;
      v21 = v29;
      goto LABEL_18;
    }
    if (-[NSString isEqualToString:](self->_bundleID, "isEqualToString:", AVSmartStyleSettingsSystemStyle))
      v23 = +[AVCaptureSmartStyle identityStyle](AVCaptureSmartStyle, "identityStyle");
    else
      v23 = (AVCaptureSmartStyle *)objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = v23;
    if (!-[AVCaptureSmartStyle isEqual:](v23, "isEqual:", self->_systemStyle))
    {
      v17 = AVSmartStyleSettingsSystemStyleDidChangedNotification;
      v26 = self->_bundleID;
      v31[0] = AVSmartStyleSettingsBundleIDKey;
      v31[1] = AVSmartStyleSettingsSmartStyleKey;
      v32[0] = v26;
      v32[1] = v16;
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = v32;
      v21 = v31;
LABEL_18:
      v25 = objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 2);

      self->_systemStyle = v16;
LABEL_19:
      if (v17)
      {
        if (v25)
          objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", v17, 0, v25);
      }
    }
  }
  else if (objc_msgSend(a4, "isEqualToString:", self->_systemStyleEnabledKey))
  {
    v22 = a3 && objc_msgSend(a3, "objectForKeyedSubscript:", self->_bundleID)
        ? objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", self->_bundleID), "BOOLValue")
        : 1;
    if (objc_msgSend(a3, "objectForKeyedSubscript:", self->_bundleID) && self->_systemStyleEnabled != (_DWORD)v22)
    {
      v17 = AVSmartStyleSettingsSystemStyleEnabledDidChangedNotification;
      v24 = self->_bundleID;
      v27[0] = AVSmartStyleSettingsBundleIDKey;
      v27[1] = AVSmartStyleSettingsEnabledKey;
      v28[0] = v24;
      v28[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v22);
      v25 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
      self->_systemStyleEnabled = v22;
      goto LABEL_19;
    }
  }
}

- (id)systemStyle
{
  NSObject *queue;
  void *v4;
  _QWORD block[5];
  id v7;
  id location;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__AVSmartStyleSettingsState_systemStyle__block_invoke;
  block[3] = &unk_1E4216478;
  objc_copyWeak(&v7, &location);
  block[4] = &v9;
  dispatch_sync(queue, block);
  v4 = (void *)v10[5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v9, 8);
  return v4;
}

void __40__AVSmartStyleSettingsState_systemStyle__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = WeakRetained[6];

  }
}

- (void)setSystemStyle:(id)a3
{
  NSObject *queue;
  _QWORD v6[6];
  id v7;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__AVSmartStyleSettingsState_setSystemStyle___block_invoke;
  v6[3] = &unk_1E42164A0;
  objc_copyWeak(&v7, &location);
  v6[4] = a3;
  v6[5] = self;
  dispatch_async(queue, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __44__AVSmartStyleSettingsState_setSystemStyle___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v4 = *(void **)(a1 + 32);
    if (v4)
    {
      if (*(__CFString **)(*(_QWORD *)(a1 + 40) + 8) == AVSmartStyleSettingsSystemStyle)
      {
        v7 = 0;
      }
      else
      {
        v5 = (void *)objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v6 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v5, "timeIntervalSince1970");
        v7 = objc_msgSend(v6, "numberWithDouble:");
        v4 = *(void **)(a1 + 32);
      }
      v12[0] = AVSmartStyleSettingsCastTypeKey;
      v13[0] = objc_msgSend(v4, "cast");
      v12[1] = AVSmartStyleSettingsCastIntensityKey;
      v9 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 32), "intensity");
      v13[1] = objc_msgSend(v9, "numberWithFloat:");
      v12[2] = AVSmartStyleSettingsToneBiasKey;
      v10 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 32), "toneBias");
      v13[2] = objc_msgSend(v10, "numberWithFloat:");
      v12[3] = AVSmartStyleSettingsColorBiasKey;
      v11 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(*(id *)(a1 + 32), "colorBias");
      v13[3] = objc_msgSend(v11, "numberWithFloat:");
      v8 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 4);
    }
    else
    {
      v8 = 0;
      v7 = 0;
    }
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", v7, v3[4]);
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", v8, v3[3]);

  }
}

- (BOOL)systemStyleEnabled
{
  void *v3;
  BOOL v4;
  NSObject *queue;
  _QWORD block[5];
  id v8;
  id location;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  if (-[NSString isEqualToString:](self->_bundleID, "isEqualToString:", AVSmartStyleSettingsSystemStyle))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v3);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v3);
    return 1;
  }
  else
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__AVSmartStyleSettingsState_systemStyleEnabled__block_invoke;
    block[3] = &unk_1E4216478;
    objc_copyWeak(&v8, &location);
    block[4] = &v10;
    dispatch_sync(queue, block);
    v4 = *((_BYTE *)v11 + 24) != 0;
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v10, 8);
  }
  return v4;
}

void __47__AVSmartStyleSettingsState_systemStyleEnabled__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = WeakRetained[56];

  }
}

- (void)setSystemStyleEnabled:(BOOL)a3
{
  void *v5;
  NSObject *queue;
  _QWORD block[4];
  id v8;
  BOOL v9;
  id location;

  if (-[NSString isEqualToString:](self->_bundleID, "isEqualToString:", AVSmartStyleSettingsSystemStyle))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
  else if (!-[NSString containsString:](self->_bundleID, "containsString:", CFSTR("com.apple."))
         || objc_msgSend((id)sAllowedFirstPartyAppsInSystemStyleEnabledList, "containsObject:", self->_bundleID))
  {
    objc_initWeak(&location, self);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__AVSmartStyleSettingsState_setSystemStyleEnabled___block_invoke;
    block[3] = &unk_1E42164C8;
    objc_copyWeak(&v8, &location);
    v9 = a3;
    dispatch_async(queue, block);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __51__AVSmartStyleSettingsState_setSystemStyleEnabled___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  id v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = (id)objc_msgSend(+[AVCaptureProprietaryDefaultsSingleton objectForKey:](AVCaptureProprietaryDefaultsSingleton, "objectForKey:", WeakRetained[5]), "mutableCopy");
    if (!v3)
      v3 = (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40)), v4[1]);
    +[AVCaptureProprietaryDefaultsSingleton setObject:forKey:](AVCaptureProprietaryDefaultsSingleton, "setObject:forKey:", v3, v4[5]);

  }
}

@end
