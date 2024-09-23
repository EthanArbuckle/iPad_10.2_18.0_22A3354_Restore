@implementation ASAStream

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

- (BOOL)isActive
{
  uint8_t v3[8];
  int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1935762292, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read is active property\n", v3, 2u);
  }
  return v4 != 0;
}

- (BOOL)isInput
{
  uint8_t v3[8];
  int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1935960434, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read direction property\n", v3, 2u);
  }
  return v4 == 1;
}

- (BOOL)isOutput
{
  uint8_t v3[8];
  int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1935960434, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read direction property\n", v3, 2u);
  }
  return v4 == 0;
}

- (unsigned)terminalType
{
  uint8_t v3[8];
  unsigned int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1952805485, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read terminal type property\n", v3, 2u);
  }
  return v4;
}

- (unsigned)startingChannel
{
  uint8_t v3[8];
  unsigned int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1935894638, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read starting channel property\n", v3, 2u);
  }
  return v4;
}

- (unsigned)latency
{
  uint8_t v3[8];
  unsigned int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1819569763, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read latency property\n", v3, 2u);
  }
  return v4;
}

- (ASAAudioFormat)virtualFormat
{
  uint8_t v3[12];
  int v4;
  _OWORD v5[2];
  uint64_t v6;

  v6 = 0;
  memset(v5, 0, sizeof(v5));
  v4 = 40;
  if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1936092532, v5, &v4, 0, 0))
  {
    return -[ASAAudioFormat initWithAudioStreamBasicDescription:]([ASAAudioFormat alloc], "initWithAudioStreamBasicDescription:", v5);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read virtual format property\n", v3, 2u);
  }
  return (ASAAudioFormat *)0;
}

- (void)setVirtualFormat:(id)a3
{
  id v4;
  uint8_t v5[16];
  _OWORD v6[2];
  uint64_t v7;

  v4 = a3;
  if (-[ASAStream isVirtualFormatSettable](self, "isVirtualFormatSettable"))
  {
    v7 = 0;
    memset(v6, 0, sizeof(v6));
    if (v4)
      objc_msgSend(v4, "audioStreamBasicDescription");
    if (!-[ASAObject setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1936092532, v6, 40, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not write virtual format property\n", v5, 2u);
    }
  }

}

- (BOOL)isVirtualFormatSettable
{
  return -[ASAObject isMainGlobalPropertySettable:](self, "isMainGlobalPropertySettable:", 1936092532);
}

- (ASAAudioFormat)physicalFormat
{
  uint8_t v3[12];
  int v4;
  _OWORD v5[2];
  uint64_t v6;

  v6 = 0;
  memset(v5, 0, sizeof(v5));
  v4 = 40;
  if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1885762592, v5, &v4, 0, 0))
  {
    return -[ASAAudioFormat initWithAudioStreamBasicDescription:]([ASAAudioFormat alloc], "initWithAudioStreamBasicDescription:", v5);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read physical format property\n", v3, 2u);
  }
  return (ASAAudioFormat *)0;
}

- (void)setPhysicalFormat:(id)a3
{
  id v4;
  uint8_t v5[16];
  _OWORD v6[2];
  uint64_t v7;

  v4 = a3;
  if (-[ASAStream isPhysicalFormatSettable](self, "isPhysicalFormatSettable"))
  {
    v7 = 0;
    memset(v6, 0, sizeof(v6));
    if (v4)
      objc_msgSend(v4, "audioStreamBasicDescription");
    if (!-[ASAObject setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1885762592, v6, 40, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not write physical format property\n", v5, 2u);
    }
  }

}

- (BOOL)isPhysicalFormatSettable
{
  return -[ASAObject isMainGlobalPropertySettable:](self, "isMainGlobalPropertySettable:", 1885762592);
}

- (NSArray)availableVirtualFormats
{
  unsigned int v3;
  size_t v4;
  char *v5;
  char *v6;
  _BOOL4 v7;
  void *v8;
  unsigned int v9;
  unint64_t v10;
  char *v11;
  ASAAudioFormat *v12;
  unsigned int v14;

  v3 = -[ASAObject sizeOfMainGlobalProperty:withQualifier:ofSize:](self, "sizeOfMainGlobalProperty:withQualifier:ofSize:", 1936092513, 0, 0);
  v14 = v3;
  if (v3 && (v4 = v3, (v5 = (char *)malloc_type_malloc(v3, 0x4257E859uLL)) != 0))
  {
    v6 = v5;
    bzero(v5, v4);
    v7 = -[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1936092513, v6, &v14, 0, 0);
    v8 = 0;
    if (v7)
    {
      v9 = v14;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 >= 0x38)
      {
        v10 = v9 / 0x38uLL;
        v11 = v6;
        do
        {
          v12 = -[ASAAudioFormat initWithAudioStreamRangedDescription:]([ASAAudioFormat alloc], "initWithAudioStreamRangedDescription:", v11);
          objc_msgSend(v8, "addObject:", v12);

          v11 += 56;
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

- (NSArray)availablePhysicalFormats
{
  unsigned int v3;
  size_t v4;
  char *v5;
  char *v6;
  _BOOL4 v7;
  void *v8;
  unsigned int v9;
  unint64_t v10;
  char *v11;
  ASAAudioFormat *v12;
  unsigned int v14;

  v3 = -[ASAObject sizeOfMainGlobalProperty:withQualifier:ofSize:](self, "sizeOfMainGlobalProperty:withQualifier:ofSize:", 1885762657, 0, 0);
  v14 = v3;
  if (v3 && (v4 = v3, (v5 = (char *)malloc_type_malloc(v3, 0x1F09D0DuLL)) != 0))
  {
    v6 = v5;
    bzero(v5, v4);
    v7 = -[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1885762657, v6, &v14, 0, 0);
    v8 = 0;
    if (v7)
    {
      v9 = v14;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 >= 0x38)
      {
        v10 = v9 / 0x38uLL;
        v11 = v6;
        do
        {
          v12 = -[ASAAudioFormat initWithAudioStreamRangedDescription:]([ASAAudioFormat alloc], "initWithAudioStreamRangedDescription:", v11);
          objc_msgSend(v8, "addObject:", v12);

          v11 += 56;
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
  void *v9;
  unint64_t v10;
  unsigned int *v11;
  unsigned int v12;
  void *v13;
  unsigned int v15;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ASAObject sizeOfMainGlobalProperty:withQualifier:ofSize:](self, "sizeOfMainGlobalProperty:withQualifier:ofSize:", 1668575852, 0, 0);
  v15 = v4;
  if (v4)
  {
    v5 = v4;
    v6 = (unsigned int *)malloc_type_malloc(v4, 0x9039FFEAuLL);
    if (v6)
    {
      v7 = v6;
      bzero(v6, v5);
      if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1668575852, v7, &v15, 0, 0))
      {
        v8 = v15;
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 >= 4)
        {
          v10 = v8 >> 2;
          v11 = v7;
          do
          {
            v12 = *v11++;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "addObject:", v13);

            --v10;
          }
          while (v10);
        }
        v3 = v9;
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
  -[ASAStream controlObjectIDs](self, "controlObjectIDs");
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

- (BOOL)isTapStream
{
  uint8_t v3[8];
  int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1952542835, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read tap stream property\n", v3, 2u);
  }
  return v4 != 0;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  const __CFString *v10;
  _BOOL4 v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  _BOOL8 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  ASAObject *v62;
  uint64_t v63;
  uint64_t v64;
  __objc2_class *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v81;
  void *v82;
  ASAStream *v83;
  _BOOL4 v84;
  void *v85;
  id obj;
  id obja;
  unint64_t objb;
  id v89;
  id v90;
  id v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  objc_super v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v4 = a4;
  v108 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v104.receiver = self;
  v104.super_class = (Class)ASAStream;
  v84 = v4;
  -[ASAObject diagnosticDescriptionWithIndent:walkTree:](&v104, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("|        "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAStream name](self, "name");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Name: %s\n"), v6, objc_msgSend(v9, "UTF8String"));

  if (-[ASAStream isActive](self, "isActive"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Active: %@\n"), v6, v10);
  v11 = -[ASAStream isInput](self, "isInput");
  v12 = CFSTR("Output");
  if (v11)
    v12 = CFSTR("Input");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Direction: %@\n"), v6, v12);
  if (-[ASAStream isTapStream](self, "isTapStream"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Is Tap Stream: %@\n"), v6, v13);
  v14 = -[ASAStream terminalType](self, "terminalType");
  LODWORD(v15) = BYTE3(v14);
  v16 = 32;
  if ((v14 - 0x20000000) >> 24 >= 0x5F)
    v15 = 32;
  else
    v15 = v15;
  if ((((_DWORD)v14 << 8) - 0x20000000) >> 24 >= 0x5F)
    v17 = 32;
  else
    v17 = BYTE2(v14);
  if ((((_DWORD)v14 << 16) - 0x20000000) >> 24 >= 0x5F)
    v18 = 32;
  else
    v18 = BYTE1(v14);
  if ((_DWORD)v14 << 24 == 2130706432 || (_DWORD)v14 << 24 < 520093697)
    v20 = 32;
  else
    v20 = v14;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Terminal Type: %c%c%c%c (0x%08x)\n"), v6, v15, v17, v18, v20, v14);
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Starting Channel: %u\n"), v6, -[ASAStream startingChannel](self, "startingChannel"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Latency: %u\n"), v6, -[ASAStream latency](self, "latency"));
  -[ASAStream virtualFormat](self, "virtualFormat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Virtual Format\n"), v6);
  objc_msgSend(v21, "sampleRate");
  v85 = v6;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Sample Rate: %f\n"), v6, v22);
  if ((int)objc_msgSend(v21, "formatID") >= 0x20000000)
  {
    if ((int)objc_msgSend(v21, "formatID") > 2130706431)
      v16 = 32;
    else
      v16 = ((int)objc_msgSend(v21, "formatID") >> 24);
  }
  if ((int)(objc_msgSend(v21, "formatID") << 8) < 0x20000000
    || (int)(objc_msgSend(v21, "formatID") << 8) > 2130706431)
  {
    v23 = 32;
  }
  else
  {
    v23 = ((int)(objc_msgSend(v21, "formatID") << 8) >> 24);
  }
  if ((int)(objc_msgSend(v21, "formatID") << 16) < 0x20000000
    || (int)(objc_msgSend(v21, "formatID") << 16) > 2130706431)
  {
    v24 = 32;
  }
  else
  {
    v24 = ((__int16)objc_msgSend(v21, "formatID") >> 8);
  }
  if ((int)(objc_msgSend(v21, "formatID") << 24) < 520093697
    || objc_msgSend(v21, "formatID") == 127)
  {
    v25 = 32;
  }
  else
  {
    v25 = (char)objc_msgSend(v21, "formatID");
  }
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Format ID: %c%c%c%c\n"), v85, v16, v23, v24, v25);
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Format Flags: 0x%08x\n"), v85, objc_msgSend(v21, "formatFlags"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Bytes Per Packet: %u\n"), v85, objc_msgSend(v21, "bytesPerFrame"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Frames Per Packet: %u\n"), v85, objc_msgSend(v21, "framesPerPacket"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Bytes Per Frame: %u\n"), v85, objc_msgSend(v21, "bytesPerFrame"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Channels Per Frame: %u\n"), v85, objc_msgSend(v21, "channelsPerFrame"));
  v81 = v21;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Bits Per Channel: %u\n"), v85, objc_msgSend(v21, "bitsPerChannel"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Available Virtual Format\n"), v85);
  v102 = 0u;
  v103 = 0u;
  v100 = 0u;
  v101 = 0u;
  v83 = self;
  -[ASAStream availableVirtualFormats](self, "availableVirtualFormats");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v107, 16);
  if (v26)
  {
    v27 = v26;
    v28 = 0;
    v89 = *(id *)v101;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(id *)v101 != v89)
          objc_enumerationMutation(obj);
        v30 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
        objc_msgSend(v7, "appendFormat:", CFSTR("%@%u: Virtual Format\n"), v8, v28 + i);
        objc_msgSend(v30, "sampleRate");
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Sample Rate: %f\n"), v8, v31);
        if ((int)objc_msgSend(v30, "formatID") < 0x20000000 || (int)objc_msgSend(v30, "formatID") > 2130706431)
          v32 = 32;
        else
          v32 = ((int)objc_msgSend(v30, "formatID") >> 24);
        if ((int)(objc_msgSend(v30, "formatID") << 8) < 0x20000000
          || (int)(objc_msgSend(v30, "formatID") << 8) > 2130706431)
        {
          v33 = 32;
        }
        else
        {
          v33 = ((int)(objc_msgSend(v30, "formatID") << 8) >> 24);
        }
        if ((int)(objc_msgSend(v30, "formatID") << 16) < 0x20000000
          || (int)(objc_msgSend(v30, "formatID") << 16) > 2130706431)
        {
          v34 = 32;
        }
        else
        {
          v34 = ((__int16)objc_msgSend(v30, "formatID") >> 8);
        }
        if ((int)(objc_msgSend(v30, "formatID") << 24) < 520093697
          || objc_msgSend(v30, "formatID") == 127)
        {
          v35 = 32;
        }
        else
        {
          v35 = (char)objc_msgSend(v30, "formatID");
        }
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Format ID: %c%c%c%c\n"), v8, v32, v33, v34, v35);
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Format Flags: 0x%08x\n"), v8, objc_msgSend(v30, "formatFlags"));
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Bytes Per Packet: %u\n"), v8, objc_msgSend(v30, "bytesPerFrame"));
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Frames Per Packet: %u\n"), v8, objc_msgSend(v30, "framesPerPacket"));
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Bytes Per Frame: %u\n"), v8, objc_msgSend(v30, "bytesPerFrame"));
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Channels Per Frame: %u\n"), v8, objc_msgSend(v30, "channelsPerFrame"));
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Bits Per Channel: %u\n"), v8, objc_msgSend(v30, "bitsPerChannel"));
        objc_msgSend(v30, "minimumSampleRate");
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Minimum Sample Rate: %f\n"), v8, v36);
        objc_msgSend(v30, "maximumSampleRate");
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Maximum Sample Rate: %f\n"), v8, v37);
      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v107, 16);
      v28 = (v28 + i);
    }
    while (v27);
  }

  -[ASAStream physicalFormat](v83, "physicalFormat");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Physical Format\n"), v85);
  objc_msgSend(v38, "sampleRate");
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Sample Rate: %f\n"), v85, v39);
  if ((int)objc_msgSend(v38, "formatID") < 0x20000000 || (int)objc_msgSend(v38, "formatID") > 2130706431)
    v40 = 32;
  else
    v40 = ((int)objc_msgSend(v38, "formatID") >> 24);
  if ((int)(objc_msgSend(v38, "formatID") << 8) < 0x20000000
    || (int)(objc_msgSend(v38, "formatID") << 8) > 2130706431)
  {
    v41 = 32;
  }
  else
  {
    v41 = ((int)(objc_msgSend(v38, "formatID") << 8) >> 24);
  }
  if ((int)(objc_msgSend(v38, "formatID") << 16) < 0x20000000
    || (int)(objc_msgSend(v38, "formatID") << 16) > 2130706431)
  {
    v42 = 32;
  }
  else
  {
    v42 = ((__int16)objc_msgSend(v38, "formatID") >> 8);
  }
  if ((int)(objc_msgSend(v38, "formatID") << 24) < 520093697
    || objc_msgSend(v38, "formatID") == 127)
  {
    v43 = 32;
  }
  else
  {
    v43 = (char)objc_msgSend(v38, "formatID");
  }
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Format ID: %c%c%c%c\n"), v85, v40, v41, v42, v43);
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Format Flags: 0x%08x\n"), v85, objc_msgSend(v38, "formatFlags"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Bytes Per Packet: %u\n"), v85, objc_msgSend(v38, "bytesPerFrame"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Frames Per Packet: %u\n"), v85, objc_msgSend(v38, "framesPerPacket"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Bytes Per Frame: %u\n"), v85, objc_msgSend(v38, "bytesPerFrame"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Channels Per Frame: %u\n"), v85, objc_msgSend(v38, "channelsPerFrame"));
  v82 = v38;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|        Bits Per Channel: %u\n"), v85, objc_msgSend(v38, "bitsPerChannel"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Available Physical Format\n"), v85);
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  -[ASAStream availablePhysicalFormats](v83, "availablePhysicalFormats");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
  if (v44)
  {
    v45 = v44;
    v46 = 0;
    v90 = *(id *)v97;
    do
    {
      for (j = 0; j != v45; ++j)
      {
        if (*(id *)v97 != v90)
          objc_enumerationMutation(obja);
        v48 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * j);
        objc_msgSend(v7, "appendFormat:", CFSTR("%@%u: Physical Format\n"), v8, v46 + j);
        objc_msgSend(v48, "sampleRate");
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Sample Rate: %f\n"), v8, v49);
        if ((int)objc_msgSend(v48, "formatID") < 0x20000000 || (int)objc_msgSend(v48, "formatID") > 2130706431)
          v50 = 32;
        else
          v50 = ((int)objc_msgSend(v48, "formatID") >> 24);
        if ((int)(objc_msgSend(v48, "formatID") << 8) < 0x20000000
          || (int)(objc_msgSend(v48, "formatID") << 8) > 2130706431)
        {
          v51 = 32;
        }
        else
        {
          v51 = ((int)(objc_msgSend(v48, "formatID") << 8) >> 24);
        }
        if ((int)(objc_msgSend(v48, "formatID") << 16) < 0x20000000
          || (int)(objc_msgSend(v48, "formatID") << 16) > 2130706431)
        {
          v52 = 32;
        }
        else
        {
          v52 = ((__int16)objc_msgSend(v48, "formatID") >> 8);
        }
        if ((int)(objc_msgSend(v48, "formatID") << 24) < 520093697
          || objc_msgSend(v48, "formatID") == 127)
        {
          v53 = 32;
        }
        else
        {
          v53 = (char)objc_msgSend(v48, "formatID");
        }
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Format ID: %c%c%c%c\n"), v8, v50, v51, v52, v53);
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Format Flags: 0x%08x\n"), v8, objc_msgSend(v48, "formatFlags"));
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Bytes Per Packet: %u\n"), v8, objc_msgSend(v48, "bytesPerFrame"));
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Frames Per Packet: %u\n"), v8, objc_msgSend(v48, "framesPerPacket"));
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Bytes Per Frame: %u\n"), v8, objc_msgSend(v48, "bytesPerFrame"));
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Channels Per Frame: %u\n"), v8, objc_msgSend(v48, "channelsPerFrame"));
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Bits Per Channel: %u\n"), v8, objc_msgSend(v48, "bitsPerChannel"));
        objc_msgSend(v48, "minimumSampleRate");
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Minimum Sample Rate: %f\n"), v8, v54);
        objc_msgSend(v48, "maximumSampleRate");
        objc_msgSend(v7, "appendFormat:", CFSTR("%@    Maximum Sample Rate: %f\n"), v8, v55);
      }
      v45 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
      v46 = (v46 + j);
    }
    while (v45);
  }

  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Controls:\n"), v85);
  -[ASAStream controlObjectIDs](v83, "controlObjectIDs");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v56, "count"))
  {
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v91 = v56;
    v57 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
    v58 = v84;
    if (!v57)
      goto LABEL_151;
    v59 = v57;
    objb = 0;
    v60 = *(_QWORD *)v93;
    while (1)
    {
      for (k = 0; k != v59; ++k)
      {
        if (*(_QWORD *)v93 != v60)
          objc_enumerationMutation(v91);
        v62 = -[ASAObject initWithAudioObjectID:]([ASAObject alloc], "initWithAudioObjectID:", objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * k), "unsignedIntValue"));
        v63 = -[ASAObject baseClass](v62, "baseClass");
        v64 = v63;
        if ((int)v63 > 1936483441)
        {
          if ((_DWORD)v63 == 1936483442)
          {
            v65 = ASASliderControl;
            goto LABEL_148;
          }
          if ((_DWORD)v63 == 1953458028)
          {
            v65 = ASABooleanControl;
            goto LABEL_148;
          }
        }
        else
        {
          if ((_DWORD)v63 == 1818588780)
          {
            v65 = ASALevelControl;
            goto LABEL_148;
          }
          if ((_DWORD)v63 == 1936483188)
          {
            v65 = ASASelectorControl;
LABEL_148:
            v78 = (void *)objc_msgSend([v65 alloc], "initWithAudioObjectID:", -[ASAObject objectID](v62, "objectID"));
            objc_msgSend(v78, "diagnosticDescriptionWithIndent:walkTree:", v8, v58);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendString:", v79);

            goto LABEL_149;
          }
        }
        v66 = -[ASAObject objectClass](v62, "objectClass");
        v67 = -[ASAObject objectID](v62, "objectID");
        LODWORD(v68) = BYTE3(v64);
        if ((v64 - 0x20000000) >> 24 >= 0x5F)
          v68 = 32;
        else
          v68 = v68;
        if ((((_DWORD)v64 << 8) - 0x20000000) >> 24 >= 0x5F)
          v69 = 32;
        else
          v69 = BYTE2(v64);
        if ((((_DWORD)v64 << 16) - 0x20000000) >> 24 >= 0x5F)
          v70 = 32;
        else
          v70 = BYTE1(v64);
        if ((_DWORD)v64 << 24 == 2130706432 || (_DWORD)v64 << 24 < 520093697)
          v72 = 32;
        else
          v72 = v64;
        LODWORD(v73) = (int)v66 >> 24;
        if ((v66 - 0x20000000) >> 24 >= 0x5F)
          v73 = 32;
        else
          v73 = v73;
        LODWORD(v74) = (int)((_DWORD)v66 << 8) >> 24;
        if ((((_DWORD)v66 << 8) - 0x20000000) >> 24 >= 0x5F)
          v74 = 32;
        else
          v74 = v74;
        LODWORD(v75) = (__int16)v66 >> 8;
        if ((((_DWORD)v66 << 16) - 0x20000000) >> 24 >= 0x5F)
          v75 = 32;
        else
          v75 = v75;
        if ((_DWORD)v66 << 24 == 2130706432 || (_DWORD)v66 << 24 < 520093697)
          v77 = 32;
        else
          v77 = (char)v66;
        v58 = v84;
        objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: Object %u has unknown control class  %c%c%c%c (0x%08x) %c%c%c%c (0x%08x)\n"), v85, objb + k, v67, v68, v69, v70, v72, v64, v73, v74, v75, v77, v66);
LABEL_149:

      }
      v59 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
      objb = (objb + k);
      if (!v59)
      {
LABEL_151:

        break;
      }
    }
  }

  return v7;
}

- (id)coreAudioClassName
{
  return CFSTR("AudioStream");
}

@end
