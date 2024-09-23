@implementation TKSEPClientTokenSession

- (TKTokenID)tokenID
{
  TKTokenID *v3;
  void *v4;
  void *v5;
  TKTokenID *v6;

  v3 = [TKTokenID alloc];
  -[TKClientTokenSession token](self, "token");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tokenID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TKTokenID initWithTokenID:](v3, "initWithTokenID:", v5);

  return v6;
}

- (BOOL)forceSystemSession
{
  void *v2;
  void *v3;
  char v4;

  -[TKClientTokenSession parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("forceSystemSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (TKSEPClientTokenSession)initWithToken:(id)a3 LAContext:(id)a4 parameters:(id)a5 error:(id *)a6
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  TKSEPClientTokenSession *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TKSEPClientTokenSession;
  v7 = -[TKClientTokenSession _initWithToken:LAContext:parameters:error:](&v14, sel__initWithToken_LAContext_parameters_error_, a3, a4, a5);
  if (!v7)
    goto LABEL_3;
  +[TKSEPClientToken builtinTokenIDs](TKSEPClientToken, "builtinTokenIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tokenID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "containsObject:", v10);

  if ((v11 & 1) == 0)
  {
    if (a6)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -1, 0);
      v12 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
LABEL_3:
    v12 = (TKSEPClientTokenSession *)v7;
  }

  return v12;
}

- (id)createObjectWithAttributes:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  TKSEPKey *v10;
  void *v11;
  TKSEPKey *v12;
  void *v13;
  TKSEPClientTokenObject *v14;
  id v16;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = _os_activity_create(&dword_1B9768000, "SEPClientObject: createKey", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  v16 = 0;
  -[TKClientTokenSession processObjectCreationAttributes:authContext:error:](self, "processObjectCreationAttributes:authContext:error:", v6, &v16, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;

  if (!v8)
  {
    v12 = 0;
    goto LABEL_5;
  }
  v10 = [TKSEPKey alloc];
  v11 = (void *)objc_msgSend(v8, "mutableCopy");
  v12 = -[TKSEPKey initWithAttributes:authContext:forceSystemSession:error:](v10, "initWithAttributes:authContext:forceSystemSession:error:", v11, v9, -[TKSEPClientTokenSession forceSystemSession](self, "forceSystemSession"), a4);

  -[TKClientTokenSession LAContext](self, "LAContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKSEPKey setAuthContext:](v12, "setAuthContext:", v13);

  if (!v12)
  {
LABEL_5:
    v14 = 0;
    goto LABEL_6;
  }
  v14 = -[TKSEPClientTokenObject initWithSession:key:error:]([TKSEPClientTokenObject alloc], "initWithSession:key:error:", self, v12, a4);
LABEL_6:

  os_activity_scope_leave(&state);
  return v14;
}

- (id)objectForObjectID:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  TKSEPKey *v10;
  void *v11;
  TKSEPKey *v12;
  TKSEPClientTokenObject *v13;
  os_activity_scope_state_s v15;

  v6 = a3;
  v7 = _os_activity_create(&dword_1B9768000, "SEPClientObject: getKey", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v15.opaque[0] = 0;
  v15.opaque[1] = 0;
  os_activity_scope_enter(v7, &v15);
  -[TKSEPClientTokenSession tokenID](self, "tokenID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "decodedKeyID:error:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = [TKSEPKey alloc];
    -[TKClientTokenSession LAContext](self, "LAContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[TKSEPKey initWithObjectID:authContext:forceSystemSession:error:](v10, "initWithObjectID:authContext:forceSystemSession:error:", v9, v11, -[TKSEPClientTokenSession forceSystemSession](self, "forceSystemSession"), a4);

    if (v12)
      v13 = -[TKSEPClientTokenObject initWithSession:key:error:]([TKSEPClientTokenObject alloc], "initWithSession:key:error:", self, v12, a4);
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }

  os_activity_scope_leave(&v15);
  return v13;
}

@end
