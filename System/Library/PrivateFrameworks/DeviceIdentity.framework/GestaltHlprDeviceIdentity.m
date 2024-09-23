@implementation GestaltHlprDeviceIdentity

+ (id)getSharedInstance
{
  if (getSharedInstance_once != -1)
    dispatch_once(&getSharedInstance_once, &__block_literal_global_3);
  return (id)getSharedInstance_sharedInstance;
}

void __46__GestaltHlprDeviceIdentity_getSharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)getSharedInstance_sharedInstance;
  getSharedInstance_sharedInstance = v0;

}

- (id)copyAnswer:(__CFString *)a3
{
  void *v4;
  const __CFString *v5;

  if (!a3)
    return 0;
  v4 = (void *)MGCopyAnswer();
  objc_msgSend(CFSTR("com.apple.mobileactivationd"), "UTF8String");
  if (os_variant_allows_internal_security_policies() && is_virtual_machine())
  {
    if ((-[__CFString isEqualToString:](a3, "isEqualToString:", CFSTR("ProductType")) & 1) != 0)
    {
      v5 = CFSTR("iPod5,1");
LABEL_9:

      return (id)v5;
    }
    if (-[__CFString isEqualToString:](a3, "isEqualToString:", CFSTR("DeviceClass")))
    {
      v5 = CFSTR("iPod");
      goto LABEL_9;
    }
  }
  return v4;
}

- (BOOL)getBoolAnswer:(__CFString *)a3
{
  id v3;
  void *v4;

  v3 = -[GestaltHlprDeviceIdentity copyAnswer:](self, "copyAnswer:", a3);
  isNSNumber(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "BOOLValue");
  return (char)v3;
}

- (void)addAGestaltKey:(__CFString *)a3 toDictionary:(id)a4 required:(BOOL)a5 errors:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;

  v7 = a5;
  v17 = a4;
  v10 = a6;
  v11 = -[GestaltHlprDeviceIdentity copyAnswer:](self, "copyAnswer:", a3);
  v12 = v11;
  if (v11
    && ((isNSString(v11), (v13 = objc_claimAutoreleasedReturnValue()) == 0)
     || (v14 = (void *)v13, v15 = objc_msgSend(v12, "length"), v14, v15)))
  {
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, a3);
  }
  else if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to query required gestalt key: %@"), a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v16);

  }
}

- (id)copyDeviceIDInfo:(id *)a3
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("SerialNumber"), v6, 1, v5);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("UniqueDeviceID"), v6, 1, v5);
  v7 = objc_msgSend(v5, "count");
  if (a3 && v7)
    *a3 = objc_retainAutorelease(v5);

  return v6;
}

- (id)copyDeviceInfo:(id *)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("DeviceClass"), v6, 1, v5);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("ProductType"), v6, 1, v5);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("BuildVersion"), v6, 1, v5);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("ModelNumber"), v6, 0, v5);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("ProductVersion"), v6, 1, v5);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("RegionCode"), v6, 0, v5);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("RegionInfo"), v6, 0, v5);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("RegulatoryModelNumber"), v6, 0, v5);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("ReleaseType"), v6, 0, v5);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("UniqueChipID"), v6, 1, v5);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("DeviceVariant"), v6, 0, v5);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("SigningFuse"), v6, 0, v5);
  v7 = -[GestaltHlprDeviceIdentity copyAnswer:](self, "copyAnswer:", CFSTR("ProductName"));
  if (v7)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("OSType"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to query required gestalt key: %@"), CFSTR("ProductName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

  }
  v9 = objc_msgSend(v5, "count");
  if (a3 && v9)
    *a3 = objc_retainAutorelease(v5);

  return v6;
}

- (id)copyRegulatoryImagesInfo:(id *)a3
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("DeviceVariant"), v6, 1, v5);
  v7 = objc_msgSend(v5, "count");
  if (a3 && v7)
    *a3 = objc_retainAutorelease(v5);

  return v6;
}

- (void)updateRecertInfo:(id)a3 errors:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = v6;
  if (v10)
  {
    -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("SerialNumber"), v10, 0, v6);
    -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("DeviceClass"), v10, 1, v7);
    -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("ProductType"), v10, 1, v7);
    -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("BuildVersion"), v10, 0, v7);
    -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("UniqueDeviceID"), v10, 0, v7);
    if (-[GestaltHlprDeviceIdentity getBoolAnswer:](self, "getBoolAnswer:", CFSTR("HasBaseband")))
    {
      -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("InternationalMobileEquipmentIdentity"), v10, 0, v7);
      v8 = -[GestaltHlprDeviceIdentity copyAnswer:](self, "copyAnswer:", CFSTR("xRyzf9zFE/ycr/wJPweZvQ"));
      if (v8)
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("InternationalMobileEquipmentIdentity2"));
      -[GestaltHlprDeviceIdentity addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("MobileEquipmentIdentifier"), v10, 0, v7);
    }
    else
    {
      v8 = 0;
    }
    v9 = objc_msgSend(v7, "count");
    if (a4 && v9)
      *a4 = objc_retainAutorelease(v7);
  }
  else
  {
    v8 = 0;
  }

}

@end
