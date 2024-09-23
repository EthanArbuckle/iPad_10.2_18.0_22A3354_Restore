@implementation ASAPlugin

+ (id)pluginWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBundleIdentifier:", v4);

  return v5;
}

- (ASAPlugin)initWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v4 = a3;
  +[ASACoreAudio sharedCoreAudioObject](ASACoreAudio, "sharedCoreAudioObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "pluginObjectIDWithBundleID:", v4);

  if ((_DWORD)v6)
  {
    v8.receiver = self;
    v8.super_class = (Class)ASAPlugin;
    return -[ASAObject initWithAudioObjectID:](&v8, sel_initWithAudioObjectID_, v6);
  }
  else
  {

    return 0;
  }
}

- (NSString)bundleID
{
  void *v2;
  uint8_t v4[16];
  CFTypeRef cf;
  int v6;

  v6 = 8;
  cf = 0;
  if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1885956452, &cf, &v6, 0, 0))
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
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read bundle ID property\n", v4, 2u);
  }
  return (NSString *)0;
}

- (NSURL)resourceBundleURL
{
  void *v3;
  uint8_t v5[4];
  int v6;
  CFTypeRef cf;

  if (!-[ASAObject hasMainGlobalProperty:](self, "hasMainGlobalProperty:", 1768124270))
    return (NSURL *)0;
  cf = 0;
  v6 = 8;
  if (!-[ASAObject getMainOutputProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainOutputProperty:withData:ofSize:withQualifier:ofSize:", 1920168547, &cf, &v6, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read output resource bundle property\n", v5, 2u);
  }
  if (!cf)
    return (NSURL *)0;
  objc_msgSend((id)cf, "absoluteURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(cf);
  return (NSURL *)v3;
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

- (unsigned)boxObjectIDWithUID:(id)a3
{
  unsigned int v4;
  int v6;
  unsigned int v7;
  id v8;

  v8 = a3;
  v6 = 4;
  v7 = 0;
  if (!v8)
    return 0;
  -[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1969841250, &v7, &v6, &v8, 8);
  v4 = v7;

  return v4;
}

- (id)boxWithUID:(id)a3
{
  id v4;
  ASABox *v5;
  uint64_t v6;

  v4 = a3;
  v5 = [ASABox alloc];
  v6 = -[ASAPlugin boxObjectIDWithUID:](self, "boxObjectIDWithUID:", v4);

  return -[ASAObject initWithAudioObjectID:](v5, "initWithAudioObjectID:", v6);
}

- (unsigned)audioDeviceObjectIDWithUID:(id)a3
{
  unsigned int v4;
  int v6;
  unsigned int v7;
  id v8;

  v8 = a3;
  v6 = 4;
  v7 = 0;
  if (!v8)
    return 0;
  -[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1969841252, &v7, &v6, &v8, 8);
  v4 = v7;

  return v4;
}

- (id)audioDeviceWithUID:(id)a3
{
  id v4;
  ASAAudioDevice *v5;
  uint64_t v6;

  v4 = a3;
  v5 = [ASAAudioDevice alloc];
  v6 = -[ASAPlugin audioDeviceObjectIDWithUID:](self, "audioDeviceObjectIDWithUID:", v4);

  return -[ASAObject initWithAudioObjectID:](v5, "initWithAudioObjectID:", v6);
}

- (unsigned)clockDeviceObjectIDWithUID:(id)a3
{
  unsigned int v4;
  int v6;
  unsigned int v7;
  id v8;

  v8 = a3;
  v6 = 4;
  v7 = 0;
  if (!v8)
    return 0;
  -[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1969841251, &v7, &v6, &v8, 8);
  v4 = v7;

  return v4;
}

- (id)clockDeviceWithUID:(id)a3
{
  id v4;
  ASAClockDevice *v5;
  uint64_t v6;

  v4 = a3;
  v5 = [ASAClockDevice alloc];
  v6 = -[ASAPlugin clockDeviceObjectIDWithUID:](self, "clockDeviceObjectIDWithUID:", v4);

  return -[ASAObject initWithAudioObjectID:](v5, "initWithAudioObjectID:", v6);
}

- (NSArray)boxObjectIDs
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
  v4 = -[ASAObject sizeOfMainGlobalProperty:withQualifier:ofSize:](self, "sizeOfMainGlobalProperty:withQualifier:ofSize:", 1651472419, 0, 0);
  v13 = v4;
  if (v4)
  {
    v5 = v4;
    v6 = (unsigned int *)malloc_type_malloc(v4, 0x575D4B6FuLL);
    if (v6)
    {
      v7 = v6;
      bzero(v6, v5);
      if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1651472419, v7, &v13, 0, 0)&& v13 >= 4)
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

- (NSArray)boxes
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  ASABox *v10;
  ASABox *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[ASAPlugin boxObjectIDs](self, "boxObjectIDs");
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
        v10 = [ASABox alloc];
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

- (NSArray)audioDeviceObjectIDs
{
  void *v3;
  unsigned int v4;
  size_t v5;
  _DWORD *v6;
  _DWORD *v7;
  unint64_t v8;
  _DWORD *v9;
  void *v11;
  unsigned int v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ASAObject sizeOfMainGlobalProperty:withQualifier:ofSize:](self, "sizeOfMainGlobalProperty:withQualifier:ofSize:", 1684370979, 0, 0);
  v13 = v4;
  if (v4)
  {
    v5 = v4;
    v6 = malloc_type_malloc(v4, 0x76A61707uLL);
    if (v6)
    {
      v7 = v6;
      bzero(v6, v5);
      if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1684370979, v7, &v13, 0, 0)&& v13 >= 4)
      {
        v8 = (unint64_t)v13 >> 2;
        v9 = v7;
        do
        {
          if (*v9++)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v11);

          }
          --v8;
        }
        while (v8);
      }
      free(v7);
    }
  }
  return (NSArray *)v3;
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
  -[ASAPlugin audioDeviceObjectIDs](self, "audioDeviceObjectIDs");
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
  v4 = -[ASAObject sizeOfMainGlobalProperty:withQualifier:ofSize:](self, "sizeOfMainGlobalProperty:withQualifier:ofSize:", 1668049699, 0, 0);
  v13 = v4;
  if (v4)
  {
    v5 = v4;
    v6 = (unsigned int *)malloc_type_malloc(v4, 0x75203375uLL);
    if (v6)
    {
      v7 = v6;
      bzero(v6, v5);
      if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1668049699, v7, &v13, 0, 0)&& v13 >= 4)
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
  -[ASAPlugin clockDeviceObjectIDs](self, "clockDeviceObjectIDs");
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

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  ASABox *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  ASAAudioDevice *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  ASAClockDevice *v37;
  void *v38;
  void *v40;
  ASAPlugin *v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  objc_super v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v4 = a4;
  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v57.receiver = self;
  v57.super_class = (Class)ASAPlugin;
  -[ASAObject diagnosticDescriptionWithIndent:walkTree:](&v57, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("|        "));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAPlugin bundleID](self, "bundleID");
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Bundle ID: %s\n"), v6, objc_msgSend(v8, "UTF8String"));

  -[ASAPlugin resourceBundleURL](self, "resourceBundleURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "absoluteString");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Resource Bundle URL: %s\n"), v6, objc_msgSend(v10, "UTF8String"));

  -[ASAPlugin manufacturer](self, "manufacturer");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = v6;
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Manufacturer: %s\n"), v6, objc_msgSend(v11, "UTF8String"));

  -[ASAPlugin boxObjectIDs](self, "boxObjectIDs");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = self;
  if (objc_msgSend(v43, "count"))
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Box Objects:\n"), v6);
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v13 = v43;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v54 != v17)
            objc_enumerationMutation(v13);
          if (v4)
          {
            v19 = -[ASAObject initWithAudioObjectID:]([ASABox alloc], "initWithAudioObjectID:", objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "unsignedIntValue"));
            -[ASABox diagnosticDescriptionWithIndent:walkTree:](v19, "diagnosticDescriptionWithIndent:walkTree:", v44, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendString:", v20);

          }
          else
          {
            objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: %u\n"), v12, v16 + i, objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "unsignedIntValue"));
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
        v16 = (v16 + i);
      }
      while (v15);
    }

    self = v41;
  }
  -[ASAPlugin deviceObjectIDs](self, "deviceObjectIDs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v21;
  if (objc_msgSend(v21, "count"))
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Device Objects:\n"), v12);
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v22 = v21;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    if (v23)
    {
      v24 = v23;
      v25 = 0;
      v26 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v50 != v26)
            objc_enumerationMutation(v22);
          if (v4)
          {
            v28 = -[ASAObject initWithAudioObjectID:]([ASAAudioDevice alloc], "initWithAudioObjectID:", objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "unsignedIntValue"));
            -[ASAAudioDevice diagnosticDescriptionWithIndent:walkTree:](v28, "diagnosticDescriptionWithIndent:walkTree:", v44, 1);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29)
              objc_msgSend(v7, "appendString:", v29);

          }
          else
          {
            objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: %u\n"), v12, v25 + j, objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "unsignedIntValue"));
          }
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
        v25 = (v25 + j);
      }
      while (v24);
    }

    v21 = v40;
    self = v41;
  }
  -[ASAPlugin clockDeviceObjectIDs](self, "clockDeviceObjectIDs");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v30, "count"))
  {
    objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Clock Device Objects:\n"), v12);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v42 = v30;
    v31 = v30;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    if (v32)
    {
      v33 = v32;
      v34 = 0;
      v35 = *(_QWORD *)v46;
      do
      {
        for (k = 0; k != v33; ++k)
        {
          if (*(_QWORD *)v46 != v35)
            objc_enumerationMutation(v31);
          if (v4)
          {
            v37 = -[ASAObject initWithAudioObjectID:]([ASAClockDevice alloc], "initWithAudioObjectID:", objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * k), "unsignedIntValue"));
            -[ASAClockDevice diagnosticDescriptionWithIndent:walkTree:](v37, "diagnosticDescriptionWithIndent:walkTree:", v44, 1);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "appendString:", v38);

          }
          else
          {
            objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: %u\n"), v12, v34 + k, objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * k), "unsignedIntValue"));
          }
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
        v34 = (v34 + k);
      }
      while (v33);
    }

    v21 = v40;
    v30 = v42;
  }

  return v7;
}

- (id)coreAudioClassName
{
  return CFSTR("AudioPlugin");
}

@end
