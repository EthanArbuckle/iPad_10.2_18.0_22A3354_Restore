@implementation _ANEModelToken

+ (id)processNameFor:(id *)a3 identifier:(int)a4
{
  return 0;
}

+ (id)codeSigningIDFor:(id *)a3 processIdentifier:(int)a4
{
  const __CFAllocator *v5;
  __int128 v6;
  __SecTask *v7;
  __SecTask *v8;
  __CFString *v9;
  CFErrorRef v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v15;
  CFErrorRef error;
  audit_token_t token;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v6 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v6;
  v7 = SecTaskCreateWithAuditToken(v5, &token);
  if (v7)
  {
    v8 = v7;
    error = 0;
    v9 = (__CFString *)SecTaskCopySigningIdentifier(v7, &error);
    v10 = error;
    +[_ANELog daemon](_ANELog, "daemon");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        +[_ANEModelToken codeSigningIDFor:processIdentifier:].cold.2();

      CFRelease(error);
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        token.val[0] = 138412546;
        *(_QWORD *)&token.val[1] = v15;
        LOWORD(token.val[3]) = 2112;
        *(_QWORD *)((char *)&token.val[3] + 2) = v9;
        _os_log_impl(&dword_1D3352000, v12, OS_LOG_TYPE_INFO, "%@: SecTaskCopySigningIdentifier() returned csIdentity=\"%@\", (uint8_t *)&token, 0x16u);

      }
    }
    CFRelease(v8);
    return v9;
  }
  else
  {
    +[_ANELog daemon](_ANELog, "daemon");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[_ANEModelToken codeSigningIDFor:processIdentifier:].cold.1();

    return 0;
  }
}

+ (id)teamIDFor:(id *)a3 processIdentifier:(int)a4
{
  const __CFAllocator *v5;
  __int128 v6;
  SecTaskRef v7;
  SecTaskRef v8;
  uint64_t v9;
  __CFString *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v15;
  audit_token_t token;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v6 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v6;
  v7 = SecTaskCreateWithAuditToken(v5, &token);
  if (v7)
  {
    v8 = v7;
    v9 = SecTaskCopyTeamIdentifier();
    if (v9)
      v10 = (__CFString *)v9;
    else
      v10 = &stru_1E9516758;
    CFRelease(v8);
    +[_ANELog daemon](_ANELog, "daemon");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      token.val[0] = 138412546;
      *(_QWORD *)&token.val[1] = v15;
      LOWORD(token.val[3]) = 2112;
      *(_QWORD *)((char *)&token.val[3] + 2) = v10;
      _os_log_impl(&dword_1D3352000, v12, OS_LOG_TYPE_INFO, "%@: SecTaskCopyTeamIdentifier() returned teamIdentity=\"%@\", (uint8_t *)&token, 0x16u);

    }
    return v10;
  }
  else
  {
    +[_ANELog daemon](_ANELog, "daemon");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[_ANEModelToken codeSigningIDFor:processIdentifier:].cold.1();

    return &stru_1E9516758;
  }
}

- (_ANEModelToken)initWithAuditToken:(id *)a3 modelIdentifier:(id)a4 processIdentifier:(int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  __int128 v10;
  void *v11;
  void *v12;
  __int128 v13;
  void *v14;
  _ANEModelToken *v15;
  __int128 v17;
  __int128 v18;

  v5 = *(_QWORD *)&a5;
  v8 = a4;
  v9 = (void *)objc_opt_class();
  v10 = *(_OWORD *)&a3->var0[4];
  v17 = *(_OWORD *)a3->var0;
  v18 = v10;
  objc_msgSend(v9, "teamIDFor:processIdentifier:", &v17, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_class();
  v13 = *(_OWORD *)&a3->var0[4];
  v17 = *(_OWORD *)a3->var0;
  v18 = v13;
  objc_msgSend(v12, "codeSigningIDFor:processIdentifier:", &v17, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[_ANEModelToken initWithCsIdentity:teamIdentity:modelIdentifier:processIdentifier:](self, "initWithCsIdentity:teamIdentity:modelIdentifier:processIdentifier:", v14, v11, v8, v5);

  return v15;
}

- (_ANEModelToken)initWithCsIdentity:(id)a3 teamIdentity:(id)a4 modelIdentifier:(id)a5 processIdentifier:(int)a6
{
  id v11;
  id v12;
  id v13;
  _ANEModelToken *v14;
  _ANEModelToken *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)_ANEModelToken;
  v14 = -[_ANEModelToken init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_csIdentity, a3);
    objc_storeStrong((id *)&v15->_teamIdentity, a4);
    objc_storeStrong((id *)&v15->_modelIdentifier, a5);
    v15->_processIdentifier = a6;
  }

  return v15;
}

+ (id)tokenWithCsIdentity:(id)a3 teamIdentity:(id)a4 modelIdentifier:(id)a5 processIdentifier:(int)a6
{
  uint64_t v6;
  id v9;
  id v10;
  id v11;
  _ANEModelToken *v12;

  v6 = *(_QWORD *)&a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[_ANEModelToken initWithCsIdentity:teamIdentity:modelIdentifier:processIdentifier:]([_ANEModelToken alloc], "initWithCsIdentity:teamIdentity:modelIdentifier:processIdentifier:", v11, v10, v9, v6);

  return v12;
}

+ (id)tokenWithAuditToken:(id *)a3 modelIdentifier:(id)a4 processIdentifier:(int)a5
{
  uint64_t v5;
  id v7;
  _ANEModelToken *v8;
  __int128 v9;
  _ANEModelToken *v10;
  _OWORD v12[2];

  v5 = *(_QWORD *)&a5;
  v7 = a4;
  v8 = [_ANEModelToken alloc];
  v9 = *(_OWORD *)&a3->var0[4];
  v12[0] = *(_OWORD *)a3->var0;
  v12[1] = v9;
  v10 = -[_ANEModelToken initWithAuditToken:modelIdentifier:processIdentifier:](v8, "initWithAuditToken:modelIdentifier:processIdentifier:", v12, v7, v5);

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: { csIdentity=%@ : teamIdentity=%@ }"), v5, self->_csIdentity, self->_teamIdentity);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (NSString)csIdentity
{
  return self->_csIdentity;
}

- (NSString)teamIdentity
{
  return self->_teamIdentity;
}

- (int)processIdentifier
{
  return self->_processIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamIdentity, 0);
  objc_storeStrong((id *)&self->_csIdentity, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
}

+ (void)codeSigningIDFor:processIdentifier:.cold.1()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3352000, v2, v3, "%@: client(%d) : SecTaskCreateWithAuditToken() failed", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

+ (void)codeSigningIDFor:processIdentifier:.cold.2()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3352000, v2, v3, "%@: client(%d) : missing signingIdentifier", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

+ (void)teamIDFor:processIdentifier:.cold.2()
{
  SEL v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3();
  NSStringFromSelector(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D3352000, v2, v3, "%@: client(%d) : missing teamIdentity", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
