@implementation HFServiceAccessoryType

uint64_t __37__HFServiceAccessoryType_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serviceType");
}

- (NSString)serviceType
{
  return self->_serviceType;
}

uint64_t __37__HFServiceAccessoryType_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "subtype");
}

- (NSString)subtype
{
  return self->_subtype;
}

void __37__HFServiceAccessoryType_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_234);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_235);
  objc_msgSend(v0, "build");
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)qword_1ED378918;
  qword_1ED378918 = v3;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HFServiceAccessoryType;
  if (-[HFAccessoryType isEqual:](&v7, sel_isEqual_, v4))
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = objc_msgSend(v4, "isEqual:", self);
    else
      v5 = 0;
  }

  return v5;
}

+ (id)na_identity
{
  if (qword_1ED378910 != -1)
    dispatch_once(&qword_1ED378910, &__block_literal_global_229);
  return (id)qword_1ED378918;
}

- (HFServiceAccessoryType)initWithServiceType:(id)a3 subtype:(id)a4
{
  id v7;
  id v8;
  id *v9;
  HFServiceAccessoryType *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFServiceAccessoryType;
  v9 = -[HFAccessoryType _init](&v12, sel__init);
  v10 = (HFServiceAccessoryType *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, a3);
    objc_storeStrong((id *)&v10->_subtype, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (void *)MEMORY[0x1E0CBA7E0];
  -[HFServiceAccessoryType serviceType](self, "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDescriptionForServiceType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceAccessoryType serviceType](self, "serviceType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("serviceType: %@ (%@)"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)debugDescription
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

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CBA7E0];
  -[HFServiceAccessoryType serviceType](self, "serviceType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedDescriptionForServiceType:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFServiceAccessoryType serviceType](self, "serviceType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(" (%@)"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v8, CFSTR("serviceType"));

  -[HFServiceAccessoryType subtype](self, "subtype");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HFServiceAccessoryType subtype](self, "subtype");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:withName:", v10, CFSTR("subtype"));

  }
  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtype, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
}

@end
