@implementation LAAuthenticationRequirement

- (LAAuthenticationRequirement)init
{
  return (LAAuthenticationRequirement *)-[LAAuthenticationRequirement initWithAuthenticationType:](self, 1);
}

- (_QWORD)initWithAuthenticationType:(void *)a1
{
  _QWORD *v3;
  _QWORD *v4;
  id v5;
  void *v6;
  objc_super v8;

  if (!a1)
    return 0;
  v8.receiver = a1;
  v8.super_class = (Class)LAAuthenticationRequirement;
  v3 = objc_msgSendSuper2(&v8, sel_init);
  v4 = v3;
  if (v3)
  {
    v3[1] = a2;
    v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = (void *)v4[2];
    v4[2] = v5;

  }
  return v4;
}

+ (LAAuthenticationRequirement)defaultRequirement
{
  return (LAAuthenticationRequirement *)-[LAAuthenticationRequirement initWithAuthenticationType:]([LAAuthenticationRequirement alloc], 1);
}

+ (LAAuthenticationRequirement)biometryRequirement
{
  return (LAAuthenticationRequirement *)-[LAAuthenticationRequirement initWithAuthenticationType:]([LAAuthenticationRequirement alloc], 2);
}

+ (LAAuthenticationRequirement)biometryCurrentSetRequirement
{
  return (LAAuthenticationRequirement *)-[LAAuthenticationRequirement initWithAuthenticationType:]([LAAuthenticationRequirement alloc], 8);
}

+ (LAAuthenticationRequirement)biometryRequirementWithFallback:(LABiometryFallbackRequirement *)fallback
{
  LABiometryFallbackRequirement *v3;
  id *v4;

  v3 = fallback;
  v4 = (id *)-[LAAuthenticationRequirement initWithAuthenticationType:]([LAAuthenticationRequirement alloc], 2);
  objc_msgSend(v4[2], "addObject:", v3);

  return (LAAuthenticationRequirement *)v4;
}

+ (id)biometryCurrentSetRequirementWithFallback:(id)a3
{
  id v3;
  id *v4;

  v3 = a3;
  v4 = (id *)-[LAAuthenticationRequirement initWithAuthenticationType:]([LAAuthenticationRequirement alloc], 8);
  objc_msgSend(v4[2], "addObject:", v3);

  return v4;
}

+ (id)biometryRefreshableSetRequirementWithFallback:(id)a3
{
  id v3;
  id *v4;

  v3 = a3;
  v4 = (id *)-[LAAuthenticationRequirement initWithAuthenticationType:]([LAAuthenticationRequirement alloc], 8);
  objc_msgSend(v4[2], "addObject:", v3);

  return v4;
}

- (id)requirementByAddingExtendedRequirement:(id)a3
{
  id v4;
  id *v5;
  uint64_t v6;
  id v7;

  v4 = a3;
  v5 = (id *)-[LAAuthenticationRequirement initWithAuthenticationType:]([LAAuthenticationRequirement alloc], self->_authType);
  v6 = -[NSMutableSet mutableCopy](self->_subrequirements, "mutableCopy");
  v7 = v5[2];
  v5[2] = (id)v6;

  objc_msgSend(v5[2], "addObject:", v4);
  return v5;
}

- (id)key
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  v3 = _os_activity_create(&dword_1B971E000, "LocalAuthentication.Authorization.getRequirementKey", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__LAAuthenticationRequirement_key__block_invoke;
  v6[3] = &unk_1E7079300;
  v6[4] = self;
  v6[5] = &v7;
  os_activity_apply(v3, v6);
  v4 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  return v4;
}

void __34__LAAuthenticationRequirement_key__block_invoke(uint64_t a1)
{
  void *v2;
  LAAccessKey *v3;
  uint64_t v4;
  void *v5;
  LAACLCoder *v6;

  v6 = objc_alloc_init(LAACLCoder);
  objc_msgSend(*(id *)(a1 + 32), "encodeWithACLCoder:", v6);
  -[LAACLCoder encode](v6, "encode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[LAAccessKey initWithACL:]([LAAccessKey alloc], "initWithACL:", v2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)encodeWithACLCoder:(id)a3
{
  id v4;
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "setAuthenticationType:", self->_authType);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_subrequirements;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "encodeWithACLCoder:", v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableSet **v5;
  NSMutableSet **v6;
  NSMutableSet *v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NSMutableSet **)v4;
    v6 = v5;
    v8 = 0;
    if (v5[1] == (NSMutableSet *)self->_authType)
    {
      v7 = v5[2];
      if (v7 == self->_subrequirements || -[NSMutableSet isEqualToSet:](v7, "isEqualToSet:"))
        v8 = 1;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subrequirements, 0);
}

@end
