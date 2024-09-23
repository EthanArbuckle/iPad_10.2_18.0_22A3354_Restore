@implementation ASABox

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

- (NSString)modelName
{
  void *v2;
  uint8_t v4[16];
  CFTypeRef cf;
  int v6;

  v6 = 8;
  cf = 0;
  if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1819111268, &cf, &v6, 0, 0))
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
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read model name property\n", v4, 2u);
  }
  return (NSString *)0;
}

- (NSString)serialNumber
{
  void *v2;
  uint8_t v4[16];
  CFTypeRef cf;
  int v6;

  v6 = 8;
  cf = 0;
  if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1936618861, &cf, &v6, 0, 0))
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
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read serial number property\n", v4, 2u);
  }
  return (NSString *)0;
}

- (NSString)firmwareVersion
{
  void *v2;
  uint8_t v4[16];
  CFTypeRef cf;
  int v6;

  v6 = 8;
  cf = 0;
  if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1719105134, &cf, &v6, 0, 0))
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
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read firmware version property\n", v4, 2u);
  }
  return (NSString *)0;
}

- (NSString)boxUID
{
  void *v2;
  uint8_t v4[16];
  CFTypeRef cf;
  int v6;

  v6 = 8;
  cf = 0;
  if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1651861860, &cf, &v6, 0, 0))
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
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read box UID property\n", v4, 2u);
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

- (BOOL)hasAudio
{
  uint8_t v3[8];
  int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1651007861, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read has audio property\n", v3, 2u);
  }
  return v4 != 0;
}

- (BOOL)hasVideo
{
  uint8_t v3[8];
  int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1651013225, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read has video property\n", v3, 2u);
  }
  return v4 != 0;
}

- (BOOL)hasMIDI
{
  uint8_t v3[8];
  int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1651010921, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read has MIDI property\n", v3, 2u);
  }
  return v4 != 0;
}

- (BOOL)isProtected
{
  uint8_t v3[8];
  int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1651536495, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read is protected property\n", v3, 2u);
  }
  return v4 != 0;
}

- (BOOL)isAcquired
{
  uint8_t v3[8];
  int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1652060014, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read acquired property\n", v3, 2u);
  }
  return v4 != 0;
}

- (void)setAcquired:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;

  v3 = a3;
  if (-[ASABox isAcquireSettable](self, "isAcquireSettable"))
  {
    v5 = v3;
    -[ASAObject setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1652060014, &v5, 4, 0, 0);
  }
}

- (int)acquisitionFailure
{
  uint8_t v3[8];
  int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1652060006, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read acquisition failure property\n", v3, 2u);
  }
  return v4;
}

- (BOOL)identify
{
  uint8_t v3[8];
  int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1768187246, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read identify property\n", v3, 2u);
  }
  return v4 != 0;
}

- (void)setIdentify:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;

  v3 = a3;
  if (-[ASABox isIdentifySettable](self, "isIdentifySettable"))
  {
    v5 = v3;
    -[ASAObject setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1768187246, &v5, 4, 0, 0);
  }
}

- (NSArray)audioDeviceObjectIDs
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

  v3 = -[ASAObject sizeOfMainGlobalProperty:withQualifier:ofSize:](self, "sizeOfMainGlobalProperty:withQualifier:ofSize:", 1650751011, 0, 0);
  v15 = v3;
  if (v3 && (v4 = v3, (v5 = (unsigned int *)malloc_type_malloc(v3, 0xA63D3DEEuLL)) != 0))
  {
    v6 = v5;
    bzero(v5, v4);
    v7 = -[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1650751011, v6, &v15, 0, 0);
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

- (NSArray)audioDevices
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  ASAAudioDevice *v10;
  ASAAudioDevice *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[ASABox audioDeviceObjectIDs](self, "audioDeviceObjectIDs");
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
        v10 = [ASAAudioDevice alloc];
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

- (NSArray)clockDeviceObjectIDs
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

  v3 = -[ASAObject sizeOfMainGlobalProperty:withQualifier:ofSize:](self, "sizeOfMainGlobalProperty:withQualifier:ofSize:", 1650682915, 0, 0);
  v15 = v3;
  if (v3 && (v4 = v3, (v5 = (unsigned int *)malloc_type_malloc(v3, 0x3B495987uLL)) != 0))
  {
    v6 = v5;
    bzero(v5, v4);
    v7 = -[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1650682915, v6, &v15, 0, 0);
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

- (NSArray)clockDevices
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  ASAClockDevice *v10;
  ASAClockDevice *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[ASABox clockDeviceObjectIDs](self, "clockDeviceObjectIDs");
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
        v10 = [ASAClockDevice alloc];
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

- (BOOL)isAcquireSettable
{
  return -[ASAObject isMainGlobalPropertySettable:](self, "isMainGlobalPropertySettable:", 1652060014);
}

- (BOOL)isIdentifySettable
{
  return -[ASAObject isMainGlobalPropertySettable:](self, "isMainGlobalPropertySettable:", 1768187246);
}

- (BOOL)isNameSettable
{
  return -[ASAObject isMainGlobalPropertySettable:](self, "isMainGlobalPropertySettable:", 1819173229);
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  ASAAudioDevice *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  ASAClockDevice *v52;
  void *v53;
  ASABox *v55;
  void *v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  objc_super v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v4 = a4;
  v70 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v67.receiver = self;
  v67.super_class = (Class)ASABox;
  -[ASAObject diagnosticDescriptionWithIndent:walkTree:](&v67, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("|        "));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASABox name](self, "name");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Name: %s\n"), v6, objc_msgSend(v8, "UTF8String"));

  -[ASABox manufacturer](self, "manufacturer");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Manufacturer: %s\n"), v6, objc_msgSend(v9, "UTF8String"));

  -[ASABox modelName](self, "modelName");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Model Name: %s\n"), v6, objc_msgSend(v10, "UTF8String"));

  -[ASABox serialNumber](self, "serialNumber");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Serial Number: %s\n"), v6, objc_msgSend(v11, "UTF8String"));

  -[ASABox firmwareVersion](self, "firmwareVersion");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Firmware Version: %s\n"), v6, objc_msgSend(v12, "UTF8String"));

  -[ASABox boxUID](self, "boxUID");
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Box UID: %s\n"), v6, objc_msgSend(v13, "UTF8String"));

  -[ASABox modelUID](self, "modelUID");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Model UID: %s\n"), v6, objc_msgSend(v14, "UTF8String"));

  v15 = -[ASABox transportType](self, "transportType");
  LODWORD(v16) = v15 >> 24;
  if ((v15 - 0x20000000) >> 24 >= 0x5F)
    v16 = 32;
  else
    v16 = v16;
  LODWORD(v17) = v15 << 8 >> 24;
  if (((v15 << 8) - 0x20000000) >> 24 >= 0x5F)
    v17 = 32;
  else
    v17 = v17;
  LODWORD(v18) = (__int16)v15 >> 8;
  if (((v15 << 16) - 0x20000000) >> 24 >= 0x5F)
    v18 = 32;
  else
    v18 = v18;
  if (v15 << 24 == 2130706432 || v15 << 24 < 520093697)
    v20 = 32;
  else
    v20 = (char)v15;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Transport Type: %c%c%c%c\n"), v6, v16, v17, v18, v20);
  if (-[ASABox hasAudio](self, "hasAudio"))
    v21 = CFSTR("YES");
  else
    v21 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Has Audio: %@\n"), v6, v21);
  if (-[ASABox hasVideo](self, "hasVideo"))
    v22 = CFSTR("YES");
  else
    v22 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Has Video: %@\n"), v6, v22);
  if (-[ASABox hasMIDI](self, "hasMIDI"))
    v23 = CFSTR("YES");
  else
    v23 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Has MIDI: %@\n"), v6, v23);
  if (-[ASABox isProtected](self, "isProtected"))
    v24 = CFSTR("YES");
  else
    v24 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Protected: %@\n"), v6, v24);
  if (-[ASABox isAcquired](self, "isAcquired"))
    v25 = CFSTR("YES");
  else
    v25 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Acquired: %@\n"), v6, v25);
  if (-[ASABox isAcquireSettable](self, "isAcquireSettable"))
    v26 = CFSTR("YES");
  else
    v26 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Acquire Settable: %@\n"), v6, v26);
  if (-[ASABox isIdentifySettable](self, "isIdentifySettable"))
    v27 = CFSTR("YES");
  else
    v27 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Identify Settable: %@\n"), v6, v27);
  if (-[ASABox isNameSettable](self, "isNameSettable"))
    v28 = CFSTR("YES");
  else
    v28 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Name Settable: %@\n"), v6, v28);
  v29 = -[ASABox acquisitionFailure](self, "acquisitionFailure");
  LODWORD(v30) = v29 >> 24;
  if ((v29 - 0x20000000) >> 24 >= 0x5F)
    v30 = 32;
  else
    v30 = v30;
  LODWORD(v31) = v29 << 8 >> 24;
  if (((v29 << 8) - 0x20000000) >> 24 >= 0x5F)
    v31 = 32;
  else
    v31 = v31;
  LODWORD(v32) = (__int16)v29 >> 8;
  if (((v29 << 16) - 0x20000000) >> 24 >= 0x5F)
    v32 = 32;
  else
    v32 = v32;
  if (v29 << 24 == 2130706432 || v29 << 24 < 520093697)
    v34 = 32;
  else
    v34 = (char)v29;
  v35 = v6;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Acquisition Failure: %c%c%c%c\n"), v6, v30, v31, v32, v34);
  v55 = self;
  -[ASABox audioDeviceObjectIDs](self, "audioDeviceObjectIDs");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v36;
  if (objc_msgSend(v36, "count"))
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Device Objects:\n"), v35);
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v37 = v36;
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
    if (v38)
    {
      v39 = v38;
      v40 = 0;
      v41 = *(_QWORD *)v64;
      do
      {
        for (i = 0; i != v39; ++i)
        {
          if (*(_QWORD *)v64 != v41)
            objc_enumerationMutation(v37);
          if (v4)
          {
            v43 = -[ASAObject initWithAudioObjectID:]([ASAAudioDevice alloc], "initWithAudioObjectID:", objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "unsignedIntValue"));
            -[ASAAudioDevice diagnosticDescriptionWithIndent:walkTree:](v43, "diagnosticDescriptionWithIndent:walkTree:", v58, 1);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendString:", v44);

          }
          else
          {
            objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: %u\n"), v35, v40 + i, objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "unsignedIntValue"));
          }
        }
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
        v40 = (v40 + i);
      }
      while (v39);
    }

    v36 = v57;
  }
  -[ASABox clockDeviceObjectIDs](v55, "clockDeviceObjectIDs");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v45, "count"))
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Clock Device Objects:\n"), v35);
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v56 = v45;
    v46 = v45;
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
    if (v47)
    {
      v48 = v47;
      v49 = 0;
      v50 = *(_QWORD *)v60;
      do
      {
        for (j = 0; j != v48; ++j)
        {
          if (*(_QWORD *)v60 != v50)
            objc_enumerationMutation(v46);
          if (v4)
          {
            v52 = -[ASAObject initWithAudioObjectID:]([ASAClockDevice alloc], "initWithAudioObjectID:", objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * j), "unsignedIntValue"));
            -[ASAClockDevice diagnosticDescriptionWithIndent:walkTree:](v52, "diagnosticDescriptionWithIndent:walkTree:", v58, 1);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendString:", v53);

          }
          else
          {
            objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: %u\n"), v35, v49 + j, objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * j), "unsignedIntValue"));
          }
        }
        v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v59, v68, 16);
        v49 = (v49 + j);
      }
      while (v48);
    }

    v45 = v56;
    v36 = v57;
  }

  return v7;
}

- (id)coreAudioClassName
{
  return CFSTR("AudioBox");
}

@end
