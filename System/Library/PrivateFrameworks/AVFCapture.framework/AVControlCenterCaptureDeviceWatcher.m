@implementation AVControlCenterCaptureDeviceWatcher

- (BOOL)studioLightingSupported
{
  return self->_studioLightingSupported;
}

- (BOOL)reactionEffectsSupported
{
  return self->_reactionEffectsSupported;
}

- (BOOL)micModesSupported
{
  return self->_micModesSupported;
}

- (BOOL)centerStageSupported
{
  return self->_centerStageSupported;
}

- (BOOL)backgroundBlurSupported
{
  return self->_backgroundBlurSupported;
}

- (AVControlCenterCaptureDeviceWatcher)initWithSupportedVideoEffectsDidChangeHandler:(id)a3
{
  AVControlCenterCaptureDeviceWatcher *v4;
  uint64_t v5;
  uint64_t v6;
  AVCaptureDeviceDiscoverySession *v7;
  objc_super v9;
  const __CFString *v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)AVControlCenterCaptureDeviceWatcher;
  v4 = -[AVControlCenterCaptureDeviceWatcher init](&v9, sel_init);
  if (v4)
  {
    v4->_handler = (id)objc_msgSend(a3, "copy");
    if ((id)MGCopyAnswer() == (id)*MEMORY[0x1E0C9AE50])
    {
      v11[0] = CFSTR("AVCaptureDeviceTypeBuiltInWideAngleCamera");
      v11[1] = CFSTR("AVCaptureDeviceTypeExternal");
      v5 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
      v6 = 0;
    }
    else
    {
      v10 = CFSTR("AVCaptureDeviceTypeBuiltInWideAngleCamera");
      v5 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
      v6 = 2;
    }
    v7 = +[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:mediaType:position:](AVCaptureDeviceDiscoverySession, "discoverySessionWithDeviceTypes:mediaType:position:", v5, *MEMORY[0x1E0CF2B90], v6);
    v4->_discoverySession = v7;
    -[AVCaptureDeviceDiscoverySession addObserver:forKeyPath:options:context:](v7, "addObserver:forKeyPath:options:context:", v4, CFSTR("devices"), 5, AVCCM_CaptureDeviceListChangedContext);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[AVCaptureDeviceDiscoverySession removeObserver:forKeyPath:context:](self->_discoverySession, "removeObserver:forKeyPath:context:", self, CFSTR("devices"), AVCCM_CaptureDeviceListChangedContext);

  v3.receiver = self;
  v3.super_class = (Class)AVControlCenterCaptureDeviceWatcher;
  -[AVControlCenterCaptureDeviceWatcher dealloc](&v3, sel_dealloc);
}

- (BOOL)backgroundReplacementSupported
{
  return self->_backgroundReplacementSupported;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v6;
  char v7;
  char v8;
  char v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id obj;
  uint64_t v21;
  uint64_t v22;
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
  if ((void *)AVCCM_CaptureDeviceListChangedContext == a6)
  {
    v6 = (void *)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8], a4);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = v6;
    v22 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    if (!v22)
      goto LABEL_25;
    v21 = *(_QWORD *)v28;
    while (1)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v11);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        v13 = (void *)objc_msgSend(v12, "formats");
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v24;
          do
          {
            v17 = 0;
            do
            {
              if (*(_QWORD *)v24 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v17);
              if ((v10 & 1) != 0)
              {
                v10 = 1;
                if ((v9 & 1) == 0)
                  goto LABEL_14;
              }
              else
              {
                v10 = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v17), "isCenterStageSupported");
                if ((v9 & 1) == 0)
                {
LABEL_14:
                  v9 = objc_msgSend(v18, "isBackgroundBlurSupported");
                  if ((v7 & 1) == 0)
                    goto LABEL_15;
                  goto LABEL_19;
                }
              }
              v9 = 1;
              if ((v7 & 1) == 0)
              {
LABEL_15:
                v7 = objc_msgSend(v18, "isStudioLightSupported");
                if ((v8 & 1) == 0)
                  goto LABEL_16;
                goto LABEL_20;
              }
LABEL_19:
              v7 = 1;
              if ((v8 & 1) == 0)
              {
LABEL_16:
                v8 = objc_msgSend(v18, "reactionEffectsSupported");
                goto LABEL_21;
              }
LABEL_20:
              v8 = 1;
LABEL_21:
              ++v17;
            }
            while (v15 != v17);
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
          }
          while (v15);
        }
        ++v11;
      }
      while (v11 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      if (!v22)
      {
LABEL_25:
        self->_centerStageSupported = v10 & 1;
        self->_backgroundBlurSupported = v9 & 1;
        self->_studioLightingSupported = v7 & 1;
        self->_reactionEffectsSupported = v8 & 1;
        self->_backgroundReplacementSupported = 0;
        (*((void (**)(void))self->_handler + 2))();
        return;
      }
    }
  }
}

@end
