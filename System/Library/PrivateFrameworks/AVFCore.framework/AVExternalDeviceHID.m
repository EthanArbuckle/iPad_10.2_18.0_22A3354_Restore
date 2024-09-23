@implementation AVExternalDeviceHID

- (id)_figEndpointHIDInputMode
{
  void *v3;
  void *v4;
  NSString *UUID;
  void (*v6)(void *, NSString *, _QWORD, void **);
  void *v8;

  v8 = 0;
  v3 = (void *)objc_msgSend(-[AVExternalDeviceHID _externalDevice](self, "_externalDevice"), "figEndpoint");
  if (v3)
  {
    v4 = v3;
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass()
      && (UUID = self->_externalDeviceHID->UUID,
          (v6 = *(void (**)(void *, NSString *, _QWORD, void **))(*(_QWORD *)(CMBaseObjectGetVTable() + 24)
                                                                           + 64)) != 0))
    {
      v6(v4, UUID, *MEMORY[0x1E0C9AE00], &v8);
      v3 = v8;
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (AVExternalDeviceHID)initWithExternalDeviceAndHIDDictionary:(id)a3 hidDictionary:(id)a4
{
  AVExternalDeviceHID *v6;
  AVExternalDeviceHIDInternal *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVExternalDeviceHID;
  v6 = -[AVExternalDeviceHID init](&v9, sel_init);
  if (v6)
  {
    v7 = objc_alloc_init(AVExternalDeviceHIDInternal);
    v6->_externalDeviceHID = v7;
    if (v7)
    {
      v6->_externalDeviceHID->weakReferenceToExternalDevice = (AVWeakReference *)(id)objc_msgSend(a3, "_weakReference");
      v6->_externalDeviceHID->UUID = (NSString *)(id)objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0CA39B8]);
      v6->_externalDeviceHID->screenID = (NSString *)(id)objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E0CA39B0]);
      v6->_externalDeviceHID->inputMode = (NSNumber *)-[AVExternalDeviceHID _figEndpointHIDInputMode](v6, "_figEndpointHIDInputMode");
      CFRetain(v6->_externalDeviceHID);
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
  AVExternalDeviceHIDInternal *externalDeviceHID;
  objc_super v4;

  externalDeviceHID = self->_externalDeviceHID;
  if (externalDeviceHID)
  {

    CFRelease(self->_externalDeviceHID);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVExternalDeviceHID;
  -[AVExternalDeviceHID dealloc](&v4, sel_dealloc);
}

- (NSString)screenID
{
  return self->_externalDeviceHID->screenID;
}

- (NSString)UUID
{
  return self->_externalDeviceHID->UUID;
}

- (int64_t)inputMode
{
  return -[NSNumber integerValue](self->_externalDeviceHID->inputMode, "integerValue");
}

- (void)setInputMode:(int64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  AVExternalDeviceHIDInternal *externalDeviceHID;
  NSString *UUID;
  NSNumber *inputMode;
  void (*v10)(uint64_t, NSString *, NSNumber *);

  v5 = objc_msgSend(-[AVExternalDeviceHID _externalDevice](self, "_externalDevice"), "figEndpoint");
  if (v5)
  {
    v6 = v5;
    FigEndpointExtendedGetClassID();
    if (CMBaseObjectIsMemberOfClass())
    {

      self->_externalDeviceHID->inputMode = (NSNumber *)(id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
      externalDeviceHID = self->_externalDeviceHID;
      UUID = externalDeviceHID->UUID;
      inputMode = externalDeviceHID->inputMode;
      v10 = *(void (**)(uint64_t, NSString *, NSNumber *))(*(_QWORD *)(CMBaseObjectGetVTable() + 24) + 56);
      if (v10)
        v10(v6, UUID, inputMode);
    }
  }
}

- (id)_externalDevice
{
  return -[AVWeakReference referencedObject](self->_externalDeviceHID->weakReferenceToExternalDevice, "referencedObject");
}

@end
