@implementation HMMTRSystemCommissionerPairingManagerPairingIdentity

- (HMMTRSystemCommissionerPairingManagerPairingIdentity)initWithUUID:(id)a3 vendorID:(id)a4 productID:(id)a5 serialNumber:(id)a6 setupPayload:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMMTRSystemCommissionerPairingManagerPairingIdentity *v17;
  HMMTRSystemCommissionerPairingManagerPairingIdentity *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HMMTRSystemCommissionerPairingManagerPairingIdentity;
  v17 = -[HMMTRSystemCommissionerPairingManagerPairingIdentity init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_uuid, a3);
    objc_storeStrong((id *)&v18->_vendorID, a4);
    objc_storeStrong((id *)&v18->_productID, a5);
    objc_storeStrong((id *)&v18->_serialNumber, a6);
    objc_storeStrong((id *)&v18->_setupPayload, a7);
  }

  return v18;
}

- (BOOL)isIdentifiable
{
  void *v2;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  -[HMMTRSystemCommissionerPairingManagerPairingIdentity vendorID](self, "vendorID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMMTRSystemCommissionerPairingManagerPairingIdentity productID](self, "productID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      -[HMMTRSystemCommissionerPairingManagerPairingIdentity serialNumber](self, "serialNumber");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {

        v6 = 1;
LABEL_6:

        goto LABEL_7;
      }
    }
  }
  -[HMMTRSystemCommissionerPairingManagerPairingIdentity setupPayload](self, "setupPayload");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v7 != 0;

  if (v4)
    goto LABEL_6;
LABEL_7:

  return v6;
}

- (BOOL)isEquivalentTo:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;

  v4 = a3;
  -[HMMTRSystemCommissionerPairingManagerPairingIdentity vendorID](self, "vendorID");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_14;
  v6 = (void *)v5;
  -[HMMTRSystemCommissionerPairingManagerPairingIdentity productID](self, "productID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_13;
  v8 = (void *)v7;
  -[HMMTRSystemCommissionerPairingManagerPairingIdentity serialNumber](self, "serialNumber");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
LABEL_12:

LABEL_13:
    goto LABEL_14;
  }
  v10 = (void *)v9;
  objc_msgSend(v4, "vendorID");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
LABEL_11:

    goto LABEL_12;
  }
  v12 = (void *)v11;
  objc_msgSend(v4, "productID");
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
  {

    goto LABEL_11;
  }
  v14 = (void *)v13;
  objc_msgSend(v4, "serialNumber");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
LABEL_14:
    -[HMMTRSystemCommissionerPairingManagerPairingIdentity setupPayload](self, "setupPayload");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setupPayload");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v16, "isEqual:", v17);
    goto LABEL_15;
  }
  -[HMMTRSystemCommissionerPairingManagerPairingIdentity vendorID](self, "vendorID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vendorID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "isEqual:", v17))
  {
    -[HMMTRSystemCommissionerPairingManagerPairingIdentity productID](self, "productID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "productID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isEqual:", v19))
    {
      -[HMMTRSystemCommissionerPairingManagerPairingIdentity serialNumber](self, "serialNumber");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "serialNumber");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "isEqual:", v21);

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }
LABEL_15:

  return v22;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSNumber)vendorID
{
  return self->_vendorID;
}

- (NSNumber)productID
{
  return self->_productID;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSString)setupPayload
{
  return self->_setupPayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupPayload, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_vendorID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
