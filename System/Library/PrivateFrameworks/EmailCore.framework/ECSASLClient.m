@implementation ECSASLClient

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __19__ECSASLClient_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_2 != -1)
    dispatch_once(&log_onceToken_2, block);
  return (OS_os_log *)(id)log_log_2;
}

void __19__ECSASLClient_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_2;
  log_log_2 = (uint64_t)v1;

}

- (ECSASLClient)initWithMechanismNames:(id)a3 credentials:(id)a4 externalSecurityLayer:(unsigned int)a5 allowPlainText:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  ECSASLClient *v12;
  sasl_callback_t *v13;
  sasl_callback_t *v14;
  id v15;
  const char *v16;
  id v17;
  const char *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  id v22;
  const void *v23;
  uint64_t v24;
  uint64_t v26;
  NSArray *mechanismNames;
  sasl_conn_t *v28;
  const __CFString *v29;
  id v30;
  int v31;
  uint64_t v32;
  int v33;
  __int128 v34;
  sasl_conn_t *pconn;
  objc_super v36;
  unsigned int value;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  value = a5;
  if (!objc_msgSend(v10, "count"))
  {
    v29 = CFSTR("mechanismNames cannot be nil or empty");
    goto LABEL_29;
  }
  if (!v11)
  {
    v29 = CFSTR("credentials cannot be nil");
LABEL_29:
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v29, 0);
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v30);
  }
  v36.receiver = self;
  v36.super_class = (Class)ECSASLClient;
  v12 = -[ECSASLClient init](&v36, sel_init);
  if (v12)
  {
    if (initializeSASLIfNecessary_onceToken != -1)
      dispatch_once(&initializeSASLIfNecessary_onceToken, &__block_literal_global_17);
    if (initializeSASLIfNecessary_saslInitializationStatus)
      goto LABEL_24;
    if (-[ECSASLClient useATOKEN2Authentication](v12, "useATOKEN2Authentication"))
      -[ECSASLClient setIsATOKEN2Enabled:](v12, "setIsATOKEN2Enabled:", 1);
    v13 = (sasl_callback_t *)malloc_type_malloc(0x150uLL, 0x1080040D2F62047uLL);
    v14 = v13;
    if (!v13)
    {
      +[ECSASLClient log](ECSASLClient, "log");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        LOWORD(v31) = 0;
        _os_log_impl(&dword_1B9ADE000, v20, OS_LOG_TYPE_INFO, "Failed to allocate memory for SASL connection callback structures", (uint8_t *)&v31, 2u);
      }

      goto LABEL_24;
    }
    v13->id = 1;
    v13->proc = (int (*)(void))getOption;
    v13->context = 0;
    v13[1].id = 16387;
    v13[1].proc = (int (*)(void))getSimpleValue;
    v13[1].context = v12;
    v13[2].id = 16386;
    v13[2].proc = (int (*)(void))getSimpleValue;
    v13[2].context = v12;
    v13[3].id = 16385;
    v13[3].proc = (int (*)(void))getSimpleValue;
    v13[3].context = v12;
    v13[4].id = 16388;
    v13[4].proc = (int (*)(void))getPassword;
    v13[4].context = v12;
    v13[5].id = 18945;
    v13[5].proc = (int (*)(void))getSimpleValue;
    v13[5].context = v12;
    v13[6].id = 18944;
    v13[6].proc = (int (*)(void))getSimpleValue;
    v13[6].context = v12;
    v13[7].id = 18946;
    v13[7].proc = (int (*)(void))getSimpleValue;
    v13[7].context = v12;
    v13[8].id = 18952;
    v13[8].proc = (int (*)(void))getSimpleValue;
    v13[8].context = v12;
    v13[9].id = 18949;
    v13[9].proc = (int (*)(void))getSimpleValue;
    v13[9].context = v12;
    v13[10].id = 18950;
    v13[10].proc = (int (*)(void))getSimpleValue;
    v13[10].context = v12;
    v13[11].id = 18951;
    v13[11].proc = (int (*)(void))getSimpleValue;
    v13[11].context = v12;
    v13[12].id = 18948;
    v13[12].proc = (int (*)(void))getSimpleValue;
    v13[12].context = v12;
    v13[13].id = 0;
    v13[13].proc = 0;
    v13[13].context = 0;
    objc_msgSend(v11, "saslProfileName");
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = (const char *)objc_msgSend(v15, "UTF8String");

    objc_msgSend(v11, "hostname");
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v18 = (const char *)objc_msgSend(v17, "UTF8String");

    pconn = 0;
    v19 = sasl_client_new(v16, v18, 0, 0, v14, 0, &pconn);
    if ((_DWORD)v19)
    {
      -[ECSASLClient _logGenericError:saslConnection:description:error:](v12, "_logGenericError:saslConnection:description:error:", v19, pconn, CFSTR("Failed to create a new SASL connection"), 0);
LABEL_23:
      free(v14);
LABEL_24:

      v12 = 0;
      goto LABEL_25;
    }
    if (a5)
    {
      v21 = sasl_setprop(pconn, 100, &value);
      if ((_DWORD)v21)
      {
        -[ECSASLClient _logGenericError:saslConnection:description:error:](v12, "_logGenericError:saslConnection:description:error:", v21, pconn, CFSTR("Failed to set the TLS/SSL strength on the SASL connection"), 0);
LABEL_22:
        sasl_dispose(&pconn);
        goto LABEL_23;
      }
    }
    else
    {
      v31 = 0;
      v34 = 0u;
      v32 = 0x280000000800;
      v33 = !v6;
      v21 = sasl_setprop(pconn, 101, &v31);
      if ((_DWORD)v21)
      {
        -[ECSASLClient _logGenericError:saslConnection:description:error:](v12, "_logGenericError:saslConnection:description:error:", v21, pconn, CFSTR("Failed to set security properties on the SASL connection"), 0);
        goto LABEL_22;
      }
    }
    objc_msgSend(v11, "username", v21);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v23 = (const void *)objc_msgSend(v22, "UTF8String");

    v24 = sasl_setprop(pconn, 102, v23);
    if (!(_DWORD)v24)
    {
      v26 = objc_msgSend(v10, "copy", v24);
      mechanismNames = v12->_mechanismNames;
      v12->_mechanismNames = (NSArray *)v26;

      objc_storeWeak((id *)&v12->_credentials, v11);
      v28 = pconn;
      v12->_callbacks = v14;
      v12->_saslConnection = v28;
      goto LABEL_25;
    }
    -[ECSASLClient _logGenericError:saslConnection:description:error:](v12, "_logGenericError:saslConnection:description:error:", v24, pconn, CFSTR("Failed to enable the EXTERNAL mechanism on the SASL connection"), 0);
    goto LABEL_22;
  }
LABEL_25:

  return v12;
}

- (BOOL)useATOKEN2Authentication
{
  char v2;
  void *v3;
  void *v4;

  if ((_os_feature_enabled_impl() & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isInternal"))
  {
    objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v4, "isVirtualMachine");

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (ECSASLClient)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECSASLClient.m"), 279, CFSTR("Invalid initializer called, returning nil"));

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  sasl_dispose(&self->_saslConnection);
  free(self->_callbacks);
  free(self->_userLanguageCode);
  free(self->_authenticationName);
  free(self->_authorizationName);
  free(self->_password);
  free(self->_authenticationPersonID);
  free(self->_authorizationPersonID);
  free(self->_appleToken);
  free(self->_machineID);
  free(self->_oneTimePassword);
  free(self->_clientInfo);
  free(self->_oauthToken);
  free(self->_appleToken2);
  v3.receiver = self;
  v3.super_class = (Class)ECSASLClient;
  -[ECSASLClient dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  __CFString *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  const __CFString *v12;
  void *v13;
  objc_super v15;

  switch(-[ECSASLClient saslStatus](self, "saslStatus"))
  {
    case 0:
      v3 = CFSTR("Unauthenticated");
      break;
    case 1:
      v3 = CFSTR("NegotiatingAuthentication");
      break;
    case 2:
      v3 = CFSTR("AuthenticationCompleted");
      break;
    case 3:
      v4 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[ECSASLClient saslError](self, "saslError");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (__CFString *)objc_msgSend(v4, "initWithFormat:", CFSTR("Error[%@]"), v5);

      break;
    default:
      v3 = 0;
      break;
  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  v15.receiver = self;
  v15.super_class = (Class)ECSASLClient;
  -[ECSASLClient description](&v15, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECSASLClient selectedMechanismName](self, "selectedMechanismName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECSASLClient mechanismNames](self, "mechanismNames");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ECSASLClient encryptionBufferSize](self, "encryptionBufferSize");
  v12 = CFSTR("yes");
  if (!v11)
    v12 = CFSTR("no");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ status: %@, selected mechanism: %@ (out of %@), security layer: %@"), v7, v3, v8, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (id)start
{
  sasl_conn *v4;
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char *v13;
  size_t v14;
  void *v15;
  char *v16;
  uint64_t v17;
  void *v19;
  void *v20;
  sasl_interact_t *v21;
  char *mech;
  unsigned int clientoutlen;
  char *clientout[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  if (-[ECSASLClient saslStatus](self, "saslStatus"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECSASLClient.m"), 328, CFSTR("This method must be called in the Unauthenticated state"));

  }
  v4 = -[ECSASLClient saslConnection](self, "saslConnection");
  -[ECSASLClient mechanismNames](self, "mechanismNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" "));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  clientout[0] = 0;
  clientoutlen = 0;
  v21 = 0;
  mech = 0;
  if (-[ECSASLClient excludeInitialResponse](self, "excludeInitialResponse"))
    v8 = sasl_client_start(v4, v7, 0, 0, 0, (const char **)&mech);
  else
    v8 = sasl_client_start(v4, v7, &v21, (const char **)clientout, &clientoutlen, (const char **)&mech);
  v9 = v8;
  if (mech)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
    v10 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "containsObject:", v10) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECSASLClient.m"), 349, CFSTR("SASL selected a mechanism outside of the requested ones"));

    }
    v11 = (void *)v10;
  }
  else
  {
    v11 = 0;
  }
  -[ECSASLClient setSelectedMechanismName:](self, "setSelectedMechanismName:", v11);
  if (v9 > 1)
  {
    v12 = 0;
    if ((_DWORD)v9 == 2)
      -[ECSASLClient _handleNeedsUserInteraction:](self, "_handleNeedsUserInteraction:", v21);
    else
      -[ECSASLClient _handleStartFailure:](self, "_handleStartFailure:", v9);
    goto LABEL_29;
  }
  if (!clientout[0])
  {
    v12 = 0;
    if ((_DWORD)v9)
      goto LABEL_14;
LABEL_19:
    -[ECSASLClient _clearAuthenticationCallbackBuffers](self, "_clearAuthenticationCallbackBuffers");
    -[ECSASLClient setSaslStatus:](self, "setSaslStatus:", 2);
    -[ECSASLClient _retrieveEncryptionBufferSize](self, "_retrieveEncryptionBufferSize");
    goto LABEL_20;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", clientout[0], clientoutlen);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!(_DWORD)v9)
    goto LABEL_19;
LABEL_14:
  -[ECSASLClient setSaslStatus:](self, "setSaslStatus:", 1);
LABEL_20:
  v13 = mech;
  if (!mech)
  {
    v13 = "";
    mech = "";
  }
  clientout[1] = 0;
  v25[0] = 0;
  *(_QWORD *)((char *)v25 + 5) = 0;
  v14 = strlen(v13);
  if (v14 <= 0x14)
  {
    v16 = (char *)__strcpy_chk();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECSASLClient.m"), 384, CFSTR("SASL selected a mechanism whose name is longer than permitted by the standard"));

    v16 = (char *)malloc_type_malloc(v14 + 1, 0x110CE0A5uLL);
    strcpy(v16, mech);
  }
  v17 = sasl_client_plugin_info(v16, (sasl_client_info_callback_t *)getMechanismInformation, self);
  if (v14 >= 0x15)
    free(v16);
  if ((_DWORD)v17)
  {
    -[ECSASLClient setSaslStatus:](self, "setSaslStatus:", 3);
    -[ECSASLClient _handleGenericError:description:](self, "_handleGenericError:description:", v17, CFSTR("Failed to get information about the SASL mechanism"));
  }
LABEL_29:

  return v12;
}

+ (NSArray)installedMechanisms
{
  id v2;
  const char **v4;
  _QWORD *v5;
  void *v6;

  if (initializeSASLIfNecessary_onceToken != -1)
    dispatch_once(&initializeSASLIfNecessary_onceToken, &__block_literal_global_17);
  if (initializeSASLIfNecessary_saslInitializationStatus)
  {
    v2 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4 = sasl_global_listmech();
    if (v4 && *v4)
    {
      v5 = v4 + 1;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v6);

      }
      while (*v5++);
    }
  }
  return (NSArray *)v2;
}

- (id)responseForServerData:(id)a3
{
  id v5;
  unint64_t v6;
  unsigned int v7;
  sasl_conn *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v13;
  sasl_interact_t *prompt_need;
  unsigned int clientoutlen;
  char *clientout;

  v5 = a3;
  if (-[ECSASLClient saslStatus](self, "saslStatus") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECSASLClient.m"), 433, CFSTR("This method must be called in the NegotiatingAuthentication state"));

  }
  -[ECSASLClient setLastResponseIncludesCredential:](self, "setLastResponseIncludesCredential:", 0);
  v6 = objc_msgSend(v5, "length");
  v7 = v6;
  if (HIDWORD(v6))
  {
    NSLog(CFSTR("Server data was too large for SASL client (%lu bytes given, %u maximum).\n%@"), v6, 0xFFFFFFFFLL, self);
    v7 = -1;
  }
  v8 = -[ECSASLClient saslConnection](self, "saslConnection");
  clientout = 0;
  clientoutlen = 0;
  prompt_need = 0;
  v9 = objc_retainAutorelease(v5);
  v10 = sasl_client_step(v8, (const char *)objc_msgSend(v9, "bytes"), v7, &prompt_need, (const char **)&clientout, &clientoutlen);
  if ((_DWORD)v10)
  {
    if ((_DWORD)v10 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", clientout, clientoutlen);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((_DWORD)v10 == 2)
        -[ECSASLClient _handleNeedsUserInteraction:](self, "_handleNeedsUserInteraction:", prompt_need);
      else
        -[ECSASLClient _handleGenericError:description:](self, "_handleGenericError:description:", v10, CFSTR("Failed a step of SASL authentication"));
      v11 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", clientout, clientoutlen);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ECSASLClient _clearAuthenticationCallbackBuffers](self, "_clearAuthenticationCallbackBuffers");
    -[ECSASLClient setSaslStatus:](self, "setSaslStatus:", 2);
    -[ECSASLClient _retrieveEncryptionBufferSize](self, "_retrieveEncryptionBufferSize");
  }

  return v11;
}

- (BOOL)lastResponseIncludesPlainTextCredential
{
  _BOOL4 v3;

  v3 = -[ECSASLClient lastResponseIncludesCredential](self, "lastResponseIncludesCredential");
  if (v3)
    LOBYTE(v3) = -[ECSASLClient mechanismUsesPlainText](self, "mechanismUsesPlainText");
  return v3;
}

- (void)_retrieveEncryptionBufferSize
{
  sasl_conn *v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  unsigned int *v8;
  void *pvalue;

  v3 = -[ECSASLClient saslConnection](self, "saslConnection");
  pvalue = 0;
  v4 = sasl_getprop(v3, 1, (const void **)&pvalue);
  if ((_DWORD)v4)
  {
    v5 = v4;
    v6 = CFSTR("Failed to get security strength factor from the SASL connection");
LABEL_3:
    -[ECSASLClient _handleGenericError:description:](self, "_handleGenericError:description:", v5, v6);
    return;
  }
  if (*(_DWORD *)pvalue)
  {
    v8 = 0;
    v7 = sasl_getprop(v3, 2, (const void **)&v8);
    if (!(_DWORD)v7)
    {
      -[ECSASLClient setEncryptionBufferSize:](self, "setEncryptionBufferSize:", *v8);
      return;
    }
    v5 = v7;
    v6 = CFSTR("Failed to get security layer buffer size from the SASL connection");
    goto LABEL_3;
  }
}

- (id)newEncryptedDataForBytes:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v8;
  id v10;
  void *v11;
  unsigned int outputlen;
  char *output;

  if (-[ECSASLClient saslStatus](self, "saslStatus") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECSASLClient.m"), 752, CFSTR("This method must be called in the Authenticated state"));

  }
  output = 0;
  outputlen = 0;
  v8 = sasl_encode(-[ECSASLClient saslConnection](self, "saslConnection"), a3, a4, (const char **)&output, &outputlen);
  if ((_DWORD)v8)
  {
    -[ECSASLClient _handleGenericError:description:](self, "_handleGenericError:description:", v8, CFSTR("Failed to encrypt data"));
    return 0;
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0C99D50]);
    return (id)objc_msgSend(v10, "initWithBytes:length:", output, outputlen);
  }
}

- (id)newDecryptedDataForBytes:(const char *)a3 length:(unsigned int)a4
{
  uint64_t v8;
  id v10;
  void *v11;
  unsigned int outputlen;
  char *output;

  if (-[ECSASLClient saslStatus](self, "saslStatus") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECSASLClient.m"), 769, CFSTR("This method must be called in the Authenticated state"));

  }
  output = 0;
  outputlen = 0;
  v8 = sasl_decode(-[ECSASLClient saslConnection](self, "saslConnection"), a3, a4, (const char **)&output, &outputlen);
  if ((_DWORD)v8)
  {
    -[ECSASLClient _handleGenericError:description:](self, "_handleGenericError:description:", v8, CFSTR("Failed to decrypt data"));
    return 0;
  }
  else
  {
    v10 = objc_alloc(MEMORY[0x1E0C99D50]);
    return (id)objc_msgSend(v10, "initWithBytes:length:", output, outputlen);
  }
}

- (void)_clearAuthenticationCallbackBuffers
{
  free(self->_authenticationName);
  self->_authenticationName = 0;
  free(self->_authorizationName);
  self->_authorizationName = 0;
  free(self->_password);
  self->_password = 0;
}

- (void)_handleGenericError:(int)a3 description:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v8 = 0;
  -[ECSASLClient _logGenericError:saslConnection:description:error:](self, "_logGenericError:saslConnection:description:error:", v4, -[ECSASLClient saslConnection](self, "saslConnection"), v6, &v8);
  v7 = v8;
  -[ECSASLClient setSaslStatus:](self, "setSaslStatus:", 3);
  -[ECSASLClient setSaslError:](self, "setSaslError:", v7);

}

- (BOOL)_logGenericError:(int)a3 saslConnection:(sasl_conn *)a4 description:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sasl_errdetail(a4));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ECSASLClient log](ECSASLClient, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = v9;
    v22 = 2114;
    v23 = v10;
    _os_log_impl(&dword_1B9ADE000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@\n%{public}@", buf, 0x16u);
  }

  if (a6)
  {
    v18 = *MEMORY[0x1E0CB2D80];
    v19 = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("SASLErrorDomain"), a3, v12);
    v16 = *MEMORY[0x1E0CB3388];
    v17 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    *a6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("ECAuthenticationErrorDomain"), 1030, v14);
  }

  return 0;
}

- (void)_handleStartFailure:(int)a3
{
  sasl_conn *v4;
  uint64_t v5;
  void *v6;
  id v7;
  const char *v8;
  void *v9;
  sasl_interact_t *prompt_need;
  _OWORD value[2];

  if (a3 == -4)
  {
    v4 = -[ECSASLClient saslConnection](self, "saslConnection");
    memset(value, 0, sizeof(value));
    if (sasl_setprop(v4, 101, value))
    {
      v5 = 1046;
    }
    else
    {
      prompt_need = 0;
      -[ECSASLClient mechanismNames](self, "mechanismNames");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" "));
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v8 = (const char *)objc_msgSend(v7, "UTF8String");

      if (sasl_client_start(v4, v8, &prompt_need, 0, 0, 0) == -4)
        v5 = 1046;
      else
        v5 = 1045;
    }
    -[ECSASLClient setSaslStatus:](self, "setSaslStatus:", 3);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("ECAuthenticationErrorDomain"), v5, 0);
    -[ECSASLClient setSaslError:](self, "setSaslError:", v9);

  }
  else
  {
    -[ECSASLClient _handleGenericError:description:](self, "_handleGenericError:description:", *(_QWORD *)&a3, CFSTR("Failed to start the SASL connection"));
  }
}

- (void)_handleNeedsUserInteraction:(sasl_interact *)a3
{
  sasl_interact *v3;
  _BOOL4 v5;
  uint64_t id;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  id v13;

  v3 = a3;
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECSASLClient.m"), 872, CFSTR("libsasl returned SASL_INTERACT without a corresponding sasl_interact_t"));

  }
  -[ECSASLClient credentials](self, "credentials");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  do
  {
    v5 = 0;
    id = v3->id;
    if ((uint64_t)v3->id > 18947)
    {
      if (id == 18948)
      {
        objc_msgSend(v12, "password");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          objc_msgSend(v12, "appleAuthenticationToken");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v8)
          {
LABEL_24:
            objc_msgSend(v12, "base64EncodedAppleAuthenticationToken2");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_25;
          }
LABEL_23:
          v5 = 0;
LABEL_26:

          goto LABEL_27;
        }
      }
      else
      {
        if (id != 18952)
          goto LABEL_28;
        objc_msgSend(v12, "password");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          objc_msgSend(v12, "oauthToken");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v8)
          {
            objc_msgSend(v12, "appleAuthenticationToken");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:
            v5 = v9 == 0;

            goto LABEL_26;
          }
          goto LABEL_23;
        }
      }
LABEL_19:
      v5 = 0;
LABEL_27:

      goto LABEL_28;
    }
    switch(id)
    {
      case 16388:
        objc_msgSend(v12, "appleAuthenticationToken");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          objc_msgSend(v12, "oauthToken");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v8)
            goto LABEL_24;
          goto LABEL_23;
        }
        goto LABEL_19;
      case 18946:
        objc_msgSend(v12, "password");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          objc_msgSend(v12, "oauthToken");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v8)
            goto LABEL_24;
          goto LABEL_23;
        }
        goto LABEL_19;
      case 0:
        -[ECSASLClient _handleGenericError:description:](self, "_handleGenericError:description:", 2, CFSTR("User interaction needed"));
        goto LABEL_30;
    }
LABEL_28:
    ++v3;
  }
  while (!v5);
  -[ECSASLClient setSaslStatus:](self, "setSaslStatus:", 3);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ECAuthenticationErrorDomain"), 1032, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECSASLClient setSaslError:](self, "setSaslError:", v10);

LABEL_30:
}

- (BOOL)isATOKEN2Enabled
{
  return self->_isATOKEN2Enabled;
}

- (void)setIsATOKEN2Enabled:(BOOL)a3
{
  self->_isATOKEN2Enabled = a3;
}

- (ECAuthenticationCredentials)credentials
{
  return (ECAuthenticationCredentials *)objc_loadWeakRetained((id *)&self->_credentials);
}

- (void)setCredentials:(id)a3
{
  objc_storeWeak((id *)&self->_credentials, a3);
}

- (int64_t)saslStatus
{
  return self->_saslStatus;
}

- (void)setSaslStatus:(int64_t)a3
{
  self->_saslStatus = a3;
}

- (NSError)saslError
{
  return self->_saslError;
}

- (void)setSaslError:(id)a3
{
  objc_storeStrong((id *)&self->_saslError, a3);
}

- (NSString)selectedMechanismName
{
  return self->_selectedMechanismName;
}

- (void)setSelectedMechanismName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)excludeAuthorizationName
{
  return self->_excludeAuthorizationName;
}

- (void)setExcludeAuthorizationName:(BOOL)a3
{
  self->_excludeAuthorizationName = a3;
}

- (BOOL)excludeInitialResponse
{
  return self->_excludeInitialResponse;
}

- (void)setExcludeInitialResponse:(BOOL)a3
{
  self->_excludeInitialResponse = a3;
}

- (unsigned)encryptionBufferSize
{
  return self->_encryptionBufferSize;
}

- (void)setEncryptionBufferSize:(unsigned int)a3
{
  self->_encryptionBufferSize = a3;
}

- (NSArray)mechanismNames
{
  return self->_mechanismNames;
}

- (void)setMechanismNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (sasl_callback)callbacks
{
  return self->_callbacks;
}

- (sasl_conn)saslConnection
{
  return self->_saslConnection;
}

- (BOOL)mechanismUsesPlainText
{
  return self->_mechanismUsesPlainText;
}

- (void)setMechanismUsesPlainText:(BOOL)a3
{
  self->_mechanismUsesPlainText = a3;
}

- (BOOL)lastResponseIncludesCredential
{
  return self->_lastResponseIncludesCredential;
}

- (void)setLastResponseIncludesCredential:(BOOL)a3
{
  self->_lastResponseIncludesCredential = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mechanismNames, 0);
  objc_storeStrong((id *)&self->_selectedMechanismName, 0);
  objc_storeStrong((id *)&self->_saslError, 0);
  objc_destroyWeak((id *)&self->_credentials);
}

@end
