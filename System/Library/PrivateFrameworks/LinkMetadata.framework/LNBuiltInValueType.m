@implementation LNBuiltInValueType

- (LNBuiltInValueType)initWithBuiltInType:(int64_t)a3
{
  LNBuiltInValueType *v4;
  LNBuiltInValueType *v5;
  LNBuiltInValueType *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LNBuiltInValueType;
  v4 = -[LNValueType _init](&v8, sel__init);
  v5 = v4;
  if (v4)
  {
    v4->_builtInType = a3;
    v6 = v4;
  }

  return v5;
}

- (Class)objectClass
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "supportedClassesByTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[LNBuiltInValueType builtInType](self, "builtInType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

- (id)typeIdentifierAsString
{
  int64_t v2;
  __CFString *v3;

  v2 = -[LNBuiltInValueType builtInType](self, "builtInType");
  v3 = CFSTR("Intent Change Operation");
  if (v2 == 1)
    v3 = CFSTR("Toggle Activation");
  if (v2 == 2)
    return CFSTR("Photo Collection");
  else
    return v3;
}

- (LNBuiltInValueType)initWithCoder:(id)a3
{
  return -[LNBuiltInValueType initWithBuiltInType:](self, "initWithBuiltInType:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("builtInType")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNBuiltInValueType builtInType](self, "builtInType"), CFSTR("builtInType"));

}

- (BOOL)isEqual:(id)a3
{
  LNBuiltInValueType *v4;
  LNBuiltInValueType *v5;
  LNBuiltInValueType *v6;
  int64_t v7;
  BOOL v8;

  v4 = (LNBuiltInValueType *)a3;
  v5 = v4;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    v6 = v4;
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v7 = -[LNBuiltInValueType builtInType](self, "builtInType");
      v8 = v7 == -[LNBuiltInValueType builtInType](v6, "builtInType");
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (int64_t)builtInType
{
  return self->_builtInType;
}

+ (LNBuiltInValueType)intentToggleOperationValueType
{
  if (intentToggleOperationValueType_onceToken != -1)
    dispatch_once(&intentToggleOperationValueType_onceToken, &__block_literal_global_3078);
  return (LNBuiltInValueType *)(id)intentToggleOperationValueType_value;
}

+ (LNBuiltInValueType)intentToggleStateValueType
{
  if (intentToggleStateValueType_onceToken != -1)
    dispatch_once(&intentToggleStateValueType_onceToken, &__block_literal_global_1_3077);
  return (LNBuiltInValueType *)(id)intentToggleStateValueType_value;
}

+ (LNBuiltInValueType)photoItemCollectionValueType
{
  if (photoItemCollectionValueType_onceToken != -1)
    dispatch_once(&photoItemCollectionValueType_onceToken, &__block_literal_global_2_3076);
  return (LNBuiltInValueType *)(id)photoItemCollectionValueType_value;
}

+ (id)objectClassesForCoding
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "supportedClassesByTypeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)supportedClassesByTypeIdentifier
{
  _QWORD v3[3];
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v3[0] = &unk_1E39B4988;
  v4[0] = objc_opt_class();
  v3[1] = &unk_1E39B49A0;
  v4[1] = objc_opt_class();
  v3[2] = &unk_1E39B49B8;
  v4[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __50__LNBuiltInValueType_photoItemCollectionValueType__block_invoke()
{
  LNBuiltInValueType *v0;
  void *v1;

  v0 = -[LNBuiltInValueType initWithBuiltInType:]([LNBuiltInValueType alloc], "initWithBuiltInType:", 2);
  v1 = (void *)photoItemCollectionValueType_value;
  photoItemCollectionValueType_value = (uint64_t)v0;

}

void __48__LNBuiltInValueType_intentToggleStateValueType__block_invoke()
{
  LNBuiltInValueType *v0;
  void *v1;

  v0 = -[LNBuiltInValueType initWithBuiltInType:]([LNBuiltInValueType alloc], "initWithBuiltInType:", 1);
  v1 = (void *)intentToggleStateValueType_value;
  intentToggleStateValueType_value = (uint64_t)v0;

}

void __52__LNBuiltInValueType_intentToggleOperationValueType__block_invoke()
{
  LNBuiltInValueType *v0;
  void *v1;

  v0 = -[LNBuiltInValueType initWithBuiltInType:]([LNBuiltInValueType alloc], "initWithBuiltInType:", 0);
  v1 = (void *)intentToggleOperationValueType_value;
  intentToggleOperationValueType_value = (uint64_t)v0;

}

@end
