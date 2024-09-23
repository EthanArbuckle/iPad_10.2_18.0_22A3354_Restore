@implementation AMSDeviceOfferRegistrationItem

- (AMSDeviceOfferRegistrationItem)initWithDatabaseEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  AMSDeviceOfferRegistrationItem *v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("serialNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("model"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("validationData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[AMSDeviceOfferRegistrationItem initWithSerialNumber:model:validationData:](self, "initWithSerialNumber:model:validationData:", v5, v6, v7);

    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (AMSDeviceOfferRegistrationItem)initWithSerialNumber:(id)a3 model:(id)a4 validationData:(id)a5
{
  id v9;
  id v10;
  id v11;
  AMSDeviceOfferRegistrationItem *v12;
  AMSDeviceOfferRegistrationItem *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)AMSDeviceOfferRegistrationItem;
  v12 = -[AMSDeviceOfferRegistrationItem init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serialNumber, a3);
    objc_storeStrong((id *)&v13->_model, a4);
    objc_storeStrong((id *)&v13->_validationData, a5);
  }

  return v13;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AMSDeviceOfferRegistrationItem serialNumber](self, "serialNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDeviceOfferRegistrationItem model](self, "model");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AMSDeviceOfferRegistrationItem validationData](self, "validationData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{serial: %@ model: %@ validationData:%@}"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)serializeToDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[AMSDeviceOfferRegistrationItem model](self, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("model"));

  -[AMSDeviceOfferRegistrationItem serialNumber](self, "serialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("serialNumber"));

  -[AMSDeviceOfferRegistrationItem validationData](self, "validationData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("validationData"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[AMSDeviceOfferRegistrationItem model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[AMSDeviceOfferRegistrationItem serialNumber](self, "serialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[AMSDeviceOfferRegistrationItem validationData](self, "validationData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  AMSDeviceOfferRegistrationItem *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (AMSDeviceOfferRegistrationItem *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v5 == objc_opt_class()
      && -[AMSDeviceOfferRegistrationItem isEqualToRegistrationItem:](self, "isEqualToRegistrationItem:", v4);
  }

  return v6;
}

- (BOOL)isEqualToRegistrationItem:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  int v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  uint64_t v18;
  char v19;
  void *v20;

  v7 = a3;
  -[AMSDeviceOfferRegistrationItem model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 || (objc_msgSend(v7, "model"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[AMSDeviceOfferRegistrationItem model](self, "model");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "isEqualToString:", v5))
    {
      v10 = 0;
      goto LABEL_14;
    }
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  -[AMSDeviceOfferRegistrationItem serialNumber](self, "serialNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serialNumber");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "isEqualToString:", v12))
  {

    v10 = 0;
    if (!v9)
      goto LABEL_15;
    goto LABEL_14;
  }
  -[AMSDeviceOfferRegistrationItem validationData](self, "validationData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 || (objc_msgSend(v7, "validationData"), (v18 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v19 = v9;
    v20 = v3;
    -[AMSDeviceOfferRegistrationItem validationData](self, "validationData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "validationData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v14, "isEqualToData:", v15);

    if (v13)
    {

      v3 = v20;
      if ((v19 & 1) == 0)
        goto LABEL_15;
LABEL_14:

      goto LABEL_15;
    }
    v3 = v20;
    LOBYTE(v9) = v19;
    v17 = (void *)v18;
  }
  else
  {
    v17 = 0;
    v10 = 1;
  }

  if ((v9 & 1) != 0)
    goto LABEL_14;
LABEL_15:
  if (!v8)

  return v10;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)serialNumber
{
  return self->_serialNumber;
}

- (NSData)validationData
{
  return self->_validationData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationData, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

@end
