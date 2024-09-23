@implementation LNPrimitiveValueType

+ (LNPrimitiveValueType)intValueType
{
  if (intValueType_onceToken != -1)
    dispatch_once(&intValueType_onceToken, &__block_literal_global_3);
  return (LNPrimitiveValueType *)(id)intValueType_value;
}

+ (LNPrimitiveValueType)doubleValueType
{
  if (doubleValueType_onceToken[0] != -1)
    dispatch_once(doubleValueType_onceToken, &__block_literal_global_8);
  return (LNPrimitiveValueType *)(id)doubleValueType_value;
}

+ (LNPrimitiveValueType)dateValueType
{
  if (dateValueType_onceToken[0] != -1)
    dispatch_once(dateValueType_onceToken, &__block_literal_global_9);
  return (LNPrimitiveValueType *)(id)dateValueType_value;
}

+ (LNPrimitiveValueType)stringValueType
{
  if (stringValueType_onceToken_547 != -1)
    dispatch_once(&stringValueType_onceToken_547, &__block_literal_global_548);
  return (LNPrimitiveValueType *)(id)stringValueType_value_549;
}

+ (LNPrimitiveValueType)BOOLValueType
{
  if (BOOLValueType_onceToken[0] != -1)
    dispatch_once(BOOLValueType_onceToken, &__block_literal_global_2);
  return (LNPrimitiveValueType *)(id)BOOLValueType_value;
}

- (Class)objectClass
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "supportedClassesByTypeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[LNPrimitiveValueType typeIdentifier](self, "typeIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

- (int64_t)typeIdentifier
{
  return self->_typeIdentifier;
}

+ (id)supportedClassesByTypeIdentifier
{
  _QWORD v3[13];
  _QWORD v4[14];

  v4[13] = *MEMORY[0x1E0C80C00];
  v3[0] = &unk_1E39B46D0;
  v4[0] = objc_opt_class();
  v3[1] = &unk_1E39B46E8;
  v4[1] = objc_opt_class();
  v3[2] = &unk_1E39B4700;
  v4[2] = objc_opt_class();
  v3[3] = &unk_1E39B4718;
  v4[3] = objc_opt_class();
  v3[4] = &unk_1E39B4730;
  v4[4] = objc_opt_class();
  v3[5] = &unk_1E39B4748;
  v4[5] = objc_opt_class();
  v3[6] = &unk_1E39B4760;
  v4[6] = objc_opt_class();
  v3[7] = &unk_1E39B4778;
  v4[7] = objc_opt_class();
  v3[8] = &unk_1E39B4790;
  v4[8] = objc_opt_class();
  v3[9] = &unk_1E39B47A8;
  v4[9] = objc_opt_class();
  v3[10] = &unk_1E39B47C0;
  v4[10] = objc_opt_class();
  v3[11] = &unk_1E39B47D8;
  v4[11] = objc_opt_class();
  v3[12] = &unk_1E39B47F0;
  v4[12] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 13);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  LNPrimitiveValueType *v4;
  LNPrimitiveValueType *v5;
  LNPrimitiveValueType *v6;
  int64_t v7;
  BOOL v8;

  v4 = (LNPrimitiveValueType *)a3;
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
      v7 = -[LNPrimitiveValueType typeIdentifier](self, "typeIdentifier");
      v8 = v7 == -[LNPrimitiveValueType typeIdentifier](v6, "typeIdentifier");
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

+ (LNPrimitiveValueType)placemarkValueType
{
  if (placemarkValueType_onceToken != -1)
    dispatch_once(&placemarkValueType_onceToken, &__block_literal_global_11);
  return (LNPrimitiveValueType *)(id)placemarkValueType_value;
}

+ (LNPrimitiveValueType)dateComponentsValueType
{
  if (dateComponentsValueType_onceToken != -1)
    dispatch_once(&dateComponentsValueType_onceToken, &__block_literal_global_10);
  return (LNPrimitiveValueType *)(id)dateComponentsValueType_value;
}

+ (LNPrimitiveValueType)attributedStringValueType
{
  if (attributedStringValueType_onceToken != -1)
    dispatch_once(&attributedStringValueType_onceToken, &__block_literal_global_1);
  return (LNPrimitiveValueType *)(id)attributedStringValueType_value;
}

+ (LNPrimitiveValueType)URLValueType
{
  if (URLValueType_onceToken != -1)
    dispatch_once(&URLValueType_onceToken, &__block_literal_global_12);
  return (LNPrimitiveValueType *)(id)URLValueType_value;
}

void __37__LNPrimitiveValueType_BOOLValueType__block_invoke()
{
  LNPrimitiveValueType *v0;
  void *v1;

  v0 = -[LNPrimitiveValueType initWithTypeIdentifier:]([LNPrimitiveValueType alloc], "initWithTypeIdentifier:", 1);
  v1 = (void *)BOOLValueType_value;
  BOOLValueType_value = (uint64_t)v0;

}

void __39__LNPrimitiveValueType_stringValueType__block_invoke()
{
  LNPrimitiveValueType *v0;
  void *v1;

  v0 = -[LNPrimitiveValueType initWithTypeIdentifier:]([LNPrimitiveValueType alloc], "initWithTypeIdentifier:", 0);
  v1 = (void *)stringValueType_value_549;
  stringValueType_value_549 = (uint64_t)v0;

}

void __36__LNPrimitiveValueType_intValueType__block_invoke()
{
  LNPrimitiveValueType *v0;
  void *v1;

  v0 = -[LNPrimitiveValueType initWithTypeIdentifier:]([LNPrimitiveValueType alloc], "initWithTypeIdentifier:", 2);
  v1 = (void *)intValueType_value;
  intValueType_value = (uint64_t)v0;

}

void __39__LNPrimitiveValueType_doubleValueType__block_invoke()
{
  LNPrimitiveValueType *v0;
  void *v1;

  v0 = -[LNPrimitiveValueType initWithTypeIdentifier:]([LNPrimitiveValueType alloc], "initWithTypeIdentifier:", 7);
  v1 = (void *)doubleValueType_value;
  doubleValueType_value = (uint64_t)v0;

}

void __37__LNPrimitiveValueType_dateValueType__block_invoke()
{
  LNPrimitiveValueType *v0;
  void *v1;

  v0 = -[LNPrimitiveValueType initWithTypeIdentifier:]([LNPrimitiveValueType alloc], "initWithTypeIdentifier:", 8);
  v1 = (void *)dateValueType_value;
  dateValueType_value = (uint64_t)v0;

}

- (LNPrimitiveValueType)initWithTypeIdentifier:(int64_t)a3
{
  LNPrimitiveValueType *v4;
  LNPrimitiveValueType *v5;
  LNPrimitiveValueType *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LNPrimitiveValueType;
  v4 = -[LNValueType _init](&v8, sel__init);
  v5 = v4;
  if (v4)
  {
    v4->_typeIdentifier = a3;
    v6 = v4;
  }

  return v5;
}

- (NSString)typeIdentifierAsString
{
  int64_t v2;

  v2 = -[LNPrimitiveValueType typeIdentifier](self, "typeIdentifier");
  if ((unint64_t)(v2 - 1) > 0xB)
    return (NSString *)CFSTR("String");
  else
    return &off_1E39A0C60[v2 - 1]->isa;
}

- (id)description
{
  int64_t v2;

  v2 = -[LNPrimitiveValueType typeIdentifier](self, "typeIdentifier");
  if ((unint64_t)(v2 - 1) > 0xB)
    return CFSTR("String");
  else
    return off_1E39A0C60[v2 - 1];
}

- (LNPrimitiveValueType)initWithCoder:(id)a3
{
  return -[LNPrimitiveValueType initWithTypeIdentifier:](self, "initWithTypeIdentifier:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("typeIdentifier")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNPrimitiveValueType typeIdentifier](self, "typeIdentifier"), CFSTR("typeIdentifier"));

}

+ (LNPrimitiveValueType)int8ValueType
{
  if (int8ValueType_onceToken != -1)
    dispatch_once(&int8ValueType_onceToken, &__block_literal_global_4);
  return (LNPrimitiveValueType *)(id)int8ValueType_value;
}

+ (LNPrimitiveValueType)int16ValueType
{
  if (int16ValueType_onceToken != -1)
    dispatch_once(&int16ValueType_onceToken, &__block_literal_global_5);
  return (LNPrimitiveValueType *)(id)int16ValueType_value;
}

+ (LNPrimitiveValueType)int32ValueType
{
  if (int32ValueType_onceToken != -1)
    dispatch_once(&int32ValueType_onceToken, &__block_literal_global_6);
  return (LNPrimitiveValueType *)(id)int32ValueType_value;
}

+ (LNPrimitiveValueType)int64ValueType
{
  if (int64ValueType_onceToken != -1)
    dispatch_once(&int64ValueType_onceToken, &__block_literal_global_7);
  return (LNPrimitiveValueType *)(id)int64ValueType_value;
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __36__LNPrimitiveValueType_URLValueType__block_invoke()
{
  LNPrimitiveValueType *v0;
  void *v1;

  v0 = -[LNPrimitiveValueType initWithTypeIdentifier:]([LNPrimitiveValueType alloc], "initWithTypeIdentifier:", 11);
  v1 = (void *)URLValueType_value;
  URLValueType_value = (uint64_t)v0;

}

void __42__LNPrimitiveValueType_placemarkValueType__block_invoke()
{
  LNPrimitiveValueType *v0;
  void *v1;

  v0 = -[LNPrimitiveValueType initWithTypeIdentifier:]([LNPrimitiveValueType alloc], "initWithTypeIdentifier:", 10);
  v1 = (void *)placemarkValueType_value;
  placemarkValueType_value = (uint64_t)v0;

}

void __47__LNPrimitiveValueType_dateComponentsValueType__block_invoke()
{
  LNPrimitiveValueType *v0;
  void *v1;

  v0 = -[LNPrimitiveValueType initWithTypeIdentifier:]([LNPrimitiveValueType alloc], "initWithTypeIdentifier:", 9);
  v1 = (void *)dateComponentsValueType_value;
  dateComponentsValueType_value = (uint64_t)v0;

}

void __38__LNPrimitiveValueType_int64ValueType__block_invoke()
{
  LNPrimitiveValueType *v0;
  void *v1;

  v0 = -[LNPrimitiveValueType initWithTypeIdentifier:]([LNPrimitiveValueType alloc], "initWithTypeIdentifier:", 6);
  v1 = (void *)int64ValueType_value;
  int64ValueType_value = (uint64_t)v0;

}

void __38__LNPrimitiveValueType_int32ValueType__block_invoke()
{
  LNPrimitiveValueType *v0;
  void *v1;

  v0 = -[LNPrimitiveValueType initWithTypeIdentifier:]([LNPrimitiveValueType alloc], "initWithTypeIdentifier:", 5);
  v1 = (void *)int32ValueType_value;
  int32ValueType_value = (uint64_t)v0;

}

void __38__LNPrimitiveValueType_int16ValueType__block_invoke()
{
  LNPrimitiveValueType *v0;
  void *v1;

  v0 = -[LNPrimitiveValueType initWithTypeIdentifier:]([LNPrimitiveValueType alloc], "initWithTypeIdentifier:", 4);
  v1 = (void *)int16ValueType_value;
  int16ValueType_value = (uint64_t)v0;

}

void __37__LNPrimitiveValueType_int8ValueType__block_invoke()
{
  LNPrimitiveValueType *v0;
  void *v1;

  v0 = -[LNPrimitiveValueType initWithTypeIdentifier:]([LNPrimitiveValueType alloc], "initWithTypeIdentifier:", 3);
  v1 = (void *)int8ValueType_value;
  int8ValueType_value = (uint64_t)v0;

}

void __49__LNPrimitiveValueType_attributedStringValueType__block_invoke()
{
  LNPrimitiveValueType *v0;
  void *v1;

  v0 = -[LNPrimitiveValueType initWithTypeIdentifier:]([LNPrimitiveValueType alloc], "initWithTypeIdentifier:", 12);
  v1 = (void *)attributedStringValueType_value;
  attributedStringValueType_value = (uint64_t)v0;

}

@end
