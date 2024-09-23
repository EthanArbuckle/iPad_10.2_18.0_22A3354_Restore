CFMutableDictionaryRef create_dict()
{
  return CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
}

id copyVolumePartition(void *a1)
{
  void *v1;
  void *v2;
  mach_port_t v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;
  io_object_t v6;
  void *CFProperty;
  void *v8;
  id v9;
  io_registry_entry_t entry;

  entry = 0;
  copyBSDName(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = *MEMORY[0x24BDD8B20];
    v4 = IOBSDNameMatching(*MEMORY[0x24BDD8B20], 0, (const char *)objc_msgSend(objc_retainAutorelease(v1), "UTF8String"));
    MatchingService = IOServiceGetMatchingService(v3, v4);
    entry = MatchingService;
    if (MatchingService)
    {
      v6 = MatchingService;
      if (!IOObjectConformsTo(MatchingService, "AppleAPFSVolume"))
      {
        v9 = 0;
        CFProperty = 0;
LABEL_17:
        IOObjectRelease(v6);
        goto LABEL_18;
      }
      if (exchange_with_parent_matching_class(&entry, "AppleAPFSContainer")
        && exchange_with_parent_matching_class(&entry, "AppleAPFSMedia")
        && exchange_with_parent_matching_class(&entry, "AppleAPFSContainerScheme")
        && exchange_with_parent_matching_class(&entry, "IOMedia"))
      {
        CFProperty = (void *)IORegistryEntryCreateCFProperty(entry, CFSTR("BSD Name"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
        if (CFProperty)
        {
          v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("/dev/%@"), CFProperty);
          if (v8)
          {
            v9 = v8;
            goto LABEL_14;
          }
        }
      }
      else
      {
        CFProperty = 0;
      }
      v9 = 0;
LABEL_14:
      v6 = entry;
      if (!entry)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  v9 = 0;
  CFProperty = 0;
LABEL_18:

  return v9;
}

id copyBSDName(void *a1)
{
  id v1;
  void *v2;
  id v3;
  __CFString *v4;
  uint64_t v5;
  id v6;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
    v4 = CFSTR("/dev/r");
    if ((objc_msgSend(v3, "hasPrefix:", CFSTR("/dev/r")) & 1) != 0
      || (v4 = CFSTR("/dev/"), objc_msgSend(v3, "hasPrefix:", CFSTR("/dev/"))))
    {
      objc_msgSend(v3, "substringFromIndex:", -[__CFString length](v4, "length"));
      v5 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v5;
    }
    v6 = v3;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t exchange_with_parent_matching_class(io_object_t *a1, const char *a2)
{
  uint64_t result;
  io_registry_entry_t parent;

  result = 0;
  parent = 0;
  if (a1 && a2)
  {
    if (IORegistryEntryGetParentEntry(*a1, "IOService", &parent) || !IOObjectConformsTo(parent, a2))
    {
      result = parent;
      if (parent)
      {
        IOObjectRelease(parent);
        return 0;
      }
    }
    else
    {
      IOObjectRelease(*a1);
      *a1 = parent;
      return 1;
    }
  }
  return result;
}

id copyRelativeMountPath(void *a1)
{
  return a1;
}

id isNSNumber(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id isNSDictionary(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id isNSArray(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id isNSString(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id isNSData(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id isNSURL(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

uint64_t determine_filesystem_type()
{
  void *v0;
  _QWORD *v1;
  _QWORD *v2;
  id v3;
  void *v4;
  void *v5;
  mach_port_t v6;
  id v7;
  const __CFDictionary *v8;
  io_service_t MatchingService;
  io_object_t v10;
  const __CFAllocator *v11;
  void *v12;
  id CFProperty;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  char v22;
  _BYTE entry[12];
  __int16 v26;
  int v27;
  _BYTE v28[3];
  uint64_t v29;
  __int16 v30;
  char v31;
  uint64_t v32;

  v0 = (void *)MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v32 = *MEMORY[0x24BDAC8D0];
  v3 = v0;
  bzero(v28, 0x1000uLL);
  if (!v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)entry = 0;
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Invalid input(s).", entry, 2u);
    }
    v3 = 0;
    goto LABEL_32;
  }
  copyBSDName(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4
    || (v6 = *MEMORY[0x24BDD8B20],
        v7 = objc_retainAutorelease(v4),
        v8 = IOBSDNameMatching(v6, 0, (const char *)objc_msgSend(v7, "UTF8String")),
        MatchingService = IOServiceGetMatchingService(v6, v8),
        (*(_DWORD *)entry = MatchingService) == 0))
  {

    goto LABEL_16;
  }
  v10 = MatchingService;
  if (!IOObjectConformsTo(MatchingService, "IOMedia"))
  {
    IOObjectRelease(v10);

    goto LABEL_16;
  }
  if (!exchange_with_first_child_of_class((io_object_t *)entry, "AppleAPFSContainerScheme")
    || !exchange_with_first_child_of_class((io_object_t *)entry, "AppleAPFSMedia"))
  {
    v22 = 0;
    v12 = 0;
LABEL_45:
    CFProperty = 0;
    goto LABEL_46;
  }
  v11 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v12 = (void *)IORegistryEntrySearchCFProperty(*(io_registry_entry_t *)entry, "IOService", CFSTR("Content Hint"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (!v12 || !objc_msgSend(CFSTR("EF57347C-0000-11AA-AA11-00306543ECAC"), "isEqualToString:", v12))
    goto LABEL_44;
  if (!v2)
  {
    CFProperty = 0;
    goto LABEL_55;
  }
  if (!exchange_with_first_child_of_class((io_object_t *)entry, "AppleAPFSContainer")
    || !exchange_with_first_child_of_class((io_object_t *)entry, "AppleAPFSVolume"))
  {
LABEL_44:
    v22 = 0;
    goto LABEL_45;
  }
  CFProperty = (id)IORegistryEntryCreateCFProperty(*(io_registry_entry_t *)entry, CFSTR("BSD Name"), v11, 0);
  isNSString(CFProperty);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(CFSTR("/dev/"), "stringByAppendingString:", CFProperty);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      CFProperty = objc_retainAutorelease(v15);
      *v2 = CFProperty;
LABEL_55:
      v22 = 1;
      goto LABEL_46;
    }
    goto LABEL_44;
  }
  v22 = 0;
LABEL_46:
  if (*(_DWORD *)entry)
    IOObjectRelease(*(io_object_t *)entry);

  if ((v22 & 1) != 0)
  {
    v19 = 6;
    goto LABEL_53;
  }
LABEL_16:
  if ((objc_msgSend(v3, "hasPrefix:", CFSTR("/dev/"), *(_QWORD *)entry) & 1) == 0)
  {
    objc_msgSend(CFSTR("/dev"), "stringByAppendingString:", v3);
    v16 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v16;
  }
  v3 = objc_retainAutorelease(v3);
  v17 = open((const char *)objc_msgSend(v3, "UTF8String"), 0);
  if (v17 == -1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v20 = *__error();
      *(_DWORD *)entry = 138412546;
      *(_QWORD *)&entry[4] = v3;
      v26 = 1024;
      v27 = v20;
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to open %@: %{errno}d", entry, 0x12u);
    }
LABEL_32:
    v19 = 0;
    goto LABEL_53;
  }
  v18 = v17;
  if (read(v17, v28, 0x1000uLL) == 4096)
  {
    if (v28[0] == 233 || v28[0] == 235 && v28[2] == 144)
    {
      if (v29 == 0x202020205346544ELL)
      {
        v19 = 5;
      }
      else if (v29 == 0x2020205441465845)
      {
        v19 = 4;
      }
      else
      {
        v19 = 1;
      }
    }
    else if (v30 == 11080)
    {
      v19 = 2 * (v31 == 4);
    }
    else if (v31 == 5 && v30 == 22600)
    {
      v19 = 3;
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v21 = *__error();
      *(_DWORD *)entry = 138412546;
      *(_QWORD *)&entry[4] = v3;
      v26 = 1024;
      v27 = v21;
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to read %@ volume header: %{errno}d", entry, 0x12u);
      v19 = 0;
    }
  }
  close(v18);
LABEL_53:

  return v19;
}

BOOL isDeveloperModeEnabled()
{
  int *v0;
  _BOOL4 v1;
  _BOOL8 result;
  int v3;
  size_t v4;
  uint64_t v5;
  uint8_t buf[4];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = 8;
  v5 = 0;
  if (!sysctlbyname("security.mac.amfi.developer_mode_status", &v5, &v4, 0, 0))
    return v5 == 1;
  v0 = __error();
  v1 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v1)
  {
    v3 = *v0;
    *(_DWORD *)buf = 67109120;
    v7 = v3;
    _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to read developer mode status: %{darwin.errno}d", buf, 8u);
    return 0;
  }
  return result;
}

BOOL systemSupportsRestrictedExecutionMode(BOOL *a1, _QWORD *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _BOOL8 v9;
  size_t v11;
  int v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  v11 = 4;
  if (sysctlbyname("security.codesigning.config", &v12, &v11, 0, 0))
  {
    v4 = *__error();
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "security.codesigning.config";
      v15 = 1024;
      v16 = v4;
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to read sysctl (%s): %{darwin.errno}d", buf, 0x12u);
    }
    createMobileStorageError((uint64_t)"systemSupportsRestrictedExecutionMode", 773, -2, 0, CFSTR("Failed to read sysctl (%s): %{darwin.errno}d"), v5, v6, v7, (uint64_t)"security.codesigning.config");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (a2 && v8)
    {
      v8 = objc_retainAutorelease(v8);
      *a2 = v8;
    }
  }
  else
  {
    v8 = 0;
    if (a1)
      *a1 = (v12 & 0x2000000) != 0;
  }
  v9 = v8 == 0;

  return v9;
}

id createMobileStorageError(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13;
  objc_class *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v13 = a4;
  v14 = (objc_class *)MEMORY[0x24BDD16A8];
  v15 = a5;
  v16 = (void *)objc_msgSend([v14 alloc], "initWithFormat:arguments:", v15, &a9);

  v17 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v18 = v17;
  if (v16)
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BDD0FC8]);
  if (v13)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BDD1398]);
  if (os_variant_allows_internal_security_policies())
  {
    if (a1)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("FunctionName"));

    }
    if ((_DWORD)a2)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("SourceLine"));

    }
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.MobileStorage.ErrorDomain"), a3, v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

uint64_t allowInvalidatingAttestations()
{
  NSObject *v0;
  const char *v1;
  uint32_t v2;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if ((os_parse_boot_arg_int() & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v5 = " not";
      v6 = 2080;
      v7 = "allow_msm_to_invalidate_attestations";
      v8 = 2048;
      v9 = 0;
      v0 = MEMORY[0x24BDACB70];
      v1 = "Invalidating system attestation is%s allowed per boot-arg %s=%lld";
      v2 = 32;
LABEL_6:
      _os_log_impl(&dword_2126BE000, v0, OS_LOG_TYPE_DEFAULT, v1, buf, v2);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v5 = "allow_msm_to_invalidate_attestations";
    v0 = MEMORY[0x24BDACB70];
    v1 = "You can set the boot-arg %s=1 to allow invalidating the system's attestation.";
    v2 = 12;
    goto LABEL_6;
  }
  return 0;
}

BOOL is_disk_image(io_registry_entry_t a1)
{
  const __CFDictionary *v1;
  const __CFDictionary *v2;
  const __CFString *Value;
  _BOOL8 v4;

  v1 = (const __CFDictionary *)IORegistryEntrySearchCFProperty(a1, "IOService", CFSTR("Protocol Characteristics"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 3u);
  if (!v1)
    return 0;
  v2 = v1;
  Value = (const __CFString *)CFDictionaryGetValue(v1, CFSTR("Physical Interconnect"));
  if (Value)
    v4 = CFStringCompare(Value, CFSTR("Virtual Interface"), 0) == kCFCompareEqualTo;
  else
    v4 = 0;
  CFRelease(v2);
  return v4;
}

id get_mounted_media_entries()
{
  int v0;
  int v1;
  unint64_t v2;
  unint64_t v3;
  statfs *v4;
  int v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  int v10;
  __int128 v11;
  int v12;
  char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  uint32_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  id v32;
  __CFString *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  NSObject *v38;
  int v39;
  __int128 v41;
  id v42;
  statfs *v43;
  uint64_t v44;
  _QWORD v45[4];
  id v46;
  id v47;
  uint8_t *v48;
  uint64_t v49;
  char *v50;
  uint8_t v51[4];
  uint64_t v52;
  uint8_t v53[4];
  const __CFString *f_mntonname;
  uint8_t buf[8];
  __int128 v56;
  char v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v49 = 0;
  v50 = 0;
  v42 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (v42)
  {
    v0 = getfsstat(0, 0, 2);
    if (v0 < 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v7 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v7;
        _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to get mount information: %{errno}d", buf, 8u);
      }
      v43 = 0;
    }
    else
    {
      v1 = v0;
      v2 = 0;
      v43 = 0;
      do
      {
        v3 = 2168 * v1;
        if (v2 > v3)
        {
          if (v43)
            goto LABEL_22;
          goto LABEL_21;
        }
        if (v43)
          free(v43);
        v2 = v3 + 2168;
        v4 = (statfs *)malloc_type_malloc(v3 + 2168, 0x809D8011uLL);
        if (!v4)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            v8 = *__error();
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v8;
            _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to allocate memory: %{errno}d", buf, 8u);
          }
LABEL_21:
          v43 = 0;
          goto LABEL_22;
        }
        v43 = v4;
        v1 = getfsstat(v4, v3 + 2168, 2);
      }
      while ((v1 & 0x80000000) == 0);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v5 = *__error();
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v5;
        _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to get mount information: %{errno}d", buf, 8u);
      }
LABEL_22:
      if (v1 > 0)
      {
        v9 = (void *)MGCopyAnswer();
        v10 = objc_msgSend(v9, "BOOLValue");

        if (((v10 | os_variant_is_recovery()) & 1) == 0)
        {
          v12 = cryptex_copy_list_4MSM();
          if ((v12 & 0xFFFFFFFD) != 0)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              v13 = strerror(v12);
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = v12;
              LOWORD(v56) = 2080;
              *(_QWORD *)((char *)&v56 + 2) = v13;
              _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to copy cryptex list (%d (%s)), non-fatal.", buf, 0x12u);
            }
            v49 = 0;
          }
        }
        v14 = 0;
        v15 = 0;
        v16 = v1;
        *(_QWORD *)&v11 = 136315138;
        v41 = v11;
        while (1)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&v56 = buf;
          *((_QWORD *)&v56 + 1) = 0x2020000000;
          v57 = 0;
          create_map_entry((uint64_t)&v43[v14], v50, v49);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (!v17)
            break;
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("MountPath"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v19)
          {
            v27 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v53 = 138412290;
              f_mntonname = CFSTR("MountPath");
              v24 = v27;
              v25 = "Map entry missing value for key %@.";
              v26 = 12;
LABEL_37:
              _os_log_impl(&dword_2126BE000, v24, OS_LOG_TYPE_DEFAULT, v25, v53, v26);
            }
            goto LABEL_38;
          }
          v20 = v19;
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("DiskImageType"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("Cryptex"));

          if (v22)
          {
            *(_BYTE *)(v56 + 24) = 1;
          }
          else
          {
            v45[0] = MEMORY[0x24BDAC760];
            v45[1] = 3221225472;
            v45[2] = __get_mounted_media_entries_block_invoke;
            v45[3] = &unk_24CE025D0;
            v32 = v20;
            v46 = v32;
            v47 = v18;
            v48 = buf;
            objc_msgSend(&unk_24CE05CE8, "enumerateObjectsUsingBlock:", v45);

            if (!*(_BYTE *)(v56 + 24))
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
                get_mounted_media_entries_cold_1(v51, (uint64_t)v32, &v52);
              v28 = 0;
              v29 = 0;
              v30 = 0;
              v31 = 0;
              v44 = (uint64_t)v15;
              v20 = v32;
              goto LABEL_60;
            }
          }
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("DeviceNode"), v41);
          v44 = objc_claimAutoreleasedReturnValue();

          if (v44)
          {
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("DeviceType"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v28)
            {
              if (objc_msgSend(CFSTR("DiskImage"), "isEqualToString:", v28))
              {
                image_file_path_name((uint64_t)v43[v14].f_mntfromname);
                v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
                if (v33)
                {
                  objc_msgSend(v18, "setObject:forKeyedSubscript:", v33, CFSTR("BackingImage"));
                  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("ImageSignature"));
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v31)
                  {
                    v29 = 0;
                    v30 = v33;
LABEL_59:
                    objc_msgSend(v42, "setObject:forKeyedSubscript:", v18, v44);
                    goto LABEL_60;
                  }
                  image_file_path_name((uint64_t)v43[v14].f_mntfromname);
                  v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

                  if (v30)
                  {
                    signatureFromPath(v30);
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v29)
                    {
                      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initDataWithHexString:", v29);
                      if (v31)
                      {
                        objc_msgSend(v18, "setObject:forKeyedSubscript:", v31, CFSTR("ImageSignature"));
                      }
                      else
                      {
                        v38 = MEMORY[0x24BDACB70];
                        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v53 = 138412290;
                          f_mntonname = v30;
                          _os_log_impl(&dword_2126BE000, v38, OS_LOG_TYPE_DEFAULT, "Failed to convert signature from %@", v53, 0xCu);
                        }
                        v31 = 0;
                      }
                      goto LABEL_59;
                    }
                    v37 = MEMORY[0x24BDACB70];
                    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v53 = 138412290;
                      f_mntonname = v30;
                      _os_log_impl(&dword_2126BE000, v37, OS_LOG_TYPE_DEFAULT, "Failed to recover signature from %@", v53, 0xCu);
                    }
                    v31 = 0;
                    goto LABEL_58;
                  }
                  v36 = MEMORY[0x24BDACB70];
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                  {
LABEL_56:
                    *(_DWORD *)v53 = v41;
                    f_mntonname = (const __CFString *)v43[v14].f_mntonname;
                    _os_log_impl(&dword_2126BE000, v36, OS_LOG_TYPE_DEFAULT, "Failed to get backing image path for %s", v53, 0xCu);
                  }
                }
                else
                {
                  v36 = MEMORY[0x24BDACB70];
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                    goto LABEL_56;
                }
              }
              v31 = 0;
              v30 = 0;
LABEL_58:
              v29 = 0;
              goto LABEL_59;
            }
            v35 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v53 = 138412290;
              f_mntonname = CFSTR("DeviceType");
              _os_log_impl(&dword_2126BE000, v35, OS_LOG_TYPE_DEFAULT, "Map entry missing %@.", v53, 0xCu);
            }
          }
          else
          {
            v34 = MEMORY[0x24BDACB70];
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v53 = 138412290;
              f_mntonname = CFSTR("DeviceNode");
              _os_log_impl(&dword_2126BE000, v34, OS_LOG_TYPE_DEFAULT, "Map entry missing %@.", v53, 0xCu);
            }
            v44 = 0;
          }
          v28 = 0;
          v29 = 0;
          v30 = 0;
          v31 = 0;
LABEL_60:
          _Block_object_dispose(buf, 8);

          ++v14;
          v6 = (void *)v44;
          v15 = (void *)v44;
          if (!--v16)
            goto LABEL_77;
        }
        v23 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v53 = 0;
          v24 = v23;
          v25 = "Failed to create map entry.";
          v26 = 2;
          goto LABEL_37;
        }
LABEL_38:
        v28 = 0;
        v29 = 0;
        v20 = 0;
        v30 = 0;
        v31 = 0;
        v44 = (uint64_t)v15;
        goto LABEL_60;
      }
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v39 = *__error();
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v39;
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to get mount information: %{errno}d", buf, 8u);
    }
    v6 = 0;
LABEL_77:
    if (v43)
      free(v43);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
    }
    v6 = 0;
  }
  if (v50)
    cryptex_msm_array_destroy();

  return v42;
}

void sub_2126C0EC8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

id create_map_entry(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v3;
  char *v4;
  NSObject *v6;
  const char *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  io_service_t MatchingService;
  uint64_t string;
  const char *v28;
  size_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  const char *v37;
  void *v38;
  const __CFString *v39;
  __CFString **v40;
  __CFString **v41;
  uint64_t v42;
  __CFBundle *Unique;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  io_object_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  char *__s2;
  int __s2a;
  const __CFDictionary *matching;
  CFDictionaryRef matchinga;
  mach_port_t mainPort;
  mach_port_t mainPorta;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  if (!a1 || (v3 = a3, (v4 = a2) == 0) && a3)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      v4 = 0;
      v12 = 0;
      v13 = 0;
      v14 = 0;
      v15 = 0;
LABEL_8:
      v16 = 0;
      goto LABEL_9;
    }
    *(_WORD *)buf = 0;
    v6 = MEMORY[0x24BDACB70];
    v7 = "Invalid intput.";
LABEL_6:
    _os_log_impl(&dword_2126BE000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    goto LABEL_7;
  }
  v18 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", a1 + 1112, 4);
  if (!v18)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v6 = MEMORY[0x24BDACB70];
    v7 = "Failed to create string.";
    goto LABEL_6;
  }
  v15 = (void *)v18;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", a1 + 88, 4);
  if (!v19)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to create string.", buf, 2u);
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v4 = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    goto LABEL_8;
  }
  v14 = objc_retainAutorelease(v19);
  v20 = objc_msgSend(v14, "UTF8String");
  if (!v20)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v36 = MEMORY[0x24BDACB70];
      v37 = "Failed to get C string.";
LABEL_51:
      _os_log_impl(&dword_2126BE000, v36, OS_LOG_TYPE_DEFAULT, v37, buf, 2u);
    }
LABEL_52:
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v4 = 0;
    v12 = 0;
    v13 = 0;
    goto LABEL_8;
  }
  v21 = (char *)v20;
  v22 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:encoding:", a1 + 72, 4);
  if (!v22)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v36 = MEMORY[0x24BDACB70];
      v37 = "Failed to create string.";
      goto LABEL_51;
    }
    goto LABEL_52;
  }
  v13 = (void *)v22;
  v23 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (!v23)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v4 = 0;
    v12 = 0;
    goto LABEL_8;
  }
  v16 = v23;
  __s2 = v21;
  objc_msgSend(v23, "setObject:forKeyedSubscript:", CFSTR("MassStorage"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("DeviceNode"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, CFSTR("MountPath"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, CFSTR("FilesystemType"));
  objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("IsMounted"));
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v15);
  if (!v24)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v60 = v15;
      v61 = 2080;
      v62 = (id)(a1 + 88);
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to create URL (%@ / %s).", buf, 0x16u);
    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    goto LABEL_62;
  }
  v11 = v24;
  mainPort = *MEMORY[0x24BDD8B20];
  objc_msgSend(v24, "lastPathComponent");
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  matching = IOBSDNameMatching(mainPort, 0, (const char *)objc_msgSend(v25, "UTF8String"));

  if (!matching)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v11, "lastPathComponent");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v60 = v38;
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to create a BSD matching dictionary for %@.", buf, 0xCu);

    }
    v8 = 0;
    v9 = 0;
    v10 = 0;
LABEL_62:
    v4 = 0;
    v12 = 0;
    goto LABEL_9;
  }
  MatchingService = IOServiceGetMatchingService(mainPort, matching);
  mainPorta = MatchingService;
  if (!MatchingService || !is_disk_image(MatchingService))
    goto LABEL_99;
  objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("DiskImage"), CFSTR("DeviceType"));
  if (!strcmp("/Developer", __s2))
  {
    v39 = CFSTR("Developer");
    v40 = kMSMDiskImageTypeKey;
LABEL_98:
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v39, *v40);
    goto LABEL_99;
  }
  if (__s2 == strnstr(__s2, "/private/var/personalized_automation", 0x24uLL))
  {
    objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
    v41 = kMSMDiskImageTypePersonalizedAutomation;
LABEL_97:
    v39 = *v41;
    v40 = kMSMDiskImagePersonalizedImageType;
    goto LABEL_98;
  }
  if (__s2 == strnstr(__s2, "/private/var/personalized_demo", 0x1EuLL))
  {
    objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
    v41 = kMSMDiskImageTypePersonalizedDemo;
    goto LABEL_97;
  }
  if (__s2 == strnstr(__s2, "/private/var/personalized_debug", 0x1FuLL))
  {
    objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
    v41 = kMSMDiskImageTypePersonalizedDebug;
    goto LABEL_97;
  }
  if (__s2 != strnstr(__s2, "/System/Developer", 0x11uLL))
  {
    if (__s2 == strnstr(__s2, "/private/var/personalized_factory", 0x21uLL))
    {
      objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
      v41 = kMSMDiskImageTypePersonalizedFactory;
    }
    else if (__s2 == strnstr(__s2, "/System/Volumes/FieldService", 0x1CuLL))
    {
      objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
      v41 = kMSMDiskImageTypePersonalizedFieldService;
    }
    else if (__s2 == strnstr(__s2, "/System/Volumes/FieldServiceDiagnostic", 0x26uLL))
    {
      objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
      v41 = kMSMDiskImageTypePersonalizedFieldServiceDiagnostic;
    }
    else if (__s2 == strnstr(__s2, "/System/Volumes/FieldServiceRepair", 0x22uLL))
    {
      objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
      v41 = kMSMDiskImageTypePersonalizedFieldServiceRepair;
    }
    else if (__s2 == strnstr(__s2, "/private/var/personalized_quality", 0x21uLL))
    {
      objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
      v41 = kMSMDiskImageTypePersonalizedQuality;
    }
    else
    {
      if (__s2 != strnstr(__s2, "/private/var/personalized_repair", 0x20uLL))
      {
        if (!v4)
        {
          matchinga = 0;
          v9 = 0;
          v10 = 0;
          goto LABEL_100;
        }
        objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("Cryptex"), CFSTR("DiskImageType"));
        if (v3)
        {
          while (1)
          {
            string = cryptex_msm_get_string();
            if (string)
            {
              v28 = (const char *)string;
              v29 = strlen((const char *)(a1 + 1112));
              if (strnstr(v28, (const char *)(a1 + 1112), v29))
              {
                v30 = cryptex_msm_get_string();
                if (v30)
                {
                  v31 = v30;
                  v32 = cryptex_msm_get_string();
                  if (v32)
                    break;
                }
              }
            }
            v4 += 8;
            if (!--v3)
              goto LABEL_37;
          }
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v32);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v51, CFSTR("CryptexName"));

          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v31);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v52, CFSTR("CryptexVersion"));

        }
LABEL_37:
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("CryptexName"));
        v33 = objc_claimAutoreleasedReturnValue();
        if (!v33
          || (v34 = (void *)v33,
              objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("CryptexVersion")),
              v35 = (void *)objc_claimAutoreleasedReturnValue(),
              v35,
              v34,
              !v35))
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            v60 = v15;
            v61 = 2112;
            v62 = v14;
            _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Mount (%@ / %@) is not a cryptex or personalized image (not fatal).", buf, 0x16u);
          }
          v8 = 0;
          matchinga = 0;
          v9 = 0;
          v10 = 0;
          v4 = 0;
          v12 = 0;
LABEL_108:
          v48 = mainPorta;
          if (!mainPorta)
            goto LABEL_110;
          goto LABEL_109;
        }
LABEL_99:
        matchinga = 0;
        v9 = 0;
        v10 = 0;
        v4 = 0;
LABEL_100:
        v12 = 0;
        goto LABEL_101;
      }
      objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
      v41 = kMSMDiskImageTypePersonalizedRepair;
    }
    goto LABEL_97;
  }
  objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("Library/Frameworks/DTRemoteServices.framework"));
  v42 = objc_claimAutoreleasedReturnValue();
  if (!v42)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to create path.", buf, 2u);
    }
    v12 = 0;
    v4 = 0;
    goto LABEL_86;
  }
  v4 = (char *)v42;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v42, 0);
  Unique = (__CFBundle *)_CFBundleCreateUnique();
  if (!Unique)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to query bundle for DTRemoteServices.framework.", buf, 2u);
    }
    v12 = 0;
LABEL_86:
    v10 = 0;
    v9 = 0;
    matchinga = 0;
    goto LABEL_95;
  }
  v44 = (void *)*MEMORY[0x24BDBD2A0];
  matchinga = Unique;
  CFBundleGetValueForInfoDictionaryKey(Unique, (CFStringRef)*MEMORY[0x24BDBD2A0]);
  v45 = objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    v12 = (void *)v45;
    objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("version.plist"));
    v46 = objc_claimAutoreleasedReturnValue();
    if (v46)
    {
      v9 = (void *)v46;
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      __s2a = objc_msgSend(v47, "fileExistsAtPath:", v9);

      if (__s2a)
      {
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v9);
        if (v10)
        {
LABEL_76:
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v12, CFSTR("PersonalizedImageVersion"));
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v10, CFSTR("PersonalizedImageVersionInfo"));
          objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("Personalized"), CFSTR("DiskImageType"));
          objc_msgSend(v16, "setObject:forKeyedSubscript:", CFSTR("DeveloperDiskImage"), CFSTR("PersonalizedImageType"));
LABEL_101:
          if ((*(_DWORD *)(a1 + 64) & 1) != 0)
            v49 = MEMORY[0x24BDBD1C8];
          else
            v49 = MEMORY[0x24BDBD1C0];
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v49, CFSTR("IsReadOnly"));
          if ((*(_DWORD *)(a1 + 64) & 0x80) != 0)
            v50 = MEMORY[0x24BDBD1C8];
          else
            v50 = MEMORY[0x24BDBD1C0];
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v50, CFSTR("SupportsContentProtection"));
          v8 = v16;
          goto LABEL_108;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
          create_map_entry_cold_1((uint64_t)v9, (uint64_t)v12);
      }
      v10 = 0;
      goto LABEL_76;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to create path.", buf, 2u);
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v60 = v44;
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to query bundle key %@.", buf, 0xCu);
    }
    v12 = 0;
  }
  v10 = 0;
  v9 = 0;
LABEL_95:
  v8 = 0;
  v48 = mainPorta;
LABEL_109:
  IOObjectRelease(v48);
LABEL_110:
  if (matchinga)
    CFRelease(matchinga);
LABEL_9:

  return v8;
}

void __get_mounted_media_entries_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", a2) & 1) != 0
    || (objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("DiskImageType")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Cryptex")),
        v6,
        v7))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
}

id image_file_path_name(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = MEMORY[0x24BDACB70];
      v7 = "Invalid input.";
LABEL_9:
      _os_log_impl(&dword_2126BE000, v6, OS_LOG_TYPE_DEFAULT, v7, buf, 2u);
    }
LABEL_10:
    v5 = 0;
    v2 = 0;
    v4 = 0;
LABEL_11:
    v3 = 0;
    goto LABEL_12;
  }
  v1 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a1);
  if (!v1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = MEMORY[0x24BDACB70];
      v7 = "Failed to create string.";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v2 = (void *)v1;
  v9 = 0;
  objc_msgSend(MEMORY[0x24BE2D0D8], "imageURLFromDevice:error:", v1, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (!v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to retrieve image URL: %@", buf, 0xCu);
    }
    v5 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v5;
}

id signatureFromPath(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "pathComponents");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v1, "count") >= 4)
  {
    v3 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v1, "objectAtIndexedSubscript:", objc_msgSend(v1, "count") - 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectAtIndexedSubscript:", objc_msgSend(v1, "count") - 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@%@"), v4, v5);

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id get_attached_ptp_entries()
{
  id v0;
  CFMutableDictionaryRef v1;
  CFMutableDictionaryRef v2;
  void *v3;
  void *v4;
  io_object_t v6;
  io_object_t v7;
  NSObject *v8;
  kern_return_t v9;
  __int16 v10;
  void *Value;
  id v12;
  io_iterator_t existing;
  CFMutableDictionaryRef properties;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  properties = 0;
  existing = 0;
  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (v0)
  {
    v1 = IOServiceMatching("IOUSBInterface");
    if (v1
      && (v2 = v1,
          -[__CFDictionary setObject:forKeyedSubscript:](v1, "setObject:forKeyedSubscript:", &unk_24CE05D00, CFSTR("bInterfaceClass")), -[__CFDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &unk_24CE05D18, CFSTR("bInterfaceSubClass")), -[__CFDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", &unk_24CE05D18, CFSTR("bInterfaceProtocol")), !IOServiceGetMatchingServices(*MEMORY[0x24BDD8B20], v2, &existing))&& (v6 = IOIteratorNext(existing)) != 0)
    {
      v7 = v6;
      v4 = 0;
      v3 = 0;
      v8 = MEMORY[0x24BDACB70];
      do
      {
        v9 = IORegistryEntryCreateCFProperties(v7, &properties, 0, 0);
        if (v9)
        {
          v10 = v9;
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v16) = v10 & 0x3FFF;
            _os_log_impl(&dword_2126BE000, v8, OS_LOG_TYPE_DEFAULT, "IORegistryEntryCreateCFProperties failed: 0x%04x", buf, 8u);
          }
        }
        else
        {
          Value = (void *)CFDictionaryGetValue(properties, CFSTR("locationID"));

          if (Value)
          {
            v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);

            if (v12)
            {
              objc_msgSend(v12, "setObject:forKeyedSubscript:", Value, CFSTR("LocationID"));
              objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("PTPCamera"), CFSTR("DeviceType"));
              objc_msgSend(v0, "setObject:forKeyedSubscript:", v12, CFSTR("PTPNode"));
              v3 = v12;
            }
            else
            {
              if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_2126BE000, v8, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
              }
              v3 = 0;
            }
            v4 = Value;
          }
          else
          {
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v16 = "locationID";
              _os_log_impl(&dword_2126BE000, v8, OS_LOG_TYPE_DEFAULT, "Failed to retrieve %s.", buf, 0xCu);
            }
            v4 = 0;
          }
        }
        if (properties)
          CFRelease(properties);
        properties = 0;
        IOObjectRelease(v7);
        v7 = IOIteratorNext(existing);
      }
      while (v7);
    }
    else
    {
      v3 = 0;
      v4 = 0;
    }
    if (existing)
      IOObjectRelease(existing);
  }
  else
  {
    v4 = 0;
    v3 = 0;
  }

  return v0;
}

id get_attached_media_entries()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  kern_return_t MatchingServices;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  io_object_t v12;
  io_object_t v13;
  NSObject *v14;
  kern_return_t v15;
  __int16 v16;
  NSObject *v17;
  const char *v18;
  uint32_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  char v35;
  int v36;
  id v37;
  void *v38;
  void *v40;
  char v41;
  void *v42;
  void *v43;
  uint8_t v44;
  _BYTE v45[15];
  uint8_t v46;
  _BYTE v47[3];
  io_iterator_t existing;
  CFMutableDictionaryRef properties;
  uint8_t v50[4];
  uint64_t v51;
  uint8_t v52[4];
  uint64_t v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  const char *v57;
  _BYTE v58[2168];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  properties = 0;
  existing = 0;
  bzero(v58, 0x878uLL);
  v0 = *MEMORY[0x24BDD8B20];
  v1 = IOServiceMatching("IOMedia");
  MatchingServices = IOServiceGetMatchingServices(v0, v1, &existing);
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  if (!MatchingServices)
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    if (v11)
    {
      v3 = v11;
      v12 = IOIteratorNext(existing);
      if (v12)
      {
        v13 = v12;
        v42 = v3;
        v43 = 0;
        v10 = 0;
        v9 = 0;
        v8 = 0;
        v7 = 0;
        v6 = 0;
        v5 = 0;
        v14 = MEMORY[0x24BDACB70];
        v41 = 1;
        while (1)
        {
          if (!is_disk_image(v13))
          {
            v15 = IORegistryEntryCreateCFProperties(v13, &properties, 0, 0);
            if (v15)
            {
              v16 = v15;
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109120;
                LODWORD(v55) = v16 & 0x3FFF;
                v17 = v14;
                v18 = "IORegistryEntryCreateCFProperties failed: 0x%04x";
                v19 = 8;
LABEL_9:
                _os_log_impl(&dword_2126BE000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, v19);
              }
            }
            else
            {
              if (properties)
              {
                CFDictionaryGetValue(properties, CFSTR("BSD Name"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                isNSString(v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                if (v21)
                {
                  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("/dev/%@"), v20);

                  if (v22)
                  {
                    CFDictionaryGetValue(properties, CFSTR("Content"));
                    v23 = (void *)objc_claimAutoreleasedReturnValue();

                    isNSString(v23);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v24)
                    {
                      if (objc_msgSend(CFSTR("C12A7328-F81F-11D2-BA4B-00A0C93EC93B"), "isEqualToString:", v23))
                      {
                        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
                          get_attached_media_entries_cold_1(&v46, v47, v25);
LABEL_32:
                        v5 = v22;
                        v7 = v23;
                        v8 = v20;
                        goto LABEL_33;
                      }
                      if (objc_msgSend(CFSTR("Apple_partition_map"), "isEqualToString:", v23))
                      {
                        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
                          get_attached_media_entries_cold_2(&v44, v45, v27);
                        goto LABEL_32;
                      }
                      CFDictionaryGetValue(properties, CFSTR("Removable"));
                      v28 = (void *)objc_claimAutoreleasedReturnValue();

                      isNSNumber(v28);
                      v29 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v29)
                      {
                        if ((objc_msgSend(v28, "BOOLValue") & 1) == 0
                          && (serviceIsAttachedToRemovableDevice(v13) & 1) == 0)
                        {
                          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
                            get_attached_media_entries_cold_4(v52, (uint64_t)v20, &v53);
                          v5 = v22;
                          v7 = v23;
                          v8 = v20;
LABEL_60:
                          v10 = v28;
LABEL_33:
                          v14 = MEMORY[0x24BDACB70];
                          goto LABEL_34;
                        }
                        CFDictionaryGetValue(properties, CFSTR("Leaf"));
                        v30 = (void *)objc_claimAutoreleasedReturnValue();

                        isNSNumber(v30);
                        v31 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v31)
                        {
                          if ((objc_msgSend(v30, "BOOLValue") & 1) == 0)
                          {
                            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
                              get_attached_media_entries_cold_3(v50, (uint64_t)v20, &v51);
                            v5 = v22;
                            v7 = v23;
                            v8 = v20;
                            v9 = v30;
                            goto LABEL_60;
                          }
                          v40 = v30;
                          CFDictionaryGetValue(properties, CFSTR("Writable"));
                          v32 = (void *)objc_claimAutoreleasedReturnValue();

                          isNSNumber(v32);
                          v33 = objc_claimAutoreleasedReturnValue();
                          if (v33)
                          {
                            v34 = (void *)v33;
                            v35 = objc_msgSend(v32, "BOOLValue");

                            v41 &= v35 ^ 1;
                          }
                          v36 = determine_filesystem_type();
                          if (v36 == 4 || (v36 & 3) == 1)
                          {
                            v5 = objc_retainAutorelease(v22);
                            objc_msgSend(v5, "UTF8String");
                            if ((unint64_t)__strlcpy_chk() >= 0x400)
                            {
                              v10 = v28;
                              v14 = MEMORY[0x24BDACB70];
                              if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                                goto LABEL_73;
LABEL_72:
                              *(_WORD *)buf = 0;
                              _os_log_impl(&dword_2126BE000, v14, OS_LOG_TYPE_DEFAULT, "Invalid string size.", buf, 2u);
                              goto LABEL_73;
                            }
                            v5 = objc_retainAutorelease(v5);
                            objc_msgSend(v5, "UTF8String");
                            if ((unint64_t)__strlcpy_chk() >= 0x400)
                            {
                              v10 = v28;
                              v14 = MEMORY[0x24BDACB70];
                              if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                                goto LABEL_73;
                              goto LABEL_72;
                            }
                            if ((unint64_t)__strlcpy_chk() >= 0x10)
                            {
                              v10 = v28;
                              v14 = MEMORY[0x24BDACB70];
                              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                                goto LABEL_72;
LABEL_73:
                              v6 = v32;
                              v7 = v23;
                              v8 = v20;
                              v9 = v40;
                              goto LABEL_34;
                            }
                            create_map_entry((uint64_t)v58, 0, 0);
                            v37 = (id)objc_claimAutoreleasedReturnValue();

                            if (!v37)
                            {
                              v10 = v28;
                              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                              {
                                *(_DWORD *)buf = 138412290;
                                v55 = (const char *)v5;
                                v14 = MEMORY[0x24BDACB70];
                                _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to create map entry for %@.", buf, 0xCu);
                                v43 = 0;
                                goto LABEL_73;
                              }
                              v43 = 0;
                              v6 = v32;
                              v7 = v23;
                              v8 = v20;
                              v9 = v40;
                              goto LABEL_33;
                            }
                          }
                          else
                          {
                            v37 = objc_alloc_init(MEMORY[0x24BDBCED8]);

                            if (!v37)
                            {
                              v10 = v28;
                              v14 = MEMORY[0x24BDACB70];
                              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                              {
                                *(_WORD *)buf = 0;
                                _os_log_impl(&dword_2126BE000, v14, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
                              }
                              v43 = 0;
                              v5 = v22;
                              goto LABEL_73;
                            }
                            objc_msgSend(v37, "setObject:forKeyedSubscript:", CFSTR("MassStorage"), CFSTR("DeviceType"));
                            objc_msgSend(v37, "setObject:forKeyedSubscript:", v22, CFSTR("DeviceNode"));
                            objc_msgSend(v37, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("IsMounted"));
                            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v41 & 1);
                            v38 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v37, "setObject:forKeyedSubscript:", v38, CFSTR("IsReadOnly"));

                          }
                          objc_msgSend(v42, "setObject:forKeyedSubscript:", v37, v22);
                          v43 = v37;
                          v5 = v22;
                          v6 = v32;
                          v7 = v23;
                          v8 = v20;
                          v9 = v30;
                          goto LABEL_60;
                        }
                        v9 = v30;
                        v10 = v28;
                        v14 = MEMORY[0x24BDACB70];
                        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          v55 = (const char *)v20;
                          v56 = 2080;
                          v57 = "Leaf";
                          v26 = v14;
LABEL_26:
                          _os_log_impl(&dword_2126BE000, v26, OS_LOG_TYPE_DEFAULT, "The attached media object %@ does not have a '%s' flag.", buf, 0x16u);
                        }
                      }
                      else
                      {
                        v10 = v28;
                        v14 = MEMORY[0x24BDACB70];
                        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412546;
                          v55 = (const char *)v20;
                          v56 = 2080;
                          v57 = "Removable";
                          v26 = v14;
                          goto LABEL_26;
                        }
                      }
                    }
                    else
                    {
                      v14 = MEMORY[0x24BDACB70];
                      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)buf = 138412546;
                        v55 = (const char *)v20;
                        v56 = 2080;
                        v57 = "Content";
                        v26 = v14;
                        goto LABEL_26;
                      }
                    }
                    v5 = v22;
                    v7 = v23;
                  }
                  else
                  {
                    v14 = MEMORY[0x24BDACB70];
                    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_2126BE000, v14, OS_LOG_TYPE_DEFAULT, "Failed to create string.", buf, 2u);
                    }
                    v5 = 0;
                  }
                }
                else
                {
                  v14 = MEMORY[0x24BDACB70];
                  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    v55 = "BSD Name";
                    _os_log_impl(&dword_2126BE000, v14, OS_LOG_TYPE_DEFAULT, "Failed to retrieve %s.", buf, 0xCu);
                  }
                }
                v8 = v20;
                goto LABEL_34;
              }
              if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                v17 = v14;
                v18 = "Failed to retrieve any properties for the matched service.";
                v19 = 2;
                goto LABEL_9;
              }
            }
          }
LABEL_34:
          IOObjectRelease(v13);
          if (properties)
            CFRelease(properties);
          properties = 0;
          v13 = IOIteratorNext(existing);
          if (!v13)
          {
            v3 = v42;
            v4 = v43;
            goto LABEL_82;
          }
        }
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
      }
      v3 = 0;
    }
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
  }
LABEL_82:
  if (existing)
    IOObjectRelease(existing);

  return v3;
}

uint64_t serviceIsAttachedToRemovableDevice(io_object_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  kern_return_t ParentEntry;
  _QWORD v8[2];
  void (*v9)(void);
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  io_registry_entry_t parent;
  char v17;
  uint8_t buf[4];
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v9 = (void (*)(void))__serviceIsAttachedToRemovableDevice_block_invoke;
  v10 = &unk_24CE025F8;
  v11 = &v12;
  v2 = v8;
  v17 = 0;
  v9();
  if (!v17)
  {
    IOObjectRetain(a1);
    if (!v17)
    {
      while (1)
      {
        parent = 0;
        ParentEntry = IORegistryEntryGetParentEntry(a1, "IOService", &parent);
        IOObjectRelease(a1);
        if (ParentEntry != -536870208 && ParentEntry != 0)
          break;
        a1 = parent;
        if (!parent)
          goto LABEL_3;
        ((void (*)(_QWORD *, _QWORD, char *))v9)(v2, parent, &v17);
        if (v17)
        {
          IOObjectRelease(a1);
          goto LABEL_3;
        }
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v19 = ParentEntry & 0x3FFF;
        _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "IORegistryEntryGetParentEntry failed: 0x%04x", buf, 8u);
      }
    }
  }
LABEL_3:

  v3 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v3;
}

void sub_2126C2E60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14)
{
  _Unwind_Resume(exception_object);
}

id get_attached_entries()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (v0)
  {
    get_attached_ptp_entries();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (v1)
      objc_msgSend(v0, "addEntriesFromDictionary:", v1);
    get_attached_media_entries();
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
      objc_msgSend(v0, "addEntriesFromDictionary:", v2);
    get_mounted_media_entries();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(v0, "addEntriesFromDictionary:", v3);

    }
  }
  return v0;
}

id lookup_mass_storage_entry(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  lookup_map_entries(CFSTR("MassStorage"), CFSTR("DeviceNode"), a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1
    && objc_msgSend(v1, "count")
    && (objc_msgSend(v2, "objectAtIndex:", 0),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        isNSDictionary(v3),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        v4))
  {
    objc_msgSend(v2, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id lookup_map_entries(void *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  _BOOL8 v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  const __CFString *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v30 = a2;
  v29 = a3;
  if (!v5 || !v30 || !v29)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Invalid input(s).", buf, 2u);
    }
    goto LABEL_26;
  }
  get_attached_entries();
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v23 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v23)
      lookup_map_entries_cold_1(v23, v24, v25);
LABEL_26:
    v28 = 0;
    v26 = 0;
    v10 = 0;
    v7 = 0;
    goto LABEL_32;
  }
  v7 = (id)v6;
  v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (v28)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v7 = v7;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v8)
    {
      v9 = v8;
      v32 = 0;
      v10 = 0;
      v11 = *(_QWORD *)v34;
      v12 = MEMORY[0x24BDACB70];
      do
      {
        v13 = 0;
        v31 = v9;
        do
        {
          v14 = v10;
          if (*(_QWORD *)v34 != v11)
            objc_enumerationMutation(v7);
          objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v13));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("DeviceType"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            if (objc_msgSend(v10, "isEqual:", v5))
            {
              v16 = v11;
              v17 = v7;
              v18 = v5;
              objc_msgSend(v15, "objectForKeyedSubscript:", v30);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              isNSString(v19);
              v20 = objc_claimAutoreleasedReturnValue();
              if (v20)
              {
                v21 = (void *)v20;
                v22 = objc_msgSend(v19, "isEqual:", v29);

                if (v22)
                  objc_msgSend(v28, "addObject:", v15);
              }
              v32 = v19;
              v5 = v18;
              v7 = v17;
              v11 = v16;
              v9 = v31;
            }
          }
          else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v38 = CFSTR("DeviceType");
            _os_log_impl(&dword_2126BE000, v12, OS_LOG_TYPE_DEFAULT, "Invalid value for %@.", buf, 0xCu);
          }

          ++v13;
        }
        while (v9 != v13);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v9);
    }
    else
    {
      v32 = 0;
      v10 = 0;
    }

    v26 = v32;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to create array.", buf, 2u);
    }
    v28 = 0;
    v26 = 0;
    v10 = 0;
  }
LABEL_32:

  return v28;
}

id lookup_disk_image_entries(void *a1)
{
  return lookup_map_entries(CFSTR("DiskImage"), CFSTR("DiskImageType"), a1);
}

id lookup_mount_entry(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  get_attached_entries();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v5)
    {
      v6 = v5;
      v20 = v3;
      v7 = 0;
      v8 = *(_QWORD *)v22;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        isNSDictionary(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("MountPath"));
          v12 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v12;
        }
        isNSString(v7);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          v15 = objc_msgSend(v7, "isEqualToString:", v1);

          if ((v15 & 1) != 0)
            break;
        }

        if (v6 == ++v9)
        {
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v6)
            goto LABEL_4;
          v10 = 0;
          break;
        }
      }
      v3 = v20;
    }
    else
    {
      v7 = 0;
      v10 = 0;
    }

  }
  else
  {
    v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (v16)
      lookup_map_entries_cold_1(v16, v17, v18);
    v7 = 0;
    v10 = 0;
  }

  return v10;
}

void __serviceIsAttachedToRemovableDevice_block_invoke(uint64_t a1, io_registry_entry_t entry, _BYTE *a3)
{
  CFTypeRef CFProperty;
  const void *v6;

  CFProperty = IORegistryEntryCreateCFProperty(entry, CFSTR("removable"), 0, 0);
  if (CFProperty)
  {
    v6 = CFProperty;
    if (CFEqual(CFProperty, (CFTypeRef)*MEMORY[0x24BDBD270]))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
      *a3 = 1;
    }
    CFRelease(v6);
  }
}

id makePathWithSignature(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint32_t v12;
  id v13;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initHexStringWithData:", v3);
  v6 = v5;
  if (!v5)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:
      v8 = 0;
      v7 = 0;
      v9 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v10 = MEMORY[0x24BDACB70];
    v11 = "Failed to create hex string with data.";
    v12 = 2;
LABEL_8:
    _os_log_impl(&dword_2126BE000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, v12);
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "length") != 256 && objc_msgSend(v6, "length") != 96 && objc_msgSend(v6, "length") != 40)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    *(_DWORD *)buf = 67109378;
    v16 = objc_msgSend(v6, "length");
    v17 = 2112;
    v18 = v3;
    v10 = MEMORY[0x24BDACB70];
    v11 = "Unsupported signature length: %d characters (%@)";
    v12 = 18;
    goto LABEL_8;
  }
  objc_msgSend(v6, "substringToIndex:", (unint64_t)objc_msgSend(v6, "length") >> 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "substringFromIndex:", (unint64_t)objc_msgSend(v6, "length") >> 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@/%@/%@"), v4, v7, v8);
LABEL_10:
  v13 = v9;

  return v13;
}

uint64_t path_is_bad(const char *a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  int v12;
  uint64_t result;
  _QWORD v14[2];
  uint64_t (*v15)(uint64_t);
  void *v16;
  _BYTE *v17;
  const char *v18;
  char __s1[1024];
  _BYTE buf[24];
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  bzero(__s1, 0x400uLL);
  if (strlen(a1) > 0x400)
    goto LABEL_18;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v21 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v15 = __path_contains_links_block_invoke;
  v16 = &unk_24CE02660;
  v17 = buf;
  v18 = a1;
  v2 = v14;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFileSystemRepresentation:length:", a1, strlen(a1));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pathComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (v6)
  {
    v7 = objc_msgSend(v6, "count");
    if (v7)
    {
      do
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          v10 = objc_retainAutorelease(v8);
          v11 = objc_msgSend(v10, "fileSystemRepresentation");
          if (!((unsigned int (*)(_QWORD *, uint64_t))v15)(v2, v11))
          {

            break;
          }
          objc_msgSend(v6, "removeLastObject");
        }

      }
      while (--v7);
    }
  }

  v12 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  if (v12 || !realpath_DARWIN_EXTSN(a1, __s1) || (result = strcmp(__s1, a1), (_DWORD)result))
  {
LABEL_18:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = __s1;
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Paths don't match: (%s/%s)", buf, 0x16u);
    }
    return 1;
  }
  return result;
}

void sub_2126C3A00(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t remove_item_at_path(const char *a1, removefile_flags_t a2)
{
  _removefile_state *v4;
  _removefile_state *v5;
  int v6;
  int *v7;
  char *v8;
  int v9;
  int *v10;
  char *v11;
  uint64_t v12;
  int v13;
  int *v14;
  char *v15;
  int value;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  value = 0;
  v4 = removefile_state_alloc();
  if (v4)
  {
    v5 = v4;
    if (removefile_state_set(v4, 3u, removefile_error_callback)
      && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *__error();
      v7 = __error();
      v8 = strerror(*v7);
      *(_DWORD *)buf = 67109378;
      v19 = v6;
      v20 = 2080;
      v21 = v8;
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "removefile_state_set failed: %d (%s)", buf, 0x12u);
    }
    if (removefile_state_set(v5, 4u, &value) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v9 = *__error();
      v10 = __error();
      v11 = strerror(*v10);
      *(_DWORD *)buf = 67109378;
      v19 = v9;
      v20 = 2080;
      v21 = v11;
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "removefile_state_set failed: %d (%s)", buf, 0x12u);
    }
    if (removefile(a1, v5, a2))
    {
      v12 = 0;
      if (*__error() != 2 || value)
        goto LABEL_17;
    }
    else if (value)
    {
      v12 = 0;
LABEL_17:
      removefile_state_free(v5);
      return v12;
    }
    v12 = 1;
    goto LABEL_17;
  }
  v12 = 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v13 = *__error();
    v14 = __error();
    v15 = strerror(*v14);
    *(_DWORD *)buf = 67109378;
    v19 = v13;
    v20 = 2080;
    v21 = v15;
    _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "removefile_state_alloc failed: %d (%s)", buf, 0x12u);
    return 0;
  }
  return v12;
}

uint64_t removefile_error_callback(_removefile_state *a1, const char *a2, int *a3)
{
  int v5;
  int v6;
  int *v7;
  char *v8;
  NSObject *v9;
  const char *v10;
  int v11;
  int *v12;
  char *v13;
  int v14;
  int *v15;
  char *v16;
  stat v18;
  int dst;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  dst = 0;
  memset(&v18, 0, sizeof(v18));
  if (removefile_state_get(a1, 5u, &dst))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v5 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v21) = v5;
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "removefile_state_get failed: %{errno}d", buf, 8u);
    }
    dst = 2;
    goto LABEL_17;
  }
  if (dst == 1)
  {
    if (lstat(a2, &v18))
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v6 = *__error();
        v7 = __error();
        v8 = strerror(*v7);
        *(_DWORD *)buf = 136315650;
        v21 = a2;
        v22 = 1024;
        v23 = v6;
        v24 = 2080;
        v25 = v8;
        v9 = MEMORY[0x24BDACB70];
        v10 = "lstat failed for %s: %d (%s)";
LABEL_9:
        _os_log_impl(&dword_2126BE000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0x1Cu);
      }
    }
    else
    {
      if ((v18.st_flags & 2) == 0)
        goto LABEL_17;
      if (lchflags(a2, v18.st_flags & 0xFFFFFFFD))
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_17;
        v11 = *__error();
        v12 = __error();
        v13 = strerror(*v12);
        *(_DWORD *)buf = 136315650;
        v21 = a2;
        v22 = 1024;
        v23 = v11;
        v24 = 2080;
        v25 = v13;
        v9 = MEMORY[0x24BDACB70];
        v10 = "lchflags failed for %s: %d (%s)";
        goto LABEL_9;
      }
      if (!unlink(a2))
        return 0;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v14 = *__error();
        v15 = __error();
        v16 = strerror(*v15);
        *(_DWORD *)buf = 136315650;
        v21 = a2;
        v22 = 1024;
        v23 = v14;
        v24 = 2080;
        v25 = v16;
        v9 = MEMORY[0x24BDACB70];
        v10 = "Failed to unlink %s: %d (%s)";
        goto LABEL_9;
      }
    }
  }
LABEL_17:
  if (a3 && !*a3)
    *a3 = dst;
  return 0;
}

id copyGroupContainerPath(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint32_t v9;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = v1;
  if (!v1)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = MEMORY[0x24BDACB70];
      v8 = "Invalid input.";
      v9 = 2;
LABEL_8:
      _os_log_impl(&dword_2126BE000, v7, OS_LOG_TYPE_DEFAULT, v8, buf, v9);
    }
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  v3 = objc_retainAutorelease(v1);
  objc_msgSend(v3, "UTF8String");
  v4 = container_system_group_path_for_identifier();
  if (!v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = v3;
      v13 = 1024;
      v14 = 1;
      v7 = MEMORY[0x24BDACB70];
      v8 = "Failed to copy system group container (%@): %d";
      v9 = 18;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  v5 = (void *)v4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v4);
  free(v5);
LABEL_10:

  return v6;
}

id copyWorkingDirectory()
{
  if (copyWorkingDirectory_onceToken != -1)
    dispatch_once(&copyWorkingDirectory_onceToken, &__block_literal_global);
  return (id)copyWorkingDirectory_retval;
}

void __copyWorkingDirectory_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  copyGroupContainerPath(CFSTR("systemgroup.com.apple.mobilestorageproxy"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("backingStore"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)copyWorkingDirectory_retval;
  copyWorkingDirectory_retval = v0;

}

uint64_t mobileStorageErrorHasDomainAndErrorCode(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v5 = a1;
  v6 = a2;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    v9 = *MEMORY[0x24BDD1398];
    do
    {
      objc_msgSend(v5, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqualToString:", v7))
      {
        v11 = objc_msgSend(v5, "code");

        if (v11 == a3)
        {
          v8 = 1;
          goto LABEL_10;
        }
      }
      else
      {

      }
      objc_msgSend(v5, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", v9);
      v13 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v13;
    }
    while (v13);
    v8 = 0;
  }
LABEL_10:

  return v8;
}

id copyDeviceTreeProperty(void *a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  void *CFProperty;
  io_registry_entry_t v6;
  io_object_t v7;

  v3 = a2;
  v4 = v3;
  CFProperty = 0;
  if (a1 && v3)
  {
    v6 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B18], (const char *)objc_msgSend(objc_retainAutorelease(a1), "fileSystemRepresentation"));
    if (v6)
    {
      v7 = v6;
      CFProperty = (void *)IORegistryEntryCreateCFProperty(v6, v4, 0, 0);
      IOObjectRelease(v7);
    }
    else
    {
      CFProperty = 0;
    }
  }

  return CFProperty;
}

id copyDeviceTreeInt(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unsigned int v13;

  v5 = a3;
  v6 = v5;
  v7 = 0;
  v13 = 0;
  if (!a1)
    goto LABEL_6;
  v8 = v5;
  if (a2)
  {
    copyDeviceTreeProperty(a1, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    isNSData(v7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = objc_msgSend(v7, "length");

      if (v11 == 4)
      {
        objc_msgSend(v7, "getBytes:length:", &v13, 4);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_7;
      }
    }
LABEL_6:
    v8 = v6;
  }
LABEL_7:

  return v8;
}

uint64_t exchange_with_first_child_of_class(io_object_t *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v5;
  io_iterator_t iterator;

  v2 = 0;
  iterator = 0;
  if (a1 && a2)
  {
    if (MEMORY[0x212BEFB14](*a1, "IOService", &iterator))
    {
      v2 = 0;
    }
    else
    {
      while (1)
      {
        v5 = IOIteratorNext(iterator);
        v2 = v5;
        if (!(_DWORD)v5)
          break;
        if (IOObjectConformsTo(v5, a2))
        {
          IOObjectRelease(*a1);
          *a1 = v2;
          v2 = 1;
          break;
        }
        IOObjectRelease(v2);
      }
    }
    if (iterator)
      IOObjectRelease(iterator);
  }
  return v2;
}

uint64_t __path_contains_links_block_invoke(uint64_t a1)
{
  uint64_t result;
  _BOOL4 v3;
  uint64_t v4;
  int v5;
  int *v6;
  char *v7;
  stat v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  memset(&v8, 0, sizeof(v8));
  if (!lstat(*(const char **)(a1 + 40), &v8))
  {
    result = 1;
    if ((v8.st_mode & 0xF000) != 0xA000)
      return result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    return 0;
  }
  if (*__error() == 2)
    return 1;
  v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *__error();
    v6 = __error();
    v7 = strerror(*v6);
    *(_DWORD *)buf = 136315650;
    v10 = v4;
    v11 = 1024;
    v12 = v5;
    v13 = 2080;
    v14 = v7;
    _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "lstat failed for %s: %d (%s)", buf, 0x1Cu);
    return 0;
  }
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

id MobileStorageCopyDevices(const __CFDictionary *a1)
{
  return MobileStorageCopyDevicesWithError(a1, 0);
}

id MobileStorageCopyDevicesWithError(const __CFDictionary *a1, _QWORD *a2)
{
  void *Value;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v18;

  if (a1 && (Value = (void *)CFDictionaryGetValue(a1, CFSTR("PerformLosslessQuery"))) != 0)
  {
    v4 = Value;
    isNSNumber(Value);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      createMobileStorageError((uint64_t)"MobileStorageCopyDevicesWithError", 42, -3, 0, CFSTR("Invalid value for option %@: %@"), v6, v7, v8, (uint64_t)CFSTR("PerformLosslessQuery"));
      goto LABEL_9;
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1C0];
  }
  objc_msgSend(v4, "BOOLValue");
  get_attached_entries();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v13 = v9;
    objc_msgSend(v9, "allValues");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    goto LABEL_12;
  }
  createMobileStorageError((uint64_t)"MobileStorageCopyDevicesWithError", 53, -2, 0, CFSTR("Failed to retrieve attached device list."), v10, v11, v12, v18);
LABEL_9:
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v16;
  v14 = 0;
  if (a2 && v16)
  {
    v15 = v16;
    v14 = 0;
    *a2 = v15;
  }
LABEL_12:

  return v14;
}

CFTypeRef MobileStorageMount(const void *a1, const __CFDictionary *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return MobileStorageMountWithError(a1, a2, 0, a4, a5, a6, a7, a8);
}

CFTypeRef MobileStorageMountWithError(const void *a1, const __CFDictionary *a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFDictionary *dict;
  void *Value;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const void *v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  int v28;
  const __CFDictionary *v29;
  _BOOL4 v30;
  CFTypeRef v31;
  CFTypeRef v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const __CFDictionary *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const void *v42;
  const void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const __CFString *v49;
  void *v50;
  CFTypeRef cf;

  cf = 0;
  if (!a1 || !a2)
  {
    createMobileStorageError((uint64_t)"MobileStorageMountWithError", 96, -3, 0, CFSTR("Invalid input(s)."), a6, a7, a8, (uint64_t)v49);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    dict = 0;
LABEL_19:
    v29 = 0;
    goto LABEL_20;
  }
  dict = create_dict();
  if (!dict)
  {
    v25 = CFSTR("Failed to create dictionary.");
    v26 = 103;
LABEL_17:
    v28 = -2;
LABEL_18:
    createMobileStorageError((uint64_t)"MobileStorageMountWithError", v26, v28, 0, v25, v11, v12, v13, (uint64_t)v49);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  Value = (void *)CFDictionaryGetValue(a2, CFSTR("DiskImageType"));
  isNSString(Value);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v25 = CFSTR("Invalid value for required option %@: %@");
    v49 = CFSTR("DiskImageType");
    v26 = 109;
    goto LABEL_17;
  }
  v17 = (void *)CFDictionaryGetValue(a2, CFSTR("ImageSignature"));
  isNSData(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    v25 = CFSTR("Invalid value for required option %@: %@");
    v49 = CFSTR("ImageSignature");
    v26 = 115;
    goto LABEL_17;
  }
  v19 = (void *)CFDictionaryGetValue(a2, CFSTR("ImageTrustCache"));
  v20 = v19;
  if (v19)
  {
    isNSData(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      v25 = CFSTR("Invalid value for option %@: %@");
      v49 = CFSTR("ImageTrustCache");
      v26 = 121;
      goto LABEL_42;
    }
  }
  if (objc_msgSend(Value, "isEqualToString:", CFSTR("Cryptex")))
  {
    isNSData(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      v25 = CFSTR("Invalid value for required option %@: %@");
      v49 = CFSTR("ImageTrustCache");
      v26 = 127;
      goto LABEL_42;
    }
    v23 = (void *)CFDictionaryGetValue(a2, CFSTR("ImageInfoPlist"));
    v24 = v23;
    if (v23)
    {
      isNSData(v23);
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v50)
      {
        v25 = CFSTR("Invalid value for option %@: %@");
        v49 = CFSTR("ImageInfoPlist");
        v26 = 133;
LABEL_42:
        v28 = -3;
        goto LABEL_18;
      }
    }
  }
  else
  {
    v24 = 0;
  }
  CFDictionarySetValue(dict, CFSTR("RequestType"), CFSTR("Mount"));
  CFDictionarySetValue(dict, CFSTR("DeviceType"), CFSTR("DiskImage"));
  CFDictionarySetValue(dict, CFSTR("DiskImagePath"), a1);
  CFDictionarySetValue(dict, CFSTR("DiskImageType"), Value);
  CFDictionarySetValue(dict, CFSTR("ImageSignature"), v17);
  if (v20)
    CFDictionarySetValue(dict, CFSTR("ImageTrustCache"), v20);
  if (v24)
    CFDictionarySetValue(dict, CFSTR("ImageInfoPlist"), v24);
  v38 = (const __CFDictionary *)call_and_response("com.apple.mobile.storage_mounter.xpc", dict, (uint64_t)a2, &cf, v34, v35, v36, v37);
  v29 = v38;
  if (!v38)
  {
    createMobileStorageError((uint64_t)"MobileStorageMountWithError", 166, -2, (void *)cf, CFSTR("Failed to receive response message from server."), v39, v40, v41, (uint64_t)v49);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
    v30 = 1;
    if (!a3)
      goto LABEL_24;
LABEL_21:
    if (v30 && v27)
      *a3 = v27;
LABEL_24:
    v31 = 0;
    v32 = 0;
    if (!v29)
      goto LABEL_26;
    goto LABEL_25;
  }
  v42 = CFDictionaryGetValue(v38, CFSTR("DetailedError"));
  if (v42)
  {
    v43 = v42;
    CFStringGetTypeID();
    CFGetTypeID(v43);
  }
  v44 = (void *)CFDictionaryGetValue(v29, CFSTR("MountPath"));
  isNSString(v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45)
  {
    createMobileStorageError((uint64_t)"MobileStorageMountWithError", 179, -2, 0, CFSTR("Invalid value for %@: %@"), v46, v47, v48, (uint64_t)CFSTR("MountPath"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v44 == 0;
    if (!a3)
      goto LABEL_24;
    goto LABEL_21;
  }
  v31 = CFRetain(v44);
  v27 = 0;
LABEL_25:
  CFRelease(v29);
  v32 = v31;
LABEL_26:
  if (dict)
    CFRelease(dict);
  if (cf)
    CFRelease(cf);
  cf = 0;

  return v32;
}

uint64_t MobileStorageUnmount(const __CFString *a1, uint64_t a2)
{
  return MobileStorageUnmountWithError(a1, a2, 0);
}

uint64_t MobileStorageUnmountWithError(const __CFString *a1, uint64_t a2, _QWORD *a3)
{
  __CFDictionary *dict;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFDictionary *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFDictionary *v19;
  const void *Value;
  const void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  const void *v26;
  uint64_t v27;
  const __CFString *v29;
  CFTypeRef cf;

  cf = 0;
  dict = create_dict();
  v10 = dict;
  if (!dict)
  {
    createMobileStorageError((uint64_t)"MobileStorageUnmountWithError", 224, -2, 0, CFSTR("Failed to create dictionary."), v7, v8, v9, (uint64_t)v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    if (!a3)
      goto LABEL_17;
    goto LABEL_15;
  }
  CFDictionarySetValue(dict, CFSTR("RequestType"), CFSTR("Unmount"));
  CFDictionarySetValue(v10, CFSTR("MountPath"), a1);
  v15 = (const __CFDictionary *)call_and_response("com.apple.mobile.storage_mounter.xpc", v10, a2, &cf, v11, v12, v13, v14);
  v19 = v15;
  if (!v15)
  {
    v23 = (void *)cf;
    v24 = CFSTR("Failed to receive response message from server.");
    v25 = 237;
    goto LABEL_14;
  }
  Value = CFDictionaryGetValue(v15, CFSTR("DetailedError"));
  if (Value)
  {
    v21 = Value;
    CFStringGetTypeID();
    CFGetTypeID(v21);
  }
  v26 = CFDictionaryGetValue(v19, CFSTR("Status"));
  if (!v26)
  {
    v24 = CFSTR("Invalid value for %@: %@");
    v29 = CFSTR("Status");
    v25 = 250;
LABEL_13:
    v23 = 0;
LABEL_14:
    createMobileStorageError((uint64_t)"MobileStorageUnmountWithError", v25, -2, v23, v24, v16, v17, v18, (uint64_t)v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_17;
LABEL_15:
    if (v22)
      *a3 = v22;
LABEL_17:
    v27 = 0xFFFFFFFFLL;
    if (!v19)
      goto LABEL_19;
    goto LABEL_18;
  }
  if (!CFEqual(v26, CFSTR("Success")))
  {
    v24 = CFSTR("Failed to unmount %@: %@");
    v29 = a1;
    v25 = 256;
    goto LABEL_13;
  }
  v27 = 0;
  v22 = 0;
LABEL_18:
  CFRelease(v19);
LABEL_19:
  if (v10)
    CFRelease(v10);
  if (cf)
    CFRelease(cf);
  cf = 0;

  return v27;
}

uint64_t MobileStorageSync(const __CFString *a1, uint64_t a2)
{
  return MobileStorageSyncWithError(a1, a2, 0);
}

uint64_t MobileStorageSyncWithError(const __CFString *a1, uint64_t a2, _QWORD *a3)
{
  __CFDictionary *dict;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFDictionary *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFDictionary *v19;
  const void *Value;
  const void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  const void *v26;
  uint64_t v27;
  const __CFString *v29;
  CFTypeRef cf;

  cf = 0;
  dict = create_dict();
  v10 = dict;
  if (!dict)
  {
    createMobileStorageError((uint64_t)"MobileStorageSyncWithError", 300, -2, 0, CFSTR("Failed to create dictionary."), v7, v8, v9, (uint64_t)v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    if (!a3)
      goto LABEL_17;
    goto LABEL_15;
  }
  CFDictionarySetValue(dict, CFSTR("RequestType"), CFSTR("Sync"));
  CFDictionarySetValue(v10, CFSTR("MountPath"), a1);
  v15 = (const __CFDictionary *)call_and_response("com.apple.mobile.storage_mounter.xpc", v10, a2, &cf, v11, v12, v13, v14);
  v19 = v15;
  if (!v15)
  {
    v23 = (void *)cf;
    v24 = CFSTR("Failed to receive response message from server.");
    v25 = 313;
    goto LABEL_14;
  }
  Value = CFDictionaryGetValue(v15, CFSTR("DetailedError"));
  if (Value)
  {
    v21 = Value;
    CFStringGetTypeID();
    CFGetTypeID(v21);
  }
  v26 = CFDictionaryGetValue(v19, CFSTR("Status"));
  if (!v26)
  {
    v24 = CFSTR("Invalid value for %@: %@");
    v29 = CFSTR("Status");
    v25 = 326;
LABEL_13:
    v23 = 0;
LABEL_14:
    createMobileStorageError((uint64_t)"MobileStorageSyncWithError", v25, -2, v23, v24, v16, v17, v18, (uint64_t)v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_17;
LABEL_15:
    if (v22)
      *a3 = v22;
LABEL_17:
    v27 = 0xFFFFFFFFLL;
    if (!v19)
      goto LABEL_19;
    goto LABEL_18;
  }
  if (!CFEqual(v26, CFSTR("Success")))
  {
    v24 = CFSTR("Failed to sync %@: %@");
    v29 = a1;
    v25 = 332;
    goto LABEL_13;
  }
  v27 = 0;
  v22 = 0;
LABEL_18:
  CFRelease(v19);
LABEL_19:
  if (v10)
    CFRelease(v10);
  if (cf)
    CFRelease(cf);
  cf = 0;

  return v27;
}

uint64_t MobileStorageRollPersonalizationNonceWithError(const __CFDictionary *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFDictionary *dict;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFDictionary *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFDictionary *v22;
  const __CFString *Value;
  const __CFString *v24;
  CFTypeID TypeID;
  const __CFString *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  uint64_t v30;
  const void *v31;
  uint64_t v32;
  uint64_t v33;
  const __CFString *v35;
  CFTypeRef cf;

  cf = 0;
  dict = create_dict();
  if (!dict)
  {
    createMobileStorageError((uint64_t)"MobileStorageRollPersonalizationNonceWithError", 365, -2, 0, CFSTR("Failed to create dictionary."), v4, v5, v6, (uint64_t)v35);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v9 = 0;
    goto LABEL_21;
  }
  CFDictionaryGetValue(a1, CFSTR("PersonalizedImageType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    isNSString(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      createMobileStorageError((uint64_t)"MobileStorageRollPersonalizationNonceWithError", 372, -3, 0, CFSTR("Invalid value for options key: %@"), v11, v12, v13, (uint64_t)CFSTR("PersonalizedImageType"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      goto LABEL_21;
    }
    CFDictionarySetValue(dict, CFSTR("PersonalizedImageType"), v9);
  }
  CFDictionarySetValue(dict, CFSTR("RequestType"), CFSTR("RollPersonalizationNonce"));
  v18 = (const __CFDictionary *)call_and_response("com.apple.mobile.storage_mounter.xpc", dict, (uint64_t)a1, &cf, v14, v15, v16, v17);
  v22 = v18;
  if (v18)
  {
    Value = (const __CFString *)CFDictionaryGetValue(v18, CFSTR("DetailedError"));
    if (Value)
    {
      v24 = Value;
      TypeID = CFStringGetTypeID();
      if (TypeID == CFGetTypeID(v24))
        v26 = v24;
      else
        v26 = 0;
    }
    else
    {
      v26 = 0;
    }
    v31 = CFDictionaryGetValue(v22, CFSTR("Status"));
    if (v31)
    {
      if (CFEqual(v31, CFSTR("Success")))
      {
        v27 = 0;
        v32 = 1;
LABEL_24:
        CFRelease(v22);
        v33 = v32;
        goto LABEL_25;
      }
      v29 = CFSTR("Failed to roll personalization nonce: %@");
      v35 = v26;
      v30 = 401;
    }
    else
    {
      v29 = CFSTR("Invalid value for %@: %@");
      v35 = CFSTR("Status");
      v30 = 395;
    }
    v28 = 0;
  }
  else
  {
    v28 = (void *)cf;
    v29 = CFSTR("Failed to receive response message from server.");
    v30 = 382;
  }
  createMobileStorageError((uint64_t)"MobileStorageRollPersonalizationNonceWithError", v30, -2, v28, v29, v19, v20, v21, (uint64_t)v35);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:
  if (a2)
    *a2 = v27;
  v32 = 0;
  v33 = 0;
  if (v22)
    goto LABEL_24;
LABEL_25:
  if (dict)
    CFRelease(dict);
  if (cf)
    CFRelease(cf);
  cf = 0;

  return v33;
}

uint64_t MobileStorageRollCryptexNonceWithError(uint64_t a1, _QWORD *a2)
{
  __CFDictionary *dict;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFDictionary *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFDictionary *v17;
  const __CFString *Value;
  const __CFString *v19;
  CFTypeID TypeID;
  const __CFString *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  const void *v26;
  uint64_t v27;
  uint64_t v28;
  const __CFString *v30;
  CFTypeRef cf;

  cf = 0;
  dict = create_dict();
  v8 = dict;
  if (!dict)
  {
    createMobileStorageError((uint64_t)"MobileStorageRollCryptexNonceWithError", 433, -2, 0, CFSTR("Failed to create dictionary."), v5, v6, v7, (uint64_t)v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    if (!a2)
    {
LABEL_19:
      v27 = 0;
      v28 = 0;
      if (!v17)
        goto LABEL_21;
      goto LABEL_20;
    }
LABEL_18:
    *a2 = v22;
    goto LABEL_19;
  }
  CFDictionarySetValue(dict, CFSTR("RequestType"), CFSTR("RollCryptexNonce"));
  v13 = (const __CFDictionary *)call_and_response("com.apple.mobile.storage_mounter.xpc", v8, a1, &cf, v9, v10, v11, v12);
  v17 = v13;
  if (!v13)
  {
    v23 = (void *)cf;
    v24 = CFSTR("Failed to receive response message from server.");
    v25 = 441;
    goto LABEL_17;
  }
  Value = (const __CFString *)CFDictionaryGetValue(v13, CFSTR("DetailedError"));
  if (Value)
  {
    v19 = Value;
    TypeID = CFStringGetTypeID();
    if (TypeID == CFGetTypeID(v19))
      v21 = v19;
    else
      v21 = 0;
  }
  else
  {
    v21 = 0;
  }
  v26 = CFDictionaryGetValue(v17, CFSTR("Status"));
  if (!v26)
  {
    v24 = CFSTR("Invalid value for %@: %@");
    v30 = CFSTR("Status");
    v25 = 454;
LABEL_16:
    v23 = 0;
LABEL_17:
    createMobileStorageError((uint64_t)"MobileStorageRollCryptexNonceWithError", v25, -2, v23, v24, v14, v15, v16, (uint64_t)v30);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a2)
      goto LABEL_19;
    goto LABEL_18;
  }
  if (!CFEqual(v26, CFSTR("Success")))
  {
    v24 = CFSTR("Failed to roll cryptex nonce: %@");
    v30 = v21;
    v25 = 460;
    goto LABEL_16;
  }
  v22 = 0;
  v27 = 1;
LABEL_20:
  CFRelease(v17);
  v28 = v27;
LABEL_21:
  if (v8)
    CFRelease(v8);
  if (cf)
    CFRelease(cf);
  cf = 0;

  return v28;
}

CFTypeRef MobileStorageCopyPersonalizationNonceWithError(const __CFDictionary *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFDictionary *dict;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFDictionary *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFDictionary *v22;
  const void *Value;
  const void *v24;
  CFTypeID TypeID;
  uint64_t v26;
  void *v27;
  CFTypeRef v28;
  void *v29;
  __CFString *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v35;
  CFTypeRef cf;

  cf = 0;
  dict = create_dict();
  if (dict)
  {
    CFDictionaryGetValue(a1, CFSTR("PersonalizedImageType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
      goto LABEL_5;
    isNSString(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      CFDictionarySetValue(dict, CFSTR("PersonalizedImageType"), v9);
LABEL_5:
      CFDictionarySetValue(dict, CFSTR("RequestType"), CFSTR("CopyPersonalizationNonce"));
      v18 = (const __CFDictionary *)call_and_response("com.apple.mobile.storage_mounter.xpc", dict, (uint64_t)a1, &cf, v14, v15, v16, v17);
      v22 = v18;
      if (v18)
      {
        Value = CFDictionaryGetValue(v18, CFSTR("DetailedError"));
        if (Value)
        {
          v24 = Value;
          TypeID = CFStringGetTypeID();
          if (TypeID == CFGetTypeID(v24))
            v26 = (uint64_t)v24;
          else
            v26 = 0;
        }
        else
        {
          v26 = 0;
        }
        v32 = (void *)CFDictionaryGetValue(v22, CFSTR("PersonalizationNonce"));
        isNSData(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          v28 = CFRetain(v32);
          v27 = 0;
          goto LABEL_18;
        }
        v30 = CFSTR("Failed to retrieve personalization nonce: %@");
        v35 = v26;
        v31 = 522;
        v29 = 0;
      }
      else
      {
        v29 = (void *)cf;
        v30 = CFSTR("Failed to receive response message from server.");
        v31 = 510;
      }
      createMobileStorageError((uint64_t)"MobileStorageCopyPersonalizationNonceWithError", v31, -2, v29, v30, v19, v20, v21, v35);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      goto LABEL_18;
    }
    createMobileStorageError((uint64_t)"MobileStorageCopyPersonalizationNonceWithError", 500, -3, 0, CFSTR("Invalid value for options key: %@"), v11, v12, v13, (uint64_t)CFSTR("PersonalizedImageType"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v22 = 0;
  }
  else
  {
    createMobileStorageError((uint64_t)"MobileStorageCopyPersonalizationNonceWithError", 493, -2, 0, CFSTR("Failed to create dictionary."), v4, v5, v6, v35);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v22 = 0;
    v9 = 0;
  }
LABEL_18:
  if (a2 && !v28)
    *a2 = v27;
  if (v22)
    CFRelease(v22);
  if (dict)
    CFRelease(dict);
  if (cf)
    CFRelease(cf);
  cf = 0;

  return v28;
}

void *MobileStorageCopyPersonalizationIdentifiersWithError(const __CFDictionary *a1, _QWORD *a2)
{
  __CFDictionary *dict;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFDictionary *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFDictionary *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFDictionary *v23;
  void *Value;
  uint64_t v25;
  void *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const void *v32;
  const void *v33;
  CFTypeID TypeID;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  CFTypeRef cf;

  cf = 0;
  dict = create_dict();
  v8 = dict;
  if (dict)
  {
    CFDictionarySetValue(dict, CFSTR("RequestType"), CFSTR("CopyPersonalizationIdentifiers"));
    CFDictionaryGetValue(a1, CFSTR("PersonalizedImageType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v9;
    if (v9)
    {
      isNSString(v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
      {
        createMobileStorageError((uint64_t)"MobileStorageCopyPersonalizationIdentifiersWithError", 565, -3, 0, CFSTR("Invalid value for options key: %@"), v16, v17, v18, (uint64_t)CFSTR("PersonalizedImageType"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        if (!a2)
          goto LABEL_27;
        goto LABEL_25;
      }
      CFDictionarySetValue(v8, CFSTR("PersonalizedImageType"), v14);
    }
    v19 = (const __CFDictionary *)call_and_response("com.apple.mobile.storage_mounter.xpc", v8, (uint64_t)a1, &cf, v10, v11, v12, v13);
    v23 = v19;
    if (!v19)
    {
      createMobileStorageError((uint64_t)"MobileStorageCopyPersonalizationIdentifiersWithError", 573, -2, (void *)cf, CFSTR("Failed to receive response message from server."), v20, v21, v22, v41);
LABEL_12:
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      if (!a2)
        goto LABEL_27;
      goto LABEL_25;
    }
    Value = (void *)CFDictionaryGetValue(v19, CFSTR("Error"));
    isNSString(Value);
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)v25;
      v27 = CFEqual(Value, CFSTR("UnknownCommand"));

      if (v27)
      {
        createMobileStorageError((uint64_t)"MobileStorageCopyPersonalizationIdentifiersWithError", 579, -5, 0, CFSTR("Unsupported command: %@"), v28, v29, v30, (uint64_t)CFSTR("QueryPersonalizationIdentifiers"));
        goto LABEL_12;
      }
    }
    v32 = CFDictionaryGetValue(v23, CFSTR("DetailedError"));
    if (v32)
    {
      v33 = v32;
      TypeID = CFStringGetTypeID();
      if (TypeID == CFGetTypeID(v33))
        v35 = (uint64_t)v33;
      else
        v35 = 0;
    }
    else
    {
      v35 = 0;
    }
    v36 = (void *)CFDictionaryGetValue(v23, CFSTR("PersonalizationIdentifiers"));
    isNSDictionary(v36);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v15 = (void *)CFRetain(v36);
      v31 = 0;
      if (!a2)
        goto LABEL_27;
    }
    else
    {
      createMobileStorageError((uint64_t)"MobileStorageCopyPersonalizationIdentifiersWithError", 590, -2, 0, CFSTR("Failed to retrieve personalization identifiers: %@"), v37, v38, v39, v35);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a2)
        goto LABEL_27;
    }
  }
  else
  {
    createMobileStorageError((uint64_t)"MobileStorageCopyPersonalizationIdentifiersWithError", 556, -2, 0, CFSTR("Failed to create dictionary."), v5, v6, v7, v41);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v23 = 0;
    v14 = 0;
    if (!a2)
      goto LABEL_27;
  }
LABEL_25:
  if (!v15)
    *a2 = v31;
LABEL_27:
  if (v23)
    CFRelease(v23);
  if (v8)
    CFRelease(v8);
  if (cf)
    CFRelease(cf);
  cf = 0;

  return v15;
}

void *MobileStorageCopyCryptexNonceWithError(uint64_t a1, _QWORD *a2)
{
  __CFDictionary *dict;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFDictionary *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFDictionary *v17;
  const void *Value;
  const void *v19;
  CFTypeID TypeID;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  CFTypeRef cf;

  cf = 0;
  dict = create_dict();
  v8 = dict;
  if (dict)
  {
    CFDictionarySetValue(dict, CFSTR("RequestType"), CFSTR("CopyCryptexNonce"));
    v13 = (const __CFDictionary *)call_and_response("com.apple.mobile.storage_mounter.xpc", v8, a1, &cf, v9, v10, v11, v12);
    v17 = v13;
    if (v13)
    {
      Value = CFDictionaryGetValue(v13, CFSTR("DetailedError"));
      if (Value)
      {
        v19 = Value;
        TypeID = CFStringGetTypeID();
        if (TypeID == CFGetTypeID(v19))
          v21 = (uint64_t)v19;
        else
          v21 = 0;
      }
      else
      {
        v21 = 0;
      }
      v24 = (void *)CFDictionaryGetValue(v17, CFSTR("CryptexNonce"));
      isNSData(v24);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v23 = (void *)CFRetain(v24);
        v22 = 0;
        if (!a2)
          goto LABEL_18;
      }
      else
      {
        createMobileStorageError((uint64_t)"MobileStorageCopyCryptexNonceWithError", 642, -2, 0, CFSTR("Failed to retrieve cryptex nonce: %@"), v25, v26, v27, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!a2)
          goto LABEL_18;
      }
    }
    else
    {
      createMobileStorageError((uint64_t)"MobileStorageCopyCryptexNonceWithError", 630, -2, (void *)cf, CFSTR("Failed to receive response message from server."), v14, v15, v16, v29);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      if (!a2)
        goto LABEL_18;
    }
  }
  else
  {
    createMobileStorageError((uint64_t)"MobileStorageCopyCryptexNonceWithError", 622, -2, 0, CFSTR("Failed to create dictionary."), v5, v6, v7, v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v17 = 0;
    if (!a2)
      goto LABEL_18;
  }
  if (!v23)
    *a2 = v22;
LABEL_18:
  if (v17)
    CFRelease(v17);
  if (v8)
    CFRelease(v8);
  if (cf)
    CFRelease(cf);
  cf = 0;

  return v23;
}

void *MobileStorageCopyPersonalizationManifestWithError(const void *a1, const void *a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __CFDictionary *dict;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFDictionary *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFDictionary *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFDictionary *v25;
  const void *Value;
  const void *v27;
  CFTypeID TypeID;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  CFTypeRef cf;

  cf = 0;
  if (!a1 || !a2)
  {
    createMobileStorageError((uint64_t)"MobileStorageCopyPersonalizationManifestWithError", 673, -2, 0, CFSTR("Invalid input(s)."), a6, a7, a8, v37);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v16 = 0;
    goto LABEL_11;
  }
  dict = create_dict();
  v16 = dict;
  if (!dict)
  {
    createMobileStorageError((uint64_t)"MobileStorageCopyPersonalizationManifestWithError", 679, -2, 0, CFSTR("Failed to create dictionary."), v13, v14, v15, v37);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
LABEL_11:
    v25 = 0;
    if (!a4)
      goto LABEL_14;
    goto LABEL_12;
  }
  CFDictionarySetValue(dict, CFSTR("RequestType"), CFSTR("CopyPersonalizationManifest"));
  CFDictionarySetValue(v16, CFSTR("PersonalizedImageType"), a1);
  CFDictionarySetValue(v16, CFSTR("ImageSignature"), a2);
  v21 = (const __CFDictionary *)call_and_response("com.apple.mobile.storage_mounter.xpc", v16, a3, &cf, v17, v18, v19, v20);
  v25 = v21;
  if (v21)
  {
    Value = CFDictionaryGetValue(v21, CFSTR("DetailedError"));
    if (Value)
    {
      v27 = Value;
      TypeID = CFStringGetTypeID();
      if (TypeID == CFGetTypeID(v27))
        v29 = (uint64_t)v27;
      else
        v29 = 0;
    }
    else
    {
      v29 = 0;
    }
    v33 = (void *)CFDictionaryGetValue(v25, CFSTR("ImageSignature"));
    isNSData(v33);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      v31 = (void *)CFRetain(v33);
      v30 = 0;
      if (!a4)
        goto LABEL_14;
    }
    else
    {
      createMobileStorageError((uint64_t)"MobileStorageCopyPersonalizationManifestWithError", 701, -2, 0, CFSTR("Failed to retrieve personalization manifest: %@"), v34, v35, v36, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a4)
        goto LABEL_14;
    }
  }
  else
  {
    createMobileStorageError((uint64_t)"MobileStorageCopyPersonalizationManifestWithError", 689, -2, (void *)cf, CFSTR("Failed to receive response message from server."), v22, v23, v24, v37);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    if (!a4)
      goto LABEL_14;
  }
LABEL_12:
  if (!v31)
    *a4 = v30;
LABEL_14:
  if (v25)
    CFRelease(v25);
  if (v16)
    CFRelease(v16);
  if (cf)
    CFRelease(cf);
  cf = 0;

  return v31;
}

uint64_t MobileStorageCopyDeveloperModeStatusWithError(uint64_t a1, _QWORD *a2)
{
  __CFDictionary *dict;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFDictionary *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFDictionary *v17;
  const void *Value;
  const void *v19;
  CFTypeID TypeID;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  CFTypeRef cf;

  cf = 0;
  dict = create_dict();
  v8 = dict;
  if (dict)
  {
    CFDictionarySetValue(dict, CFSTR("RequestType"), CFSTR("CopyDeveloperModeStatus"));
    v13 = (const __CFDictionary *)call_and_response("com.apple.mobile.storage_mounter.xpc", v8, a1, &cf, v9, v10, v11, v12);
    v17 = v13;
    if (v13)
    {
      Value = CFDictionaryGetValue(v13, CFSTR("DetailedError"));
      if (Value)
      {
        v19 = Value;
        TypeID = CFStringGetTypeID();
        if (TypeID == CFGetTypeID(v19))
          v21 = (uint64_t)v19;
        else
          v21 = 0;
      }
      else
      {
        v21 = 0;
      }
      v24 = (void *)CFDictionaryGetValue(v17, CFSTR("DeveloperModeStatus"));
      isNSNumber(v24);
      v23 = objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v23 = objc_msgSend(v24, "BOOLValue");
        v22 = 0;
        if (!a2)
          goto LABEL_18;
      }
      else
      {
        createMobileStorageError((uint64_t)"MobileStorageCopyDeveloperModeStatusWithError", 753, -2, 0, CFSTR("Failed to retrieve developer mode status: %@"), v25, v26, v27, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (!a2)
          goto LABEL_18;
      }
    }
    else
    {
      createMobileStorageError((uint64_t)"MobileStorageCopyDeveloperModeStatusWithError", 741, -2, (void *)cf, CFSTR("Failed to receive response message from server."), v14, v15, v16, v29);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      if (!a2)
        goto LABEL_18;
    }
  }
  else
  {
    createMobileStorageError((uint64_t)"MobileStorageCopyDeveloperModeStatusWithError", 733, -2, 0, CFSTR("Failed to create dictionary."), v5, v6, v7, v29);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v17 = 0;
    if (!a2)
      goto LABEL_18;
  }
  if ((v23 & 1) == 0)
    *a2 = v22;
LABEL_18:
  if (v17)
    CFRelease(v17);
  if (v8)
    CFRelease(v8);
  if (cf)
    CFRelease(cf);
  cf = 0;

  return v23;
}

id MobileStorageCopyAndFixPlist(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = a1;
  +[PlistProcessor sharedPlistProcessor](PlistProcessor, "sharedPlistProcessor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyAndFixPlist:forMountPoint:withError:", v4, v3, 0);

  return v6;
}

CFTypeRef MobileStorageRemoteCopyDevicesWithError(void *a1, uint64_t a2, _QWORD *a3)
{
  id v4;
  __CFDictionary *dict;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFDictionary *v9;
  const __CFDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFDictionary *v14;
  const void *Value;
  const void *v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  const void *v23;
  void *v24;
  CFTypeRef v25;
  CFTypeRef v26;
  CFTypeRef v27;
  const __CFString *v29;

  v4 = a1;
  dict = create_dict();
  v9 = dict;
  if (!dict)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteCopyDevicesWithError", 292, -2, 0, CFSTR("Failed to create dictionary."), v6, v7, v8, (uint64_t)v29);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    if (!a3)
      goto LABEL_21;
    goto LABEL_19;
  }
  CFDictionarySetValue(dict, CFSTR("Command"), CFSTR("CopyDevices"));
  v10 = (const __CFDictionary *)call_and_response_remote();
  v14 = v10;
  if (!v10)
  {
    v18 = CFSTR("Failed to receive response message from server.");
    v19 = 300;
    goto LABEL_18;
  }
  Value = CFDictionaryGetValue(v10, CFSTR("DetailedError"));
  if (Value)
  {
    v16 = Value;
    CFStringGetTypeID();
    CFGetTypeID(v16);
  }
  v20 = (void *)CFDictionaryGetValue(v14, CFSTR("Status"));
  isNSString(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    v18 = CFSTR("Invalid value for %@: %@");
    v29 = CFSTR("Status");
    v19 = 311;
    goto LABEL_18;
  }
  if ((objc_msgSend(v20, "isEqualToString:", CFSTR("Complete")) & 1) == 0)
  {
    v18 = CFSTR("Status is not complete.");
    v19 = 316;
    goto LABEL_18;
  }
  v22 = (void *)CFDictionaryGetValue(v14, CFSTR("EntryList"));
  if (!v22)
  {
    v25 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    goto LABEL_16;
  }
  v23 = v22;
  isNSArray(v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
  {
    v18 = CFSTR("Invalid value for %@: %@");
    v29 = CFSTR("EntryList");
    v19 = 322;
LABEL_18:
    createMobileStorageError((uint64_t)"MobileStorageRemoteCopyDevicesWithError", v19, -2, 0, v18, v11, v12, v13, (uint64_t)v29);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_21;
LABEL_19:
    if (v17)
      *a3 = v17;
LABEL_21:
    v26 = 0;
    v27 = 0;
    if (!v14)
      goto LABEL_23;
    goto LABEL_22;
  }
  v25 = CFRetain(v23);
LABEL_16:
  v26 = v25;
  v17 = 0;
LABEL_22:
  CFRelease(v14);
  v27 = v26;
LABEL_23:
  if (v9)
    CFRelease(v9);

  return v27;
}

CFTypeRef MobileStorageRemoteCopyMountedImageSignaturesWithError(void *a1, uint64_t a2, _QWORD *a3)
{
  id v4;
  __CFDictionary *dict;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFDictionary *v9;
  const __CFDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFDictionary *v14;
  const void *Value;
  const void *v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  CFTypeRef v24;
  CFTypeRef v25;
  const __CFString *v27;

  v4 = a1;
  dict = create_dict();
  v9 = dict;
  if (!dict)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteCopyMountedImageSignaturesWithError", 358, -2, 0, CFSTR("Failed to create dictionary."), v6, v7, v8, (uint64_t)v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    if (!a3)
      goto LABEL_20;
    goto LABEL_18;
  }
  CFDictionarySetValue(dict, CFSTR("Command"), CFSTR("LookupImage"));
  CFDictionarySetValue(v9, CFSTR("ImageType"), CFSTR("Personalized"));
  v10 = (const __CFDictionary *)call_and_response_remote();
  v14 = v10;
  if (!v10)
  {
    v18 = CFSTR("Failed to receive response message from server.");
    v19 = 367;
    goto LABEL_17;
  }
  Value = CFDictionaryGetValue(v10, CFSTR("DetailedError"));
  if (Value)
  {
    v16 = Value;
    CFStringGetTypeID();
    CFGetTypeID(v16);
  }
  v20 = (void *)CFDictionaryGetValue(v14, CFSTR("Status"));
  isNSString(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    v18 = CFSTR("Invalid value for %@: %@");
    v27 = CFSTR("Status");
    v19 = 378;
    goto LABEL_17;
  }
  if ((objc_msgSend(v20, "isEqualToString:", CFSTR("Complete")) & 1) == 0)
  {
    v18 = CFSTR("Status is not complete.");
    v19 = 383;
    goto LABEL_17;
  }
  v22 = (void *)CFDictionaryGetValue(v14, CFSTR("ImageSignature"));
  v17 = v22;
  if (!v22)
  {
    v24 = objc_alloc_init(MEMORY[0x24BDBCE30]);
    goto LABEL_21;
  }
  isNSArray(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
    v18 = CFSTR("Invalid value for %@: %@");
    v27 = CFSTR("EntryList");
    v19 = 389;
LABEL_17:
    createMobileStorageError((uint64_t)"MobileStorageRemoteCopyMountedImageSignaturesWithError", v19, -2, 0, v18, v11, v12, v13, (uint64_t)v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_20;
LABEL_18:
    if (v17)
      *a3 = v17;
LABEL_20:
    v24 = 0;
    v25 = 0;
    if (!v14)
      goto LABEL_22;
    goto LABEL_21;
  }
  v24 = CFRetain(v17);
  v17 = 0;
LABEL_21:
  CFRelease(v14);
  v25 = v24;
LABEL_22:
  if (v9)
    CFRelease(v9);

  return v25;
}

uint64_t MobileStorageRemoteMountWithError(void *a1, void *a2, void *a3, _QWORD *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  char v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  id v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  char v127;
  id v128;
  __CFString *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  __CFString *v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  _QWORD *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  id v150;
  id v151;
  id v152;
  id v153;
  void *v154;
  void *v155;
  id v156;
  void *v157;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v13 = v9;
  if (!v7 || !v8 || !v9)
  {
    createMobileStorageError((uint64_t)"mountRemoteImage", 239, -3, 0, CFSTR("Invalid input(s)."), v10, v11, v12, v136);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
LABEL_10:
    v19 = 0;
LABEL_11:
    v34 = objc_retainAutorelease(v33);
    v35 = 0;
    v36 = v34;
    goto LABEL_12;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("DiskImageType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    createMobileStorageError((uint64_t)"mountRemoteImage", 245, -3, 0, CFSTR("Missing required option: %@"), v16, v17, v18, (uint64_t)CFSTR("DiskImageType"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ImageSignature"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  isNSData(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    createMobileStorageError((uint64_t)"mountRemoteImage", 251, -3, 0, CFSTR("Missing required option: %@"), v21, v22, v23, (uint64_t)CFSTR("ImageSignature"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v141 = v14;
  v139 = v19;
  v150 = v7;
  v24 = v8;
  v25 = v13;
  v157 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v156 = 0;
  v152 = v24;
  objc_msgSend(v26, "attributesOfItemAtPath:error:", v24, &v156);
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = v156;

  v154 = (void *)v27;
  if (v27)
  {
    v32 = v28;
  }
  else
  {
    createMobileStorageError((uint64_t)"stream_image", 156, -2, 0, CFSTR("Failed to retrieve image attributes."), v29, v30, v31, v136);
    v44 = objc_claimAutoreleasedReturnValue();

    v32 = (void *)v44;
  }
  objc_msgSend(v154, "objectForKey:", *MEMORY[0x24BDD0D08]);
  v148 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v148);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  v140 = a4;
  v142 = v25;
  if (!v45)
  {
    createMobileStorageError((uint64_t)"stream_image", 161, -2, 0, CFSTR("Failed to retrieve image size."), v46, v47, v48, v136);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = 0;
    v69 = 0;
    v71 = 0;
    v144 = 0;
    v146 = 0;
LABEL_35:

    v72 = objc_retainAutorelease(v70);
    v73 = 0;
    v32 = v72;
    goto LABEL_36;
  }
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("DiskImageType"));
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v146);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45)
  {
    createMobileStorageError((uint64_t)"stream_image", 167, -3, 0, CFSTR("Missing required options: %@"), v49, v50, v51, (uint64_t)CFSTR("DiskImageType"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = 0;
    v69 = 0;
    v71 = 0;
    v144 = 0;
    goto LABEL_35;
  }
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("ImageSignature"));
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  isNSData(v144);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v45)
  {
    createMobileStorageError((uint64_t)"stream_image", 173, -3, 0, CFSTR("Missing required options: %@"), v52, v53, v54, (uint64_t)CFSTR("ImageSignature"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = 0;
    v69 = 0;
    goto LABEL_31;
  }
  v55 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (!v55)
  {
    createMobileStorageError((uint64_t)"stream_image", 179, -2, 0, CFSTR("Failed to create dictionary."), v56, v57, v58, v136);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v137 = 0;
LABEL_34:
    v69 = 0;
    v71 = 0;
    v45 = 0;
    goto LABEL_35;
  }
  v59 = v55;
  objc_msgSend(v55, "setObject:forKeyedSubscript:", CFSTR("ReceiveBytes"), CFSTR("Command"));
  objc_msgSend(v59, "setObject:forKeyedSubscript:", v144, CFSTR("ImageSignature"));
  objc_msgSend(v59, "setObject:forKeyedSubscript:", v146, CFSTR("ImageType"));
  objc_msgSend(v59, "setObject:forKeyedSubscript:", v148, CFSTR("ImageSize"));
  objc_msgSend(objc_retainAutorelease(v152), "UTF8String");
  v60 = call_and_response_remote();
  v137 = v59;
  if (!v60)
  {
    createMobileStorageError((uint64_t)"stream_image", 192, -2, v157, CFSTR("Failed to send/receive XPC message."), v61, v62, v63, v136);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_34;
  }
  v64 = v60;
  objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("DetailedError"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v45);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  if (v65)
  {
    v69 = v64;
    createMobileStorageError((uint64_t)"stream_image", 198, -2, 0, CFSTR("An error occured while sending message: %@"), v66, v67, v68, (uint64_t)v45);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:
    v71 = 0;
    goto LABEL_35;
  }
  v69 = v64;
  objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("Status"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v71);
  v119 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v119)
  {
    v129 = CFSTR("Invalid response message.");
    v130 = 205;
LABEL_82:
    createMobileStorageError((uint64_t)"stream_image", v130, -2, 0, v129, v120, v121, v122, v136);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  if ((objc_msgSend(v71, "isEqualToString:", CFSTR("Complete")) & 1) == 0)
  {
    v129 = CFSTR("Status is not complete.");
    v130 = 210;
    goto LABEL_82;
  }
  v72 = 0;
  v73 = 1;
LABEL_36:
  if (v157)
    CFRelease(v157);

  v77 = v72;
  if ((v73 & 1) == 0)
  {
    createMobileStorageError((uint64_t)"mountRemoteImage", 257, -2, v77, CFSTR("Failed to stream image."), v74, v75, v76, v136);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v139;
    a4 = v140;
    v14 = v141;
    goto LABEL_11;
  }
  v151 = v150;
  v153 = v152;
  v78 = v142;
  v157 = 0;
  objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("ImageSignature"));
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  isNSData(v149);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  v143 = v78;
  v145 = v77;
  if (!v79)
  {
    createMobileStorageError((uint64_t)"mount_image", 45, -3, 0, CFSTR("Missing required options: %@"), v80, v81, v82, (uint64_t)CFSTR("ImageSignature"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = 0;
    v98 = 0;
    v104 = 0;
    v155 = 0;
    v147 = 0;
    v105 = 0;
    v14 = v141;
    goto LABEL_75;
  }
  objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("DiskImageType"));
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v155);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v141;
  if (!v79)
  {
    createMobileStorageError((uint64_t)"mount_image", 51, -3, 0, CFSTR("Missing required options: %@"), v83, v84, v85, (uint64_t)CFSTR("DiskImageType"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = 0;
    v98 = 0;
    v104 = 0;
    v147 = 0;
LABEL_67:
    v105 = 0;
    goto LABEL_75;
  }
  objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("ImageTrustCache"));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v86;
  v147 = v86;
  if (v86)
  {
    isNSData(v86);
    v88 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v88)
    {
      createMobileStorageError((uint64_t)"mount_image", 57, -3, 0, CFSTR("Invalid value for option %@: %@"), v89, v90, v91, (uint64_t)CFSTR("ImageTrustCache"));
LABEL_66:
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      v138 = 0;
      v98 = 0;
      v104 = 0;
      v79 = 0;
      goto LABEL_67;
    }
  }
  if (!objc_msgSend(v155, "isEqualToString:", CFSTR("Cryptex")))
  {
LABEL_51:
    v102 = 0;
    goto LABEL_52;
  }
  isNSData(v87);
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v92)
  {
    createMobileStorageError((uint64_t)"mount_image", 63, -3, 0, CFSTR("Invalid value for required option %@: %@"), v93, v94, v95, (uint64_t)CFSTR("ImageTrustCache"));
    goto LABEL_66;
  }
  objc_msgSend(v78, "objectForKeyedSubscript:");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v96)
    goto LABEL_51;
  v97 = v96;
  isNSData(v96);
  v98 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v98)
  {
    v105 = v97;
    createMobileStorageError((uint64_t)"mount_image", 69, -3, 0, CFSTR("Invalid value for option %@: %@"), v99, v100, v101, (uint64_t)CFSTR("ImageInfoPlist"));
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = 0;
    goto LABEL_74;
  }
  v87 = v147;
  v102 = v97;
LABEL_52:
  v106 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (!v106)
  {
    v105 = v102;
    createMobileStorageError((uint64_t)"mount_image", 76, -2, 0, CFSTR("Failed to create dictionary."), v107, v108, v109, v136);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = 0;
    v98 = 0;
LABEL_74:
    v104 = 0;
    v79 = 0;
    goto LABEL_75;
  }
  v110 = v106;
  objc_msgSend(v106, "setObject:forKeyedSubscript:", CFSTR("MountImage"), CFSTR("Command"));
  objc_msgSend(v110, "setObject:forKeyedSubscript:", v149, CFSTR("ImageSignature"));
  objc_msgSend(v110, "setObject:forKeyedSubscript:", v155, CFSTR("ImageType"));
  if (v87)
    objc_msgSend(v110, "setObject:forKeyedSubscript:", v87, CFSTR("ImageTrustCache"));
  if (v102)
    objc_msgSend(v110, "setObject:forKeyedSubscript:", v102, CFSTR("ImageInfoPlist"));
  objc_msgSend(objc_retainAutorelease(v153), "UTF8String");
  v111 = call_and_response_remote();
  v98 = v111;
  v138 = v110;
  if (!v111)
  {
    v105 = v102;
    createMobileStorageError((uint64_t)"mount_image", 96, -2, v157, CFSTR("Failed to send/receive XPC message."), v112, v113, v114, v136);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_74;
  }
  objc_msgSend(v111, "objectForKeyedSubscript:", CFSTR("DetailedError"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v79);
  v115 = (void *)objc_claimAutoreleasedReturnValue();

  if (v115)
  {
    v105 = v102;
    createMobileStorageError((uint64_t)"mount_image", 102, -2, 0, CFSTR("An error occured while sending message: %@"), v116, v117, v118, (uint64_t)v79);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = 0;
  }
  else
  {
    objc_msgSend(v98, "objectForKeyedSubscript:", CFSTR("Status"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    isNSString(v104);
    v123 = (void *)objc_claimAutoreleasedReturnValue();

    v105 = v102;
    if (v123)
    {
      if ((objc_msgSend(v104, "isEqualToString:", CFSTR("Complete")) & 1) != 0)
      {
        v127 = 1;
        v128 = v145;
        goto LABEL_76;
      }
      v134 = CFSTR("Status is not complete.");
      v135 = 114;
    }
    else
    {
      v134 = CFSTR("Invalid response message.");
      v135 = 109;
    }
    createMobileStorageError((uint64_t)"mount_image", v135, -2, 0, v134, v124, v125, v126, v136);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_75:
  v128 = objc_retainAutorelease(v103);

  v127 = 0;
LABEL_76:
  if (v157)
    CFRelease(v157);

  v36 = v128;
  if ((v127 & 1) == 0)
  {
    createMobileStorageError((uint64_t)"mountRemoteImage", 263, -2, v36, CFSTR("Failed mount image."), v131, v132, v133, v136);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v139;
    a4 = v140;
    goto LABEL_11;
  }
  v34 = 0;
  v35 = 1;
  v19 = v139;
  a4 = v140;
LABEL_12:

  v40 = v34;
  if ((v35 & 1) != 0)
  {
    v41 = 0;
  }
  else
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteMountWithError", 422, -2, v40, CFSTR("Failed to mount %@ on device: %@"), v37, v38, v39, (uint64_t)v8);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = 0xFFFFFFFFLL;
    if (a4 && v42)
    {
      v40 = v42;
      *a4 = v40;
    }
    else
    {
      v40 = v42;
    }
  }

  return v41;
}

uint64_t MobileStorageRemoteUnmountWithError(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __CFString *v33;
  uint64_t v34;
  uint64_t v35;

  v9 = a1;
  if (!v9 || !a2)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteUnmountWithError", 453, -3, 0, CFSTR("Invalid input(s)"), v6, v7, v8, v35);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v14 = 0;
LABEL_9:
    v19 = 0;
LABEL_10:
    v26 = 0;
    v20 = 0;
    goto LABEL_11;
  }
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v14 = v10;
  if (!v10)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteUnmountWithError", 459, -2, 0, CFSTR("Failed to create dictionary."), v11, v12, v13, v35);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("UnmountImage"), CFSTR("Command"));
  objc_msgSend(v14, "setObject:forKeyedSubscript:", a2, CFSTR("MountPath"));
  v15 = call_and_response_remote();
  v19 = v15;
  if (!v15)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteUnmountWithError", 470, -2, 0, CFSTR("Failed to send/receive XPC message."), v16, v17, v18, v35);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("DetailedError"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteUnmountWithError", 476, -2, 0, CFSTR("An error occured while sending message: %@"), v22, v23, v24, (uint64_t)v20);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v26 = 0;
  }
  else
  {
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Status"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    isNSString(v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      if ((objc_msgSend(v26, "isEqualToString:", CFSTR("Complete")) & 1) != 0)
      {
        v25 = 0;
        v27 = 0;
        goto LABEL_14;
      }
      v33 = CFSTR("Status is not complete.");
      v34 = 487;
    }
    else
    {
      v33 = CFSTR("Invalid response message.");
      v34 = 482;
    }
    createMobileStorageError((uint64_t)"MobileStorageRemoteUnmountWithError", v34, -2, 0, v33, v30, v31, v32, v35);
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_11:
  v27 = 0xFFFFFFFFLL;
  if (a4 && v25)
  {
    v25 = v25;
    *a4 = v25;
  }
LABEL_14:

  return v27;
}

uint64_t MobileStorageRemoteRollPersonalizationNonceWithError(void *a1, const __CFDictionary *a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const __CFDictionary *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __CFString *v34;
  uint64_t v35;
  uint64_t v37;

  v8 = a1;
  if (!v8)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteRollPersonalizationNonceWithError", 516, -3, 0, CFSTR("Invalid input(s)"), v5, v6, v7, v37);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    goto LABEL_12;
  }
  v12 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (!v12)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteRollPersonalizationNonceWithError", 522, -2, 0, CFSTR("Failed to create dictionary."), v9, v10, v11, v37);
    v27 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
    v22 = 0;
    v14 = 0;
    v28 = 0;
    a2 = 0;
    if (a3)
    {
LABEL_20:
      v27 = v27;
      v33 = 0;
      *a3 = v27;
      goto LABEL_25;
    }
LABEL_24:
    v33 = 0;
    goto LABEL_25;
  }
  if (a2)
  {
    CFDictionaryGetValue(a2, CFSTR("PersonalizedImageType"));
    v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    a2 = v13;
    if (v13)
    {
      isNSString(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        createMobileStorageError((uint64_t)"MobileStorageRemoteRollPersonalizationNonceWithError", 530, -3, 0, CFSTR("Invalid value for options key: %@"), v15, v16, v17, (uint64_t)CFSTR("PersonalizedImageType"));
        v27 = (id)objc_claimAutoreleasedReturnValue();
        v22 = 0;
LABEL_19:
        v28 = 0;
        if (a3)
          goto LABEL_20;
        goto LABEL_24;
      }
      objc_msgSend(v12, "setObject:forKeyedSubscript:", a2, CFSTR("PersonalizedImageType"));
    }
  }
  objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("RollPersonalizationNonce"), CFSTR("Command"));
  v18 = call_and_response_remote();
  v22 = v18;
  if (!v18)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteRollPersonalizationNonceWithError", 544, -2, 0, CFSTR("Failed to send/receive XPC message."), v19, v20, v21, v37);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("DetailedError"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v14);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteRollPersonalizationNonceWithError", 550, -2, 0, CFSTR("An error occured while sending message: %@"), v24, v25, v26, (uint64_t)v14);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("Status"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
    v34 = CFSTR("Invalid response message.");
    v35 = 557;
    goto LABEL_23;
  }
  if ((objc_msgSend(v28, "isEqualToString:", CFSTR("Complete")) & 1) == 0)
  {
    v34 = CFSTR("Status is not complete.");
    v35 = 562;
LABEL_23:
    createMobileStorageError((uint64_t)"MobileStorageRemoteRollPersonalizationNonceWithError", v35, -2, 0, v34, v30, v31, v32, v37);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    if (a3)
      goto LABEL_20;
    goto LABEL_24;
  }
  v27 = 0;
  v33 = 1;
LABEL_25:

  return v33;
}

uint64_t MobileStorageRemoteRollCryptexNonceWithError(void *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __CFString *v30;
  uint64_t v31;
  uint64_t v33;

  v7 = a1;
  if (!v7)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteRollCryptexNonceWithError", 591, -3, 0, CFSTR("Invalid input(s)"), v4, v5, v6, v33);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v12 = 0;
LABEL_8:
    v17 = 0;
LABEL_9:
    v18 = 0;
LABEL_10:
    v24 = 0;
    if (a3)
      goto LABEL_11;
LABEL_19:
    v25 = 0;
    goto LABEL_20;
  }
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v12 = v8;
  if (!v8)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteRollCryptexNonceWithError", 597, -2, 0, CFSTR("Failed to create dictionary."), v9, v10, v11, v33);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("RollCryptexNonce"), CFSTR("Command"));
  v13 = call_and_response_remote();
  v17 = v13;
  if (!v13)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteRollCryptexNonceWithError", 607, -2, 0, CFSTR("Failed to send/receive XPC message."), v14, v15, v16, v33);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("DetailedError"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteRollCryptexNonceWithError", 613, -2, 0, CFSTR("An error occured while sending message: %@"), v20, v21, v22, (uint64_t)v18);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("Status"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    if ((objc_msgSend(v24, "isEqualToString:", CFSTR("Complete")) & 1) != 0)
    {
      v23 = 0;
      v25 = 1;
      goto LABEL_20;
    }
    v30 = CFSTR("Status is not complete.");
    v31 = 625;
  }
  else
  {
    v30 = CFSTR("Invalid response message.");
    v31 = 620;
  }
  createMobileStorageError((uint64_t)"MobileStorageRemoteRollCryptexNonceWithError", v31, -2, 0, v30, v27, v28, v29, v33);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (!a3)
    goto LABEL_19;
LABEL_11:
  v23 = v23;
  v25 = 0;
  *a3 = v23;
LABEL_20:

  return v25;
}

id MobileStorageRemoteCopyPersonalizationNonceWithError(void *a1, const __CFDictionary *a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  const __CFDictionary *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __CFString *v24;
  uint64_t v25;
  int v26;
  __CFString *v27;
  uint64_t v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  const __CFString *v37;

  v8 = a1;
  if (!v8)
  {
    v24 = CFSTR("Invalid input(s)");
    v25 = 655;
    v26 = -3;
LABEL_13:
    createMobileStorageError((uint64_t)"MobileStorageRemoteCopyPersonalizationNonceWithError", v25, v26, 0, v24, v5, v6, v7, (uint64_t)v37);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:
    v35 = 0;
    goto LABEL_21;
  }
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (!v9)
  {
    v24 = CFSTR("Failed to create dictionary.");
    v25 = 661;
    v26 = -2;
    goto LABEL_13;
  }
  v10 = v9;
  if (a2)
  {
    CFDictionaryGetValue(a2, CFSTR("PersonalizedImageType"));
    v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    a2 = v11;
    if (v11)
    {
      isNSString(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v27 = CFSTR("Invalid value for options key: %@");
        v37 = CFSTR("PersonalizedImageType");
        v28 = 669;
        v29 = -3;
        goto LABEL_18;
      }
      objc_msgSend(v10, "setObject:forKeyedSubscript:", a2, CFSTR("PersonalizedImageType"));
    }
  }
  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("QueryNonce"), CFSTR("Command"));
  v16 = call_and_response_remote();
  if (!v16)
  {
    v27 = CFSTR("Failed to send/receive XPC message.");
    v28 = 683;
    v29 = -2;
LABEL_18:
    createMobileStorageError((uint64_t)"MobileStorageRemoteCopyPersonalizationNonceWithError", v28, v29, 0, v27, v13, v14, v15, (uint64_t)v37);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_19;
  }
  v17 = v16;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("DetailedError"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteCopyPersonalizationNonceWithError", 689, -2, 0, CFSTR("An error occured while sending message: %@"), v20, v21, v22, (uint64_t)v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
LABEL_19:

    goto LABEL_20;
  }
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PersonalizationNonce"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  isNSData(v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteCopyPersonalizationNonceWithError", 696, -2, 0, CFSTR("Invalid response message."), v32, v33, v34, (uint64_t)v37);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v35 = v30;

  v23 = 0;
LABEL_21:
  if (a3 && !v35)
    *a3 = v23;

  return v35;
}

id MobileStorageRemoteCopyPersonalizationIdentifiersWithError(void *a1, const __CFDictionary *a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  const __CFDictionary *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  uint64_t v27;
  int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __CFString *v34;
  uint64_t v35;
  int v36;
  id v37;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const __CFString *v44;

  v8 = a1;
  if (!v8)
  {
    v26 = CFSTR("Invalid input(s)");
    v27 = 727;
    v28 = -3;
LABEL_13:
    createMobileStorageError((uint64_t)"MobileStorageRemoteCopyPersonalizationIdentifiersWithError", v27, v28, 0, v26, v5, v6, v7, (uint64_t)v44);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (!v9)
  {
    v26 = CFSTR("Failed to create dictionary.");
    v27 = 733;
    v28 = -2;
    goto LABEL_13;
  }
  v10 = v9;
  if (a2)
  {
    CFDictionaryGetValue(a2, CFSTR("PersonalizedImageType"));
    v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    a2 = v11;
    if (v11)
    {
      isNSString(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v34 = CFSTR("Invalid value for options key: %@");
        v44 = CFSTR("PersonalizedImageType");
        v35 = 741;
        v36 = -3;
        goto LABEL_20;
      }
      objc_msgSend(v10, "setObject:forKeyedSubscript:", a2, CFSTR("PersonalizedImageType"));
    }
  }
  objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("QueryPersonalizationIdentifiers"), CFSTR("Command"));
  v16 = call_and_response_remote();
  if (!v16)
  {
    v34 = CFSTR("Failed to send/receive XPC message.");
    v35 = 755;
    v36 = -2;
LABEL_20:
    createMobileStorageError((uint64_t)"MobileStorageRemoteCopyPersonalizationIdentifiersWithError", v35, v36, 0, v34, v13, v14, v15, (uint64_t)v44);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }
  v17 = v16;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("Error"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v18);
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    v21 = objc_msgSend(v18, "isEqualToString:", CFSTR("UnknownCommand"));

    if (v21)
    {
      createMobileStorageError((uint64_t)"MobileStorageRemoteCopyPersonalizationIdentifiersWithError", 761, -5, 0, CFSTR("Unsupported command: %@"), v22, v23, v24, (uint64_t)CFSTR("QueryPersonalizationIdentifiers"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
LABEL_21:

LABEL_22:
      v37 = 0;
      if (!a3)
        goto LABEL_25;
      goto LABEL_23;
    }
  }
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("DetailedError"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteCopyPersonalizationIdentifiersWithError", 767, -2, 0, CFSTR("An error occured while sending message: %@"), v31, v32, v33, (uint64_t)v29);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
    goto LABEL_17;
  }
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PersonalizationIdentifiers"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  isNSDictionary(v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v40)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteCopyPersonalizationIdentifiersWithError", 773, -2, 0, CFSTR("Invalid response message."), v41, v42, v43, (uint64_t)v44);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_16;
  }
  v37 = v39;

  v25 = 0;
  if (!a3)
    goto LABEL_25;
LABEL_23:
  if (!v37)
    *a3 = v25;
LABEL_25:

  return v37;
}

void *MobileStorageRemoteCopyCryptexNonceWithError(void *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v7 = a1;
  if (!v7)
  {
    v21 = CFSTR("Invalid input(s)");
    v22 = 802;
    v23 = -3;
LABEL_9:
    createMobileStorageError((uint64_t)"MobileStorageRemoteCopyCryptexNonceWithError", v22, v23, 0, v21, v4, v5, v6, v30);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (!v8)
  {
    v21 = CFSTR("Failed to create dictionary.");
    v22 = 808;
    v23 = -2;
    goto LABEL_9;
  }
  v9 = v8;
  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("QueryCryptexNonce"), CFSTR("Command"));
  v10 = call_and_response_remote();
  if (!v10)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteCopyCryptexNonceWithError", 818, -2, 0, CFSTR("Failed to send/receive XPC message."), v11, v12, v13, v30);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v14 = v10;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DetailedError"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteCopyCryptexNonceWithError", 824, -2, 0, CFSTR("An error occured while sending message: %@"), v17, v18, v19, (uint64_t)v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

LABEL_11:
LABEL_12:
    v24 = 0;
    if (!a3)
      goto LABEL_15;
    goto LABEL_13;
  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("CryptexNonce"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  isNSData(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteCopyCryptexNonceWithError", 831, -2, 0, CFSTR("Invalid response message."), v27, v28, v29, v30);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }

  v20 = 0;
  if (!a3)
    goto LABEL_15;
LABEL_13:
  if (!v24)
    *a3 = v20;
LABEL_15:

  return v24;
}

void *MobileStorageRemoteCopyPersonalizationManifestWithError(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __CFString *v23;
  uint64_t v24;
  int v25;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a1;
  if (!v8 || !a2 || !a3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Invalid input(s)", buf, 2u);
    }
    v23 = CFSTR("Invalid input(s)");
    v24 = 860;
    v25 = -3;
    goto LABEL_17;
  }
  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (!v9)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", buf, 2u);
    }
    v23 = CFSTR("Failed to create dictionary.");
    v24 = 866;
    v25 = -2;
LABEL_17:
    createMobileStorageError((uint64_t)"MobileStorageRemoteCopyPersonalizationManifestWithError", v24, v25, 0, v23, v20, v21, v22, v35);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v19 = 0;
    v12 = 0;
    v10 = 0;
    goto LABEL_18;
  }
  v10 = v9;
  objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("QueryPersonalizationManifest"), CFSTR("Command"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", a2, CFSTR("PersonalizedImageType"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", a3, CFSTR("ImageSignature"));
  v11 = call_and_response_remote();
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("DetailedError"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    isNSString(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v13;
        _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "An error occured while sending message: %@", buf, 0xCu);
      }
      createMobileStorageError((uint64_t)"MobileStorageRemoteCopyPersonalizationManifestWithError", 884, -2, 0, CFSTR("An error occured while sending message: %@"), v15, v16, v17, (uint64_t)v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ImageSignature"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      isNSData(v19);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        v18 = 0;
        goto LABEL_18;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Invalid response message.", buf, 2u);
      }
      createMobileStorageError((uint64_t)"MobileStorageRemoteCopyPersonalizationManifestWithError", 891, -2, 0, CFSTR("Invalid response message."), v32, v33, v34, v35);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v19 = 0;
  }
  else
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Failed to send/receive XPC message."));
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v27;
      _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }
    createMobileStorageError((uint64_t)"MobileStorageRemoteCopyPersonalizationManifestWithError", 878, -2, 0, CFSTR("Failed to send/receive XPC message."), v28, v29, v30, v35);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    v19 = 0;
    v12 = 0;
  }
LABEL_18:
  if (a5 && !v19)
    *a5 = v18;

  return v19;
}

uint64_t MobileStorageRemoteCopyDeveloperModeStatusWithError(void *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v7 = a1;
  if (!v7)
  {
    v21 = CFSTR("Invalid input(s)");
    v22 = 920;
    v23 = -3;
LABEL_9:
    createMobileStorageError((uint64_t)"MobileStorageRemoteCopyDeveloperModeStatusWithError", v22, v23, 0, v21, v4, v5, v6, v31);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (!v8)
  {
    v21 = CFSTR("Failed to create dictionary.");
    v22 = 926;
    v23 = -2;
    goto LABEL_9;
  }
  v9 = v8;
  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("QueryDeveloperModeStatus"), CFSTR("Command"));
  v10 = call_and_response_remote();
  if (!v10)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteCopyDeveloperModeStatusWithError", 936, -2, 0, CFSTR("Failed to send/receive XPC message."), v11, v12, v13, v31);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v14 = v10;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DetailedError"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  isNSString(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteCopyDeveloperModeStatusWithError", 942, -2, 0, CFSTR("An error occured while sending message: %@"), v17, v18, v19, (uint64_t)v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

LABEL_11:
LABEL_12:
    v24 = 0;
    if (!a3)
      goto LABEL_15;
    goto LABEL_13;
  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("DeveloperModeStatus"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  isNSNumber(v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteCopyDeveloperModeStatusWithError", 949, -2, 0, CFSTR("Invalid response message."), v28, v29, v30, v31);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v24 = objc_msgSend(v26, "BOOLValue");

  v20 = 0;
  if (!a3)
    goto LABEL_15;
LABEL_13:
  if ((v24 & 1) == 0)
    *a3 = v20;
LABEL_15:

  return v24;
}

void lib_auth_install_log_handler(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x212BEFCD0]();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a2);
  if (!v4)
  {
    v5 = 0;
    goto LABEL_11;
  }
  objc_msgSend(CFSTR("libauthinstall: "), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_10:
    v4 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", CFSTR("/tmp/libauthinstall_logs.txt"));

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataUsingEncoding:", 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x24BDD0CC8];
    v14 = &unk_24CE05D30;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "createFileAtPath:contents:attributes:", CFSTR("/tmp/libauthinstall_logs.txt"), v11, v12);

    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingAtPath:", CFSTR("/tmp/libauthinstall_logs.txt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v8;
  if (v8)
  {
    objc_msgSend(v8, "seekToEndOfFile");
    objc_msgSend(v5, "dataUsingEncoding:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeData:", v9);

    objc_msgSend(v4, "closeFile");
  }
LABEL_11:

  objc_autoreleasePoolPop(v3);
}

const char *convertLibAuthInstallError(int a1)
{
  int v1;
  const char *result;

  if (a1 > 3099)
  {
    if (a1 <= 3499)
    {
      if (a1 == 3100)
      {
        return "kAMAuthInstallErrorServer_begin";
      }
      else if (a1 == 3194)
      {
        return "kAMAuthInstallTATSUDeclinedAuthorization";
      }
      else
      {
        return 0;
      }
    }
    else
    {
      switch(a1)
      {
        case 3500:
          result = "kAMAuthInstallErrorHTTPInternalServerError";
          break;
        case 3501:
          result = "kAMAuthInstallErrorHTTPUnauthorized";
          break;
        case 3502:
        case 3505:
        case 3506:
          return 0;
        case 3503:
          result = "kAMAuthInstallErrorHTTPForbidden";
          break;
        case 3504:
          result = "kAMAuthInstallErrorHTTPNotFound";
          break;
        case 3507:
          result = "kAMAuthInstallErrorHTTPProxyAuthNeeded";
          break;
        default:
          if (a1 != 3999)
            return 0;
          result = "kAMAuthInstallErrorServer_end";
          break;
      }
    }
  }
  else
  {
    v1 = a1 - 1;
    result = "kAMAuthInstallErrorBadParameter";
    switch(v1)
    {
      case 0:
        return result;
      case 1:
        result = "kAMAuthInstallErrorAllocation";
        break;
      case 2:
        result = "kAMAuthInstallErrorConversion";
        break;
      case 3:
        result = "kAMAuthInstallErrorFile";
        break;
      case 4:
        result = "kAMAuthInstallErrorHash";
        break;
      case 5:
        result = "kAMAuthInstallErrorCrypto";
        break;
      case 6:
        result = "kAMAuthInstallErrorBadBuildIdentity";
        break;
      case 7:
        result = "kAMAuthInstallErrorEntryNotFound";
        break;
      case 8:
        result = "kAMAuthInstallErrorInvalidImg3Object";
        break;
      case 9:
        result = "kAMAuthInstallErrorInvalidFlsObject";
        break;
      case 10:
        result = "kAMAuthInstallErrorServerNotReachable";
        break;
      case 11:
        result = "kAMAuthInstallErrorServerTimedOut";
        break;
      case 12:
        result = "kAMAuthInstallErrorUnimplemented";
        break;
      case 13:
        result = "kAMAuthInstallErrorInternal";
        break;
      case 14:
        result = "kAMAuthInstallErrorInvalidBbfwFile";
        break;
      case 15:
        result = "kAMAuthInstallErrorNetwork";
        break;
      case 16:
        result = "kAMAuthInstallErrorBadResponse";
        break;
      case 17:
        result = "kAMAuthInstallErrorFusingFailed";
        break;
      case 18:
        result = "kAMAuthInstallErrorBBProvisioningFailed";
        break;
      case 19:
        result = "kAMAuthInstallErrorAppleConnectNotFound";
        break;
      case 20:
        result = "kAMAuthInstallErrorAppleConnectCanceled";
        break;
      case 21:
        result = "kAMAuthInstallErrorAppleConnectAuthFailed";
        break;
      case 22:
        result = "kAMAuthInstallErrorInvalidImg4Object";
        break;
      case 23:
        result = "kAMAuthInstallErrorProvisioningAckFailed";
        break;
      case 24:
        result = "kAMAuthInstallErrorUpdaterOperation";
        break;
      default:
        if ("kAMAuthInstallErrorBadParameter" != 99)
          return 0;
        result = "kAMAuthInstallErrorGeneric";
        break;
    }
  }
  return result;
}

uint64_t MobileStorageMountPersonalizedBundleWithError(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  PersonalizedImage *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PersonalizedImage *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  id v19;

  v5 = -[PersonalizedImage initWithBundleURL:imageVariant:remoteDevice:options:]([PersonalizedImage alloc], "initWithBundleURL:imageVariant:remoteDevice:options:", a1, a2, 0, a3);
  v9 = v5;
  if (!v5)
  {
    createMobileStorageError((uint64_t)"MobileStorageMountPersonalizedBundleWithError", 1250, -2, 0, CFSTR("Failed to allocate bundle object."), v6, v7, v8, v18);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_8;
    goto LABEL_7;
  }
  v19 = 0;
  v10 = -[PersonalizedImage mountImage:](v5, "mountImage:", &v19);
  v14 = v19;
  if (!v10)
  {
    createMobileStorageError((uint64_t)"MobileStorageMountPersonalizedBundleWithError", 1255, -2, v14, CFSTR("Failed to mount image."), v11, v12, v13, v18);
    v16 = objc_claimAutoreleasedReturnValue();

    v14 = (id)v16;
    if (!a4)
    {
LABEL_8:
      v15 = 0xFFFFFFFFLL;
      goto LABEL_9;
    }
LABEL_7:
    v14 = v14;
    *a4 = v14;
    goto LABEL_8;
  }
  v15 = 0;
LABEL_9:

  return v15;
}

uint64_t MobileStorageRemoteMountPersonalizedBundleWithError(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  PersonalizedImage *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  PersonalizedImage *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  id v27;

  v12 = a1;
  if (!v12)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteMountPersonalizedBundleWithError", 1278, -3, 0, CFSTR("Invalid input(s)."), v9, v10, v11, v26);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    if (!a5)
      goto LABEL_11;
    goto LABEL_10;
  }
  v13 = -[PersonalizedImage initWithBundleURL:imageVariant:remoteDevice:options:]([PersonalizedImage alloc], "initWithBundleURL:imageVariant:remoteDevice:options:", a2, a3, v12, a4);
  v17 = v13;
  if (!v13)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteMountPersonalizedBundleWithError", 1284, -2, 0, CFSTR("Failed to allocate bundle object."), v14, v15, v16, v26);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    if (!a5)
      goto LABEL_11;
    goto LABEL_10;
  }
  v27 = 0;
  v18 = -[PersonalizedImage mountImage:](v13, "mountImage:", &v27);
  v22 = v27;
  if (!v18)
  {
    createMobileStorageError((uint64_t)"MobileStorageRemoteMountPersonalizedBundleWithError", 1289, -2, v22, CFSTR("Failed to mount image."), v19, v20, v21, v26);
    v24 = objc_claimAutoreleasedReturnValue();

    v22 = (id)v24;
    if (!a5)
    {
LABEL_11:
      v23 = 0xFFFFFFFFLL;
      goto LABEL_12;
    }
LABEL_10:
    v22 = v22;
    *a5 = v22;
    goto LABEL_11;
  }
  v23 = 0;
LABEL_12:

  return v23;
}

id normalizePrivateVar(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v1 = a1;
  if (objc_msgSend(v1, "hasPrefix:", CFSTR("/private/var")))
  {
    objc_msgSend(v1, "componentsSeparatedByString:", CFSTR("/"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v2, "mutableCopy");

    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", &stru_24CE04C20);

    if (v5)
      objc_msgSend(v3, "removeObjectAtIndex:", 0);
    objc_msgSend(v3, "removeObjectAtIndex:", 0);
    v6 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("/"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("/%@"), v7);
    v8 = objc_claimAutoreleasedReturnValue();

    v1 = (id)v8;
  }
  return v1;
}

id copyProgramArgs(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("ProgramArguments"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("Program"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  isNSArray(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    isNSString(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v2;
        _os_log_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Unexpected object: %@", buf, 0xCu);
      }
      v7 = 0;
      goto LABEL_11;
    }
  }
  isNSArray(v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v2, "mutableCopy");
LABEL_10:
    v7 = (void *)v6;
    goto LABEL_11;
  }
  isNSString(v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v2, 0);
    goto LABEL_10;
  }
LABEL_11:

  return v7;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

CFPropertyListRef call_and_response(const char *a1, const void *a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _xpc_connection_s *mach_service;
  _xpc_connection_s *v12;
  CFDataRef Data;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFData *v17;
  xpc_object_t v18;
  const UInt8 *BytePtr;
  size_t v20;
  xpc_object_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  __CFString *v27;
  uint64_t v28;
  int v29;
  CFPropertyListRef v30;
  const UInt8 *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const __CFAllocator *v35;
  const __CFData *v36;
  const __CFData *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *string;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __CFString *v45;
  uint64_t v46;
  uint64_t v48;
  CFErrorRef error;
  size_t length;

  error = 0;
  length = 0;
  if (a1 && a2)
  {
    mach_service = xpc_connection_create_mach_service(a1, 0, 2uLL);
    if (mach_service)
    {
      v12 = mach_service;
      xpc_connection_set_event_handler(mach_service, &__block_literal_global_2);
      xpc_connection_resume(v12);
      Data = CFPropertyListCreateData(0, a2, kCFPropertyListBinaryFormat_v1_0, 0, 0);
      if (!Data)
      {
        createMobileStorageError((uint64_t)"call_and_response", 134, -2, 0, CFSTR("Failed to create dictionary with data."), v14, v15, v16, v48);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        error = 0;
        goto LABEL_27;
      }
      v17 = Data;
      v18 = xpc_dictionary_create(0, 0, 0);
      BytePtr = CFDataGetBytePtr(v17);
      v20 = CFDataGetLength(v17);
      xpc_dictionary_set_data(v18, "EncodedDictionary", BytePtr, v20);
      v21 = xpc_connection_send_message_with_reply_sync(v12, v18);
      if (MEMORY[0x212BF0054]() == MEMORY[0x24BDACFA0])
      {
        v31 = (const UInt8 *)xpc_dictionary_get_data(v21, "EncodedDictionary", &length);
        if (v31)
        {
          v35 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
          v36 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v31, length);
          if (v36)
          {
            v37 = v36;
            v30 = CFPropertyListCreateWithData(v35, v36, 0, 0, &error);
            v26 = 0;
            if (!v30)
            {
              createMobileStorageError((uint64_t)"call_and_response", 171, -2, error, CFSTR("Failed to create dictionary with data."), v38, v39, v40, v48);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
            }
            CFRelease(v37);
            goto LABEL_24;
          }
          v45 = CFSTR("Failed to create data.");
          v46 = 165;
        }
        else
        {
          v45 = CFSTR("Response message missing encoded response.");
          v46 = 145;
        }
        createMobileStorageError((uint64_t)"call_and_response", v46, -2, 0, v45, v32, v33, v34, v48);
      }
      else
      {
        if (MEMORY[0x212BF0054](v21) != MEMORY[0x24BDACFB8])
        {
          v22 = (void *)MEMORY[0x212BF0000](v21);
          createMobileStorageError((uint64_t)"call_and_response", 154, -2, 0, CFSTR("Unexpected message: %s"), v23, v24, v25, (uint64_t)v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          free(v22);
LABEL_23:
          v30 = 0;
LABEL_24:
          CFRelease(v17);
          if (error)
            CFRelease(error);
          error = 0;

LABEL_27:
          xpc_connection_cancel(v12);

          if (!a4)
            goto LABEL_30;
          goto LABEL_28;
        }
        string = xpc_dictionary_get_string(v21, (const char *)*MEMORY[0x24BDACF40]);
        createMobileStorageError((uint64_t)"call_and_response", 150, -2, 0, CFSTR("Client error: %s"), v42, v43, v44, (uint64_t)string);
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_23;
    }
    v27 = CFSTR("Failed to create connection to %s.");
    v48 = (uint64_t)a1;
    v28 = 115;
    v29 = -2;
  }
  else
  {
    v27 = CFSTR("Invalid input(s).");
    v28 = 109;
    v29 = -3;
  }
  createMobileStorageError((uint64_t)"call_and_response", v28, v29, 0, v27, a6, a7, a8, v48);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  error = 0;
  if (!a4)
    goto LABEL_30;
LABEL_28:
  if (!v30)
    *a4 = v26;
LABEL_30:

  return v30;
}

void __call_and_response_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  const char *string;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = a2;
  if (MEMORY[0x212BF0054]() == MEMORY[0x24BDACFB8])
  {
    if (v2 != (id)MEMORY[0x24BDACF38])
    {
      v11 = (void *)MEMORY[0x212BF0000](v2);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
        __call_and_response_block_invoke_cold_1((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
      free(v11);
    }
  }
  else
  {
    string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x24BDACF40]);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      __call_and_response_block_invoke_cold_2((uint64_t)string, v4, v5, v6, v7, v8, v9, v10);
  }

}

void *call_and_response_remote()
{
  void *v0;
  _QWORD *v1;
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  pid_t v17;
  int v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  dispatch_semaphore_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  xpc_object_t v43;
  void *v44;
  void *v45;
  void *v46;
  __CFString *v47;
  uint64_t v48;
  int *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  uint64_t v64;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _OWORD *v79;
  _QWORD *v80;
  id v81;
  void *v82;
  void *v83;
  _OWORD v84[16];
  char buffer[4096];
  uint64_t v86;

  v0 = (void *)MEMORY[0x24BDAC7A8]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v86 = *MEMORY[0x24BDAC8D0];
  v12 = v0;
  if (!v4)
  {
    createMobileStorageError((uint64_t)"call_and_response_remote", 211, -3, 0, CFSTR("Invalid input."), v9, v10, v11, v78);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v82 = 0;
    v83 = 0;
LABEL_16:
    v43 = 0;
    v44 = 0;
    v45 = 0;
    v16 = 0;
LABEL_17:
    v46 = 0;
    if (!v2)
      goto LABEL_39;
    goto LABEL_37;
  }
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v4);
  if (!v16)
  {
    createMobileStorageError((uint64_t)"call_and_response_remote", 217, -2, 0, CFSTR("Failed to create dictionary."), v13, v14, v15, v78);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v82 = 0;
    v83 = 0;
    v4 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
    goto LABEL_17;
  }
  bzero(buffer, 0x1000uLL);
  memset(v84, 0, sizeof(v84));
  v17 = getpid();
  proc_pidpath(v17, buffer, 0x1000u);
  v18 = strlen(buffer);
  if ((v18 & 0x80000000) == 0)
  {
    do
    {
      if (buffer[v18] == 47)
        break;
    }
    while (v18-- > 0);
  }
  __strlcpy_chk();
  v79 = v84;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"));
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v83 = v16;
  if (!v23)
  {
    createMobileStorageError((uint64_t)"call_and_response_remote", 223, -2, 0, CFSTR("Failed to retrieve process name."), v20, v21, v22, (uint64_t)v84);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    v82 = 0;
    v4 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v23, CFSTR("HostProcessName"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v12;
  v26 = v24;
  v30 = dispatch_semaphore_create(0);
  v82 = v23;
  if (!v30)
  {
    v47 = CFSTR("Failed to create semaphore.");
    v48 = 53;
LABEL_22:
    createMobileStorageError((uint64_t)"copyRemoteServiceConnection", v48, -2, 0, v47, v27, v28, v29, (uint64_t)v79);
    goto LABEL_23;
  }
  if (remote_device_get_state() != 2)
  {
    createMobileStorageError((uint64_t)"copyRemoteServiceConnection", 58, -2, 0, CFSTR("Remote device not connected after %u seconds."), v31, v32, v33, 60);
LABEL_23:
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0;
    goto LABEL_24;
  }
  v34 = objc_retainAutorelease(v26);
  objc_msgSend(v34, "UTF8String");
  v35 = remote_device_copy_service();
  if (!v35)
  {
    __error();
    v49 = __error();
    strerror(*v49);
    v47 = CFSTR("Failed to connect to remote service %@: %d (%s)");
    v79 = v34;
    v48 = 64;
    goto LABEL_22;
  }
  v36 = (void *)v35;
  dispatch_get_global_queue(25, 0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)xpc_remote_connection_create_with_remote_service();

  if (v16)
  {
    xpc_remote_connection_set_event_handler();
    xpc_remote_connection_activate();
    v41 = 0;
    goto LABEL_25;
  }
  createMobileStorageError((uint64_t)"copyRemoteServiceConnection", 70, -2, 0, CFSTR("Failed to create remote connection."), v38, v39, v40, (uint64_t)v84);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_24:
  v41 = objc_retainAutorelease(v50);

  v16 = 0;
LABEL_25:
  v80 = v2;

  v42 = v41;
  if (!v16)
  {
    createMobileStorageError((uint64_t)"call_and_response_remote", 231, -2, v42, CFSTR("Failed to create remote connection to %s."), v51, v52, v53, v8);
    v63 = v12;
    v64 = objc_claimAutoreleasedReturnValue();

    v23 = 0;
    v4 = 0;
    v43 = 0;
    v44 = 0;
    v45 = 0;
LABEL_35:
    v46 = 0;
    goto LABEL_36;
  }
  v45 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (!v45)
  {
    createMobileStorageError((uint64_t)"call_and_response_remote", 237, -2, v42, CFSTR("Failed to create XPC dictionary (%@)."), v54, v55, v56, (uint64_t)v83);
    v63 = v12;
    v64 = objc_claimAutoreleasedReturnValue();

    v23 = 0;
    v4 = 0;
    v43 = 0;
LABEL_34:
    v44 = 0;
    goto LABEL_35;
  }
  v43 = xpc_dictionary_create(0, 0, 0);
  if (!v43)
  {
    createMobileStorageError((uint64_t)"call_and_response_remote", 243, -2, 0, CFSTR("Failed to create xpc dictionary."), v57, v58, v59, (uint64_t)v79);
    v63 = v12;
    v64 = objc_claimAutoreleasedReturnValue();

    v23 = 0;
    v4 = 0;
    goto LABEL_34;
  }
  if (!v6)
  {
    v46 = 0;
    goto LABEL_43;
  }
  v46 = (void *)xpc_file_transfer_create_with_path();
  if (v46)
  {
    xpc_dictionary_set_value(v43, "XPCRequestRecvTx", v46);
LABEL_43:
    xpc_dictionary_set_value(v43, "XPCRequestDictionary", v45);
    v66 = xpc_remote_connection_send_message_with_reply_sync();
    v44 = (void *)v66;
    if (v66)
    {
      v81 = v12;
      if (MEMORY[0x212BF0054](v66) == MEMORY[0x24BDACFA0])
      {
        v23 = (id)_CFXPCCreateCFObjectFromXPCObject();
        isNSDictionary(v23);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        if (v4)
        {
          v23 = v23;
          v4 = v23;
LABEL_52:
          v12 = v81;
          if (!v2)
            goto LABEL_39;
          goto LABEL_37;
        }
        createMobileStorageError((uint64_t)"call_and_response_remote", 277, -2, 0, CFSTR("Failed to create dictionary from XPC message."), v75, v76, v77, (uint64_t)v79);
        v74 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v70 = (void *)MEMORY[0x212BF0000](v44);
        createMobileStorageError((uint64_t)"call_and_response_remote", 270, -2, 0, CFSTR("Unexpected message: %s"), v71, v72, v73, (uint64_t)v70);
        v74 = objc_claimAutoreleasedReturnValue();

        free(v70);
        v23 = 0;
        v4 = 0;
      }
      v42 = (id)v74;
      goto LABEL_52;
    }
    createMobileStorageError((uint64_t)"call_and_response_remote", 264, -2, 0, CFSTR("Failed to receive XPC reply."), v67, v68, v69, (uint64_t)v79);
    v63 = v12;
    v64 = objc_claimAutoreleasedReturnValue();

    v23 = 0;
    v4 = 0;
    goto LABEL_36;
  }
  createMobileStorageError((uint64_t)"call_and_response_remote", 253, -2, 0, CFSTR("Failed to create xpc file transfer for %s."), v60, v61, v62, v6);
  v63 = v12;
  v64 = objc_claimAutoreleasedReturnValue();

  v23 = 0;
  v4 = 0;
  v44 = 0;
LABEL_36:
  v42 = (id)v64;
  v12 = v63;
  v2 = v80;
  if (!v80)
    goto LABEL_39;
LABEL_37:
  if (!v4)
    *v2 = v42;
LABEL_39:
  if (v16)
    xpc_remote_connection_cancel();

  return v4;
}

void __call_and_response_remote_block_invoke(uint64_t a1, int a2)
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    __call_and_response_remote_block_invoke_cold_1(a2);
}

uint64_t copy_remote_device_property()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v0 = remote_device_copy_property();
  v1 = (void *)v0;
  if (v0)
  {
    if (MEMORY[0x212BF0054](v0) == MEMORY[0x24BDACFF8])
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", xpc_uint64_get_value(v1));
      v2 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = _CFXPCCreateCFObjectFromXPCObject();
    }
    v3 = v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void get_mounted_media_entries_cold_1(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_1(&dword_2126BE000, MEMORY[0x24BDACB70], (uint64_t)a3, "Skipping %@, as we didn't mount it.", a1);
}

void create_map_entry_cold_1(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = a1;
  v4 = 2112;
  v5 = a2;
  _os_log_fault_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Failed to load version dictionary at %@ (image version: %@).", (uint8_t *)&v2, 0x16u);
}

void get_attached_media_entries_cold_1(uint8_t *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0(&dword_2126BE000, MEMORY[0x24BDACB70], a3, "Ignoring EFI partition.", a1);
}

void get_attached_media_entries_cold_2(uint8_t *a1, _BYTE *a2, uint64_t a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0(&dword_2126BE000, MEMORY[0x24BDACB70], a3, "Ignoring Apple_partition_map partition.", a1);
}

void get_attached_media_entries_cold_3(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_1(&dword_2126BE000, MEMORY[0x24BDACB70], (uint64_t)a3, "The attached media %@ is not a leaf, ignoring.", a1);
}

void get_attached_media_entries_cold_4(uint8_t *a1, uint64_t a2, _QWORD *a3)
{
  *(_DWORD *)a1 = 138412290;
  *a3 = a2;
  OUTLINED_FUNCTION_1(&dword_2126BE000, MEMORY[0x24BDACB70], (uint64_t)a3, "The attached media %@ is not removable, ignoring.", a1);
}

void lookup_map_entries_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0(&dword_2126BE000, MEMORY[0x24BDACB70], a3, "Failed to retrieve the list of attached devices.", v3);
}

void __call_and_response_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2126BE000, MEMORY[0x24BDACB70], a3, "Unexpected message: %s", a5, a6, a7, a8, 2u);
}

void __call_and_response_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_2126BE000, MEMORY[0x24BDACB70], a3, "Client error: %s", a5, a6, a7, a8, 2u);
}

void __call_and_response_remote_block_invoke_cold_1(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_debug_impl(&dword_2126BE000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "xpc_file_transfer_create_with_path completed with error: %d", (uint8_t *)v1, 8u);
}

uint64_t AMAuthInstallCreate()
{
  return MEMORY[0x24BEDA6C8]();
}

uint64_t AMAuthInstallLogSetHandler()
{
  return MEMORY[0x24BEDA6D0]();
}

uint64_t AMAuthInstallRequestSendSync()
{
  return MEMORY[0x24BEDA6E0]();
}

uint64_t AMAuthInstallSetSigningServerURL()
{
  return MEMORY[0x24BEDA6F0]();
}

uint64_t AMAuthInstallSsoEnable()
{
  return MEMORY[0x24BEDA6F8]();
}

uint64_t AMAuthInstallSsoInitialize()
{
  return MEMORY[0x24BEDA700]();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC328](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC330](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC338](c, data, *(_QWORD *)&len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC380](md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC388](c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC390](c, data, *(_QWORD *)&len);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x24BDBBAE0](bundle, key);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD7EB0](*(_QWORD *)&mainPort, *(_QWORD *)&options, bsdName);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x24BDD86B8](*(_QWORD *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x24BDD8700](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x24BDD88A8](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x24BDD88C0](*(_QWORD *)&mainPort, path);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return MEMORY[0x24BDD88D0](*(_QWORD *)&entry, plane, iterator);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x24BDD88F0](*(_QWORD *)&entry, plane, parent);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x24BDBCF80]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x24BDBD138]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x24BDBD148]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x24BDADBA8]();
}

uint64_t cryptex_copy_list_4MSM()
{
  return MEMORY[0x24BEDBA10]();
}

uint64_t cryptex_msm_array_destroy()
{
  return MEMORY[0x24BEDBA18]();
}

uint64_t cryptex_msm_get_string()
{
  return MEMORY[0x24BEDBA20]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int getfsstat(statfs *a1, int a2, int a3)
{
  return MEMORY[0x24BDAE608](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

int lchflags(const char *a1, __uint32_t a2)
{
  return MEMORY[0x24BDAEA18](a1, *(_QWORD *)&a2);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAEB28](a1, a2);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_parse_boot_arg_int()
{
  return MEMORY[0x24BDAF3D8]();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x24BDAF4B0]();
}

uint64_t os_variant_is_recovery()
{
  return MEMORY[0x24BDAF4F0]();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF708](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x24BDAFAC0](a1, a2);
}

uint64_t remote_device_copy_property()
{
  return MEMORY[0x24BE7ED28]();
}

uint64_t remote_device_copy_service()
{
  return MEMORY[0x24BE7ED30]();
}

uint64_t remote_device_get_state()
{
  return MEMORY[0x24BE7ED50]();
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x24BDAFB40](path, state, *(_QWORD *)&flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return (removefile_state_t)MEMORY[0x24BDAFB48]();
}

int removefile_state_free(removefile_state_t a1)
{
  return MEMORY[0x24BDAFB50](a1);
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return MEMORY[0x24BDAFB58](state, *(_QWORD *)&key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return MEMORY[0x24BDAFB60](state, *(_QWORD *)&key, value);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x24BDAFF88](__big, __little, __len);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

uint64_t xpc_file_transfer_create_with_path()
{
  return MEMORY[0x24BDB0A58]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

uint64_t xpc_remote_connection_activate()
{
  return MEMORY[0x24BE7EE90]();
}

uint64_t xpc_remote_connection_cancel()
{
  return MEMORY[0x24BE7EEA0]();
}

uint64_t xpc_remote_connection_create_with_remote_service()
{
  return MEMORY[0x24BE7EEB0]();
}

uint64_t xpc_remote_connection_send_message_with_reply_sync()
{
  return MEMORY[0x24BE7EEC8]();
}

uint64_t xpc_remote_connection_set_event_handler()
{
  return MEMORY[0x24BE7EED8]();
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x24BDB0BE0](xuint);
}

