@implementation BSAuditToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[BSAuditToken _auditTokenAsData]((uint64_t)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("auditTokenValue"));
  -[BSAuditToken _bundleIDGeneratingIfNeeded:](self, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("bundleID"));

}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;

  +[BSXPCCoder coderWithMessage:](BSXPCCoder, "coderWithMessage:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAuditToken encodeWithBSXPCCoder:](self, "encodeWithBSXPCCoder:");

}

- (id)_bundleIDGeneratingIfNeeded:(void *)a1
{
  char *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (a1)
  {
    v3 = a1;
    objc_sync_enter(v3);
    if (a2 && !*((_QWORD *)v3 + 5) && !v3[56])
    {
      v3[56] = 1;
      BSBundleIDForAuditToken((__int128 *)(v3 + 8));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "copy");
      v6 = (void *)*((_QWORD *)v3 + 5);
      *((_QWORD *)v3 + 5) = v5;

    }
    v7 = *((id *)v3 + 5);
    objc_sync_exit(v3);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_auditTokenAsData
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  NSUInteger sizep;

  if (!a1)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB3B18], "value:withObjCType:", a1 + 8, "{?=[8I]}");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    sizep = 0;
    v4 = objc_retainAutorelease(v1);
    NSGetSizeAndAlignment((const char *)objc_msgSend(v4, "objCType"), &sizep, 0);
    v5 = malloc_type_malloc(sizep, 0x3DB21FE0uLL);
    objc_msgSend(v4, "getValue:", v5);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, sizep);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    free(v5);
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)valueForEntitlement:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__8;
  v15 = __Block_byref_object_dispose__8;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__BSAuditToken_valueForEntitlement___block_invoke;
  v8[3] = &unk_1E1EC0128;
  v9 = v4;
  v10 = &v11;
  v5 = v4;
  -[BSAuditToken _accessSecTask:]((uint64_t)self, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

+ (id)tokenFromMachMessage:(id *)a3
{
  char *v5;
  __int128 v6;
  void *v7;
  void *v10;
  _OWORD v11[2];
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BSAuditToken.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message"));

  }
  v5 = (char *)a3 + ((a3->var1 + 3) & 0x1FFFFFFFCLL);
  if (*(_DWORD *)v5 || *((_DWORD *)v5 + 1) < 0x20u)
  {
    v7 = 0;
  }
  else
  {
    v6 = *(_OWORD *)(v5 + 36);
    v12 = *(_OWORD *)(v5 + 20);
    v13 = v6;
    v11[0] = v12;
    v11[1] = v6;
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAuditToken:", v11);
  }
  return v7;
}

- (BOOL)hasEntitlement:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__BSAuditToken_hasEntitlement___block_invoke;
  v7[3] = &unk_1E1EC0128;
  v8 = v4;
  v9 = &v10;
  v5 = v4;
  -[BSAuditToken _accessSecTask:]((uint64_t)self, v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (void)_accessSecTask:(uint64_t)a1
{
  id v3;
  void (**v4)(_QWORD, _QWORD);
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _OWORD v10[2];

  v3 = a2;
  v4 = (void (**)(_QWORD, _QWORD))v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel__accessSecTask_, a1, CFSTR("BSAuditToken.m"), 215, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("secTaskBlock"));

    }
    v5 = *(_QWORD *)(a1 + 48);
    if (!v5)
    {
      v6 = *(_OWORD *)(a1 + 24);
      v10[0] = *(_OWORD *)(a1 + 8);
      v10[1] = v6;
      +[BSSecTask secTaskForAuditToken:]((uint64_t)BSSecTask, v10);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = v7;

      v5 = *(_QWORD *)(a1 + 48);
    }
    v4[2](v4, v5);
  }

}

void __31__BSAuditToken_hasEntitlement___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -[BSSecTask BOOLForEntitlement:]((uint64_t)v3, *(void **)(a1 + 32));

}

void __36__BSAuditToken_valueForEntitlement___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  -[BSSecTask valueForEntitlement:]((uint64_t)v6, *(void **)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BSAuditToken)initWithXPCDictionary:(id)a3
{
  void *v4;
  BSAuditToken *v5;

  +[BSXPCCoder coderWithMessage:](BSXPCCoder, "coderWithMessage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[BSAuditToken initWithBSXPCCoder:](self, "initWithBSXPCCoder:", v4);

  return v5;
}

- (BSAuditToken)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BSAuditToken *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auditTokenValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = (BSAuditToken *)-[BSAuditToken _initWithData:bundleID:](self, v5, v7);
  return v8;
}

+ (id)tokenFromAuditToken:(id *)a3
{
  id v4;
  __int128 v5;
  _OWORD v7[2];

  v4 = objc_alloc((Class)a1);
  v5 = *(_OWORD *)&a3->var0[4];
  v7[0] = *(_OWORD *)a3->var0;
  v7[1] = v5;
  return (id)objc_msgSend(v4, "initWithAuditToken:", v7);
}

- (id)_initWithData:(void *)a3 bundleID:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v19;
  id v20;
  _OWORD v21[2];
  NSUInteger sizep[2];
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!a1)
  {
    v16 = 0;
    goto LABEL_13;
  }
  v7 = v5;
  v8 = v7;
  if (!v7
    || (v9 = objc_msgSend(v7, "length"), sizep[0] = 0, NSGetSizeAndAlignment("{?=[8I]}", sizep, 0), v9 != sizep[0]))
  {

    goto LABEL_9;
  }
  v10 = (void *)MEMORY[0x1E0CB3B18];
  v11 = objc_retainAutorelease(v8);
  objc_msgSend(v10, "valueWithBytes:objCType:", objc_msgSend(v11, "bytes"), "{?=[8I]}");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_9:
    BSLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_opt_class();
      LODWORD(sizep[0]) = 138543362;
      *(NSUInteger *)((char *)sizep + 4) = (NSUInteger)v19;
      v20 = v19;
      _os_log_error_impl(&dword_18A184000, v17, OS_LOG_TYPE_ERROR, "Failed to decode audit token for %{public}@ - returning nil from initializer", (uint8_t *)sizep, 0xCu);

    }
    v12 = 0;
    v16 = 0;
    goto LABEL_12;
  }
  *(_QWORD *)&v13 = -1;
  *((_QWORD *)&v13 + 1) = -1;
  *(_OWORD *)sizep = v13;
  v23 = v13;
  objc_msgSend(v12, "getValue:", sizep);
  v21[0] = *(_OWORD *)sizep;
  v21[1] = v23;
  v14 = objc_msgSend(a1, "initWithAuditToken:", v21);
  v15 = (void *)v14;
  if (v14)
    objc_storeStrong((id *)(v14 + 40), a3);
  a1 = v15;
  v16 = a1;
LABEL_12:

LABEL_13:
  return v16;
}

- (BOOL)isEqual:(id)a3
{
  BSAuditToken *v4;
  BSAuditToken *v5;
  __int128 v6;
  BOOL v10;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = (BSAuditToken *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4)
    {
      v10 = 1;
    }
    else
    {
      -[BSAuditToken realToken](v4, "realToken");
      v6 = *(_OWORD *)&self->_auditToken.val[4];
      v12 = *(_OWORD *)self->_auditToken.val;
      v10 = (_QWORD)v12 == v13 && *((_QWORD *)&v12 + 1) == v14 && (_QWORD)v6 == v15 && *((_QWORD *)&v6 + 1) == v16;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BSAuditToken)initWithAuditToken:(id *)a3
{
  char *v4;
  _BOOL4 IsValid;
  $115C4C562B26FF47E01F9F4EA65B5887 *v6;
  __int128 v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BSAuditToken;
  v4 = -[BSAuditToken init](&v9, sel_init);
  if (v4)
  {
    IsValid = BSAuditTokenIsValid((uint64_t)a3);
    v6 = ($115C4C562B26FF47E01F9F4EA65B5887 *)&BSInvalidAuditToken;
    if (IsValid)
      v6 = a3;
    v7 = *(_OWORD *)&v6->var0[4];
    *(_OWORD *)(v4 + 8) = *(_OWORD *)v6->var0;
    *(_OWORD *)(v4 + 24) = v7;
  }
  return (BSAuditToken *)v4;
}

- (unint64_t)hash
{
  return -[BSAuditToken pid](self, "pid");
}

- (int64_t)versionedPID
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *(_OWORD *)&self->_auditToken.val[4];
  v4[0] = *(_OWORD *)self->_auditToken.val;
  v4[1] = v2;
  return BSVersionedPIDForAuditToken(v4);
}

- ($115C4C562B26FF47E01F9F4EA65B5887)realToken
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var0[6];
  *(_OWORD *)retstr->var0 = *(_OWORD *)&self->var0[2];
  *(_OWORD *)&retstr->var0[4] = v3;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secTask, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

- (NSString)bundleID
{
  return (NSString *)-[BSAuditToken _bundleIDGeneratingIfNeeded:](self, 1);
}

- (BOOL)isInvalid
{
  return !BSAuditTokenIsValid((uint64_t)&self->_auditToken);
}

+ (id)tokenFromAuditTokenRef:(id *)a3
{
  __int128 v5;
  void *v8;
  _OWORD v9[2];

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BSAuditToken.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("auditToken"));

  }
  v5 = *(_OWORD *)&a3->var0[4];
  v9[0] = *(_OWORD *)a3->var0;
  v9[1] = v5;
  objc_msgSend(a1, "tokenFromAuditToken:", v9);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)tokenFromNSXPCConnection:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v9;
  _OWORD v10[2];

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "auditToken");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BSAuditToken.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

    memset(v10, 0, sizeof(v10));
  }
  objc_msgSend(a1, "tokenFromAuditToken:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int)pid
{
  return BSPIDForAuditToken(self->_auditToken.val);
}

+ (id)tokenFromXPCConnection:(id)a3
{
  id v5;
  __int128 v6;
  void *v7;
  void *v9;
  _OWORD v10[2];
  __int128 v11;
  __int128 v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BSAuditToken.m"), 65, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("connection"));

  }
  *(_QWORD *)&v6 = -1;
  *((_QWORD *)&v6 + 1) = -1;
  v11 = v6;
  v12 = v6;
  xpc_connection_get_audit_token();
  v10[0] = v11;
  v10[1] = v12;
  objc_msgSend(a1, "tokenFromAuditToken:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)tokenForCurrentProcess
{
  id v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _OWORD v9[2];

  v2 = objc_alloc((Class)a1);
  BSAuditTokenForCurrentProcess(v9);
  v3 = (_QWORD *)objc_msgSend(v2, "initWithAuditToken:", v9);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copy");
    v7 = (void *)v3[5];
    v3[5] = v6;

  }
  return v3;
}

+ (id)tokenFromXPCMessage:(id)a3
{
  id v5;
  id v6;
  id v7;
  __int128 v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  void *v17;
  _OWORD v18[2];
  __int128 v19;
  __int128 v20;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("BSAuditToken.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message"));

  }
  v6 = objc_alloc((Class)a1);
  v7 = v5;
  if (v6)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithXPCMessage_, v6, CFSTR("BSAuditToken.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message"));

    }
    *(_QWORD *)&v8 = -1;
    *((_QWORD *)&v8 + 1) = -1;
    v19 = v8;
    v20 = v8;
    xpc_dictionary_get_audit_token();
    v18[0] = v19;
    v18[1] = v20;
    v9 = (_QWORD *)objc_msgSend(v6, "initWithAuditToken:", v18);
    if (v9)
    {
      xpc_dictionary_get_remote_connection(v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        _BSBundleIDForXPCConnectionAndIKnowWhatImDoingISwear(v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "copy");
        v14 = (void *)v9[5];
        v9[5] = v13;

      }
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)invalidToken
{
  __int128 v2;
  _OWORD v4[2];

  *(_QWORD *)&v2 = -1;
  *((_QWORD *)&v2 + 1) = -1;
  v4[0] = v2;
  v4[1] = v2;
  +[BSAuditToken tokenFromAuditToken:](BSAuditToken, "tokenFromAuditToken:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)asid
{
  return BSASIDForAuditToken(self->_auditToken.val);
}

- (unsigned)euid
{
  return BSEUIDForAuditToken(self->_auditToken.val);
}

- (unsigned)egid
{
  return BSEGIDForAuditToken(self->_auditToken.val);
}

- (BOOL)hasSameProcessAsAuditToken:(id)a3
{
  id v4;
  void *v5;
  __int128 v6;
  BOOL v7;
  __int128 v9[2];
  __int128 v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "realToken");
    v6 = *(_OWORD *)&self->_auditToken.val[4];
    v9[0] = *(_OWORD *)self->_auditToken.val;
    v9[1] = v6;
    v7 = BSEqualProcessAuditTokens(v9, &v10);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (BSAuditToken)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BSAuditToken *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("auditTokenValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = (BSAuditToken *)-[BSAuditToken _initWithData:bundleID:](self, v5, v7);
  return v8;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[BSAuditToken _auditTokenAsData]((uint64_t)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("auditTokenValue"));
  -[BSAuditToken _bundleIDGeneratingIfNeeded:](self, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("bundleID"));

}

- (NSString)description
{
  void *v3;
  __int128 v4;
  id v5;
  $0B20F48E2CD2D778BD1F216BA81B71CE *p_auditToken;
  __int128 v7;
  id v8;
  __int128 v9;
  id v10;
  __int128 v11;
  id v12;
  __int128 v13;
  id v14;
  __int128 v15;
  id v16;
  __int128 v17;
  id v18;
  __int128 v19;
  id v20;
  void *v21;
  audit_token_t v23;

  +[BSDescriptionBuilder builderWithObject:](BSDescriptionBuilder, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BSAuditToken isInvalid](self, "isInvalid"))
  {
    objc_msgSend(v3, "appendString:withName:", CFSTR("INVALID"), 0);
  }
  else
  {
    v4 = *(_OWORD *)&self->_auditToken.val[4];
    *(_OWORD *)v23.val = *(_OWORD *)self->_auditToken.val;
    *(_OWORD *)&v23.val[4] = v4;
    v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", audit_token_to_auid(&v23), CFSTR("AUID"));
    p_auditToken = &self->_auditToken;
    v7 = *(_OWORD *)&p_auditToken->val[4];
    *(_OWORD *)v23.val = *(_OWORD *)p_auditToken->val;
    *(_OWORD *)&v23.val[4] = v7;
    v8 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", audit_token_to_euid(&v23), CFSTR("EUID"));
    v9 = *(_OWORD *)&p_auditToken->val[4];
    *(_OWORD *)v23.val = *(_OWORD *)p_auditToken->val;
    *(_OWORD *)&v23.val[4] = v9;
    v10 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", audit_token_to_egid(&v23), CFSTR("EGID"));
    v11 = *(_OWORD *)&p_auditToken->val[4];
    *(_OWORD *)v23.val = *(_OWORD *)p_auditToken->val;
    *(_OWORD *)&v23.val[4] = v11;
    v12 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", audit_token_to_ruid(&v23), CFSTR("RUID"));
    v13 = *(_OWORD *)&p_auditToken->val[4];
    *(_OWORD *)v23.val = *(_OWORD *)p_auditToken->val;
    *(_OWORD *)&v23.val[4] = v13;
    v14 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", audit_token_to_rgid(&v23), CFSTR("RGID"));
    v15 = *(_OWORD *)&p_auditToken->val[4];
    *(_OWORD *)v23.val = *(_OWORD *)p_auditToken->val;
    *(_OWORD *)&v23.val[4] = v15;
    v16 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", audit_token_to_pid(&v23), CFSTR("PID"));
    v17 = *(_OWORD *)&p_auditToken->val[4];
    *(_OWORD *)v23.val = *(_OWORD *)p_auditToken->val;
    *(_OWORD *)&v23.val[4] = v17;
    v18 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", audit_token_to_asid(&v23), CFSTR("ASID"));
    v19 = *(_OWORD *)&p_auditToken->val[4];
    *(_OWORD *)v23.val = *(_OWORD *)p_auditToken->val;
    *(_OWORD *)&v23.val[4] = v19;
    v20 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", audit_token_to_pidversion(&v23), CFSTR("PIDVersion"));
  }
  objc_msgSend(v3, "build");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v21;
}

@end
