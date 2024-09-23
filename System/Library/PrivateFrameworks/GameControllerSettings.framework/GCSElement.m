@implementation GCSElement

- (GCSElement)initWithName:(id)a3 nameLocalizationKey:(id)a4 sfSymbolsName:(id)a5 remappingKey:(int)a6 kind:(int64_t)a7
{
  id v13;
  id v14;
  id v15;
  GCSElement *v16;
  GCSElement *v17;
  objc_super v19;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)GCSElement;
  v16 = -[GCSElement init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_name, a3);
    objc_storeStrong((id *)&v17->_nameLocalizationKey, a4);
    objc_storeStrong((id *)&v17->_sfSymbolsName, a5);
    v17->_remappingKey = a6;
    v17->_kind = a7;
  }

  return v17;
}

- (NSString)localizedName
{
  return (NSString *)_GCFConvertStringToLocalizedString();
}

- (id)description
{
  return +[NSString stringWithFormat:](&off_254DF3D18, "stringWithFormat:", CFSTR("<GCSElement name=%@, nameLocalizationKey=%@, sfSymbolsName=%@, remappingKey=%d>"), self->_name, self->_nameLocalizationKey, self->_sfSymbolsName, self->_remappingKey);
}

- (NSString)name
{
  return self->_name;
}

- (NSString)nameLocalizationKey
{
  return self->_nameLocalizationKey;
}

- (NSString)sfSymbolsName
{
  return self->_sfSymbolsName;
}

- (int64_t)kind
{
  return self->_kind;
}

- (int)remappingKey
{
  return self->_remappingKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sfSymbolsName, 0);
  objc_storeStrong((id *)&self->_nameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GCSElement)initWithCoder:(id)a3
{
  id v4;
  GCSElement *v5;
  uint64_t v6;
  NSString *name;
  uint64_t v8;
  NSString *nameLocalizationKey;
  uint64_t v10;
  NSString *sfSymbolsName;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GCSElement;
  v5 = -[GCSElement init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_name"));
    v6 = objc_claimAutoreleasedReturnValue();
    name = v5->_name;
    v5->_name = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nameLocalizationKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    nameLocalizationKey = v5->_nameLocalizationKey;
    v5->_nameLocalizationKey = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_sfSymbolsName"));
    v10 = objc_claimAutoreleasedReturnValue();
    sfSymbolsName = v5->_sfSymbolsName;
    v5->_sfSymbolsName = (NSString *)v10;

    v5->_remappingKey = objc_msgSend(v4, "decodeIntForKey:", CFSTR("_remappingKey"));
    v5->_kind = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_kind"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *name;
  id v5;

  name = self->_name;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", name, CFSTR("_name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nameLocalizationKey, CFSTR("nameLocalizationKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sfSymbolsName, CFSTR("_sfSymbolsName"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_remappingKey, CFSTR("_remappingKey"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_kind, CFSTR("_kind"));

}

- (GCSElement)initWithJSONObject:(id)a3
{
  id v4;
  id v5;
  GCSElement *v6;
  uint64_t v7;
  NSString *name;
  uint64_t v9;
  NSString *nameLocalizationKey;
  uint64_t v11;
  NSString *sfSymbolsName;
  void *v13;
  void *v14;
  GCSElement *v15;
  objc_super v17;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v17.receiver = self;
    v17.super_class = (Class)GCSElement;
    v6 = -[GCSElement init](&v17, sel_init);
    if (v6)
    {
      objc_msgSend(v5, "_gcs_stringForJSONKey:", CFSTR("name"));
      v7 = objc_claimAutoreleasedReturnValue();
      name = v6->_name;
      v6->_name = (NSString *)v7;

      objc_msgSend(v5, "_gcs_stringForJSONKey:", CFSTR("nameLocalizationKey"));
      v9 = objc_claimAutoreleasedReturnValue();
      nameLocalizationKey = v6->_nameLocalizationKey;
      v6->_nameLocalizationKey = (NSString *)v9;

      objc_msgSend(v5, "_gcs_stringForJSONKey:", CFSTR("sfSymbolsName"));
      v11 = objc_claimAutoreleasedReturnValue();
      sfSymbolsName = v6->_sfSymbolsName;
      v6->_sfSymbolsName = (NSString *)v11;

      objc_msgSend(v5, "_gcs_numberForJSONKey:", CFSTR("remappingKey"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_remappingKey = objc_msgSend(v13, "intValue");

      objc_msgSend(v5, "_gcs_numberForJSONKey:", CFSTR("kind"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_kind = objc_msgSend(v14, "longValue");

    }
    self = v6;

    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (GCSJSONObject)jsonObject
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  __int128 v8;
  NSString *sfSymbolsName;
  void *v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v8 = *(_OWORD *)&self->_name;
  v7[0] = CFSTR("name");
  v7[1] = CFSTR("nameLocalizationKey");
  sfSymbolsName = self->_sfSymbolsName;
  v7[2] = CFSTR("sfSymbolsName");
  v7[3] = CFSTR("remappingKey");
  +[NSNumber numberWithInt:](&off_254DF4058, "numberWithInt:", self->_remappingKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v3;
  v7[4] = CFSTR("kind");
  +[NSNumber numberWithInteger:](&off_254DF4058, "numberWithInteger:", self->_kind);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v4;
  +[NSDictionary dictionaryWithObjects:forKeys:count:](&off_254DF3850, "dictionaryWithObjects:forKeys:count:", &v8, v7, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (GCSJSONObject *)v5;
}

@end
