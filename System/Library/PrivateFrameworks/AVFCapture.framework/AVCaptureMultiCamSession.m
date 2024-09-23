@implementation AVCaptureMultiCamSession

- (AVCaptureMultiCamSession)init
{
  AVCaptureMultiCamSession *v2;
  AVCaptureMultiCamSession *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCaptureMultiCamSession;
  v2 = -[AVCaptureSession init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[AVCaptureSession setSessionPreset:](v2, "setSessionPreset:", CFSTR("AVCaptureSessionPresetInputPriority"));
  return v3;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AVCaptureMultiCamSession;
  -[AVCaptureSession dealloc](&v2, sel_dealloc);
}

+ (BOOL)isMultiCamSupported
{
  return AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureSessionSupportsMultiCamCapture"));
}

- (float)hardwareCost
{
  return self->_hardwareCost;
}

- (float)systemPressureCost
{
  return self->_systemPressureCost;
}

- (void)startRunning
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  void *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = -[AVCaptureSession inputs](self, "inputs");
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "videoDevice");
        if (v8)
        {
          v9 = v8;
          if (!objc_msgSend((id)objc_msgSend(v8, "activeFormat"), "isMultiCamSupported"))
          {
            v15 = *MEMORY[0x1E0CF2A68];
            v16 = v9;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
            -[AVCaptureSession _postRuntimeError:](self, "_postRuntimeError:", AVLocalizedError());
            return;
          }
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10.receiver = self;
  v10.super_class = (Class)AVCaptureMultiCamSession;
  -[AVCaptureSession startRunning](&v10, sel_startRunning);
}

- (BOOL)canSetSessionPreset:(id)a3
{
  return objc_msgSend(a3, "isEqual:", CFSTR("AVCaptureSessionPresetInputPriority"));
}

- (BOOL)_canAddInput:(id)a3 failureReason:(id *)a4
{
  void *v7;
  NSArray *v8;
  uint64_t v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id *v14;
  uint64_t i;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  id v24;
  NSArray *v25;
  __CFString *v26;
  void *v28;
  objc_class *v29;
  void *context;
  _QWORD v31[5];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1A1AF16C4](self, a2);
  if (!a3)
  {
    v26 = CFSTR("Can't add a nil AVCaptureInput");
    goto LABEL_35;
  }
  if ((AVCaptureMultiCamSession *)objc_msgSend(a3, "session") == self)
    goto LABEL_38;
  if (objc_msgSend(a3, "session"))
  {
    LOBYTE(a3) = 0;
    v26 = CFSTR("An AVCaptureInput instance may not be added to more than one session");
    goto LABEL_35;
  }
  if ((objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()) & 1) == 0
    && (objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
  {
    v28 = (void *)MEMORY[0x1E0CB3940];
    v29 = (objc_class *)objc_opt_class();
    v26 = (__CFString *)objc_msgSend(v28, "stringWithFormat:", CFSTR("<%@> is an unsupported AVCaptureInput type"), NSStringFromClass(v29));
    LOBYTE(a3) = 0;
    goto LABEL_35;
  }
  v8 = -[AVCaptureSession inputs](self, "inputs");
  if (-[NSArray containsObject:](v8, "containsObject:", a3))
  {
LABEL_38:
    LOBYTE(a3) = 0;
    v26 = CFSTR("An AVCaptureInput instance may not be added more than once to a session");
    goto LABEL_35;
  }
  context = v7;
  if (objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()))
  {
    v9 = objc_msgSend(a3, "device");
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v10 = -[AVCaptureSession inputs](self, "inputs");
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v37;
      while (2)
      {
        v14 = a4;
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v37 != v13)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          if (objc_msgSend(v16, "isMemberOfClass:", objc_opt_class())
            && objc_msgSend(v16, "device") == v9)
          {
            LOBYTE(a3) = 0;
            a4 = v14;
            v7 = context;
            v26 = CFSTR("An AVCaptureDevice may only be associated with a session through a single AVCaptureDeviceInput");
            goto LABEL_35;
          }
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        a4 = v14;
        if (v12)
          continue;
        break;
      }
    }
  }
  v17 = objc_msgSend(a3, "videoDevice");
  if (!v17)
    goto LABEL_45;
  v18 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v17);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v19 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v33 != v21)
          objc_enumerationMutation(v8);
        v23 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "videoDevice");
        if (v23)
          objc_msgSend(v18, "addObject:", v23);
      }
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v20);
  }
  if ((unint64_t)objc_msgSend(v18, "count") >= 2
    && (v24 = +[AVCaptureDeviceDiscoverySession allVideoDeviceTypes](AVCaptureDeviceDiscoverySession, "allVideoDeviceTypes"), v25 = -[AVCaptureDeviceDiscoverySession supportedMultiCamDeviceSets](+[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:mediaType:position:](AVCaptureDeviceDiscoverySession, "discoverySessionWithDeviceTypes:mediaType:position:", v24, *MEMORY[0x1E0CF2B90], 0), "supportedMultiCamDeviceSets"), v31[0] = MEMORY[0x1E0C809B0], v31[1] = 3221225472, v31[2] = __55__AVCaptureMultiCamSession__canAddInput_failureReason___block_invoke, v31[3] = &unk_1E4217930, v31[4] = v18, -[NSArray indexOfObjectPassingTest:](v25, "indexOfObjectPassingTest:", v31) == 0x7FFFFFFFFFFFFFFFLL))
  {
    LOBYTE(a3) = 0;
    v26 = CFSTR("These devices may not be used simultaneously. Use -[AVCaptureDeviceDiscoverySession supportedMultiCamDeviceSets]");
  }
  else
  {
LABEL_45:
    if (objc_msgSend(a3, "isMemberOfClass:", objc_opt_class())
      && objc_msgSend(a3, "multichannelAudioMode"))
    {
      LOBYTE(a3) = 0;
      v26 = CFSTR("The input's multichannel audio mode is not supported by AVCaptureMultiCamSession");
    }
    else
    {
      v26 = 0;
      LOBYTE(a3) = 1;
    }
  }
  v7 = context;
LABEL_35:
  if (a4)
    *a4 = v26;
  objc_autoreleasePoolPop(v7);
  return (char)a3;
}

uint64_t __55__AVCaptureMultiCamSession__canAddInput_failureReason___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isEqualToSet:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    *a4 = 1;
  return result;
}

- (BOOL)_canAddOutput:(id)a3 failureReason:(id *)a4
{
  _BOOL4 v7;
  __CFString *v8;
  BOOL result;

  if (a3)
  {
    if (objc_msgSend(a3, "session"))
    {
      result = 0;
      v8 = CFSTR("An AVCaptureOutput instance may not be added to more than one session");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        result = 0;
        v8 = CFSTR("The deprecated AVCaptureStillImageOutput class may not be used with AVCaptureMultiCamSession. Use AVCapturePhotoOutput instead");
      }
      else
      {
        v7 = -[NSArray containsObject:](-[AVCaptureSession outputs](self, "outputs"), "containsObject:", a3);
        v8 = CFSTR("An AVCaptureOutput instance may not be added more than once to a session");
        if (!v7)
          v8 = 0;
        result = !v7;
      }
    }
  }
  else
  {
    result = 0;
    v8 = CFSTR("Can't add a nil AVCaptureOutput");
  }
  if (a4)
    *a4 = v8;
  return result;
}

- (BOOL)_canAddConnection:(id)a3 failureReason:(id *)a4
{
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  int v18;
  _BOOL4 v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t k;
  void *v27;
  objc_class *v28;
  void *v30;
  objc_class *v31;
  void *v32;
  id *v33;
  uint64_t v34;
  void *v35;
  NSArray *obj;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  objc_super v49;
  void *v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1A1AF16C4](self, a2);
  v49.receiver = self;
  v49.super_class = (Class)AVCaptureMultiCamSession;
  v50 = 0;
  if (-[AVCaptureSession _canAddConnection:failureReason:](&v49, sel__canAddConnection_failureReason_, a3, &v50))
  {
    v32 = v7;
    v33 = a4;
    v8 = +[AVCaptureOutput allOutputSubclasses](AVCaptureOutput, "allOutputSubclasses");
    v35 = (void *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(a3, "inputPorts"));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    obj = -[AVCaptureSession connections](self, "connections");
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v46;
      v34 = *MEMORY[0x1E0CF2B68];
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v46 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v14 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v42;
            while (2)
            {
              for (j = 0; j != v15; ++j)
              {
                if (*(_QWORD *)v42 != v16)
                  objc_enumerationMutation(v8);
                objc_msgSend(a3, "output");
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend(v13, "output");
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v18 = 1;
                    goto LABEL_18;
                  }
                }
              }
              v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
              if (v15)
                continue;
              break;
            }
          }
          v18 = 0;
LABEL_18:
          if (objc_msgSend(a3, "videoPreviewLayer"))
            v19 = objc_msgSend(v13, "videoPreviewLayer") != 0;
          else
            v19 = 0;
          if ((v18 | v19) == 1)
          {
            if (objc_msgSend(v35, "intersectsSet:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", objc_msgSend(v13, "inputPorts"))))
            {
              if (objc_msgSend(a3, "mediaType") != v34
                || (v20 = objc_msgSend(a3, "output"), v20 == objc_msgSend(v13, "output")))
              {
                if (!AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureMultipleVideoDataOutputsSupported"))
                  || (objc_msgSend(a3, "output"), objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  v27 = (void *)MEMORY[0x1E0CB3940];
                  v28 = (objc_class *)objc_opt_class();
                  v25 = 0;
                  v50 = (void *)objc_msgSend(v27, "stringWithFormat:", CFSTR("<%@: %p> references an input port already in use for a video preview layer or output of the same type"), NSStringFromClass(v28), a3);
                  goto LABEL_43;
                }
              }
            }
          }
        }
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
        if (v10)
          continue;
        break;
      }
    }
    objc_msgSend(a3, "output");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v21 = (void *)objc_msgSend(a3, "inputPorts");
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
      a4 = v33;
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v38;
        v7 = v32;
        v25 = 1;
        while (2)
        {
          for (k = 0; k != v23; ++k)
          {
            if (*(_QWORD *)v38 != v24)
              objc_enumerationMutation(v21);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * k), "sourcesFromConstituentDevice") & 1) != 0)
            {
              v30 = (void *)MEMORY[0x1E0CB3940];
              v31 = (objc_class *)objc_opt_class();
              v25 = 0;
              v50 = (void *)objc_msgSend(v30, "stringWithFormat:", CFSTR("<%@: %p> references an input port from a constituent device to an AVCapturePhotoOutput instance"), NSStringFromClass(v31), a3);
              goto LABEL_44;
            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
          if (v23)
            continue;
          break;
        }
      }
      else
      {
        v25 = 1;
        v7 = v32;
      }
    }
    else
    {
      v25 = 1;
LABEL_43:
      v7 = v32;
      a4 = v33;
    }
  }
  else
  {
    v25 = 0;
  }
LABEL_44:
  if (a4)
    *a4 = v50;
  objc_autoreleasePoolPop(v7);
  return v25;
}

- (BOOL)_addConnection:(id)a3 exceptionReason:(id *)a4
{
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)AVCaptureMultiCamSession;
  v6 = -[AVCaptureSession _addConnection:exceptionReason:](&v17, sel__addConnection_exceptionReason_, a3, a4);
  if (v6)
  {
    objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("enabled"), 3, AVCaptureMultiCamSessionConnectionEnabledChangedContext);
    objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("active"), 3, AVCaptureMultiCamSessionConnectionActiveChangedContext);
    objc_msgSend(a3, "addObserver:forKeyPath:options:context:", self, CFSTR("activeVideoStabilizationMode"), 3, AVCaptureMultiCamSessionConnectionActiveVideoStabilizationModeChangedContext);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = (void *)objc_msgSend(a3, "inputPorts", 0);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11++), "addObserver:forKeyPath:options:context:", self, CFSTR("enabled"), 3, AVCaptureMultiCamSessionConnectedInputPortEnabledChangedContext);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v9);
    }
    -[AVCaptureMultiCamSession _updateCosts](self, "_updateCosts");
  }
  return v6;
}

- (void)_removeConnection:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "removeObserver:forKeyPath:context:", self, CFSTR("enabled"), AVCaptureMultiCamSessionConnectionEnabledChangedContext);
  objc_msgSend(a3, "removeObserver:forKeyPath:context:", self, CFSTR("active"), AVCaptureMultiCamSessionConnectionActiveChangedContext);
  objc_msgSend(a3, "removeObserver:forKeyPath:context:", self, CFSTR("activeVideoStabilizationMode"), AVCaptureMultiCamSessionConnectionActiveVideoStabilizationModeChangedContext);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (void *)objc_msgSend(a3, "inputPorts");
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "removeObserver:forKeyPath:context:", self, CFSTR("enabled"), AVCaptureMultiCamSessionConnectedInputPortEnabledChangedContext);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }
  v10.receiver = self;
  v10.super_class = (Class)AVCaptureMultiCamSession;
  -[AVCaptureSession _removeConnection:](&v10, sel__removeConnection_, a3);
  -[AVCaptureMultiCamSession _updateCosts](self, "_updateCosts");
}

- (void)handleVideoInputDevice:(id)a3 activeFormatChanged:(id)a4
{
  void *v7;
  objc_super v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2CB8]);
  if (-[AVCaptureSession isRunning](self, "isRunning") && (objc_msgSend(v7, "isMultiCamSupported") & 1) == 0)
  {
    -[AVCaptureSession stopRunning](self, "stopRunning");
    v9 = *MEMORY[0x1E0CF2A68];
    v10[0] = a3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    -[AVCaptureSession _postRuntimeError:](self, "_postRuntimeError:", AVLocalizedError());
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVCaptureMultiCamSession;
    -[AVCaptureSession handleVideoInputDevice:activeFormatChanged:](&v8, sel_handleVideoInputDevice_activeFormatChanged_, a3, a4);
  }
  -[AVCaptureMultiCamSession _updateCosts](self, "_updateCosts");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v9;

  if ((void *)AVCaptureMultiCamSessionConnectionEnabledChangedContext == a6
    || AVCaptureMultiCamSessionConnectionActiveChangedContext == (_QWORD)a6
    || AVCaptureMultiCamSessionConnectedInputPortEnabledChangedContext == (_QWORD)a6
    || AVCaptureMultiCamSessionConnectionActiveVideoStabilizationModeChangedContext == (_QWORD)a6)
  {
    -[AVCaptureMultiCamSession _updateCosts](self, "_updateCosts", a3, a4, a5);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AVCaptureMultiCamSession;
    -[AVCaptureSession observeValueForKeyPath:ofObject:change:context:](&v9, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_updateCosts
{
  void *v3;

  v3 = (void *)MEMORY[0x1A1AF16C4](self, a2);
  -[AVCaptureMultiCamSession _updateHardwareCost](self, "_updateHardwareCost");
  -[AVCaptureMultiCamSession _updateSystemPressureCost](self, "_updateSystemPressureCost");
  objc_autoreleasePoolPop(v3);
}

- (void)_updateHardwareCost
{
  float v3;
  float v4;
  float v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVCaptureMultiCamSession;
  -[AVCaptureSession _totalHardwareCost](&v6, sel__totalHardwareCost);
  v4 = v3;
  -[AVCaptureMultiCamSession _computeISPHardwareCost](self, "_computeISPHardwareCost");
  if (v4 <= v5)
    v4 = v5;
  if (v4 != self->_hardwareCost)
  {
    -[AVCaptureMultiCamSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("hardwareCost"));
    self->_hardwareCost = v4;
    -[AVCaptureMultiCamSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("hardwareCost"));
  }
}

- (float)_computeISPHardwareCost
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  float v16;
  uint64_t j;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  uint64_t v23;
  float v24;
  int v25;
  float v26;
  float v27;
  float v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  void *v40;
  float v41;
  unint64_t v42;
  unint64_t v43;
  int v44;
  int v45;
  int v46;
  BOOL v47;
  float v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t n;
  float v54;
  id v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  void *v60;
  int v61;
  int v62;
  id obj;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v56 = -[AVCaptureSession _devicesProvidingDepthData](self, "_devicesProvidingDepthData");
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  obj = -[AVCaptureSession _livePortSetsByDeviceInput](self, "_livePortSetsByDeviceInput");
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v87;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v87 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
        if (((objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "device"), "deviceType"), "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInUltraWideCamera")) & 1) != 0|| objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "device"), "deviceType"), "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInDualWideCamera")))&& objc_msgSend((id)objc_msgSend(v9, "device"), "position") == 1)
        {
          v5 = 1;
        }
        else if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "device"), "deviceType"), "isEqualToString:", CFSTR("AVCaptureDeviceTypeDeskViewCamera")))
        {
          v6 |= objc_msgSend((id)objc_msgSend(v9, "device"), "position") == 1;
        }
        if ((v5 & 1) != 0 && (v6 & 1) != 0)
        {
          v5 = 1;
          goto LABEL_19;
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v94, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v5 = 0;
  }
LABEL_19:
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v93, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = 0;
    v14 = *(_QWORD *)v83;
    v15 = *MEMORY[0x1E0CF2B90];
    v16 = 0.0;
    v59 = v5;
    v57 = *MEMORY[0x1E0CF2B90];
    v58 = *(_QWORD *)v83;
    do
    {
      for (j = 0; j != v11; ++j)
      {
        if (*(_QWORD *)v83 != v14)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * j);
        v19 = (void *)objc_msgSend(v18, "device");
        if (objc_msgSend(v19, "hasMediaType:", v15)
          && (v5 & objc_msgSend((id)objc_msgSend(v19, "deviceType"), "isEqualToString:", CFSTR("AVCaptureDeviceTypeDeskViewCamera")) & 1) == 0)
        {
          v20 = objc_msgSend(v19, "isVirtualDevice");
          if (v20)
            v60 = (void *)objc_msgSend(v19, "constituentDevices");
          else
            v60 = 0;
          v79 = 0;
          v80 = 0;
          v81 = 0;
          v21 = (void *)objc_msgSend(v19, "activeFormat");
          if (v21)
          {
            objc_msgSend(v21, "lowestSupportedVideoFrameDuration");
            v22 = v80;
            v23 = v79;
          }
          else
          {
            v23 = 0;
            v22 = 0;
            v79 = 0;
            v80 = 0;
            v81 = 0;
          }
          v24 = (float)v22 / (float)v23;
          v25 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v19, "activeFormat"), "figCaptureSourceVideoFormat"), "isVideoHDRFusionSupported");
          objc_msgSend((id)objc_msgSend(v19, "activeFormat"), "hardwareCost");
          v27 = v26;
          if (v25)
            v28 = 2.0;
          else
            v28 = 1.0;
          v76 = 0;
          v77 = 0;
          v78 = 0;
          v61 = v13;
          v62 = v12;
          if (v18)
          {
            objc_msgSend(v18, "videoMinFrameDurationOverride");
            if ((v77 & 0x100000000) != 0)
              v24 = (float)(int)v77 / (float)v76;
          }
          v29 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
          if (v20)
          {
            if (objc_msgSend(v56, "containsObject:", v19))
            {
              if ((__CFString *)objc_msgSend(v19, "deviceType") != CFSTR("AVCaptureDeviceTypeBuiltInLiDARDepthCamera"))
              {
                v74 = 0u;
                v75 = 0u;
                v72 = 0u;
                v73 = 0u;
                v30 = (void *)objc_msgSend(v19, "constituentDevices");
                v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v72, v92, 16);
                if (v31)
                {
                  v32 = v31;
                  v33 = *(_QWORD *)v73;
                  do
                  {
                    for (k = 0; k != v32; ++k)
                    {
                      if (*(_QWORD *)v73 != v33)
                        objc_enumerationMutation(v30);
                      objc_msgSend(v29, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * k), "deviceType"));
                    }
                    v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v72, v92, 16);
                  }
                  while (v32);
                }
              }
            }
          }
          v70 = 0u;
          v71 = 0u;
          v68 = 0u;
          v69 = 0u;
          v35 = (void *)objc_msgSend(obj, "objectForKeyedSubscript:", v18);
          v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v68, v91, 16);
          if (v36)
          {
            v37 = v36;
            v38 = *(_QWORD *)v69;
            do
            {
              for (m = 0; m != v37; ++m)
              {
                if (*(_QWORD *)v69 != v38)
                  objc_enumerationMutation(v35);
                v40 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * m);
                if ((objc_msgSend(v29, "containsObject:", objc_msgSend(v40, "sourceDeviceType")) & 1) == 0)
                  objc_msgSend(v29, "addObject:", objc_msgSend(v40, "sourceDeviceType"));
              }
              v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v68, v91, 16);
            }
            while (v37);
          }
          v41 = v28 * v27;
          v42 = objc_msgSend(v29, "count");
          v43 = v42;
          if (v20)
          {
            v45 = v61;
            v44 = v62;
            v14 = v58;
            if (objc_msgSend(v29, "containsObject:", objc_msgSend(v19, "deviceType")))
              v43 = (__PAIR128__(v43, objc_msgSend(v60, "count")) - v43) >> 64;
            v16 = v16 + (float)((float)(v41 * (float)v43) * v24);
            v5 = v59;
            v15 = v57;
            if (v43 < objc_msgSend(v60, "count"))
              v16 = v16 + (float)((float)(v41 * (float)(objc_msgSend(v60, "count") - v43)) * 7.0);
          }
          else
          {
            v16 = v16 + (float)((float)(v41 * (float)v42) * v24);
            v5 = v59;
            v45 = v61;
            v44 = v62;
            v15 = v57;
            v14 = v58;
          }
          if (CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend((id)objc_msgSend(v19, "activeFormat"), "formatDescription")).width <= 3839)v46 = 0;
          else
            v46 = v43;
          v12 = v46 + v44;
          v13 = v45 + v43;
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v93, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
    v13 = 0;
    v16 = 0.0;
  }
  v47 = v13 <= 2 || v12 <= 1;
  v66 = 0u;
  v67 = 0u;
  if (v47)
    v48 = v16;
  else
    v48 = v16 + 1.0;
  v64 = 0uLL;
  v65 = 0uLL;
  v49 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v64, v90, 16);
  if (v49)
  {
    v50 = v49;
    v51 = 0;
    v52 = *(_QWORD *)v65;
    do
    {
      for (n = 0; n != v50; ++n)
      {
        if (*(_QWORD *)v65 != v52)
          objc_enumerationMutation(v56);
        v51 += objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * n), "deviceType") != (_QWORD)CFSTR("AVCaptureDeviceTypeBuiltInLiDARDepthCamera");
      }
      v50 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v64, v90, 16);
    }
    while (v50);
    v54 = (float)(v51 - 1);
    if (v51 <= 1)
      v54 = -0.0;
    return v48 + v54;
  }
  return v48;
}

- (void)_updateSystemPressureCost
{
  int v2;
  int v3;
  float *v4;
  float v5;
  float v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  int v18;
  void *v19;
  float v20;
  float v21;
  int v22;
  int v23;
  int v24;
  int v25;
  float v26;
  int v27;
  int v28;
  float v29;
  unsigned int v30;
  uint64_t v31;
  int v32;
  NSArray *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  int v46;
  int v47;
  int v48;
  unsigned int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  void *v60;
  void *v61;
  CMVideoDimensions Dimensions;
  int v63;
  uint64_t v64;
  float v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t k;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  unsigned int v76;
  unsigned int v77;
  unsigned int v78;
  unsigned int v79;
  unsigned int v80;
  uint64_t ModelSpecificName;
  uint64_t v82;
  float v83;
  float *v84;
  float v85;
  float v86;
  float v87;
  float v88;
  float v89;
  float v90;
  float v91;
  AVCaptureMultiCamSession *v92;
  float *v93;
  id v94;
  uint64_t v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  int v104;
  id obj;
  int obja;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  __int128 v114;
  uint64_t v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _BYTE v132[128];
  _BYTE v133[128];
  _BYTE v134[128];
  _BYTE v135[128];
  _BYTE v136[128];
  uint64_t v137;

  v92 = self;
  v137 = *MEMORY[0x1E0C80C00];
  v2 = FigCapturePlatformIdentifier();
  if (v2 >= 7)
    v3 = 350;
  else
    v3 = 450;
  if (v2 > 11)
    return;
  v4 = (float *)((char *)&_updateSystemPressureCost_allEncoderModels + 8 * v2);
  v5 = *v4;
  v6 = v4[1];
  if ((float)(*v4 + v6) == 0.0)
    return;
  v96 = v3;
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  obj = -[AVCaptureMultiCamSession _physicalDevicePowerInfoSet](v92, "_physicalDevicePowerInfoSet");
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v136, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v129;
    v11 = *MEMORY[0x1E0CF2B90];
    v98 = *MEMORY[0x1E0CF2B68];
    v100 = *MEMORY[0x1E0CF2B90];
    v12 = 125;
    v102 = *(_QWORD *)v129;
    do
    {
      v13 = 0;
      v103 = v8;
      do
      {
        if (*(_QWORD *)v129 != v10)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * v13);
        v15 = (void *)objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Device"), v92);
        if (objc_msgSend(v15, "hasMediaType:", v11))
        {
          v16 = v12;
          v17 = v9;
          v18 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("VISEnabled")), "intValue");
          v19 = (void *)objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ActiveFormat"));
          objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("MaxActiveFrameRate")), "floatValue");
          v21 = v20;
          v22 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("SIFREnabled")), "BOOLValue");
          v23 = objc_msgSend((id)objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("ISPProcessingEnabled")), "BOOLValue");
          v24 = objc_msgSend(v19, "baseSensorPowerConsumption");
          v25 = objc_msgSend(v19, "variableSensorPowerConsumption");
          if (v22)
            v26 = 2.0;
          else
            v26 = 1.0;
          if (v23)
          {
            v27 = objc_msgSend((id)objc_msgSend(v19, "figCaptureSourceVideoFormat"), "isVideoHDRFusionSupported");
            v28 = objc_msgSend(v19, "ispPowerConsumption");
            if (v27)
              v29 = 2.0;
            else
              v29 = 1.0;
            v12 = v16 + v21 + (int)(float)(v29 * (float)(v21 * (float)v28));
          }
          else
          {
            v12 = v16;
          }
          v9 = v17 + (int)(float)((float)v24 + (float)((float)(v21 * (float)v25) * v26));
          if (v21 <= 30.0)
            v30 = 3;
          else
            v30 = 2;
          if (v18)
            v31 = v30;
          else
            v31 = 1;
          v32 = objc_msgSend(v15, "powerConsumptionAt30FPSForOISMode:", v31);
          v10 = v102;
          if (v32)
            v9 += (int)(float)((float)((float)(v21 / 30.0) * v26) * (float)v32);
          v8 = v103;
          v11 = v100;
        }
        else if (objc_msgSend(v15, "hasMediaType:", v98))
        {
          v12 = (v12 + 100);
        }
        else
        {
          v12 = v12;
        }
        ++v13;
      }
      while (v8 != v13);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v136, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
    LODWORD(v12) = 125;
  }
  v104 = v12;
  obja = v9;
  v126 = 0u;
  v127 = 0u;
  v124 = 0u;
  v125 = 0u;
  v33 = -[AVCaptureSession connections](v92, "connections", v92);
  v34 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v124, v135, 16);
  if (v34)
  {
    v35 = v34;
    v36 = 0;
    v37 = 0;
    v38 = 0;
    v39 = 0;
    v40 = *(_QWORD *)v125;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v125 != v40)
          objc_enumerationMutation(v33);
        v42 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * i);
        if (objc_msgSend(v42, "isLive"))
        {
          v43 = (void *)objc_msgSend(v42, "sourceDeviceInput");
          v44 = (void *)objc_msgSend(v43, "device");
          if (objc_msgSend(v44, "isBackgroundBlurActive")
            && objc_msgSend(v43, "isBackgroundBlurAllowed"))
          {
            if (!v36)
              v36 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
            objc_msgSend(v36, "addObject:", v44);
          }
          if (objc_msgSend(v44, "isCenterStageActive")
            && objc_msgSend(v43, "isCenterStageAllowed"))
          {
            if (!v37)
              v37 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
            objc_msgSend(v37, "addObject:", v44);
          }
          if (objc_msgSend(v44, "isStudioLightActive")
            && objc_msgSend(v43, "isStudioLightingAllowed"))
          {
            if (!v38)
              v38 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
            objc_msgSend(v38, "addObject:", v44);
          }
          if (objc_msgSend(v44, "canPerformReactionEffects")
            && objc_msgSend(v43, "reactionEffectsAllowed"))
          {
            if (!v39)
              v39 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
            objc_msgSend(v39, "addObject:", v44);
          }
        }
      }
      v35 = -[NSArray countByEnumeratingWithState:objects:count:](v33, "countByEnumeratingWithState:objects:count:", &v124, v135, 16);
    }
    while (v35);
  }
  else
  {
    v36 = 0;
    v37 = 0;
    v38 = 0;
    v39 = 0;
  }
  v45 = objc_msgSend(v36, "count");
  v46 = objc_msgSend(v37, "count");
  v47 = objc_msgSend(v38, "count");
  v48 = objc_msgSend(v39, "count");
  v120 = 0u;
  v121 = 0u;
  v49 = v104 + 260 * v46 + 50 * v48 + (v47 + v45) * v96;
  v122 = 0u;
  v123 = 0u;
  v94 = (id)objc_msgSend(v93, "connections");
  v97 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v120, v134, 16);
  if (!v97)
    goto LABEL_121;
  v95 = *(_QWORD *)v121;
  v50 = *MEMORY[0x1E0CF2B70];
  v51 = *MEMORY[0x1E0CF2B90];
  do
  {
    v52 = 0;
    do
    {
      if (*(_QWORD *)v121 != v95)
        objc_enumerationMutation(v94);
      v53 = *(void **)(*((_QWORD *)&v120 + 1) + 8 * v52);
      objc_msgSend(v53, "output");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v99 = v53;
        v101 = v52;
        v118 = 0u;
        v119 = 0u;
        v116 = 0u;
        v117 = 0u;
        v54 = (void *)objc_msgSend(v53, "inputPorts");
        v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v116, v133, 16);
        if (!v55)
          goto LABEL_97;
        v56 = v55;
        v57 = *(_QWORD *)v117;
        while (1)
        {
          for (j = 0; j != v56; ++j)
          {
            if (*(_QWORD *)v117 != v57)
              objc_enumerationMutation(v54);
            v59 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * j);
            if (objc_msgSend((id)objc_msgSend(v59, "mediaType"), "isEqual:", v51))
            {
              v60 = (void *)objc_msgSend(v59, "input");
              v61 = (void *)objc_msgSend((id)objc_msgSend(v60, "videoDevice"), "activeFormat");
              Dimensions = CMVideoFormatDescriptionGetDimensions((CMVideoFormatDescriptionRef)objc_msgSend(v61, "formatDescription"));
              v114 = 0uLL;
              v115 = 0;
              if (v60)
              {
                objc_msgSend(v60, "videoMinFrameDurationOverride");
                if ((v112 & 0x100000000) != 0)
                {
                  objc_msgSend(v60, "videoMinFrameDurationOverride");
                  goto LABEL_86;
                }
              }
              else
              {
                v111 = 0;
                v112 = 0;
                v113 = 0;
              }
              if (v61)
              {
                objc_msgSend(v61, "lowestSupportedVideoFrameDuration");
              }
              else
              {
                v114 = 0uLL;
                v115 = 0;
              }
LABEL_86:
              v63 = DWORD2(v114);
              v64 = v114;
              objc_msgSend((id)objc_msgSend(v61, "figCaptureSourceVideoFormat"), "format");
              if (FigCapturePixelFormatIsTenBit())
                v65 = 1.25;
              else
                v65 = 1.0;
              objc_msgSend((id)objc_msgSend(v61, "figCaptureSourceVideoFormat"), "format");
              if (FigCapturePixelFormatIs422())
                v65 = (float)(v65 * 4.0) / 3.0;
              v49 += (int)(float)(v5
                                + (float)((float)((float)((float)((float)v63 / (float)v64)
                                                        * (float)(Dimensions.height * Dimensions.width))
                                                * (float)(v6 * v65))
                                        / 1000000.0));
              continue;
            }
          }
          v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v116, v133, 16);
          if (!v56)
          {
LABEL_97:
            if (objc_msgSend(v99, "activeVideoStabilizationMode"))
              v49 += 20;
            v52 = v101;
            goto LABEL_100;
          }
        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v99 = v53;
        v101 = v52;
        goto LABEL_97;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v109 = 0u;
        v110 = 0u;
        v107 = 0u;
        v108 = 0u;
        v66 = (void *)objc_msgSend(v53, "inputPorts");
        v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v107, v132, 16);
        if (v67)
        {
          v68 = v67;
          v69 = *(_QWORD *)v108;
          do
          {
            for (k = 0; k != v68; ++k)
            {
              if (*(_QWORD *)v108 != v69)
                objc_enumerationMutation(v66);
              v71 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * k);
              if (objc_msgSend((id)objc_msgSend(v71, "mediaType"), "isEqual:", v50))
              {
                v72 = (void *)objc_msgSend(v71, "input");
                if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(v72, "videoDevice"), "deviceType"), "isEqualToString:", CFSTR("AVCaptureDeviceTypeBuiltInTrueDepthCamera")))
                {
                  v73 = (void *)objc_msgSend(v72, "device");
                  v114 = 0uLL;
                  v115 = 0;
                  v74 = (void *)objc_msgSend(v73, "activeDepthDataFormat");
                  if (v74)
                  {
                    objc_msgSend(v74, "lowestSupportedVideoFrameDuration");
                  }
                  else
                  {
                    v114 = 0uLL;
                    v115 = 0;
                  }
                  if (v72)
                  {
                    objc_msgSend(v72, "videoMinFrameDurationOverride");
                    if ((unsigned __int128)0 >> 96)
                    {
                      v114 = 0uLL;
                      v115 = 0;
                    }
                  }
                  obja = (int)(float)((float)((float)((float)SDWORD2(v114) / (float)(uint64_t)v114) * 22.467)
                                    + (float)obja);
                }
              }
            }
            v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v107, v132, 16);
          }
          while (v68);
        }
      }
LABEL_100:
      ++v52;
    }
    while (v52 != v97);
    v75 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v120, v134, 16);
    v97 = v75;
  }
  while (v75);
LABEL_121:
  v76 = (float)((float)v49 * 1.2);
  v77 = (float)((float)obja * 1.25);
  v78 = ((double)v76 / 0.835 * 0.165);
  v79 = ((double)v77 * 0.25) + v76;
  if (avcmcs_computeSystemPressureCost_sSlopeIndicesOnce != -1)
    dispatch_once(&avcmcs_computeSystemPressureCost_sSlopeIndicesOnce, &__block_literal_global_14);
  v80 = v79 + v78;
  ModelSpecificName = FigCaptureGetModelSpecificName();
  v82 = 0;
  while (!objc_msgSend((id)avcmcs_computeSystemPressureCost_allSlopes[v82], "containsObject:", ModelSpecificName))
  {
    v82 += 4;
    if (v82 == 28)
    {
      v83 = 0.0;
      goto LABEL_136;
    }
  }
  v84 = (float *)&avcmcs_computeSystemPressureCost_allSlopes[v82];
  v85 = (float)v77;
  v86 = *((float *)&avcmcs_computeSystemPressureCost_allSlopes[v82 + 1] + 1)
      + (float)(*(float *)&avcmcs_computeSystemPressureCost_allSlopes[v82 + 1] * (float)v77);
  v87 = (float)v80;
  if (v86 >= (float)v80
    || (v88 = v84[5] + (float)(v84[4] * v85), v89 = v84[7] + (float)(v84[6] * v85), v89 == 0.0) && v88 == 0.0)
  {
    v83 = v87 / v86;
  }
  else
  {
    if (v88 >= v87 || v89 == 0.0)
    {
      v90 = (float)(v87 - v86) / (float)(v88 - v86);
      v91 = 1.0;
    }
    else
    {
      v90 = (float)(v87 - v88) / (float)(v89 - v88);
      v91 = 2.0;
    }
    v83 = v90 + v91;
  }
LABEL_136:
  if (v83 != v93[5])
  {
    objc_msgSend(v93, "willChangeValueForKey:", CFSTR("systemPressureCost"));
    v93[5] = v83;
    objc_msgSend(v93, "didChangeValueForKey:", CFSTR("systemPressureCost"));
  }
}

- (id)_physicalDevicePowerInfoSet
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  float v35;
  void *v36;
  float v37;
  float v38;
  int v39;
  void *v40;
  unsigned int v41;
  int v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  int v47;
  uint64_t v48;
  float v49;
  uint64_t j;
  void *v51;
  void *v52;
  float v53;
  int v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  NSArray *obj;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  id v79;
  id v80;
  id v81;
  uint64_t v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  uint64_t v87;
  id v88;
  unsigned int v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  id v94;
  uint64_t v95;
  unsigned int v96;
  uint64_t v97;
  void *v98;
  void *v99;
  unsigned int v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  uint64_t v125;
  __int128 v126;
  uint64_t v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  const __CFString *v140;
  void *v141;
  _QWORD v142[6];
  _QWORD v143[6];
  _BYTE v144[128];
  _BYTE v145[128];
  void *v146;
  _BYTE v147[128];
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  uint64_t v151;
  _BYTE v152[128];
  _BYTE v153[128];
  uint64_t v154;

  v154 = *MEMORY[0x1E0C80C00];
  v99 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v85 = (id)objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  obj = -[AVCaptureSession connections](self, "connections");
  v72 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v136, v153, 16);
  v3 = 0;
  if (v72)
  {
    v71 = *(_QWORD *)v137;
    v4 = *MEMORY[0x1E0CF2B90];
    v78 = (id)*MEMORY[0x1E0CF2B68];
    v74 = *MEMORY[0x1E0CF2B70];
    v75 = *MEMORY[0x1E0CF2B90];
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v137 != v71)
        {
          v6 = v5;
          objc_enumerationMutation(obj);
          v5 = v6;
        }
        v73 = v5;
        v7 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * v5);
        objc_msgSend(v7, "output");
        v92 = v7;
        if (objc_msgSend(v7, "isActive"))
        {
          if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
            && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
            || (objc_msgSend(v7, "isEnabled") & 1) != 0
            || objc_msgSend(v7, "isLive"))
          {
            v134 = 0u;
            v135 = 0u;
            v132 = 0u;
            v133 = 0u;
            v80 = (id)objc_msgSend(v7, "inputPorts");
            v8 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v132, v152, 16);
            if (v8)
            {
              v9 = v8;
              v10 = *(_QWORD *)v133;
              v76 = *(_QWORD *)v133;
              do
              {
                v11 = 0;
                v77 = v9;
                do
                {
                  if (*(_QWORD *)v133 != v10)
                    objc_enumerationMutation(v80);
                  v12 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * v11);
                  v90 = (void *)objc_msgSend(v12, "input");
                  v13 = (void *)objc_msgSend(v90, "videoDevice");
                  if (objc_msgSend(v13, "hasMediaType:", v4))
                  {
                    if (objc_msgSend(v13, "isVirtualDevice")
                      && objc_msgSend((id)objc_msgSend(v12, "mediaType"), "isEqual:", v74))
                    {
                      v14 = (void *)objc_msgSend(v13, "constituentDevices");
                    }
                    else
                    {
                      v15 = objc_msgSend(v12, "sourceDeviceType");
                      v16 = objc_msgSend(v13, "deviceType");
                      v17 = (uint64_t)v13;
                      if (v15 != v16)
                        v17 = objc_msgSend(v13, "constituentDeviceWithDeviceType:", v15);
                      v151 = v17;
                      v14 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v151, 1);
                    }
                    v130 = 0u;
                    v131 = 0u;
                    v128 = 0u;
                    v129 = 0u;
                    v88 = v14;
                    v97 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v128, v150, 16);
                    if (v97)
                    {
                      v86 = v13;
                      v83 = v3;
                      v95 = *(_QWORD *)v129;
                      do
                      {
                        v18 = 0;
                        do
                        {
                          if (*(_QWORD *)v129 != v95)
                            objc_enumerationMutation(v88);
                          v102 = v18;
                          v19 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * v18);
                          v20 = objc_msgSend(v19, "deviceType");
                          v21 = objc_msgSend(v19, "uniqueID");
                          v22 = (void *)objc_msgSend(v99, "objectForKeyedSubscript:", v21);
                          if (!v22)
                          {
                            v22 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                            objc_msgSend(v99, "setObject:forKeyedSubscript:", v22, v21);
                            objc_msgSend(v22, "setObject:forKeyedSubscript:", v86, CFSTR("VideoDevice"));
                            objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99E20], "set"), CFSTR("SourceDeviceTypesInUse"));
                            objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0C99E08], "dictionary"), CFSTR("VISEnabledForSourceDeviceType"));
                            v126 = 0uLL;
                            v127 = 0;
                            v23 = (void *)objc_msgSend(v86, "activeFormat");
                            if (v23)
                            {
                              objc_msgSend(v23, "lowestSupportedVideoFrameDuration");
                            }
                            else
                            {
                              v126 = 0uLL;
                              v127 = 0;
                            }
                            v124 = 0uLL;
                            v125 = 0;
                            if (v90)
                            {
                              objc_msgSend(v90, "videoMinFrameDurationOverride");
                              if ((BYTE12(v124) & 1) != 0)
                              {
                                HIDWORD(v24) = DWORD1(v124);
                                v126 = v124;
                                v127 = v125;
                              }
                            }
                            *(float *)&v24 = (float)SDWORD2(v126) / (float)(uint64_t)v126;
                            objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24), CFSTR("MaxActiveFrameRate"));
                          }
                          objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("SourceDeviceTypesInUse")), "addObject:", v20);
                          if (objc_msgSend(v92, "activeVideoStabilizationMode"))
                          {
                            if (objc_msgSend((id)objc_msgSend(v19, "constituentDevices"), "count"))
                            {
                              v122 = 0u;
                              v123 = 0u;
                              v120 = 0u;
                              v121 = 0u;
                              v25 = (void *)objc_msgSend(v19, "constituentDevices");
                              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v120, v149, 16);
                              if (v26)
                              {
                                v27 = v26;
                                v28 = *(_QWORD *)v121;
                                do
                                {
                                  for (i = 0; i != v27; ++i)
                                  {
                                    if (*(_QWORD *)v121 != v28)
                                      objc_enumerationMutation(v25);
                                    objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("VISEnabledForSourceDeviceType")), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), objc_msgSend(*(id *)(*((_QWORD *)&v120 + 1) + 8 * i), "deviceType"));
                                  }
                                  v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v120, v149, 16);
                                }
                                while (v27);
                              }
                            }
                            else
                            {
                              objc_msgSend((id)objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("VISEnabledForSourceDeviceType")), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1), v20);
                            }
                          }
                          v18 = v102 + 1;
                        }
                        while (v102 + 1 != v97);
                        v97 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v128, v150, 16);
                      }
                      while (v97);
                      v3 = v83;
                      v4 = v75;
                      v10 = v76;
                      v9 = v77;
                    }
                  }
                  else if ((objc_msgSend(v13, "hasMediaType:", v78) & (v3 == 0)) != 0)
                  {
                    v3 = v13;
                  }
                  ++v11;
                }
                while (v11 != v9);
                v9 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v132, v152, 16);
              }
              while (v9);
            }
          }
        }
        v5 = v73 + 1;
      }
      while (v73 + 1 != v72);
      v72 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v136, v153, 16);
    }
    while (v72);
  }
  v84 = v3;
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v79 = (id)objc_msgSend(v99, "allValues");
  v82 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v116, v148, 16);
  if (v82)
  {
    v81 = *(id *)v117;
    do
    {
      v30 = 0;
      do
      {
        if (*(id *)v117 != v81)
          objc_enumerationMutation(v79);
        v91 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * v30);
        v31 = (void *)objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("VideoDevice"));
        v32 = (void *)objc_msgSend(v31, "activeFormat");
        v126 = 0uLL;
        v127 = 0;
        v98 = v32;
        if (v32)
        {
          objc_msgSend(v32, "lowestSupportedVideoFrameDuration");
          v33 = DWORD2(v126);
          v34 = v126;
        }
        else
        {
          v34 = 0;
          v33 = 0;
        }
        v87 = v30;
        v35 = (float)v33 / (float)v34;
        v36 = (void *)objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("MaxActiveFrameRate"));
        v37 = v35;
        if (v36)
        {
          objc_msgSend(v36, "floatValue");
          v37 = v38;
        }
        v39 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v31, "activeFormat"), "figCaptureSourceVideoFormat"), "isVideoHDRFusionSupported");
        v96 = objc_msgSend(v31, "isVideoHDREnabled") | v39;
        v40 = (void *)objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("SourceDeviceTypesInUse"));
        v103 = v40;
        if (objc_msgSend((id)objc_msgSend(v31, "constituentDevices"), "count")
          && objc_msgSend(v40, "containsObject:", objc_msgSend(v31, "deviceType")))
        {
          v41 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("VISEnabledForSourceDeviceType")), "objectForKeyedSubscript:", objc_msgSend(v31, "deviceType")), "BOOLValue");
          if (v35 <= 30.0)
            v42 = 3;
          else
            v42 = 2;
          v112 = 0u;
          v113 = 0u;
          v89 = v41;
          if (!v41)
            v42 = 1;
          v100 = v42;
          v114 = 0uLL;
          v115 = 0uLL;
          v93 = v31;
          v43 = (void *)objc_msgSend(v31, "constituentDevices");
          v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v112, v147, 16);
          if (v44)
          {
            v45 = v44;
            v46 = 0;
            v47 = 0;
            v48 = *(_QWORD *)v113;
            if (v96)
              v49 = 2.0;
            else
              v49 = 1.0;
            do
            {
              for (j = 0; j != v45; ++j)
              {
                if (*(_QWORD *)v113 != v48)
                  objc_enumerationMutation(v43);
                v51 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * j);
                if ((objc_msgSend(v40, "containsObject:", objc_msgSend(v51, "deviceType")) & 1) == 0)
                {
                  v52 = avcmcs_constituentDeviceFormatFromVirtualDeviceFormat(v98, v51);
                  v53 = (float)(int)objc_msgSend(v52, "baseSensorPowerConsumption");
                  LODWORD(v52) = (int)(float)(v53
                                            + (float)((float)(v37
                                                            * (float)(int)objc_msgSend(v52, "variableSensorPowerConsumption"))* v49));
                  v54 = (_DWORD)v52
                      + (int)(float)((float)((float)(v37 / 30.0) * v49)
                                   * (float)(int)objc_msgSend(v51, "powerConsumptionAt30FPSForOISMode:", v100));
                  v40 = v103;
                  if (v54 > v47)
                  {
                    v46 = v51;
                    v47 = v54;
                  }
                }
              }
              v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v112, v147, 16);
            }
            while (v45);
          }
          else
          {
            v46 = 0;
          }
          v31 = v93;
          objc_msgSend(v40, "removeObject:", objc_msgSend(v93, "deviceType"));
          if (v46)
          {
            objc_msgSend(v40, "addObject:", objc_msgSend(v46, "deviceType"));
            objc_msgSend((id)objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("VISEnabledForSourceDeviceType")), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v89), objc_msgSend(v46, "deviceType"));
          }
        }
        v55 = (void *)objc_msgSend(v31, "constituentDevices");
        if (!objc_msgSend(v55, "count"))
        {
          v146 = v31;
          v55 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v146, 1);
        }
        v110 = 0u;
        v111 = 0u;
        v108 = 0u;
        v109 = 0u;
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v108, v145, 16);
        if (v56)
        {
          v57 = v56;
          v101 = *(_QWORD *)v109;
          v94 = v55;
          do
          {
            for (k = 0; k != v57; ++k)
            {
              if (*(_QWORD *)v109 != v101)
                objc_enumerationMutation(v94);
              v59 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * k);
              v60 = objc_msgSend(v40, "containsObject:", objc_msgSend(v59, "deviceType"));
              v104 = 0u;
              v105 = 0u;
              v106 = 0u;
              v107 = 0u;
              v61 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v104, v144, 16);
              if (v61)
              {
                v62 = v61;
                v63 = *(_QWORD *)v105;
LABEL_99:
                v64 = 0;
                while (1)
                {
                  if (*(_QWORD *)v105 != v63)
                    objc_enumerationMutation(v85);
                  v65 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v64);
                  if ((void *)objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("Device")) == v59)
                    break;
                  if (v62 == ++v64)
                  {
                    v62 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v104, v144, 16);
                    if (v62)
                      goto LABEL_99;
                    goto LABEL_109;
                  }
                }
                if (!v65)
                  goto LABEL_109;
                if ((_DWORD)v60)
                {
                  objc_msgSend(v85, "removeObject:", v65);
                  goto LABEL_110;
                }
              }
              else
              {
LABEL_109:
                if ((_DWORD)v60)
                {
LABEL_110:
                  v66 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("VISEnabledForSourceDeviceType")), "objectForKeyedSubscript:", objc_msgSend(v59, "deviceType")), "BOOLValue");
                  v67 = (int)v37;
                }
                else
                {
                  v66 = 0;
                  v67 = 7;
                }
                v68 = avcmcs_constituentDeviceFormatFromVirtualDeviceFormat(v98, v59);
                v143[0] = v59;
                v142[0] = CFSTR("Device");
                v142[1] = CFSTR("VISEnabled");
                v143[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v66);
                v143[2] = v68;
                v142[2] = CFSTR("ActiveFormat");
                v142[3] = CFSTR("MaxActiveFrameRate");
                v143[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v67);
                v142[4] = CFSTR("ISPProcessingEnabled");
                v143[4] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v60);
                v142[5] = CFSTR("SIFREnabled");
                v143[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v96);
                objc_msgSend(v85, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v143, v142, 6));
              }
              v40 = v103;
            }
            v57 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v108, v145, 16);
          }
          while (v57);
        }
        v30 = v87 + 1;
      }
      while (v87 + 1 != v82);
      v82 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v116, v148, 16);
    }
    while (v82);
  }
  if (v84)
  {
    v140 = CFSTR("Device");
    v141 = v84;
    objc_msgSend(v85, "addObject:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1));
  }
  return v85;
}

@end
