@implementation AMSRatingsStoreFront

- (AMSRatingsStoreFront)initWithDictionary:(id)a3 mediaType:(unint64_t)a4 andStoreFront:(id)a5
{
  id v6;
  AMSRatingsStoreFront *v7;
  uint64_t v8;
  NSString *defaultLanguage;
  uint64_t v10;
  NSString *name;
  uint64_t v12;
  NSString *storeFrontID;
  uint64_t v14;
  NSArray *supportedLanguages;
  void *v16;
  uint64_t v17;
  NSArray *ratingSystems;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AMSRatingsStoreFront;
  v7 = -[AMSRatingsStoreFront init](&v20, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "valueForKeyPath:", CFSTR("attributes.defaultLanguageTag"));
    v8 = objc_claimAutoreleasedReturnValue();
    defaultLanguage = v7->_defaultLanguage;
    v7->_defaultLanguage = (NSString *)v8;

    objc_msgSend(v6, "valueForKeyPath:", CFSTR("attributes.name"));
    v10 = objc_claimAutoreleasedReturnValue();
    name = v7->_name;
    v7->_name = (NSString *)v10;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("id"));
    v12 = objc_claimAutoreleasedReturnValue();
    storeFrontID = v7->_storeFrontID;
    v7->_storeFrontID = (NSString *)v12;

    objc_msgSend(v6, "valueForKeyPath:", CFSTR("attributes.supportedLanguageTags"));
    v14 = objc_claimAutoreleasedReturnValue();
    supportedLanguages = v7->_supportedLanguages;
    v7->_supportedLanguages = (NSArray *)v14;

    objc_msgSend(v6, "valueForKeyPath:", CFSTR("relationships.rating-systems.data"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_111);
    v17 = objc_claimAutoreleasedReturnValue();
    ratingSystems = v7->_ratingSystems;
    v7->_ratingSystems = (NSArray *)v17;

  }
  return v7;
}

AMSRatingSystem *__67__AMSRatingsStoreFront_initWithDictionary_mediaType_andStoreFront___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[AMSRatingSystem ratingSystemWithDictionary:](AMSRatingSystem, "ratingSystemWithDictionary:", a2);
}

- (AMSRatingsStoreFront)initWithDictionary:(id)a3 mediaType:(unint64_t)a4
{
  id v5;
  AMSRatingsStoreFront *v6;
  uint64_t v7;
  NSString *defaultLanguage;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSString *storeFrontID;
  uint64_t v13;
  NSArray *supportedLanguages;
  void *v15;
  uint64_t v16;
  NSArray *ratingSystems;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)AMSRatingsStoreFront;
  v6 = -[AMSRatingsStoreFront init](&v19, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "valueForKeyPath:", CFSTR("attributes.defaultLanguageTag"));
    v7 = objc_claimAutoreleasedReturnValue();
    defaultLanguage = v6->_defaultLanguage;
    v6->_defaultLanguage = (NSString *)v7;

    objc_msgSend(v5, "valueForKeyPath:", CFSTR("attributes.name"));
    v9 = objc_claimAutoreleasedReturnValue();
    name = v6->_name;
    v6->_name = (NSString *)v9;

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("id"));
    v11 = objc_claimAutoreleasedReturnValue();
    storeFrontID = v6->_storeFrontID;
    v6->_storeFrontID = (NSString *)v11;

    objc_msgSend(v5, "valueForKeyPath:", CFSTR("attributes.supportedLanguageTags"));
    v13 = objc_claimAutoreleasedReturnValue();
    supportedLanguages = v6->_supportedLanguages;
    v6->_supportedLanguages = (NSArray *)v13;

    objc_msgSend(v5, "valueForKeyPath:", CFSTR("relationships.rating-systems.data"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ams_mapWithTransformIgnoresNil:", &__block_literal_global_10_3);
    v16 = objc_claimAutoreleasedReturnValue();
    ratingSystems = v6->_ratingSystems;
    v6->_ratingSystems = (NSArray *)v16;

  }
  return v6;
}

AMSRatingSystem *__53__AMSRatingsStoreFront_initWithDictionary_mediaType___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[AMSRatingSystem ratingSystemWithDictionary:](AMSRatingSystem, "ratingSystemWithDictionary:", a2);
}

+ (id)storeFrontWithDictionary:(id)a3 mediaType:(unint64_t)a4 andStoreFront:(id)a5
{
  id v7;
  id v8;
  AMSRatingsStoreFront *v9;

  v7 = a5;
  v8 = a3;
  v9 = -[AMSRatingsStoreFront initWithDictionary:mediaType:andStoreFront:]([AMSRatingsStoreFront alloc], "initWithDictionary:mediaType:andStoreFront:", v8, a4, v7);

  return v9;
}

+ (id)storeFrontWithDictionary:(id)a3 mediaType:(unint64_t)a4
{
  id v5;
  AMSRatingsStoreFront *v6;

  v5 = a3;
  v6 = -[AMSRatingsStoreFront initWithDictionary:mediaType:]([AMSRatingsStoreFront alloc], "initWithDictionary:mediaType:", v5, a4);

  return v6;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AMSRatingsStoreFront name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v4, CFSTR("name"));

  -[AMSRatingsStoreFront storeFrontID](self, "storeFrontID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v5, CFSTR("id"));

  -[AMSRatingsStoreFront supportedLanguages](self, "supportedLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v6, CFSTR("supportedLanguages"));

  -[AMSRatingsStoreFront defaultLanguage](self, "defaultLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v7, CFSTR("defaultLanguages"));

  -[AMSRatingsStoreFront ratingSystems](self, "ratingSystems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ams_setNullableObject:forKey:", v8, CFSTR("ratingSystems"));

  -[NSObject ams_generateDescriptionWithSubObjects:](self, "ams_generateDescriptionWithSubObjects:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)defaultLanguage
{
  return self->_defaultLanguage;
}

- (unint64_t)mediaType
{
  return self->_mediaType;
}

- (NSString)name
{
  return self->_name;
}

- (NSArray)ratingSystems
{
  return self->_ratingSystems;
}

- (NSString)storeFront
{
  return self->_storeFront;
}

- (NSString)storeFrontID
{
  return self->_storeFrontID;
}

- (NSArray)supportedLanguages
{
  return self->_supportedLanguages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedLanguages, 0);
  objc_storeStrong((id *)&self->_storeFrontID, 0);
  objc_storeStrong((id *)&self->_storeFront, 0);
  objc_storeStrong((id *)&self->_ratingSystems, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_defaultLanguage, 0);
}

@end
