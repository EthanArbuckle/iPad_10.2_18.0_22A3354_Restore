@implementation ASASelectorControl

- (void)setCurrentItem:(unsigned int)a3
{
  uint8_t v3[12];
  unsigned int v4;

  v4 = a3;
  if (!-[ASAObject setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "setMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1935893353, &v4, 4, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not set current item property\n", v3, 2u);
  }
}

- (unsigned)currentItem
{
  uint8_t v3[8];
  unsigned int v4;
  int v5;

  v5 = 4;
  v4 = 0;
  if (!-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1935893353, &v4, &v5, 0, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read current item property\n", v3, 2u);
  }
  return v4;
}

- (NSArray)currentItems
{
  unsigned int v3;
  size_t v4;
  unsigned int *v5;
  unsigned int *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  void *v12;
  __int16 v14[6];
  unsigned int v15;

  v3 = -[ASAObject sizeOfMainGlobalProperty:withQualifier:ofSize:](self, "sizeOfMainGlobalProperty:withQualifier:ofSize:", 1935893353, 0, 0);
  v15 = v3;
  if (!v3)
    return (NSArray *)0;
  v4 = v3;
  v5 = (unsigned int *)malloc_type_malloc(v3, 0x3C76B422uLL);
  if (!v5)
    return (NSArray *)0;
  v6 = v5;
  bzero(v5, v4);
  if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1935893353, v6, &v15, 0, 0))
  {
    v7 = v15;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 >= 4)
    {
      v9 = v7 >> 2;
      v10 = v6;
      do
      {
        v11 = *v10++;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v12);

        --v9;
      }
      while (v9);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 0;
      _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read current items property\n", (uint8_t *)v14, 2u);
    }
    v8 = 0;
  }
  free(v6);
  return (NSArray *)v8;
}

- (NSArray)availableItems
{
  unsigned int v3;
  size_t v4;
  unsigned int *v5;
  unsigned int *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  unsigned int *v10;
  unsigned int v11;
  void *v12;
  __int16 v14[6];
  unsigned int v15;

  v3 = -[ASAObject sizeOfMainGlobalProperty:withQualifier:ofSize:](self, "sizeOfMainGlobalProperty:withQualifier:ofSize:", 1935892841, 0, 0);
  v15 = v3;
  if (!v3)
    return (NSArray *)0;
  v4 = v3;
  v5 = (unsigned int *)malloc_type_malloc(v3, 0x4805635BuLL);
  if (!v5)
    return (NSArray *)0;
  v6 = v5;
  bzero(v5, v4);
  if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1935892841, v6, &v15, 0, 0))
  {
    v7 = v15;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 >= 4)
    {
      v9 = v7 >> 2;
      v10 = v6;
      do
      {
        v11 = *v10++;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v12);

        --v9;
      }
      while (v9);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v14[0] = 0;
      _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read available items property\n", (uint8_t *)v14, 2u);
    }
    v8 = 0;
  }
  free(v6);
  return (NSArray *)v8;
}

- (id)nameForItem:(unsigned int)a3
{
  void *v3;
  uint8_t v5[16];
  CFTypeRef cf;
  int v7;
  unsigned int v8;

  v8 = a3;
  v7 = 8;
  cf = 0;
  if (-[ASAObject getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:](self, "getMainGlobalProperty:withData:ofSize:withQualifier:ofSize:", 1935894894, &cf, &v7, &v8, 4))
  {
    if (cf)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(cf);
      return v3;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21C46C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not read name for item property\n", v5, 2u);
  }
  return 0;
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  id obj;
  id obja;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v4 = a4;
  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v33.receiver = self;
  v33.super_class = (Class)ASASelectorControl;
  -[ASAControl diagnosticDescriptionWithIndent:walkTree:](&v33, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Current Item: %u\n"), v6, -[ASASelectorControl currentItem](self, "currentItem"));
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Current Items:\n"), v6);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[ASASelectorControl currentItems](self, "currentItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        -[ASASelectorControl nameForItem:](self, "nameForItem:", objc_msgSend(v13, "unsignedIntValue"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: %u \"%@\"\n"), v6, v10 + i, objc_msgSend(v13, "unsignedIntValue"), v14);

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      v10 = (v10 + i);
    }
    while (v9);
  }

  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    Available Items:\n"), v6);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[ASASelectorControl availableItems](self, "availableItems");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = 0;
    v18 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(obja);
        v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
        -[ASASelectorControl nameForItem:](self, "nameForItem:", objc_msgSend(v20, "unsignedIntValue"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR("%@|        %u: %u \"%@\"\n"), v6, v17 + j, objc_msgSend(v20, "unsignedIntValue"), v21);

      }
      v16 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      v17 = (v17 + j);
    }
    while (v16);
  }

  return v7;
}

- (id)coreAudioClassName
{
  int v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v2 = -[ASAObject objectClass](self, "objectClass");
  v3 = CFSTR("AudioSelectorControl");
  v4 = CFSTR("AudioDataSourceControl");
  if (v2 != 1685287523)
    v4 = CFSTR("AudioSelectorControl");
  if (v2 == 1751740518)
    v5 = CFSTR("AudioHighPassFilterControl");
  else
    v5 = v4;
  if (v2 == 1852601964)
    v6 = CFSTR("AudioLineLevelControl");
  else
    v6 = v5;
  if (v2 == 1684370292)
    v3 = CFSTR("AudioDataDestinationControl");
  if (v2 == 1668047723)
    v3 = CFSTR("AudioClockSourceControl");
  if (v2 <= 1685287522)
    return (id)v3;
  else
    return (id)v6;
}

- (void)setCurrentItems:(id)a3
{
  self->_currentItems = (NSArray *)a3;
}

@end
