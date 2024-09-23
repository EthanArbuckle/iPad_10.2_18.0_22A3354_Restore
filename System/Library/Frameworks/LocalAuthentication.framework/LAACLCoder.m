@implementation LAACLCoder

- (LAACLCoder)init
{
  char *v2;
  LAACLCoder *v3;
  void *v4;
  uint64_t v5;
  NSMutableDictionary *constraints;
  uint64_t v7;
  NSMutableDictionary *credentials;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LAACLCoder;
  v2 = -[LAACLCoder init](&v10, sel_init);
  v3 = (LAACLCoder *)v2;
  if (v2)
  {
    *(int64x2_t *)(v2 + 8) = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v4 = (void *)MEMORY[0x1E0C9AA70];
    v5 = objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
    constraints = v3->_constraints;
    v3->_constraints = (NSMutableDictionary *)v5;

    v7 = objc_msgSend(v4, "mutableCopy");
    credentials = v3->_credentials;
    v3->_credentials = (NSMutableDictionary *)v7;

  }
  return v3;
}

- (void)addConstraint:(id)a3
{
  -[NSMutableDictionary addEntriesFromDictionary:](self->_constraints, "addEntriesFromDictionary:", a3);
}

- (void)addCredential:(id)a3 credentialType:(int64_t)a4
{
  NSMutableDictionary *credentials;
  void *v6;
  id v7;
  id v8;

  credentials = self->_credentials;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](credentials, "setObject:forKeyedSubscript:", v7, v8);

}

- (void)setAuthenticationType:(int64_t)a3
{
  self->_authType = a3;
}

- (void)setFallbackAuthenticationType:(int64_t)a3
{
  self->_fallbackAuthType = a3;
}

- (id)encode
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __20__LAACLCoder_encode__block_invoke;
  v8[3] = &unk_1E7079B80;
  v8[4] = self;
  __20__LAACLCoder_encode__block_invoke((uint64_t)v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[LAACLBuilder customACL:](LAACLBuilder, "customACL:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[LAACLBuilder denyAllACL](LAACLBuilder, "denyAllACL");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

LAACLBuilderCustomACLParams *__20__LAACLCoder_encode__block_invoke(uint64_t a1)
{
  LAACLBuilderCustomACLParams *v2;

  v2 = objc_alloc_init(LAACLBuilderCustomACLParams);
  -[LAACLBuilderCustomACLParams setAuthType:](v2, "setAuthType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  -[LAACLBuilderCustomACLParams setFallbackAuthType:](v2, "setFallbackAuthType:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  -[LAACLBuilderCustomACLParams setApConstraints:](v2, "setApConstraints:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  -[LAACLBuilderCustomACLParams setCredentials:](v2, "setCredentials:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credentials, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end
