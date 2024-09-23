@implementation AMSDeviceOfferRegistrationGroup

- (AMSDeviceOfferRegistrationGroup)initWithDatabaseEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  AMSDeviceOfferRegistrationGroup *v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("registrationItems"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_mapWithTransform:", &__block_literal_global_41);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("validationOptions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = objc_msgSend(v7, "unsignedIntegerValue");
  else
    v8 = 0;
  v9 = -[AMSDeviceOfferRegistrationGroup _initWithRegistrationItems:validationOptions:](self, "_initWithRegistrationItems:validationOptions:", v6, v8);

  return v9;
}

AMSDeviceOfferRegistrationItem *__57__AMSDeviceOfferRegistrationGroup_initWithDatabaseEntry___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  AMSDeviceOfferRegistrationItem *v3;

  v2 = a2;
  v3 = -[AMSDeviceOfferRegistrationItem initWithDatabaseEntry:]([AMSDeviceOfferRegistrationItem alloc], "initWithDatabaseEntry:", v2);

  return v3;
}

- (AMSDeviceOfferRegistrationGroup)initWithRegistrationItems:(id)a3
{
  return (AMSDeviceOfferRegistrationGroup *)-[AMSDeviceOfferRegistrationGroup _initWithRegistrationItems:validationOptions:](self, "_initWithRegistrationItems:validationOptions:", a3, 0);
}

- (id)_initWithRegistrationItems:(id)a3 validationOptions:(unint64_t)a4
{
  id v7;
  AMSDeviceOfferRegistrationGroup *v8;
  AMSDeviceOfferRegistrationGroup *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSDeviceOfferRegistrationGroup;
  v8 = -[AMSDeviceOfferRegistrationGroup init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_registrationItems, a3);
    v9->_validationOptions = a4;
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AMSDeviceOfferRegistrationGroup registrationItems](self, "registrationItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{items:%@ validationOptions:%lu}"), v4, -[AMSDeviceOfferRegistrationGroup validationOptions](self, "validationOptions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)serializeToDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  -[AMSDeviceOfferRegistrationGroup registrationItems](self, "registrationItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ams_mapWithTransform:", &__block_literal_global_9_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("registrationItems"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[AMSDeviceOfferRegistrationGroup validationOptions](self, "validationOptions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("validationOptions"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

uint64_t __56__AMSDeviceOfferRegistrationGroup_serializeToDictionary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serializeToDictionary");
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = -[AMSDeviceOfferRegistrationGroup validationOptions](self, "validationOptions");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[AMSDeviceOfferRegistrationGroup registrationItems](self, "registrationItems", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v3 ^= objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "hash");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  AMSDeviceOfferRegistrationGroup *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (AMSDeviceOfferRegistrationGroup *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v5 == objc_opt_class()
      && -[AMSDeviceOfferRegistrationGroup isEqualToRegistrationGroup:](self, "isEqualToRegistrationGroup:", v4);
  }

  return v6;
}

- (BOOL)isEqualToRegistrationGroup:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  v5 = -[AMSDeviceOfferRegistrationGroup validationOptions](self, "validationOptions");
  if (v5 == objc_msgSend(v4, "validationOptions"))
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    -[AMSDeviceOfferRegistrationGroup registrationItems](self, "registrationItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v4, "registrationItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v8, "isEqualToSet:", v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isModifiedVersionOfGroup:(id)a3
{
  id v4;
  _BOOL4 v5;

  v4 = a3;
  if (-[AMSDeviceOfferRegistrationGroup _serialsMatchSerialsFromGroup:](self, "_serialsMatchSerialsFromGroup:", v4))
    v5 = !-[AMSDeviceOfferRegistrationGroup isEqual:](self, "isEqual:", v4);
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (BOOL)_serialsMatchSerialsFromGroup:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  -[AMSDeviceOfferRegistrationGroup registrationItems](self, "registrationItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ams_mapWithTransform:", &__block_literal_global_13_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "registrationItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "ams_mapWithTransform:", &__block_literal_global_14_0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v11) = objc_msgSend(v8, "isEqualToSet:", v12);
  return (char)v11;
}

uint64_t __65__AMSDeviceOfferRegistrationGroup__serialsMatchSerialsFromGroup___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serialNumber");
}

uint64_t __65__AMSDeviceOfferRegistrationGroup__serialsMatchSerialsFromGroup___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serialNumber");
}

- (NSArray)registrationItems
{
  return self->_registrationItems;
}

- (unint64_t)validationOptions
{
  return self->_validationOptions;
}

- (void)setValidationOptions:(unint64_t)a3
{
  self->_validationOptions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationItems, 0);
}

@end
