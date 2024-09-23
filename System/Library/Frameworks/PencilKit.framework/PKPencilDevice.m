@implementation PKPencilDevice

- (void)resetRollSupportedState
{
  NSObject *v2;
  uint8_t v3[16];

  if (a1)
  {
    v2 = os_log_create("com.apple.pencilkit", "PencilDevice");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1BE213000, v2, OS_LOG_TYPE_DEFAULT, "Clearing roll support state.", v3, 2u);
    }

    *(_DWORD *)(a1 + 36) = 0;
  }
}

+ (id)activePencil
{
  objc_opt_self();
  if (_MergedGlobals_117 != -1)
    dispatch_once(&_MergedGlobals_117, &__block_literal_global_17);
  return (id)qword_1ECEE6128;
}

void __30__PKPencilDevice_activePencil__block_invoke()
{
  PKPencilDevice *v0;
  void *v1;

  v0 = objc_alloc_init(PKPencilDevice);
  v1 = (void *)qword_1ECEE6128;
  qword_1ECEE6128 = (uint64_t)v0;

}

- (PKPencilDevice)init
{
  PKPencilDevice *v2;
  PKPencilDevice *v3;
  IOHIDManagerRef v4;
  IOHIDManagerRef v5;
  NSObject *v6;
  const __CFDictionary *v7;
  __IOHIDManager *stylusHidManager;
  NSObject *v9;
  uint64_t v10;
  __IOHIDManager *v11;
  NSObject *v12;
  _QWORD v14[4];
  PKPencilDevice *v15;
  _QWORD handler[5];
  uint8_t buf[8];
  objc_super v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)PKPencilDevice;
  v2 = -[PKPencilDevice init](&v18, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_rollSupportState = 0;
    v4 = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    v3->_stylusHidManager = v4;
    if (v4)
    {
      v5 = v4;
      v6 = os_log_create("com.apple.pencilkit", "PencilDevice");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE213000, v6, OS_LOG_TYPE_DEFAULT, "Created stylus HID manager.", buf, 2u);
      }

      v19[0] = CFSTR("PrimaryUsagePage");
      v19[1] = CFSTR("PrimaryUsage");
      v20[0] = &unk_1E77EB910;
      v20[1] = &unk_1E77EB928;
      v19[2] = CFSTR("ProductIDArray");
      v20[2] = &unk_1E77EC970;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
      v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
      IOHIDManagerSetDeviceMatching(v3->_stylusHidManager, v7);
      stylusHidManager = v3->_stylusHidManager;
      hidQueue();
      v9 = objc_claimAutoreleasedReturnValue();
      IOHIDManagerSetDispatchQueue(stylusHidManager, v9);

      IOHIDManagerRegisterDeviceMatchingCallback(v3->_stylusHidManager, (IOHIDDeviceCallback)stylusDeviceAddedCallback, v3);
      IOHIDManagerRegisterDeviceRemovalCallback(v3->_stylusHidManager, (IOHIDDeviceCallback)stylusDeviceRemovedCallback, v3);
      v10 = MEMORY[0x1E0C809B0];
      v11 = v3->_stylusHidManager;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __22__PKPencilDevice_init__block_invoke;
      handler[3] = &__block_descriptor_40_e5_v8__0l;
      handler[4] = v5;
      IOHIDManagerSetCancelHandler(v11, handler);
      hidQueue();
      v12 = objc_claimAutoreleasedReturnValue();
      v14[0] = v10;
      v14[1] = 3221225472;
      v14[2] = __22__PKPencilDevice_init__block_invoke_2;
      v14[3] = &unk_1E7778020;
      v15 = v3;
      dispatch_async(v12, v14);

    }
  }
  return v3;
}

void __22__PKPencilDevice_init__block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __22__PKPencilDevice_init__block_invoke_2(uint64_t a1)
{
  IOHIDManagerActivate(*(IOHIDManagerRef *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)dealloc
{
  __IOHIDManager *stylusHidManager;
  NSObject *v4;
  objc_super v5;
  _QWORD block[5];

  stylusHidManager = self->_stylusHidManager;
  if (stylusHidManager)
  {
    hidQueue();
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __25__PKPencilDevice_dealloc__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = stylusHidManager;
    dispatch_async(v4, block);

  }
  v5.receiver = self;
  v5.super_class = (Class)PKPencilDevice;
  -[PKPencilDevice dealloc](&v5, sel_dealloc);
}

void __25__PKPencilDevice_dealloc__block_invoke(uint64_t a1)
{
  IOHIDManagerCancel(*(IOHIDManagerRef *)(a1 + 32));
}

- (void)checkIfRollIsSupported:(uint64_t)a1
{
  void (**v3)(id, BOOL);
  int v4;
  NSObject *v5;
  NSObject *v6;
  void (**v7)(id, BOOL);
  _QWORD v8[4];
  void (**v9)(id, BOOL);
  BOOL v10;
  _QWORD block[5];
  void (**v12)(id, BOOL);
  uint8_t buf[16];

  v3 = a2;
  if (a1)
  {
    v4 = *(_DWORD *)(a1 + 36);
    if (v4)
    {
      if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      {
        v3[2](v3, v4 == 1);
        goto LABEL_10;
      }
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __41__PKPencilDevice_checkIfRollIsSupported___block_invoke_2;
      v8[3] = &unk_1E7778AC8;
      v9 = v3;
      v10 = v4 == 1;
      dispatch_async(MEMORY[0x1E0C80D38], v8);
      v7 = v9;
    }
    else
    {
      v5 = os_log_create("com.apple.pencilkit", "PencilDevice");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE213000, v5, OS_LOG_TYPE_DEFAULT, "Checking if roll is supported.", buf, 2u);
      }

      dispatch_get_global_queue(25, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __41__PKPencilDevice_checkIfRollIsSupported___block_invoke;
      block[3] = &unk_1E7778AA0;
      block[4] = a1;
      v12 = v3;
      dispatch_async(v6, block);

      v7 = v12;
    }

  }
LABEL_10:

}

void __41__PKPencilDevice_checkIfRollIsSupported___block_invoke(uint64_t a1)
{
  int IsRollSupported;
  NSObject *v3;
  void *v4;
  _QWORD block[5];
  id v6;
  char v7;
  uint8_t buf[4];
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (+[PKHoverSettings isHoverActive](PKHoverSettings, "isHoverActive")
    && +[PKHoverSettings isHoverEnabled](PKHoverSettings, "isHoverEnabled"))
  {
    IsRollSupported = PKQueryIsRollSupported();
  }
  else
  {
    IsRollSupported = 0;
  }
  v3 = os_log_create("com.apple.pencilkit", "PencilDevice");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v9 = IsRollSupported;
    _os_log_impl(&dword_1BE213000, v3, OS_LOG_TYPE_DEFAULT, "Found roll supported: %d.", buf, 8u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PKPencilDevice_checkIfRollIsSupported___block_invoke_18;
  block[3] = &unk_1E7778A78;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = IsRollSupported;
  v6 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __41__PKPencilDevice_checkIfRollIsSupported___block_invoke_18(uint64_t a1)
{
  int v1;

  if (*(_BYTE *)(a1 + 48))
    v1 = 1;
  else
    v1 = 2;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36) = v1;
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

uint64_t __41__PKPencilDevice_checkIfRollIsSupported___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (double)baseRollAngle
{
  os_unfair_lock_s *v2;
  double v3;

  if (!a1)
    return 0.0;
  v2 = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  v3 = *(double *)(a1 + 40);
  os_unfair_lock_unlock(v2);
  return v3;
}

+ (id)squeezeThreshold
{
  uint64_t v0;
  __IOHIDEventSystemClient *v1;
  void *v2;
  const __CFArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v0 = IOHIDEventSystemClientCreateWithType();
  if (v0)
  {
    v1 = (__IOHIDEventSystemClient *)v0;
    v15[0] = CFSTR("PrimaryUsagePage");
    v15[1] = CFSTR("PrimaryUsage");
    v16[0] = &unk_1E77EB9A0;
    v16[1] = &unk_1E77EB9B8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    IOHIDEventSystemClientSetMatching();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = IOHIDEventSystemClientCopyServices(v1);
    v4 = -[__CFArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
LABEL_4:
      v7 = 0;
      while (1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)IOHIDServiceClientCopyProperty(*(IOHIDServiceClientRef *)(*((_QWORD *)&v10 + 1) + 8 * v7), CFSTR("SqueezeThreshold"));
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;

        if (v5 == ++v7)
        {
          v5 = -[__CFArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          if (v5)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      v8 = 0;
    }

    CFRelease(v1);
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end
