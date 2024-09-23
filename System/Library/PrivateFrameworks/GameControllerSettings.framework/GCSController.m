@implementation GCSController

- (id)initDummy
{
  GCSController *v2;
  GCSController *v3;
  NSString *name;
  uint64_t v5;
  NSDate *modifiedDate;
  NSString *persistentIdentifier;
  NSString *productCategoryKey;
  GCSElement *shareButton;
  uint64_t v10;
  NSDictionary *buttons;
  uint64_t v12;
  NSDictionary *dpads;
  NSString *logoSfSymbolsName;
  GCSProfile *v15;
  GCSProfile *baseProfile;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)GCSController;
  v2 = -[GCSController init](&v18, sel_init);
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)CFSTR("Controller");

    +[NSDate date](&off_254DF3E30, "date");
    v5 = objc_claimAutoreleasedReturnValue();
    modifiedDate = v3->_modifiedDate;
    v3->_modifiedDate = (NSDate *)v5;

    persistentIdentifier = v3->_persistentIdentifier;
    v3->_persistentIdentifier = (NSString *)CFSTR("__Dummy Controller");

    productCategoryKey = v3->_productCategoryKey;
    v3->_productCategoryKey = (NSString *)CFSTR("PRODUCT_CATEGORY_MFI");

    v3->_hidden = 1;
    shareButton = v3->_shareButton;
    v3->_shareButton = 0;

    v10 = objc_opt_new();
    buttons = v3->_buttons;
    v3->_buttons = (NSDictionary *)v10;

    v12 = objc_opt_new();
    dpads = v3->_dpads;
    v3->_dpads = (NSDictionary *)v12;

    logoSfSymbolsName = v3->_logoSfSymbolsName;
    v3->_logoSfSymbolsName = (NSString *)CFSTR("gamecontroller.fill");

    *(_WORD *)&v3->_supportsHaptics = 0;
    v15 = +[GCSProfile newBaseProfile](GCSProfile, "newBaseProfile");
    baseProfile = v3->_baseProfile;
    v3->_baseProfile = v15;

  }
  return v3;
}

- (GCSController)initWithName:(id)a3 persistentIdentifier:(id)a4 productCategoryKey:(id)a5 hidden:(BOOL)a6 shareButton:(id)a7 buttons:(id)a8 dpads:(id)a9 logoSfSymbolsName:(id)a10 supportsHaptics:(BOOL)a11 supportsLight:(BOOL)a12 baseProfile:(id)a13 miscellaneous:(id)a14
{
  id v20;
  GCSController *v21;
  GCSController *v22;
  uint64_t v23;
  NSDate *modifiedDate;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  v33 = a4;
  v32 = a5;
  v31 = a7;
  v30 = a8;
  v29 = a9;
  v28 = a10;
  v27 = a13;
  v20 = a14;
  v35.receiver = self;
  v35.super_class = (Class)GCSController;
  v21 = -[GCSController init](&v35, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_name, a3);
    +[NSDate date](&off_254DF3E30, "date");
    v23 = objc_claimAutoreleasedReturnValue();
    modifiedDate = v22->_modifiedDate;
    v22->_modifiedDate = (NSDate *)v23;

    objc_storeStrong((id *)&v22->_persistentIdentifier, a4);
    objc_storeStrong((id *)&v22->_productCategoryKey, a5);
    v22->_hidden = a6;
    objc_storeStrong((id *)&v22->_shareButton, a7);
    objc_storeStrong((id *)&v22->_buttons, a8);
    objc_storeStrong((id *)&v22->_dpads, a9);
    objc_storeStrong((id *)&v22->_logoSfSymbolsName, a10);
    v22->_supportsHaptics = a11;
    v22->_supportsLight = a12;
    objc_storeStrong((id *)&v22->_baseProfile, a13);
    objc_storeStrong((id *)&v22->_miscellaneous, a14);
  }

  return v22;
}

- (id)copyWithBaseProfile:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;

  v4 = a3;
  v5 = (_QWORD *)-[GCSController copy](self, "copy");
  v6 = (void *)v5[10];
  v5[10] = v4;

  return v5;
}

- (id)id
{
  return self->_persistentIdentifier;
}

- (id)description
{
  return +[NSString stringWithFormat:](&off_254DF3D18, "stringWithFormat:", CFSTR("<GCSController %@ (%@)>"), self->_name, self->_persistentIdentifier);
}

- (id)allElements
{
  void *v3;
  void *v4;
  void *v5;

  -[GCSController allButtons](self, "allButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GCSController allDpads](self, "allDpads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)allButtons
{
  void *v2;
  void *v3;

  -[NSDictionary allValues](self->_buttons, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __27__GCSController_allButtons__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  int v5;

  v4 = a3;
  LODWORD(a2) = objc_msgSend(a2, "remappingKey");
  v5 = objc_msgSend(v4, "remappingKey");

  return (int)a2 < v5;
}

- (id)allDpads
{
  void *v2;
  void *v3;

  -[NSDictionary allValues](self->_dpads, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __25__GCSController_allDpads__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  int v5;

  v4 = a3;
  LODWORD(a2) = objc_msgSend(a2, "remappingKey");
  v5 = objc_msgSend(v4, "remappingKey");

  return (int)a2 < v5;
}

- (NSString)localizedProductCategory
{
  return (NSString *)_GCFConvertStringToLocalizedString();
}

- (NSString)localizedName
{
  NSString *v3;

  if (-[NSString isEqualToString:](self->_name, "isEqualToString:", CFSTR("GAME_CONTROLLER_DEFAULT_NAME")))
  {
    _GCFConvertStringToLocalizedString();
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_name;
  }
  return v3;
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)productCategoryKey
{
  return self->_productCategoryKey;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (GCSElement)shareButton
{
  return self->_shareButton;
}

- (NSDictionary)buttons
{
  return self->_buttons;
}

- (NSDictionary)dpads
{
  return self->_dpads;
}

- (NSString)logoSfSymbolsName
{
  return self->_logoSfSymbolsName;
}

- (BOOL)supportsHaptics
{
  return self->_supportsHaptics;
}

- (BOOL)supportsLight
{
  return self->_supportsLight;
}

- (GCSProfile)baseProfile
{
  return self->_baseProfile;
}

- (NSDictionary)miscellaneous
{
  return self->_miscellaneous;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_miscellaneous, 0);
  objc_storeStrong((id *)&self->_baseProfile, 0);
  objc_storeStrong((id *)&self->_logoSfSymbolsName, 0);
  objc_storeStrong((id *)&self->_dpads, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_productCategoryKey, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_modifiedDate, 0);
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  GCSController *v4;
  GCSController *v5;

  v4 = objc_alloc_init(GCSController);
  objc_storeStrong((id *)&v4->_name, self->_name);
  objc_storeStrong((id *)&v4->_modifiedDate, self->_modifiedDate);
  objc_storeStrong((id *)&v4->_persistentIdentifier, self->_persistentIdentifier);
  objc_storeStrong((id *)&v4->_productCategoryKey, self->_productCategoryKey);
  v4->_hidden = self->_hidden;
  objc_storeStrong((id *)&v4->_shareButton, self->_shareButton);
  objc_storeStrong((id *)&v4->_buttons, self->_buttons);
  objc_storeStrong((id *)&v4->_dpads, self->_dpads);
  objc_storeStrong((id *)&v4->_logoSfSymbolsName, self->_logoSfSymbolsName);
  v4->_supportsHaptics = self->_supportsHaptics;
  v4->_supportsLight = self->_supportsLight;
  objc_storeStrong((id *)&v4->_baseProfile, self->_baseProfile);
  objc_storeStrong((id *)&v4->_miscellaneous, self->_miscellaneous);
  v5 = self;

  return v5;
}

+ (id)archivalClasses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  return +[NSSet setWithObjects:](&off_254DF4B10, "setWithObjects:", v2, v3, v4, v5, v6, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCSController)initWithCoder:(id)a3
{
  id v4;
  GCSController *v5;
  uint64_t v6;
  NSString *persistentIdentifier;
  uint64_t v8;
  NSString *name;
  uint64_t v10;
  NSDate *modifiedDate;
  uint64_t v12;
  NSString *productCategoryKey;
  uint64_t v14;
  GCSElement *shareButton;
  void *v16;
  void *v17;
  uint64_t v18;
  NSDictionary *buttons;
  void *v20;
  void *v21;
  uint64_t v22;
  NSDictionary *dpads;
  uint64_t v24;
  NSString *logoSfSymbolsName;
  uint64_t v26;
  GCSProfile *baseProfile;
  void *v28;
  void *v29;
  uint64_t v30;
  NSDictionary *miscellaneous;
  objc_super v33;
  _QWORD v34[5];
  _QWORD v35[3];
  _QWORD v36[4];

  v36[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v33.receiver = self;
  v33.super_class = (Class)GCSController;
  v5 = -[GCSController init](&v33, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_persistentIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    persistentIdentifier = v5->_persistentIdentifier;
    v5->_persistentIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v8 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_modifiedDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    modifiedDate = v5->_modifiedDate;
    v5->_modifiedDate = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_productCategoryKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    productCategoryKey = v5->_productCategoryKey;
    v5->_productCategoryKey = (NSString *)v12;

    v5->_hidden = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hidden"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shareButton"));
    v14 = objc_claimAutoreleasedReturnValue();
    shareButton = v5->_shareButton;
    v5->_shareButton = (GCSElement *)v14;

    v36[0] = objc_opt_class();
    v36[1] = objc_opt_class();
    v36[2] = objc_opt_class();
    +[NSArray arrayWithObjects:count:](&off_254DF4168, "arrayWithObjects:count:", v36, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithArray:](&off_254DF4B10, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("_buttons"));
    v18 = objc_claimAutoreleasedReturnValue();
    buttons = v5->_buttons;
    v5->_buttons = (NSDictionary *)v18;

    v35[0] = objc_opt_class();
    v35[1] = objc_opt_class();
    v35[2] = objc_opt_class();
    +[NSArray arrayWithObjects:count:](&off_254DF4168, "arrayWithObjects:count:", v35, 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithArray:](&off_254DF4B10, "setWithArray:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("_dpads"));
    v22 = objc_claimAutoreleasedReturnValue();
    dpads = v5->_dpads;
    v5->_dpads = (NSDictionary *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_logoSfSymbolsName"));
    v24 = objc_claimAutoreleasedReturnValue();
    logoSfSymbolsName = v5->_logoSfSymbolsName;
    v5->_logoSfSymbolsName = (NSString *)v24;

    v5->_supportsHaptics = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_supportsHaptics"));
    v5->_supportsLight = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_supportsLight"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_baseProfile"));
    v26 = objc_claimAutoreleasedReturnValue();
    baseProfile = v5->_baseProfile;
    v5->_baseProfile = (GCSProfile *)v26;

    v34[0] = objc_opt_class();
    v34[1] = objc_opt_class();
    v34[2] = objc_opt_class();
    v34[3] = objc_opt_class();
    v34[4] = objc_opt_class();
    +[NSArray arrayWithObjects:count:](&off_254DF4168, "arrayWithObjects:count:", v34, 5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[NSSet setWithArray:](&off_254DF4B10, "setWithArray:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("_miscellaneous"));
    v30 = objc_claimAutoreleasedReturnValue();
    miscellaneous = v5->_miscellaneous;
    v5->_miscellaneous = (NSDictionary *)v30;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *persistentIdentifier;
  id v5;

  persistentIdentifier = self->_persistentIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", persistentIdentifier, CFSTR("_persistentIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("_name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modifiedDate, CFSTR("_modifiedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productCategoryKey, CFSTR("_productCategoryKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hidden, CFSTR("_hidden"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shareButton, CFSTR("_shareButton"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_buttons, CFSTR("_buttons"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dpads, CFSTR("_dpads"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_logoSfSymbolsName, CFSTR("_logoSfSymbolsName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsHaptics, CFSTR("_supportsHaptics"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsLight, CFSTR("_supportsLight"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_baseProfile, CFSTR("_baseProfile"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_miscellaneous, CFSTR("_miscellaneous"));

}

- (GCSController)initWithJSONObject:(id)a3
{
  id v4;
  id v5;
  GCSController *v6;
  uint64_t v7;
  NSString *persistentIdentifier;
  uint64_t v9;
  NSString *name;
  void *v11;
  void *v12;
  NSDate *v13;
  GCSController *v14;
  NSDate *modifiedDate;
  uint64_t v16;
  NSString *productCategoryKey;
  void *v18;
  uint64_t v19;
  GCSElement *shareButton;
  void *v21;
  uint64_t v22;
  NSDictionary *buttons;
  void *v24;
  uint64_t v25;
  NSDictionary *dpads;
  uint64_t v27;
  NSString *logoSfSymbolsName;
  void *v29;
  void *v30;
  uint64_t v31;
  GCSProfile *baseProfile;
  void *v33;
  uint64_t v34;
  NSDictionary *miscellaneous;
  objc_super v37;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v37.receiver = self;
    v37.super_class = (Class)GCSController;
    v6 = -[GCSController init](&v37, sel_init);
    if (v6)
    {
      objc_msgSend(v5, "_gcs_stringForJSONKey:", CFSTR("persistentIdentifier"));
      v7 = objc_claimAutoreleasedReturnValue();
      persistentIdentifier = v6->_persistentIdentifier;
      v6->_persistentIdentifier = (NSString *)v7;

      objc_msgSend(v5, "_gcs_stringForJSONKey:", CFSTR("name"));
      v9 = objc_claimAutoreleasedReturnValue();
      name = v6->_name;
      v6->_name = (NSString *)v9;

      objc_msgSend(v5, "_gcs_dateForJSONKey:", CFSTR("modifiedDate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = v11;
      }
      else
      {
        +[NSDate date](&off_254DF3E30, "date");
        v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
      }
      modifiedDate = v6->_modifiedDate;
      v6->_modifiedDate = v13;

      objc_msgSend(v5, "_gcs_stringForJSONKey:", CFSTR("productCategoryKey"));
      v16 = objc_claimAutoreleasedReturnValue();
      productCategoryKey = v6->_productCategoryKey;
      v6->_productCategoryKey = (NSString *)v16;

      objc_msgSend(v5, "_gcs_numberForJSONKey:", CFSTR("hidden"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_hidden = objc_msgSend(v18, "BOOLValue");

      objc_msgSend(v5, "_gcs_gscElementForJSONKey:", CFSTR("shareButton"));
      v19 = objc_claimAutoreleasedReturnValue();
      shareButton = v6->_shareButton;
      v6->_shareButton = (GCSElement *)v19;

      objc_msgSend(v5, "_gcs_dictionaryForJSONKey:", CFSTR("buttons"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSDictionary _gcs_serializableDictionaryForJsonObject:withValuesOfClass:](&off_254DF3850, "_gcs_serializableDictionaryForJsonObject:withValuesOfClass:", v21, objc_opt_class());
      v22 = objc_claimAutoreleasedReturnValue();
      buttons = v6->_buttons;
      v6->_buttons = (NSDictionary *)v22;

      objc_msgSend(v5, "_gcs_dictionaryForJSONKey:", CFSTR("dpads"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSDictionary _gcs_serializableDictionaryForJsonObject:withValuesOfClass:](&off_254DF3850, "_gcs_serializableDictionaryForJsonObject:withValuesOfClass:", v24, objc_opt_class());
      v25 = objc_claimAutoreleasedReturnValue();
      dpads = v6->_dpads;
      v6->_dpads = (NSDictionary *)v25;

      objc_msgSend(v5, "_gcs_stringForJSONKey:", CFSTR("logoSfSymbolsName"));
      v27 = objc_claimAutoreleasedReturnValue();
      logoSfSymbolsName = v6->_logoSfSymbolsName;
      v6->_logoSfSymbolsName = (NSString *)v27;

      objc_msgSend(v5, "_gcs_numberForJSONKey:", CFSTR("supportsHaptics"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_supportsHaptics = objc_msgSend(v29, "BOOLValue");

      objc_msgSend(v5, "_gcs_numberForJSONKey:", CFSTR("supportsLight"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_supportsLight = objc_msgSend(v30, "BOOLValue");

      objc_msgSend(v5, "_gcs_gscProfileForJSONKey:", CFSTR("baseProfile"));
      v31 = objc_claimAutoreleasedReturnValue();
      baseProfile = v6->_baseProfile;
      v6->_baseProfile = (GCSProfile *)v31;

      objc_msgSend(v5, "_gcs_dictionaryForJSONKey:", CFSTR("miscellaneous"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSDictionary _gcs_serializableDictionaryForDictionaryJsonObject:](&off_254DF3850, "_gcs_serializableDictionaryForDictionaryJsonObject:", v33);
      v34 = objc_claimAutoreleasedReturnValue();
      miscellaneous = v6->_miscellaneous;
      v6->_miscellaneous = (NSDictionary *)v34;

    }
    self = v6;

    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (GCSJSONObject)jsonObject
{
  NSString *persistentIdentifier;
  NSString *name;
  NSString *productCategoryKey;
  void *v6;
  void *v7;
  void *v8;
  NSString *logoSfSymbolsName;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  GCSElement *shareButton;
  void *v16;
  NSDate *modifiedDate;
  void *v18;
  NSDictionary *miscellaneous;
  void *v20;
  _QWORD v22[10];
  _QWORD v23[11];

  v23[10] = *MEMORY[0x24BDAC8D0];
  persistentIdentifier = self->_persistentIdentifier;
  v22[0] = CFSTR("persistentIdentifier");
  v22[1] = CFSTR("name");
  name = self->_name;
  productCategoryKey = self->_productCategoryKey;
  v23[0] = persistentIdentifier;
  v23[1] = name;
  v23[2] = productCategoryKey;
  v22[2] = CFSTR("productCategoryKey");
  v22[3] = CFSTR("hidden");
  +[NSNumber numberWithBool:](&off_254DF4058, "numberWithBool:", self->_hidden);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v6;
  v22[4] = CFSTR("buttons");
  +[NSDictionary _gcs_jsonObjectForSerializableDictionary:](&off_254DF3850, "_gcs_jsonObjectForSerializableDictionary:", self->_buttons);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v7;
  v22[5] = CFSTR("dpads");
  +[NSDictionary _gcs_jsonObjectForSerializableDictionary:](&off_254DF3850, "_gcs_jsonObjectForSerializableDictionary:", self->_dpads);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  logoSfSymbolsName = self->_logoSfSymbolsName;
  v23[5] = v8;
  v23[6] = logoSfSymbolsName;
  v22[6] = CFSTR("logoSfSymbolsName");
  v22[7] = CFSTR("supportsHaptics");
  +[NSNumber numberWithBool:](&off_254DF4058, "numberWithBool:", self->_supportsHaptics);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v10;
  v22[8] = CFSTR("supportsLight");
  +[NSNumber numberWithBool:](&off_254DF4058, "numberWithBool:", self->_supportsLight);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[8] = v11;
  v22[9] = CFSTR("baseProfile");
  -[GCSProfile jsonObject](self->_baseProfile, "jsonObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23[9] = v12;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DF3850, "dictionaryWithObjects:forKeys:count:", v23, v22, 10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSMutableDictionary dictionaryWithDictionary:](&off_254DF4A00, "dictionaryWithDictionary:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  shareButton = self->_shareButton;
  if (shareButton)
  {
    -[GCSElement jsonObject](shareButton, "jsonObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("shareButton"));

  }
  modifiedDate = self->_modifiedDate;
  if (modifiedDate)
  {
    -[NSDate jsonObject](modifiedDate, "jsonObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v18, CFSTR("modifiedDate"));

  }
  miscellaneous = self->_miscellaneous;
  if (miscellaneous)
  {
    -[NSDictionary jsonObject](miscellaneous, "jsonObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v20, CFSTR("miscellaneous"));

  }
  return (GCSJSONObject *)v14;
}

@end
