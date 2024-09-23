@implementation MCMPersonasAreSupported

void *__MCMPersonasAreSupported_block_invoke()
{
  uint64_t v0;
  host_t v1;
  kern_return_t multiuser_config_flags;
  int v3;
  int v4;
  int is_system_session;
  int v6;
  int v7;
  BOOL v8;
  int v9;
  BOOL v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  pid_t v18;
  uid_t v19;
  pid_t v20;
  uid_t v21;
  au_asid_t v22;
  const char *v24;
  const char *v25;
  const char *v26;
  void *__s;
  audit_token_t multiuser_flags;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  pid_t v40;
  __int16 v41;
  uid_t v42;
  __int16 v43;
  pid_t v44;
  __int16 v45;
  uid_t v46;
  __int16 v47;
  au_asid_t v48;
  __int16 v49;
  void *v50;
  audit_token_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v0 = objc_opt_class();
  multiuser_flags.val[0] = 0;
  v1 = MEMORY[0x1D17D6F20]();
  multiuser_config_flags = host_get_multiuser_config_flags(v1, multiuser_flags.val);
  v3 = multiuser_flags.val[0];
  v4 = os_variant_uses_ephemeral_storage();
  is_system_session = xpc_is_system_session();
  v6 = MGGetBoolAnswer();
  v7 = v6;
  if (multiuser_config_flags)
    v8 = 0;
  else
    v8 = v3 < 0;
  v9 = !v8;
  v10 = !v8 && v0 != 0;
  MCMPersonasAreSupported_staticPersonasSupported = v10 & ~(_BYTE)v4 & ~(_BYTE)v6 & (is_system_session ^ 1);
  memset(&v51, 0, sizeof(v51));
  container_codesign_get_self_audit_token();
  __s = 0;
  vproc_swap_string();
  container_log_handle_for_category();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (MCMPersonasAreSupported_staticPersonasSupported)
      v12 = "YES";
    else
      v12 = "NO";
    v13 = "!hasUserManager ";
    if (v0)
      v13 = "";
    v25 = v13;
    v26 = v12;
    if (v9)
      v14 = "";
    else
      v14 = "configuredForMultiUser ";
    if (v7)
      v15 = "inDiagnosticsMode ";
    else
      v15 = "";
    if (v4)
      v16 = "usesEphemeralStorage ";
    else
      v16 = "";
    v17 = "isSystemSession";
    if (!is_system_session)
      v17 = "";
    v24 = v17;
    v18 = getpid();
    v19 = getuid();
    multiuser_flags = v51;
    v20 = audit_token_to_pid(&multiuser_flags);
    multiuser_flags = v51;
    v21 = audit_token_to_auid(&multiuser_flags);
    multiuser_flags = v51;
    v22 = audit_token_to_asid(&multiuser_flags);
    multiuser_flags.val[0] = 136318466;
    *(_QWORD *)&multiuser_flags.val[1] = v26;
    LOWORD(multiuser_flags.val[3]) = 2080;
    *(_QWORD *)((char *)&multiuser_flags.val[3] + 2) = v25;
    HIWORD(multiuser_flags.val[5]) = 2080;
    *(_QWORD *)&multiuser_flags.val[6] = v14;
    v29 = 2080;
    v30 = v15;
    v31 = 2080;
    v32 = v16;
    v33 = 2080;
    v34 = "";
    v35 = 2080;
    v36 = "";
    v37 = 2080;
    v38 = v24;
    v39 = 1024;
    v40 = v18;
    v41 = 1024;
    v42 = v19;
    v43 = 1024;
    v44 = v20;
    v45 = 1024;
    v46 = v21;
    v47 = 1024;
    v48 = v22;
    v49 = 2082;
    v50 = __s;
    _os_log_impl(&dword_1CF807000, v11, OS_LOG_TYPE_DEFAULT, "Personas are supported (static): %s (%s%s%s%s%s%s%s) {pid: %d, uid: %d, apid: %d, auid: %d, asid: %d, session: %{public}s}", (uint8_t *)&multiuser_flags, 0x7Au);
  }

  return __s;
}

@end
