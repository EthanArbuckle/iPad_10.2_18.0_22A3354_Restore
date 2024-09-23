@implementation LABiometryFallbackRequirement

- (id)initWithAuthenticationType:(void *)a3 subrequirements:
{
  id v6;
  id *v7;
  objc_super v9;

  v6 = a3;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)LABiometryFallbackRequirement;
    v7 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      v7[1] = a2;
      objc_storeStrong(v7 + 2, a3);
    }
  }

  return a1;
}

+ (LABiometryFallbackRequirement)devicePasscodeRequirement
{
  LABiometryFallbackRequirement *v2;

  v2 = [LABiometryFallbackRequirement alloc];
  return (LABiometryFallbackRequirement *)-[LABiometryFallbackRequirement initWithAuthenticationType:subrequirements:]((id *)&v2->super.isa, (void *)0x10, MEMORY[0x1E0C9AA60]);
}

+ (id)customPasswordRequirement:(id)a3
{
  id v3;
  LABiometryFallbackRequirement *v4;
  void *v5;
  id *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = [LABiometryFallbackRequirement alloc];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[LABiometryFallbackRequirement initWithAuthenticationType:subrequirements:]((id *)&v4->super.isa, (void *)0x80000000, v5);
  return v6;
}

- (void)encodeWithACLCoder:(id)a3
{
  id v4;
  NSArray *v5;
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
  objc_msgSend(v4, "setFallbackAuthenticationType:", self->_authType);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_subrequirements;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && v4[1] == self->_authType;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subrequirements, 0);
}

@end
