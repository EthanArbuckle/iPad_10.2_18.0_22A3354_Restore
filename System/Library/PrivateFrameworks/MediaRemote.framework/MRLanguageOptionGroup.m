@implementation MRLanguageOptionGroup

- (MRLanguageOptionGroup)initWithLanguageOptions:(id)a3 defaultLanguageOption:(id)a4 allowsEmptySelection:(BOOL)a5
{
  id v8;
  id v9;
  MRLanguageOptionGroup *v10;
  uint64_t v11;
  NSArray *languageOptions;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MRLanguageOptionGroup;
  v10 = -[MRLanguageOptionGroup init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    languageOptions = v10->_languageOptions;
    v10->_languageOptions = (NSArray *)v11;

    objc_storeStrong((id *)&v10->_defaultLanguageOption, a4);
    v10->_allowsEmptySelection = a5;
    v10->_hasAllowsEmptySelection = 1;
  }

  return v10;
}

- (MRLanguageOptionGroup)initWithProtobuf:(id)a3
{
  id v4;
  MRLanguageOptionGroup *v5;
  MRLanguageOption *v6;
  void *v7;
  uint64_t v8;
  MRLanguageOption *defaultLanguageOption;
  void *v10;
  uint64_t v11;
  NSArray *languageOptions;
  MRLanguageOptionGroup *v13;
  objc_super v15;

  v4 = a3;
  if (v4)
  {
    v15.receiver = self;
    v15.super_class = (Class)MRLanguageOptionGroup;
    v5 = -[MRLanguageOptionGroup init](&v15, sel_init);
    if (v5)
    {
      v5->_allowsEmptySelection = objc_msgSend(v4, "allowEmptySelection");
      v5->_hasAllowsEmptySelection = objc_msgSend(v4, "hasAllowEmptySelection");
      if (objc_msgSend(v4, "hasDefaultLanguageOption"))
      {
        v6 = [MRLanguageOption alloc];
        objc_msgSend(v4, "defaultLanguageOption");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[MRLanguageOption initWithProtobuf:](v6, "initWithProtobuf:", v7);
        defaultLanguageOption = v5->_defaultLanguageOption;
        v5->_defaultLanguageOption = (MRLanguageOption *)v8;

      }
      objc_msgSend(v4, "languageOptions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "mr_map:", &__block_literal_global_105);
      v11 = objc_claimAutoreleasedReturnValue();
      languageOptions = v5->_languageOptions;
      v5->_languageOptions = (NSArray *)v11;

    }
    self = v5;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

MRLanguageOption *__42__MRLanguageOptionGroup_initWithProtobuf___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRLanguageOption *v3;

  v2 = a2;
  v3 = -[MRLanguageOption initWithProtobuf:]([MRLanguageOption alloc], "initWithProtobuf:", v2);

  return v3;
}

- (MRLanguageOptionGroup)initWithData:(id)a3
{
  id v4;
  _MRLanguageOptionGroupProtobuf *v5;
  MRLanguageOptionGroup *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[_MRLanguageOptionGroupProtobuf initWithData:]([_MRLanguageOptionGroupProtobuf alloc], "initWithData:", v4);

    self = -[MRLanguageOptionGroup initWithProtobuf:](self, "initWithProtobuf:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (_MRLanguageOptionGroupProtobuf)protobuf
{
  _MRLanguageOptionGroupProtobuf *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(_MRLanguageOptionGroupProtobuf);
  -[MRLanguageOptionGroup defaultLanguageOption](self, "defaultLanguageOption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "protobuf");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRLanguageOptionGroupProtobuf setDefaultLanguageOption:](v3, "setDefaultLanguageOption:", v5);

  -[MRLanguageOptionGroup languageOptions](self, "languageOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    -[MRLanguageOptionGroup languageOptions](self, "languageOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "mr_map:", &__block_literal_global_8_1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    -[_MRLanguageOptionGroupProtobuf setLanguageOptions:](v3, "setLanguageOptions:", v10);

  }
  -[_MRLanguageOptionGroupProtobuf setAllowEmptySelection:](v3, "setAllowEmptySelection:", -[MRLanguageOptionGroup allowsEmptySelection](self, "allowsEmptySelection"));
  -[_MRLanguageOptionGroupProtobuf setHasAllowEmptySelection:](v3, "setHasAllowEmptySelection:", -[MRLanguageOptionGroup hasAllowsEmptySelection](self, "hasAllowsEmptySelection"));
  return v3;
}

uint64_t __33__MRLanguageOptionGroup_protobuf__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "protobuf");
}

- (NSData)data
{
  void *v2;
  void *v3;

  -[MRLanguageOptionGroup protobuf](self, "protobuf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (-[MRLanguageOptionGroup hasAllowsEmptySelection](self, "hasAllowsEmptySelection"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[MRLanguageOptionGroup allowsEmptySelection](self, "allowsEmptySelection"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("allowsEmptySelection"));

  }
  -[MRLanguageOptionGroup languageOptions](self, "languageOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mr_map:", &__block_literal_global_13_1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("languageOptions"));

  -[MRLanguageOptionGroup defaultLanguageOption](self, "defaultLanguageOption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("defaultLanguageOption"));

  return (NSDictionary *)v3;
}

uint64_t __49__MRLanguageOptionGroup_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

- (void)setAllowsEmptySelection:(BOOL)a3
{
  self->_allowsEmptySelection = a3;
  self->_hasAllowsEmptySelection = 1;
}

- (BOOL)isEqual:(id)a3
{
  MRLanguageOptionGroup *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = (MRLanguageOptionGroup *)a3;
  if (v4 == self)
  {
    v13 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_9;
  v5 = -[MRLanguageOptionGroup hasAllowsEmptySelection](v4, "hasAllowsEmptySelection");
  if (v5 != -[MRLanguageOptionGroup hasAllowsEmptySelection](self, "hasAllowsEmptySelection"))
    goto LABEL_9;
  if (-[MRLanguageOptionGroup hasAllowsEmptySelection](v4, "hasAllowsEmptySelection"))
  {
    if (-[MRLanguageOptionGroup hasAllowsEmptySelection](self, "hasAllowsEmptySelection"))
    {
      v6 = -[MRLanguageOptionGroup allowsEmptySelection](v4, "allowsEmptySelection");
      if (v6 != -[MRLanguageOptionGroup allowsEmptySelection](self, "allowsEmptySelection"))
        goto LABEL_9;
    }
  }
  -[MRLanguageOptionGroup languageOptions](v4, "languageOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRLanguageOptionGroup languageOptions](self, "languageOptions");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v7 == (void *)v8)
  {

  }
  else
  {
    v9 = (void *)v8;
    -[MRLanguageOptionGroup languageOptions](v4, "languageOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRLanguageOptionGroup languageOptions](self, "languageOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
    {
LABEL_9:
      v13 = 0;
      goto LABEL_11;
    }
  }
  -[MRLanguageOptionGroup defaultLanguageOption](v4, "defaultLanguageOption");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRLanguageOptionGroup defaultLanguageOption](self, "defaultLanguageOption");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v15 == (void *)v16)
  {
    v13 = 1;
    v17 = v15;
  }
  else
  {
    v17 = (void *)v16;
    -[MRLanguageOptionGroup defaultLanguageOption](v4, "defaultLanguageOption");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRLanguageOptionGroup defaultLanguageOption](self, "defaultLanguageOption");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v18, "isEqual:", v19);

  }
LABEL_11:

  return v13;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[MRLanguageOptionGroup dictionaryRepresentation](self, "dictionaryRepresentation");
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
  _QWORD v11[5];

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (-[MRLanguageOptionGroup hasAllowsEmptySelection](self, "hasAllowsEmptySelection"))
    objc_msgSend(v5, "setAllowsEmptySelection:", -[MRLanguageOptionGroup allowsEmptySelection](self, "allowsEmptySelection"));
  -[MRLanguageOptionGroup defaultLanguageOption](self, "defaultLanguageOption");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  objc_msgSend(v5, "setDefaultLanguageOption:", v7);

  -[MRLanguageOptionGroup languageOptions](self, "languageOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __38__MRLanguageOptionGroup_copyWithZone___block_invoke;
  v11[3] = &__block_descriptor_40_e26__16__0__MRLanguageOption_8l;
  v11[4] = a3;
  objc_msgSend(v8, "mr_map:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLanguageOptions:", v9);

  return v5;
}

id __38__MRLanguageOptionGroup_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copyWithZone:", *(_QWORD *)(a1 + 32));
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
    objc_msgSend(v9, "encodeBool:forKey:", -[MRLanguageOptionGroup allowsEmptySelection](self, "allowsEmptySelection"), CFSTR("kMRLanguageOptionAllowEmptySelection"));
    -[MRLanguageOptionGroup defaultLanguageOption](self, "defaultLanguageOption");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "protobuf");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("kMRLanguageOptionDefaultSelection"));

    -[MRLanguageOptionGroup languageOptions](self, "languageOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mr_map:", &__block_literal_global_21_1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("kMRLanguageOptions"));

    -[MRLanguageOptionGroup protobuf](self, "protobuf");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("protobuf"));

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("coder must support key-value coding"));
  }

}

uint64_t __41__MRLanguageOptionGroup_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "protobuf");
}

- (MRLanguageOptionGroup)initWithCoder:(id)a3
{
  id v4;
  MRLanguageOptionGroup *v5;
  void *v6;
  void *v7;
  MRLanguageOption *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MRLanguageOptionGroup *v13;
  NSObject *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MRLanguageOptionGroup;
  v5 = -[MRLanguageOptionGroup init](&v16, sel_init);
  if (!v5)
    goto LABEL_10;
  if (!objc_msgSend(v4, "allowsKeyedCoding"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithMRError:", 38);
    objc_msgSend(v4, "failWithError:", v6);
LABEL_9:

LABEL_10:
    v13 = v5;
    goto LABEL_14;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobuf"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[MRLanguageOptionGroup setAllowsEmptySelection:](v5, "setAllowsEmptySelection:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kMRLanguageOptionAllowEmptySelection")));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kMRLanguageOptionDefaultSelection"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v7 = 0;
      }
      v8 = -[MRLanguageOption initWithProtobuf:]([MRLanguageOption alloc], "initWithProtobuf:", v7);
      -[MRLanguageOptionGroup setDefaultLanguageOption:](v5, "setDefaultLanguageOption:", v8);

      MSVPropertyListDataClasses();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setByAddingObject:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("kMRLanguageOptions"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "mr_map:", &__block_literal_global_28_1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MRLanguageOptionGroup setLanguageOptions:](v5, "setLanguageOptions:", v12);

      goto LABEL_9;
    }
  }
  _MRLogForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[MRLanguageOption initWithCoder:].cold.1((uint64_t)v6, v14);

  v13 = 0;
LABEL_14:

  return v13;
}

MRLanguageOption *__39__MRLanguageOptionGroup_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  MRLanguageOption *v3;

  v2 = a2;
  v3 = -[MRLanguageOption initWithProtobuf:]([MRLanguageOption alloc], "initWithProtobuf:", v2);

  return v3;
}

- (BOOL)allowsEmptySelection
{
  return self->_allowsEmptySelection;
}

- (BOOL)hasAllowsEmptySelection
{
  return self->_hasAllowsEmptySelection;
}

- (void)setHasAllowsEmptySelection:(BOOL)a3
{
  self->_hasAllowsEmptySelection = a3;
}

- (NSArray)languageOptions
{
  return self->_languageOptions;
}

- (void)setLanguageOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MRLanguageOption)defaultLanguageOption
{
  return self->_defaultLanguageOption;
}

- (void)setDefaultLanguageOption:(id)a3
{
  objc_storeStrong((id *)&self->_defaultLanguageOption, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultLanguageOption, 0);
  objc_storeStrong((id *)&self->_languageOptions, 0);
}

@end
