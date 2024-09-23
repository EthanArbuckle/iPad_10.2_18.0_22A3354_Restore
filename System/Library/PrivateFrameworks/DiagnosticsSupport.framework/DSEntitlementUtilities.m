@implementation DSEntitlementUtilities

+ (BOOL)currentProcessHasEntitlement:(id)a3
{
  void *v3;
  void *v4;
  BOOL value;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v3 = (void *)xpc_copy_entitlement_for_self();
  v4 = v3;
  if (v3)
  {
    value = xpc_BOOL_get_value(v3);
  }
  else
  {
    DiagnosticLogHandleForCategory(3);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[DSEntitlementUtilities currentProcessHasEntitlement:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);

    value = 0;
  }

  return value;
}

+ (BOOL)auditToken:(id *)a3 hasEntitlement:(id)a4
{
  void *v4;
  void *v5;
  BOOL value;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(objc_retainAutorelease(a4), "UTF8String");
  v4 = (void *)xpc_copy_entitlement_for_token();
  v5 = v4;
  if (v4)
  {
    value = xpc_BOOL_get_value(v4);
  }
  else
  {
    DiagnosticLogHandleForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[DSEntitlementUtilities auditToken:hasEntitlement:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

    value = 0;
  }

  return value;
}

+ (void)currentProcessHasEntitlement:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21F54F000, a1, a3, "Unable to find entitlement for current process", a5, a6, a7, a8, 0);
}

+ (void)auditToken:(uint64_t)a3 hasEntitlement:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21F54F000, a1, a3, "Unable to find entitlement", a5, a6, a7, a8, 0);
}

@end
