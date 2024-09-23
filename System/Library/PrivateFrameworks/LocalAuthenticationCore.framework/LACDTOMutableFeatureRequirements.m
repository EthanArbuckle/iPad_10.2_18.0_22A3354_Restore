@implementation LACDTOMutableFeatureRequirements

- (LACDTOMutableFeatureRequirements)initWithRequirements:(id)a3
{
  id v4;
  LACDTOMutableFeatureRequirements *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)LACDTOMutableFeatureRequirements;
  v5 = -[LACDTOMutableFeatureRequirements init](&v7, sel_init);
  if (v5)
  {
    v5->_hasPasscodeSet = objc_msgSend(v4, "hasPasscodeSet");
    v5->_hasBiometricEnrollments = objc_msgSend(v4, "hasBiometricEnrollments");
    v5->_hasHSA2Account = objc_msgSend(v4, "hasHSA2Account");
    v5->_hasLocationServicesEnabled = objc_msgSend(v4, "hasLocationServicesEnabled");
  }

  return v5;
}

+ (id)nullInstance
{
  LACDTOMutableFeatureRequirements *v2;

  v2 = objc_alloc_init(LACDTOMutableFeatureRequirements);
  -[LACDTOMutableFeatureRequirements setHasPasscodeSet:](v2, "setHasPasscodeSet:", 0);
  -[LACDTOMutableFeatureRequirements setHasBiometricEnrollments:](v2, "setHasBiometricEnrollments:", 0);
  -[LACDTOMutableFeatureRequirements setHasHSA2Account:](v2, "setHasHSA2Account:", 0);
  -[LACDTOMutableFeatureRequirements setHasLocationServicesEnabled:](v2, "setHasLocationServicesEnabled:", 0);
  return v2;
}

- (BOOL)hasAPRequirements
{
  BOOL v3;
  char v4;
  BOOL v5;

  v3 = -[LACDTOMutableFeatureRequirements hasPasscodeSet](self, "hasPasscodeSet");
  v4 = v3 & -[LACDTOMutableFeatureRequirements hasBiometricEnrollments](self, "hasBiometricEnrollments");
  v5 = -[LACDTOMutableFeatureRequirements hasHSA2Account](self, "hasHSA2Account");
  return v4 & v5 & -[LACDTOMutableFeatureRequirements hasLocationServicesEnabled](self, "hasLocationServicesEnabled");
}

- (BOOL)hasSEPRequirements
{
  BOOL v3;

  v3 = -[LACDTOMutableFeatureRequirements hasPasscodeSet](self, "hasPasscodeSet");
  return v3 & -[LACDTOMutableFeatureRequirements hasBiometricEnrollments](self, "hasBiometricEnrollments");
}

- (NSString)description
{
  void *v3;
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
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[7];

  v27[6] = *MEMORY[0x24BDAC8D0];
  v23 = (void *)MEMORY[0x24BDD17C8];
  v21 = objc_opt_class();
  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[LACDTOMutableFeatureRequirements hasPasscodeSet](self, "hasPasscodeSet"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("hasPasscodeSet: %@"), v26);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v25;
  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[LACDTOMutableFeatureRequirements hasBiometricEnrollments](self, "hasBiometricEnrollments"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("hasBiometricEnrollments: %@"), v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v22;
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[LACDTOMutableFeatureRequirements hasLocationServicesEnabled](self, "hasLocationServicesEnabled"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("hasLocationServicesEnabled: %@"), v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v6;
  v7 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[LACDTOMutableFeatureRequirements hasHSA2Account](self, "hasHSA2Account"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("hasHSA2Account: %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v9;
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[LACDTOMutableFeatureRequirements hasSEPRequirements](self, "hasSEPRequirements"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("hasSEPRequirements: %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[4] = v12;
  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[LACDTOMutableFeatureRequirements hasAPRequirements](self, "hasAPRequirements"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("hasAPRequirements: %@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27[5] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "componentsJoinedByString:", CFSTR("; "));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v21, self, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  _BOOL4 v13;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_257082500))
  {
    v5 = v4;
    v6 = -[LACDTOMutableFeatureRequirements hasPasscodeSet](self, "hasPasscodeSet");
    if (v6 == objc_msgSend(v5, "hasPasscodeSet")
      && (v7 = -[LACDTOMutableFeatureRequirements hasBiometricEnrollments](self, "hasBiometricEnrollments"),
          v7 == objc_msgSend(v5, "hasBiometricEnrollments"))
      && (v8 = -[LACDTOMutableFeatureRequirements hasLocationServicesEnabled](self, "hasLocationServicesEnabled"),
          v8 == objc_msgSend(v5, "hasLocationServicesEnabled"))
      && (v9 = -[LACDTOMutableFeatureRequirements hasHSA2Account](self, "hasHSA2Account"),
          v9 == objc_msgSend(v5, "hasHSA2Account"))
      && (v10 = -[LACDTOMutableFeatureRequirements hasSEPRequirements](self, "hasSEPRequirements"),
          v10 == objc_msgSend(v5, "hasSEPRequirements")))
    {
      v13 = -[LACDTOMutableFeatureRequirements hasAPRequirements](self, "hasAPRequirements");
      v11 = v13 ^ objc_msgSend(v5, "hasAPRequirements") ^ 1;
    }
    else
    {
      LOBYTE(v11) = 0;
    }

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)hasPasscodeSet
{
  return self->_hasPasscodeSet;
}

- (void)setHasPasscodeSet:(BOOL)a3
{
  self->_hasPasscodeSet = a3;
}

- (BOOL)hasBiometricEnrollments
{
  return self->_hasBiometricEnrollments;
}

- (void)setHasBiometricEnrollments:(BOOL)a3
{
  self->_hasBiometricEnrollments = a3;
}

- (BOOL)hasLocationServicesEnabled
{
  return self->_hasLocationServicesEnabled;
}

- (void)setHasLocationServicesEnabled:(BOOL)a3
{
  self->_hasLocationServicesEnabled = a3;
}

- (BOOL)hasHSA2Account
{
  return self->_hasHSA2Account;
}

- (void)setHasHSA2Account:(BOOL)a3
{
  self->_hasHSA2Account = a3;
}

@end
