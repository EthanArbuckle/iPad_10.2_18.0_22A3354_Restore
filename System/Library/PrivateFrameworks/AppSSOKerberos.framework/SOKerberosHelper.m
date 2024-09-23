@implementation SOKerberosHelper

- (gss_cred_id_t_desc_struct)acquireCredentialForUUID:(id)a3
{
  id v3;
  NSObject *v4;
  __CFString *v5;
  const __CFUUID *v6;
  const __CFUUID *v7;
  gss_cred_id_t_desc_struct *v8;
  OM_uint32 v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  OM_uint32 lifetime[2];

  v3 = a3;
  SO_LOG_SOKerberosHelper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[SOKerberosHelper acquireCredentialForUUID:].cold.2();

  if (!v3)
  {
    v8 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v3, "UUIDString");
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((-[__CFString isEqualToString:](v5, "isEqualToString:", &stru_24D3EC758) & 1) != 0
    || (v6 = CFUUIDCreateFromString(0, v5)) == 0)
  {
    *(_QWORD *)lifetime = 0;
    goto LABEL_14;
  }
  v7 = v6;
  v8 = GSSCreateCredentialFromUUID(v6);
  CFRelease(v7);
  *(_QWORD *)lifetime = 0;
  if (!v8)
  {
LABEL_14:
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("failed to find credential: %@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    SO_LOG_SOKerberosHelper();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[SOKerberosHelper acquireCredentialForUUID:].cold.1();

    v8 = 0;
    goto LABEL_17;
  }
  v9 = gss_inquire_cred(&lifetime[1], v8, 0, lifetime, 0, 0);
  if (lifetime[0])
    v10 = v9 == 0;
  else
    v10 = 0;
  if (!v10)
    v8 = 0;
LABEL_17:

LABEL_19:
  return v8;
}

- (gss_cred_id_t_desc_struct)acquireCredentialForUPN:(id)a3
{
  id v4;
  NSObject *v5;
  unsigned int v6;
  id v7;
  void *v8;
  NSObject *v9;
  gss_cred_id_t_desc_struct *v10;
  gss_OID_set oid_set;
  id v13;
  gss_name_t desired_name;
  OM_uint32 minor_status[2];
  gss_cred_id_t output_cred_handle;

  v4 = a3;
  SO_LOG_SOKerberosHelper();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SOKerberosHelper acquireCredentialForUPN:].cold.2();

  *(_QWORD *)minor_status = 0;
  output_cred_handle = 0;
  v13 = 0;
  desired_name = 0;
  v6 = -[SOKerberosHelper createGSSName:gname:error:](self, "createGSSName:gname:error:", v4, &desired_name, &v13);

  v7 = v13;
  v8 = v7;
  if (v6)
  {
    if (v7)
    {
      SO_LOG_SOKerberosHelper();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SOKerberosHelper acquireCredentialForUPN:].cold.1();

    }
  }
  else
  {
    oid_set = 0;
    gss_create_empty_oid_set(&minor_status[1], &oid_set);
    gss_add_oid_set_member(&minor_status[1], MEMORY[0x24BDD1A80], &oid_set);
    if (!gss_acquire_cred(&minor_status[1], desired_name, 0xFFFFFFFF, oid_set, 1, &output_cred_handle, 0, minor_status)&& !gss_inquire_cred(&minor_status[1], output_cred_handle, 0, minor_status, 0, 0)&& minor_status[0])
    {
      gss_release_name(&minor_status[1], &desired_name);
      gss_release_oid_set(&minor_status[1], &oid_set);
      v10 = output_cred_handle;
      goto LABEL_11;
    }
    gss_release_oid_set(&minor_status[1], &oid_set);
    gss_release_name(&minor_status[1], &desired_name);
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)_testForUPNForUser:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  const char *v9;
  uint8_t *v10;
  __int16 v12;
  __int16 v13;
  uint64_t v14;

  v3 = (void *)MEMORY[0x24BDD1798];
  v14 = 0;
  v4 = a3;
  objc_msgSend(v3, "regularExpressionWithPattern:options:error:", CFSTR("@"), 1, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "numberOfMatchesInString:options:range:", v4, 0, 0, objc_msgSend(v4, "length"));

  SO_LOG_SOKerberosHelper();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6 < 2)
  {
    if (v8)
    {
      v12 = 0;
      v9 = "kerbGetTGTForUser: User entered a standard username in the username field.";
      v10 = (uint8_t *)&v12;
      goto LABEL_6;
    }
  }
  else if (v8)
  {
    v13 = 0;
    v9 = "kerbGetTGTForUser: User entered a UPN in the username field.";
    v10 = (uint8_t *)&v13;
LABEL_6:
    _os_log_impl(&dword_215A1B000, v7, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
  }

  return v6 > 1;
}

- (BOOL)changePasswordForUPN:(id)a3 realm:(id)a4 withOldPassword:(id)a5 withNewPassword:(id)a6 withError:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  const __CFDictionary *v18;
  unsigned int v19;
  NSObject *v20;
  BOOL v21;
  gss_name_t name;
  CFErrorRef error;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  SO_LOG_SOKerberosHelper();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[SOKerberosHelper changePasswordForUPN:realm:withOldPassword:withNewPassword:withError:].cold.2();

  error = 0;
  v17 = objc_retainAutorelease(v14);
  objc_msgSend(v17, "UTF8String");

  __ApplePrivate_gsskrb5_set_default_realm();
  v25[0] = CFSTR("kGSSChangePasswordOldPassword");
  v25[1] = CFSTR("kGSSChangePasswordNewPassword");
  v26[0] = v12;
  v26[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v18 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  name = 0;
  v19 = -[SOKerberosHelper createGSSName:gname:error:](self, "createGSSName:gname:error:", v15, &name, a7);

  if (v19)
  {
    if (*a7)
    {
      SO_LOG_SOKerberosHelper();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[SOKerberosHelper changePasswordForUPN:realm:withOldPassword:withNewPassword:withError:].cold.1();

    }
  }
  else
  {
    if (!gss_aapl_change_password(name, MEMORY[0x24BDD1A80], v18, &error))
    {
      v21 = 1;
      goto LABEL_9;
    }
    if (a7)
    {
      v21 = 0;
      *a7 = objc_retainAutorelease(error);
      goto LABEL_9;
    }
    CFRelease(error);
  }
  v21 = 0;
LABEL_9:

  return v21;
}

- (BOOL)validatePassword:(id)a3 forUser:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  krb5_error_code inited;
  krb5_error_code v10;
  const char *error_message;
  NSObject *v12;
  const char *v13;
  _BOOL4 v14;
  _krb5_context *v15;
  const char *v16;
  krb5_error_code v17;
  krb5_error_code v18;
  const char *v19;
  BOOL v20;
  _krb5_context *v21;
  krb5_principal_data *v22;
  char *v23;
  krb5_error_code init_creds_password;
  const char *v25;
  krb5_get_init_creds_opt *opt;
  krb5_context context;
  krb5_principal v29;
  _BYTE creds[144];
  uint8_t buf[4];
  krb5_error_code v32;
  __int16 v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  SO_LOG_SOKerberosHelper();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SOKerberosHelper validatePassword:forUser:].cold.1();

  context = 0;
  v29 = 0;
  memset(creds, 0, sizeof(creds));
  inited = krb5_init_context(&context);
  if (inited)
  {
    v10 = inited;
    error_message = krb5_get_error_message(context, inited);
    SO_LOG_SOKerberosHelper();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v32 = v10;
      v33 = 2080;
      v34 = error_message;
      v13 = "kerbValidatePassword: krb5_init_context failed with error: %d - %s";
LABEL_17:
      _os_log_impl(&dword_215A1B000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0x12u);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  v14 = -[SOKerberosHelper _testForUPNForUser:](self, "_testForUPNForUser:", v7);
  v15 = context;
  v16 = (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
  if (v14)
    v17 = krb5_parse_name_flags(v15, v16, 4, &v29);
  else
    v17 = krb5_parse_name(v15, v16, &v29);
  v18 = v17;
  if (v17)
  {
    v19 = krb5_get_error_message(context, v17);
    SO_LOG_SOKerberosHelper();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v32 = v18;
      v33 = 2080;
      v34 = v19;
      v13 = "kerbValidatePassword: krb5_parse_name failed with error: %d - %s";
      goto LABEL_17;
    }
LABEL_18:

    v20 = 0;
    goto LABEL_19;
  }
  opt = 0;
  krb5_get_init_creds_opt_alloc(context, &opt);
  krb5_principal_get_realm();
  krb5_get_init_creds_opt_set_default_flags();
  if (v14)
    krb5_get_init_creds_opt_set_win2k();
  v20 = 1;
  krb5_get_init_creds_opt_set_pac_request();
  krb5_get_init_creds_opt_set_forwardable(opt, 1);
  v21 = context;
  v22 = v29;
  v23 = (char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
  init_creds_password = krb5_get_init_creds_password(v21, (krb5_creds *)creds, v22, v23, 0, 0, 0, 0, opt);
  krb5_get_init_creds_opt_free(context, opt);
  if (init_creds_password)
  {
    v25 = krb5_get_error_message(context, init_creds_password);
    SO_LOG_SOKerberosHelper();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v32 = init_creds_password;
      v33 = 2080;
      v34 = v25;
      v13 = "kerbValidatePassword: krb5_get_init_creds_password failed with error: %d - %s";
      goto LABEL_17;
    }
    goto LABEL_18;
  }
LABEL_19:
  krb5_free_cred_contents(context, (krb5_creds *)creds);
  if (v29)
    krb5_free_principal(context, v29);
  if (context)
    MEMORY[0x2199EAD90]();

  return v20;
}

- (unsigned)createGSSName:(id)a3 gname:(gss_name_t_desc_struct *)a4 error:(id *)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  krb5_error_code v11;
  OM_uint32 v12;
  NSObject *v13;
  gss_name_t_desc_struct *v14;
  NSObject *v15;
  gss_buffer_desc_struct input_name_buffer;
  krb5_principal v18;
  CFErrorRef error;
  OM_uint32 minor_status;

  v7 = a3;
  SO_LOG_SOKerberosHelper();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SOKerberosHelper createGSSName:gname:error:].cold.4();

  minor_status = 0;
  error = 0;
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("@"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count") - 1;

  if (v10 < 2)
  {
    v14 = GSSCreateName(v7, MEMORY[0x24BDD1A68], &error);
    *a4 = v14;
    if (v14)
    {
      v12 = 0;
    }
    else
    {
      SO_LOG_SOKerberosHelper();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[SOKerberosHelper createGSSName:gname:error:].cold.3();

      if (a5)
        *a5 = objc_retainAutorelease(error);
      else
        CFRelease(error);
      v12 = 851968;
    }
  }
  else
  {
    v18 = 0;
    v11 = krb5_parse_name_flags(0, (const char *)objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), 4, &v18);
    if (v11)
    {
      v12 = v11;
      SO_LOG_SOKerberosHelper();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SOKerberosHelper createGSSName:gname:error:].cold.2();
LABEL_12:

      goto LABEL_19;
    }
    input_name_buffer.length = 8;
    input_name_buffer.value = &v18;
    v12 = gss_import_name(&minor_status, &input_name_buffer, MEMORY[0x24BDD1A90], a4);
    if (v12)
    {
      SO_LOG_SOKerberosHelper();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SOKerberosHelper createGSSName:gname:error:].cold.1();
      goto LABEL_12;
    }
  }
LABEL_19:

  return v12;
}

- (gss_cred_id_t_desc_struct)createCredential:(id)a3 withOptions:(id)a4 andError:(id *)a5
{
  const __CFDictionary *v8;
  id v9;
  NSObject *v10;
  unsigned int v11;
  NSObject *v12;
  gss_cred_id_t_desc_struct *v13;
  OM_uint32 v15;
  NSObject *v16;
  gss_name_t desired_name;
  OM_uint32 minor_status;
  CFErrorRef error;
  gss_cred_id_t output_cred_handle;

  v8 = (const __CFDictionary *)a4;
  v9 = a3;
  SO_LOG_SOKerberosHelper();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[SOKerberosHelper createCredential:withOptions:andError:].cold.3();

  error = 0;
  output_cred_handle = 0;
  minor_status = 0;
  desired_name = 0;
  v11 = -[SOKerberosHelper createGSSName:gname:error:](self, "createGSSName:gname:error:", v9, &desired_name, a5);

  if (v11)
  {
    if (*a5)
    {
      SO_LOG_SOKerberosHelper();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SOKerberosHelper changePasswordForUPN:realm:withOldPassword:withNewPassword:withError:].cold.1();

    }
  }
  else
  {
    v15 = gss_aapl_initial_cred(desired_name, MEMORY[0x24BDD1A80], v8, &output_cred_handle, &error);
    gss_release_name(&minor_status, &desired_name);
    if (!v15)
    {
      v13 = output_cred_handle;
      goto LABEL_9;
    }
    SO_LOG_SOKerberosHelper();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SOKerberosHelper createCredential:withOptions:andError:].cold.1();

    if (a5)
    {
      v13 = 0;
      *a5 = objc_retainAutorelease(error);
      goto LABEL_9;
    }
    CFRelease(error);
  }
  v13 = 0;
LABEL_9:

  return v13;
}

- (void)destroyAllCredentials
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_4(&dword_215A1B000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

uint64_t __41__SOKerberosHelper_destroyAllCredentials__block_invoke(uint64_t a1, uint64_t a2, gss_cred_id_t_desc_struct *a3)
{
  OM_uint32 min_stat;
  gss_cred_id_t cred_handle;

  cred_handle = a3;
  min_stat = 0;
  return gss_destroy_cred(&min_stat, &cred_handle);
}

- (void)destroyCredential:(id)a3
{
  id v3;
  NSObject *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const __CFUUID *v10;
  const __CFUUID *v11;
  void *v12;
  void *v13;
  gss_cred_id_t cred_handle;
  OM_uint32 min_stat;

  v3 = a3;
  SO_LOG_SOKerberosHelper();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[SOKerberosHelper destroyCredential:].cold.3();

  if (v3)
  {
    min_stat = 0;
    cred_handle = 0;
    objc_msgSend(v3, "UUIDString");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((-[__CFString isEqualToString:](v5, "isEqualToString:", &stru_24D3EC758) & 1) != 0)
    {
      v6 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v3, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("failed to find credential to destroy: %@"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      SO_LOG_SOKerberosHelper();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
LABEL_12:
        -[SOKerberosHelper acquireCredentialForUUID:].cold.1();
    }
    else
    {
      v10 = CFUUIDCreateFromString(0, v5);
      if (v10)
      {
        v11 = v10;
        cred_handle = GSSCreateCredentialFromUUID(v10);
        CFRelease(v11);
        if (cred_handle)
        {
          gss_destroy_cred(&min_stat, &cred_handle);
          if (cred_handle)
            gss_release_cred(&min_stat, &cred_handle);
        }
        goto LABEL_14;
      }
      v12 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v3, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("failed to find credential to destroy: %@"), v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      SO_LOG_SOKerberosHelper();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
    }

LABEL_14:
  }

}

- (void)destroyCredentialForUPN:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  gss_cred_id_t v7;
  OM_uint32 min_stat;

  v4 = a3;
  SO_LOG_SOKerberosHelper();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SOKerberosHelper destroyCredentialForUPN:].cold.2();

  if (v4)
  {
    min_stat = 0;
    v7 = -[SOKerberosHelper acquireCredentialForUPN:](self, "acquireCredentialForUPN:", v4);
    if (v7)
    {
      gss_destroy_cred(&min_stat, &v7);
      if (v7)
        gss_release_cred(&min_stat, &v7);
    }
  }
  else
  {
    SO_LOG_SOKerberosHelper();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SOKerberosHelper destroyCredentialForUPN:].cold.1();

  }
}

- (BOOL)authenticate:(gss_cred_id_t_desc_struct *)a3 toServer:(id)a4 returningToken:(id *)a5 andError:(id *)a6
{
  id v9;
  NSObject *v10;
  gss_name_t_desc_struct *v11;
  gss_name_t_desc_struct *v12;
  void *v13;
  gss_OID_desc *v14;
  OM_uint32 inited;
  BOOL v16;
  NSObject *v17;
  id v18;
  id v19;
  NSObject *v20;
  OM_uint32 v21;
  CFErrorRef v22;
  NSObject *v23;
  CFErrorRef error;
  OM_uint32 minor_status;
  gss_buffer_desc_struct buffer;
  gss_name_t input_name;
  gss_ctx_id_t context_handle;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  OM_uint32 v33;
  __int16 v34;
  OM_uint32 v35;
  __int16 v36;
  CFErrorRef v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v9 = a4;
  SO_LOG_SOKerberosHelper();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[SOKerberosHelper authenticate:toServer:returningToken:andError:].cold.2();

  context_handle = 0;
  buffer.length = 0;
  buffer.value = 0;
  minor_status = 0;
  error = 0;
  v11 = GSSCreateName(v9, MEMORY[0x24BDD1A60], &error);
  input_name = v11;
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v9, "lowercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "hasPrefix:", CFSTR("http")))
      v14 = (gss_OID_desc *)MEMORY[0x24BDD1AA8];
    else
      v14 = (gss_OID_desc *)MEMORY[0x24BDD1A80];

    inited = gss_init_sec_context(&minor_status, a3, &context_handle, v12, v14, 0x803Eu, 0xFFFFFFFF, 0, 0, 0, &buffer, 0, 0);
    v16 = inited < 2;
    if (inited >= 2)
    {
      v21 = inited;
      v22 = GSSCreateError(v14, inited, minor_status);
      SO_LOG_SOKerberosHelper();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138413058;
        v31 = v9;
        v32 = 1024;
        v33 = v21;
        v34 = 1024;
        v35 = minor_status;
        v36 = 2114;
        v37 = v22;
        _os_log_error_impl(&dword_215A1B000, v23, OS_LOG_TYPE_ERROR, "gss_init_sec_context failed server: %@, maj_stat: %d, min_stat: %d, %{public}@", buf, 0x22u);
      }

      if (a6)
        *a6 = objc_retainAutorelease(v22);
      else
        CFRelease(v22);
    }
    else
    {
      SO_LOG_SOKerberosHelper();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v31) = buffer.length;
        _os_log_impl(&dword_215A1B000, v17, OS_LOG_TYPE_INFO, "have a buffer of length: %d, success", buf, 8u);
      }

      v18 = objc_alloc(MEMORY[0x24BDBCE50]);
      v19 = objc_retainAutorelease((id)objc_msgSend(v18, "initWithBytes:length:", buffer.value, buffer.length));
      *a5 = v19;

    }
    gss_release_name(&minor_status, &input_name);
    gss_release_buffer(&minor_status, &buffer);
  }
  else
  {
    SO_LOG_SOKerberosHelper();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[SOKerberosHelper authenticate:toServer:returningToken:andError:].cold.1();

    if (a6)
    {
      v16 = 0;
      *a6 = objc_retainAutorelease(error);
    }
    else
    {
      CFRelease(error);
      v16 = 0;
    }
  }

  return v16;
}

- (id)listCredentials
{
  void *v2;
  id v3;
  _QWORD v5[4];
  id v6;
  OM_uint32 min_stat;

  min_stat = 0;
  v2 = (void *)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__SOKerberosHelper_listCredentials__block_invoke;
  v5[3] = &unk_24D3EC640;
  v3 = v2;
  v6 = v3;
  gss_iter_creds(&min_stat, 0, MEMORY[0x24BDD1A80], v5);

  return v3;
}

void __35__SOKerberosHelper_listCredentials__block_invoke(uint64_t a1, uint64_t a2, gss_cred_id_t_desc_struct *a3)
{
  const __CFUUID *v5;
  const __CFUUID *v6;
  __CFString *v7;
  gss_name_t_desc_struct *v8;
  gss_name_t_desc_struct *v9;
  CFStringRef DisplayString;
  SOKerberosCredential *v11;

  if (a3)
  {
    v11 = objc_alloc_init(SOKerberosCredential);
    v5 = GSSCredentialCopyUUID(a3);
    if (v5)
    {
      v6 = v5;
      v7 = (__CFString *)CFUUIDCreateString(0, v5);
      -[SOKerberosCredential setUuid:](v11, "setUuid:", v7);

      -[SOKerberosCredential setLifetime:](v11, "setLifetime:", GSSCredentialGetLifetime(a3));
      v8 = GSSCredentialCopyName(a3);
      if (v8)
      {
        v9 = v8;
        DisplayString = GSSNameCreateDisplayString(v8);
        CFRelease(v9);
        if (DisplayString)
        {
          -[SOKerberosCredential setName:](v11, "setName:", DisplayString);
          CFRelease(DisplayString);
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
      CFRelease(v6);
    }
    CFRelease(a3);

  }
}

- (BOOL)getPACForCred:(gss_cred_id_t_desc_struct *)a3 pac:(id *)a4
{
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  const __CFUUID *v10;
  const __CFUUID *v11;
  NSObject *v12;
  NSObject *v13;
  krb5_ticket *v14;
  NSObject *v15;
  int creds_opt_set_ticket;
  int v17;
  NSObject *v18;
  int v19;
  uint64_t realm;
  krb5_ticket *v21;
  _OWORD v22[30];
  uint64_t v23;
  _BYTE mcreds[128];
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  krb5_principal v35;
  krb5_context v36;
  krb5_principal principal;
  krb5_creds *v38;
  _BYTE creds[144];
  krb5_ccache v40;
  CFUUIDBytes v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOKerberosHelper();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[SOKerberosHelper getPACForCred:pac:].cold.18();

  if (a4)
    *a4 = 0;
  v40 = 0;
  *(_QWORD *)&v41.byte0 = 0;
  principal = 0;
  v38 = 0;
  v35 = 0;
  v36 = 0;
  *(_QWORD *)&v41.byte8 = 0;
  v34 = 0;
  v33 = 0;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v28 = 0;
  v27 = 0;
  v26 = 0;
  memset(creds, 0, sizeof(creds));
  if (!a3)
  {
    SO_LOG_SOKerberosHelper();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SOKerberosHelper getPACForCred:pac:].cold.1();
    goto LABEL_11;
  }
  if (krb5_init_context(&v36))
  {
    SO_LOG_SOKerberosHelper();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SOKerberosHelper getPACForCred:pac:].cold.17();
LABEL_11:

    return 0;
  }
  v10 = GSSCredentialCopyUUID(a3);
  if (!v10)
  {
    SO_LOG_SOKerberosHelper();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SOKerberosHelper getPACForCred:pac:].cold.2();

    v14 = 0;
    v8 = 1;
    goto LABEL_28;
  }
  v11 = v10;
  v41 = CFUUIDGetUUIDBytes(v10);
  CFRelease(v11);
  if (!krb5_cc_resolve_by_uuid())
  {
    if (krb5_cc_get_principal(v36, v40, &principal))
    {
      SO_LOG_SOKerberosHelper();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SOKerberosHelper getPACForCred:pac:].cold.15();
      goto LABEL_26;
    }
    realm = krb5_principal_get_realm();
    if (krb5_make_principal())
    {
      SO_LOG_SOKerberosHelper();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SOKerberosHelper getPACForCred:pac:].cold.14();
      goto LABEL_26;
    }
    v25 = 0u;
    memset(&mcreds[16], 0, 112);
    krb5_cc_clear_mcred();
    *(_QWORD *)&mcreds[8] = v35;
    *(_QWORD *)mcreds = principal;
    if (krb5_cc_retrieve_cred(v36, v40, 0, (krb5_creds *)mcreds, (krb5_creds *)creds))
    {
      SO_LOG_SOKerberosHelper();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[SOKerberosHelper getPACForCred:pac:].cold.13();

      krb5_cc_clear_mcred();
      goto LABEL_27;
    }
    krb5_cc_clear_mcred();
    krb5_free_principal(v36, v35);
    v35 = 0;
    if (krb5_get_creds_opt_alloc())
    {
      SO_LOG_SOKerberosHelper();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SOKerberosHelper getPACForCred:pac:].cold.12();
      goto LABEL_26;
    }
    krb5_get_creds_opt_set_impersonate();
    krb5_get_creds_opt_add_options();
    krb5_get_creds_opt_add_options();
    krb5_get_creds_opt_add_options();
    v23 = 0;
    memset(&v22[26], 0, 64);
    if (decode_Ticket())
    {
      SO_LOG_SOKerberosHelper();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SOKerberosHelper getPACForCred:pac:].cold.11();
      goto LABEL_26;
    }
    creds_opt_set_ticket = krb5_get_creds_opt_set_ticket();
    free_Ticket();
    if (creds_opt_set_ticket)
    {
      SO_LOG_SOKerberosHelper();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SOKerberosHelper getPACForCred:pac:].cold.10();
      goto LABEL_26;
    }
    if (krb5_get_creds())
    {
      SO_LOG_SOKerberosHelper();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SOKerberosHelper getPACForCred:pac:].cold.9();
      goto LABEL_26;
    }
    if (decode_Ticket())
    {
      SO_LOG_SOKerberosHelper();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[SOKerberosHelper getPACForCred:pac:].cold.8();
      goto LABEL_26;
    }
    v21 = (krb5_ticket *)malloc_type_calloc(1uLL, 0x98uLL, 0x10B0040764A81A9uLL);
    v17 = krb5_decrypt_ticket();
    free_Ticket();
    if (v17)
    {
      SO_LOG_SOKerberosHelper();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[SOKerberosHelper getPACForCred:pac:].cold.7();
    }
    else if (krb5_ticket_get_authorization_data_type())
    {
      SO_LOG_SOKerberosHelper();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[SOKerberosHelper getPACForCred:pac:].cold.6();
    }
    else
    {
      v19 = krb5_pac_parse();
      krb5_data_free();
      if (v19)
      {
        SO_LOG_SOKerberosHelper();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[SOKerberosHelper getPACForCred:pac:].cold.5();
      }
      else if (krb5_pac_verify())
      {
        SO_LOG_SOKerberosHelper();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[SOKerberosHelper getPACForCred:pac:].cold.4();
      }
      else
      {
        krb5_data_zero();
        if (!krb5_pac_get_buffer())
        {
          memset(v22, 0, 416);
          if (!get_kerbvalidationinfo(v27, v26, (uint64_t)v22))
          {
            if (a4)
              *a4 = -[SOKerberosPacData initWithValidationInfo:]([SOKerberosPacData alloc], "initWithValidationInfo:", v22, "krbtgt", realm, 0);
            free_kerbvalidationinfo(v22);
          }
          krb5_data_free();
          krb5_pac_free();
          v28 = 0;
          v8 = 1;
          goto LABEL_79;
        }
        SO_LOG_SOKerberosHelper();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[SOKerberosHelper getPACForCred:pac:].cold.3();
      }
    }

    v8 = 0;
LABEL_79:
    v14 = v21;
    goto LABEL_28;
  }
  SO_LOG_SOKerberosHelper();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[SOKerberosHelper getPACForCred:pac:].cold.16();
LABEL_26:

LABEL_27:
  v14 = 0;
  v8 = 0;
LABEL_28:
  krb5_free_cred_contents(v36, (krb5_creds *)creds);
  if (v38)
  {
    krb5_free_creds(v36, v38);
    v38 = 0;
  }
  if (v40)
  {
    krb5_cc_close(v36, v40);
    v40 = 0;
  }
  if (principal)
  {
    krb5_free_principal(v36, principal);
    principal = 0;
  }
  if (v35)
  {
    krb5_free_principal(v36, v35);
    v35 = 0;
  }
  if (v34)
  {
    krb5_get_creds_opt_free();
    v34 = 0;
  }
  if (v14)
    krb5_free_ticket(v36, v14);
  if (v28)
  {
    krb5_pac_free();
    v28 = 0;
  }
  if (v36)
    MEMORY[0x2199EAD90]();
  return v8;
}

- (void)acquireCredentialForUUID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_215A1B000, v0, v1, "Error using cached credential: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)acquireCredentialForUUID:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_4(&dword_215A1B000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)acquireCredentialForUPN:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_215A1B000, v0, v1, "createGSSName failed with: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)acquireCredentialForUPN:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_4(&dword_215A1B000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)changePasswordForUPN:realm:withOldPassword:withNewPassword:withError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_215A1B000, v0, v1, "createGSSName failed with: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)changePasswordForUPN:realm:withOldPassword:withNewPassword:withError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_4(&dword_215A1B000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)validatePassword:forUser:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_4(&dword_215A1B000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)createGSSName:gname:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A1B000, v0, v1, "error importing krb5 principal", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)createGSSName:gname:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A1B000, v0, v1, "error parsing krb5 principal", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)createGSSName:gname:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_215A1B000, v0, v1, "GSSCreateName failed with: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)createGSSName:gname:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_4(&dword_215A1B000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)createCredential:withOptions:andError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_0(&dword_215A1B000, v0, v1, "gss_aapl_initial_cred failed with: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)createCredential:withOptions:andError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_4(&dword_215A1B000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)destroyCredential:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_4(&dword_215A1B000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)destroyCredentialForUPN:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A1B000, v0, v1, "destroyCredentialForUPN - no UPN", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)destroyCredentialForUPN:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_4(&dword_215A1B000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)authenticate:toServer:returningToken:andError:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_215A1B000, v1, OS_LOG_TYPE_ERROR, "failed to import %@: %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)authenticate:toServer:returningToken:andError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_4(&dword_215A1B000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)getPACForCred:pac:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A1B000, v0, v1, "gsscred is not specified", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getPACForCred:pac:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A1B000, v0, v1, "Error copying cred uuid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getPACForCred:pac:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_215A1B000, v0, v1, "Error getting logon info from pac: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getPACForCred:pac:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_215A1B000, v0, v1, "Error verifying pac: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getPACForCred:pac:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_215A1B000, v0, v1, "Error parsing pac: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getPACForCred:pac:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_215A1B000, v0, v1, "Error retrieving pac: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getPACForCred:pac:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_215A1B000, v0, v1, "Error decrypting ticket: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getPACForCred:pac:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_215A1B000, v0, v1, "Error decoding delegation ticket: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getPACForCred:pac:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_215A1B000, v0, v1, "Error completing delegation to self: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getPACForCred:pac:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_215A1B000, v0, v1, "Error setting second ticket: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getPACForCred:pac:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_215A1B000, v0, v1, "Error decoding ticket: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getPACForCred:pac:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_215A1B000, v0, v1, "Error allocating cred opts: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getPACForCred:pac:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_215A1B000, v0, v1, "Error retrieving TGT from cache: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getPACForCred:pac:.cold.14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_215A1B000, v0, v1, "Error creating TGT principal: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getPACForCred:pac:.cold.15()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_215A1B000, v0, v1, "Error retrieving principal from cache: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getPACForCred:pac:.cold.16()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_215A1B000, v0, v1, "Error resolving cache by uuid: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getPACForCred:pac:.cold.17()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_215A1B000, v0, v1, "Error initializing context: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getPACForCred:pac:.cold.18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_4(&dword_215A1B000, v0, v1, "%s  on %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
