@implementation GestaltHlprMobileActivation

+ (id)getSharedInstance
{
  if (getSharedInstance_once != -1)
    dispatch_once(&getSharedInstance_once, &__block_literal_global);
  return (id)getSharedInstance_sharedInstance;
}

void __48__GestaltHlprMobileActivation_getSharedInstance__block_invoke()
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
  id v4;

  v3 = -[GestaltHlprMobileActivation copyAnswer:](self, "copyAnswer:", a3);
  v4 = isNSNumber(v3);

  LOBYTE(v3) = objc_msgSend(v4, "BOOLValue");
  return (char)v3;
}

- (void)addAGestaltKey:(__CFString *)a3 toDictionary:(id)a4 required:(BOOL)a5 errors:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;

  v7 = a5;
  v10 = a4;
  v11 = a6;
  v12 = -[GestaltHlprMobileActivation copyAnswer:](self, "copyAnswer:", a3);
  v13 = v12;
  if (v12
    && ((v14 = isNSString(v12)) == 0
     || (v15 = v14, v16 = objc_msgSend(v13, "length"), v15, v16)))
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, a3);
  }
  else if (v7)
  {
    v17 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to query required gestalt key: %@"), a3);
    objc_msgSend(v11, "addObject:", v17);

  }
}

- (id)copyDeviceIDInfo:(id *)a3
{
  id v5;
  id v6;
  uint64_t v7;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[GestaltHlprMobileActivation addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("SerialNumber"), v6, 1, v5);
  -[GestaltHlprMobileActivation addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("UniqueDeviceID"), v6, 1, v5);
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
  id v8;
  uint64_t v9;

  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[GestaltHlprMobileActivation addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("DeviceClass"), v6, 1, v5);
  -[GestaltHlprMobileActivation addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("ProductType"), v6, 1, v5);
  -[GestaltHlprMobileActivation addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("BuildVersion"), v6, 1, v5);
  -[GestaltHlprMobileActivation addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("ModelNumber"), v6, 0, v5);
  -[GestaltHlprMobileActivation addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("ProductVersion"), v6, 1, v5);
  -[GestaltHlprMobileActivation addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("RegionCode"), v6, 0, v5);
  -[GestaltHlprMobileActivation addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("RegionInfo"), v6, 0, v5);
  -[GestaltHlprMobileActivation addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("RegulatoryModelNumber"), v6, 0, v5);
  -[GestaltHlprMobileActivation addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("ReleaseType"), v6, 0, v5);
  -[GestaltHlprMobileActivation addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("UniqueChipID"), v6, 1, v5);
  -[GestaltHlprMobileActivation addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("DeviceVariant"), v6, 0, v5);
  -[GestaltHlprMobileActivation addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("SigningFuse"), v6, 0, v5);
  v7 = -[GestaltHlprMobileActivation copyAnswer:](self, "copyAnswer:", CFSTR("ProductName"));
  if (v7)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("OSType"));
  }
  else
  {
    v8 = (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to query required gestalt key: %@"), CFSTR("ProductName"));
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
  -[GestaltHlprMobileActivation addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("DeviceVariant"), v6, 1, v5);
  v7 = objc_msgSend(v5, "count");
  if (a3 && v7)
    *a3 = objc_retainAutorelease(v5);

  return v6;
}

- (void)updateRecertInfo:(id)a3 errors:(id *)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v6)
  {
    -[GestaltHlprMobileActivation addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("SerialNumber"), v6, 0, v7);
    -[GestaltHlprMobileActivation addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("DeviceClass"), v6, 1, v7);
    -[GestaltHlprMobileActivation addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("ProductType"), v6, 1, v7);
    -[GestaltHlprMobileActivation addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("BuildVersion"), v6, 0, v7);
    -[GestaltHlprMobileActivation addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("UniqueDeviceID"), v6, 0, v7);
    if (-[GestaltHlprMobileActivation getBoolAnswer:](self, "getBoolAnswer:", CFSTR("HasBaseband")))
    {
      -[GestaltHlprMobileActivation addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("InternationalMobileEquipmentIdentity"), v6, 0, v7);
      v8 = -[GestaltHlprMobileActivation copyAnswer:](self, "copyAnswer:", CFSTR("xRyzf9zFE/ycr/wJPweZvQ"));
      if (v8)
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("InternationalMobileEquipmentIdentity2"));
      -[GestaltHlprMobileActivation addAGestaltKey:toDictionary:required:errors:](self, "addAGestaltKey:toDictionary:required:errors:", CFSTR("MobileEquipmentIdentifier"), v6, 0, v7);
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
