@implementation FASharedService

+ (id)sortedArray:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_8);
}

uint64_t __31__FASharedService_sortedArray___block_invoke(uint64_t a1, unint64_t a2, unint64_t a3)
{
  uint64_t v3;

  if (a2 >= a3)
    v3 = 0;
  else
    v3 = -1;
  if (a2 > a3)
    return 1;
  else
    return v3;
}

- (BOOL)isSeparator
{
  void *v2;
  BOOL v3;

  -[FASharedService name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("separator")) == 0;

  return v3;
}

- (BOOL)isDefault
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("default"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)isEnabled
{
  void *v2;
  char v3;

  -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("pageViews"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("memberDetails"));

  return v3;
}

- (NSString)name
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("name"));
}

- (NSNumber)order
{
  return (NSNumber *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("order"));
}

- (NSString)displayLabel
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("displayLabel"));
}

- (NSString)subLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[FASharedService name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("ALL_SUBSCRIPTIONS"))
    && (-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("subLabel")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "length"),
        v4,
        !v5))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SUBSCRIPTION_SHARING"), &stru_1E8565C18, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("subLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v6;
}

- (NSNumber)purchaserDSID
{
  return (NSNumber *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("purchaserDSID"));
}

- (NSString)detailLabel
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("detailLabel"));
}

- (NSString)iconURLString
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("icon"));
}

- (NSString)iconURLStringx2
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("icon2x"));
}

- (NSString)iconURLStringx3
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("icon3x"));
}

- (NSString)actionURLString
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("url"));
}

- (NSString)groupID
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("groupID"));
}

- (NSArray)pageViews
{
  return (NSArray *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("pageViews"));
}

- (NSArray)memberDetailsViewTypes
{
  return (NSArray *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("memberDetailsViewTypes"));
}

- (NSArray)subscriberDSIDs
{
  return (NSArray *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("subscriberDSIDs"));
}

- (NSString)ruiURL
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", CFSTR("ruiUrl"));
}

- (FASharedService)initWithDictionary:(id)a3
{
  id v4;
  FASharedService *v5;
  NSDictionary *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSDictionary *dictionary;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FASharedService;
  v5 = -[FASharedService init](&v15, sel_init);
  if (v5)
  {
    v6 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v4);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pageViews"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[FASharedService sortedArray:](FASharedService, "sortedArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v8, CFSTR("pageViews"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("memberDetailsViewTypes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[FASharedService sortedArray:](FASharedService, "sortedArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v10, CFSTR("memberDetailsViewTypes"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subscriberDSIDs"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[FASharedService sortedArray:](FASharedService, "sortedArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v12, CFSTR("subscriberDSIDs"));

    dictionary = v5->_dictionary;
    v5->_dictionary = v6;

  }
  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[FASharedService name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  FASharedService *v4;
  BOOL v5;

  v4 = (FASharedService *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[FASharedService isEqualToSharedService:](self, "isEqualToSharedService:", v4);
  }

  return v5;
}

- (BOOL)isEqualToSharedService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[FASharedService dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    v7 = 1;
  else
    v7 = objc_msgSend(v5, "isEqual:", v6);

  return v7;
}

- (NSDictionary)dictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end
