@implementation ATXFaceGalleryConfiguration

- (ATXFaceGalleryConfiguration)initWithSections:(id)a3
{
  return -[ATXFaceGalleryConfiguration initWithSections:source:locale:](self, "initWithSections:source:locale:", a3, 0, 0);
}

- (ATXFaceGalleryConfiguration)initWithSections:(id)a3 source:(int64_t)a4 locale:(id)a5
{
  return -[ATXFaceGalleryConfiguration initWithSections:source:locale:dayZero:](self, "initWithSections:source:locale:dayZero:", a3, a4, a5, 0);
}

- (ATXFaceGalleryConfiguration)initWithSections:(id)a3 source:(int64_t)a4 locale:(id)a5 dayZero:(BOOL)a6
{
  id v10;
  id v11;
  ATXFaceGalleryConfiguration *v12;
  uint64_t v13;
  NSArray *sections;
  objc_super v16;

  v10 = a3;
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ATXFaceGalleryConfiguration;
  v12 = -[ATXFaceGalleryConfiguration init](&v16, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    sections = v12->_sections;
    v12->_sections = (NSArray *)v13;

    v12->_source = a4;
    objc_storeStrong((id *)&v12->_locale, a5);
    v12->_dayZero = a6;
  }

  return v12;
}

+ (id)configurationFromJSONDictionary:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  ATXFaceGalleryConfiguration *v12;
  NSObject *v13;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sections"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sections"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_61);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("source"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("dayZero"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    v12 = -[ATXFaceGalleryConfiguration initWithSections:source:locale:dayZero:]([ATXFaceGalleryConfiguration alloc], "initWithSections:source:locale:dayZero:", v7, v9, 0, v11);
  }
  else
  {
    __atxlog_handle_lock_screen();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[ATXFaceGalleryConfiguration configurationFromJSONDictionary:].cold.1(v13);

    v12 = 0;
  }

  return v12;
}

id __63__ATXFaceGalleryConfiguration_configurationFromJSONDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[ATXFaceGallerySection sectionFromJSONDictionary:](ATXFaceGallerySection, "sectionFromJSONDictionary:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)configurationByApplyingConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)-[ATXFaceGalleryConfiguration copy](self, "copy");
  if (v4)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v4, "sections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if ((unint64_t)objc_msgSend(v11, "semanticType") <= 0xD)
          {
            objc_msgSend(v5, "sections");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v16[0] = MEMORY[0x1E0C809B0];
            v16[1] = 3221225472;
            v16[2] = __68__ATXFaceGalleryConfiguration_configurationByApplyingConfiguration___block_invoke;
            v16[3] = &unk_1E4D5A9F8;
            v16[4] = v11;
            objc_msgSend(v12, "bs_firstObjectPassingTest:", v16);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              objc_msgSend(v11, "items");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setItems:", v14);

            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v8);
    }

  }
  return v5;
}

BOOL __68__ATXFaceGalleryConfiguration_configurationByApplyingConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "semanticType");
  return v3 == objc_msgSend(*(id *)(a1 + 32), "semanticType");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXFaceGalleryConfiguration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  ATXFaceGalleryConfiguration *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("sections"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("source"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locale"));
    v11 = objc_claimAutoreleasedReturnValue();
    self = -[ATXFaceGalleryConfiguration initWithSections:source:locale:dayZero:](self, "initWithSections:source:locale:dayZero:", v8, v10, v11, objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dayZero")));
    v12 = self;
  }
  else
  {
    __atxlog_handle_lock_screen();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXFaceGalleryConfiguration initWithCoder:].cold.1(v11);
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ATXFaceGalleryConfiguration sections](self, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("sections"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ATXFaceGalleryConfiguration source](self, "source"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("source"));

  -[ATXFaceGalleryConfiguration locale](self, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("locale"));

  objc_msgSend(v7, "encodeBool:forKey:", -[ATXFaceGalleryConfiguration isDayZero](self, "isDayZero"), CFSTR("dayZero"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[ATXFaceGalleryConfiguration sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXFaceGalleryConfiguration source](self, "source");
  -[ATXFaceGalleryConfiguration locale](self, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithSections:source:locale:dayZero:", v5, v6, v7, -[ATXFaceGalleryConfiguration isDayZero](self, "isDayZero"));

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  ATXFaceGalleryConfiguration *v4;
  ATXFaceGalleryConfiguration *v5;
  BOOL v6;

  v4 = (ATXFaceGalleryConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXFaceGalleryConfiguration isEqualToATXFaceGalleryConfiguration:](self, "isEqualToATXFaceGalleryConfiguration:", v5);

  return v6;
}

- (BOOL)isEqualToATXFaceGalleryConfiguration:(id)a3
{
  id *v4;
  NSArray *sections;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  char v9;
  NSLocale *locale;
  NSLocale *v11;
  NSLocale *v12;
  NSLocale *v13;
  char v14;
  BOOL v15;

  v4 = (id *)a3;
  sections = self->_sections;
  v6 = (NSArray *)v4[2];
  if (sections == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = sections;
    v9 = -[NSArray isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_8;
  }
  if ((id)self->_source == v4[3])
  {
    locale = self->_locale;
    v11 = (NSLocale *)v4[4];
    if (locale == v11)
    {

    }
    else
    {
      v12 = v11;
      v13 = locale;
      v14 = -[NSLocale isEqual:](v13, "isEqual:", v12);

      if ((v14 & 1) == 0)
        goto LABEL_8;
    }
    v15 = self->_dayZero == *((unsigned __int8 *)v4 + 8);
    goto LABEL_11;
  }
LABEL_8:
  v15 = 0;
LABEL_11:

  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  uint64_t v7;

  -[ATXFaceGalleryConfiguration sections](self, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v5 = -[ATXFaceGalleryConfiguration source](self, "source") - v4 + 32 * v4;
  -[ATXFaceGalleryConfiguration locale](self, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash") - v5 + 32 * v5;

  return 31 * v7 + -[ATXFaceGalleryConfiguration isDayZero](self, "isDayZero");
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  return v6;
}

- (NSDictionary)jsonDictionary
{
  void *v3;
  void *v4;
  int64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("sections");
  -[ATXFaceGalleryConfiguration sections](self, "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_24_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v10[1] = CFSTR("source");
  v5 = -[ATXFaceGalleryConfiguration source](self, "source");
  if ((_DWORD)v5)
  {
    if ((_DWORD)v5 == 1)
    {
      v6 = CFSTR("Proactive");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v6 = CFSTR("Unknown");
  }
  v11[1] = v6;
  v10[2] = CFSTR("dayZero");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ATXFaceGalleryConfiguration isDayZero](self, "isDayZero"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v8;
}

uint64_t __45__ATXFaceGalleryConfiguration_jsonDictionary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "jsonDictionary");
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXFaceGalleryConfiguration jsonDictionary](self, "jsonDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (ATXFaceGalleryConfiguration)initWithProtoData:(id)a3
{
  id v4;
  ATXPBFaceGalleryConfiguration *v5;
  ATXFaceGalleryConfiguration *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBFaceGalleryConfiguration initWithData:]([ATXPBFaceGalleryConfiguration alloc], "initWithData:", v4);

    self = -[ATXFaceGalleryConfiguration initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXFaceGalleryConfiguration proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXFaceGalleryConfiguration)initWithProto:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  ATXFaceGalleryConfiguration *v12;
  ATXFaceGalleryConfiguration *v13;
  NSObject *v14;

  v4 = a3;
  if (!v4)
  {
LABEL_9:
    v13 = 0;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_lock_screen();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      -[ATXDigestTimeline initWithProto:].cold.1((uint64_t)self, v14);

    goto LABEL_9;
  }
  v5 = v4;
  -[ATXPBFaceGalleryConfiguration sections]((uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_pas_mappedArrayWithTransform:", &__block_literal_global_28_0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v7)
    v9 = (void *)v7;
  v10 = v9;

  v11 = -[ATXPBFaceGalleryConfiguration source]((uint64_t)v5);
  v12 = -[ATXFaceGalleryConfiguration initWithSections:source:locale:dayZero:](self, "initWithSections:source:locale:dayZero:", v10, v11, 0, 0);

  self = v12;
  v13 = self;
LABEL_10:

  return v13;
}

ATXFaceGallerySection *__45__ATXFaceGalleryConfiguration_initWithProto___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ATXFaceGallerySection *v3;

  v2 = a2;
  v3 = -[ATXFaceGallerySection initWithProto:]([ATXFaceGallerySection alloc], "initWithProto:", v2);

  return v3;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  -[ATXFaceGalleryConfiguration sections](self, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_30_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  -[ATXPBFaceGalleryConfiguration setSections:]((uint64_t)v3, v6);

  -[ATXPBFaceGalleryConfiguration setSource:]((uint64_t)v3, -[ATXFaceGalleryConfiguration source](self, "source"));
  return v3;
}

uint64_t __36__ATXFaceGalleryConfiguration_proto__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "proto");
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)source
{
  return self->_source;
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (BOOL)isDayZero
{
  return self->_dayZero;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

+ (void)configurationFromJSONDictionary:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136315394;
  v2 = "+[ATXFaceGalleryConfiguration configurationFromJSONDictionary:]";
  v3 = 2112;
  v4 = CFSTR("sections");
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "%s: missing key: %@", (uint8_t *)&v1, 0x16u);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "Unable to decode sections", v1, 2u);
}

@end
