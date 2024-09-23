@implementation LACDTOMutableLostModeFetchRequest

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_257082360))
  {
    v5 = v4;
    v6 = -[LACDTOMutableLostModeFetchRequest policy](self, "policy");
    if (v6 == objc_msgSend(v5, "policy"))
    {
      -[LACDTOMutableLostModeFetchRequest options](self, "options");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "options");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        -[LACDTOMutableLostModeFetchRequest options](self, "options");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "options");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToDictionary:", v11);

        if (!v12)
          goto LABEL_11;
      }
      v14 = -[LACDTOMutableLostModeFetchRequest isDTOEnabled](self, "isDTOEnabled");
      if (v14 == objc_msgSend(v5, "isDTOEnabled"))
      {
        -[LACDTOMutableLostModeFetchRequest ratchetState](self, "ratchetState");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "ratchetState");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v15 == (void *)v16)
        {

        }
        else
        {
          v17 = (void *)v16;
          -[LACDTOMutableLostModeFetchRequest ratchetState](self, "ratchetState");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "ratchetState");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqual:", v19);

          if (!v20)
            goto LABEL_11;
        }
        -[LACDTOMutableLostModeFetchRequest biometryWatchdogPack](self, "biometryWatchdogPack");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "biometryWatchdogPack");
        v23 = objc_claimAutoreleasedReturnValue();
        if (v22 == (void *)v23)
        {
          v13 = 1;
          v24 = v22;
        }
        else
        {
          v24 = (void *)v23;
          -[LACDTOMutableLostModeFetchRequest biometryWatchdogPack](self, "biometryWatchdogPack");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "biometryWatchdogPack");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v25, "isEqual:", v26);

        }
        goto LABEL_12;
      }
    }
LABEL_11:
    v13 = 0;
LABEL_12:

    goto LABEL_13;
  }
  v13 = 0;
LABEL_13:

  return v13;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
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
  uint64_t v20;
  void *v21;
  void *v22;
  _QWORD v23[6];

  v23[5] = *MEMORY[0x24BDAC8D0];
  v21 = (void *)MEMORY[0x24BDD17C8];
  v20 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("policy: %d"), -[LACDTOMutableLostModeFetchRequest policy](self, "policy"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v22;
  v3 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOMutableLostModeFetchRequest options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("options: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v5;
  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = -[LACDTOMutableLostModeFetchRequest isDTOEnabled](self, "isDTOEnabled");
  v8 = CFSTR("NO");
  if (v7)
    v8 = CFSTR("YES");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("isDTOEnabled: %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v9;
  v10 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOMutableLostModeFetchRequest ratchetState](self, "ratchetState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("ratchetState: %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v12;
  v13 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOMutableLostModeFetchRequest biometryWatchdogPack](self, "biometryWatchdogPack");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("biometryWatchdogPack: %@"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "componentsJoinedByString:", CFSTR("; "));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v20, self, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v18;
}

- (int64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(int64_t)a3
{
  self->_policy = a3;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (BOOL)isDTOEnabled
{
  return self->_isDTOEnabled;
}

- (void)setIsDTOEnabled:(BOOL)a3
{
  self->_isDTOEnabled = a3;
}

- (LACDTORatchetState)ratchetState
{
  return self->_ratchetState;
}

- (void)setRatchetState:(id)a3
{
  objc_storeStrong((id *)&self->_ratchetState, a3);
}

- (LACDTOBiometryWatchdogPack)biometryWatchdogPack
{
  return self->_biometryWatchdogPack;
}

- (void)setBiometryWatchdogPack:(id)a3
{
  objc_storeStrong((id *)&self->_biometryWatchdogPack, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biometryWatchdogPack, 0);
  objc_storeStrong((id *)&self->_ratchetState, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
