@implementation BWAmbientLightSensor

- (BWAmbientLightSensor)init
{
  BWAmbientLightSensor *v2;
  NSObject *v3;
  _QWORD block[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWAmbientLightSensor;
  v2 = -[BWAmbientLightSensor init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.cameracapture.alsQueue", 0);
    v2->_alsQueue = (OS_dispatch_queue *)v3;
    if (v3)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __28__BWAmbientLightSensor_init__block_invoke;
      block[3] = &unk_1E491E720;
      block[4] = v2;
      dispatch_async(v3, block);
      *(_QWORD *)&v2->_luxLevel = 0x7F7FFFFF7FFFFFFFLL;
    }
    else
    {
      -[BWAmbientLightSensor dealloc](v2, "dealloc");
      return 0;
    }
  }
  return v2;
}

- (void)forceUpdateRearLuxLevel
{
  -[BrightnessSystemClient setProperty:forKey:](self->_brightnessSystemClient, "setProperty:forKey:", &unk_1E4A02F00, CFSTR("RLuxSampleWithMaxAge"));
}

- (void)_updateRearLuxLevel:(os_unfair_lock_s *)a1
{
  uint32_t v4;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      os_unfair_lock_lock(a1 + 10);
      objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("lux")), "floatValue");
      a1[7]._os_unfair_lock_opaque = v4;
      os_unfair_lock_unlock(a1 + 10);
    }
  }
}

+ (void)initialize
{
  objc_opt_class();
}

id __28__BWAmbientLightSensor_init__block_invoke(uint64_t a1)
{
  id result;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  uint64_t v9;
  id *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[11];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  result = +[FigWeakReference weakReferenceToObject:](FigWeakReference, "weakReferenceToObject:", *(_QWORD *)(a1 + 32));
  if (result)
  {
    v3 = result;
    result = (id)IOHIDEventSystemClientCreateWithType();
    if (result)
    {
      v4 = result;
      v5 = v3;
      v21[0] = CFSTR("PrimaryUsagePage");
      v21[1] = CFSTR("PrimaryUsage");
      v22[0] = &unk_1E49FB2B0;
      v22[1] = &unk_1E49FB2C8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
      IOHIDEventSystemClientSetMatching();
      IOHIDEventSystemClientRegisterEventCallback();
      v6 = MEMORY[0x1E0C809B0];
      v13[5] = MEMORY[0x1E0C809B0];
      v13[6] = 3221225472;
      v13[7] = __28__BWAmbientLightSensor_init__block_invoke_8;
      v13[8] = &unk_1E491F158;
      v13[9] = v3;
      v13[10] = v4;
      IOHIDEventSystemClientSetCancelHandler();
      v7 = a1 + 32;
      IOHIDEventSystemClientSetDispatchQueue();
      IOHIDEventSystemClientActivate();
      *(_QWORD *)(*(_QWORD *)v7 + 8) = v4;
      *(_DWORD *)(*(_QWORD *)v7 + 40) = 0;
      v15 = 0;
      v16 = &v15;
      v17 = 0x3052000000;
      v18 = __Block_byref_object_copy__31;
      v19 = __Block_byref_object_dispose__31;
      v8 = (objc_class *)getBrightnessSystemClientClass_softClass;
      v20 = getBrightnessSystemClientClass_softClass;
      if (!getBrightnessSystemClientClass_softClass)
      {
        v14[0] = v6;
        v14[1] = 3221225472;
        v14[2] = __getBrightnessSystemClientClass_block_invoke;
        v14[3] = &unk_1E491EC40;
        v14[4] = &v15;
        __getBrightnessSystemClientClass_block_invoke((uint64_t)v14);
        v8 = (objc_class *)v16[5];
      }
      _Block_object_dispose(&v15, 8);
      v9 = objc_msgSend([v8 alloc], "init");
      v11 = *(_QWORD *)(a1 + 32);
      v10 = (id *)(a1 + 32);
      *(_QWORD *)(v11 + 32) = v9;
      v12 = (void *)*((_QWORD *)*v10 + 4);
      v13[0] = v6;
      v13[1] = 3221225472;
      v13[2] = __28__BWAmbientLightSensor_init__block_invoke_2;
      v13[3] = &unk_1E4925578;
      v13[4] = v3;
      objc_msgSend(v12, "registerNotificationBlock:forProperties:", v13, &unk_1E4A01778);
      return (id)objc_msgSend(*v10, "forceUpdateRearLuxLevel");
    }
  }
  return result;
}

void __28__BWAmbientLightSensor_init__block_invoke_8(uint64_t a1)
{
  const void *v2;

  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

void __28__BWAmbientLightSensor_init__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  if (objc_msgSend(a2, "isEqualToString:", CFSTR("RLuxOutput")))
    -[BWAmbientLightSensor _updateRearLuxLevel:]((os_unfair_lock_s *)objc_msgSend(*(id *)(a1 + 32), "referencedObject"), a3);
}

- (void)dealloc
{
  NSObject *alsQueue;
  BrightnessSystemClient *brightnessSystemClient;
  objc_super v5;

  if (self->_hidSystemClient)
    IOHIDEventSystemClientCancel();
  alsQueue = self->_alsQueue;
  if (alsQueue)
    dispatch_release(alsQueue);
  brightnessSystemClient = self->_brightnessSystemClient;
  if (brightnessSystemClient)
  {
    -[BrightnessSystemClient registerNotificationBlock:](brightnessSystemClient, "registerNotificationBlock:", 0);
    -[BrightnessSystemClient unregisterNotificationForKey:](self->_brightnessSystemClient, "unregisterNotificationForKey:", CFSTR("RLuxOutput"));

  }
  v5.receiver = self;
  v5.super_class = (Class)BWAmbientLightSensor;
  -[BWAmbientLightSensor dealloc](&v5, sel_dealloc);
}

- (int)luxLevel
{
  NSObject *alsQueue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  alsQueue = self->_alsQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__BWAmbientLightSensor_luxLevel__block_invoke;
  v5[3] = &unk_1E491E9A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(alsQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__BWAmbientLightSensor_luxLevel__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (float)rearLuxLevel
{
  float rearLuxLevel;

  if (!self->_brightnessSystemClient)
    return 3.4028e38;
  -[BWAmbientLightSensor forceUpdateRearLuxLevel](self, "forceUpdateRearLuxLevel");
  os_unfair_lock_lock(&self->_lock);
  rearLuxLevel = self->_rearLuxLevel;
  os_unfair_lock_unlock(&self->_lock);
  return rearLuxLevel;
}

@end
