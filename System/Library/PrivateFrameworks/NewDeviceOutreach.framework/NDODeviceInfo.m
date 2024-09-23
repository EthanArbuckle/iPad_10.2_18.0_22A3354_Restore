@implementation NDODeviceInfo

+ (id)deviceInfoWithDevice:(id)a3 warranty:(id)a4
{
  id v5;
  id v6;
  NDODeviceInfo *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[NDODeviceInfo initWithDevice:warranty:]([NDODeviceInfo alloc], "initWithDevice:warranty:", v6, v5);

  return v7;
}

- (NDODeviceInfo)initWithDevice:(id)a3 warranty:(id)a4
{
  id v6;
  id v7;
  NDODeviceInfo *v8;
  NDODeviceInfo *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NDODeviceInfo;
  v8 = -[NDODeviceInfo init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[NDODeviceInfo setDevice:](v8, "setDevice:", v6);
    -[NDODeviceInfo setWarranty:](v9, "setWarranty:", v7);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  objc_super v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "device");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDODeviceInfo device](self, "device");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      objc_msgSend(v5, "warranty");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NDODeviceInfo warranty](self, "warranty");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NDODeviceInfo;
    v10 = -[NDODeviceInfo isEqual:](&v12, sel_isEqual_, v4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NDODeviceInfo device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NDODeviceInfo warranty](self, "warranty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = CFSTR("has warranty");
  else
    v6 = CFSTR("missing warranty");
  -[NDODeviceInfo warranty](self, "warranty");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "acOfferDisplay") & 1) != 0)
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    -[NDODeviceInfo warranty](self, "warranty");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "acOfferEligibleUntil");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("eligible until %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ %@"), v4, v6, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ %@"), v4, v6, CFSTR("No offer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[NDODeviceInfo device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("device"));

  -[NDODeviceInfo warranty](self, "warranty");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("warranty"));

}

- (NDODeviceInfo)initWithCoder:(id)a3
{
  id v4;
  NDODeviceInfo *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NDODeviceInfo;
  v5 = -[NDODeviceInfo init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("device"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDODeviceInfo setDevice:](v5, "setDevice:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("warranty"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NDODeviceInfo setWarranty:](v5, "setWarranty:", v7);

  }
  return v5;
}

- (NDODevice)device
{
  return (NDODevice *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDevice:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NDOWarranty)warranty
{
  return (NDOWarranty *)objc_getProperty(self, a2, 16, 1);
}

- (void)setWarranty:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_warranty, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
