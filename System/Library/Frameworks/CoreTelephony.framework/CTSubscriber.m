@implementation CTSubscriber

- (CTSubscriber)initWithDescriptor:(id)a3 client:(id)a4
{
  id v7;
  id v8;
  CTSubscriber *v9;
  CTSubscriber *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  dispatch_queue_t v15;
  NSObject *fObj;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CTSubscriber;
  v9 = -[CTSubscriber init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_descriptor, a3);
    v11 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("CTSubscriber-%@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_retainAutorelease(v13);
    v15 = dispatch_queue_create((const char *)objc_msgSend(v14, "UTF8String"), 0);
    fObj = v10->_queue.fObj.fObj;
    v10->_queue.fObj.fObj = (dispatch_object_s *)v15;
    if (fObj)
      dispatch_release(fObj);
    objc_storeStrong((id *)&v10->_client, a4);
    -[CoreTelephonyClient setDelegate:](v10->_client, "setDelegate:", v10);

  }
  return v10;
}

- (CTSubscriber)initWithDescriptor:(id)a3
{
  id v5;
  CTSubscriber *v6;
  CTSubscriber *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  dispatch_queue_t v12;
  NSObject *fObj;
  CoreTelephonyClient *v14;
  CoreTelephonyClient *client;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CTSubscriber;
  v6 = -[CTSubscriber init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_descriptor, a3);
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("CTSubscriber-%@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_retainAutorelease(v10);
    v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), 0);
    fObj = v7->_queue.fObj.fObj;
    v7->_queue.fObj.fObj = (dispatch_object_s *)v12;
    if (fObj)
      dispatch_release(fObj);
    v14 = -[CoreTelephonyClient initWithQueue:]([CoreTelephonyClient alloc], "initWithQueue:", v7->_queue.fObj.fObj);
    client = v7->_client;
    v7->_client = v14;

    -[CoreTelephonyClient setDelegate:](v7->_client, "setDelegate:", v7);
  }

  return v7;
}

- (CTSubscriber)init
{
  CTServiceDescriptor *v3;
  CTSubscriber *v4;

  v3 = -[CTServiceDescriptor initWithDomain:instance:]([CTServiceDescriptor alloc], "initWithDomain:instance:", 1, &unk_1E1587010);
  v4 = -[CTSubscriber initWithDescriptor:](self, "initWithDescriptor:", v3);

  return v4;
}

- (NSData)carrierToken
{
  CoreTelephonyClient *client;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  client = self->_client;
  -[CTSubscriber descriptor](self, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  -[CoreTelephonyClient getUserAuthToken:error:](client, "getUserAuthToken:error:", v3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (v5)
  {
    v6 = CTLogSubscriber();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CTSubscriber carrierToken].cold.1();
  }

  return (NSData *)v4;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[CTSubscriber descriptor](self, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)refreshCarrierToken
{
  CoreTelephonyClient *client;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;

  client = self->_client;
  -[CTSubscriber descriptor](self, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  -[CoreTelephonyClient refreshUserAuthToken:error:](client, "refreshUserAuthToken:error:", v3, &v7);
  v4 = v7;

  if (v4)
  {
    v5 = CTLogSubscriber();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CTSubscriber refreshCarrierToken].cold.1();
  }

  return v4 == 0;
}

- (void)authenticate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  CoreTelephonyClient *client;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  client = self->_client;
  -[CTSubscriber descriptor](self, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__CTSubscriber_authenticate_completion___block_invoke;
  v11[3] = &unk_1E1534870;
  v10 = v7;
  v12 = v10;
  -[CoreTelephonyClient authenticate:request:completion:](client, "authenticate:request:completion:", v9, v6, v11);

}

void __40__CTSubscriber_authenticate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = CTLogSubscriber();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __40__CTSubscriber_authenticate_completion___block_invoke_cold_2();
  }
  else
  {
    v8 = CTLogSubscriber();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __40__CTSubscriber_authenticate_completion___block_invoke_cold_1();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)authenticateWithInfo:(id)a3 handleResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v9 = v6;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCTSimSupportUICCAuthenticationTypeKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("kCTSimSupportUICCAuthenticationTypeEAPAKA")))
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCTSimSupportUICCAuthenticationRandKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRand:", v12);

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCTSimSupportUICCAuthenticationAutnKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAutn:", v13);
  }
  else
  {
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("kCTSimSupportUICCAuthenticationTypeEAPSIM")))
    {
      v11 = 0;
      goto LABEL_7;
    }
    v11 = (void *)objc_opt_new();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kCTSimSupportUICCAuthenticationRandKey"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRand:", v13);
  }

LABEL_7:
  objc_msgSend(v8, "setAlgorithm:", v11);

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__CTSubscriber_authenticateWithInfo_handleResult___block_invoke;
  v15[3] = &unk_1E1534898;
  v14 = v7;
  v16 = v14;
  -[CTSubscriber authenticate:completion:](self, "authenticate:completion:", v8, v15);

}

void __50__CTSubscriber_authenticateWithInfo_handleResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v19 = v5;
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v19, "auts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v19, "auts");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("kCTSimSupportUICCAuthenticationAutsKey"));

    }
    objc_msgSend(v19, "res");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v19, "res");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("kCTSimSupportUICCAuthenticationResKey"));

    }
    objc_msgSend(v19, "sres");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v19, "sres");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("kCTSimSupportUICCAuthenticationSresKey"));

    }
    objc_msgSend(v19, "kc");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v19, "kc");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("kCTSimSupportUICCAuthenticationKcKey"));

    }
    objc_msgSend(v19, "ck");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v19, "ck");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("kCTSimSupportUICCAuthenticationCkKey"));

    }
    objc_msgSend(v19, "ik");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v19, "ik");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("kCTSimSupportUICCAuthenticationIkKey"));

    }
    v5 = v19;
  }
  else
  {
    v6 = 0;
  }

  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
}

- (id)typeAllocationCode
{
  CoreTelephonyClient *client;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  client = self->_client;
  -[CTSubscriber descriptor](self, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  -[CoreTelephonyClient getTypeAllocationCode:error:](client, "getTypeAllocationCode:error:", v3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (v5)
  {
    v6 = CTLogSubscriber();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[CTSubscriber typeAllocationCode].cold.1();
  }

  return v4;
}

- (BOOL)isSIMInserted
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  BOOL v13;
  void *v14;
  BOOL v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  char v25;
  CoreTelephonyClient *client;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[16];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infoDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("CarrierDescriptors"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)objc_opt_new();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = v32;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v36 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MCC"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[CTSubscriber _isValidMCCMNCString:max:min:](self, "_isValidMCCMNCString:max:min:", v10, 3, 3);

        if (v11)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MNC"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[CTSubscriber _isValidMCCMNCString:max:min:](self, "_isValidMCCMNCString:max:min:", v12, 3, 2);

          if (v13)
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("GID1"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[CTSubscriber _isValidGid:](self, "_isValidGid:", v14);

            if (v15)
            {
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("GID2"));
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = -[CTSubscriber _isValidGid:](self, "_isValidGid:", v16);

              if (v17)
              {
                v18 = (void *)objc_opt_new();
                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MCC"));
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("MCC"));

                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("MNC"));
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setObject:forKeyedSubscript:", v20, CFSTR("MNC"));

                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("GID1"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("GID1"));

                objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("GID2"));
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("GID2"));

                objc_msgSend(v33, "addObject:", v18);
              }
            }
          }
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v6);
  }

  if (!objc_msgSend(v33, "count"))
  {
    v24 = CTLogSubscriber();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18425C000, v24, OS_LOG_TYPE_INFO, "No carrier descriptors found", buf, 2u);
    }
    goto LABEL_19;
  }
  if ((unint64_t)objc_msgSend(v33, "count") >= 0x1A)
  {
    v23 = CTLogSubscriber();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[CTSubscriber isSIMInserted].cold.1(buf, objc_msgSend(v33, "count"), v23);
LABEL_19:
    v25 = 0;
    goto LABEL_26;
  }
  client = self->_client;
  -[CTSubscriber descriptor](self, "descriptor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  -[CoreTelephonyClient isSimMatching:carrierDescriptors:error:](client, "isSimMatching:carrierDescriptors:error:", v27, v33, &v34);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v34;

  if (v29)
  {
    v30 = CTLogSubscriber();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[CTSubscriber isSIMInserted].cold.2();
    v25 = 0;
  }
  else
  {
    v25 = objc_msgSend(v28, "BOOLValue");
  }

LABEL_26:
  return v25;
}

- (void)authTokenChanged:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CTSubscriber descriptor](self, "descriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "isEqual:", v4);

  if ((v5 & 1) != 0)
  {
    -[CTSubscriber delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subscriberTokenRefreshed:", self);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("CTSubscriberTokenRefreshed"), self);

  }
}

- (BOOL)_isValidMCCMNCString:(id)a3 max:(unint64_t)a4 min:(unint64_t)a5
{
  id v7;
  void *v8;
  BOOL v9;
  void *v11;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "decimalDigitCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "length") <= a4 && objc_msgSend(v7, "length") >= a5)
  {
    objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v11, "length") == 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_isValidGid:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789ABCDEFabcdef"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (objc_msgSend(v3, "length") && (unint64_t)objc_msgSend(v3, "length") <= 0x32)
    {
      objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "length") == 0;

    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (CTServiceDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (void).cxx_destruct
{
  NSObject *fObj;

  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_client, 0);
  fObj = self->_queue.fObj.fObj;
  if (fObj)
    dispatch_release(fObj);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (void)carrierToken
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_18425C000, v0, v1, "Error getting user auth token: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)refreshCarrierToken
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_18425C000, v0, v1, "Error refreshing user auth token: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

void __40__CTSubscriber_authenticate_completion___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_18425C000, v0, OS_LOG_TYPE_DEBUG, "Authentication successful: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1_1();
}

void __40__CTSubscriber_authenticate_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_18425C000, v0, v1, "Failed to authenticate request: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)typeAllocationCode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_18425C000, v0, v1, "Error retrieving type allocation code: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)isSIMInserted
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1(&dword_18425C000, v0, v1, "Error determining if sim is inserted: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
