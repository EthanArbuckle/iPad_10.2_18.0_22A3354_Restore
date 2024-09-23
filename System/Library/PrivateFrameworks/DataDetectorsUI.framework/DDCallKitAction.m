@implementation DDCallKitAction

+ (BOOL)hostApplicationIsEntitled
{
  if (hostApplicationIsEntitled_onceToken != -1)
    dispatch_once(&hostApplicationIsEntitled_onceToken, &__block_literal_global_528);
  return hostApplicationIsEntitled_entitled;
}

void __44__DDCallKitAction_hostApplicationIsEntitled__block_invoke()
{
  __SecTask *v0;
  __SecTask *v1;
  CFTypeID TypeID;
  __SecTask *cf;
  __SecTask *cfa;

  v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (v0)
  {
    v1 = v0;
    cf = (__SecTask *)SecTaskCopyValueForEntitlement(v0, CFSTR("com.apple.telephonyutilities.callservicesd"), 0);
    CFRelease(v1);
    v0 = cf;
    if (cf)
    {
      TypeID = CFArrayGetTypeID();
      if (TypeID == CFGetTypeID(cf))
      {
        v0 = cf;
      }
      else
      {
        CFRelease(cf);
        v0 = 0;
      }
    }
  }
  cfa = v0;
  hostApplicationIsEntitled_entitled = -[__SecTask containsObject:](v0, "containsObject:", CFSTR("access-call-providers"));

}

+ (id)callKitProviders
{
  void *v2;
  id v3;
  void *v4;

  if (objc_msgSend(a1, "hostApplicationIsEntitled") && (dd_isDeviceLocked() & 1) == 0)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0DBD1E0]);
    objc_msgSend(v3, "providersPassingTest:", &__block_literal_global_534);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_536);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

uint64_t __35__DDCallKitAction_callKitProviders__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "supportsHandleType:", 2))
    v3 = objc_msgSend(v2, "isSystemProvider") ^ 1;
  else
    v3 = 0;

  return v3;
}

uint64_t __35__DDCallKitAction_callKitProviders__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (int64_t)TTYType
{
  return 1;
}

- (id)localizedName
{
  void *v2;
  void *v3;

  -[DDCallKitAction callProvider](self, "callProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)subtitle
{
  return 0;
}

- (id)dialRequest
{
  void *v3;
  void *v4;

  -[DDCallKitAction callProvider](self, "callProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DDCallAction dialRequestWithProvider:](self, "dialRequestWithProvider:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (TUCallProvider)callProvider
{
  return (TUCallProvider *)objc_getProperty(self, a2, 152, 1);
}

- (void)setCallProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callProvider, 0);
}

@end
