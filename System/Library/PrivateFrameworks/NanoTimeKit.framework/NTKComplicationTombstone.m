@implementation NTKComplicationTombstone

- (id)_migrateToFamily:(int64_t)a3 withAllowedComplications:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[NTKComplicationTombstone complication](self, "complication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_migrateToFamily:withAllowedComplications:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)tombstoneWithComplication:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithComplicationType:", 0);
  v6 = (void *)v5[5];
  v5[5] = v4;
  v7 = v4;

  objc_msgSend(v5, "_generateUniqueIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v5[4];
  v5[4] = v8;

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tombstone of %@"), self->_complication);
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
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NTKComplication complicationType](self, "complicationType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("tombstone-%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)appIdentifier
{
  return -[NTKComplication appIdentifier](self->_complication, "appIdentifier");
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
  v6.super_class = (Class)NTKComplicationTombstone;
  v4 = -[NTKComplication copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 5, self->_complication);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKComplicationTombstone)initWithCoder:(id)a3
{
  id v4;
  NTKComplicationTombstone *v5;
  uint64_t v6;
  NTKComplication *complication;
  uint64_t v8;
  NSString *uniqueIdentifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NTKComplicationTombstone;
  v5 = -[NTKComplication initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ComplicationTombstoneComplicationKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    complication = v5->_complication;
    v5->_complication = (NTKComplication *)v6;

    if (!v5->_complication)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("%@ cannot have nil complication"), objc_opt_class());
    -[NTKComplicationTombstone _generateUniqueIdentifier](v5, "_generateUniqueIdentifier");
    v8 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKComplicationTombstone;
  v4 = a3;
  -[NTKComplication encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_complication, CFSTR("ComplicationTombstoneComplicationKey"), v5.receiver, v5.super_class);

}

- (void)_addKeysToJSONDictionary:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NTKComplicationTombstone;
  v4 = a3;
  -[NTKComplication _addKeysToJSONDictionary:](&v6, sel__addKeysToJSONDictionary_, v4);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("available"), v6.receiver, v6.super_class);
  -[NTKComplication JSONObjectRepresentation](self->_complication, "JSONObjectRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v5);

}

- (id)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NTKComplication)complication
{
  return self->_complication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_complication, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

@end
