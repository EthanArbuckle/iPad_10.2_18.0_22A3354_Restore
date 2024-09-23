@implementation LADomainState

- (LADomainState)initWithResult:(id)a3
{
  id v4;
  LADomainState *v5;
  LADomainStateBiometry *v6;
  LADomainStateBiometry *biometry;
  LADomainStateCompanion *v8;
  LADomainStateCompanion *companion;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LADomainState;
  v5 = -[LADomainState init](&v11, sel_init);
  if (v5)
  {
    v6 = -[LADomainStateBiometry initWithResult:]([LADomainStateBiometry alloc], "initWithResult:", v4);
    biometry = v5->_biometry;
    v5->_biometry = v6;

    v8 = -[LADomainStateCompanion initWithResult:]([LADomainStateCompanion alloc], "initWithResult:", v4);
    companion = v5->_companion;
    v5->_companion = v8;

    -[LADomainState _resolveCombinedStateHash](v5, "_resolveCombinedStateHash");
  }

  return v5;
}

- (NSData)stateHash
{
  return self->_stateHash;
}

- (void)_resolveCombinedStateHash
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSData *v10;
  void *v11;
  NSData *stateHash;
  id v13;

  -[LADomainStateCompanion stateHash](self->_companion, "stateHash");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[LADomainStateBiometry stateHash](self->_biometry, "stateHash");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v13 = (id)objc_opt_new();
      -[LADomainStateBiometry stateHash](self->_biometry, "stateHash");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[LADomainStateBiometry stateHash](self->_biometry, "stateHash");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendData:", v7);

      }
      -[LADomainStateCompanion stateHash](self->_companion, "stateHash");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[LADomainStateCompanion stateHash](self->_companion, "stateHash");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appendData:", v9);

      }
      if (!objc_msgSend(v13, "length"))
      {
        stateHash = self->_stateHash;
        self->_stateHash = 0;
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0D443D0], "createHashForDomainState:", v13);
      v10 = (NSData *)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  -[LADomainStateBiometry stateHash](self->_biometry, "stateHash");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v13 = 0;
    -[LADomainStateCompanion stateHash](self->_companion, "stateHash");
    v10 = (NSData *)objc_claimAutoreleasedReturnValue();
LABEL_12:
    stateHash = self->_stateHash;
    goto LABEL_13;
  }
  v10 = v11;
  stateHash = self->_stateHash;
  v13 = v10;
LABEL_13:
  self->_stateHash = v10;
LABEL_14:

}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
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
  void *v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v17 = (void *)MEMORY[0x1E0CB3940];
  v3 = objc_opt_class();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[LADomainState biometry](self, "biometry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("biometry: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[LADomainState companion](self, "companion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("companion: %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  v10 = (void *)MEMORY[0x1E0CB3940];
  -[LADomainState stateHash](self, "stateHash");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("stateHash: %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentsJoinedByString:", CFSTR("; "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v3, self, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (LADomainStateBiometry)biometry
{
  return self->_biometry;
}

- (LADomainStateCompanion)companion
{
  return self->_companion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companion, 0);
  objc_storeStrong((id *)&self->_biometry, 0);
  objc_storeStrong((id *)&self->_stateHash, 0);
}

@end
