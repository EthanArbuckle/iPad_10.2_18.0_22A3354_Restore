@implementation CFPrefsFixUpIncomingMessageForPIDImpersonationIfNeeded

void ___CFPrefsFixUpIncomingMessageForPIDImpersonationIfNeeded_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  const void *v5;
  void **v6;
  xpc_object_t EntitlementForMessageWithLockedContext;
  void *v8;
  int v9;
  int v10;
  void *v11;
  __int128 *data;
  __int128 v13;
  void *value;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  size_t length;
  _OWORD buffer[16];
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a2 + 54))
  {
    v6 = (void **)(a1 + 32);
    EntitlementForMessageWithLockedContext = _CFPrefsGetEntitlementForMessageWithLockedContext(*(void **)(a1 + 32), "com.apple.private.defaults-impersonate", a2);
    if (!EntitlementForMessageWithLockedContext
      || (v8 = EntitlementForMessageWithLockedContext,
          object_getClass(EntitlementForMessageWithLockedContext) != (Class)MEMORY[0x1E0C812D0])
      || !xpc_BOOL_get_value(v8))
    {
      v9 = *(unsigned __int8 *)(a2 + 52);
      if (v9 == 1)
        return;
      if (v9 == 255)
      {
        v10 = _CFPrefsSandboxCheckForMessage_0(*v6);
        *(_BYTE *)(a2 + 52) = v10 != 0;
        if (v10)
          return;
      }
      memset(buffer, 0, sizeof(buffer));
      v11 = *v6;
      length = 0;
      v20 = 0u;
      v21 = 0u;
      data = (__int128 *)xpc_dictionary_get_data(v11, "CFPreferencesAuditToken", &length);
      if (data && length == 32)
      {
        v13 = data[1];
        v20 = *data;
        v21 = v13;
      }
      else
      {
        if (!xpc_dictionary_get_remote_connection(v11))
        {
          value = xpc_dictionary_get_value(v11, "connection");
          if (!value || (value = object_getClass(value), value != (void *)MEMORY[0x1E0C812E0]))
            ___CFPrefsFixUpIncomingMessageForPIDImpersonationIfNeeded_block_invoke_cold_2((uint64_t)value, v15, v16);
        }
        xpc_connection_get_audit_token();
      }
      proc_name(SDWORD1(v21), buffer, 0x100u);
      v17 = _CFPrefsDaemonLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        ___CFPrefsFixUpIncomingMessageForPIDImpersonationIfNeeded_block_invoke_cold_1((uint64_t)buffer, (void **)(a1 + 32), v17);
    }
  }
  xpc_dictionary_set_data(*(xpc_object_t *)(a1 + 32), "CFPreferencesAuditToken", *(const void **)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (!*(_BYTE *)(a2 + 54))
  {
    v4 = *(void **)(a2 + 32);
    if (v4)
    {
      *(_QWORD *)(a2 + 32) = 0;
      xpc_release(v4);
    }
    v5 = *(const void **)(a2 + 40);
    if (v5)
    {
      *(_QWORD *)(a2 + 40) = 0;
      CFRelease(v5);
    }
    *(_BYTE *)(a2 + 54) = 1;
  }
}

void ___CFPrefsFixUpIncomingMessageForPIDImpersonationIfNeeded_block_invoke_cold_1(uint64_t a1, void **a2, NSObject *a3)
{
  int v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = _CFPrefsPIDForMessage(*a2);
  v6 = 136446466;
  v7 = a1;
  v8 = 1026;
  v9 = v5;
  _os_log_fault_impl(&dword_182A8C000, a3, OS_LOG_TYPE_FAULT, "Allowing process impersonation by process %{public}s (%{public}d) despite not having the com.apple.private.defaults-impersonate entitlement due to it not being sandboxed. Please add com.apple.private.defaults-impersonate instead, this will stop working in the future.", (uint8_t *)&v6, 0x12u);
}

void ___CFPrefsFixUpIncomingMessageForPIDImpersonationIfNeeded_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_33("_CFPrefsConnectionForMessage", "CFXPreferences_Internal.h", a3, "conn && xpc_get_type(conn) == XPC_TYPE_CONNECTION");
}

@end
