@implementation NTKAstronomyComplication

+ (id)_allComplicationConfigurationsWithType:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  _QWORD *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a3 - 39;
  if (a3 - 39 <= 2)
  {
    v7 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithComplicationType:", a3);
    v7[4] = v6;
    objc_msgSend(v7, "_generateUniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUniqueIdentifier:", v8);

    objc_msgSend(v5, "addObject:", v7);
  }
  return v5;
}

- (id)appIdentifier
{
  return CFSTR("com.apple.nanotimekit.astronomy");
}

- (id)localizedKeylineLabelText
{
  void *v2;
  void *v3;
  void *v4;

  NUNIAstronomyVistaNameLocalizationKeyForValue(self->_vista);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("_COMPANION"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  NTKCompanionClockFaceLocalizedString(v3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localizedDetailText
{
  void *v2;
  void *v3;
  void *v4;

  NUNIAstronomyVistaNameLocalizationKeyForValue(self->_vista);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("_COMPANION"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  NTKCompanionClockFaceLocalizedString(v3, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)appearsInDailySnapshotForFamily:(int64_t)a3
{
  return a3 != 3;
}

- (id)customDailySnapshotKeyForFamily:(int64_t)a3 device:(id)a4
{
  return NUNIAstronomyVistaNameForValue(self->_vista);
}

- (BOOL)snapshotContext:(id)a3 isStaleRelativeToContext:(id)a4
{
  return objc_msgSend(a3, "localeMatchesContext:", a4) ^ 1;
}

- (id)_generateUniqueIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NTKComplication complicationType](self, "complicationType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_vista);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKAstronomyComplication;
  result = -[NTKComplication copyWithZone:](&v5, sel_copyWithZone_, a3);
  *((_QWORD *)result + 4) = self->_vista;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKAstronomyComplication)initWithCoder:(id)a3
{
  id v4;
  NTKAstronomyComplication *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKAstronomyComplication;
  v5 = -[NTKComplication initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kAstronomyComplicationVistaKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ cannot have nil _vista"), objc_opt_class());
    v7 = NUNIAstronomyVistaValueForName(v6);
    v5->_vista = v7;
    if (v7 == -1)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ cannot have invalid _vista '%@'"), objc_opt_class(), v6);
    -[NTKAstronomyComplication _generateUniqueIdentifier](v5, "_generateUniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKComplication setUniqueIdentifier:](v5, "setUniqueIdentifier:", v8);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKAstronomyComplication;
  v4 = a3;
  -[NTKComplication encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  NUNIAstronomyVistaNameForValue(self->_vista);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kAstronomyComplicationVistaKey"), v6.receiver, v6.super_class);

}

- (void)_addKeysToJSONDictionary:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKAstronomyComplication;
  v4 = a3;
  -[NTKComplication _addKeysToJSONDictionary:](&v6, sel__addKeysToJSONDictionary_, v4);
  NUNIAstronomyVistaNameForValue(self->_vista);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("astronomy vista"), v6.receiver, v6.super_class);

}

- (id)_initWithComplicationType:(unint64_t)a3 JSONDictionary:(id)a4
{
  id v6;
  _QWORD *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKAstronomyComplication;
  v7 = -[NTKComplication _initWithComplicationType:JSONDictionary:](&v12, sel__initWithComplicationType_JSONDictionary_, a3, v6);
  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("astronomy vista"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("missing value for key '%@'"), CFSTR("astronomy vista"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("value for key '%@' must be String - invalid value: %@"), CFSTR("astronomy vista"), v8);
    v9 = NUNIAstronomyVistaValueForName(v8);
    v7[4] = v9;
    if (v9 == -1)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NTKFaceBundleException"), CFSTR("invalid value '%@' for key '%@'"), v8, CFSTR("astronomy vista"));
    objc_msgSend(v7, "_generateUniqueIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUniqueIdentifier:", v10);

  }
  return v7;
}

- (unint64_t)vista
{
  return self->_vista;
}

@end
