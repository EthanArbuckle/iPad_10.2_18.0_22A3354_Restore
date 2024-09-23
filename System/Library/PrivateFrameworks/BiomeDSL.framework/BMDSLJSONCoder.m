@implementation BMDSLJSONCoder

- (BMDSLJSONCoder)init
{
  return -[BMDSLJSONCoder initWithOptions:](self, "initWithOptions:", 0);
}

- (BMDSLJSONCoder)initWithOptions:(unint64_t)a3
{
  char v3;
  BMDSLJSONCoder *v4;
  uint64_t v5;
  NSMutableArray *stack;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BMDSLJSONCoder;
  v4 = -[BMDSLJSONCoder init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    stack = v4->_stack;
    v4->_stack = (NSMutableArray *)v5;

    v4->_allowSecureCodingObjects = (v3 & 1) == 0;
    v4->_allowKeyModifications = (v3 & 2) == 0;
    +[BMDSLJSONArchiver registerJSONTransformers](BMDSLJSONArchiver, "registerJSONTransformers");
  }
  return v4;
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (void)push:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *currentDictionary;

  v4 = (NSMutableDictionary *)a3;
  -[NSMutableArray addObject:](self->_stack, "addObject:", v4);
  currentDictionary = self->_currentDictionary;
  self->_currentDictionary = v4;

}

- (id)pop
{
  NSMutableDictionary *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *currentDictionary;

  v3 = self->_currentDictionary;
  -[NSMutableArray removeObjectAtIndex:](self->_stack, "removeObjectAtIndex:", -[NSMutableArray count](self->_stack, "count") - 1);
  -[NSMutableArray lastObject](self->_stack, "lastObject");
  v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  currentDictionary = self->_currentDictionary;
  self->_currentDictionary = v4;

  return v3;
}

- (id)decodeRootObjectFromData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1AF4563F8]();
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v4, 1, &v10);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  v11 = v6;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[BMDSLJSONCoder decodeRootObjectFromData:].cold.2();
  }
  else
  {
    -[BMDSLJSONCoder _jsonDecodeObject:forKey:](self, "_jsonDecodeObject:forKey:", &v11, 0);
    v6 = v11;
  }
  v8 = v6;

  objc_autoreleasePoolPop(v5);
  return v8;
}

- (id)encodingCompatibleObjectFromRootObject:(id)a3
{
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v10;
  id v11;
  __CFString *v12;

  v5 = a3;
  v6 = (void *)MEMORY[0x1AF4563F8]();
  v12 = &stru_1E5E36E08;
  v7 = v5;
  v11 = v7;
  -[BMDSLJSONCoder _jsonEncodeObject:forKey:](self, "_jsonEncodeObject:forKey:", &v11, &v12);
  if (-[__CFString length](v12, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMDSLJSONArchiver.m"), 199, CFSTR("Top-level objects requiring type-encoding are not currently supported."));

  }
  v8 = v11;

  objc_autoreleasePoolPop(v6);
  return v8;
}

- (id)encodeDataFromRootObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1AF4563F8]();
  -[BMDSLJSONCoder encodingCompatibleObjectFromRootObject:](self, "encodingCompatibleObjectFromRootObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v6, 2, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;
  if (v8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    -[BMDSLJSONCoder encodeDataFromRootObject:].cold.1();

  objc_autoreleasePoolPop(v5);
  return v7;
}

- (BOOL)_jsonEncodeDictionary:(id *)a3 forKey:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v23;
  id *v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 0, a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMDSLJSONArchiver.m"), 226, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionaryRef"));

  }
  v6 = *a3;
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  v10 = v9 != 0;
  if (v9)
  {
    v11 = v9;
    v24 = a3;
    v12 = 0;
    v13 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v28 != v13)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v20 = *v24;
          *v24 = 0;

          v10 = 1;
          goto LABEL_18;
        }
        objc_msgSend(v8, "objectForKeyedSubscript:", v15);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        v26 = v16;
        v17 = v15;
        v25 = v17;
        if (-[BMDSLJSONCoder _jsonEncodeObject:forKey:](self, "_jsonEncodeObject:forKey:", &v26, &v25))
        {
          if (v17 != v25)
          {
            objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v17);
            v17 = v25;
          }
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v26, v17);
          v12 = 1;
        }

      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v11)
        continue;
      break;
    }

    if ((v12 & 1) != 0)
    {
      v18 = v7;
      v19 = *v24;
      *v24 = v18;
      v10 = 1;
      goto LABEL_19;
    }
    v10 = 0;
  }
  else
  {
LABEL_18:
    v19 = v8;
LABEL_19:

  }
  return v10;
}

+ (BOOL)hasNativeSupportForClass:(Class)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (BOOL)_jsonEncodeArray:(id *)a3 forKey:(id *)a4
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t i;
  id v15;
  BOOL v16;
  id v17;
  void *v19;
  void *v20;
  id v21;
  id v22;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMDSLJSONArchiver.m"), 265, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("arrayRef"));

    if (a4)
      goto LABEL_3;
LABEL_25:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMDSLJSONArchiver.m"), 266, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyRef"));

    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_25;
LABEL_3:
  v8 = *a4;
  v9 = *a3;
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  v11 = objc_msgSend(v9, "count");
  if (!v11)
  {
LABEL_16:
    v16 = 0;
    goto LABEL_23;
  }
  v12 = v11;
  v13 = 0;
  for (i = 0; i != v12; ++i)
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", i);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v21 = *a4;
    if (!-[BMDSLJSONCoder _jsonEncodeObject:forKey:](self, "_jsonEncodeObject:forKey:", &v22, &v21))
      goto LABEL_12;
    if (v21 != *a4 && (objc_msgSend(v21, "isEqualToString:", v8) & 1) == 0)
    {
      if (v8 != *a4)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[BMDSLJSONCoder _jsonEncodeArray:forKey:].cold.2();
        goto LABEL_21;
      }
      v15 = v21;

      v8 = v15;
    }
    if (!v22)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[BMDSLJSONCoder _jsonEncodeArray:forKey:].cold.1();
LABEL_21:
      v17 = *a3;
      *a3 = 0;

      goto LABEL_22;
    }
    objc_msgSend(v10, "setObject:atIndexedSubscript:", v22, i);
    v13 = 1;
LABEL_12:

  }
  if ((v13 & 1) == 0)
    goto LABEL_16;
  objc_storeStrong(a3, v10);
  if (self->_allowKeyModifications)
    objc_storeStrong(a4, v8);
LABEL_22:
  v16 = 1;
LABEL_23:

  return v16;
}

- (BOOL)_jsonEncodeObject:(id *)a3 forKey:(id *)a4
{
  id v7;
  BOOL v8;
  char v9;
  uint64_t v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v34;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMDSLJSONArchiver.m"), 313, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectRef"));

  }
  v7 = *a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = -[BMDSLJSONCoder _jsonEncodeArray:forKey:](self, "_jsonEncodeArray:forKey:", a3, a4);
      goto LABEL_7;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "bmdsl_replacementObjectForArchivingWithUserInfo:", self->_userInfo);
      v10 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v10;
    }
    v11 = (void *)objc_opt_class();
    v12 = objc_msgSend((id)objc_opt_class(), "hasNativeSupportForClass:", v11);
    if ((v12 & 1) != 0)
    {
LABEL_32:
      v9 = v12 ^ 1;
      goto LABEL_33;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v11, "bmdsl_jsonEncodingDescriptor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend((id)JSONTransformerNamesByEncodingDescriptor, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "transformedValue:", v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *a3;
        *a3 = v16;

        if (a4 && self->_allowKeyModifications)
        {
          -[BMDSLJSONCoder buildKeyFromEncodingDescriptor:originalKey:](self, "buildKeyFromEncodingDescriptor:originalKey:", v13, *a4);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = *a4;
          *a4 = v18;

        }
        -[BMDSLJSONCoder _jsonEncodeObject:forKey:](self, "_jsonEncodeObject:forKey:", a3, 0);

        goto LABEL_31;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[BMDSLJSONCoder _jsonEncodeObject:forKey:].cold.1();
    }
    else
    {
      if (!self->_allowSecureCodingObjects
        || (objc_opt_respondsToSelector() & 1) == 0
        || !objc_msgSend(v11, "supportsSecureCoding"))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[BMDSLJSONCoder _jsonEncodeObject:forKey:].cold.2((uint64_t)a4, (uint64_t)v7, v25, v26, v27, v28, v29, v30);
        v13 = *a3;
        *a3 = 0;
        goto LABEL_31;
      }
      NSStringFromClass((Class)v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (+[BMDSLJSONAllowedClasses classFromString:](BMDSLJSONAllowedClasses, "classFromString:", v13))
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[BMDSLJSONCoder push:](self, "push:", v20);

        objc_msgSend(v7, "encodeWithCoder:", self);
        -[BMDSLJSONCoder pop](self, "pop");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *a3;
        *a3 = v21;

        if (a4 && self->_allowKeyModifications)
        {
          -[BMDSLJSONCoder buildKeyFromClass:originalKey:](self, "buildKeyFromClass:originalKey:", objc_msgSend(v7, "classForCoder"), *a4);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = *a4;
          *a4 = v23;

        }
        -[BMDSLJSONCoder _jsonEncodeDictionary:forKey:](self, "_jsonEncodeDictionary:forKey:", a3, 0);
        goto LABEL_31;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[BMDSLJSONCoder _jsonEncodeObject:forKey:].cold.3();
    }
    v31 = *a3;
    *a3 = 0;

LABEL_31:
    goto LABEL_32;
  }
  v8 = -[BMDSLJSONCoder _jsonEncodeDictionary:forKey:](self, "_jsonEncodeDictionary:forKey:", a3, a4);
LABEL_7:
  v9 = v8;
LABEL_33:

  return v9;
}

- (id)buildKeyFromEncodingDescriptor:(id)a3 originalKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@"), a4, CFSTR("<"), a3, CFSTR(">"));
}

- (id)buildKeyFromClass:(Class)a3 originalKey:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@%@"), a4, CFSTR("<"), CFSTR("@"), a3, CFSTR(">"));
}

- (_NSRange)encodingDescriptorRangeInKey:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  v3 = a3;
  if (!objc_msgSend(v3, "hasSuffix:", CFSTR(">"))
    || (v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("<")), v4 == 0x7FFFFFFFFFFFFFFFLL)
    || (v5 = v4, v6 = objc_msgSend(v3, "length"), v7 = v6 + ~v5 - objc_msgSend(CFSTR(">"), "length"), v7 <= 0))
  {
    v7 = 0;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v8 = v5 + 1;
  }

  v9 = v8;
  v10 = v7;
  result.length = v10;
  result.location = v9;
  return result;
}

- (id)encodingDescriptorFromKey:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "hasSuffix:", CFSTR(">"))
    && (v5 = -[BMDSLJSONCoder encodingDescriptorRangeInKey:](self, "encodingDescriptorRangeInKey:", v4),
        v5 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(v4, "substringWithRange:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)keyWithoutEncodingDescriptor:(id)a3
{
  id v4;
  uint64_t v5;
  __CFString *v6;
  __CFString *v7;

  v4 = a3;
  if ((objc_msgSend(v4, "hasSuffix:", CFSTR(">")) & 1) == 0)
    goto LABEL_4;
  v5 = -[BMDSLJSONCoder encodingDescriptorRangeInKey:](self, "encodingDescriptorRangeInKey:", v4);
  if (v5)
  {
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v4, "substringToIndex:", v5 - 1);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_4:
    v6 = (__CFString *)v4;
LABEL_7:
    v7 = v6;
    goto LABEL_8;
  }
  v7 = &stru_1E5E36E08;
LABEL_8:

  return v7;
}

- (Class)classFromEncodingDescriptor:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("@")))
  {
    objc_msgSend(v3, "substringFromIndex:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[BMDSLJSONAllowedClasses classFromString:](BMDSLJSONAllowedClasses, "classFromString:", v4);
    if (v5)
    {
      v6 = v5;
      if ((objc_opt_respondsToSelector() & 1) != 0
        && -[objc_class supportsSecureCoding](v6, "supportsSecureCoding"))
      {
        v7 = v6;
LABEL_10:

        goto LABEL_11;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[BMDSLJSONCoder classFromEncodingDescriptor:].cold.1();
    }
    v7 = 0;
    goto LABEL_10;
  }
  v7 = 0;
LABEL_11:

  return v7;
}

- (BOOL)_jsonDecodeDictionary:(id *)a3 asClass:(Class)a4
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v13;
  void *v14;
  void *v15;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMDSLJSONArchiver.m"), 464, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionaryRef"));

  }
  v8 = *a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMDSLJSONArchiver.m"), 466, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[dictionary isKindOfClass:NSMutableDictionary.class]"));

    if (a4)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMDSLJSONArchiver.m"), 467, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("class"));

    goto LABEL_5;
  }
  if (!a4)
    goto LABEL_7;
LABEL_5:
  -[BMDSLJSONCoder push:](self, "push:", v8);
  v9 = (void *)objc_msgSend([a4 alloc], "initWithCoder:", self);
  v10 = *a3;
  *a3 = v9;

  v11 = -[BMDSLJSONCoder pop](self, "pop");
  return 1;
}

- (BOOL)_jsonDecodeObject:(id *)a3 encodingDescriptor:(id)a4
{
  id v6;
  objc_class *v7;
  objc_class *v8;
  id v9;
  BOOL v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v6 = a4;
  v7 = -[BMDSLJSONCoder classFromEncodingDescriptor:](self, "classFromEncodingDescriptor:", v6);
  if (!v7)
  {
    objc_msgSend((id)JSONTransformerNamesByEncodingDescriptor, "objectForKeyedSubscript:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3B20], "valueTransformerForName:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = *a3;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[BMDSLJSONCoder _jsonDecodeDictionary:forKey:](self, "_jsonDecodeDictionary:forKey:", a3, 0);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          -[BMDSLJSONCoder _jsonDecodeArray:forKey:](self, "_jsonDecodeArray:forKey:", a3, 0);
      }
      objc_msgSend(v11, "reverseTransformedValue:", *a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *a3;
      *a3 = v15;

    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[BMDSLJSONCoder _jsonDecodeObject:encodingDescriptor:].cold.1();
      v14 = *a3;
      *a3 = 0;

    }
    goto LABEL_21;
  }
  if (!self->_allowSecureCodingObjects)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[BMDSLJSONCoder _jsonDecodeObject:encodingDescriptor:].cold.2();
    v9 = *a3;
    *a3 = 0;
    goto LABEL_21;
  }
  v8 = v7;
  v9 = *a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[BMDSLJSONCoder _jsonDecodeObject:encodingDescriptor:].cold.3();
    v13 = *a3;
    *a3 = 0;

LABEL_21:
    v10 = 1;
    goto LABEL_22;
  }
  -[BMDSLJSONCoder _jsonDecodeDictionary:forKey:](self, "_jsonDecodeDictionary:forKey:", a3, 0);
  v10 = -[BMDSLJSONCoder _jsonDecodeDictionary:asClass:](self, "_jsonDecodeDictionary:asClass:", a3, v8);
LABEL_22:

  return v10;
}

- (BOOL)_jsonDecodeObject:(id *)a3 forKey:(id *)a4
{
  id v7;
  BOOL v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v19;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMDSLJSONArchiver.m"), 529, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectRef"));

  }
  v7 = *a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
      v9 = *a4;
    else
      v9 = 0;
    v10 = v9;
    -[BMDSLJSONCoder encodingDescriptorFromKey:](self, "encodingDescriptorFromKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (a4 && self->_allowKeyModifications)
      {
        -[BMDSLJSONCoder keyWithoutEncodingDescriptor:](self, "keyWithoutEncodingDescriptor:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *a4;
        *a4 = v12;

      }
      v14 = -[BMDSLJSONCoder _jsonDecodeObject:encodingDescriptor:](self, "_jsonDecodeObject:encodingDescriptor:", a3, v11);
    }
    else
    {
      v15 = (void *)objc_opt_class();
      if ((objc_msgSend(v15, "hasNativeSupportForClass:", objc_opt_class()) & 1) != 0)
      {
        v8 = 0;
        goto LABEL_21;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[BMDSLJSONCoder _jsonDecodeObject:forKey:].cold.1();
        v16 = *a3;
        *a3 = 0;

        v8 = 1;
        goto LABEL_21;
      }
      v14 = -[BMDSLJSONCoder _jsonDecodeDictionary:forKey:](self, "_jsonDecodeDictionary:forKey:", a3, a4);
    }
    v8 = v14;
LABEL_21:

    goto LABEL_22;
  }
  v8 = -[BMDSLJSONCoder _jsonDecodeArray:forKey:](self, "_jsonDecodeArray:forKey:", a3, a4);
LABEL_22:

  return v8;
}

- (BOOL)_jsonDecodeDictionary:(id *)a3 forKey:(id *)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 0, a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMDSLJSONArchiver.m"), 564, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dictionaryRef"));

  }
  v7 = *a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMDSLJSONArchiver.m"), 566, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[dictionary isKindOfClass:NSMutableDictionary.class]"));

  }
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = v9;
  if (v9)
  {
    v25 = v9;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v16;
          v27 = v18;
          v19 = v17;
          v26 = v19;
          if (-[BMDSLJSONCoder _jsonDecodeObject:forKey:](self, "_jsonDecodeObject:forKey:", &v26, &v27))
          {
            if (v27 != v18)
            {
              objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v18);
              v18 = v27;
            }
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v26, v18);
          }

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v13);
    }

    v10 = v25;
  }
  else
  {
    v20 = (void *)objc_opt_new();
    v21 = *a3;
    *a3 = v20;

  }
  return v10 == 0;
}

- (BOOL)_jsonDecodeArray:(id *)a3 forKey:(id *)a4
{
  id v8;
  id v9;
  void *v10;
  id v11;
  BOOL v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  id v18;
  id v19;
  void *v21;
  void *v22;
  id v23;
  id v24;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMDSLJSONArchiver.m"), 593, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("arrayRef"));

  }
  v8 = *a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BMDSLJSONArchiver.m"), 595, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[array isKindOfClass:NSMutableArray.class]"));

  }
  if (objc_msgSend(v8, "count"))
  {
    if (a4)
      v9 = *a4;
    else
      v9 = 0;
    v13 = v9;
    v14 = objc_msgSend(v8, "count");
    if (v14)
    {
      v15 = v14;
      for (i = 0; v15 != i; ++i)
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", i);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v23 = v13;
        if (-[BMDSLJSONCoder _jsonDecodeObject:forKey:](self, "_jsonDecodeObject:forKey:", &v24, &v23))
        {
          if (!v24)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              -[BMDSLJSONCoder _jsonDecodeArray:forKey:].cold.1();
            v19 = *a3;
            *a3 = 0;

            v18 = v24;
LABEL_25:

            v12 = 1;
            goto LABEL_26;
          }
          objc_msgSend(v8, "setObject:atIndexedSubscript:", v24, i);
        }

      }
    }
    if (v13)
    {
      -[BMDSLJSONCoder keyWithoutEncodingDescriptor:](self, "keyWithoutEncodingDescriptor:", v13);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (v17 != v13 && self->_allowKeyModifications)
      {
        v18 = *a4;
        *a4 = v17;
        goto LABEL_25;
      }

    }
    v12 = 0;
LABEL_26:

  }
  else
  {
    v10 = (void *)objc_opt_new();
    v11 = *a3;
    *a3 = v10;

    v12 = 1;
  }

  return v12;
}

- (BOOL)decodeBoolForKey:(id)a3
{
  void *v3;
  char v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentDictionary, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (int)decodeIntForKey:(id)a3
{
  void *v3;
  int v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentDictionary, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  return v4;
}

- (int)decodeInt32ForKey:(id)a3
{
  const __CFNumber *v3;
  int valuePtr;

  valuePtr = 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentDictionary, "objectForKeyedSubscript:", a3);
  v3 = (const __CFNumber *)objc_claimAutoreleasedReturnValue();
  CFNumberGetValue(v3, kCFNumberSInt32Type, &valuePtr);

  return valuePtr;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  const __CFNumber *v3;
  int64_t valuePtr;

  valuePtr = 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentDictionary, "objectForKeyedSubscript:", a3);
  v3 = (const __CFNumber *)objc_claimAutoreleasedReturnValue();
  CFNumberGetValue(v3, kCFNumberSInt64Type, &valuePtr);

  return valuePtr;
}

- (float)decodeFloatForKey:(id)a3
{
  void *v3;
  float v4;
  float v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentDictionary, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (double)decodeDoubleForKey:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentDictionary, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;

  return v5;
}

- (int64_t)decodeIntegerForKey:(id)a3
{
  void *v3;
  int64_t v4;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentDictionary, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)decodeObjectForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_currentDictionary, "objectForKeyedSubscript:", a3);
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentDictionary, "setObject:forKeyedSubscript:", v8, v7);

}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInt:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentDictionary, "setObject:forKeyedSubscript:", v8, v7);

}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  id v5;
  CFNumberRef v6;
  int valuePtr;

  valuePtr = a3;
  v5 = a4;
  v6 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentDictionary, "setObject:forKeyedSubscript:", v6, v5);

}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  id v5;
  CFNumberRef v6;
  int64_t valuePtr;

  valuePtr = a3;
  v5 = a4;
  v6 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentDictionary, "setObject:forKeyedSubscript:", v6, v5);

}

- (void)encodeInteger:(int64_t)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentDictionary, "setObject:forKeyedSubscript:", v8, v7);

}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  double v8;
  id v9;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  *(float *)&v8 = a3;
  objc_msgSend(v6, "numberWithFloat:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentDictionary, "setObject:forKeyedSubscript:", v9, v7);

}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithDouble:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentDictionary, "setObject:forKeyedSubscript:", v8, v7);

}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentDictionary, "setObject:forKeyedSubscript:", a3, a4);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_currentDictionary, 0);
  objc_storeStrong((id *)&self->_stack, 0);
}

- (void)decodeRootObjectFromData:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_begin_catch(a1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    OUTLINED_FUNCTION_0_5(&dword_1AEB18000, MEMORY[0x1E0C81028], v1, "Failed to decode json from data, %@, exception, %@", v2, v3, v4, v5, 2u);
  objc_end_catch();
  OUTLINED_FUNCTION_7();
}

- (void)decodeRootObjectFromData:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_5(&dword_1AEB18000, MEMORY[0x1E0C81028], v0, "Failed to decode json from data, %@, error, %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)encodeDataFromRootObject:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_1AEB18000, MEMORY[0x1E0C81028], v0, "Failed to json encode object, %@, intermediate, %@, error, %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_7();
}

- (void)_jsonEncodeArray:forKey:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1AEB18000, MEMORY[0x1E0C81028], v0, "Failed to encode array, %@, reason, one or more elements were encoded as nil", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)_jsonEncodeArray:forKey:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1AEB18000, MEMORY[0x1E0C81028], v0, "Failed to encode array, %@, reason, contained multiple non-json-native types", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)_jsonEncodeObject:forKey:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1AEB18000, MEMORY[0x1E0C81028], v0, "Class %@ conforming to BMDSLCustomJSONArchiving must have a non-nil json encoding descriptor.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)_jsonEncodeObject:(uint64_t)a3 forKey:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1AEB18000, MEMORY[0x1E0C81028], a3, "Key object pair didn't match known encoding strategy, key, %@, object, %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_jsonEncodeObject:forKey:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1AEB18000, MEMORY[0x1E0C81028], v0, "Encoding non-BiomeDSL class (%@) is not allowed.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)classFromEncodingDescriptor:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1AEB18000, MEMORY[0x1E0C81028], v0, "Decoding non-BiomeDSL class (%@) is not allowed.", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)_jsonDecodeObject:encodingDescriptor:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6(&dword_1AEB18000, MEMORY[0x1E0C81028], v0, "Failed to find transformer for encoding descriptor, %@, object, %@, transformer name, %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_7();
}

- (void)_jsonDecodeObject:encodingDescriptor:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_5(&dword_1AEB18000, MEMORY[0x1E0C81028], v0, "Secure coding is disabled. Unable to decode encoding descriptor, %@, object, %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)_jsonDecodeObject:encodingDescriptor:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_5(&dword_1AEB18000, MEMORY[0x1E0C81028], v0, "Encoundered incorrect type when expecting mutable dictionary, encoding descriptor, %@, object, %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)_jsonDecodeObject:forKey:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_5(&dword_1AEB18000, MEMORY[0x1E0C81028], v0, "Key object pair didn't match known decoding strategy, key, %@, object, %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)_jsonDecodeArray:forKey:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1AEB18000, MEMORY[0x1E0C81028], v0, "Failed to decode array, %@, reason, one or more elements were decoded as nil", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

@end
