@implementation FigCaptureCMIOExtensionSessionDeviceDelegate

- (void)device:(id)a3 propertiesChanged:(id)a4
{
  uint64_t DerivedStorage;
  os_unfair_lock_s *v7;
  id v8;
  NSObject *global_queue;
  _QWORD block[7];

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v7 = (os_unfair_lock_s *)(DerivedStorage + 28);
  os_unfair_lock_lock((os_unfair_lock_t)(DerivedStorage + 28));
  if (*(_BYTE *)(DerivedStorage + 24))
  {
    os_unfair_lock_unlock(v7);
    v8 = 0;
  }
  else
  {
    v8 = *(id *)DerivedStorage;
    os_unfair_lock_unlock(v7);
    if (v8)
    {
      global_queue = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __73__FigCaptureCMIOExtensionSessionDeviceDelegate_device_propertiesChanged___block_invoke;
      block[3] = &unk_1E491EB90;
      block[4] = a4;
      block[5] = v8;
      block[6] = self;
      dispatch_async(global_queue, block);
    }
  }

}

uint64_t __73__FigCaptureCMIOExtensionSessionDeviceDelegate_device_propertiesChanged___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id obj;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  obj = *(id *)(a1 + 32);
  result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)v11;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v5);
        v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v8 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6), "value");
        if (cmioefcd_devicePropertyChangedNotificationForCMIOExtensionProperty_onceToken == -1)
        {
          if (!v6)
            goto LABEL_11;
        }
        else
        {
          dispatch_once(&cmioefcd_devicePropertyChangedNotificationForCMIOExtensionProperty_onceToken, &__block_literal_global_79);
          if (!v6)
            goto LABEL_11;
        }
        if (objc_msgSend((id)cmioefcd_devicePropertyChangedNotificationForCMIOExtensionProperty_sCMIOExtensionPropertiesToDevicePropertyChangedNotifications, "objectForKeyedSubscript:", v6))
        {
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("Value"));
          FigCaptureDeviceGetNotificationCenter(objc_msgSend(v7, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("UniqueID")));
          goto LABEL_12;
        }
LABEL_11:
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("CMIOExtensionPropertyName"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("CMIOExtensionPropertyValue"));
        FigCaptureDeviceGetNotificationCenter(objc_msgSend(v7, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("UniqueID")));
LABEL_12:
        CMNotificationCenterPostNotification();
        ++v5;
      }
      while (v3 != v5);
      result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v3 = result;
    }
    while (result);
  }
  return result;
}

@end
