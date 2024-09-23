@implementation AVExternalDevice

+ (id)currentExternalDevice
{
  return +[AVExternalDevice currentCarPlayExternalDevice](AVExternalDevice, "currentCarPlayExternalDevice");
}

+ (id)currentCarPlayExternalDevice
{
  FigEndpointCopyActiveEndpointOfType();
  return 0;
}

+ (id)sharedLocalDevice
{
  return -[AVExternalDevice initWithFigEndpoint:]([AVExternalDevice alloc], "initWithFigEndpoint:", 0);
}

- (AVExternalDevice)init
{
  AVExternalDevice *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVExternalDevice;
  v2 = -[AVExternalDevice init](&v4, sel_init);
  if (v2)
  {
    v2->_externalDevice = objc_alloc_init(AVExternalDeviceInternal);
    v2->_externalDevice->_weakReference = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v2);
    v2->_externalDevice->_currentViewAreas = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v2;
}

- (AVExternalDevice)initWithFigEndpoint:(OpaqueFigEndpoint *)a3
{
  AVExternalDevice *v4;
  OpaqueFigEndpoint *v5;
  NSObject *v6;
  NSObject *v7;
  AVExternalDevice *v8;
  NSObject *viewAreasQueue;
  _QWORD block[5];

  v4 = -[AVExternalDevice init](self, "init");
  if (v4)
  {
    v4->_externalDevice->_makeHIDsOnlyOnce = objc_alloc_init(AVDispatchOnce);
    v4->_externalDevice->_makeIconsOnlyOnce = objc_alloc_init(AVDispatchOnce);
    if (a3)
      v5 = (OpaqueFigEndpoint *)CFRetain(a3);
    else
      v5 = 0;
    v4->_externalDevice->_figEndpoint = v5;
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4->_externalDevice->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVFoundation.AVExternalDevice", v6);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4->_externalDevice->_viewAreasQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVFoundation.AVExternalDevice.ViewAreas", v7);
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListeners();
    v8 = v4;
    viewAreasQueue = v4->_externalDevice->_viewAreasQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__AVExternalDevice_initWithFigEndpoint___block_invoke;
    block[3] = &unk_1E302FA10;
    block[4] = v4;
    dispatch_async(viewAreasQueue, block);
  }
  return v4;
}

void __40__AVExternalDevice_initWithFigEndpoint___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t *);
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "screenIDs", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8);
        if (v7)
        {
          v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
          FigEndpointExtendedGetClassID();
          if (CMBaseObjectIsMemberOfClass())
          {
            v9 = *(void (**)(uint64_t, uint64_t, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 120);
            if (v9)
              v9(v7, v8, &v14);
            if (v14)
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 88), "setObject:forKeyedSubscript:", v14, v8);
          }
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v4);
  }

}

- (id)_weakReference
{
  return self->_externalDevice->_weakReference;
}

- (void)dealloc
{
  AVExternalDeviceInternal *externalDevice;
  AVExternalDeviceInternal *v4;
  OpaqueFigEndpoint *figEndpoint;
  dispatch_object_t *v6;
  objc_super v7;

  externalDevice = self->_externalDevice;
  if (externalDevice)
  {

    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterRemoveWeakListeners();
    v4 = self->_externalDevice;
    figEndpoint = v4->_figEndpoint;
    if (figEndpoint)
    {
      CFRelease(figEndpoint);
      self->_externalDevice->_figEndpoint = 0;
      v4 = self->_externalDevice;
    }

    v6 = (dispatch_object_t *)self->_externalDevice;
    if (v6[7])
    {
      dispatch_release(v6[7]);
      self->_externalDevice->_queue = 0;
      v6 = (dispatch_object_t *)self->_externalDevice;
    }
    if (v6[10])
    {
      dispatch_release(v6[10]);
      self->_externalDevice->_viewAreasQueue = 0;
      v6 = (dispatch_object_t *)self->_externalDevice;
    }
    CFRelease(v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)AVExternalDevice;
  -[AVExternalDevice dealloc](&v7, sel_dealloc);
}

- (AVExternalDeviceDelegate)delegate
{
  return self->_externalDevice->_delegate;
}

- (void)setDelegate:(id)a3
{
  AVExternalDeviceInternal *externalDevice;
  AVExternalDevice *v6;
  NSObject *viewAreasQueue;
  _QWORD v8[6];

  externalDevice = self->_externalDevice;
  if (externalDevice->_delegate != a3)
  {
    externalDevice->_delegate = (AVExternalDeviceDelegate *)a3;
    v6 = self;
    viewAreasQueue = self->_externalDevice->_viewAreasQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __32__AVExternalDevice_setDelegate___block_invoke;
    v8[3] = &unk_1E302FCE8;
    v8[4] = a3;
    v8[5] = self;
    dispatch_async(viewAreasQueue, v8);
  }
}

void __32__AVExternalDevice_setDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v11 = 0u;
      v12 = 0u;
      v9 = 0u;
      v10 = 0u;
      v2 = (void *)objc_msgSend(*(id *)(a1 + 40), "screenIDs", 0);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
      {
        v4 = v3;
        v5 = *(_QWORD *)v10;
        do
        {
          for (i = 0; i != v4; ++i)
          {
            if (*(_QWORD *)v10 != v5)
              objc_enumerationMutation(v2);
            v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
            v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 88), "objectForKeyedSubscript:", v7);
            if (v8)
              objc_msgSend(*(id *)(a1 + 32), "setViewAreaIndex:andAdjacentViewAreas:forScreenID:", objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("viewAreaIndex")), "integerValue"), objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("adjacentViewAreas")), v7);
          }
          v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        }
        while (v4);
      }
    }
  }

}

- (id)_figEndpointPropertyValueForKey:(__CFString *)a3
{
  OpaqueFigEndpoint *figEndpoint;
  uint64_t CMBaseObject;
  void (*v6)(uint64_t, __CFString *, _QWORD, OpaqueFigEndpoint **);
  OpaqueFigEndpoint *v8;

  v8 = 0;
  figEndpoint = self->_externalDevice->_figEndpoint;
  if (figEndpoint)
  {
    CMBaseObject = FigEndpointGetCMBaseObject();
    v6 = *(void (**)(uint64_t, __CFString *, _QWORD, OpaqueFigEndpoint **))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                + 8)
                                                                                    + 48);
    if (v6)
    {
      v6(CMBaseObject, a3, *MEMORY[0x1E0C9AE00], &v8);
      figEndpoint = v8;
    }
    else
    {
      figEndpoint = 0;
    }
  }
  return figEndpoint;
}

- (id)_screenInfo
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_externalDevice->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__AVExternalDevice__screenInfo__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_sync(queue, block);
  return self->_externalDevice->_screenInfo;
}

_QWORD *__31__AVExternalDevice__screenInfo__block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (!*(_QWORD *)(result[1] + 72))
  {
    result = (_QWORD *)objc_msgSend((id)objc_msgSend(result, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA43A0]), "copy");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 72) = result;
  }
  return result;
}

- (NSArray)screenIDs
{
  NSArray *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (NSArray *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = -[AVExternalDevice _screenInfo](self, "_screenInfo");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    v8 = *MEMORY[0x1E0CA4588];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "objectForKey:", v8);
        if (v10)
          -[NSArray addObject:](v3, "addObject:", v10);
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  return v3;
}

- (NSDictionary)screenViewAreas
{
  NSDictionary *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  id v15;
  id obj;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CGRect rect;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = -[AVExternalDevice _screenInfo](self, "_screenInfo");
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v28;
    v19 = *MEMORY[0x1E0CA4588];
    v18 = *MEMORY[0x1E0CA45E0];
    v4 = *MEMORY[0x1E0CA4600];
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "objectForKey:", v19);
        if (v7)
        {
          v8 = v7;
          -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"), v7);
          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          v9 = (void *)objc_msgSend(v6, "objectForKey:", v18);
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v24;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v24 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
                memset(&rect, 0, sizeof(rect));
                CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v14, "objectForKeyedSubscript:", v4), &rect);
                v15 = -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v8);
                objc_msgSend(v15, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height));
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v11);
          }
        }
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v21);
  }
  return v3;
}

- (NSDictionary)screenSafeAreas
{
  NSDictionary *v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  id v15;
  id obj;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CGRect rect;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = -[AVExternalDevice _screenInfo](self, "_screenInfo");
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v21)
  {
    v20 = *(_QWORD *)v28;
    v19 = *MEMORY[0x1E0CA4588];
    v18 = *MEMORY[0x1E0CA45E0];
    v4 = *MEMORY[0x1E0CA45F0];
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v7 = objc_msgSend(v6, "objectForKey:", v19);
        if (v7)
        {
          v8 = v7;
          -[NSDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99DE8], "array"), v7);
          v25 = 0u;
          v26 = 0u;
          v23 = 0u;
          v24 = 0u;
          v9 = (void *)objc_msgSend(v6, "objectForKey:", v18);
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v24;
            do
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v24 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
                memset(&rect, 0, sizeof(rect));
                CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v14, "objectForKeyedSubscript:", v4), &rect);
                v15 = -[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", v8);
                objc_msgSend(v15, "addObject:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", rect.origin.x, rect.origin.y, rect.size.width, rect.size.height));
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
            }
            while (v11);
          }
        }
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v21);
  }
  return v3;
}

- (NSString)ID
{
  return (NSString *)-[AVExternalDevice _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4258]);
}

- (NSString)name
{
  if (self->_externalDevice->_figEndpoint)
    return (NSString *)-[AVExternalDevice _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4348]);
  else
    return (NSString *)CFSTR("My Device");
}

- (NSDictionary)screenInputCapabilities
{
  NSDictionary *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = -[AVExternalDevice _screenInfo](self, "_screenInfo");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = *MEMORY[0x1E0CA4588];
    v9 = *MEMORY[0x1E0CA4598];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "objectForKey:", v8);
        v13 = objc_msgSend(v11, "objectForKey:", v9);
        if (v12)
          v14 = v13 == 0;
        else
          v14 = 1;
        if (!v14)
          -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v13, v12);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  return v3;
}

- (NSDictionary)screenPrimaryInputDevices
{
  NSDictionary *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (NSDictionary *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = -[AVExternalDevice _screenInfo](self, "_screenInfo");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = *MEMORY[0x1E0CA45D0];
    v9 = *MEMORY[0x1E0CA4588];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "objectForKey:", v8);
        if (v12)
          -[NSDictionary setObject:forKey:](v3, "setObject:forKey:", v12, objc_msgSend(v11, "objectForKey:", v9));
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  return v3;
}

- (NSArray)externalDeviceHIDs
{
  AVDispatchOnce *makeHIDsOnlyOnce;
  _QWORD v5[5];

  makeHIDsOnlyOnce = self->_externalDevice->_makeHIDsOnlyOnce;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__AVExternalDevice_externalDeviceHIDs__block_invoke;
  v5[3] = &unk_1E302FA10;
  v5[4] = self;
  -[AVDispatchOnce runBlockOnce:](makeHIDsOnlyOnce, "runBlockOnce:", v5);
  return self->_externalDevice->_HIDs;
}

uint64_t __38__AVExternalDevice_externalDeviceHIDs__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AVExternalDeviceHID *v8;
  AVExternalDeviceHID *v9;
  uint64_t result;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4230]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = -[AVExternalDeviceHID initWithExternalDeviceAndHIDDictionary:hidDictionary:]([AVExternalDeviceHID alloc], "initWithExternalDeviceAndHIDDictionary:hidDictionary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
        if (v8)
        {
          v9 = v8;
          objc_msgSend(v2, "addObject:", v8);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  result = objc_msgSend(v2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = result;
  return result;
}

- (id)externalDeviceHIDWithUUID:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = -[AVExternalDevice externalDeviceHIDs](self, "externalDeviceHIDs");
  if (!v4)
    return 0;
  v5 = v4;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = *(_QWORD *)v13;
LABEL_4:
  v9 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v8)
      objc_enumerationMutation(v5);
    v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
    if ((objc_msgSend((id)objc_msgSend(v10, "UUID"), "isEqualToString:", a3) & 1) != 0)
      return v10;
    if (v7 == ++v9)
    {
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v10 = 0;
      if (v7)
        goto LABEL_4;
      return v10;
    }
  }
}

- (NSData)OEMIcon
{
  NSArray *v2;
  NSData *result;
  NSData *v4;
  uint64_t v5;
  NSData *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = -[AVExternalDevice OEMIcons](self, "OEMIcons");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  result = (NSData *)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v6);
        if ((objc_msgSend(v7, "isPrerendered") & 1) == 0)
          return (NSData *)objc_msgSend(v7, "imageData");
        v6 = (NSData *)((char *)v6 + 1);
      }
      while (v4 != v6);
      result = (NSData *)-[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (NSArray)OEMIcons
{
  AVDispatchOnce *makeIconsOnlyOnce;
  _QWORD v5[5];

  makeIconsOnlyOnce = self->_externalDevice->_makeIconsOnlyOnce;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__AVExternalDevice_OEMIcons__block_invoke;
  v5[3] = &unk_1E302FA10;
  v5[4] = self;
  -[AVDispatchOnce runBlockOnce:](makeIconsOnlyOnce, "runBlockOnce:", v5);
  return self->_externalDevice->_oemIcons;
}

uint64_t __28__AVExternalDevice_OEMIcons__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AVExternalDeviceIcon *v8;
  uint64_t result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_msgSend(*(id *)(a1 + 32), "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4368]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = -[AVExternalDeviceIcon initWithDictionary:]([AVExternalDeviceIcon alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
        if (v8)
          objc_msgSend(v2, "addObject:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  result = objc_msgSend(v2, "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64) = result;
  return result;
}

- (NSString)OEMIconLabel
{
  return (NSString *)-[AVExternalDevice _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4358]);
}

- (BOOL)OEMIconVisible
{
  return objc_msgSend(-[AVExternalDevice _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4360]), "BOOLValue");
}

- (NSString)modelName
{
  return (NSString *)-[AVExternalDevice _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4338]);
}

- (BOOL)nightMode
{
  id v2;

  v2 = -[AVExternalDevice _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4350]);
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "BOOLValue");
  return (char)v2;
}

- (BOOL)nightModeSupported
{
  return -[AVExternalDevice _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4350]) != 0;
}

- (BOOL)rightHandDrive
{
  id v2;

  v2 = -[AVExternalDevice _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4390]);
  if (v2)
    LOBYTE(v2) = objc_msgSend(v2, "BOOLValue");
  return (char)v2;
}

- (NSArray)limitedUIElements
{
  NSArray *result;

  result = -[AVExternalDevice _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4300]);
  if (!result)
    return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "array");
  return result;
}

- (BOOL)limitedUI
{
  return objc_msgSend(-[AVExternalDevice _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA42F8]), "BOOLValue");
}

- (BOOL)ownsTurnByTurnNavigation
{
  return objc_msgSend(-[AVExternalDevice _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4148]), "BOOLValue");
}

- (BOOL)ownsScreen
{
  return objc_msgSend(-[AVExternalDevice _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4160]), "BOOLValue");
}

- (BOOL)recognizingSpeech
{
  return objc_msgSend(-[AVExternalDevice _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4150]), "BOOLValue");
}

- (NSArray)supportedFeatures
{
  return (NSArray *)-[AVExternalDevice _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA41D0]);
}

- (int64_t)electronicTollCollection
{
  id v2;
  void *v3;

  v2 = -[AVExternalDevice _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4490]);
  if (!v2)
    return 1;
  v3 = (void *)objc_msgSend(v2, "valueForKey:", *MEMORY[0x1E0CA49B0]);
  if (!v3)
    return 1;
  if (objc_msgSend((id)objc_msgSend(v3, "valueForKey:", CFSTR("active")), "BOOLValue"))
    return 2;
  return 3;
}

- (int64_t)navigationAidedDriving
{
  id v2;
  void *v3;

  v2 = -[AVExternalDevice _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4490]);
  if (!v2)
    return 1;
  v3 = (void *)objc_msgSend(v2, "valueForKey:", *MEMORY[0x1E0CA49B8]);
  if (!v3)
    return 1;
  if (objc_msgSend((id)objc_msgSend(v3, "valueForKey:", CFSTR("active")), "BOOLValue"))
    return 2;
  return 3;
}

- (int64_t)transportType
{
  id v2;
  void *v3;

  v2 = -[AVExternalDevice _figEndpointPropertyValueForKey:](self, "_figEndpointPropertyValueForKey:", *MEMORY[0x1E0CA4460]);
  if (!v2)
    return 0;
  v3 = v2;
  if ((objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CA4940]) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA4958]) & 1) != 0)
  {
    return 3;
  }
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA4948]) & 1) != 0)
    return 2;
  return (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CA4950]) & 1) != 0;
}

- (NSData)MFiCertificateSerialNumber
{
  NSObject *queue;
  id v3;
  NSData *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__42;
  v11 = __Block_byref_object_dispose__42;
  v12 = 0;
  queue = self->_externalDevice->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__AVExternalDevice_MFiCertificateSerialNumber__block_invoke;
  v6[3] = &unk_1E302FDB0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v3 = (id)v8[5];
  if (!v3)
  {
    v3 = (id)objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v8[5] = (uint64_t)v3;
  }
  v4 = (NSData *)v3;
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __46__AVExternalDevice_MFiCertificateSerialNumber__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t CMBaseObject;
  void (*v4)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD, _QWORD, uint64_t *);
  id result;
  uint64_t v8;
  CFTypeRef cf;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
  if (!v2)
  {
    v8 = 0;
    cf = 0;
    CMBaseObject = FigEndpointGetCMBaseObject();
    v4 = *(void (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v4)
      v4(CMBaseObject, *MEMORY[0x1E0CA4120], 0, &cf);
    if (FigCFEqual() || FigCFEqual())
    {
      v5 = FigEndpointGetCMBaseObject();
      v6 = *(void (**)(uint64_t, _QWORD, _QWORD, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
      if (v6)
      {
        v6(v5, *MEMORY[0x1E0CA4118], 0, &v8);
        if (v8)
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = v8;
      }
    }
    if (cf)
      CFRelease(cf);
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48);
  }
  result = v2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)requestCarUI
{
  -[AVExternalDevice requestCarUIForURL:withUUID:](self, "requestCarUIForURL:withUUID:", 0, 0);
}

- (void)requestCarUIForURL:(id)a3
{
  -[AVExternalDevice requestCarUIForURL:withUUID:](self, "requestCarUIForURL:withUUID:", a3, 0);
}

- (void)requestCarUIForURL:(id)a3 withUUID:(id)a4
{
  OpaqueFigEndpoint *figEndpoint;
  void (*v7)(OpaqueFigEndpoint *, id, id);

  figEndpoint = self->_externalDevice->_figEndpoint;
  if (figEndpoint)
  {
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass())
    {
      v7 = *(void (**)(OpaqueFigEndpoint *, id, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 8);
      if (v7)
        v7(figEndpoint, a4, a3);
    }
  }
}

- (void)requestViewArea:(int64_t)a3 forScreenID:(id)a4
{
  OpaqueFigEndpoint *figEndpoint;
  void (*v7)(OpaqueFigEndpoint *, id, int64_t);

  figEndpoint = self->_externalDevice->_figEndpoint;
  if (figEndpoint)
  {
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass())
    {
      v7 = *(void (**)(OpaqueFigEndpoint *, id, int64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 24)
                                                                          + 112);
      if (v7)
        v7(figEndpoint, a4, a3);
    }
  }
}

- (id)requestTurnByTurnNavigationOwnership
{
  return -[AVExternalDeviceTurnByTurnToken initWithExternalDevice:]([AVExternalDeviceTurnByTurnToken alloc], "initWithExternalDevice:", self);
}

- (id)borrowScreenForClient:(id)a3 reason:(id)a4
{
  return -[AVExternalDeviceScreenBorrowToken initWithExternalDevice:client:reason:]([AVExternalDeviceScreenBorrowToken alloc], "initWithExternalDevice:client:reason:", self, a3, a4);
}

- (void)takeScreenForClient:(id)a3 reason:(id)a4
{
  OpaqueFigEndpoint *figEndpoint;
  void (*v7)(OpaqueFigEndpoint *, id, id);

  figEndpoint = self->_externalDevice->_figEndpoint;
  if (figEndpoint)
  {
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass())
    {
      v7 = *(void (**)(OpaqueFigEndpoint *, id, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 32);
      if (v7)
        v7(figEndpoint, a3, a4);
    }
  }
}

- (void)takeScreenForConnection
{
  OpaqueFigEndpoint *figEndpoint;
  void (*v3)(OpaqueFigEndpoint *, const __CFString *, const __CFString *);

  figEndpoint = self->_externalDevice->_figEndpoint;
  if (figEndpoint)
  {
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass())
    {
      v3 = *(void (**)(OpaqueFigEndpoint *, const __CFString *, const __CFString *))(*(_QWORD *)(CMBaseObjectGetVTable() + 24)
                                                                                              + 32);
      if (v3)
        v3(figEndpoint, CFSTR("com.apple.springboard"), CFSTR("InitialCarPlayConnection"));
    }
  }
}

- (void)sendCommand:(id)a3 withParameters:(id)a4
{
  OpaqueFigEndpoint *figEndpoint;
  void (*v7)(OpaqueFigEndpoint *, id, id, _QWORD, _QWORD);

  figEndpoint = self->_externalDevice->_figEndpoint;
  if (figEndpoint)
  {
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass())
    {
      v7 = *(void (**)(OpaqueFigEndpoint *, id, id, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 24)
                                                                              + 72);
      if (v7)
        v7(figEndpoint, a3, a4, 0, 0);
    }
  }
}

- (void)_triggerFakeNotificationNamed:(id)a3 withPayload:(id)a4
{
  uint64_t CMBaseObject;
  void (*v7)(uint64_t, const __CFString *, _QWORD);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, const __CFString *, uint64_t);

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("ExternalDevice_ScreenBecameUnavailable")))
  {
    CMBaseObject = FigEndpointGetCMBaseObject();
    v7 = *(void (**)(uint64_t, const __CFString *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v7)
      v7(CMBaseObject, CFSTR("TestTakeScreenAway"), 0);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C99D80];
    if (!a4)
      a4 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v9 = objc_msgSend(v8, "dictionaryWithObjectsAndKeys:", a3, CFSTR("name"), a4, CFSTR("payload"), 0);
    v10 = FigEndpointGetCMBaseObject();
    v11 = *(void (**)(uint64_t, const __CFString *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v11)
      v11(v10, CFSTR("TestNotification"), v9);
  }
}

- (OpaqueFigEndpoint)figEndpoint
{
  return self->_externalDevice->_figEndpoint;
}

@end
