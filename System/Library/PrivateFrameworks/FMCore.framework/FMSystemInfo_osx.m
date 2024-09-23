@implementation FMSystemInfo_osx

- (id)productType
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  size_t size;

  v2 = (void *)productType__productType;
  if (!productType__productType)
  {
    size = 0;
    sysctlbyname("hw.model", 0, &size, 0, 0);
    v3 = malloc_type_malloc(size, 0x27F6A66CuLL);
    sysctlbyname("hw.model", v3, &size, 0, 0);
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v3, 4);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)productType__productType;
      productType__productType = v4;

    }
    free(v3);
    v2 = (void *)productType__productType;
  }
  return v2;
}

- (id)productName
{
  if (productName_onceToken_0 != -1)
    dispatch_once(&productName_onceToken_0, &__block_literal_global_2);
  return (id)productName__value_0;
}

- (id)deviceClass
{
  return CFSTR("Mac");
}

- (id)deviceUDID
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  timespec v7;
  uuid_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)deviceUDID__deviceUDID;
  if (!deviceUDID__deviceUDID)
  {
    memset(v8, 0, sizeof(v8));
    v7 = (timespec)xmmword_1C997ECB0;
    if (gethostuuid(v8, &v7))
    {
      LogCategory_Unspecified();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        -[FMSystemInfo_osx deviceUDID].cold.1(v3);
    }
    else
    {
      v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", v8, 16);
      -[NSObject fm_hexString](v3, "fm_hexString");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)deviceUDID__deviceUDID;
      deviceUDID__deviceUDID = v4;

    }
    v2 = (void *)deviceUDID__deviceUDID;
  }
  return v2;
}

- (id)osVersion
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;

  v2 = (void *)osVersion__osVersion;
  if (!osVersion__osVersion)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      objc_msgSend(v3, "operatingSystemVersion");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu.%lu"), 0, 0, v8);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)osVersion__osVersion;
    osVersion__osVersion = v5;

    v2 = (void *)osVersion__osVersion;
  }
  return v2;
}

- (id)deviceName
{
  return 0;
}

- (id)deviceModelName
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = (void *)deviceModelName__deviceModelName;
  if (!deviceModelName__deviceModelName)
  {
    -[FMSystemInfo_osx productType](self, "productType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789,"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)deviceModelName__deviceModelName;
    deviceModelName__deviceModelName = v6;

    v3 = (void *)deviceModelName__deviceModelName;
  }
  return v3;
}

- (void)deviceUDID
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9967000, log, OS_LOG_TYPE_ERROR, "Error getting device UDID", v1, 2u);
}

@end
