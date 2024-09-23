@implementation MSVEntitlementUtilities

+ (BOOL)hasBoolEntitlement:(id)a3 shouldLogForMissingEntitlement:(BOOL)a4
{
  return objc_msgSend(a1, "_checkEntitlement:inGroup:shouldLogForMissingEntitlement:", a3, 0, a4);
}

+ (BOOL)hasBoolEntitlement:(id)a3
{
  return objc_msgSend(a1, "hasBoolEntitlement:shouldLogForMissingEntitlement:", a3, 1);
}

+ (id)_checkArrayEntitlement:(id)a3 group:(id)a4 task:(__SecTask *)a5
{
  id v7;
  __CFString *v8;
  _EntitlementCheckResult *v9;
  void *v10;
  CFTypeID v11;
  CFErrorRef v12;
  CFErrorRef error;

  v7 = a3;
  v8 = (__CFString *)a4;
  v9 = -[_EntitlementCheckResult initWithEntitlement:group:]([_EntitlementCheckResult alloc], "initWithEntitlement:group:", v7, v8);
  error = 0;
  v10 = (void *)SecTaskCopyValueForEntitlement(a5, v8, &error);

  if (v10)
  {
    v11 = CFGetTypeID(v10);
    if (v11 == CFArrayGetTypeID())
      -[_EntitlementCheckResult setEntitled:](v9, "setEntitled:", objc_msgSend(v10, "containsObject:", v7));
    CFRelease(v10);
  }
  v12 = error;
  if (error)
  {
    -[_EntitlementCheckResult setError:](v9, "setError:", error);

    CFRelease(error);
  }

  return v9;
}

+ (BOOL)_checkEntitlement:(id)a3 inGroup:(id)a4 shouldLogForMissingEntitlement:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  SecTaskRef v10;
  SecTaskRef v11;
  _EntitlementCheckResult *v12;
  BOOL v13;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = SecTaskCreateFromSelf(0);
  if (!v10)
    goto LABEL_6;
  v11 = v10;
  if (v9)
    objc_msgSend(a1, "_checkArrayEntitlement:group:task:", v8, v9, v10);
  else
    objc_msgSend(a1, "_checkBooleanEntitlement:task:", v8, v10);
  v12 = (_EntitlementCheckResult *)objc_claimAutoreleasedReturnValue();
  CFRelease(v11);
  if (!v12)
LABEL_6:
    v12 = -[_EntitlementCheckResult initWithEntitlement:group:]([_EntitlementCheckResult alloc], "initWithEntitlement:group:", v8, v9);
  if (v5)
    objc_msgSend(a1, "_logForMissingEntitlementWithResult:", v12);
  v13 = -[_EntitlementCheckResult isEntitled](v12, "isEntitled");

  return v13;
}

+ (void)_logForMissingEntitlementWithResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else if ((objc_msgSend(v4, "isEntitled") & 1) != 0)
  {
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = os_log_create("com.apple.amp.MediaServices", "Entitlements");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v6, "processName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "processIdentifier");
    objc_msgSend(v4, "group");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entitlement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v4, "isEntitled");
    objc_msgSend(v4, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138544898;
    v15 = a1;
    v16 = 2114;
    v17 = v8;
    v18 = 1024;
    v19 = v9;
    v20 = 2114;
    v21 = v10;
    v22 = 2114;
    v23 = v11;
    v24 = 1024;
    v25 = v12;
    v26 = 2114;
    v27 = v13;
    _os_log_impl(&dword_1A077D000, v7, OS_LOG_TYPE_ERROR, "%{public}@ - Process %{public}@ PID[%d] - Group: %{public}@ - Entitlement: %{public}@ - Entitled: %{BOOL}u - Error: %{public}@", (uint8_t *)&v14, 0x40u);

  }
LABEL_7:

}

+ (id)_checkBooleanEntitlement:(id)a3 task:(__SecTask *)a4
{
  __CFString *v5;
  _EntitlementCheckResult *v6;
  CFTypeRef v7;
  CFTypeID v8;
  CFErrorRef v9;
  CFErrorRef error;

  v5 = (__CFString *)a3;
  v6 = -[_EntitlementCheckResult initWithEntitlement:group:]([_EntitlementCheckResult alloc], "initWithEntitlement:group:", v5, 0);
  error = 0;
  v7 = SecTaskCopyValueForEntitlement(a4, v5, &error);

  if (v7)
  {
    v8 = CFGetTypeID(v7);
    if (v8 == CFBooleanGetTypeID())
      -[_EntitlementCheckResult setEntitled:](v6, "setEntitled:", CFBooleanGetValue((CFBooleanRef)v7) != 0);
    CFRelease(v7);
  }
  v9 = error;
  if (error)
  {
    -[_EntitlementCheckResult setError:](v6, "setError:", error);

    CFRelease(error);
  }
  return v6;
}

+ (BOOL)hasEntitlement:(id)a3 inGroup:(id)a4
{
  return objc_msgSend(a1, "hasEntitlement:inGroup:shouldLogForMissingEntitlement:", a3, a4, 1);
}

@end
