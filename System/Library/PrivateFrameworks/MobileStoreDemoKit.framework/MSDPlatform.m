@implementation MSDPlatform

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_shared;
}

void __29__MSDPlatform_sharedInstance__block_invoke()
{
  MSDPlatform *v0;
  void *v1;

  v0 = objc_alloc_init(MSDPlatform);
  v1 = (void *)sharedInstance_shared;
  sharedInstance_shared = (uint64_t)v0;

}

+ (BOOL)iOSHub
{
  if (iOSHub_onceToken != -1)
    dispatch_once(&iOSHub_onceToken, &__block_literal_global_1);
  return iOSHub_isHub;
}

Class __21__MSDPlatform_iOSHub__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("MSDHubBundleManager"));
  iOSHub_isHub = result != 0;
  return result;
}

- (MSDPlatform)init
{
  MSDPlatform *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  NSObject *v6;
  void *v7;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)MSDPlatform;
  v2 = -[MSDPlatform init](&v9, sel_init);
  if (!v2)
    return v2;
  v3 = (void *)MGCopyAnswer();
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("Watch OS")))
    {
      -[MSDPlatform setWatchOS:](v2, "setWatchOS:", 1);
      v5 = CFSTR("watchOS");
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Apple TVOS")))
    {
      -[MSDPlatform setTvOS:](v2, "setTvOS:", 1);
      v5 = CFSTR("tvOS");
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("iPhone OS")))
    {
      -[MSDPlatform setIOS:](v2, "setIOS:", 1);
      v5 = CFSTR("iOS");
    }
    else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("macOS")) & 1) != 0
           || objc_msgSend(v4, "isEqualToString:", CFSTR("Mac OS X")))
    {
      -[MSDPlatform setMacOS:](v2, "setMacOS:", 1);
      v5 = CFSTR("macOS");
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("xrOS")))
        goto LABEL_13;
      -[MSDPlatform setIOS:](v2, "setIOS:", 1);
      -[MSDPlatform setROS:](v2, "setROS:", 1);
      v5 = CFSTR("xrOS");
    }
    -[MSDPlatform setPlatformType:](v2, "setPlatformType:", v5);
  }
LABEL_13:
  defaultLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    -[MSDPlatform platformType](v2, "platformType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v11 = "-[MSDPlatform init]";
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_213A7E000, v6, OS_LOG_TYPE_DEFAULT, "%s: PlatformType '%{public}@'.", buf, 0x16u);

  }
  return v2;
}

- (void)setPlatformWithManifestProductList:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  const __CFString *v8;
  id v9;

  v9 = a3;
  if (-[MSDPlatform tvOS](self, "tvOS") || -[MSDPlatform watchOS](self, "watchOS"))
    goto LABEL_15;
  -[MSDPlatform setWatchOS:](self, "setWatchOS:", 0);
  -[MSDPlatform setTvOS:](self, "setTvOS:", 0);
  -[MSDPlatform setIOS:](self, "setIOS:", 0);
  -[MSDPlatform setMacOS:](self, "setMacOS:", 0);
  -[MSDPlatform setROS:](self, "setROS:", 0);
  if (!objc_msgSend(v9, "count"))
    -[MSDPlatform raiseInvalidProductListExceptionWithReason:](self, "raiseInvalidProductListExceptionWithReason:", CFSTR("Empty product list."));
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    -[MSDPlatform raiseInvalidProductListExceptionWithReason:](self, "raiseInvalidProductListExceptionWithReason:", CFSTR("Product list entry must be of type String."));
  objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "containsString:", CFSTR("iphone")) & 1) != 0
    || (objc_msgSend(v7, "containsString:", CFSTR("ipad")) & 1) != 0
    || objc_msgSend(v7, "containsString:", CFSTR("ipod")))
  {
    -[MSDPlatform setIOS:](self, "setIOS:", 1);
    v8 = CFSTR("iOS");
  }
  else if (objc_msgSend(v7, "containsString:", CFSTR("watch")))
  {
    -[MSDPlatform setWatchOS:](self, "setWatchOS:", 1);
    v8 = CFSTR("watchOS");
  }
  else if (objc_msgSend(v7, "containsString:", CFSTR("appletv")))
  {
    -[MSDPlatform setTvOS:](self, "setTvOS:", 1);
    v8 = CFSTR("tvOS");
  }
  else if ((objc_msgSend(v7, "containsString:", CFSTR("mac")) & 1) != 0
         || objc_msgSend(v7, "containsString:", CFSTR("adp")))
  {
    -[MSDPlatform setMacOS:](self, "setMacOS:", 1);
    v8 = CFSTR("macOS");
  }
  else
  {
    if (!objc_msgSend(v7, "containsString:", CFSTR("realitydevice")))
      goto LABEL_12;
    -[MSDPlatform setROS:](self, "setROS:", 1);
    v8 = CFSTR("xrOS");
  }
  -[MSDPlatform setPlatformType:](self, "setPlatformType:", v8);
LABEL_12:
  if (!-[MSDPlatform isValidProductList:](self, "isValidProductList:", v9))
    -[MSDPlatform raiseInvalidProductListExceptionWithReason:](self, "raiseInvalidProductListExceptionWithReason:", CFSTR("Product list should contain only one product category."));

LABEL_15:
}

- (BOOL)isValidProductList:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_24;
        objc_msgSend(v9, "lowercaseString", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[MSDPlatform watchOS](self, "watchOS")
          && !objc_msgSend(v10, "containsString:", CFSTR("watch"))
          || -[MSDPlatform tvOS](self, "tvOS") && !objc_msgSend(v10, "containsString:", CFSTR("appletv"))
          || -[MSDPlatform iOS](self, "iOS")
          && (objc_msgSend(v10, "containsString:", CFSTR("iphone")) & 1) == 0
          && (objc_msgSend(v10, "containsString:", CFSTR("ipad")) & 1) == 0
          && !objc_msgSend(v10, "containsString:", CFSTR("ipod"))
          || -[MSDPlatform macOS](self, "macOS")
          && (objc_msgSend(v10, "containsString:", CFSTR("mac")) & 1) == 0
          && !objc_msgSend(v10, "containsString:", CFSTR("adp"))
          || -[MSDPlatform rOS](self, "rOS")
          && !objc_msgSend(v10, "containsString:", CFSTR("realitydevice")))
        {

LABEL_24:
          v11 = 0;
          goto LABEL_26;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v11 = 1;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v11 = 1;
  }
LABEL_26:

  return v11;
}

- (void)raiseInvalidProductListExceptionWithReason:(id)a3
{
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("InvalidManifestProductList"), a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  defaultLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[MSDPlatform raiseInvalidProductListExceptionWithReason:]";
    v7 = 2114;
    v8 = v3;
    _os_log_impl(&dword_213A7E000, v4, OS_LOG_TYPE_DEFAULT, "%s - Exception:  %{public}@", (uint8_t *)&v5, 0x16u);
  }

  objc_msgSend(v3, "raise");
}

- (BOOL)watchOS
{
  return self->_watchOS;
}

- (void)setWatchOS:(BOOL)a3
{
  self->_watchOS = a3;
}

- (BOOL)tvOS
{
  return self->_tvOS;
}

- (void)setTvOS:(BOOL)a3
{
  self->_tvOS = a3;
}

- (BOOL)iOS
{
  return self->_iOS;
}

- (void)setIOS:(BOOL)a3
{
  self->_iOS = a3;
}

- (BOOL)macOS
{
  return self->_macOS;
}

- (void)setMacOS:(BOOL)a3
{
  self->_macOS = a3;
}

- (BOOL)rOS
{
  return self->_rOS;
}

- (void)setROS:(BOOL)a3
{
  self->_rOS = a3;
}

- (NSString)platformType
{
  return self->_platformType;
}

- (void)setPlatformType:(id)a3
{
  objc_storeStrong((id *)&self->_platformType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platformType, 0);
}

@end
