@implementation BWStillImageProcessorControllerInput

- (BWStillImageProcessorControllerInput)initWithSettings:(id)a3 portType:(id)a4
{
  BWStillImageProcessorControllerInput *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BWStillImageProcessorControllerInput;
  v6 = -[BWStillImageProcessorControllerInput init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_msgSend((id)objc_msgSend(a3, "captureSettings"), "captureStreamSettingsForPortType:", a4);
    if (v7)
    {
      v8 = (void *)v7;
      v6->_settings = (BWStillImageSettings *)a3;
      v6->_captureStreamSettings = (BWStillImageCaptureStreamSettings *)v8;
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWStillImageProcessorControllerInput;
  -[BWStillImageProcessorControllerInput dealloc](&v3, sel_dealloc);
}

- (BWStillImageSettings)stillImageSettings
{
  return self->_settings;
}

- (FigCaptureStillImageSettings)settings
{
  return -[BWStillImageSettings requestedSettings](self->_settings, "requestedSettings");
}

- (BWStillImageCaptureSettings)captureSettings
{
  return -[BWStillImageSettings captureSettings](self->_settings, "captureSettings");
}

- (BWStillImageCaptureStreamSettings)captureStreamSettings
{
  return self->_captureStreamSettings;
}

- (BWStillImageProcessingSettings)processingSettings
{
  return -[BWStillImageSettings processingSettings](self->_settings, "processingSettings");
}

- (BOOL)isMaster
{
  return -[NSString isEqualToString:](-[BWStillImageCaptureStreamSettings portType](self->_captureStreamSettings, "portType"), "isEqualToString:", -[BWStillImageCaptureSettings masterPortType](-[BWStillImageSettings captureSettings](self->_settings, "captureSettings"), "masterPortType"));
}

- (NSString)portType
{
  return -[BWStillImageCaptureStreamSettings portType](self->_captureStreamSettings, "portType");
}

- (void)addOutputSampleBufferRouter:(id)a3 forBufferTypes:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BWStillImageProcessorControllerOutputRouter *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v14;
LABEL_5:
        v10 = 0;
        while (1)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(a4);
          v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
          if (!objc_msgSend(v11, "intValue"))
            break;
          if (!self->_outputSampleBufferRoutersByBufferType)
            self->_outputSampleBufferRoutersByBufferType = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          v12 = -[BWStillImageProcessorControllerOutputRouter initWithOutputSampleBufferRouter:]([BWStillImageProcessorControllerOutputRouter alloc], "initWithOutputSampleBufferRouter:", a3);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_outputSampleBufferRoutersByBufferType, "setObject:forKeyedSubscript:", v12, v11);

          if (v8 == ++v10)
          {
            v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
            if (v8)
              goto LABEL_5;
            return;
          }
        }
      }
    }
  }
}

- (id)outputSampleBufferRouterForBufferType:(unint64_t)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_outputSampleBufferRoutersByBufferType, "objectForKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3));
}

- (void)addBypassedProcessorType:(unint64_t)a3 forBufferTypes:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(a4);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if (!objc_msgSend(v11, "intValue"))
          break;
        objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_outputSampleBufferRoutersByBufferType, "objectForKeyedSubscript:", v11), "addBypassedProcessorType:", a3);
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v8)
            goto LABEL_4;
          return;
        }
      }
    }
  }
}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[BWStillImageCaptureSettings settingsID](-[BWStillImageSettings captureSettings](self->_settings, "captureSettings"), "settingsID");
  v6 = BWPhotoEncoderStringFromEncodingScheme(-[BWStillImageCaptureStreamSettings captureType](self->_captureStreamSettings, "captureType"));
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: captureID:%lld, captureType=%@, captureFlags=%@, %@, captureRequestIdentifier:%@"), v4, self, v5, v6, BWStillImageCaptureFrameFlagsToShortString(-[BWStillImageCaptureStreamSettings captureFlags](self->_captureStreamSettings, "captureFlags")), -[BWStillImageCaptureStreamSettings portType](self->_captureStreamSettings, "portType"), -[FigCaptureStillImageSettings captureRequestIdentifier](-[BWStillImageSettings requestedSettings](self->_settings, "requestedSettings"), "captureRequestIdentifier"));
}

- (BWStillImageProcessorControllerInputUpdatesDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
