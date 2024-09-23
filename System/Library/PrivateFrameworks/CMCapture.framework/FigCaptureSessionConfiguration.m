@implementation FigCaptureSessionConfiguration

- (void)setTccIdentity:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

BOOL __54__FigCaptureSessionConfiguration_initWithXPCEncoding___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  FigCaptureSourceConfiguration *v4;

  v4 = -[FigCaptureSourceConfiguration initWithXPCEncoding:]([FigCaptureSourceConfiguration alloc], "initWithXPCEncoding:", a3);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
  else
  {
    fig_log_get_emitter();
    FigDebugAssert3();
  }
  return v4 != 0;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  NSArray *v4;
  xpc_object_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  xpc_object_t v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  uint64_t v18;
  int64_t v19;
  void *v20;
  NSString *v21;
  void *v22;
  void *v23;
  FigCaptureSmartStyle *smartStyle;
  id v25;
  FigCaptureSessionConfiguration *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "configurationID", -[FigCaptureSessionConfiguration configurationID](self, "configurationID"));
  xpc_dictionary_set_BOOL(v3, "clientExpectsCameraMountedInLandscapeOrientation", -[FigCaptureSessionConfiguration clientExpectsCameraMountedInLandscapeOrientation](self, "clientExpectsCameraMountedInLandscapeOrientation"));
  v4 = -[FigCaptureSessionConfiguration sourceConfigurations](self, "sourceConfigurations");
  v5 = xpc_array_create(0, 0);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v4);
        v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "copyXPCEncoding");
        xpc_array_append_value(v5, v10);
        xpc_release(v10);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v7);
  }
  xpc_dictionary_set_value(v3, "sources", v5);
  xpc_release(v5);
  v11 = xpc_array_create(0, 0);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v27 = self;
  v12 = -[FigCaptureSessionConfiguration connectionConfigurations](self, "connectionConfigurations");
  v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
        v18 = -[NSArray indexOfObject:](v4, "indexOfObject:", objc_msgSend(v17, "sourceConfiguration"));
        if (v18 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v19 = v18;
          v20 = (void *)objc_msgSend(v17, "copyXPCEncoding");
          xpc_dictionary_set_int64(v20, "sourceIndex", v19);
          xpc_array_append_value(v11, v20);
          xpc_release(v20);
        }
      }
      v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v14);
  }
  xpc_dictionary_set_value(v3, "connections", v11);
  xpc_release(v11);
  v21 = -[FigCaptureSessionConfiguration sessionPreset](v27, "sessionPreset");
  if (v21)
    xpc_dictionary_set_string(v3, "sessionPreset", -[NSString UTF8String](v21, "UTF8String"));
  xpc_dictionary_set_BOOL(v3, "usesAppAudioSession", -[FigCaptureSessionConfiguration usesAppAudioSession](v27, "usesAppAudioSession"));
  xpc_dictionary_set_BOOL(v3, "configuresAppAudioSession", -[FigCaptureSessionConfiguration configuresAppAudioSession](v27, "configuresAppAudioSession"));
  xpc_dictionary_set_BOOL(v3, "configuresAppAudioSessionToMixWithOthers", -[FigCaptureSessionConfiguration configuresAppAudioSessionToMixWithOthers](v27, "configuresAppAudioSessionToMixWithOthers"));
  xpc_dictionary_set_BOOL(v3, "allowedToRunInMultitaskingMode", -[FigCaptureSessionConfiguration allowedToRunInMultitaskingMode](v27, "allowedToRunInMultitaskingMode"));
  xpc_dictionary_set_BOOL(v3, "isMultiCamSession", -[FigCaptureSessionConfiguration isMultiCamSession](v27, "isMultiCamSession"));
  xpc_dictionary_set_BOOL(v3, "xctestAuthorizedToStealDevice", -[FigCaptureSessionConfiguration xctestAuthorizedToStealDevice](v27, "xctestAuthorizedToStealDevice"));
  xpc_dictionary_set_BOOL(v3, "checkIfFileAlreadyExistForMFO", -[FigCaptureSessionConfiguration checkIfFileAlreadyExistForMFO](v27, "checkIfFileAlreadyExistForMFO"));
  xpc_dictionary_set_BOOL(v3, "continuityCameraIsWired", -[FigCaptureSessionConfiguration continuityCameraIsWired](v27, "continuityCameraIsWired"));
  xpc_dictionary_set_int64(v3, "continuityCameraClientDeviceClass", -[FigCaptureSessionConfiguration continuityCameraClientDeviceClass](v27, "continuityCameraClientDeviceClass"));
  xpc_dictionary_set_BOOL(v3, "clientIsVOIP", -[FigCaptureSessionConfiguration clientIsVOIP](v27, "clientIsVOIP"));
  xpc_dictionary_set_BOOL(v3, "suppressVideoEffects", -[FigCaptureSessionConfiguration suppressVideoEffects](v27, "suppressVideoEffects"));
  if (-[FigCaptureSessionConfiguration tccIdentity](v27, "tccIdentity"))
  {
    -[FigCaptureSessionConfiguration tccIdentity](v27, "tccIdentity");
    v22 = (void *)tcc_identity_copy_external_representation();
    v23 = (void *)_CFXPCCreateXPCObjectFromCFObject();

    xpc_dictionary_set_value(v3, "tccIdentity", v23);
  }
  xpc_dictionary_set_BOOL(v3, "smartStyleRenderingEnabled", -[FigCaptureSessionConfiguration smartStyleRenderingEnabled](v27, "smartStyleRenderingEnabled"));
  xpc_dictionary_set_int64(v3, "smartStyleControlMode", -[FigCaptureSessionConfiguration smartStyleControlMode](v27, "smartStyleControlMode"));
  smartStyle = v27->_smartStyle;
  if (smartStyle)
  {
    v25 = -[FigCaptureSmartStyle copyXPCEncoding](smartStyle, "copyXPCEncoding");
    xpc_dictionary_set_value(v3, "smartStyle", v25);
    xpc_release(v25);
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int64_t v23;
  FigCaptureSmartStyle *v24;
  NSArray *v25;
  int v26;
  int v27;
  int v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t type;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  BOOL v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  if (a3 == self)
  {
    LOBYTE(v14) = 1;
    return v14;
  }
  v39 = v5;
  v40 = v4;
  v41 = v3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_30;
  v13 = -[FigCaptureSessionConfiguration configurationID](self, "configurationID");
  if (v13 != objc_msgSend(a3, "configurationID"))
    goto LABEL_30;
  v14 = -[NSString isEqual:](-[FigCaptureSessionConfiguration sessionPreset](self, "sessionPreset"), "isEqual:", objc_msgSend(a3, "sessionPreset"));
  if (!v14)
    return v14;
  v15 = -[FigCaptureSessionConfiguration usesAppAudioSession](self, "usesAppAudioSession");
  if (v15 != objc_msgSend(a3, "usesAppAudioSession"))
    goto LABEL_30;
  v16 = -[FigCaptureSessionConfiguration configuresAppAudioSession](self, "configuresAppAudioSession");
  if (v16 != objc_msgSend(a3, "configuresAppAudioSession"))
    goto LABEL_30;
  v17 = -[FigCaptureSessionConfiguration configuresAppAudioSessionToMixWithOthers](self, "configuresAppAudioSessionToMixWithOthers");
  if (v17 != objc_msgSend(a3, "configuresAppAudioSessionToMixWithOthers"))
    goto LABEL_30;
  v18 = -[FigCaptureSessionConfiguration allowedToRunInMultitaskingMode](self, "allowedToRunInMultitaskingMode");
  if (v18 != objc_msgSend(a3, "allowedToRunInMultitaskingMode"))
    goto LABEL_30;
  v19 = -[FigCaptureSessionConfiguration isMultiCamSession](self, "isMultiCamSession");
  if (v19 != objc_msgSend(a3, "isMultiCamSession"))
    goto LABEL_30;
  v20 = -[FigCaptureSessionConfiguration xctestAuthorizedToStealDevice](self, "xctestAuthorizedToStealDevice");
  if (v20 != objc_msgSend(a3, "xctestAuthorizedToStealDevice"))
    goto LABEL_30;
  v21 = -[FigCaptureSessionConfiguration clientExpectsCameraMountedInLandscapeOrientation](self, "clientExpectsCameraMountedInLandscapeOrientation");
  if (v21 != objc_msgSend(a3, "clientExpectsCameraMountedInLandscapeOrientation"))
    goto LABEL_30;
  v22 = -[FigCaptureSessionConfiguration smartStyleRenderingEnabled](self, "smartStyleRenderingEnabled");
  if (v22 != objc_msgSend(a3, "smartStyleRenderingEnabled"))
    goto LABEL_30;
  v23 = -[FigCaptureSessionConfiguration smartStyleControlMode](self, "smartStyleControlMode");
  if (v23 != objc_msgSend(a3, "smartStyleControlMode"))
    goto LABEL_30;
  v24 = -[FigCaptureSessionConfiguration smartStyle](self, "smartStyle");
  if (v24 == (FigCaptureSmartStyle *)objc_msgSend(a3, "smartStyle")
    || (v14 = -[FigCaptureSmartStyle isEqual:](-[FigCaptureSessionConfiguration smartStyle](self, "smartStyle"), "isEqual:", objc_msgSend(a3, "smartStyle"))) != 0)
  {
    v25 = -[FigCaptureSessionConfiguration connectionConfigurations](self, "connectionConfigurations", v8, v7, v6, v39, v40, v41, v9, v10);
    if (v25 == (NSArray *)objc_msgSend(a3, "connectionConfigurations")
      || (v14 = -[NSArray isEqual:](-[FigCaptureSessionConfiguration connectionConfigurations](self, "connectionConfigurations"), "isEqual:", objc_msgSend(a3, "connectionConfigurations"))) != 0)
    {
      v26 = -[FigCaptureSessionConfiguration continuityCameraIsWired](self, "continuityCameraIsWired");
      if (v26 == objc_msgSend(a3, "continuityCameraIsWired"))
      {
        v27 = -[FigCaptureSessionConfiguration continuityCameraClientDeviceClass](self, "continuityCameraClientDeviceClass");
        if (v27 == objc_msgSend(a3, "continuityCameraClientDeviceClass"))
        {
          v28 = -[FigCaptureSessionConfiguration clientIsVOIP](self, "clientIsVOIP");
          if (v28 == objc_msgSend(a3, "clientIsVOIP"))
          {
            v29 = -[FigCaptureSessionConfiguration suppressVideoEffects](self, "suppressVideoEffects");
            if (v29 == objc_msgSend(a3, "suppressVideoEffects"))
            {
              if (!self->_tccIdentity)
                goto LABEL_29;
              if (objc_msgSend(a3, "tccIdentity"))
              {
                v30 = (void *)MEMORY[0x1E0CB3940];
                -[FigCaptureSessionConfiguration tccIdentity](self, "tccIdentity");
                v31 = (void *)objc_msgSend(v30, "stringWithUTF8String:", tcc_identity_get_identifier());
                -[FigCaptureSessionConfiguration tccIdentity](self, "tccIdentity");
                type = tcc_identity_get_type();
                v33 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(a3, "tccIdentity");
                v34 = objc_msgSend(v33, "stringWithUTF8String:", tcc_identity_get_identifier());
                objc_msgSend(a3, "tccIdentity");
                v35 = tcc_identity_get_type();
                v36 = objc_msgSend(v31, "isEqualToString:", v34);
                LOBYTE(v14) = 0;
                if (!v36 || type != v35)
                  return v14;
LABEL_32:
                v37 = -[FigCaptureSessionConfiguration checkIfFileAlreadyExistForMFO](self, "checkIfFileAlreadyExistForMFO");
                LOBYTE(v14) = v37 ^ objc_msgSend(a3, "checkIfFileAlreadyExistForMFO") ^ 1;
                return v14;
              }
              if (!self->_tccIdentity)
              {
LABEL_29:
                if (!objc_msgSend(a3, "tccIdentity"))
                  goto LABEL_32;
              }
            }
          }
        }
      }
LABEL_30:
      LOBYTE(v14) = 0;
    }
  }
  return v14;
}

- (int64_t)configurationID
{
  return self->_configurationID;
}

- (NSString)sessionPreset
{
  return self->_sessionPreset;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v5, "setConfigurationID:", -[FigCaptureSessionConfiguration configurationID](self, "configurationID"));
  objc_msgSend(v5, "setSessionPreset:", -[FigCaptureSessionConfiguration sessionPreset](self, "sessionPreset"));
  objc_msgSend(v5, "setUsesAppAudioSession:", -[FigCaptureSessionConfiguration usesAppAudioSession](self, "usesAppAudioSession"));
  objc_msgSend(v5, "setConfiguresAppAudioSession:", -[FigCaptureSessionConfiguration configuresAppAudioSession](self, "configuresAppAudioSession"));
  objc_msgSend(v5, "setConfiguresAppAudioSessionToMixWithOthers:", -[FigCaptureSessionConfiguration configuresAppAudioSessionToMixWithOthers](self, "configuresAppAudioSessionToMixWithOthers"));
  objc_msgSend(v5, "setAllowedToRunInMultitaskingMode:", -[FigCaptureSessionConfiguration allowedToRunInMultitaskingMode](self, "allowedToRunInMultitaskingMode"));
  objc_msgSend(v5, "setMultiCamSession:", -[FigCaptureSessionConfiguration isMultiCamSession](self, "isMultiCamSession"));
  objc_msgSend(v5, "setXctestAuthorizedToStealDevice:", -[FigCaptureSessionConfiguration xctestAuthorizedToStealDevice](self, "xctestAuthorizedToStealDevice"));
  objc_msgSend(v5, "setContinuityCameraIsWired:", -[FigCaptureSessionConfiguration continuityCameraIsWired](self, "continuityCameraIsWired"));
  objc_msgSend(v5, "setContinuityCameraClientDeviceClass:", -[FigCaptureSessionConfiguration continuityCameraClientDeviceClass](self, "continuityCameraClientDeviceClass"));
  objc_msgSend(v5, "setClientIsVOIP:", -[FigCaptureSessionConfiguration clientIsVOIP](self, "clientIsVOIP"));
  objc_msgSend(v5, "setSuppressVideoEffects:", -[FigCaptureSessionConfiguration suppressVideoEffects](self, "suppressVideoEffects"));
  objc_msgSend(v5, "setCheckIfFileAlreadyExistForMFO:", -[FigCaptureSessionConfiguration checkIfFileAlreadyExistForMFO](self, "checkIfFileAlreadyExistForMFO"));
  objc_msgSend(v5, "setClientExpectsCameraMountedInLandscapeOrientation:", -[FigCaptureSessionConfiguration clientExpectsCameraMountedInLandscapeOrientation](self, "clientExpectsCameraMountedInLandscapeOrientation"));
  if (-[FigCaptureSessionConfiguration tccIdentity](self, "tccIdentity"))
  {
    -[FigCaptureSessionConfiguration tccIdentity](self, "tccIdentity");
    tcc_identity_get_type();
    -[FigCaptureSessionConfiguration tccIdentity](self, "tccIdentity");
    tcc_identity_get_identifier();
    v6 = (void *)tcc_identity_create();
    objc_msgSend(v5, "setTccIdentity:", v6);

  }
  objc_msgSend(v5, "setSmartStyleRenderingEnabled:", -[FigCaptureSessionConfiguration smartStyleRenderingEnabled](self, "smartStyleRenderingEnabled"));
  objc_msgSend(v5, "setSmartStyleControlMode:", -[FigCaptureSessionConfiguration smartStyleControlMode](self, "smartStyleControlMode"));
  objc_msgSend(v5, "setSmartStyle:", -[FigCaptureSessionConfiguration smartStyle](self, "smartStyle"));
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = -[FigCaptureSessionConfiguration connectionConfigurations](self, "connectionConfigurations", 0);
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "copyWithZone:", a3);
        objc_msgSend(v5, "addConnectionConfiguration:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }
  return v5;
}

- (BOOL)clientExpectsCameraMountedInLandscapeOrientation
{
  return self->_clientExpectsCameraMountedInLandscapeOrientation;
}

- (void)addConnectionConfiguration:(id)a3
{
  -[NSMutableArray addObject:](self->_connections, "addObject:", a3);
}

- (void)setConfigurationID:(int64_t)a3
{
  self->_configurationID = a3;
}

- (void)setSuppressVideoEffects:(BOOL)a3
{
  self->_suppressVideoEffects = a3;
}

- (void)setContinuityCameraIsWired:(BOOL)a3
{
  self->_continuityCameraIsWired = a3;
}

- (OS_tcc_identity)tccIdentity
{
  return self->_tccIdentity;
}

- (void)setXctestAuthorizedToStealDevice:(BOOL)a3
{
  self->_xctestAuthorizedToStealDevice = a3;
}

- (void)setUsesAppAudioSession:(BOOL)a3
{
  self->_usesAppAudioSession = a3;
}

- (void)setSessionPreset:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (void)setMultiCamSession:(BOOL)a3
{
  self->_isMultiCamSession = a3;
}

- (void)setContinuityCameraClientDeviceClass:(int)a3
{
  self->_continuityCameraClientDeviceClass = a3;
}

- (void)setConfiguresAppAudioSession:(BOOL)a3
{
  self->_configuresAppAudioSession = a3;
}

- (void)setClientExpectsCameraMountedInLandscapeOrientation:(BOOL)a3
{
  self->_clientExpectsCameraMountedInLandscapeOrientation = a3;
}

- (void)setCheckIfFileAlreadyExistForMFO:(BOOL)a3
{
  self->_checkIfFileAlreadyExistForMFO = a3;
}

- (void)setAllowedToRunInMultitaskingMode:(BOOL)a3
{
  self->_allowedToRunInMultitaskingMode = a3;
}

- (FigCaptureSessionConfiguration)init
{
  char *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FigCaptureSessionConfiguration;
  v2 = -[FigCaptureSessionConfiguration init](&v4, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 1) = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v2[32] = 1;
    v2[56] = 1;
    *(_WORD *)(v2 + 33) = 1;
    *(_WORD *)(v2 + 57) = 0;
    *((_QWORD *)v2 + 8) = 0;
  }
  return (FigCaptureSessionConfiguration *)v2;
}

- (NSString)description
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@ %p: ID %lld, %@ multiCam: %d, appAudio: %d, autoConfig: %d, mixesWithOthers: %d, runWhileMultitasking: %d, checkIfFileAlreadyExistForMFO: %d"), objc_opt_class(), self, -[FigCaptureSessionConfiguration configurationID](self, "configurationID"), -[FigCaptureSessionConfiguration sessionPreset](self, "sessionPreset"), -[FigCaptureSessionConfiguration isMultiCamSession](self, "isMultiCamSession"), -[FigCaptureSessionConfiguration usesAppAudioSession](self, "usesAppAudioSession"), -[FigCaptureSessionConfiguration configuresAppAudioSession](self, "configuresAppAudioSession"), -[FigCaptureSessionConfiguration configuresAppAudioSessionToMixWithOthers](self, "configuresAppAudioSessionToMixWithOthers"), -[FigCaptureSessionConfiguration allowedToRunInMultitaskingMode](self, "allowedToRunInMultitaskingMode"), -[FigCaptureSessionConfiguration checkIfFileAlreadyExistForMFO](self, "checkIfFileAlreadyExistForMFO"));
  if (-[FigCaptureSessionConfiguration xctestAuthorizedToStealDevice](self, "xctestAuthorizedToStealDevice"))
    objc_msgSend(v3, "appendString:", CFSTR(", xctestSteals: 1"));
  if (-[FigCaptureSessionConfiguration continuityCameraIsWired](self, "continuityCameraIsWired"))
    objc_msgSend(v3, "appendString:", CFSTR(", continuityCameraIsWired: YES"));
  if (-[FigCaptureSessionConfiguration continuityCameraClientDeviceClass](self, "continuityCameraClientDeviceClass"))
    objc_msgSend(v3, "appendFormat:", CFSTR(", continuityCameraClientDeviceClass: %@"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[FigCaptureSessionConfiguration continuityCameraClientDeviceClass](self, "continuityCameraClientDeviceClass")));
  if (-[FigCaptureSessionConfiguration suppressVideoEffects](self, "suppressVideoEffects"))
    objc_msgSend(v3, "appendString:", CFSTR(", suppressVideoEffects: YES"));
  if (-[FigCaptureSessionConfiguration smartStyleRenderingEnabled](self, "smartStyleRenderingEnabled"))
    objc_msgSend(v3, "appendString:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", smartStyle:%@ controlMode:%d"), -[FigCaptureSessionConfiguration smartStyle](self, "smartStyle"), -[FigCaptureSessionConfiguration smartStyleControlMode](self, "smartStyleControlMode")));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = -[FigCaptureSessionConfiguration connectionConfigurations](self, "connectionConfigurations");
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("\n\t%@"), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }
  return (NSString *)v3;
}

- (BOOL)suppressVideoEffects
{
  return self->_suppressVideoEffects;
}

- (BOOL)isMultiCamSession
{
  return self->_isMultiCamSession;
}

- (BOOL)continuityCameraIsWired
{
  return self->_continuityCameraIsWired;
}

- (int)continuityCameraClientDeviceClass
{
  return self->_continuityCameraClientDeviceClass;
}

- (BOOL)allowedToRunInMultitaskingMode
{
  return self->_allowedToRunInMultitaskingMode;
}

- (BOOL)xctestAuthorizedToStealDevice
{
  return self->_xctestAuthorizedToStealDevice;
}

- (BOOL)usesAppAudioSession
{
  return self->_usesAppAudioSession;
}

- (BOOL)configuresAppAudioSession
{
  return self->_configuresAppAudioSession;
}

- (BOOL)checkIfFileAlreadyExistForMFO
{
  return self->_checkIfFileAlreadyExistForMFO;
}

- (NSArray)sourceConfigurations
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](-[FigCaptureSessionConfiguration connectionConfigurations](self, "connectionConfigurations"), "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[FigCaptureSessionConfiguration connectionConfigurations](self, "connectionConfigurations", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "sourceConfiguration");
        if ((objc_msgSend(v3, "containsObject:", v9) & 1) == 0)
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return (NSArray *)v3;
}

- (NSArray)connectionConfigurations
{
  return (NSArray *)self->_connections;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCaptureSessionConfiguration;
  -[FigCaptureSessionConfiguration dealloc](&v3, sel_dealloc);
}

- (NSArray)sinkConfigurations
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](-[FigCaptureSessionConfiguration connectionConfigurations](self, "connectionConfigurations"), "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[FigCaptureSessionConfiguration connectionConfigurations](self, "connectionConfigurations", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "sinkConfiguration");
        if ((objc_msgSend(v3, "containsObject:", v9) & 1) == 0)
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  return (NSArray *)v3;
}

uint64_t __54__FigCaptureSessionConfiguration_initWithXPCEncoding___block_invoke_2(uint64_t a1, int a2, xpc_object_t xdict)
{
  const char *string;
  objc_class *Class;
  void *v7;
  unint64_t int64;
  uint64_t v9;

  string = xpc_dictionary_get_string(xdict, "class");
  if (!string)
  {
    v9 = 0;
    v7 = 0;
    goto LABEL_9;
  }
  Class = objc_getClass(string);
  if (-[objc_class isSubclassOfClass:](Class, "isSubclassOfClass:", objc_opt_class()))
  {
    v7 = (void *)objc_msgSend([Class alloc], "initWithXPCEncoding:", xdict);
    if (!v7
      || !xpc_dictionary_get_value(xdict, "sourceIndex")
      || (int64 = xpc_dictionary_get_int64(xdict, "sourceIndex"), int64 >= objc_msgSend(*(id *)(a1 + 32), "count")))
    {
      v9 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v7, "setSourceConfiguration:", objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", int64));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addObject:", v7);
  }
  else
  {
    v7 = 0;
  }
  v9 = 1;
LABEL_9:

  return v9;
}

+ (void)initialize
{
  objc_opt_class();
}

- (FigCaptureSessionConfiguration)initWithXPCEncoding:(id)a3
{
  FigCaptureSessionConfiguration *v3;
  uint64_t v5;
  xpc_object_t value;
  uint64_t v7;
  xpc_object_t v8;
  const char *string;
  void *v10;
  uint64_t v11;
  xpc_object_t dictionary;
  _QWORD v14[6];
  _QWORD applier[5];
  objc_super v16;

  v3 = self;
  if (!a3)
  {
    fig_log_get_emitter();
LABEL_14:
    FigDebugAssert3();
    goto LABEL_15;
  }
  v16.receiver = self;
  v16.super_class = (Class)FigCaptureSessionConfiguration;
  v3 = -[FigCaptureSessionConfiguration init](&v16, sel_init);
  if (!v3)
    return v3;
  v3->_configurationID = xpc_dictionary_get_int64(a3, "configurationID");
  v3->_clientExpectsCameraMountedInLandscapeOrientation = xpc_dictionary_get_BOOL(a3, "clientExpectsCameraMountedInLandscapeOrientation");
  v5 = objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  value = xpc_dictionary_get_value(a3, "sources");
  v7 = MEMORY[0x1E0C809B0];
  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = __54__FigCaptureSessionConfiguration_initWithXPCEncoding___block_invoke;
  applier[3] = &unk_1E491E8E8;
  applier[4] = v5;
  if (!xpc_array_apply(value, applier))
  {
    fig_log_get_emitter();
    goto LABEL_14;
  }
  v3->_connections = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = xpc_dictionary_get_value(a3, "connections");
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __54__FigCaptureSessionConfiguration_initWithXPCEncoding___block_invoke_2;
  v14[3] = &unk_1E4923AF8;
  v14[4] = v5;
  v14[5] = v3;
  if (!xpc_array_apply(v8, v14))
  {
LABEL_15:

    return 0;
  }
  string = xpc_dictionary_get_string(a3, "sessionPreset");
  if (string)
    v3->_sessionPreset = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", string);
  v3->_usesAppAudioSession = xpc_dictionary_get_BOOL(a3, "usesAppAudioSession");
  v3->_configuresAppAudioSession = xpc_dictionary_get_BOOL(a3, "configuresAppAudioSession");
  v3->_configuresAppAudioSessionToMixWithOthers = xpc_dictionary_get_BOOL(a3, "configuresAppAudioSessionToMixWithOthers");
  v3->_allowedToRunInMultitaskingMode = xpc_dictionary_get_BOOL(a3, "allowedToRunInMultitaskingMode");
  v3->_isMultiCamSession = xpc_dictionary_get_BOOL(a3, "isMultiCamSession");
  v3->_xctestAuthorizedToStealDevice = xpc_dictionary_get_BOOL(a3, "xctestAuthorizedToStealDevice");
  v3->_checkIfFileAlreadyExistForMFO = xpc_dictionary_get_BOOL(a3, "checkIfFileAlreadyExistForMFO");
  v3->_continuityCameraIsWired = xpc_dictionary_get_BOOL(a3, "continuityCameraIsWired");
  v3->_continuityCameraClientDeviceClass = xpc_dictionary_get_int64(a3, "continuityCameraClientDeviceClass");
  v3->_clientIsVOIP = xpc_dictionary_get_BOOL(a3, "clientIsVOIP");
  v3->_suppressVideoEffects = xpc_dictionary_get_BOOL(a3, "suppressVideoEffects");
  if (xpc_dictionary_get_value(a3, "tccIdentity"))
  {
    v10 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    v11 = tcc_identity_create_from_external_representation();

    v3->_tccIdentity = (OS_tcc_identity *)v11;
  }
  v3->_smartStyleRenderingEnabled = xpc_dictionary_get_BOOL(a3, "smartStyleRenderingEnabled");
  v3->_smartStyleControlMode = xpc_dictionary_get_int64(a3, "smartStyleControlMode");
  dictionary = xpc_dictionary_get_dictionary(a3, "smartStyle");
  if (dictionary)
    v3->_smartStyle = -[FigCaptureSmartStyle initWithXPCEncoding:]([FigCaptureSmartStyle alloc], "initWithXPCEncoding:", dictionary);
  return v3;
}

- (BOOL)allCameraSourcesAreMetadataCameras
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
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
  v2 = -[FigCaptureSessionConfiguration connectionConfigurations](self, "connectionConfigurations", 0);
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v11 != v6)
        objc_enumerationMutation(v2);
      v8 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "sourceConfiguration");
      if (objc_msgSend(v8, "sourceType") == 1)
      {
        if (objc_msgSend(v8, "sourceDeviceType") - 17 > 3)
          return 0;
        v5 = 1;
      }
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v4);
  return v5;
}

- (void)removeConnectionConfiguration:(id)a3
{
  -[NSMutableArray removeObject:](self->_connections, "removeObject:", a3);
}

- (BOOL)configuresAppAudioSessionToMixWithOthers
{
  return self->_configuresAppAudioSessionToMixWithOthers;
}

- (void)setConfiguresAppAudioSessionToMixWithOthers:(BOOL)a3
{
  self->_configuresAppAudioSessionToMixWithOthers = a3;
}

- (BOOL)clientIsVOIP
{
  return self->_clientIsVOIP;
}

- (void)setClientIsVOIP:(BOOL)a3
{
  self->_clientIsVOIP = a3;
}

- (BOOL)smartStyleRenderingEnabled
{
  return self->_smartStyleRenderingEnabled;
}

- (void)setSmartStyleRenderingEnabled:(BOOL)a3
{
  self->_smartStyleRenderingEnabled = a3;
}

- (int64_t)smartStyleControlMode
{
  return self->_smartStyleControlMode;
}

- (void)setSmartStyleControlMode:(int64_t)a3
{
  self->_smartStyleControlMode = a3;
}

- (FigCaptureSmartStyle)smartStyle
{
  return self->_smartStyle;
}

- (void)setSmartStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

@end
