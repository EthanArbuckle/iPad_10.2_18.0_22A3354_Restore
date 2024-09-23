@implementation MIMachOImageSlice

- (MIMachOImageSlice)initWithCPUType:(int)a3 cpuSubtype:(int)a4 platform:(unsigned int)a5 sdkVersion:(unsigned int)a6 minOSVersion:(unsigned int)a7
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  MIMachOImageSlice *v12;
  MIMachOImageSlice *v13;
  objc_super v15;

  v7 = *(_QWORD *)&a7;
  v8 = *(_QWORD *)&a6;
  v9 = *(_QWORD *)&a5;
  v10 = *(_QWORD *)&a4;
  v11 = *(_QWORD *)&a3;
  v15.receiver = self;
  v15.super_class = (Class)MIMachOImageSlice;
  v12 = -[MIMachOImageSlice init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    -[MIMachOImageSlice setCpuType:](v12, "setCpuType:", v11);
    -[MIMachOImageSlice setCpuSubtype:](v13, "setCpuSubtype:", v10);
    -[MIMachOImageSlice setPlatform:](v13, "setPlatform:", v9);
    -[MIMachOImageSlice setSdkVersion:](v13, "setSdkVersion:", v8);
    -[MIMachOImageSlice setMinOSVersion:](v13, "setMinOSVersion:", v7);
  }
  return v13;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MIMachOStringForPlatform(-[MIMachOImageSlice platform](self, "platform"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ platform:%@ sdkVersion:%u minOSVersion:%u>"), v5, v6, -[MIMachOImageSlice sdkVersion](self, "sdkVersion"), -[MIMachOImageSlice minOSVersion](self, "minOSVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int)cpuType
{
  return self->_cpuType;
}

- (void)setCpuType:(int)a3
{
  self->_cpuType = a3;
}

- (int)cpuSubtype
{
  return self->_cpuSubtype;
}

- (void)setCpuSubtype:(int)a3
{
  self->_cpuSubtype = a3;
}

- (unsigned)platform
{
  return self->_platform;
}

- (void)setPlatform:(unsigned int)a3
{
  self->_platform = a3;
}

- (unsigned)sdkVersion
{
  return self->_sdkVersion;
}

- (void)setSdkVersion:(unsigned int)a3
{
  self->_sdkVersion = a3;
}

- (unsigned)minOSVersion
{
  return self->_minOSVersion;
}

- (void)setMinOSVersion:(unsigned int)a3
{
  self->_minOSVersion = a3;
}

@end
