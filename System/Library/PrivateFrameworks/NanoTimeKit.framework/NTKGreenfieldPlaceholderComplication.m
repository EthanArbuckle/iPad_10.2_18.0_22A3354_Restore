@implementation NTKGreenfieldPlaceholderComplication

+ (id)placeholderWithComplication:(id)a3 appStoreItemId:(id)a4 appName:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithComplicationType:", 55);
  v12 = (void *)v11[5];
  v11[5] = v9;
  v13 = v9;

  v14 = (void *)v11[4];
  v11[4] = v8;
  v15 = v8;

  v16 = (void *)v11[6];
  v11[6] = v10;
  v17 = v10;

  objc_msgSend(v11, "_generateUniqueIdentifier");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v11[1];
  v11[1] = v18;

  return v11;
}

+ (id)placeholderWithComplication:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithComplicationType:", 55);
  v6 = (void *)v5[4];
  v5[4] = v4;
  v7 = v4;

  objc_msgSend(v5, "_generateUniqueIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Greenfield placeholder of itemId: %@ complication: %@"), self->_appStoreItemId, self->_complication);
}

- (BOOL)supportsComplicationFamily:(int64_t)a3 forDevice:(id)a4
{
  return -[NTKComplication supportsComplicationFamily:forDevice:](self->_complication, "supportsComplicationFamily:forDevice:", a3, a4);
}

- (id)_generateUniqueIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[NTKComplication uniqueIdentifier](self->_complication, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("greenfieldPlaceholder-%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)appIdentifier
{
  return -[NTKComplication appIdentifier](self->_complication, "appIdentifier");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)NTKGreenfieldPlaceholderComplication;
    v5 = -[NTKComplication isEqual:](&v7, sel_isEqual_, v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)_allComplicationConfigurationsWithType:(unint64_t)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKGreenfieldPlaceholderComplication;
  v4 = -[NTKComplication copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 4, self->_complication);
  objc_storeStrong(v4 + 5, self->_appStoreItemId);
  objc_storeStrong(v4 + 6, self->_appName);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKGreenfieldPlaceholderComplication)initWithCoder:(id)a3
{
  id v4;
  NTKGreenfieldPlaceholderComplication *v5;
  uint64_t v6;
  NSNumber *appStoreItemId;
  uint64_t v8;
  NTKComplication *complication;
  uint64_t v10;
  NSString *appName;
  uint64_t v12;
  NSString *uniqueIdentifier;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NTKGreenfieldPlaceholderComplication;
  v5 = -[NTKComplication initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ComplicationGreenfieldPlaceholderAppStoreItemIdKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    appStoreItemId = v5->_appStoreItemId;
    v5->_appStoreItemId = (NSNumber *)v6;

    if (!v5->_appStoreItemId)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ appStoreItemId must not be nil"), objc_opt_class());
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ComplicationGreenfieldPlaceholderComplicationKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    complication = v5->_complication;
    v5->_complication = (NTKComplication *)v8;

    if (!v5->_complication)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ cannot have nil complication"), objc_opt_class());
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_ComplicationGreenfieldPlaceholderAppNameKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    appName = v5->_appName;
    v5->_appName = (NSString *)v10;

    if (!v5->_appName)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ app name must not be nil"), objc_opt_class());
    -[NTKGreenfieldPlaceholderComplication _generateUniqueIdentifier](v5, "_generateUniqueIdentifier");
    v12 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->super._uniqueIdentifier;
    v5->super._uniqueIdentifier = (NSString *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKGreenfieldPlaceholderComplication;
  v4 = a3;
  -[NTKComplication encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_complication, CFSTR("_ComplicationGreenfieldPlaceholderComplicationKey"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_appStoreItemId, CFSTR("_ComplicationGreenfieldPlaceholderAppStoreItemIdKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_appName, CFSTR("_ComplicationGreenfieldPlaceholderAppNameKey"));

}

- (void)_addKeysToJSONDictionary:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKGreenfieldPlaceholderComplication;
  v4 = a3;
  -[NTKComplication _addKeysToJSONDictionary:](&v6, sel__addKeysToJSONDictionary_, v4);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_appStoreItemId, CFSTR("_ComplicationGreenfieldPlaceholderAppStoreItemIdKey"), v6.receiver, v6.super_class);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_appName, CFSTR("_ComplicationGreenfieldPlaceholderAppNameKey"));
  -[NTKComplication JSONObjectRepresentation](self->_complication, "JSONObjectRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("_ComplicationGreenfieldPlaceholderComplicationKey"));

}

- (id)_initWithComplicationType:(unint64_t)a3 JSONDictionary:(id)a4
{
  id v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NTKGreenfieldPlaceholderComplication;
  v7 = -[NTKComplication _initWithComplicationType:JSONDictionary:](&v16, sel__initWithComplicationType_JSONDictionary_, a3, v6);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_ComplicationGreenfieldPlaceholderAppStoreItemIdKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v7[5];
    v7[5] = v8;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_ComplicationGreenfieldPlaceholderAppNameKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v7[6];
    v7[6] = v10;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_ComplicationGreenfieldPlaceholderComplicationKey"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[NTKComplication complicationWithJSONObjectRepresentation:](NTKComplication, "complicationWithJSONObjectRepresentation:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v7[4];
    v7[4] = v13;

  }
  return v7;
}

- (id)localizedDetailText
{
  return self->_appName;
}

- (id)localizedKeylineLabelText
{
  return self->_appName;
}

- (id)localizedRichDetailText
{
  return self->_appName;
}

- (id)localizedRichKeylineLabelText
{
  return self->_appName;
}

- (NTKComplication)complication
{
  return self->_complication;
}

- (NSNumber)appStoreItemId
{
  return self->_appStoreItemId;
}

- (NSString)appName
{
  return self->_appName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_appStoreItemId, 0);
  objc_storeStrong((id *)&self->_complication, 0);
}

@end
