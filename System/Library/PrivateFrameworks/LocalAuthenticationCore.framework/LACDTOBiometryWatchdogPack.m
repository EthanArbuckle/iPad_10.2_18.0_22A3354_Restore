@implementation LACDTOBiometryWatchdogPack

- (LACDTOBiometryWatchdogPack)initWithBiometryWatchdogGlobal:(id)a3 biometryWatchdogDTO:(id)a4
{
  id v7;
  id v8;
  LACDTOBiometryWatchdogPack *v9;
  LACDTOBiometryWatchdogPack *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)LACDTOBiometryWatchdogPack;
  v9 = -[LACDTOBiometryWatchdogPack init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_biometryWatchdogGlobal, a3);
    objc_storeStrong((id *)&v10->_biometryWatchdogDTO, a4);
  }

  return v10;
}

- (BOOL)isBarking
{
  void *v3;
  char v4;
  void *v5;

  -[LACDTOBiometryWatchdogPack biometryWatchdogDTO](self, "biometryWatchdogDTO");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isBarking") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[LACDTOBiometryWatchdogPack biometryWatchdogGlobal](self, "biometryWatchdogGlobal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isBarking");

  }
  return v4;
}

+ (id)nullInstance
{
  LACDTOBiometryWatchdogPack *v2;
  void *v3;
  void *v4;
  LACDTOBiometryWatchdogPack *v5;

  v2 = [LACDTOBiometryWatchdogPack alloc];
  +[LACDTOBiometryWatchdog nullInstance](LACDTOBiometryWatchdog, "nullInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[LACDTOBiometryWatchdog nullInstance](LACDTOBiometryWatchdog, "nullInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LACDTOBiometryWatchdogPack initWithBiometryWatchdogGlobal:biometryWatchdogDTO:](v2, "initWithBiometryWatchdogGlobal:biometryWatchdogDTO:", v3, v4);

  return v5;
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
  id v8;

  v4 = a3;
  -[LACDTOBiometryWatchdogPack biometryWatchdogGlobal](self, "biometryWatchdogGlobal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_biometryWatchdogGlobal);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[LACDTOBiometryWatchdogPack biometryWatchdogDTO](self, "biometryWatchdogDTO");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_biometryWatchdogDTO);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, v7);

}

- (LACDTOBiometryWatchdogPack)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  LACDTOBiometryWatchdogPack *v11;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_biometryWatchdogGlobal);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_biometryWatchdogDTO);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[LACDTOBiometryWatchdogPack initWithBiometryWatchdogGlobal:biometryWatchdogDTO:](self, "initWithBiometryWatchdogGlobal:biometryWatchdogDTO:", v7, v10);
  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
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

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[LACDTOBiometryWatchdogPack biometryWatchdogGlobal](self, "biometryWatchdogGlobal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "biometryWatchdogGlobal");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[LACDTOBiometryWatchdogPack biometryWatchdogGlobal](self, "biometryWatchdogGlobal");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "biometryWatchdogGlobal");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
      {
        v12 = 0;
LABEL_11:

        goto LABEL_12;
      }
    }
    -[LACDTOBiometryWatchdogPack biometryWatchdogDTO](self, "biometryWatchdogDTO");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "biometryWatchdogDTO");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {
      v12 = 1;
      v15 = v13;
    }
    else
    {
      v15 = (void *)v14;
      -[LACDTOBiometryWatchdogPack biometryWatchdogDTO](self, "biometryWatchdogDTO");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "biometryWatchdogDTO");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v16, "isEqual:", v17);

    }
    goto LABEL_11;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOBiometryWatchdogPack biometryWatchdogGlobal](self, "biometryWatchdogGlobal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("biometryWatchdogGlobal: %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v8 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOBiometryWatchdogPack biometryWatchdogDTO](self, "biometryWatchdogDTO");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("biometryWatchdogDTO: %@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR("; "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v4, self, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (LACDTOBiometryWatchdog)biometryWatchdogGlobal
{
  return self->_biometryWatchdogGlobal;
}

- (LACDTOBiometryWatchdog)biometryWatchdogDTO
{
  return self->_biometryWatchdogDTO;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biometryWatchdogDTO, 0);
  objc_storeStrong((id *)&self->_biometryWatchdogGlobal, 0);
}

@end
