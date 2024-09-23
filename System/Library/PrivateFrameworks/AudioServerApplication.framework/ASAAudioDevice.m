@implementation ASAAudioDevice

- (NSString)name
{
  void *v2;
  uint8_t v4[16];
  CFTypeRef cf;
  int v6;

  v6 = 8;
  cf = 0;
  if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1819173229, &cf, &v6, 0, 0))
  {
    if (cf)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(cf);
      return (NSString *)v2;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read name property\n", v4, 2u);
  }
  return (NSString *)0;
}

- (void)setName:(id)a3
{
  id v4;

  v4 = a3;
  -[ASAObject setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1819173229, &v4, 8, 0, 0);

}

- (NSString)manufacturer
{
  void *v2;
  uint8_t v4[16];
  CFTypeRef cf;
  int v6;

  v6 = 8;
  cf = 0;
  if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1819107691, &cf, &v6, 0, 0))
  {
    if (cf)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(cf);
      return (NSString *)v2;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read manufacturer property\n", v4, 2u);
  }
  return (NSString *)0;
}

- (NSString)deviceUID
{
  void *v2;
  uint8_t v4[16];
  CFTypeRef cf;
  int v6;

  v6 = 8;
  cf = 0;
  if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1969841184, &cf, &v6, 0, 0))
  {
    if (cf)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(cf);
      return (NSString *)v2;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read device UID property\n", v4, 2u);
  }
  return (NSString *)0;
}

- (NSString)modelUID
{
  void *v2;
  uint8_t v4[16];
  CFTypeRef cf;
  int v6;

  v6 = 8;
  cf = 0;
  if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1836411236, &cf, &v6, 0, 0))
  {
    if (cf)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(cf);
      return (NSString *)v2;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read model UID property\n", v4, 2u);
  }
  return (NSString *)0;
}

- (unsigned)transportType
{
  uint8_t v3[8];
  unsigned int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1953653102, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read transport type property\n", v3, 2u);
  }
  return v4;
}

- (unsigned)clockDomain
{
  uint8_t v3[8];
  unsigned int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1668049764, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read clock domain property\n", v3, 2u);
  }
  return v4;
}

- (BOOL)isAlive
{
  uint8_t v3[8];
  int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1818850926, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read is active property\n", v3, 2u);
  }
  return v4 != 0;
}

- (BOOL)isRunning
{
  uint8_t v3[8];
  int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1735354734, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read is running property\n", v3, 2u);
  }
  return v4 != 0;
}

- (BOOL)canBeDefaultDevice
{
  uint8_t v3[8];
  int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1684434036, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read can be default device property\n", v3, 2u);
  }
  return v4 != 0;
}

- (BOOL)canBeDefaultInputDevice
{
  uint8_t v3[8];
  int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainInputProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainInputProperty:withData:ofSize:withQualifier:ofSize:", 1684434036, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read can be default device property (input)\n", v3, 2u);
  }
  return v4 != 0;
}

- (BOOL)canBeDefaultOutputDevice
{
  uint8_t v3[8];
  int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainOutputProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainOutputProperty:withData:ofSize:withQualifier:ofSize:", 1684434036, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read can be default device property (output)\n", v3, 2u);
  }
  return v4 != 0;
}

- (BOOL)canBeDefaultSystemDevice
{
  uint8_t v3[8];
  int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1936092276, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read can be default system device property\n", v3, 2u);
  }
  return v4 != 0;
}

- (double)nominalSampleRate
{
  uint8_t v3[16];
  double v4;
  int v5;

  v5 = 8;
  v4 = 0.0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1853059700, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read nominal sample rate property\n", v3, 2u);
  }
  return v4;
}

- (void)setNominalSampleRate:(double)a3
{
  uint8_t v3[8];
  double v4;

  v4 = a3;
  if (!-[ASAObject setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1853059700, &v4, 8, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not write nominal sample rate property\n", v3, 2u);
  }
}

- (BOOL)isHidden
{
  uint8_t v3[8];
  int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1751737454, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read is hidden property\n", v3, 2u);
  }
  return v4 != 0;
}

- (unsigned)inputLatency
{
  uint8_t v3[8];
  unsigned int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainInputProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainInputProperty:withData:ofSize:withQualifier:ofSize:", 1819569763, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read input latency property\n", v3, 2u);
  }
  return v4;
}

- (unsigned)outputLatency
{
  uint8_t v3[8];
  unsigned int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainOutputProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainOutputProperty:withData:ofSize:withQualifier:ofSize:", 1819569763, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read output latency property\n", v3, 2u);
  }
  return v4;
}

- (unsigned)inputSafetyOffset
{
  uint8_t v3[8];
  unsigned int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainInputProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainInputProperty:withData:ofSize:withQualifier:ofSize:", 1935763060, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read input safety offset property\n", v3, 2u);
  }
  return v4;
}

- (unsigned)outputSafetyOffset
{
  uint8_t v3[8];
  unsigned int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainOutputProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainOutputProperty:withData:ofSize:withQualifier:ofSize:", 1935763060, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read output safety offset property\n", v3, 2u);
  }
  return v4;
}

- (unsigned)zeroTimestampPeriod
{
  uint8_t v3[8];
  unsigned int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1919512167, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read zero timestamp period property\n", v3, 2u);
  }
  return v4;
}

- (unsigned)ioBufferFrameSize
{
  uint8_t v3[8];
  unsigned int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainOutputProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainOutputProperty:withData:ofSize:withQualifier:ofSize:", 1718839674, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read IO buffer frame size property\n", v3, 2u);
  }
  return v4;
}

- (void)setIoBufferFrameSize:(unsigned int)a3
{
  unsigned int v3;

  v3 = a3;
  -[ASAObject setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1718839674, &v3, 4, 0, 0);
}

- (unsigned)minimumIOBufferFrameSize
{
  unsigned int result;
  _BOOL4 v3;
  uint8_t v4[12];
  int v5;
  double v6[2];

  v6[0] = 0.0;
  v6[1] = 0.0;
  v5 = 16;
  if (-[ASAObject getMainOutputProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainOutputProperty:withData:ofSize:withQualifier:ofSize:", 1718843939, v6, &v5, 0, 0))
  {
    return v6[0];
  }
  v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v3)
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read IO buffer frame size range property\n", v4, 2u);
    return 0;
  }
  return result;
}

- (unsigned)maximumIOBufferFrameSize
{
  uint8_t v3[12];
  int v4;
  uint64_t v5;
  double v6;

  v5 = 0;
  v6 = 0.0;
  v4 = 16;
  if (-[ASAObject getMainOutputProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainOutputProperty:withData:ofSize:withQualifier:ofSize:", 1718843939, &v5, &v4, 0, 0))
  {
    return v6;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read IO buffer frame size range property\n", v3, 2u);
  }
  return -1;
}

- (OS_os_workgroup)ioThreadOSWorkgroup
{
  id v2;
  uint8_t v4[16];
  id v5;
  int v6;

  v6 = 8;
  v5 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1869838183, &v5, &v6, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read IO thread OS workgroup property", v4, 2u);
  }
  v2 = v5;

  return (OS_os_workgroup *)v2;
}

- (void)setIoThreadOSWorkgroup:(id)a3
{
  id v4;

  v4 = a3;
  -[ASAObject setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1869838183, &v4, 8, 0, 0);

}

- (float)ioCycleUsage
{
  uint8_t v3[8];
  float v4;
  int v5;

  v5 = 4;
  v4 = 0.0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1852012899, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read io cycle usage property\n", v3, 2u);
  }
  return v4;
}

- (void)setIoCycleUsage:(float)a3
{
  float v3;

  v3 = a3;
  -[ASAObject setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1852012899, &v3, 4, 0, 0);
}

- (int)hogModeOwner
{
  void *v3;
  int v5;
  int v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  v6 = 4;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1869180523, &v5, &v6, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    -[ASAAudioDevice deviceUID](self, "deviceUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read hog mode property on %@", buf, 0xCu);

  }
  return v5;
}

- (BOOL)acquireHogMode
{
  int v3;
  pid_t v5;

  v5 = getpid();
  v3 = -[ASAAudioDevice hogModeOwner](self, "hogModeOwner");
  if (v3 == v5)
    return 1;
  if (v3 == -1)
    return -[ASAObject setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1869180523, &v5, 4, 0, 0);
  return 0;
}

- (BOOL)releaseHogMode
{
  pid_t v4;

  v4 = getpid();
  return -[ASAAudioDevice hogModeOwner](self, "hogModeOwner") == v4
      && -[ASAObject setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1869180523, &v4, 4, 0, 0);
}

- (double)actualSampleRate
{
  uint8_t v3[16];
  double v4;
  int v5;

  v5 = 8;
  v4 = 0.0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1634955892, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read actual sample rate property\n", v3, 2u);
  }
  return v4;
}

- (NSArray)relatedDeviceObjectIDs
{
  unsigned int v3;
  size_t v4;
  unsigned int *v5;
  unsigned int *v6;
  _BOOL4 v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int *v11;
  unsigned int v12;
  void *v13;
  unsigned int v15;

  v3 = -[ASAObject sizeOfMainGlobalProperty:withQualifier:ofSize:](self, "sizeOfMainGlobalProperty:withQualifier:ofSize:", 1634429294, 0, 0);
  v15 = v3;
  if (v3 && (v4 = v3, (v5 = (unsigned int *)malloc_type_malloc(v3, 0x39A4275DuLL)) != 0))
  {
    v6 = v5;
    bzero(v5, v4);
    v7 = -[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1634429294, v6, &v15, 0, 0);
    v8 = 0;
    if (v7)
    {
      v9 = v15;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 >= 4)
      {
        v10 = v9 >> 2;
        v11 = v6;
        do
        {
          v12 = *v11++;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v13);

          --v10;
        }
        while (v10);
      }
    }
    free(v6);
  }
  else
  {
    v8 = 0;
  }
  return (NSArray *)v8;
}

- (NSArray)nominalSampleRates
{
  unsigned int v3;
  size_t v4;
  double *v5;
  double *v6;
  _BOOL4 v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  double *v11;
  double v12;
  void *v13;
  unsigned int v15;

  v3 = -[ASAObject sizeOfMainGlobalProperty:withQualifier:ofSize:](self, "sizeOfMainGlobalProperty:withQualifier:ofSize:", 1853059619, 0, 0);
  v15 = v3;
  if (v3 && (v4 = v3, (v5 = (double *)malloc_type_malloc(v3, 0xD4A29D40uLL)) != 0))
  {
    v6 = v5;
    bzero(v5, v4);
    v7 = -[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1853059619, v6, &v15, 0, 0);
    v8 = 0;
    if (v7)
    {
      v9 = v15;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 >= 8)
      {
        v10 = v9 >> 3;
        v11 = v6;
        do
        {
          v12 = *v11++;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v13);

          --v10;
        }
        while (v10);
      }
    }
    free(v6);
  }
  else
  {
    v8 = 0;
  }
  return (NSArray *)v8;
}

- (NSArray)inputStreamObjectIDs
{
  void *v3;
  unsigned int v4;
  size_t v5;
  unsigned int *v6;
  unsigned int *v7;
  unint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  void *v11;
  unsigned int v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ASAObject sizeOfMainInputProperty:withQualifier:ofSize:](self, "sizeOfMainInputProperty:withQualifier:ofSize:", 1937009955, 0, 0);
  v13 = v4;
  if (v4)
  {
    v5 = v4;
    v6 = (unsigned int *)malloc_type_malloc(v4, 0x9F89C3D8uLL);
    if (v6)
    {
      v7 = v6;
      bzero(v6, v5);
      if (-[ASAObject getMainInputProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainInputProperty:withData:ofSize:withQualifier:ofSize:", 1937009955, v7, &v13, 0, 0)&& v13 >= 4)
      {
        v8 = (unint64_t)v13 >> 2;
        v9 = v7;
        do
        {
          v10 = *v9++;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

          --v8;
        }
        while (v8);
      }
      free(v7);
    }
  }
  return (NSArray *)v3;
}

- (NSArray)inputStreams
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  ASAStream *v10;
  ASAStream *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[ASAAudioDevice inputStreamObjectIDs](self, "inputStreamObjectIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = [ASAStream alloc];
        v11 = -[ASAObject initWithAudioObjectID:](v10, "initWithAudioObjectID:", objc_msgSend(v9, "unsignedIntValue", (_QWORD)v13));
        if (v11)
          objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)outputStreamObjectIDs
{
  void *v3;
  unsigned int v4;
  size_t v5;
  unsigned int *v6;
  unsigned int *v7;
  unint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  void *v11;
  unsigned int v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ASAObject sizeOfMainOutputProperty:withQualifier:ofSize:](self, "sizeOfMainOutputProperty:withQualifier:ofSize:", 1937009955, 0, 0);
  v13 = v4;
  if (v4)
  {
    v5 = v4;
    v6 = (unsigned int *)malloc_type_malloc(v4, 0xEA2286A4uLL);
    if (v6)
    {
      v7 = v6;
      bzero(v6, v5);
      if (-[ASAObject getMainOutputProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainOutputProperty:withData:ofSize:withQualifier:ofSize:", 1937009955, v7, &v13, 0, 0)&& v13 >= 4)
      {
        v8 = (unint64_t)v13 >> 2;
        v9 = v7;
        do
        {
          v10 = *v9++;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

          --v8;
        }
        while (v8);
      }
      free(v7);
    }
  }
  return (NSArray *)v3;
}

- (NSArray)outputStreams
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  ASAStream *v10;
  ASAStream *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[ASAAudioDevice outputStreamObjectIDs](self, "outputStreamObjectIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = [ASAStream alloc];
        v11 = -[ASAObject initWithAudioObjectID:](v10, "initWithAudioObjectID:", objc_msgSend(v9, "unsignedIntValue", (_QWORD)v13));
        if (v11)
          objc_msgSend(v3, "addObject:", v11);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)controlObjectIDs
{
  void *v3;
  unsigned int v4;
  size_t v5;
  unsigned int *v6;
  unsigned int *v7;
  unint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  void *v11;
  unsigned int v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ASAObject sizeOfMainGlobalProperty:withQualifier:ofSize:](self, "sizeOfMainGlobalProperty:withQualifier:ofSize:", 1668575852, 0, 0);
  v13 = v4;
  if (v4)
  {
    v5 = v4;
    v6 = (unsigned int *)malloc_type_malloc(v4, 0xFA451677uLL);
    if (v6)
    {
      v7 = v6;
      bzero(v6, v5);
      if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1668575852, v7, &v13, 0, 0)&& v13 >= 4)
      {
        v8 = (unint64_t)v13 >> 2;
        v9 = v7;
        do
        {
          v10 = *v9++;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v11);

          --v8;
        }
        while (v8);
      }
      free(v7);
    }
  }
  return (NSArray *)v3;
}

- (NSArray)controls
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  ASAObject *v10;
  ASAObject *v11;
  int v12;
  __objc2_class **v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[ASAAudioDevice controlObjectIDs](self, "controlObjectIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v8);
        v10 = [ASAObject alloc];
        v11 = -[ASAObject initWithAudioObjectID:](v10, "initWithAudioObjectID:", objc_msgSend(v9, "unsignedIntValue", (_QWORD)v16));
        v12 = -[ASAObject baseClass](v11, "baseClass");
        if (v12 > 1936483441)
        {
          if (v12 != 1936483442)
          {
            v13 = off_24E0453A8;
            if (v12 == 1953458028)
              goto LABEL_15;
            goto LABEL_12;
          }
          v13 = off_24E0453F0;
        }
        else
        {
          if (v12 != 1818588780)
          {
            if (v12 == 1936483188)
            {
              v13 = off_24E0453E8;
              goto LABEL_15;
            }
LABEL_12:
            v13 = off_24E0453C0;
            goto LABEL_15;
          }
          v13 = off_24E0453D0;
        }
LABEL_15:
        v14 = (void *)objc_msgSend(objc_alloc(*v13), "initWithAudioObjectID:", -[ASAObject objectID](v11, "objectID"));
        if (v14)
          objc_msgSend(v3, "addObject:", v14);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSURL)iconURL
{
  void *v3;
  uint8_t v5[4];
  int v6;
  CFTypeRef cf;

  if (!-[ASAObject hasMainGlobalProperty:](self, "hasMainGlobalProperty:", 1768124270))
    return (NSURL *)0;
  cf = 0;
  v6 = 8;
  if (!-[ASAObject getMainOutputProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainOutputProperty:withData:ofSize:withQualifier:ofSize:", 1768124270, &cf, &v6, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read output icon property\n", v5, 2u);
  }
  if (!cf)
    return (NSURL *)0;
  objc_msgSend((id)cf, "absoluteURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(cf);
  return (NSURL *)v3;
}

- (BOOL)hasInput
{
  return -[ASAObject sizeOfMainInputProperty:withQualifier:ofSize:](self, "sizeOfMainInputProperty:withQualifier:ofSize:", 1937009955, 0, 0) > 3;
}

- (BOOL)hasOutput
{
  return -[ASAObject sizeOfMainOutputProperty:withQualifier:ofSize:](self, "sizeOfMainOutputProperty:withQualifier:ofSize:", 1937009955, 0, 0) > 3;
}

- (BOOL)isAggregate
{
  return -[ASAAudioDevice transportType](self, "transportType") == 1735554416;
}

- (NSString)clockDeviceUID
{
  void *v2;
  uint8_t v4[16];
  CFTypeRef cf;
  int v6;

  v6 = 8;
  cf = 0;
  if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1634755428, &cf, &v6, 0, 0))
  {
    if (cf)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(cf);
      return (NSString *)v2;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read clock device UID property\n", v4, 2u);
  }
  return (NSString *)0;
}

- (void)setClockDeviceUID:(id)a3
{
  uint8_t v3[8];
  id v4;

  v4 = a3;
  if (!-[ASAObject setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1634755428, &v4, 8, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read clock device UID property\n", v3, 2u);
  }
}

- (NSDictionary)aggregateDescription
{
  void *v3;
  uint8_t v5[16];
  CFTypeRef cf;
  int v7;

  if (-[ASAAudioDevice isAggregate](self, "isAggregate"))
  {
    v7 = 8;
    cf = 0;
    if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1633906541, &cf, &v7, 0, 0))
    {
      if (cf)
      {
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        CFRelease(cf);
        return (NSDictionary *)v3;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read aggregate description property\n", v5, 2u);
    }
  }
  return (NSDictionary *)0;
}

- (NSDictionary)headsetInfo
{
  void *v2;
  uint8_t v4[16];
  CFTypeRef cf;
  int v6;

  v6 = 8;
  cf = 0;
  if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1751474532, &cf, &v6, 0, 0))
  {
    if (cf)
    {
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(cf);
      return (NSDictionary *)v2;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read headset info property\n", v4, 2u);
  }
  return (NSDictionary *)0;
}

- (void)setClientDescription:(id)a3
{
  uint8_t v3[8];
  id v4;

  v4 = a3;
  if (!-[ASAObject setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1667523955, &v4, 8, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not set client dictionary property\n", v3, 2u);
  }
}

- (NSDictionary)clientDescription
{
  void *v2;
  uint8_t v4[16];
  CFTypeRef cf;
  int v6;

  v6 = 8;
  cf = 0;
  if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1667523955, &cf, &v6, 0, 0))
  {
    if (cf)
    {
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(cf);
      return (NSDictionary *)v2;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read client description property\n", v4, 2u);
  }
  return (NSDictionary *)0;
}

- (NSDictionary)deviceDescription
{
  void *v2;
  uint8_t v4[16];
  CFTypeRef cf;
  int v6;

  v6 = 8;
  cf = 0;
  if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1684301171, &cf, &v6, 0, 0))
  {
    if (cf)
    {
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(cf);
      return (NSDictionary *)v2;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read device description property\n", v4, 2u);
  }
  return (NSDictionary *)0;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  _BOOL4 v39;
  const __CFString *v40;
  void *v41;
  float v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  void *v51;
  ASAStream *v52;
  ASAStream *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t j;
  void *v60;
  ASAStream *v61;
  ASAStream *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t k;
  ASAObject *v69;
  uint64_t v70;
  uint64_t v71;
  __objc2_class *v72;
  ASABooleanControl *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t m;
  void *v97;
  void *v98;
  void *v99;
  ASAAudioDevice *v100;
  void *v101;
  uint64_t v102;
  id obj;
  id v104;
  _BOOL4 v105;
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
  objc_super v122;
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  uint64_t v127;

  v4 = a4;
  v127 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v122.receiver = self;
  v122.super_class = (Class)ASAAudioDevice;
  v105 = v4;
  -[ASAObject diagnosticDescriptionWithIndent:walkTree:](&v122, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("|        "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAAudioDevice name](self, "name");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Name: %s\n"), v6, objc_msgSend(v9, "UTF8String"));

  -[ASAAudioDevice manufacturer](self, "manufacturer");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Manufacturer: %s\n"), v6, objc_msgSend(v10, "UTF8String"));

  -[ASAAudioDevice deviceUID](self, "deviceUID");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Device UID: %s\n"), v6, objc_msgSend(v11, "UTF8String"));

  -[ASAAudioDevice modelUID](self, "modelUID");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Model UID: %s\n"), v6, objc_msgSend(v12, "UTF8String"));

  v13 = -[ASAAudioDevice transportType](self, "transportType");
  LODWORD(v14) = v13 >> 24;
  if ((v13 - 0x20000000) >> 24 >= 0x5F)
    v14 = 32;
  else
    v14 = v14;
  LODWORD(v15) = v13 << 8 >> 24;
  if (((v13 << 8) - 0x20000000) >> 24 >= 0x5F)
    v15 = 32;
  else
    v15 = v15;
  if (((v13 << 16) - 0x20000000) >> 24 >= 0x5F)
    v16 = 32;
  else
    v16 = ((__int16)v13 >> 8);
  if (v13 << 24 == 2130706432 || v13 << 24 < 520093697)
    v18 = 32;
  else
    v18 = (char)v13;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Transport Type: %c%c%c%c\n"), v6, v14, v15, v16, v18);
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Clock Domain: 0x%08x\n"), v6, -[ASAAudioDevice clockDomain](self, "clockDomain"));
  if (-[ASAAudioDevice isAlive](self, "isAlive"))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Active: %@\n"), v6, v19);
  if (-[ASAAudioDevice isRunning](self, "isRunning"))
    v20 = CFSTR("YES");
  else
    v20 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Running: %@\n"), v6, v20);
  if (-[ASAAudioDevice canBeDefaultDevice](self, "canBeDefaultDevice"))
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Can Be Default Device: %@\n"), v6, v21);
  if (-[ASAAudioDevice canBeDefaultInputDevice](self, "canBeDefaultInputDevice"))
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Can Be Default Input Device: %@\n"), v6, v22);
  if (-[ASAAudioDevice canBeDefaultOutputDevice](self, "canBeDefaultOutputDevice"))
    v23 = CFSTR("YES");
  else
    v23 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Can Be Default Output Device: %@\n"), v6, v23);
  if (-[ASAAudioDevice canBeDefaultSystemDevice](self, "canBeDefaultSystemDevice"))
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Can Be Default System Device: %@\n"), v6, v24);
  -[ASAAudioDevice nominalSampleRate](self, "nominalSampleRate");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Nominal Sample Rate: %f\n"), v6, v25);
  v104 = v6;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Available Nominal Sample Rates:\n"), v6);
  -[ASAAudioDevice nominalSampleRates](self, "nominalSampleRates");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (v27)
  {
    v28 = 0;
    v29 = 0;
    do
    {
      -[ASAAudioDevice nominalSampleRates](self, "nominalSampleRates");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", v28);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      -[ASAAudioDevice nominalSampleRates](self, "nominalSampleRates");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "objectAtIndexedSubscript:", v28 + 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v31, "doubleValue");
      v35 = v34;
      objc_msgSend(v33, "doubleValue");
      objc_msgSend(v7, "appendFormat:", CFSTR("%@Rate[%u]: %f - %f\n"), v8, v29, v35, v36);
      v29 = (v29 + 1);

      -[ASAAudioDevice nominalSampleRates](self, "nominalSampleRates");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "count");

      v28 += 2;
    }
    while (v38 > v28);
  }
  v39 = -[ASAAudioDevice isHidden](self, "isHidden");
  v40 = CFSTR("NO");
  if (v39)
    v40 = CFSTR("YES");
  v41 = v104;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Hidden: %@\n"), v104, v40);
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Input Latency: %u\n"), v104, -[ASAAudioDevice inputLatency](self, "inputLatency"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Output Latency: %u\n"), v104, -[ASAAudioDevice outputLatency](self, "outputLatency"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Input Safety Offset: %u\n"), v104, -[ASAAudioDevice inputSafetyOffset](self, "inputSafetyOffset"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Output Safety Offset: %u\n"), v104, -[ASAAudioDevice outputSafetyOffset](self, "outputSafetyOffset"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Zero Timestamp Period: %u\n"), v104, -[ASAAudioDevice zeroTimestampPeriod](self, "zeroTimestampPeriod"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    IO Buffer Frame Size: %u\n"), v104, -[ASAAudioDevice ioBufferFrameSize](self, "ioBufferFrameSize"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Minimum IO Buffer Frame Size: %u\n"), v104, -[ASAAudioDevice minimumIOBufferFrameSize](self, "minimumIOBufferFrameSize"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Maximum IO Buffer Frame Size: %u\n"), v104, -[ASAAudioDevice maximumIOBufferFrameSize](self, "maximumIOBufferFrameSize"));
  -[ASAAudioDevice ioCycleUsage](self, "ioCycleUsage");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    IO Cycle Usage: %f\n"), v104, v42);
  if (-[ASAAudioDevice isRunning](self, "isRunning"))
  {
    -[ASAAudioDevice actualSampleRate](self, "actualSampleRate");
    objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Actual Sample Rate: %f\n"), v104, v43);
  }
  -[ASAAudioDevice clockDeviceUID](self, "clockDeviceUID");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v44;
  if (v44)
    objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Clock Device UID: %s\n"), v104, objc_msgSend(objc_retainAutorelease(v44), "UTF8String"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Input Streams:\n"), v104);
  -[ASAAudioDevice inputStreamObjectIDs](self, "inputStreamObjectIDs");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = self;
  v101 = v45;
  if (objc_msgSend(v99, "count"))
  {
    v120 = 0u;
    v121 = 0u;
    v118 = 0u;
    v119 = 0u;
    v46 = v99;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v118, v126, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v119;
      do
      {
        for (i = 0; i != v48; ++i)
        {
          if (*(_QWORD *)v119 != v49)
            objc_enumerationMutation(v46);
          v51 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * i);
          v52 = -[ASAObject initWithAudioObjectID:]([ASAStream alloc], "initWithAudioObjectID:", objc_msgSend(v51, "unsignedIntValue"));
          v53 = v52;
          if (v52)
          {
            -[ASAStream diagnosticDescriptionWithIndent:walkTree:](v52, "diagnosticDescriptionWithIndent:walkTree:", v8, v105);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendString:", v54);

          }
          else
          {
            objc_msgSend(v7, "appendFormat:", CFSTR("%@Could not get stream object with ID %u\n"), v8, objc_msgSend(v51, "unsignedIntValue"));
          }

        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v118, v126, 16);
      }
      while (v48);
    }

    v41 = v104;
    self = v100;
    v45 = v101;
  }
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Output Streams:\n"), v41);
  -[ASAAudioDevice outputStreamObjectIDs](self, "outputStreamObjectIDs");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v98, "count"))
  {
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    v55 = v98;
    v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v114, v125, 16);
    if (v56)
    {
      v57 = v56;
      v58 = *(_QWORD *)v115;
      do
      {
        for (j = 0; j != v57; ++j)
        {
          if (*(_QWORD *)v115 != v58)
            objc_enumerationMutation(v55);
          v60 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * j);
          v61 = -[ASAObject initWithAudioObjectID:]([ASAStream alloc], "initWithAudioObjectID:", objc_msgSend(v60, "unsignedIntValue"));
          v62 = v61;
          if (v61)
          {
            -[ASAStream diagnosticDescriptionWithIndent:walkTree:](v61, "diagnosticDescriptionWithIndent:walkTree:", v8, v105);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendString:", v63);

          }
          else
          {
            objc_msgSend(v7, "appendFormat:", CFSTR("%@Could not get stream object with ID %u\n"), v8, objc_msgSend(v60, "unsignedIntValue"));
          }

        }
        v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v114, v125, 16);
      }
      while (v57);
    }

    v41 = v104;
    self = v100;
    v45 = v101;
  }
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Controls:\n"), v41);
  -[ASAAudioDevice controlObjectIDs](self, "controlObjectIDs");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = v64;
  if (objc_msgSend(v64, "count"))
  {
    v112 = 0u;
    v113 = 0u;
    v110 = 0u;
    v111 = 0u;
    obj = v64;
    v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v124, 16);
    if (!v65)
      goto LABEL_116;
    v66 = v65;
    v102 = 0;
    v67 = *(_QWORD *)v111;
    while (1)
    {
      for (k = 0; k != v66; ++k)
      {
        if (*(_QWORD *)v111 != v67)
          objc_enumerationMutation(obj);
        v69 = -[ASAObject initWithAudioObjectID:]([ASAObject alloc], "initWithAudioObjectID:", objc_msgSend(*(id *)(*((_QWORD *)&v110 + 1) + 8 * k), "unsignedIntValue"));
        v70 = -[ASAObject baseClass](v69, "baseClass");
        v71 = v70;
        if ((int)v70 > 1936483441)
        {
          if ((_DWORD)v70 == 1936483442)
          {
            v72 = ASASliderControl;
            goto LABEL_113;
          }
          if ((_DWORD)v70 == 1953458028)
          {
            v73 = -[ASAObject initWithAudioObjectID:]([ASABooleanControl alloc], "initWithAudioObjectID:", -[ASAObject objectID](v69, "objectID"));
            -[ASABooleanControl diagnosticDescriptionWithIndent:walkTree:](v73, "diagnosticDescriptionWithIndent:walkTree:", v8, v105);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendString:", v74);

            goto LABEL_114;
          }
        }
        else
        {
          if ((_DWORD)v70 == 1818588780)
          {
            v72 = ASALevelControl;
            goto LABEL_113;
          }
          if ((_DWORD)v70 == 1936483188)
          {
            v72 = ASASelectorControl;
LABEL_113:
            v87 = (void *)objc_msgSend([v72 alloc], "initWithAudioObjectID:", -[ASAObject objectID](v69, "objectID"));
            objc_msgSend(v87, "diagnosticDescriptionWithIndent:walkTree:", v8, v105);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendString:", v88);

            goto LABEL_114;
          }
        }
        v75 = -[ASAObject objectClass](v69, "objectClass");
        v76 = -[ASAObject objectID](v69, "objectID");
        LODWORD(v77) = BYTE3(v71);
        if ((v71 - 0x20000000) >> 24 >= 0x5F)
          v77 = 32;
        else
          v77 = v77;
        if ((((_DWORD)v71 << 8) - 0x20000000) >> 24 >= 0x5F)
          v78 = 32;
        else
          v78 = BYTE2(v71);
        if ((((_DWORD)v71 << 16) - 0x20000000) >> 24 >= 0x5F)
          v79 = 32;
        else
          v79 = BYTE1(v71);
        if ((_DWORD)v71 << 24 == 2130706432 || (_DWORD)v71 << 24 < 520093697)
          v81 = 32;
        else
          v81 = v71;
        LODWORD(v82) = (int)v75 >> 24;
        if ((v75 - 0x20000000) >> 24 >= 0x5F)
          v82 = 32;
        else
          v82 = v82;
        LODWORD(v83) = (int)((_DWORD)v75 << 8) >> 24;
        if ((((_DWORD)v75 << 8) - 0x20000000) >> 24 >= 0x5F)
          v83 = 32;
        else
          v83 = v83;
        LODWORD(v84) = (__int16)v75 >> 8;
        if ((((_DWORD)v75 << 16) - 0x20000000) >> 24 >= 0x5F)
          v84 = 32;
        else
          v84 = v84;
        if ((_DWORD)v75 << 24 == 2130706432 || (_DWORD)v75 << 24 < 520093697)
          v86 = 32;
        else
          v86 = (char)v75;
        v41 = v104;
        objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: Object %u has unknown control class  %c%c%c%c (0x%08x) %c%c%c%c (0x%08x)\n"), v104, v102 + k, v76, v77, v78, v79, v81, v71, v82, v83, v84, v86, v75);
LABEL_114:

      }
      v66 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v124, 16);
      v102 = (v102 + k);
      if (!v66)
      {
LABEL_116:

        self = v100;
        v45 = v101;
        v64 = v97;
        break;
      }
    }
  }
  -[ASAAudioDevice relatedDeviceObjectIDs](self, "relatedDeviceObjectIDs");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v89, "count"))
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Related Device Objects:\n"), v41);
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v90 = v89;
    v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v106, v123, 16);
    if (v91)
    {
      v92 = v91;
      v93 = 0;
      v94 = *(_QWORD *)v107;
      do
      {
        for (m = 0; m != v92; ++m)
        {
          if (*(_QWORD *)v107 != v94)
            objc_enumerationMutation(v90);
          objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: %u\n"), v104, v93 + m, objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * m), "unsignedIntValue"));
        }
        v92 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v106, v123, 16);
        v93 = (v93 + m);
      }
      while (v92);
    }

    v41 = v104;
    v45 = v101;
    v64 = v97;
  }

  return v7;
}

- (id)coreAudioClassName
{
  return CFSTR("AudioDevice");
}

- (BOOL)createAudioProcID:(void *)a3 forIOProc:(void *)a4 withClientData:(void *)a5 error:(id *)a6
{
  OSStatus IOProcID;
  OSStatus v8;

  IOProcID = AudioDeviceCreateIOProcID(-[ASAObject objectID](self, "objectID"), (AudioDeviceIOProc)a4, a5, (AudioDeviceIOProcID *)a3);
  v8 = IOProcID;
  if (a6 && IOProcID)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], IOProcID, 0);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v8 == 0;
}

- (BOOL)destroyAudioProcID:(void *)a3 error:(id *)a4
{
  OSStatus v5;
  OSStatus v6;

  v5 = AudioDeviceDestroyIOProcID(-[ASAObject objectID](self, "objectID"), (AudioDeviceIOProcID)a3);
  v6 = v5;
  if (a4 && v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v5, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 == 0;
}

- (BOOL)startAudioProc:(void *)a3 error:(id *)a4
{
  OSStatus v5;
  OSStatus v6;

  v5 = AudioDeviceStart(-[ASAObject objectID](self, "objectID"), (AudioDeviceIOProcID)a3);
  v6 = v5;
  if (a4 && v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v5, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 == 0;
}

- (BOOL)stopAudioProc:(void *)a3 error:(id *)a4
{
  OSStatus v5;
  OSStatus v6;

  v5 = AudioDeviceStop(-[ASAObject objectID](self, "objectID"), (AudioDeviceIOProcID)a3);
  v6 = v5;
  if (a4 && v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1100], v5, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 == 0;
}

- (id)inputStreamUsageForAudioProc:(void *)a3
{
  unsigned int v5;
  void *v6;
  unsigned int v7;
  unsigned int *v8;
  unsigned int *v9;
  unint64_t v10;
  void *v11;
  unsigned int v13;

  v5 = -[ASAObject sizeOfMainInputProperty:withQualifier:ofSize:](self, "sizeOfMainInputProperty:withQualifier:ofSize:", 1937009955, 0, 0);
  v6 = 0;
  v13 = v5;
  if (v5 >= 4)
  {
    v7 = v5;
    v13 = (v5 & 0xFFFFFFFC) + 12;
    v8 = (unsigned int *)malloc_type_calloc(1uLL, v13, 0x17982E2FuLL);
    if (v8)
    {
      v9 = v8;
      *(_QWORD *)v8 = a3;
      v8[2] = v7 >> 2;
      v6 = 0;
      if (-[ASAObject getMainInputProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainInputProperty:withData:ofSize:withQualifier:ofSize:", 1937077093, v8, &v13, 0, 0))
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9[2])
        {
          v10 = 0;
          do
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9[v10 + 3] != 0);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v11);

            ++v10;
          }
          while (v10 < v9[2]);
        }
      }
      free(v9);
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

- (BOOL)setInputStreamUsage:(id)a3 forAudioProc:(void *)a4
{
  id v6;
  int v7;
  int v8;
  size_t v9;
  _QWORD *v10;
  _DWORD *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;

  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  v8 = v7;
  if (v7 && (v9 = (4 * v7 + 12), (v10 = malloc_type_calloc(1uLL, v9, 0x37501A32uLL)) != 0))
  {
    v11 = v10;
    v12 = 0;
    *v10 = a4;
    *((_DWORD *)v10 + 2) = v8;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11[v12 + 3] = objc_msgSend(v13, "unsignedIntValue");

      ++v12;
    }
    while (v8 != v12);
    v14 = -[ASAObject setMainInputProperty:withData:ofSize:withQualifier:ofSize:](self, "setMainInputProperty:withData:ofSize:withQualifier:ofSize:", 1937077093, v11, v9, 0, 0);
    free(v11);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)outputStreamUsageForAudioProc:(void *)a3
{
  unsigned int v5;
  void *v6;
  unsigned int v7;
  unsigned int *v8;
  unsigned int *v9;
  unint64_t v10;
  void *v11;
  unsigned int v13;

  v5 = -[ASAObject sizeOfMainOutputProperty:withQualifier:ofSize:](self, "sizeOfMainOutputProperty:withQualifier:ofSize:", 1937009955, 0, 0);
  v6 = 0;
  v13 = v5;
  if (v5 >= 4)
  {
    v7 = v5;
    v13 = (v5 & 0xFFFFFFFC) + 12;
    v8 = (unsigned int *)malloc_type_calloc(1uLL, v13, 0xB58B0B3CuLL);
    if (v8)
    {
      v9 = v8;
      *(_QWORD *)v8 = a3;
      v8[2] = v7 >> 2;
      v6 = 0;
      if (-[ASAObject getMainOutputProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainOutputProperty:withData:ofSize:withQualifier:ofSize:", 1937077093, v8, &v13, 0, 0))
      {
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9[2])
        {
          v10 = 0;
          do
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9[v10 + 3] != 0);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v11);

            ++v10;
          }
          while (v10 < v9[2]);
        }
      }
      free(v9);
    }
    else
    {
      v6 = 0;
    }
  }
  return v6;
}

- (BOOL)setOutputStreamUsage:(id)a3 forAudioProc:(void *)a4
{
  id v6;
  int v7;
  int v8;
  size_t v9;
  _QWORD *v10;
  _DWORD *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;

  v6 = a3;
  v7 = objc_msgSend(v6, "count");
  v8 = v7;
  if (v7 && (v9 = (4 * v7 + 12), (v10 = malloc_type_calloc(1uLL, v9, 0xCE7706FDuLL)) != 0))
  {
    v11 = v10;
    v12 = 0;
    *v10 = a4;
    *((_DWORD *)v10 + 2) = v8;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11[v12 + 3] = objc_msgSend(v13, "unsignedIntValue");

      ++v12;
    }
    while (v8 != v12);
    v14 = -[ASAObject setMainOutputProperty:withData:ofSize:withQualifier:ofSize:](self, "setMainOutputProperty:withData:ofSize:withQualifier:ofSize:", 1937077093, v11, v9, 0, 0);
    free(v11);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
