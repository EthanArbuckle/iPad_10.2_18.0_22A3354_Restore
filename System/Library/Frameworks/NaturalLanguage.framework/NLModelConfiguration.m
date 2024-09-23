@implementation NLModelConfiguration

- (NLModelConfiguration)initWithModelType:(int64_t)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  NLModelConfiguration *v15;
  void *v16;
  void *v17;
  NLModelConfiguration *v18;
  NLModelConfiguration *v19;
  uint64_t v20;
  NSString *language;
  uint64_t v22;
  NSDictionary *options;
  objc_super v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = unsignedIntegerForKey(v8, (uint64_t)CFSTR("Revision"), 0);
  stringForKey(v8, (uint64_t)CFSTR("Language"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[NLModelConfiguration supportedRevisionsForType:](NLModelConfiguration, "supportedRevisionsForType:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsIndex:", v9);

    if ((v12 & 1) == 0)
    {
      if (a5)
      {
        v13 = (void *)MEMORY[0x1E0CB35C8];
        v26 = *MEMORY[0x1E0CB2D50];
        v27[0] = CFSTR("The specified revision is not supported");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 3, v14);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      v15 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = +[NLModelConfiguration currentRevisionForType:](NLModelConfiguration, "currentRevisionForType:", a3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("Revision"));

    v8 = v16;
  }
  v25.receiver = self;
  v25.super_class = (Class)NLModelConfiguration;
  v18 = -[NLModelConfiguration init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_type = a3;
    v18->_revision = v9;
    v20 = objc_msgSend(v10, "copy");
    language = v19->_language;
    v19->_language = (NSString *)v20;

    v22 = objc_msgSend(v8, "copy");
    options = v19->_options;
    v19->_options = (NSDictionary *)v22;

  }
  self = v19;
  v15 = self;
LABEL_10:

  return v15;
}

+ (id)defaultModelConfigurationForType:(int64_t)a3
{
  return -[NLModelConfiguration initWithModelType:options:error:]([NLModelConfiguration alloc], "initWithModelType:options:error:", a3, 0, 0);
}

+ (id)defaultModelConfigurationForType:(int64_t)a3 options:(id)a4 error:(id *)a5
{
  id v7;
  NLModelConfiguration *v8;

  v7 = a4;
  v8 = -[NLModelConfiguration initWithModelType:options:error:]([NLModelConfiguration alloc], "initWithModelType:options:error:", a3, v7, a5);

  return v8;
}

- (unint64_t)hash
{
  NLModelType v3;
  NSUInteger v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = -[NLModelConfiguration type](self, "type");
  v4 = -[NLModelConfiguration revision](self, "revision") ^ (v3 << 16);
  -[NLModelConfiguration language](self, "language");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash");
  -[NLModelConfiguration options](self, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4 ^ v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  NLModelConfiguration *v4;
  NLModelConfiguration *v5;
  NLModelType v6;
  NSUInteger v7;
  void *v8;
  char v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = (NLModelConfiguration *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
    goto LABEL_11;
  }
  if (!v4)
    goto LABEL_10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_10;
  v6 = -[NLModelConfiguration type](self, "type");
  if (v6 != -[NLModelConfiguration type](v5, "type"))
    goto LABEL_10;
  v7 = -[NLModelConfiguration revision](self, "revision");
  if (v7 != -[NLModelConfiguration revision](v5, "revision"))
    goto LABEL_10;
  -[NLModelConfiguration language](self, "language");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[NLModelConfiguration language](v5, "language");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_12;
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }

LABEL_12:
  -[NLModelConfiguration language](self, "language");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLModelConfiguration language](v5, "language");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", v13))
  {
    -[NLModelConfiguration options](self, "options");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NLModelConfiguration options](v5, "options");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v14, "isEqual:", v15);

  }
  else
  {
    v9 = 0;
  }

LABEL_11:
  return v9;
}

- (NLModelType)type
{
  return self->_type;
}

- (NSUInteger)revision
{
  return self->_revision;
}

- (NLLanguage)language
{
  return self->_language;
}

- (id)options
{
  return self->_options;
}

- (id)embeddingURL
{
  void *v2;
  id v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("EmbeddingURL"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v4 = 0;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
LABEL_7:

  return v4;
}

- (id)embeddingModel
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("EmbeddingModel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)embeddingData
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_options, "objectForKey:", CFSTR("EmbeddingData"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NLModelConfiguration requires keyed coding"), 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
  objc_msgSend(v6, "encodeInteger:forKey:", -[NLModelConfiguration type](self, "type"), CFSTR("NLModelType"));
  -[NLModelConfiguration options](self, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("NLOptions"));

}

- (NLModelConfiguration)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NLModelConfiguration *v7;
  id v9;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NLModelConfiguration requires keyed coding"), 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v9);
  }
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("NLModelType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("NLOptions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NLModelConfiguration initWithModelType:options:error:](self, "initWithModelType:options:error:", v5, v6, 0);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSIndexSet)supportedRevisionsForType:(NLModelType)type
{
  return (NSIndexSet *)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", objc_msgSend(a1, "currentRevisionForType:", type));
}

+ (NSUInteger)currentRevisionForType:(NLModelType)type
{
  return (unint64_t)type < 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end
