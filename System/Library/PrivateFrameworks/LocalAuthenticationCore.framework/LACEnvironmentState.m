@implementation LACEnvironmentState

- (LACEnvironmentState)initWithBiometry:(id)a3 userPassword:(id)a4 companions:(id)a5
{
  id v9;
  id v10;
  id v11;
  LACEnvironmentState *v12;
  LACEnvironmentState *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)LACEnvironmentState;
  v12 = -[LACEnvironmentState init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_biometry, a3);
    objc_storeStrong((id *)&v13->_userPassword, a4);
    objc_storeStrong((id *)&v13->_companions, a5);
  }

  return v13;
}

+ (id)environmentStateForUser:(unsigned int)a3 auditToken:(id *)a4 dependencies:(id)a5 error:(id *)a6
{
  uint64_t v7;
  id v9;
  LACEnvironmentState *v10;
  __int128 v11;
  void *v12;
  __int128 v13;
  void *v14;
  void *v15;
  LACEnvironmentState *v16;
  __int128 v18;
  __int128 v19;

  v7 = *(_QWORD *)&a3;
  v9 = a5;
  v10 = [LACEnvironmentState alloc];
  v11 = *(_OWORD *)&a4->var0[4];
  v18 = *(_OWORD *)a4->var0;
  v19 = v11;
  +[LACEnvironmentMechanismBiometry environmentMechanismForUser:auditToken:dependencies:error:](LACEnvironmentMechanismBiometry, "environmentMechanismForUser:auditToken:dependencies:error:", v7, &v18, v9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_OWORD *)&a4->var0[4];
  v18 = *(_OWORD *)a4->var0;
  v19 = v13;
  +[LACEnvironmentMechanismUserPassword environmentMechanismForUser:auditToken:dependencies:error:](LACEnvironmentMechanismUserPassword, "environmentMechanismForUser:auditToken:dependencies:error:", v7, &v18, v9, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "companionsForUser:", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[LACEnvironmentState initWithBiometry:userPassword:companions:](v10, "initWithBiometry:userPassword:companions:", v12, v14, v15);

  return v16;
}

+ (id)companionsForUser:(unsigned int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_opt_new();
  +[LACEnvironmentMechanismCompanion companionForUser:type:error:](LACEnvironmentMechanismCompanion, "companionForUser:type:error:", v3, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addObject:", v5);
  +[LACEnvironmentMechanismCompanion companionForUser:type:error:](LACEnvironmentMechanismCompanion, "companionForUser:type:error:", v3, 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v4, "addObject:", v6);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[LACEnvironmentState biometry](self, "biometry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_biometry);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[LACEnvironmentState userPassword](self, "userPassword");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_userPassword);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[LACEnvironmentState companions](self, "companions");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_companions);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

}

- (LACEnvironmentState)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  LACEnvironmentState *v11;

  v4 = a3;
  NSStringFromSelector(sel_biometry);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_userPassword);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_companions);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[LACEnvironmentState initWithBiometry:userPassword:companions:](self, "initWithBiometry:userPassword:companions:", v6, v8, v10);
  return v11;
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

  v18[3] = *MEMORY[0x24BDAC8D0];
  v17 = (void *)MEMORY[0x24BDD17C8];
  v3 = objc_opt_class();
  v4 = (void *)MEMORY[0x24BDD17C8];
  -[LACEnvironmentState biometry](self, "biometry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("biometry: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[LACEnvironmentState userPassword](self, "userPassword");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("userPassword: %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  v10 = (void *)MEMORY[0x24BDD17C8];
  -[LACEnvironmentState companions](self, "companions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("companions: %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentsJoinedByString:", CFSTR("; "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v3, self, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  LACEnvironmentState *v4;
  LACEnvironmentState *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;

  v4 = (LACEnvironmentState *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[LACEnvironmentState biometry](self, "biometry");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACEnvironmentState biometry](v5, "biometry");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {

      }
      else
      {
        v8 = (void *)v7;
        -[LACEnvironmentState biometry](self, "biometry");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[LACEnvironmentState biometry](v5, "biometry");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

        if (!v11)
          goto LABEL_11;
      }
      -[LACEnvironmentState userPassword](self, "userPassword");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACEnvironmentState userPassword](v5, "userPassword");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v13 == (void *)v14)
      {

      }
      else
      {
        v15 = (void *)v14;
        -[LACEnvironmentState userPassword](self, "userPassword");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[LACEnvironmentState userPassword](v5, "userPassword");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqual:", v17);

        if (!v18)
        {
LABEL_11:
          v12 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      -[LACEnvironmentState companions](self, "companions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[LACEnvironmentState companions](v5, "companions");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v19 == (void *)v20)
      {
        v12 = 1;
        v21 = v19;
      }
      else
      {
        v21 = (void *)v20;
        -[LACEnvironmentState companions](self, "companions");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[LACEnvironmentState companions](v5, "companions");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v22, "isEqualToArray:", v23);

      }
      goto LABEL_17;
    }
    v12 = 0;
  }
LABEL_18:

  return v12;
}

- (LACEnvironmentMechanismBiometry)biometry
{
  return self->_biometry;
}

- (void)setBiometry:(id)a3
{
  objc_storeStrong((id *)&self->_biometry, a3);
}

- (LACEnvironmentMechanismUserPassword)userPassword
{
  return self->_userPassword;
}

- (void)setUserPassword:(id)a3
{
  objc_storeStrong((id *)&self->_userPassword, a3);
}

- (NSArray)companions
{
  return self->_companions;
}

- (void)setCompanions:(id)a3
{
  objc_storeStrong((id *)&self->_companions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_companions, 0);
  objc_storeStrong((id *)&self->_userPassword, 0);
  objc_storeStrong((id *)&self->_biometry, 0);
}

@end
