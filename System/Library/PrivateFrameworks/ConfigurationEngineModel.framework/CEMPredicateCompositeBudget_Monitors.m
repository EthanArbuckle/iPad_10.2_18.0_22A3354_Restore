@implementation CEMPredicateCompositeBudget_Monitors

+ (NSSet)allowedPayloadKeys
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("Apps");
  v6[1] = CFSTR("WebSites");
  v6[2] = CFSTR("Categories");
  v6[3] = CFSTR("CategoriesVersion2");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (id)buildWithApps:(id)a3 withWebSites:(id)a4 withCategories:(id)a5 withCategoriesVersion2:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_opt_new();
  objc_msgSend(v13, "setPayloadApps:", v12);

  objc_msgSend(v13, "setPayloadWebSites:", v11);
  objc_msgSend(v13, "setPayloadCategories:", v10);

  objc_msgSend(v13, "setPayloadCategoriesVersion2:", v9);
  return v13;
}

+ (id)buildWithApps:(id)a3 withWebSites:(id)a4 withCategories:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setPayloadApps:", v9);

  objc_msgSend(v10, "setPayloadWebSites:", v8);
  objc_msgSend(v10, "setPayloadCategories:", v7);

  return v10;
}

+ (id)buildRequiredOnly
{
  return (id)objc_opt_new();
}

- (BOOL)loadPayload:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSSet *v11;
  NSSet *unknownPayloadKeys;
  NSArray *v13;
  id v14;
  NSArray *payloadApps;
  NSArray *v16;
  NSArray *payloadWebSites;
  NSArray *v18;
  NSArray *payloadCategories;
  NSArray *v20;
  NSArray *payloadCategoriesVersion2;
  id v23;
  id v24;
  id v25;
  id v26;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CEMPredicateCompositeBudget_Monitors allowedPayloadKeys](CEMPredicateCompositeBudget_Monitors, "allowedPayloadKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minusSet:", v10);

  v11 = (NSSet *)objc_msgSend(v9, "copy");
  unknownPayloadKeys = self->super._unknownPayloadKeys;
  self->super._unknownPayloadKeys = v11;

  v26 = 0;
  -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("Apps"), &__block_literal_global_150, 0, 0, &v26);
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v14 = v26;
  payloadApps = self->_payloadApps;
  self->_payloadApps = v13;

  if (!v14)
  {
    v25 = 0;
    -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("WebSites"), &__block_literal_global_152, 0, 0, &v25);
    v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v14 = v25;
    payloadWebSites = self->_payloadWebSites;
    self->_payloadWebSites = v16;

    if (!v14)
    {
      v24 = 0;
      -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("Categories"), &__block_literal_global_153, 0, 0, &v24);
      v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v14 = v24;
      payloadCategories = self->_payloadCategories;
      self->_payloadCategories = v18;

      if (!v14)
      {
        v23 = 0;
        -[CEMPayloadBase loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:](self, "loadArrayFromDictionary:withKey:validator:isRequired:defaultValue:error:", v6, CFSTR("CategoriesVersion2"), &__block_literal_global_154, 0, 0, &v23);
        v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v14 = v23;
        payloadCategoriesVersion2 = self->_payloadCategoriesVersion2;
        self->_payloadCategoriesVersion2 = v20;

      }
    }
  }
  if (a4 && v14)
    *a4 = objc_retainAutorelease(v14);

  return v14 == 0;
}

- (id)serializePayloadWithAssetProviders:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("Apps"), self->_payloadApps, &__block_literal_global_155, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("WebSites"), self->_payloadWebSites, &__block_literal_global_156, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("Categories"), self->_payloadCategories, &__block_literal_global_157, 0, 0);
  -[CEMPayloadBase serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:](self, "serializeArrayIntoDictionary:withKey:withValue:itemSerializer:isRequired:defaultValue:", v4, CFSTR("CategoriesVersion2"), self->_payloadCategoriesVersion2, &__block_literal_global_158, 0, 0);
  v5 = (void *)objc_msgSend(v4, "copy");

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CEMPredicateCompositeBudget_Monitors;
  v4 = -[CEMPayloadBase copyWithZone:](&v14, sel_copyWithZone_, a3);
  v5 = -[NSArray copy](self->_payloadApps, "copy");
  v6 = (void *)v4[2];
  v4[2] = v5;

  v7 = -[NSArray copy](self->_payloadWebSites, "copy");
  v8 = (void *)v4[3];
  v4[3] = v7;

  v9 = -[NSArray copy](self->_payloadCategories, "copy");
  v10 = (void *)v4[4];
  v4[4] = v9;

  v11 = -[NSArray copy](self->_payloadCategoriesVersion2, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  return v4;
}

- (NSArray)payloadApps
{
  return self->_payloadApps;
}

- (void)setPayloadApps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)payloadWebSites
{
  return self->_payloadWebSites;
}

- (void)setPayloadWebSites:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)payloadCategories
{
  return self->_payloadCategories;
}

- (void)setPayloadCategories:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)payloadCategoriesVersion2
{
  return self->_payloadCategoriesVersion2;
}

- (void)setPayloadCategoriesVersion2:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadCategoriesVersion2, 0);
  objc_storeStrong((id *)&self->_payloadCategories, 0);
  objc_storeStrong((id *)&self->_payloadWebSites, 0);
  objc_storeStrong((id *)&self->_payloadApps, 0);
}

@end
