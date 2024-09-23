@implementation HAPJSONValueTransformer

- (id)reverseTransformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  id v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || v8
    && (v15.receiver = self,
        v15.super_class = (Class)HAPJSONValueTransformer,
        -[HAPValueTransformer reverseTransformedValue:format:error:](&v15, sel_reverseTransformedValue_format_error_, v8, a4, a5), v9 = (void *)objc_claimAutoreleasedReturnValue(), v10 = objc_msgSend(v8, "isEqual:", v9), v9, !v10))
  {
    v13 = 0;
  }
  else
  {
    v11 = objc_msgSend((id)objc_opt_class(), "expectedClassForFormat:", a4);
    if (v11 == objc_opt_class() && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 0);
    else
      v12 = v8;
    v13 = v12;
  }

  return v13;
}

+ (id)defaultJSONValueTransformer
{
  return (id)defaultJSONValueTransformer;
}

+ (Class)expectedTransformedClassForFormat:(unint64_t)a3
{
  if (a3 - 1 > 0xE)
    return (Class)0;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (id)transformedValue:(id)a3 format:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v12 = v11;
    goto LABEL_9;
  }
  v14.receiver = self;
  v14.super_class = (Class)HAPJSONValueTransformer;
  -[HAPValueTransformer transformedValue:format:error:](&v14, sel_transformedValue_format_error_, v8, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = v8;
    }
    goto LABEL_8;
  }
  v12 = 0;
LABEL_9:

  return v12;
}

+ (void)initialize
{
  HAPJSONValueTransformer *v2;
  void *v3;

  if (!defaultJSONValueTransformer)
  {
    v2 = objc_alloc_init(HAPJSONValueTransformer);
    v3 = (void *)defaultJSONValueTransformer;
    defaultJSONValueTransformer = (uint64_t)v2;

  }
}

@end
