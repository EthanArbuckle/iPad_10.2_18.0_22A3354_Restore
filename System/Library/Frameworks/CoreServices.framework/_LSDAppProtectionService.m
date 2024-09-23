@implementation _LSDAppProtectionService

+ (void)setHiddenApplications:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)a1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHiddenApplications:completion:", v8, v6);

}

+ (void)getHiddenApplicationsWithCompletion:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)a1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getHiddenApplicationsWithCompletion:", v5);

}

+ (void)setLockedApplications:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)a1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLockedApplications:completion:", v8, v6);

}

+ (void)getLockedApplicationsWithCompletion:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  +[_LSDService XPCProxyWithErrorHandler:]((uint64_t)a1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getLockedApplicationsWithCompletion:", v5);

}

+ (unsigned)connectionType
{
  return 14;
}

+ (Class)clientClass
{
  return (Class)objc_opt_class();
}

+ (id)XPCInterface
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __40___LSDAppProtectionService_XPCInterface__block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a2;
  v3[5] = a1;
  if (+[_LSDAppProtectionService XPCInterface]::once != -1)
    dispatch_once(&+[_LSDAppProtectionService XPCInterface]::once, v3);
  return (id)+[_LSDAppProtectionService XPCInterface]::result;
}

@end
