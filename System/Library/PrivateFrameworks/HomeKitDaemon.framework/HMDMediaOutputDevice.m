@implementation HMDMediaOutputDevice

- (AVOutputDevice)av_OutputDevice
{
  -[HMDMediaOutputDevice outputDevice](self, "outputDevice");
  return (AVOutputDevice *)MRAVOutputDeviceGetAVOutputDevice();
}

- (HMDMediaOutputDevice)initWithOutputDevice:(void *)a3
{
  HMDMediaOutputDevice *v4;
  void *v5;
  CFTypeID TypeID;
  void *v7;
  NSString *v8;
  NSString *uniqueIdentifier;
  void *v10;
  CFTypeID v11;
  void *v12;
  NSString *v13;
  NSString *name;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)HMDMediaOutputDevice;
  v4 = -[HMDMediaOutputDevice init](&v16, sel_init);
  if (!v4)
  {
LABEL_18:
    a3 = v4;
    goto LABEL_20;
  }
  if (a3)
  {
    CFRetain(a3);
    v5 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
    TypeID = CFStringGetTypeID();
    objc_opt_class();
    if (v5 && CFGetTypeID(v5) != TypeID)
    {
      CFRelease(v5);
      v5 = 0;
    }
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v5;
    else
      v7 = 0;
    v8 = v7;

    uniqueIdentifier = v4->_uniqueIdentifier;
    v4->_uniqueIdentifier = v8;

    v10 = (void *)MRAVOutputDeviceCopyName();
    v11 = CFStringGetTypeID();
    objc_opt_class();
    if (v10 && CFGetTypeID(v10) != v11)
    {
      CFRelease(v10);
      v10 = 0;
    }
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v10;
    else
      v12 = 0;
    v13 = v12;

    name = v4->_name;
    v4->_name = v13;

    if (!v4->_name || !v4->_uniqueIdentifier)
    {
      CFRelease(a3);
      a3 = 0;
      goto LABEL_20;
    }
    v4->_outputDevice = a3;
    goto LABEL_18;
  }
LABEL_20:

  return (HMDMediaOutputDevice *)a3;
}

- (unsigned)deviceSubtype
{
  -[HMDMediaOutputDevice outputDevice](self, "outputDevice");
  return MRAVOutputDeviceGetSubtype();
}

- (NSString)modelID
{
  void *v2;
  CFTypeID TypeID;
  void *v4;
  NSString *v5;

  -[HMDMediaOutputDevice outputDevice](self, "outputDevice");
  v2 = (void *)MRAVOutputDeviceCopyModelID();
  TypeID = CFStringGetTypeID();
  objc_opt_class();
  if (v2 && CFGetTypeID(v2) != TypeID)
  {
    CFRelease(v2);
    v2 = 0;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (BOOL)supportsWHA
{
  -[HMDMediaOutputDevice outputDevice](self, "outputDevice");
  return MRAVOutputDeviceSupportsBufferedAirPlay();
}

- (BOOL)supportsHAP
{
  -[HMDMediaOutputDevice outputDevice](self, "outputDevice");
  JUMPOUT(0x2276756B4);
}

- (void)dealloc
{
  void *outputDevice;
  objc_super v4;

  outputDevice = self->_outputDevice;
  if (outputDevice)
    CFRelease(outputDevice);
  v4.receiver = self;
  v4.super_class = (Class)HMDMediaOutputDevice;
  -[HMDMediaOutputDevice dealloc](&v4, sel_dealloc);
}

- (unint64_t)hash
{
  return -[NSString hash](self->_uniqueIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HMDMediaOutputDevice *v4;
  HMDMediaOutputDevice *v5;
  HMDMediaOutputDevice *v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  void *v11;

  v4 = (HMDMediaOutputDevice *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6
      && (-[HMDMediaOutputDevice uniqueIdentifier](self, "uniqueIdentifier"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          -[HMDMediaOutputDevice uniqueIdentifier](v6, "uniqueIdentifier"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "isEqual:", v8),
          v8,
          v7,
          (v9 & 1) == 0))
    {
      v11 = -[HMDMediaOutputDevice outputDevice](self, "outputDevice");
      v10 = v11 == -[HMDMediaOutputDevice outputDevice](v6, "outputDevice");
    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDMediaOutputDevice uniqueIdentifier](self, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Output device(%@/%@)"), v4, -[HMDMediaOutputDevice outputDevice](self, "outputDevice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isAppleMediaAccessory
{
  void *v2;
  uint64_t v3;

  -[HMDMediaOutputDevice modelID](self, "modelID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = HMFProductClassFromString();

  return (v3 & 0xFFFFFFFFFFFFFFFDLL) == 4;
}

- (void)outputDevice
{
  return self->_outputDevice;
}

- (void)setOutputDevice:(void *)a3
{
  self->_outputDevice = a3;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
