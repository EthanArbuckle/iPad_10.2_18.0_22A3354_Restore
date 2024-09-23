@implementation GEOTransitPaymentMethod

- (GEOTransitPaymentMethod)initWithPaymentMethod:(id)a3
{
  id v5;
  GEOTransitPaymentMethod *v6;
  GEOTransitPaymentMethod *v7;
  uint64_t v8;
  NSString *identifier;
  unsigned int v10;
  unsigned int v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOTransitPaymentMethod;
  v6 = -[GEOTransitPaymentMethod init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pbPaymentMethod, a3);
    objc_msgSend(v5, "identifier");
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v7->identifier;
    v7->identifier = (NSString *)v8;

    v7->muid = objc_msgSend(v5, "muid");
    v7->paymentMethodType = 0;
    if (objc_msgSend(v5, "hasPaymentMethodType"))
    {
      v10 = objc_msgSend(v5, "paymentMethodType");
      if (v10 <= 4)
        v7->paymentMethodType = v10;
    }
    v7->addValueNameType = 0;
    if (objc_msgSend(v5, "hasAddValueName"))
    {
      v11 = objc_msgSend(v5, "addValueName");
      if (v11 <= 3)
        v7->addValueNameType = v11 + 1;
    }
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  GEOTransitPaymentMethod *v5;
  id v6;
  GEOTransitPaymentMethod *v7;

  v5 = +[GEOTransitPaymentMethod allocWithZone:](GEOTransitPaymentMethod, "allocWithZone:");
  v6 = -[GEOPBTransitPaymentMethod copyWithZone:](self->_pbPaymentMethod, "copyWithZone:", a3);
  v7 = -[GEOTransitPaymentMethod initWithPaymentMethod:](v5, "initWithPaymentMethod:", v6);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[GEOTransitPaymentMethod identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR(" GEOTransitPaymentMethod:\n"));
  -[GEOTransitPaymentMethod identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" identifier:   '%@'\n"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(" muid:         '%llu'\n"), -[GEOTransitPaymentMethod muid](self, "muid"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" type:         '%d'\n"), -[GEOTransitPaymentMethod paymentMethodType](self, "paymentMethodType"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" addValueName: '%d'\n"), -[GEOTransitPaymentMethod addValueNameType](self, "addValueNameType"));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v3);

  return v5;
}

- (NSString)identifier
{
  return self->identifier;
}

- (unint64_t)muid
{
  return self->muid;
}

- (int)paymentMethodType
{
  return self->paymentMethodType;
}

- (int)addValueNameType
{
  return self->addValueNameType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->identifier, 0);
  objc_storeStrong((id *)&self->_pbPaymentMethod, 0);
}

@end
