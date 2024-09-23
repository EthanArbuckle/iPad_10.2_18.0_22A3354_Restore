@implementation CNHandle

- (CNHandle)initWithStringValue:(id)a3 type:(unint64_t)a4
{
  return -[CNHandle initWithStringValue:customIdentifier:type:](self, "initWithStringValue:customIdentifier:type:", a3, 0, a4);
}

- (CNHandle)initWithStringValue:(id)a3 customIdentifier:(id)a4 type:(unint64_t)a5
{
  id v8;
  id v9;
  CNHandle *v10;
  uint64_t v11;
  NSString *stringValue;
  uint64_t v13;
  NSString *customIdentifier;
  CNHandle *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNHandle;
  v10 = -[CNHandle init](&v17, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    stringValue = v10->_stringValue;
    v10->_stringValue = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    customIdentifier = v10->_customIdentifier;
    v10->_customIdentifier = (NSString *)v13;

    v10->_type = a5;
    v15 = v10;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customIdentifier, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
}

+ (unint64_t)handleTypeForPropertyKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "keyTypeMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "integerValue");
  else
    v7 = 1;

  return v7;
}

+ (id)keyTypeMapping
{
  if (keyTypeMapping_cn_once_token_2 != -1)
    dispatch_once(&keyTypeMapping_cn_once_token_2, &__block_literal_global_73);
  return (id)keyTypeMapping_cn_once_object_2;
}

void __26__CNHandle_keyTypeMapping__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0C966A8];
  v3[0] = *MEMORY[0x1E0C967C0];
  v3[1] = v0;
  v4[0] = &unk_1EA61C430;
  v4[1] = &unk_1EA61C448;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)keyTypeMapping_cn_once_object_2;
  keyTypeMapping_cn_once_object_2 = v1;

}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)customIdentifier
{
  return self->_customIdentifier;
}

+ (id)tuHandleForHandle:(id)a3
{
  id v4;
  uint64_t v5;
  objc_class *TUHandleClass;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  TUHandleClass = getTUHandleClass();
  v7 = TUHandleClass;
  if (v5 == 1)
  {
    objc_msgSend(v4, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[objc_class handleWithDestinationID:](v7, "handleWithDestinationID:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = [TUHandleClass alloc];
    v11 = objc_msgSend(a1, "tuHandleTypeFromType:", objc_msgSend(v4, "type"));
    objc_msgSend(v4, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v10, "initWithType:value:", v11, v8);
  }
  v12 = (void *)v9;

  return v12;
}

+ (int64_t)tuHandleTypeFromType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  objc_msgSend(a1, "tuHandleTypeMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

+ (id)tuHandleTypeMap
{
  if (tuHandleTypeMap_cn_once_token_3 != -1)
    dispatch_once(&tuHandleTypeMap_cn_once_token_3, &__block_literal_global_75);
  return (id)tuHandleTypeMap_cn_once_object_3;
}

void __37__CNHandle_TUHandle__tuHandleTypeMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1EA61C430;
  v2[1] = &unk_1EA61C448;
  v3[0] = &unk_1EA61C460;
  v3[1] = &unk_1EA61C478;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tuHandleTypeMap_cn_once_object_3;
  tuHandleTypeMap_cn_once_object_3 = v0;

}

+ (id)inPersonHandleForHandle:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0CBDA60];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_class();
  v8 = objc_msgSend(v4, "type");

  v9 = (void *)objc_msgSend(v5, "initWithValue:type:", v6, objc_msgSend(v7, "inPersonHandleTypeForType:", v8));
  return v9;
}

+ (int64_t)inPersonHandleTypeForType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  objc_msgSend(a1, "inPersonHandleTypeMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

+ (id)inPersonHandleTypeMap
{
  if (inPersonHandleTypeMap_cn_once_token_4 != -1)
    dispatch_once(&inPersonHandleTypeMap_cn_once_token_4, &__block_literal_global_86_0);
  return (id)inPersonHandleTypeMap_cn_once_object_4;
}

void __49__CNHandle_INPersonHandle__inPersonHandleTypeMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1EA61C490;
  v2[1] = &unk_1EA61C430;
  v3[0] = &unk_1EA61C4A8;
  v3[1] = &unk_1EA61C460;
  v2[2] = &unk_1EA61C448;
  v3[2] = &unk_1EA61C4C0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)inPersonHandleTypeMap_cn_once_object_4;
  inPersonHandleTypeMap_cn_once_object_4 = v0;

}

+ (id)geminiHandleForHandle:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0C97308];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_class();
  v8 = objc_msgSend(v4, "type");

  v9 = (void *)objc_msgSend(v5, "initWithString:type:", v6, objc_msgSend(v7, "geminiHandleTypeForType:", v8));
  return v9;
}

+ (int64_t)geminiHandleTypeForType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  objc_msgSend(a1, "geminiHandleTypeMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

+ (id)geminiHandleTypeMap
{
  if (geminiHandleTypeMap_cn_once_token_5 != -1)
    dispatch_once(&geminiHandleTypeMap_cn_once_token_5, &__block_literal_global_95);
  return (id)geminiHandleTypeMap_cn_once_object_5;
}

void __47__CNHandle_CNGeminiHandle__geminiHandleTypeMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[3];
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1EA61C490;
  v2[1] = &unk_1EA61C430;
  v3[0] = &unk_1EA61C4D8;
  v3[1] = &unk_1EA61C4A8;
  v2[2] = &unk_1EA61C448;
  v3[2] = &unk_1EA61C4C0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)geminiHandleTypeMap_cn_once_object_5;
  geminiHandleTypeMap_cn_once_object_5 = v0;

}

@end
