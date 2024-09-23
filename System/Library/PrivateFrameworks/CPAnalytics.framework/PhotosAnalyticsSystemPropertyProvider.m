@implementation PhotosAnalyticsSystemPropertyProvider

- (void)registerSystemProperties:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[PhotosAnalyticsSystemPropertyProvider _deviceFreeSpaceDescription](self, "_deviceFreeSpaceDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addProperty:withValue:", CFSTR("cpa_common_deviceFreeSpace"), v4);

  -[PhotosAnalyticsSystemPropertyProvider deviceModel](self, "deviceModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addProperty:withValue:", CFSTR("cpa_common_deviceModel"), v5);

  -[PhotosAnalyticsSystemPropertyProvider osVersion](self, "osVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addProperty:withValue:", CFSTR("cpa_common_osVersion"), v6);

  -[PhotosAnalyticsSystemPropertyProvider process](self, "process");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addProperty:withValue:", CFSTR("cpa_common_processName"), v7);

  objc_msgSend(v8, "addDynamicProperty:withProvider:", CFSTR("cpa_common_lowPowerModeEnabled"), self);
}

- (id)getDynamicProperty:(id)a3 forEventName:(id)a4 payloadForSystemPropertyExtraction:(id)a5
{
  void *v6;

  if (objc_msgSend(a3, "isEqualToString:", CFSTR("cpa_common_lowPowerModeEnabled"), a4, a5))
  {
    -[PhotosAnalyticsSystemPropertyProvider lowPowerModeEnabled](self, "lowPowerModeEnabled");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)percentageOfFreeSpaceOnDevice
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 2uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v4, "attributesOfFileSystemForPath:error:", v3, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;

  if (v6)
    v7 = 1;
  else
    v7 = v5 == 0;
  if (v7)
  {
    CPAnalyticsLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v3;
      v17 = 2112;
      v18 = v6;
      _os_log_error_impl(&dword_20AB22000, v8, OS_LOG_TYPE_ERROR, "Unable to retrieve file system attributes at path %@ error: %@", buf, 0x16u);
    }

    v10 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDD0D28]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "unsignedLongLongValue");

    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BDD0D18]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "unsignedLongLongValue");

    if (v10)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)v12 * 100.0 / (double)(unint64_t)v10);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v10;
}

- (id)_deviceFreeSpaceDescription
{
  void *v2;
  void *v3;
  double v4;
  const __CFString *v5;

  -[PhotosAnalyticsSystemPropertyProvider percentageOfFreeSpaceOnDevice](self, "percentageOfFreeSpaceOnDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    if (v4 <= 2.0)
    {
      v5 = CFSTR("DeviceFreeSpaceCritical");
    }
    else if (v4 > 5.0)
    {
      if (v4 > 15.0)
      {
        if (v4 > 50.0)
        {
          if (v4 > 80.0)
            v5 = CFSTR("DeviceFreeSpaceVeryHigh");
          else
            v5 = CFSTR("DeviceFreeSpaceHigh");
        }
        else
        {
          v5 = CFSTR("DeviceFreeSpaceMedium");
        }
      }
      else
      {
        v5 = CFSTR("DeviceFreeSpaceLow");
      }
    }
    else
    {
      v5 = CFSTR("DeviceFreeSpaceVeryLow");
    }
  }
  else
  {
    v5 = 0;
  }

  return (id)v5;
}

- (id)deviceModel
{
  utsname v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  memset(&v3, 0, 512);
  uname(&v3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v3.machine, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)osVersion
{
  void *v2;
  void *v3;
  utsname v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  memset(&v5, 0, 512);
  uname(&v5);
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "operatingSystemVersionString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)process
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "processName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)lowPowerModeEnabled
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithBool:", objc_msgSend(v3, "isLowPowerModeEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
