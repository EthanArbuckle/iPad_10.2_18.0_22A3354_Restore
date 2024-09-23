@implementation _LSDDeviceIdentifierService

+ (unsigned)connectionType
{
  return 7;
}

+ (id)XPCInterface
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43___LSDDeviceIdentifierService_XPCInterface__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (+[_LSDDeviceIdentifierService XPCInterface]::once != -1)
    dispatch_once(&+[_LSDDeviceIdentifierService XPCInterface]::once, v3);
  return (id)+[_LSDDeviceIdentifierService XPCInterface]::result;
}

+ (Class)clientClass
{
  return (Class)objc_opt_class();
}

+ (id)vendorNameForDeviceIdentifiersWithContext:(LSContext *)a3 bundleUnit:(unsigned int)a4 bundleData:(const LSBundleData *)a5
{
  __CFString *v5;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = 0;
  if (a3 && a4 && a5)
  {
    v5 = (__CFString *)_CSStringCopyCFString();
    if (v5)
      goto LABEL_5;
    v8 = (void *)_CSStringCopyCFString();
    if (!v8)
    {
      v5 = 0;
      return v5;
    }
    v9 = v8;
    if ((objc_msgSend(v9, "hasPrefix:", CFSTR("com.apple.")) & 1) != 0)
    {
      v5 = CFSTR("Apple Inc.");
    }
    else
    {
      objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("."));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");

      if ((unint64_t)objc_msgSend(v11, "count") >= 2)
      {
        objc_msgSend(v11, "removeLastObject");
        v12 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v11, "componentsJoinedByString:", CFSTR("."));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", CFSTR("BundleID:%@"), v13);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BundleID:%@"), v9);
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

    }
    if (v5)
    {
LABEL_5:
      if ((*((_BYTE *)&a5->_clas + 6) & 0x20) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Beta:%@"), v5);
        v7 = objc_claimAutoreleasedReturnValue();

        v5 = (__CFString *)v7;
      }
    }
  }
  return v5;
}

+ (void)clearIdentifiersForUninstallationWithContext:(LSContext *)a3 bundleUnit:(unsigned int)a4 bundleData:(const LSBundleData *)a5
{
  void *v6;
  void *v7;
  id v8;

  if (a3 && a4)
  {
    if (a5)
    {
      objc_msgSend(a1, "vendorNameForDeviceIdentifiersWithContext:bundleUnit:bundleData:");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v6 = (void *)_CSStringCopyCFString();
      +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)a1, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "clearIdentifiersForUninstallationWithVendorName:bundleIdentifier:", v8, v6);

    }
  }
}

+ (void)generateIdentifiersForInstallationWithContext:(LSContext *)a3 bundleUnit:(unsigned int)a4 bundleData:(const LSBundleData *)a5
{
  uint64_t v6;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  audit_token_t v15;
  audit_token_t v16;

  v6 = *(_QWORD *)&a4;
  +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)a1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v16, 0, sizeof(v16));
  +[_LSDServiceDomain defaultServiceDomain]();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _LSDServiceGetXPCConnection(a1, (uint64_t)v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    objc_msgSend(v11, "auditToken");
  else
    memset(&v16, 0, sizeof(v16));

  if (a3)
  {
    if ((_DWORD)v6)
    {
      if (a5)
      {
        v15 = v16;
        if ((a5->_bundleFlags & 0x18000000) == 0 || softLinkba_is_process_extension(&v15))
        {
          objc_msgSend(a1, "vendorNameForDeviceIdentifiersWithContext:bundleUnit:bundleData:", a3, v6, a5, *(_OWORD *)v15.val, *(_OWORD *)&v15.val[4]);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)_CSStringCopyCFString();
          objc_msgSend(v9, "generateIdentifiersWithVendorName:bundleIdentifier:", v13, v14);

        }
      }
    }
  }

}

@end
