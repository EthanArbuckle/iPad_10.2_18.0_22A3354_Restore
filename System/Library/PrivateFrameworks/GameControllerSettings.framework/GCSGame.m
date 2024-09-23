@implementation GCSGame

+ (id)defaultIdentifier
{
  return CFSTR("com.apple.default");
}

+ (GCSGame)defaultGame
{
  GCSGame *v2;
  void *v3;
  void *v4;
  void *v5;
  GCSGame *v6;

  v2 = [GCSGame alloc];
  +[GCSGame defaultIdentifier](GCSGame, "defaultIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = -[GCSGame initWithBundleIdentifier:title:controllerToProfileMappings:controllerToCompatibilityModeMappings:](v2, "initWithBundleIdentifier:title:controllerToProfileMappings:controllerToCompatibilityModeMappings:", v3, CFSTR("GCS_GAME_ALL_GAMES"), v4, v5);

  return v6;
}

- (GCSGame)initWithBundleIdentifier:(id)a3 title:(id)a4 controllerToProfileMappings:(id)a5 controllerToCompatibilityModeMappings:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  GCSGame *v14;
  uint64_t v15;
  NSDate *modifiedDate;
  uint64_t v17;
  NSString *bundleIdentifier;
  uint64_t v19;
  NSString *title;
  uint64_t v21;
  NSDictionary *controllerToProfileMappings;
  uint64_t v23;
  NSDictionary *controllerToCompatibilityModeMappings;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)GCSGame;
  v14 = -[GCSGame init](&v26, sel_init);
  if (v14)
  {
    +[NSDate date](&off_254DF3E30, "date");
    v15 = objc_claimAutoreleasedReturnValue();
    modifiedDate = v14->_modifiedDate;
    v14->_modifiedDate = (NSDate *)v15;

    v17 = objc_msgSend(v10, "copy");
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v11, "copy");
    title = v14->_title;
    v14->_title = (NSString *)v19;

    v21 = objc_msgSend(v12, "copy");
    controllerToProfileMappings = v14->_controllerToProfileMappings;
    v14->_controllerToProfileMappings = (NSDictionary *)v21;

    v23 = objc_msgSend(v13, "copy");
    controllerToCompatibilityModeMappings = v14->_controllerToCompatibilityModeMappings;
    v14->_controllerToCompatibilityModeMappings = (NSDictionary *)v23;

  }
  return v14;
}

- (id)description
{
  return +[NSString stringWithFormat:](&off_254DF3D18, "stringWithFormat:", CFSTR("<GCSGame %@ (%@)>"), self->_title, self->_bundleIdentifier);
}

- (id)profileForController:(id)a3 profiles:(id)a4
{
  id v6;
  NSDictionary *controllerToProfileMappings;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  controllerToProfileMappings = self->_controllerToProfileMappings;
  objc_msgSend(a3, "persistentIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](controllerToProfileMappings, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v6;
    v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v14, "uuid", (_QWORD)v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqual:", v9);

          if ((v16 & 1) != 0)
          {
            v11 = v14;
            goto LABEL_12;
          }
        }
        v11 = (id)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)profileUUIDForPersistentControllerIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NSDictionary objectForKeyedSubscript:](self->_controllerToProfileMappings, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[GCSProfile defaultProfile](GCSProfile, "defaultProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (NSString)title
{
  NSString *v3;

  if (-[NSString isEqualToString:](self->_title, "isEqualToString:", CFSTR("GCS_GAME_ALL_GAMES")))
  {
    _GCFConvertStringToLocalizedString();
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_title;
  }
  return v3;
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (NSDictionary)controllerToProfileMappings
{
  return self->_controllerToProfileMappings;
}

- (NSDictionary)controllerToCompatibilityModeMappings
{
  return self->_controllerToCompatibilityModeMappings;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_controllerToCompatibilityModeMappings, 0);
  objc_storeStrong((id *)&self->_controllerToProfileMappings, 0);
  objc_storeStrong((id *)&self->_modifiedDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (id)archivalClasses
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  return +[NSSet setWithObjects:](&off_254DF4B10, "setWithObjects:", v2, v3, v4, objc_opt_class(), 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCSGame)initWithCoder:(id)a3
{
  id v4;
  GCSGame *v5;
  uint64_t v6;
  NSDate *modifiedDate;
  uint64_t v8;
  NSString *bundleIdentifier;
  uint64_t v10;
  NSString *title;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSDictionary *controllerToProfileMappings;
  uint64_t v18;
  void *v19;
  void *v20;
  NSDictionary *v21;
  NSDictionary *controllerToCompatibilityModeMappings;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)GCSGame;
  v5 = -[GCSGame init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_modifiedDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    modifiedDate = v5->_modifiedDate;
    v5->_modifiedDate = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_title"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v10;

    v12 = objc_alloc((Class)&off_254DF4B10);
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = (void *)objc_msgSend(v12, "initWithObjects:", v13, v14, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("_controllerToProfileMappings"));
    v16 = objc_claimAutoreleasedReturnValue();
    controllerToProfileMappings = v5->_controllerToProfileMappings;
    v5->_controllerToProfileMappings = (NSDictionary *)v16;

    v18 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v18, objc_opt_class(), CFSTR("_controllerToCompatibilityModeMappings"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
      v21 = v19;
    else
      v21 = (NSDictionary *)objc_opt_new();
    controllerToCompatibilityModeMappings = v5->_controllerToCompatibilityModeMappings;
    v5->_controllerToCompatibilityModeMappings = v21;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *modifiedDate;
  id v5;

  modifiedDate = self->_modifiedDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", modifiedDate, CFSTR("_modifiedDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("_bundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("_title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_controllerToProfileMappings, CFSTR("_controllerToProfileMappings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_controllerToCompatibilityModeMappings, CFSTR("_controllerToCompatibilityModeMappings"));

}

- (GCSGame)initWithJSONObject:(id)a3
{
  id v4;
  id v5;
  GCSGame *v6;
  void *v7;
  void *v8;
  NSDate *v9;
  GCSGame *v10;
  NSDate *modifiedDate;
  uint64_t v12;
  NSString *bundleIdentifier;
  uint64_t v14;
  NSString *title;
  void *v16;
  uint64_t v17;
  NSDictionary *controllerToProfileMappings;
  void *v19;
  uint64_t v20;
  NSDictionary *controllerToCompatibilityModeMappings;
  objc_super v23;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v23.receiver = self;
    v23.super_class = (Class)GCSGame;
    v6 = -[GCSGame init](&v23, sel_init);
    if (v6)
    {
      objc_msgSend(v5, "_gcs_dateForJSONKey:", CFSTR("modifiedDate"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = v7;
      }
      else
      {
        +[NSDate date](&off_254DF3E30, "date");
        v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
      }
      modifiedDate = v6->_modifiedDate;
      v6->_modifiedDate = v9;

      objc_msgSend(v5, "_gcs_stringForJSONKey:", CFSTR("bundleIdentifier"));
      v12 = objc_claimAutoreleasedReturnValue();
      bundleIdentifier = v6->_bundleIdentifier;
      v6->_bundleIdentifier = (NSString *)v12;

      objc_msgSend(v5, "_gcs_stringForJSONKey:", CFSTR("title"));
      v14 = objc_claimAutoreleasedReturnValue();
      title = v6->_title;
      v6->_title = (NSString *)v14;

      objc_msgSend(v5, "_gcs_dictionaryForJSONKey:", CFSTR("controllerToProfileMappings"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSDictionary _gcs_serializableDictionaryForJsonObject:withValuesOfClass:](&off_254DF3850, "_gcs_serializableDictionaryForJsonObject:withValuesOfClass:", v16, objc_opt_class());
      v17 = objc_claimAutoreleasedReturnValue();
      controllerToProfileMappings = v6->_controllerToProfileMappings;
      v6->_controllerToProfileMappings = (NSDictionary *)v17;

      objc_msgSend(v5, "_gcs_dictionaryForJSONKey:", CFSTR("controllerToCompatibilityModeMappings"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[NSDictionary _gcs_serializableDictionaryForJsonObject:withValuesOfClass:](&off_254DF3850, "_gcs_serializableDictionaryForJsonObject:withValuesOfClass:", v19, objc_opt_class());
      v20 = objc_claimAutoreleasedReturnValue();
      controllerToCompatibilityModeMappings = v6->_controllerToCompatibilityModeMappings;
      v6->_controllerToCompatibilityModeMappings = (NSDictionary *)v20;

    }
    self = v6;

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (GCSJSONObject)jsonObject
{
  void *v3;
  NSString *bundleIdentifier;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];
  _QWORD v10[6];

  v10[5] = *MEMORY[0x24BDAC8D0];
  v9[0] = CFSTR("modifiedDate");
  -[NSDate jsonObject](self->_modifiedDate, "jsonObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  bundleIdentifier = self->_bundleIdentifier;
  v10[0] = v3;
  v10[1] = bundleIdentifier;
  v9[1] = CFSTR("bundleIdentifier");
  v9[2] = CFSTR("title");
  v10[2] = self->_title;
  v9[3] = CFSTR("controllerToProfileMappings");
  +[NSDictionary _gcs_jsonObjectForSerializableDictionary:](&off_254DF3850, "_gcs_jsonObjectForSerializableDictionary:", self->_controllerToProfileMappings);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v5;
  v9[4] = CFSTR("controllerToCompatibilityModeMappings");
  +[NSDictionary _gcs_jsonObjectForSerializableDictionary:](&off_254DF3850, "_gcs_jsonObjectForSerializableDictionary:", self->_controllerToCompatibilityModeMappings);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v6;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DF3850, "dictionaryWithObjects:forKeys:count:", v10, v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (GCSJSONObject *)v7;
}

@end
