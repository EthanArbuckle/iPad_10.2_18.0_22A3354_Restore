@implementation ASAClockDevice

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
  if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1668639076, &cf, &v6, 0, 0))
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
  if (v3 && (v4 = v3, (v5 = (double *)malloc_type_malloc(v3, 0x3576F32EuLL)) != 0))
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
    v6 = (unsigned int *)malloc_type_malloc(v4, 0xAAFE0C42uLL);
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
  -[ASAClockDevice controlObjectIDs](self, "controlObjectIDs");
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

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  _BOOL4 v28;
  const __CFString *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  ASAObject *v37;
  uint64_t v38;
  uint64_t v39;
  __objc2_class *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v56;
  id obj;
  void *v58;
  _BOOL4 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v4 = a4;
  v71 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v68.receiver = self;
  v68.super_class = (Class)ASAClockDevice;
  v59 = v4;
  -[ASAObject diagnosticDescriptionWithIndent:walkTree:](&v68, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("|        "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAClockDevice name](self, "name");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Name: %s\n"), v6, objc_msgSend(v9, "UTF8String"));

  -[ASAClockDevice manufacturer](self, "manufacturer");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Manufacturer: %s\n"), v6, objc_msgSend(v10, "UTF8String"));

  -[ASAClockDevice deviceUID](self, "deviceUID");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Device UID: %s\n"), v6, objc_msgSend(v11, "UTF8String"));

  v12 = -[ASAClockDevice transportType](self, "transportType");
  LODWORD(v13) = v12 >> 24;
  if ((v12 - 0x20000000) >> 24 >= 0x5F)
    v13 = 32;
  else
    v13 = v13;
  LODWORD(v14) = v12 << 8 >> 24;
  if (((v12 << 8) - 0x20000000) >> 24 >= 0x5F)
    v14 = 32;
  else
    v14 = v14;
  if (((v12 << 16) - 0x20000000) >> 24 >= 0x5F)
    v15 = 32;
  else
    v15 = ((__int16)v12 >> 8);
  if (v12 << 24 == 2130706432 || v12 << 24 < 520093697)
    v17 = 32;
  else
    v17 = (char)v12;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Transport Type: %c%c%c%c\n"), v6, v13, v14, v15, v17);
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Clock Domain: 0x%08x\n"), v6, -[ASAClockDevice clockDomain](self, "clockDomain"));
  if (-[ASAClockDevice isAlive](self, "isAlive"))
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Active: %@\n"), v6, v18);
  if (-[ASAClockDevice isRunning](self, "isRunning"))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Running: %@\n"), v6, v19);
  -[ASAClockDevice nominalSampleRate](self, "nominalSampleRate");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Nominal Sample Rate: %f\n"), v6, v20);
  v58 = v6;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Available Nominal Sample Rates:\n"), v6);
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  -[ASAClockDevice nominalSampleRates](self, "nominalSampleRates");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
  if (v22)
  {
    v23 = v22;
    v24 = 0;
    v25 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v65 != v25)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * i), "doubleValue");
        objc_msgSend(v7, "appendFormat:", CFSTR("%@Rate[%u]: %f\n"), v8, v24 + i, v27);
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      v24 = (v24 + i);
    }
    while (v23);
  }

  v28 = -[ASAClockDevice isHidden](self, "isHidden");
  v29 = CFSTR("NO");
  if (v28)
    v29 = CFSTR("YES");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Hidden: %@\n"), v58, v29);
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Zero Timestamp Period: %u\n"), v58, -[ASAClockDevice zeroTimestampPeriod](self, "zeroTimestampPeriod"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Controls:\n"), v58);
  -[ASAClockDevice controlObjectIDs](self, "controlObjectIDs");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "count"))
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v56 = v30;
    obj = v30;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    if (!v31)
      goto LABEL_83;
    v32 = v31;
    v33 = 0;
    v34 = *(_QWORD *)v61;
    while (1)
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v61 != v34)
          objc_enumerationMutation(obj);
        v36 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
        if (!v59)
        {
          objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: %u\n"), v58, v33 + j, objc_msgSend(v36, "unsignedIntValue"));
          continue;
        }
        v37 = -[ASAObject initWithAudioObjectID:]([ASAObject alloc], "initWithAudioObjectID:", objc_msgSend(v36, "unsignedIntValue"));
        v38 = -[ASAObject baseClass](v37, "baseClass");
        v39 = v38;
        if ((int)v38 > 1936483441)
        {
          if ((_DWORD)v38 == 1936483442)
          {
            v40 = ASASliderControl;
          }
          else
          {
            if ((_DWORD)v38 != 1953458028)
            {
LABEL_46:
              v41 = -[ASAObject objectClass](v37, "objectClass");
              v42 = -[ASAObject objectID](v37, "objectID");
              LODWORD(v43) = BYTE3(v39);
              if ((v39 - 0x20000000) >> 24 >= 0x5F)
                v43 = 32;
              else
                v43 = v43;
              if ((((_DWORD)v39 << 8) - 0x20000000) >> 24 >= 0x5F)
                v44 = 32;
              else
                v44 = BYTE2(v39);
              if ((((_DWORD)v39 << 16) - 0x20000000) >> 24 >= 0x5F)
                v45 = 32;
              else
                v45 = BYTE1(v39);
              if ((_DWORD)v39 << 24 == 2130706432 || (_DWORD)v39 << 24 < 520093697)
                v47 = 32;
              else
                v47 = v39;
              LODWORD(v48) = (int)v41 >> 24;
              if ((v41 - 0x20000000) >> 24 >= 0x5F)
                v48 = 32;
              else
                v48 = v48;
              LODWORD(v49) = (int)((_DWORD)v41 << 8) >> 24;
              if ((((_DWORD)v41 << 8) - 0x20000000) >> 24 >= 0x5F)
                v49 = 32;
              else
                v49 = v49;
              LODWORD(v50) = (__int16)v41 >> 8;
              if ((((_DWORD)v41 << 16) - 0x20000000) >> 24 >= 0x5F)
                v50 = 32;
              else
                v50 = v50;
              if ((_DWORD)v41 << 24 == 2130706432 || (_DWORD)v41 << 24 < 520093697)
                v52 = 32;
              else
                v52 = (char)v41;
              objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: Object %u has unknown control class  %c%c%c%c (0x%08x) %c%c%c%c (0x%08x)\n"), v58, v33 + j, v42, v43, v44, v45, v47, v39, v48, v49, v50, v52, v41);
              goto LABEL_80;
            }
            v40 = ASABooleanControl;
          }
        }
        else if ((_DWORD)v38 == 1818588780)
        {
          v40 = ASALevelControl;
        }
        else
        {
          if ((_DWORD)v38 != 1936483188)
            goto LABEL_46;
          v40 = ASASelectorControl;
        }
        v53 = (void *)objc_msgSend([v40 alloc], "initWithAudioObjectID:", -[ASAObject objectID](v37, "objectID"));
        objc_msgSend(v53, "diagnosticDescriptionWithIndent:walkTree:", v8, 1);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendString:", v54);

LABEL_80:
      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
      v33 = (v33 + j);
      if (!v32)
      {
LABEL_83:

        v30 = v56;
        break;
      }
    }
  }

  return v7;
}

- (id)coreAudioClassName
{
  return CFSTR("AudioClockDevice");
}

@end
