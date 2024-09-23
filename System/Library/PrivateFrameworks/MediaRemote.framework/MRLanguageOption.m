@implementation MRLanguageOption

+ (id)automaticLanguageOptionWithType:(unsigned int)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:languageTag:characteristics:displayName:identifier:", *(_QWORD *)&a3, CFSTR("__AUTO__"), 0, 0, 0);
}

- (MRLanguageOption)initWithType:(unsigned int)a3 languageTag:(id)a4 characteristics:(id)a5 displayName:(id)a6 identifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  MRLanguageOption *v16;
  MRLanguageOption *v17;
  uint64_t v18;
  NSString *languageTag;
  uint64_t v20;
  NSArray *characteristics;
  uint64_t v22;
  NSString *displayName;
  uint64_t v24;
  NSString *identifier;
  objc_super v27;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)MRLanguageOption;
  v16 = -[MRLanguageOption init](&v27, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_type = a3;
    v16->_hasType = 1;
    v18 = objc_msgSend(v12, "copy");
    languageTag = v17->_languageTag;
    v17->_languageTag = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    characteristics = v17->_characteristics;
    v17->_characteristics = (NSArray *)v20;

    v22 = objc_msgSend(v14, "copy");
    displayName = v17->_displayName;
    v17->_displayName = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    identifier = v17->_identifier;
    v17->_identifier = (NSString *)v24;

  }
  return v17;
}

- (MRLanguageOption)initWithProtobuf:(id)a3
{
  id v4;
  MRLanguageOption *v5;
  void *v6;
  uint64_t v7;
  NSString *languageTag;
  void *v9;
  uint64_t v10;
  NSArray *characteristics;
  void *v12;
  uint64_t v13;
  NSString *displayName;
  void *v15;
  uint64_t v16;
  NSString *identifier;
  MRLanguageOption *v18;
  objc_super v20;

  v4 = a3;
  if (v4)
  {
    v20.receiver = self;
    v20.super_class = (Class)MRLanguageOption;
    v5 = -[MRLanguageOption init](&v20, sel_init);
    if (v5)
    {
      v5->_type = objc_msgSend(v4, "type");
      v5->_hasType = objc_msgSend(v4, "hasType");
      objc_msgSend(v4, "languageTag");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      languageTag = v5->_languageTag;
      v5->_languageTag = (NSString *)v7;

      objc_msgSend(v4, "characteristics");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "copy");
      characteristics = v5->_characteristics;
      v5->_characteristics = (NSArray *)v10;

      objc_msgSend(v4, "displayName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "copy");
      displayName = v5->_displayName;
      v5->_displayName = (NSString *)v13;

      objc_msgSend(v4, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "copy");
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v16;

    }
    self = v5;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (MRLanguageOption)initWithData:(id)a3
{
  id v4;
  _MRLanguageOptionProtobuf *v5;
  MRLanguageOption *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[_MRLanguageOptionProtobuf initWithData:]([_MRLanguageOptionProtobuf alloc], "initWithData:", v4);

    self = -[MRLanguageOption initWithProtobuf:](self, "initWithProtobuf:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (_MRLanguageOptionProtobuf)protobuf
{
  _MRLanguageOptionProtobuf *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(_MRLanguageOptionProtobuf);
  v3->_type = -[MRLanguageOption type](self, "type");
  *(_BYTE *)&v3->_has = *(_BYTE *)&v3->_has & 0xFE | -[MRLanguageOption hasType](self, "hasType");
  -[MRLanguageOption languageTag](self, "languageTag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRLanguageOptionProtobuf setLanguageTag:](v3, "setLanguageTag:", v4);

  -[MRLanguageOption characteristics](self, "characteristics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  -[_MRLanguageOptionProtobuf setCharacteristics:](v3, "setCharacteristics:", v6);

  -[MRLanguageOption displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRLanguageOptionProtobuf setDisplayName:](v3, "setDisplayName:", v7);

  -[MRLanguageOption identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRLanguageOptionProtobuf setIdentifier:](v3, "setIdentifier:", v8);

  return v3;
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[MRLanguageOption protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[MRLanguageOption hasType](self, "hasType"))
  {
    v4 = (__CFString *)MRLanguageOptionTypeCopyDescription(-[MRLanguageOption type](self, "type"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("type"));

  }
  -[MRLanguageOption languageTag](self, "languageTag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("languageTag"));

  -[MRLanguageOption characteristics](self, "characteristics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("characteristics"));

  -[MRLanguageOption displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("displayName"));

  -[MRLanguageOption identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("identifier"));

  return (NSDictionary *)v3;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
  self->_hasType = 1;
}

- (BOOL)isEqual:(id)a3
{
  MRLanguageOption *v4;
  _BOOL4 v5;
  unsigned int v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  char v11;
  id v12;
  id v13;
  void *v14;
  char v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  void *v21;
  void *v22;

  v4 = (MRLanguageOption *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_18;
    v5 = -[MRLanguageOption hasType](v4, "hasType");
    if (v5 != -[MRLanguageOption hasType](self, "hasType"))
      goto LABEL_18;
    if (-[MRLanguageOption hasType](v4, "hasType"))
    {
      if (-[MRLanguageOption hasType](self, "hasType"))
      {
        v6 = -[MRLanguageOption type](v4, "type");
        if (v6 != -[MRLanguageOption type](self, "type"))
          goto LABEL_18;
      }
    }
    -[MRLanguageOption languageTag](v4, "languageTag");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[MRLanguageOption languageTag](self, "languageTag");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      v10 = objc_msgSend(v7, "isEqual:", v8);

      if ((v10 & 1) == 0)
        goto LABEL_18;
    }
    -[MRLanguageOption displayName](v4, "displayName");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[MRLanguageOption displayName](self, "displayName");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v12 == v13)
    {

    }
    else
    {
      v14 = v13;
      v15 = objc_msgSend(v12, "isEqual:", v13);

      if ((v15 & 1) == 0)
        goto LABEL_18;
    }
    -[MRLanguageOption identifier](v4, "identifier");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    -[MRLanguageOption identifier](self, "identifier");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (v16 == v17)
    {

    }
    else
    {
      v18 = v17;
      v19 = objc_msgSend(v16, "isEqual:", v17);

      if ((v19 & 1) == 0)
      {
LABEL_18:
        v11 = 0;
        goto LABEL_19;
      }
    }
    -[MRLanguageOption characteristics](v4, "characteristics");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRLanguageOption characteristics](self, "characteristics");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21 == v22)
      v11 = 1;
    else
      v11 = objc_msgSend(v21, "isEqual:", v22);

  }
LABEL_19:

  return v11;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRLanguageOption dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p> %@"), v4, self, v5);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (-[MRLanguageOption hasType](self, "hasType"))
    objc_msgSend(v5, "setType:", -[MRLanguageOption type](self, "type"));
  -[MRLanguageOption languageTag](self, "languageTag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setLanguageTag:", v7);

  -[MRLanguageOption characteristics](self, "characteristics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  objc_msgSend(v5, "setCharacteristics:", v9);

  -[MRLanguageOption displayName](self, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copyWithZone:", a3);
  objc_msgSend(v5, "setDisplayName:", v11);

  -[MRLanguageOption identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "copyWithZone:", a3);
  objc_msgSend(v5, "setIdentifier:", v13);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "allowsKeyedCoding"))
  {
    objc_msgSend(v9, "encodeInt32:forKey:", -[MRLanguageOption type](self, "type"), CFSTR("kMRLanguageOptionType"));
    -[MRLanguageOption languageTag](self, "languageTag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeObject:forKey:", v4, CFSTR("kMRLanguageOptionLanguageTag"));

    -[MRLanguageOption characteristics](self, "characteristics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("KMRLanguageOptionCharacteristics"));

    -[MRLanguageOption displayName](self, "displayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("kMRLanguageOptionDisplayName"));

    -[MRLanguageOption identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("kMRLanguageOptionIdentifier"));

    -[MRLanguageOption protobuf](self, "protobuf");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("protobuf"));

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("coder must support key-value coding"));
  }

}

- (MRLanguageOption)initWithCoder:(id)a3
{
  id v4;
  MRLanguageOption *v5;
  void *v6;
  MRLanguageOption *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MRLanguageOption;
  v5 = -[MRLanguageOption init](&v15, sel_init);
  if (!v5)
    goto LABEL_12;
  if (!objc_msgSend(v4, "allowsKeyedCoding"))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 38);
    objc_msgSend(v4, "failWithError:", v8);
LABEL_11:

LABEL_12:
    v7 = v5;
    goto LABEL_13;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobuf"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    _MRLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MRLanguageOption initWithCoder:].cold.1((uint64_t)v6, v9);

    goto LABEL_10;
  }
  if (!v6)
  {
LABEL_10:
    -[MRLanguageOption setType:](v5, "setType:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("kMRLanguageOptionType")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMRLanguageOptionLanguageTag"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRLanguageOption setLanguageTag:](v5, "setLanguageTag:", v10);

    MSVPropertyListDataClasses();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("KMRLanguageOptionCharacteristics"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRLanguageOption setCharacteristics:](v5, "setCharacteristics:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMRLanguageOptionDisplayName"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRLanguageOption setDisplayName:](v5, "setDisplayName:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMRLanguageOptionIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRLanguageOption setIdentifier:](v5, "setIdentifier:", v8);
    goto LABEL_11;
  }
  v7 = -[MRLanguageOption initWithProtobuf:](v5, "initWithProtobuf:", v6);

LABEL_13:
  return v7;
}

- (BOOL)isAutomaticLanguageOptionWithType:(unsigned int)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v11;
  char v12;

  if (-[MRLanguageOption type](self, "type") != a3)
    return 0;
  -[MRLanguageOption characteristics](self, "characteristics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    return 0;
  -[MRLanguageOption displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
    return 0;
  -[MRLanguageOption identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (v9)
    return 0;
  -[MRLanguageOption languageTag](self, "languageTag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("__AUTO__"));

  return v12;
}

- (unsigned)type
{
  return self->_type;
}

- (BOOL)hasType
{
  return self->_hasType;
}

- (void)setHasType:(BOOL)a3
{
  self->_hasType = a3;
}

- (NSString)languageTag
{
  return self->_languageTag;
}

- (void)setLanguageTag:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)characteristics
{
  return self->_characteristics;
}

- (void)setCharacteristics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_characteristics, 0);
  objc_storeStrong((id *)&self->_languageTag, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 138543362;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_error_impl(&dword_193827000, a2, OS_LOG_TYPE_ERROR, "Unable to decode object, got class %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
