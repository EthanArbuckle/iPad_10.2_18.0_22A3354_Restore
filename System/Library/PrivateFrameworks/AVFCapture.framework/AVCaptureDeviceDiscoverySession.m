@implementation AVCaptureDeviceDiscoverySession

+ (id)allDeviceTypes
{
  void *v2;
  _QWORD v4[16];

  v4[15] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("AVCaptureDeviceTypeMicrophone");
  v4[1] = CFSTR("AVCaptureDeviceTypeBuiltInWideAngleCamera");
  v4[2] = CFSTR("AVCaptureDeviceTypeBuiltInTelephotoCamera");
  v4[3] = CFSTR("AVCaptureDeviceTypeBuiltInDualCamera");
  v4[4] = CFSTR("AVCaptureDeviceTypeBuiltInUltraWideCamera");
  v4[5] = CFSTR("AVCaptureDeviceTypeBuiltInDualWideCamera");
  v4[6] = CFSTR("AVCaptureDeviceTypeBuiltInTripleCamera");
  v4[7] = CFSTR("AVCaptureDeviceTypeBuiltInTimeOfFlightCamera");
  v4[8] = CFSTR("AVCaptureDeviceTypeBuiltInTrueDepthCamera");
  v4[9] = CFSTR("AVCaptureDeviceTypeBuiltInLiDARDepthCamera");
  v4[10] = CFSTR("AVCaptureDeviceTypeBuiltInWideAngleMetadataCamera");
  v4[11] = CFSTR("AVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera");
  v4[12] = CFSTR("AVCaptureDeviceTypeBuiltInInfraredMetadataCamera");
  v4[13] = CFSTR("AVCaptureDeviceTypeExternal");
  v4[14] = CFSTR("AVCaptureDeviceTypeContinuityCamera");
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 15));
  if (AVCaptureClientAllowsDeskViewCamera())
    objc_msgSend(v2, "addObject:", CFSTR("AVCaptureDeviceTypeDeskViewCamera"));
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v2);
}

+ (id)allVideoDeviceTypes
{
  void *v2;
  _QWORD v4[11];

  v4[10] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("AVCaptureDeviceTypeBuiltInWideAngleCamera");
  v4[1] = CFSTR("AVCaptureDeviceTypeBuiltInTelephotoCamera");
  v4[2] = CFSTR("AVCaptureDeviceTypeBuiltInDualCamera");
  v4[3] = CFSTR("AVCaptureDeviceTypeBuiltInUltraWideCamera");
  v4[4] = CFSTR("AVCaptureDeviceTypeBuiltInDualWideCamera");
  v4[5] = CFSTR("AVCaptureDeviceTypeBuiltInTripleCamera");
  v4[6] = CFSTR("AVCaptureDeviceTypeBuiltInTrueDepthCamera");
  v4[7] = CFSTR("AVCaptureDeviceTypeBuiltInLiDARDepthCamera");
  v4[8] = CFSTR("AVCaptureDeviceTypeExternal");
  v4[9] = CFSTR("AVCaptureDeviceTypeContinuityCamera");
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 10));
  if (AVCaptureClientAllowsDeskViewCamera())
    objc_msgSend(v2, "addObject:", CFSTR("AVCaptureDeviceTypeDeskViewCamera"));
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v2);
}

+ (id)allMetadataCameraDeviceTypes
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("AVCaptureDeviceTypeBuiltInWideAngleMetadataCamera");
  v3[1] = CFSTR("AVCaptureDeviceTypeBuiltInUltraWideAngleMetadataCamera");
  v3[2] = CFSTR("AVCaptureDeviceTypeBuiltInInfraredMetadataCamera");
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
}

- (NSArray)devices
{
  return self->_devices;
}

+ (id)allVideoDevices
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "allVideoDeviceTypes");
  return -[AVCaptureDeviceDiscoverySession devices](+[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:mediaType:position:](AVCaptureDeviceDiscoverySession, "discoverySessionWithDeviceTypes:mediaType:position:", v2, *MEMORY[0x1E0CF2B90], 0), "devices");
}

+ (AVCaptureDeviceDiscoverySession)discoverySessionWithDeviceTypes:(NSArray *)deviceTypes mediaType:(AVMediaType)mediaType position:(AVCaptureDevicePosition)position
{
  id v8;
  uint64_t IsRunningInMacCatalystEnvironment;

  v8 = objc_alloc((Class)objc_opt_class());
  IsRunningInMacCatalystEnvironment = AVCaptureIsRunningInMacCatalystEnvironment();
  return (AVCaptureDeviceDiscoverySession *)(id)objc_msgSend(v8, "_initWithDeviceTypes:mediaType:position:allowIOSMacEnvironment:prefersUnsuspendedAndAllowsAnyPosition:", deviceTypes, mediaType, position, IsRunningInMacCatalystEnvironment, AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureDefaultDevicePrefersUnsuspendedAndAllowsAnyPosition")));
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("AVCaptureDeviceWasConnectedNotification"), 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("AVCaptureDeviceWasDisconnectedNotification"), 0);

  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDeviceDiscoverySession;
  -[AVCaptureDeviceDiscoverySession dealloc](&v3, sel_dealloc);
}

- (id)_initWithDeviceTypes:(id)a3 mediaType:(id)a4 position:(int64_t)a5 allowIOSMacEnvironment:(BOOL)a6 prefersUnsuspendedAndAllowsAnyPosition:(BOOL)a7
{
  AVCaptureDeviceDiscoverySession *v11;
  NSString *v12;
  NSArray *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVCaptureDeviceDiscoverySession;
  v11 = -[AVCaptureDeviceDiscoverySession init](&v15, sel_init, a3, a4, a5, a6, a7);
  if (v11)
  {
    v11->_deviceTypes = (NSArray *)objc_msgSend(a3, "copy");
    v12 = (NSString *)a4;
    v11->_position = a5;
    v11->_mediaType = v12;
    if (a6 || !AVCaptureIsRunningInMacCatalystEnvironment())
      v13 = (NSArray *)+[AVCaptureDevice _devicesWithDeviceTypes:mediaType:position:](AVCaptureDevice, "_devicesWithDeviceTypes:mediaType:position:", a3, a4, a5);
    else
      v13 = (NSArray *)MEMORY[0x1E0C9AA60];
    v11->_devices = v13;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v11, sel__handleDeviceConnectedDisconnectedNotification_, CFSTR("AVCaptureDeviceWasConnectedNotification"), 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v11, sel__handleDeviceConnectedDisconnectedNotification_, CFSTR("AVCaptureDeviceWasDisconnectedNotification"), 0);
  }
  return v11;
}

+ (void)initialize
{
  objc_opt_class();
}

+ (id)allVirtualDeviceTypes
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("AVCaptureDeviceTypeBuiltInDualCamera");
  v3[1] = CFSTR("AVCaptureDeviceTypeBuiltInDualWideCamera");
  v3[2] = CFSTR("AVCaptureDeviceTypeBuiltInTripleCamera");
  v3[3] = CFSTR("AVCaptureDeviceTypeBuiltInTrueDepthCamera");
  v3[4] = CFSTR("AVCaptureDeviceTypeBuiltInLiDARDepthCamera");
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
}

- (AVCaptureDeviceDiscoverySession)init
{
  AVCaptureDeviceDiscoverySession *v2;
  AVCaptureDeviceDiscoverySession *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVCaptureDeviceDiscoverySession;
  v2 = -[AVCaptureDeviceDiscoverySession init](&v5, sel_init);
  if (v2)
  {
    v3 = v2;
    NSLog(CFSTR("-[AVCaptureDeviceDiscoverySession init] - Cannot directly instantiate an AVCaptureDeviceDiscoverySession object."));

  }
  return 0;
}

- (id)description
{
  void *v3;
  NSArray *deviceTypes;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  const __CFString *v9;
  void *v10;
  objc_class *v11;
  NSString *v12;
  const __CFString *mediaType;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", &stru_1E421DB28);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  deviceTypes = self->_deviceTypes;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](deviceTypes, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(deviceTypes);
        v9 = AVCaptureDeviceTypeToString(*(void **)(*((_QWORD *)&v15 + 1) + 8 * i));
        if (objc_msgSend(v3, "length"))
          objc_msgSend(v3, "appendString:", CFSTR(", "));
        objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v9);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](deviceTypes, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (objc_class *)objc_opt_class();
  v12 = NSStringFromClass(v11);
  if (self->_mediaType)
    mediaType = (const __CFString *)self->_mediaType;
  else
    mediaType = CFSTR("Any");
  return (id)objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p device types: [%@], media type: %@, position: %@>"), v12, self, v3, mediaType, AVCaptureDevicePositionToString(self->_position));
}

- (void)_handleDeviceConnectedDisconnectedNotification:(id)a3
{
  void *v4;
  int64_t position;
  int64_t v6;
  id v7;

  v4 = (void *)objc_msgSend(a3, "object");
  if (-[NSArray containsObject:](self->_deviceTypes, "containsObject:", objc_msgSend(v4, "deviceType"))
    && (!self->_mediaType || objc_msgSend(v4, "hasMediaType:")))
  {
    position = self->_position;
    if (position)
    {
      if (position != objc_msgSend(v4, "position"))
        return;
      v6 = self->_position;
    }
    else
    {
      v6 = 0;
    }
    v7 = +[AVCaptureDevice _devicesWithDeviceTypes:mediaType:position:](AVCaptureDevice, "_devicesWithDeviceTypes:mediaType:position:", self->_deviceTypes, self->_mediaType, v6);
    if (!-[NSArray isEqualToArray:](self->_devices, "isEqualToArray:", v7))
    {
      -[AVCaptureDeviceDiscoverySession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("supportedMultiCamDeviceSets"));
      -[AVCaptureDeviceDiscoverySession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("devices"));

      self->_devices = (NSArray *)v7;
      self->_supportedMultiCamDeviceSets = 0;
      -[AVCaptureDeviceDiscoverySession supportedMultiCamDeviceSets](self, "supportedMultiCamDeviceSets");
      -[AVCaptureDeviceDiscoverySession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("devices"));
      -[AVCaptureDeviceDiscoverySession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("supportedMultiCamDeviceSets"));
    }
  }
}

- (NSArray)supportedMultiCamDeviceSets
{
  NSArray *result;
  NSArray *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  unint64_t IntegerAnswer;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  result = self->_supportedMultiCamDeviceSets;
  if (!result)
  {
    if (AVGestaltGetBoolAnswer((uint64_t)CFSTR("AVGQCaptureSessionSupportsMultiCamCapture")))
    {
      v4 = -[NSArray objectsAtIndexes:](-[AVCaptureDeviceDiscoverySession devices](self, "devices"), "objectsAtIndexes:", -[NSArray indexesOfObjectsPassingTest:](-[AVCaptureDeviceDiscoverySession devices](self, "devices"), "indexesOfObjectsPassingTest:", &__block_literal_global_3));
      v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v21 != v8)
              objc_enumerationMutation(v4);
            v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
            if ((unint64_t)objc_msgSend((id)objc_msgSend(v10, "constituentDevices"), "count") >= 2)
              objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10));
          }
          v7 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v7);
      }
      if (-[NSArray count](v4, "count") >= 2)
      {
        IntegerAnswer = AVGestaltGetIntegerAnswer((uint64_t)CFSTR("AVGQCaptureSessionMaxMultiCamRGBStreamsSupported"));
        v12 = -[NSArray count](v4, "count");
        v13 = IntegerAnswer >= v12 ? v12 : IntegerAnswer;
        v14 = IntegerAnswer == 0x7FFFFFFFFFFFFFFFLL ? v12 : v13;
        if (v14 >= 2)
        {
          v15 = 1;
          v16 = 2;
          do
          {
            v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v18 = 0;
            do
              objc_msgSend(v17, "setObject:atIndexedSubscript:", objc_msgSend(MEMORY[0x1E0C99E38], "null"), v18++);
            while (v16 != v18);
            avcdds_addValidMultiCamCombinations(v4, ++v15, 0, v17, v5, IntegerAnswer);
          }
          while (v16++ != v14);
        }
      }
      result = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v5);
    }
    else
    {
      result = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    }
    self->_supportedMultiCamDeviceSets = result;
  }
  return result;
}

uint64_t __62__AVCaptureDeviceDiscoverySession_supportedMultiCamDeviceSets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasMediaType:", *MEMORY[0x1E0CF2B90]);
}

+ (id)allDevices
{
  return -[AVCaptureDeviceDiscoverySession devices](+[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:mediaType:position:](AVCaptureDeviceDiscoverySession, "discoverySessionWithDeviceTypes:mediaType:position:", objc_msgSend(a1, "allDeviceTypes"), 0, 0), "devices");
}

+ (id)allPointCloudDeviceTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("AVCaptureDeviceTypeBuiltInTimeOfFlightCamera");
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

+ (id)allPointCloudDevices
{
  return -[AVCaptureDeviceDiscoverySession devices](+[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:mediaType:position:](AVCaptureDeviceDiscoverySession, "discoverySessionWithDeviceTypes:mediaType:position:", objc_msgSend(a1, "allPointCloudDeviceTypes"), CFSTR("pcld"), 0), "devices");
}

+ (id)allMetadataCameraDevices
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "allMetadataCameraDeviceTypes");
  return -[AVCaptureDeviceDiscoverySession devices](+[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:mediaType:position:](AVCaptureDeviceDiscoverySession, "discoverySessionWithDeviceTypes:mediaType:position:", v2, *MEMORY[0x1E0CF2B80], 0), "devices");
}

+ (id)allAudioDeviceTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("AVCaptureDeviceTypeMicrophone");
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
}

+ (id)allAudioDevices
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "allAudioDeviceTypes");
  return -[AVCaptureDeviceDiscoverySession devices](+[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:mediaType:position:](AVCaptureDeviceDiscoverySession, "discoverySessionWithDeviceTypes:mediaType:position:", v2, *MEMORY[0x1E0CF2B68], 0), "devices");
}

+ (id)allVirtualDevices
{
  return -[AVCaptureDeviceDiscoverySession devices](+[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:mediaType:position:](AVCaptureDeviceDiscoverySession, "discoverySessionWithDeviceTypes:mediaType:position:", objc_msgSend(a1, "allVirtualDeviceTypes"), 0, 0), "devices");
}

+ (id)allSupportedMultiCamDeviceSets
{
  return -[AVCaptureDeviceDiscoverySession supportedMultiCamDeviceSets](+[AVCaptureDeviceDiscoverySession discoverySessionWithDeviceTypes:mediaType:position:](AVCaptureDeviceDiscoverySession, "discoverySessionWithDeviceTypes:mediaType:position:", objc_msgSend(a1, "allVideoDeviceTypes"), 0, 0), "supportedMultiCamDeviceSets");
}

@end
