@implementation LACDTOMutableSensorTrustState

- (LACDTOMutableSensorTrustState)initWithTrustState:(id)a3
{
  id v4;
  LACDTOMutableSensorTrustState *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LACDTOMutableSensorTrustState;
  v5 = -[LACDTOMutableSensorTrustState init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "installedSensorID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACDTOMutableSensorTrustState setInstalledSensorID:](v5, "setInstalledSensorID:", v6);

    objc_msgSend(v4, "trustedSensorID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[LACDTOMutableSensorTrustState setTrustedSensorID:](v5, "setTrustedSensorID:", v7);

  }
  return v5;
}

+ (id)nullInstance
{
  LACDTOMutableSensorTrustState *v2;

  v2 = objc_alloc_init(LACDTOMutableSensorTrustState);
  -[LACDTOMutableSensorTrustState setInstalledSensorID:](v2, "setInstalledSensorID:", 0);
  -[LACDTOMutableSensorTrustState setTrustedSensorID:](v2, "setTrustedSensorID:", 0);
  return v2;
}

- (BOOL)isDisapproved
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  -[LACDTOMutableSensorTrustState trustedSensorID](self, "trustedSensorID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (!v4)
    return 0;
  -[LACDTOMutableSensorTrustState trustedSensorID](self, "trustedSensorID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LACDTOMutableSensorTrustState _containsDisapprovedSensorIDFlag:](self, "_containsDisapprovedSensorIDFlag:", v5);

  return v6;
}

- (void)disapprove
{
  id v3;

  -[LACDTOMutableSensorTrustState _disapprovedSensorIDFlag](self, "_disapprovedSensorIDFlag");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[LACDTOMutableSensorTrustState setTrustedSensorID:](self, "setTrustedSensorID:", v3);

}

- (BOOL)_containsDisapprovedSensorIDFlag:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", objc_msgSend(v3, "length"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "resetBytesInRange:", 0, objc_msgSend(v4, "length"));
    v5 = objc_msgSend(v3, "isEqual:", v4);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_disapprovedSensorIDFlag
{
  char v3;

  v3 = 0;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)description
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
  -[LACDTOMutableSensorTrustState installedSensorID](self, "installedSensorID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("installedSensorID: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[LACDTOMutableSensorTrustState trustedSensorID](self, "trustedSensorID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("trustedSensorID: %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[LACDTOMutableSensorTrustState isDisapproved](self, "isDisapproved"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("isDisapproved: %@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentsJoinedByString:", CFSTR("; "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v3, self, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
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
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  _BOOL4 v19;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_257087C38))
  {
    v5 = v4;
    -[LACDTOMutableSensorTrustState installedSensorID](self, "installedSensorID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "installedSensorID");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[LACDTOMutableSensorTrustState installedSensorID](self, "installedSensorID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "installedSensorID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (!v11)
        goto LABEL_9;
    }
    -[LACDTOMutableSensorTrustState trustedSensorID](self, "trustedSensorID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "trustedSensorID");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[LACDTOMutableSensorTrustState trustedSensorID](self, "trustedSensorID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trustedSensorID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
      {
LABEL_9:
        LOBYTE(v12) = 0;
LABEL_12:

        goto LABEL_13;
      }
    }
    v19 = -[LACDTOMutableSensorTrustState isDisapproved](self, "isDisapproved");
    v12 = v19 ^ objc_msgSend(v5, "isDisapproved") ^ 1;
    goto LABEL_12;
  }
  LOBYTE(v12) = 0;
LABEL_13:

  return v12;
}

- (NSData)installedSensorID
{
  return self->_installedSensorID;
}

- (void)setInstalledSensorID:(id)a3
{
  objc_storeStrong((id *)&self->_installedSensorID, a3);
}

- (NSData)trustedSensorID
{
  return self->_trustedSensorID;
}

- (void)setTrustedSensorID:(id)a3
{
  objc_storeStrong((id *)&self->_trustedSensorID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trustedSensorID, 0);
  objc_storeStrong((id *)&self->_installedSensorID, 0);
}

@end
