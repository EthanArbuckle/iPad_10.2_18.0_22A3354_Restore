@implementation AVCaptureDeviceInput

- (BOOL)isStudioLightingAllowed
{
  return self->_internal->studioLightingAllowed;
}

- (BOOL)isBackgroundBlurAllowed
{
  return self->_internal->backgroundBlurAllowed;
}

- (void)setVideoMinFrameDurationOverride:(CMTime *)videoMinFrameDurationOverride
{
  AVCaptureDeviceInputInternal *internal;
  __int128 v6;
  CMTime v7;
  CMTime time1;

  time1 = (CMTime)self->_internal->videoMinFrameDurationOverride;
  v7 = *videoMinFrameDurationOverride;
  if (CMTimeCompare(&time1, &v7))
  {
    internal = self->_internal;
    v6 = *(_OWORD *)&videoMinFrameDurationOverride->value;
    internal->videoMinFrameDurationOverride.epoch = videoMinFrameDurationOverride->epoch;
    *(_OWORD *)&internal->videoMinFrameDurationOverride.value = v6;
    -[AVCaptureDeviceInput _bumpChangeSeedForFirstPortWithMediaType:](self, "_bumpChangeSeedForFirstPortWithMediaType:", *MEMORY[0x1E0CF2B90]);
    if (objc_msgSend(-[AVCaptureInput session](self, "session"), "isRunning"))
      -[AVCaptureDeviceInput _applyVideoMinFrameDurationOverride](self, "_applyVideoMinFrameDurationOverride");
  }
}

- (void)setSession:(id)a3
{
  id v5;
  objc_super v6;

  if (-[AVCaptureInput session](self, "session"))
  {
    v5 = -[AVCaptureInput session](self, "session");
    objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("running"), AVCaptureSessionRunningChangedContext);
  }
  if (a3)
    objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("running"), 3, AVCaptureSessionRunningChangedContext);
  v6.receiver = self;
  v6.super_class = (Class)AVCaptureDeviceInput;
  -[AVCaptureInput setSession:](&v6, sel_setSession_, a3);
}

- (float)simulatedAperture
{
  return self->_internal->simulatedAperture;
}

- (float)portraitLightingEffectStrength
{
  return self->_internal->portraitLightingEffectStrength;
}

- (int64_t)audioCaptureMode
{
  return SLODWORD(self->_internal->audioCaptureMode);
}

- (OpaqueCMClock)clock
{
  return -[AVCaptureDevice deviceClock](-[AVCaptureDeviceInput device](self, "device"), "deviceClock");
}

- (AVCaptureDevice)device
{
  return self->_internal->device;
}

- (CMTime)videoMinFrameDurationOverride
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(self->epoch + 64);
  return self;
}

- (BOOL)unifiedAutoExposureDefaultsEnabled
{
  return self->_internal->unifiedAutoExposureDefaultsEnabled;
}

- (float)maxGainOverride
{
  return self->_internal->maxGainOverride;
}

+ (AVCaptureDeviceInput)deviceInputWithDevice:(AVCaptureDevice *)device error:(NSError *)outError
{
  return (AVCaptureDeviceInput *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDevice:error:", device, outError);
}

- (AVCaptureDeviceInput)initWithDevice:(AVCaptureDevice *)device error:(NSError *)outError
{
  AVCaptureDeviceInput *v6;
  AVCaptureDeviceInputInternal *v7;
  AVCaptureDevice *v8;
  void *v9;
  float v10;
  AVCaptureDeviceInputInternal *internal;
  _OWORD *v12;
  float v13;
  NSError *v14;
  NSObject *v15;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  objc_super v18;
  uint64_t v19;
  _QWORD v20[21];

  v20[20] = *MEMORY[0x1E0C80C00];
  v18.receiver = self;
  v18.super_class = (Class)AVCaptureDeviceInput;
  v6 = -[AVCaptureInput initSubclass](&v18, sel_initSubclass);
  if (v6)
  {
    v7 = objc_alloc_init(AVCaptureDeviceInputInternal);
    v6->_internal = v7;
    if (v7)
    {
      if (device)
      {
        if (-[AVCaptureDeviceInput _authorizedToUseDeviceAndRequestIfNecessary:](v6, "_authorizedToUseDeviceAndRequestIfNecessary:", device))
        {
          v8 = device;
          v6->_internal->device = device;
          v6->_internal->weakReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", v6);
          v9 = (void *)objc_msgSend(MEMORY[0x1E0CF2D20], "sharedKVODispatcher");
          v6->_internal->deviceOpenCallbackInvoker = (AVCallbackCancellation *)(id)objc_msgSend(v9, "startObservingValueAtKeyPath:ofObject:options:usingBlock:", CFSTR("open"), device, 0, objc_msgSend(MEMORY[0x1E0CF2D38], "observationBlockForWeakObserver:passedToBlock:", v6, &__block_literal_global_7));
          -[AVCaptureDeviceInput willChangeValueForKey:](v6, "willChangeValueForKey:", CFSTR("notReadyError"));
          v6->_internal->ready = 1;
          -[AVCaptureDeviceInput didChangeValueForKey:](v6, "didChangeValueForKey:", CFSTR("notReadyError"));
          -[AVCaptureDeviceFormat defaultSimulatedAperture](-[AVCaptureDevice activeFormat](device, "activeFormat"), "defaultSimulatedAperture");
          v6->_internal->simulatedAperture = v10;
          internal = v6->_internal;
          v12 = (_OWORD *)MEMORY[0x1E0CA2E18];
          internal->videoMinFrameDurationOverride.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
          *(_OWORD *)&internal->videoMinFrameDurationOverride.value = *v12;
          -[AVCaptureDeviceFormat defaultPortraitLightingEffectStrength](-[AVCaptureDevice activeFormat](device, "activeFormat"), "defaultPortraitLightingEffectStrength");
          v6->_internal->portraitLightingEffectStrength = v13;
          v6->_internal->centerStageAllowed = 1;
          v6->_internal->backgroundBlurAllowed = 1;
          v6->_internal->studioLightingAllowed = 1;
          v6->_internal->reactionEffectsAllowed = 1;
          v6->_internal->backgroundReplacementAllowed = 1;
          goto LABEL_6;
        }

        v19 = *MEMORY[0x1E0CF2A68];
        v20[0] = device;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
        v14 = (NSError *)AVLocalizedError();
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      }
      else
      {

        v14 = (NSError *)AVLocalizedError();
        v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      }
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      if (outError)
      {
        v6 = 0;
        *outError = v14;
        return v6;
      }
    }
    else
    {

    }
    return 0;
  }
LABEL_6:
  if (outError)
    *outError = 0;
  return v6;
}

- (BOOL)_authorizedToUseDeviceAndRequestIfNecessary:(id)a3
{
  const __CFString *v4;
  int v5;
  AVAuthorizationStatus v6;

  v4 = (const __CFString *)*MEMORY[0x1E0CF2B68];
  if (objc_msgSend(a3, "hasMediaType:", *MEMORY[0x1E0CF2B68]))
  {
    objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  }
  else
  {
    v4 = (const __CFString *)*MEMORY[0x1E0CF2B90];
    if ((objc_msgSend(a3, "hasMediaType:", *MEMORY[0x1E0CF2B90]) & 1) == 0)
    {
      v4 = CFSTR("pcld");
      if ((objc_msgSend(a3, "hasMediaType:", CFSTR("pcld")) & 1) == 0)
      {
        v4 = (const __CFString *)*MEMORY[0x1E0CF2B80];
        v5 = objc_msgSend(a3, "hasMediaType:", *MEMORY[0x1E0CF2B80]);
        if (!v5)
          return v5;
      }
    }
  }
  v6 = +[AVCaptureDevice authorizationStatusForMediaType:](AVCaptureDevice, "authorizationStatusForMediaType:", v4);
  if (v6 != AVAuthorizationStatusAuthorized)
  {
    if (v6)
    {
      LOBYTE(v5) = 0;
      return v5;
    }
    +[AVCaptureDevice requestAccessForMediaType:completionHandler:](AVCaptureDevice, "requestAccessForMediaType:completionHandler:", v4, &__block_literal_global_79);
  }
  LOBYTE(v5) = 1;
  return v5;
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  uint64_t v7;

  v7 = objc_msgSend((id)objc_msgSend(-[AVCaptureDeviceInput ports](self, "ports"), "firstObject"), "sourceID");
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04400]), "isEqual:", v7))
  {
    if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D04550]))
      -[AVCaptureDeviceInput _sourceFormatDidChange:](self, "_sourceFormatDidChange:", objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D04370]));
  }
}

- (void)_sourceFormatDidChange:(opaqueCMFormatDescription *)a3
{
  CMMediaType MediaType;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char v14;
  char v15;
  BOOL v16;
  void *v17;
  opaqueCMFormatDescription *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3)
    MediaType = CMFormatDescriptionGetMediaType(a3);
  else
    MediaType = 0;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = -[AVCaptureDeviceInput multiCamPorts](self, "multiCamPorts", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    v10 = *MEMORY[0x1E0CF2B90];
    v11 = *MEMORY[0x1E0CF2B68];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v14 = objc_msgSend((id)objc_msgSend(v13, "mediaType"), "isEqual:", v10);
        if (a3)
        {
          if (MediaType == 1986618469)
            v15 = v14;
          else
            v15 = 0;
          if ((v15 & 1) != 0
            || (objc_msgSend((id)objc_msgSend(v13, "mediaType"), "isEqual:", v11)
              ? (v16 = MediaType == 1936684398)
              : (v16 = 0),
                v16))
          {
            v17 = v13;
            v18 = a3;
LABEL_23:
            objc_msgSend(v17, "_setFormatDescription:", v18);
            continue;
          }
        }
        else if ((v14 & 1) != 0 || objc_msgSend((id)objc_msgSend(v13, "mediaType"), "isEqual:", v11))
        {
          v17 = v13;
          v18 = 0;
          goto LABEL_23;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }
}

- (id)ports
{
  uint64_t v3;
  AVCaptureDevice *v4;
  AVCaptureDevice *v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  const __CFString *v9;
  AVCaptureDeviceInput *v10;
  const __CFString *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  AVCaptureDevice *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = 16;
  if (!self->_internal->ports)
  {
    v4 = -[AVCaptureDeviceInput device](self, "device");
    if (!v4)
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C99D20]);
LABEL_25:
      (*(_QWORD **)((char *)&self->super.super.isa + v3))[2] = v13;
      return (id)(*(_QWORD **)((char *)&self->super.super.isa + v3))[2];
    }
    v5 = v4;
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v7 = -[AVCaptureDevice deviceType](v5, "deviceType");
    v8 = -[AVCaptureDevice position](v5, "position");
    if (-[__CFString isEqual:](v7, "isEqual:", CFSTR("AVCaptureDeviceTypeMicrophone")))
    {
      v9 = (const __CFString *)*MEMORY[0x1E0CF2B68];
      v10 = self;
      v11 = CFSTR("AVCaptureDeviceTypeMicrophone");
      v12 = 0;
    }
    else
    {
      v14 = *MEMORY[0x1E0CF2B90];
      if (-[AVCaptureDevice hasMediaType:](v5, "hasMediaType:", *MEMORY[0x1E0CF2B90]))
        objc_msgSend(v6, "addObject:", +[AVCaptureInputPort portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:](AVCaptureInputPort, "portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", self, v14, 0, 1, v7, v8));
      v23 = 16;
      v25 = v5;
      if (-[AVCaptureDevice hasMediaType:](v5, "hasMediaType:", AVMediaTypeForMetadataObjects()))
        objc_msgSend(v6, "addObject:", +[AVCaptureInputPort portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:](AVCaptureInputPort, "portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", self, AVMediaTypeForMetadataObjects(), 0, 1, v7, v8));
      if (AVMediaTypeMetadataObjectAndAVMediaTypeMetadataAreDefined())
      {
        v15 = *MEMORY[0x1E0CF2B78];
        if (-[AVCaptureDevice hasMediaType:](v5, "hasMediaType:", *MEMORY[0x1E0CF2B78]))
        {
          v28 = 0u;
          v29 = 0u;
          v26 = 0u;
          v27 = 0u;
          v16 = -[AVCaptureDevice availableBoxedMetadataFormatDescriptions](v5, "availableBoxedMetadataFormatDescriptions");
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v27;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v27 != v19)
                  objc_enumerationMutation(v16);
                objc_msgSend(v6, "addObject:", +[AVCaptureInputPort portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:](AVCaptureInputPort, "portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", self, v15, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i), 1, v7, v8, v23));
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
            }
            while (v18);
          }
        }
      }
      v21 = *MEMORY[0x1E0CF2B70];
      if (-[AVCaptureDevice hasMediaType:](v25, "hasMediaType:", *MEMORY[0x1E0CF2B70], v23))
        objc_msgSend(v6, "addObject:", +[AVCaptureInputPort portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:](AVCaptureInputPort, "portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", self, v21, 0, 1, v7, v8));
      v3 = v24;
      if (!-[AVCaptureDevice hasMediaType:](v25, "hasMediaType:", CFSTR("pcld")))
        goto LABEL_24;
      v10 = self;
      v9 = CFSTR("pcld");
      v11 = v7;
      v12 = v8;
    }
    objc_msgSend(v6, "addObject:", +[AVCaptureInputPort portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:](AVCaptureInputPort, "portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", v10, v9, 0, 1, v11, v12));
LABEL_24:
    v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v6);
    goto LABEL_25;
  }
  return (id)(*(_QWORD **)((char *)&self->super.super.isa + v3))[2];
}

- (id)multiCamPorts
{
  id result;
  int BoolAnswer;
  AVCaptureDevice *v5;
  BOOL v6;
  AVCaptureDevice *v7;
  NSString *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  NSArray *obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  AVCaptureDevice *v22;
  uint64_t v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  result = self->_internal->multiCamPorts;
  if (!result)
  {
    v24 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", -[AVCaptureDeviceInput ports](self, "ports"));
    BoolAnswer = AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureSessionSupportsMultiCamCapture"));
    v5 = -[AVCaptureDeviceInput device](self, "device");
    if (BoolAnswer)
      v6 = v5 == 0;
    else
      v6 = 1;
    if (!v6)
    {
      v7 = v5;
      v8 = -[AVCaptureDevice deviceType](v5, "deviceType");
      if (-[NSString isEqual:](v8, "isEqual:", CFSTR("AVCaptureDeviceTypeMicrophone")))
      {
        v9 = *MEMORY[0x1E0CF2B68];
        objc_msgSend(v24, "addObject:", +[AVCaptureInputPort portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:](AVCaptureInputPort, "portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", self, *MEMORY[0x1E0CF2B68], 0, 1, v8, 1));
        objc_msgSend(v24, "addObject:", +[AVCaptureInputPort portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:](AVCaptureInputPort, "portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", self, v9, 0, 1, v8, 2));
      }
      else
      {
        obj = -[AVCaptureDevice constituentDevices](v7, "constituentDevices");
        if (-[NSArray count](obj, "count") >= 2)
        {
          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          v20 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
          if (v20)
          {
            v19 = *(_QWORD *)v30;
            v21 = *MEMORY[0x1E0CF2B90];
            v10 = *MEMORY[0x1E0CF2B78];
            v22 = v7;
            do
            {
              v11 = 0;
              do
              {
                if (*(_QWORD *)v30 != v19)
                  objc_enumerationMutation(obj);
                v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
                if (objc_msgSend(v12, "hasMediaType:", v21))
                  objc_msgSend(v24, "addObject:", +[AVCaptureInputPort portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:](AVCaptureInputPort, "portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", self, v21, 0, 1, objc_msgSend(v12, "deviceType"), objc_msgSend(v12, "position")));
                v23 = v11;
                if (-[AVCaptureDevice hasMediaType:](v7, "hasMediaType:", AVMediaTypeForMetadataObjects()))
                  objc_msgSend(v24, "addObject:", +[AVCaptureInputPort portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:](AVCaptureInputPort, "portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", self, AVMediaTypeForMetadataObjects(), 0, 1, objc_msgSend(v12, "deviceType"), objc_msgSend(v12, "position")));
                if (AVMediaTypeMetadataObjectAndAVMediaTypeMetadataAreDefined())
                {
                  if (-[AVCaptureDevice hasMediaType:](v22, "hasMediaType:", v10))
                  {
                    v27 = 0u;
                    v28 = 0u;
                    v25 = 0u;
                    v26 = 0u;
                    v13 = -[AVCaptureDevice availableBoxedMetadataFormatDescriptions](v22, "availableBoxedMetadataFormatDescriptions");
                    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
                    if (v14)
                    {
                      v15 = v14;
                      v16 = *(_QWORD *)v26;
                      do
                      {
                        for (i = 0; i != v15; ++i)
                        {
                          if (*(_QWORD *)v26 != v16)
                            objc_enumerationMutation(v13);
                          objc_msgSend(v24, "addObject:", +[AVCaptureInputPort portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:](AVCaptureInputPort, "portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", self, v10, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), 1, objc_msgSend(v12, "deviceType"), objc_msgSend(v12, "position")));
                        }
                        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
                      }
                      while (v15);
                    }
                  }
                }
                v7 = v22;
                ++v11;
              }
              while (v23 + 1 != v20);
              v20 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
            }
            while (v20);
          }
        }
      }
    }
    self->_internal->multiCamPorts = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v24);
    return self->_internal->multiCamPorts;
  }
  return result;
}

- (id)videoDevice
{
  AVCaptureDevice *v3;
  AVCaptureDevice *v4;

  v3 = -[AVCaptureDeviceInput device](self, "device");
  if (-[AVCaptureDevice hasMediaType:](v3, "hasMediaType:", *MEMORY[0x1E0CF2B90]))
    return -[AVCaptureDeviceInput device](self, "device");
  v4 = -[AVCaptureDeviceInput device](self, "device");
  if (-[AVCaptureDevice hasMediaType:](v4, "hasMediaType:", *MEMORY[0x1E0CF2B80]))
    return -[AVCaptureDeviceInput device](self, "device");
  else
    return 0;
}

- (void)handleChangedActiveFormat:(id)a3 forDevice:(id)a4
{
  objc_super v7;

  -[AVCaptureDeviceInput _resetSimulatedAperture](self, "_resetSimulatedAperture");
  -[AVCaptureDeviceInput _resetPortraitLightingEffectStrength](self, "_resetPortraitLightingEffectStrength");
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureDeviceInput;
  -[AVCaptureInput handleChangedActiveFormat:forDevice:](&v7, sel_handleChangedActiveFormat_forDevice_, a3, a4);
}

- (void)_resetSimulatedAperture
{
  AVCaptureDeviceInputInternal *internal;
  AVCaptureDevice *device;
  float simulatedAperture;
  float v6;
  float v7;
  AVCaptureDeviceFormat *v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;

  internal = self->_internal;
  device = internal->device;
  simulatedAperture = internal->simulatedAperture;
  -[AVCaptureDeviceFormat minSimulatedAperture](-[AVCaptureDevice activeFormat](device, "activeFormat"), "minSimulatedAperture");
  v7 = v6;
  v8 = -[AVCaptureDevice activeFormat](device, "activeFormat");
  if (v7 <= 0.0)
  {
    -[AVCaptureDeviceFormat defaultSimulatedAperture](v8, "defaultSimulatedAperture");
    v10 = 0.0;
    if (v12 <= 0.0)
      goto LABEL_7;
  }
  else
  {
    -[AVCaptureDeviceFormat minSimulatedAperture](v8, "minSimulatedAperture");
    if (simulatedAperture >= v9)
    {
      -[AVCaptureDeviceFormat maxSimulatedAperture](-[AVCaptureDevice activeFormat](device, "activeFormat"), "maxSimulatedAperture");
      v10 = simulatedAperture;
      if (simulatedAperture <= v11)
        goto LABEL_7;
    }
  }
  -[AVCaptureDeviceFormat defaultSimulatedAperture](-[AVCaptureDevice activeFormat](device, "activeFormat"), "defaultSimulatedAperture");
  v10 = v13;
LABEL_7:
  if (simulatedAperture != v10)
  {
    -[AVCaptureDeviceInput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("simulatedAperture"));
    self->_internal->simulatedAperture = v10;
    -[AVCaptureDeviceInput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("simulatedAperture"));
  }
}

- (void)_resetPortraitLightingEffectStrength
{
  AVCaptureDeviceInputInternal *internal;
  AVCaptureDevice *device;
  float portraitLightingEffectStrength;
  float v6;
  float v7;
  float v8;
  float v9;

  internal = self->_internal;
  device = internal->device;
  portraitLightingEffectStrength = internal->portraitLightingEffectStrength;
  -[AVCaptureDeviceFormat minPortraitLightingEffectStrength](-[AVCaptureDevice activeFormat](device, "activeFormat"), "minPortraitLightingEffectStrength");
  -[AVCaptureDeviceFormat minPortraitLightingEffectStrength](-[AVCaptureDevice activeFormat](device, "activeFormat"), "minPortraitLightingEffectStrength");
  if (portraitLightingEffectStrength < v6
    || (-[AVCaptureDeviceFormat maxPortraitLightingEffectStrength](-[AVCaptureDevice activeFormat](device, "activeFormat"), "maxPortraitLightingEffectStrength"), v7 = portraitLightingEffectStrength, portraitLightingEffectStrength > v8))
  {
    -[AVCaptureDeviceFormat defaultPortraitLightingEffectStrength](-[AVCaptureDevice activeFormat](device, "activeFormat"), "defaultPortraitLightingEffectStrength");
    v7 = v9;
  }
  if (portraitLightingEffectStrength != v7)
  {
    -[AVCaptureDeviceInput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("portraitLightingEffectStrength"));
    self->_internal->portraitLightingEffectStrength = v7;
    -[AVCaptureDeviceInput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("portraitLightingEffectStrength"));
  }
}

- (BOOL)reactionEffectsAllowed
{
  return self->_internal->reactionEffectsAllowed;
}

- (void)_applyVideoMinFrameDurationOverride
{
  AVCaptureDevice *v3;
  $95D729B680665BEAEFA1D6FCA8238556 videoMinFrameDurationOverride;

  -[AVCaptureDevice lockForConfiguration:](-[AVCaptureDeviceInput device](self, "device"), "lockForConfiguration:", 0);
  v3 = -[AVCaptureDeviceInput device](self, "device");
  videoMinFrameDurationOverride = self->_internal->videoMinFrameDurationOverride;
  -[AVCaptureDevice setVideoMinFrameDurationOverride:forOwner:](v3, "setVideoMinFrameDurationOverride:forOwner:", &videoMinFrameDurationOverride, self);
  -[AVCaptureDevice unlockForConfiguration](-[AVCaptureDeviceInput device](self, "device"), "unlockForConfiguration");
}

- (BOOL)isCenterStageAllowed
{
  return self->_internal->centerStageAllowed;
}

- (BOOL)isBuiltInMicrophoneStereoAudioCaptureSupported
{
  return -[AVCaptureDeviceInput isAudioCaptureModeSupported:](self, "isAudioCaptureModeSupported:", 1);
}

- (void)attachSafelyToFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  objc_super v5;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, di_notificationHandler, *MEMORY[0x1E0D04550], a3, 0);
  v5.receiver = self;
  v5.super_class = (Class)AVCaptureDeviceInput;
  -[AVCaptureInput attachSafelyToFigCaptureSession:](&v5, sel_attachSafelyToFigCaptureSession_, a3);
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)setAudioCaptureMode:(int64_t)a3
{
  AVCaptureDeviceInputInternal *internal;
  void *v6;
  uint64_t v7;
  void *v8;

  if ((unint64_t)a3 >= 7)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
  }
  else
  {
    if (-[AVCaptureDeviceInput isAudioCaptureModeSupported:](self, "isAudioCaptureModeSupported:"))
    {
      internal = self->_internal;
      if (internal->audioCaptureMode != a3)
      {
        internal->audioCaptureMode = a3;
        -[AVCaptureDeviceInput _bumpChangeSeedForFirstPortWithMediaType:](self, "_bumpChangeSeedForFirstPortWithMediaType:", *MEMORY[0x1E0CF2B68]);
      }
      return;
    }
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
  }
  v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

- (BOOL)isAudioCaptureModeSupported:(int64_t)a3
{
  return -[AVCaptureDevice isAudioCaptureModeSupported:](self->_internal->device, "isAudioCaptureModeSupported:", a3);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p [%@]>"), NSStringFromClass(v4), self, -[AVCaptureDevice localizedName](-[AVCaptureDeviceInput device](self, "device"), "localizedName"));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  int v8;
  int v9;

  if ((void *)AVCaptureSessionRunningChangedContext == a6)
  {
    v8 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CC8], a4), "BOOLValue");
    v9 = objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]), "BOOLValue");
    if (v8 != v9)
    {
      if (v9)
        -[AVCaptureDeviceInput _applyVideoMinFrameDurationOverride](self, "_applyVideoMinFrameDurationOverride");
      else
        -[AVCaptureDeviceInput _resetVideoMinFrameDurationOverride](self, "_resetVideoMinFrameDurationOverride");
    }
  }
}

- (void)setCenterStageAllowed:(BOOL)a3
{
  AVCaptureDeviceInputInternal *internal;

  internal = self->_internal;
  if (internal->centerStageAllowed != a3)
  {
    internal->centerStageAllowed = a3;
    -[AVCaptureDeviceInput _bumpChangeSeedForFirstPortWithMediaType:](self, "_bumpChangeSeedForFirstPortWithMediaType:", *MEMORY[0x1E0CF2B90]);
  }
}

- (void)setBackgroundBlurAllowed:(BOOL)a3
{
  AVCaptureDeviceInputInternal *internal;

  internal = self->_internal;
  if (internal->backgroundBlurAllowed != a3)
  {
    internal->backgroundBlurAllowed = a3;
    -[AVCaptureDeviceInput _bumpChangeSeedForFirstPortWithMediaType:](self, "_bumpChangeSeedForFirstPortWithMediaType:", *MEMORY[0x1E0CF2B90]);
  }
}

- (void)_bumpChangeSeedForFirstPortWithMediaType:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
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
  v4 = -[AVCaptureDeviceInput ports](self, "ports", 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v9, "mediaType"), "isEqual:", a3))
        {
          objc_msgSend(v9, "bumpChangeSeed");
          return;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
}

- (void)setBuiltInMicrophoneStereoAudioCaptureEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  if (a3
    && !-[AVCaptureDeviceInput isBuiltInMicrophoneStereoAudioCaptureSupported](self, "isBuiltInMicrophoneStereoAudioCaptureSupported"))
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
  else
  {
    -[AVCaptureDeviceInput setAudioCaptureMode:](self, "setAudioCaptureMode:", v3);
  }
}

- (void)setSimulatedAperture:(float)a3
{
  float v5;
  float v6;
  float v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[AVCaptureDeviceFormat minSimulatedAperture](-[AVCaptureDevice activeFormat](self->_internal->device, "activeFormat"), "minSimulatedAperture");
  if (v5 <= 0.0)
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99778];
    goto LABEL_6;
  }
  -[AVCaptureDeviceFormat minSimulatedAperture](-[AVCaptureDevice activeFormat](self->_internal->device, "activeFormat"), "minSimulatedAperture");
  if (v6 > a3
    || (-[AVCaptureDeviceFormat maxSimulatedAperture](-[AVCaptureDevice activeFormat](self->_internal->device, "activeFormat"), "maxSimulatedAperture"), v7 < a3))
  {
    v8 = (void *)MEMORY[0x1E0C99DA0];
    v9 = *MEMORY[0x1E0C99858];
LABEL_6:
    v10 = (void *)objc_msgSend(v8, "exceptionWithName:reason:userInfo:", v9, AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v10);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v10);
    return;
  }
  if (self->_internal->simulatedAperture != a3)
  {
    -[AVCaptureDeviceInput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("simulatedAperture"));
    self->_internal->simulatedAperture = a3;
    -[AVCaptureDeviceInput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("simulatedAperture"));
  }
}

uint64_t __45__AVCaptureDeviceInput_initWithDevice_error___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "willChangeValueForKey:", CFSTR("notReadyError"));
  return objc_msgSend(a2, "didChangeValueForKey:", CFSTR("notReadyError"));
}

- (AVCaptureDeviceInput)init
{
  return -[AVCaptureDeviceInput initWithDevice:error:](self, "initWithDevice:error:", 0, 0);
}

- (void)dealloc
{
  AVCaptureDeviceInputInternal *internal;
  objc_super v4;

  internal = self->_internal;
  if (internal)
  {
    if (internal->device)
    {
      -[NSArray makeObjectsPerformSelector:withObject:](internal->ports, "makeObjectsPerformSelector:withObject:", sel_setOwner_, 0);
      -[NSArray makeObjectsPerformSelector:withObject:](self->_internal->ports, "makeObjectsPerformSelector:withObject:", sel__setClock_, 0);
      internal = self->_internal;
    }

  }
  v4.receiver = self;
  v4.super_class = (Class)AVCaptureDeviceInput;
  -[AVCaptureInput dealloc](&v4, sel_dealloc);
}

- (void)setUnifiedAutoExposureDefaultsEnabled:(BOOL)unifiedAutoExposureDefaultsEnabled
{
  AVCaptureDeviceInputInternal *internal;

  internal = self->_internal;
  if (internal->unifiedAutoExposureDefaultsEnabled != unifiedAutoExposureDefaultsEnabled)
  {
    internal->unifiedAutoExposureDefaultsEnabled = unifiedAutoExposureDefaultsEnabled;
    -[AVCaptureDeviceInput _bumpChangeSeedForFirstPortWithMediaType:](self, "_bumpChangeSeedForFirstPortWithMediaType:", *MEMORY[0x1E0CF2B90]);
  }
}

- (void)detachSafelyFromFigCaptureSession:(OpaqueFigCaptureSession *)a3
{
  __CFRunLoop *Main;
  __CFRunLoop *v6;
  objc_super v7;
  _QWORD block[5];

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_internal->weakReference, di_notificationHandler, *MEMORY[0x1E0D04550], a3);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__AVCaptureDeviceInput_detachSafelyFromFigCaptureSession___block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = self;
  if (objc_msgSend(-[AVCaptureInput session](self, "session"), "notifiesOnMainThread"))
  {
    Main = CFRunLoopGetMain();
    CFRunLoopPerformBlock(Main, (CFTypeRef)*MEMORY[0x1E0C9B270], block);
    v6 = CFRunLoopGetMain();
    CFRunLoopWakeUp(v6);
  }
  else
  {
    -[AVCaptureDeviceInput _sourceFormatDidChange:](self, "_sourceFormatDidChange:", 0);
  }
  v7.receiver = self;
  v7.super_class = (Class)AVCaptureDeviceInput;
  -[AVCaptureInput detachSafelyFromFigCaptureSession:](&v7, sel_detachSafelyFromFigCaptureSession_, a3);
}

uint64_t __58__AVCaptureDeviceInput_detachSafelyFromFigCaptureSession___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sourceFormatDidChange:", 0);
}

- (id)notReadyError
{
  AVCaptureDevice *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  if (self->_internal->ready)
    return 0;
  v4 = -[AVCaptureDeviceInput device](self, "device");
  if (-[AVCaptureDevice isConnected](v4, "isConnected"))
  {
    if (objc_msgSend(-[AVCaptureInput session](self, "session"), "isRunning"))
      NSLog(CFSTR("*** AVCaptureDeviceInput warning: The device \"%@\" was closed while still being used in a capture session. Make sure that the session is not running before closing any devices it is using. To remove a device from a session while the session is still running, remove the device input before closing the device."), -[AVCaptureDevice description](v4, "description"));
    return (id)AVLocalizedError();
  }
  else
  {
    v5 = *MEMORY[0x1E0CF2A68];
    v6[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    return (id)AVLocalizedError();
  }
}

- (NSArray)portsWithMediaType:(AVMediaType)mediaType sourceDeviceType:(AVCaptureDeviceType)sourceDeviceType sourceDevicePosition:(AVCaptureDevicePosition)sourceDevicePosition
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  char v16;
  AVCaptureDevicePosition v17;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = -[AVCaptureDeviceInput multiCamPorts](self, "multiCamPorts");
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    v13 = *MEMORY[0x1E0CF2B68];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v14);
        if ((!mediaType
           || objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v14), "mediaType"), "isEqual:", mediaType))&& (!sourceDeviceType|| objc_msgSend((id)objc_msgSend(v15, "sourceDeviceType"), "isEqual:", sourceDeviceType)))
        {
          v16 = -[NSString isEqual:](mediaType, "isEqual:", v13);
          v17 = sourceDevicePosition;
          if (sourceDevicePosition == AVCaptureDevicePositionUnspecified)
          {
            v17 = AVCaptureDevicePositionUnspecified;
            if ((v16 & 1) == 0)
              v17 = objc_msgSend(v15, "sourceDevicePosition");
          }
          if (objc_msgSend(v15, "sourceDevicePosition") == v17)
            objc_msgSend(v19, "addObject:", v15);
        }
        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v19);
}

- (void)_resetVideoMinFrameDurationOverride
{
  -[AVCaptureDevice lockForConfiguration:](-[AVCaptureDeviceInput device](self, "device"), "lockForConfiguration:", 0);
  -[AVCaptureDevice resetVideoMinFrameDurationOverrideForOwner:](-[AVCaptureDeviceInput device](self, "device"), "resetVideoMinFrameDurationOverrideForOwner:", self);
  -[AVCaptureDevice unlockForConfiguration](-[AVCaptureDeviceInput device](self, "device"), "unlockForConfiguration");
}

- (BOOL)isMaxGainOverrideSupported
{
  return -[AVCaptureDevice deviceType](self->_internal->device, "deviceType") == (AVCaptureDeviceType)CFSTR("AVCaptureDeviceTypeBuiltInUltraWideCamera");
}

- (void)setMaxGainOverride:(float)a3
{
  BOOL v5;
  void *v6;
  uint64_t v7;
  void *v8;
  AVCaptureDeviceInputInternal *internal;

  if (-[AVCaptureDeviceInput isMaxGainOverrideSupported](self, "isMaxGainOverrideSupported"))
  {
    if (a3 == 0.0 || (a3 >= 1.0 ? (v5 = a3 > 256.0) : (v5 = 1), !v5))
    {
      internal = self->_internal;
      if (internal->maxGainOverride != a3)
      {
        internal->maxGainOverride = a3;
        -[AVCaptureDeviceInput _bumpChangeSeedForFirstPortWithMediaType:](self, "_bumpChangeSeedForFirstPortWithMediaType:", *MEMORY[0x1E0CF2B90]);
      }
      return;
    }
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
  }
  v8 = (void *)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v8);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
}

- (BOOL)isBuiltInMicrophoneStereoAudioCaptureEnabled
{
  return -[AVCaptureDeviceInput audioCaptureMode](self, "audioCaptureMode") == 1;
}

- (BOOL)isMultichannelAudioModeSupported:(int64_t)a3
{
  return (unint64_t)a3 <= 2
      && (!-[AVCaptureInput session](self, "session")
       || (objc_msgSend(-[AVCaptureInput session](self, "session"), "isMemberOfClass:", objc_opt_class()) & 1) == 0)
      && -[AVCaptureDevice isAudioCaptureModeSupported:](self->_internal->device, "isAudioCaptureModeSupported:", -[AVCaptureDeviceInput _audioCaptureModeForMultichannelAudioMode:](self, "_audioCaptureModeForMultichannelAudioMode:", a3));
}

- (int64_t)multichannelAudioMode
{
  return self->_internal->multichannelAudioMode;
}

- (void)setMultichannelAudioMode:(int64_t)a3
{
  AVCaptureDeviceInputInternal *internal;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)a3 >= 3)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
LABEL_16:
    v14 = (void *)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v14);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v14);
    return;
  }
  if (!-[AVCaptureDeviceInput isMultichannelAudioModeSupported:](self, "isMultichannelAudioModeSupported:"))
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    goto LABEL_16;
  }
  internal = self->_internal;
  if (internal->multichannelAudioMode != a3)
  {
    internal->multichannelAudioMode = a3;
    -[AVCaptureDeviceInput setAudioCaptureMode:](self, "setAudioCaptureMode:", -[AVCaptureDeviceInput _audioCaptureModeForMultichannelAudioMode:](self, "_audioCaptureModeForMultichannelAudioMode:", self->_internal->multichannelAudioMode));
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v6 = (void *)objc_msgSend(-[AVCaptureInput session](self, "session"), "outputs");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v22 = 0u;
          v23 = 0u;
          v20 = 0u;
          v21 = 0u;
          v15 = (void *)objc_msgSend(v11, "connections");
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v21;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v21 != v18)
                  objc_enumerationMutation(v15);
                objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "_setActive:", 0);
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v17);
          }
          return;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v8)
        continue;
      break;
    }
  }
}

- (int64_t)_audioCaptureModeForMultichannelAudioMode:(int64_t)a3
{
  if (a3 == 1)
    return 1;
  else
    return 2 * (a3 == 2);
}

- (BOOL)isWindNoiseRemovalSupported
{
  return -[AVCaptureDevice isWindNoiseRemovalSupported](self->_internal->device, "isWindNoiseRemovalSupported");
}

- (BOOL)isWindNoiseRemovalEnabled
{
  return self->_internal->windNoiseRemovalEnabled;
}

- (void)setWindNoiseRemovalEnabled:(BOOL)a3
{
  void *v5;

  if (-[AVCaptureDeviceInput isWindNoiseRemovalSupported](self, "isWindNoiseRemovalSupported"))
  {
    self->_internal->windNoiseRemovalEnabled = a3;
  }
  else
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v5);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v5);
  }
}

- (BOOL)isVisionDataDeliveryEnabled
{
  return self->_internal->visionDataDeliveryEnabled;
}

- (void)setVisionDataDeliveryEnabled:(BOOL)a3
{
  _BOOL4 v3;
  AVCaptureDeviceInputInternal *internal;
  AVCaptureDeviceInputInternal *v6;
  NSArray *v7;
  void *v8;
  NSArray *ports;

  v3 = a3;
  if (-[AVCaptureDeviceFormat isVisionDataDeliverySupported](-[AVCaptureDevice activeFormat](self->_internal->device, "activeFormat"), "isVisionDataDeliverySupported"))
  {
    internal = self->_internal;
    if (internal->visionDataDeliveryEnabled != v3)
    {
      internal->visionDataDeliveryEnabled = v3;
      if (!self->_internal->ports)
        -[AVCaptureDeviceInput ports](self, "ports");
      v6 = self->_internal;
      ports = v6->ports;
      if (v3)
      {
        v7 = -[NSArray arrayByAddingObject:](ports, "arrayByAddingObject:", +[AVCaptureInputPort portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:](AVCaptureInputPort, "portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", self, CFSTR("visn"), 0, 1, -[AVCaptureDevice deviceType](v6->device, "deviceType"), -[AVCaptureDevice position](self->_internal->device, "position")));
LABEL_12:
        self->_internal->ports = v7;

        return;
      }
      if ((__CFString *)objc_msgSend(-[NSArray lastObject](v6->ports, "lastObject"), "mediaType") == CFSTR("visn"))
      {
        v7 = -[NSArray subarrayWithRange:](ports, "subarrayWithRange:", 0, -[NSArray count](ports, "count") - 1);
        goto LABEL_12;
      }
    }
  }
  else
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v8);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v8);
  }
}

- (BOOL)isCameraCalibrationDataDeliveryEnabled
{
  return self->_internal->cameraCalibrationDataDeliveryEnabled;
}

- (void)setCameraCalibrationDataDeliveryEnabled:(BOOL)a3
{
  _BOOL4 v3;
  AVCaptureDeviceInputInternal *internal;
  NSArray *multiCamPorts;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSArray *v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v3 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  if (-[AVCaptureDeviceFormat isCameraCalibrationDataDeliverySupported](-[AVCaptureDevice activeFormat](self->_internal->device, "activeFormat"), "isCameraCalibrationDataDeliverySupported"))
  {
    internal = self->_internal;
    if (internal->cameraCalibrationDataDeliveryEnabled != v3)
    {
      internal->cameraCalibrationDataDeliveryEnabled = v3;
      multiCamPorts = self->_internal->multiCamPorts;
      if (!multiCamPorts)
      {
        -[AVCaptureDeviceInput multiCamPorts](self, "multiCamPorts");
        multiCamPorts = self->_internal->multiCamPorts;
      }
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", multiCamPorts);
      v8 = v7;
      v16 = multiCamPorts;
      if (v3)
      {
        v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", -[AVCaptureDeviceInput device](self, "device"));
        if (-[NSArray count](-[AVCaptureDevice constituentDevices](-[AVCaptureDeviceInput device](self, "device"), "constituentDevices"), "count") >= 2)objc_msgSend(v9, "addObjectsFromArray:", -[AVCaptureDevice constituentDevices](-[AVCaptureDeviceInput device](self, "device"), "constituentDevices"));
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v19 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
              v17[0] = MEMORY[0x1E0C809B0];
              v17[1] = 3221225472;
              v17[2] = __64__AVCaptureDeviceInput_setCameraCalibrationDataDeliveryEnabled___block_invoke;
              v17[3] = &unk_1E4216CE0;
              v17[4] = v14;
              objc_msgSend(v8, "insertObject:atIndex:", +[AVCaptureInputPort portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:](AVCaptureInputPort, "portWithInput:mediaType:formatDescription:enabled:sourceDeviceType:sourceDevicePosition:", self, CFSTR("cacd"), 0, 1, objc_msgSend(v14, "deviceType"), objc_msgSend(v14, "position")), objc_msgSend((id)objc_msgSend(v8, "indexesOfObjectsPassingTest:", v17), "lastIndex") + 1);
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          }
          while (v11);
        }
      }
      else
      {
        objc_msgSend(v7, "removeObjectsAtIndexes:", objc_msgSend(v7, "indexesOfObjectsPassingTest:", &__block_literal_global_99));
      }
      self->_internal->multiCamPorts = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v8);

    }
  }
  else
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v15);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v15);
  }
}

uint64_t __64__AVCaptureDeviceInput_setCameraCalibrationDataDeliveryEnabled___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "sourceDeviceType"), "isEqualToString:", objc_msgSend(*(id *)(a1 + 32), "deviceType"));
}

uint64_t __64__AVCaptureDeviceInput_setCameraCalibrationDataDeliveryEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend((id)objc_msgSend(a2, "mediaType"), "isEqualToString:", CFSTR("cacd"));
}

- (void)setPortraitLightingEffectStrength:(float)a3
{
  float v5;
  float v6;
  void *v7;

  -[AVCaptureDeviceFormat minPortraitLightingEffectStrength](-[AVCaptureDevice activeFormat](self->_internal->device, "activeFormat"), "minPortraitLightingEffectStrength");
  -[AVCaptureDeviceFormat minPortraitLightingEffectStrength](-[AVCaptureDevice activeFormat](self->_internal->device, "activeFormat"), "minPortraitLightingEffectStrength");
  if (v5 <= a3
    && (-[AVCaptureDeviceFormat maxPortraitLightingEffectStrength](-[AVCaptureDevice activeFormat](self->_internal->device, "activeFormat"), "maxPortraitLightingEffectStrength"), v6 >= a3))
  {
    if (self->_internal->portraitLightingEffectStrength != a3)
    {
      -[AVCaptureDeviceInput willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("portraitLightingEffectStrength"));
      self->_internal->portraitLightingEffectStrength = a3;
      -[AVCaptureDeviceInput didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("portraitLightingEffectStrength"));
    }
  }
  else
  {
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v7);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v7);
  }
}

- (void)setStudioLightingAllowed:(BOOL)a3
{
  AVCaptureDeviceInputInternal *internal;

  internal = self->_internal;
  if (internal->studioLightingAllowed != a3)
  {
    internal->studioLightingAllowed = a3;
    -[AVCaptureDeviceInput _bumpChangeSeedForFirstPortWithMediaType:](self, "_bumpChangeSeedForFirstPortWithMediaType:", *MEMORY[0x1E0CF2B90]);
  }
}

- (void)setReactionEffectsAllowed:(BOOL)a3
{
  AVCaptureDeviceInputInternal *internal;

  internal = self->_internal;
  if (internal->reactionEffectsAllowed != a3)
  {
    internal->reactionEffectsAllowed = a3;
    -[AVCaptureDeviceInput _bumpChangeSeedForFirstPortWithMediaType:](self, "_bumpChangeSeedForFirstPortWithMediaType:", *MEMORY[0x1E0CF2B90]);
  }
}

- (BOOL)isBackgroundReplacementAllowed
{
  return self->_internal->backgroundReplacementAllowed;
}

- (void)setBackgroundReplacementAllowed:(BOOL)a3
{
  AVCaptureDeviceInputInternal *internal;

  internal = self->_internal;
  if (internal->backgroundReplacementAllowed != a3)
  {
    internal->backgroundReplacementAllowed = a3;
    -[AVCaptureDeviceInput _bumpChangeSeedForFirstPortWithMediaType:](self, "_bumpChangeSeedForFirstPortWithMediaType:", *MEMORY[0x1E0CF2B90]);
  }
}

@end
