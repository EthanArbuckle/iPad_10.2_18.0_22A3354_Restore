@implementation AVOutputDeviceScreenInfo

- (AVOutputDeviceScreenInfo)initWithDict:(id)a3
{
  AVOutputDeviceScreenInfo *v4;
  void *v5;
  const __CFDictionary *v6;
  void *v7;
  const __CFDictionary *v8;
  void *v9;
  const __CFDictionary *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  _BOOL8 v19;
  _BOOL8 v20;
  uint64_t v21;
  AVOutputDeviceViewAreaInfo *v22;
  AVOutputDeviceScreenInfo *v23;
  id v25;
  AVOutputDeviceScreenInfo *v26;
  id obj;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  objc_super v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  CGSize size;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v33.receiver = self;
  v33.super_class = (Class)AVOutputDeviceScreenInfo;
  v4 = -[AVOutputDeviceScreenInfo init](&v33, sel_init);
  if (v4)
  {
    v4->_ID = (NSString *)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA4588]), "copy");
    v4->_inputCapabilities = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA4598]), "copy");
    v4->_limitedUI = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA45A0]), "BOOLValue");
    v4->_limitedUIElements = (NSArray *)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA45B0]), "copy");
    v4->_nightMode = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA45A8]), "BOOLValue");
    v4->_maxFPS = (NSNumber *)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA45B8]), "copy");
    v5 = (void *)MEMORY[0x1E0CB3B18];
    v6 = (const __CFDictionary *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA45C0]);
    size.width = 0.0;
    size.height = 0.0;
    if (!CGSizeMakeWithDictionaryRepresentation(v6, &size))
      size = (CGSize)*MEMORY[0x1E0C9D820];
    v4->_physicalSize = (NSValue *)(id)objc_msgSend(v5, "valueWithSize:", size.width, size.height);
    v7 = (void *)MEMORY[0x1E0CB3B18];
    v8 = (const __CFDictionary *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA45C8]);
    size.width = 0.0;
    size.height = 0.0;
    if (!CGSizeMakeWithDictionaryRepresentation(v8, &size))
      size = (CGSize)*MEMORY[0x1E0C9D820];
    v4->_pixelSize = (NSValue *)(id)objc_msgSend(v7, "valueWithSize:", size.width, size.height);
    v9 = (void *)MEMORY[0x1E0CB3B18];
    v10 = (const __CFDictionary *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA45D8]);
    size.width = 0.0;
    size.height = 0.0;
    if (!CGSizeMakeWithDictionaryRepresentation(v10, &size))
      size = (CGSize)*MEMORY[0x1E0C9D820];
    v4->_squarePixelSize = (NSValue *)(id)objc_msgSend(v9, "valueWithSize:", size.width, size.height);
    v4->_viewHeightScaleFactor = (NSNumber *)(id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA45E8]);
    v4->_primaryInputDevice = (NSString *)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA45D0]), "copy");
    v26 = v4;
    v4->_cornerMasks = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA4580]), "BOOLValue");
    v25 = a3;
    v11 = (void *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA45E0]);
    v32 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v11;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v34, &size, 16);
    if (v12)
    {
      v13 = v12;
      v31 = *(_QWORD *)v35;
      v29 = *MEMORY[0x1E0CA4610];
      v30 = *MEMORY[0x1E0CA4600];
      v28 = *MEMORY[0x1E0CA4608];
      v14 = *MEMORY[0x1E0CA45F8];
      v15 = *MEMORY[0x1E0CA45F0];
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v35 != v31)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v18 = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", AVOutputDeviceViewAreaInfoNSRectFromDictionary((const __CFDictionary *)objc_msgSend(v17, "objectForKey:", v30)));
          v19 = objc_msgSend(v17, "objectForKey:", v29) != 0;
          v20 = objc_msgSend(v17, "objectForKey:", v28) != 0;
          v21 = objc_msgSend(v17, "objectForKey:", v14);
          v22 = -[AVOutputDeviceViewAreaInfo initWithViewArea:transitionControl:supportsFocusTransfer:statusBarEdge:safeArea:]([AVOutputDeviceViewAreaInfo alloc], "initWithViewArea:transitionControl:supportsFocusTransfer:statusBarEdge:safeArea:", v18, v19, v20, v21, objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", AVOutputDeviceViewAreaInfoNSRectFromDictionary((const __CFDictionary *)objc_msgSend(v17, "objectForKey:", v15))));
          objc_msgSend(v32, "addObject:", v22);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, &size, 16);
      }
      while (v13);
    }
    v4 = v26;
    v26->_viewAreas = (NSArray *)v32;
    v26->_applicationURL = (NSURL *)(id)objc_msgSend(v25, "objectForKey:", *MEMORY[0x1E0CA4578]);
    v26->_initialApplicationURL = (NSURL *)(id)objc_msgSend(v25, "objectForKey:", *MEMORY[0x1E0CA4590]);
    v23 = v26;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVOutputDeviceScreenInfo;
  -[AVOutputDeviceScreenInfo dealloc](&v3, sel_dealloc);
}

- (NSString)ID
{
  return self->_ID;
}

- (NSArray)inputCapabilities
{
  return self->_inputCapabilities;
}

- (BOOL)isLimitedUI
{
  return self->_limitedUI;
}

- (NSArray)limitedUIElements
{
  return self->_limitedUIElements;
}

- (BOOL)isNightMode
{
  return self->_nightMode;
}

- (NSNumber)maxFPS
{
  return self->_maxFPS;
}

- (NSValue)physicalSize
{
  return self->_physicalSize;
}

- (NSValue)pixelSize
{
  return self->_pixelSize;
}

- (NSNumber)viewHeightScaleFactor
{
  return self->_viewHeightScaleFactor;
}

- (NSValue)squarePixelSize
{
  return self->_squarePixelSize;
}

- (NSString)primaryInputDevice
{
  return self->_primaryInputDevice;
}

- (BOOL)cornerMasks
{
  return self->_cornerMasks;
}

- (NSArray)viewAreas
{
  return self->_viewAreas;
}

- (NSURL)applicationURL
{
  return self->_applicationURL;
}

- (NSURL)initialApplicationURL
{
  return self->_initialApplicationURL;
}

@end
