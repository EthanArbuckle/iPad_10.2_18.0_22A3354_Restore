@implementation BMResourceDescriptor

- (NSString)key
{
  return self->_key;
}

- (BMResourceDescriptor)initWithEncodedString:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BMResourceDescriptor *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("="));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count") == 2)
    {
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[BMResourceDescriptor initWithKey:value:error:](self, "initWithKey:value:error:", v8, v9, a4);

      v10 = self;
      goto LABEL_10;
    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Encoded string invalid: %@ (%@)"), v6, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v18;
    v17 = 3;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v12 = (void *)MEMORY[0x1E0CB3940];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("Invalid class for encodedString - expected: %@ received: %@"), v7, objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v11;
    v17 = 1;
  }
  objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("BMResourceDescriptorError"), v17, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (a4 && v19)
    *a4 = objc_retainAutorelease(v19);

  v10 = 0;
LABEL_10:

  return v10;
}

- (BMResourceDescriptor)initWithKey:(id)a3 value:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  BMResourceDescriptor *v11;
  BMResourceDescriptor *v12;
  void *v13;
  NSString *key;
  char v15;
  id v16;
  id v17;
  void *v18;
  NSString *value;
  char v20;
  id v21;
  BMResourceDescriptor *v22;
  id v24;
  id v25;
  objc_super v26;

  v9 = a3;
  v10 = a4;
  v26.receiver = self;
  v26.super_class = (Class)BMResourceDescriptor;
  v11 = -[BMResourceDescriptor init](&v26, sel_init);
  v12 = v11;
  if (!v11)
    goto LABEL_5;
  objc_storeStrong((id *)&v11->_key, a3);
  v13 = (void *)objc_opt_class();
  key = v12->_key;
  v25 = 0;
  v15 = objc_msgSend(v13, "_validateInput:description:error:", key, CFSTR("key"), &v25);
  v16 = v25;
  v17 = v16;
  if ((v15 & 1) == 0)
  {
    if (!a5 || !v16)
      goto LABEL_12;
    goto LABEL_11;
  }
  objc_storeStrong((id *)&v12->_value, a4);
  v18 = (void *)objc_opt_class();
  value = v12->_value;
  v24 = v17;
  v20 = objc_msgSend(v18, "_validateInput:description:error:", value, CFSTR("value"), &v24);
  v21 = v24;

  if ((v20 & 1) == 0)
  {
    if (!a5)
    {
      v17 = v21;
      goto LABEL_12;
    }
    v17 = v21;
    if (!v21)
    {
LABEL_12:

      v22 = 0;
      goto LABEL_13;
    }
LABEL_11:
    v17 = objc_retainAutorelease(v17);
    *a5 = v17;
    goto LABEL_12;
  }

LABEL_5:
  v22 = v12;
LABEL_13:

  return v22;
}

+ (BOOL)_validateInput:(id)a3 description:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  BOOL v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void **v27;
  uint64_t *v28;
  void *v29;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v35 = *MEMORY[0x1E0CB2D50];
    v18 = (void *)MEMORY[0x1E0CB3940];
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("Invalid class for %@ - expected: %@ received: %@"), v9, v20, objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("BMResourceDescriptorError"), 1, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (a5 && v23)
      *a5 = objc_retainAutorelease(v23);

    goto LABEL_17;
  }
  if (!objc_msgSend(v8, "length"))
  {
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v33 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid empty string for %@"), v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v20;
    v26 = (void *)MEMORY[0x1E0C99D80];
    v27 = &v34;
    v28 = &v33;
LABEL_14:
    objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", v27, v28, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("BMResourceDescriptorError"), 3, v21);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v29;
    if (a5 && v29)
    {
      v22 = objc_retainAutorelease(v29);
      *a5 = v22;
    }
LABEL_17:

    v16 = 0;
    goto LABEL_18;
  }
  v10 = objc_msgSend(v8, "length");
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    while (1)
    {
      v13 = objc_msgSend(v8, "characterAtIndex:", v12);
      objc_msgSend(a1, "_illegalCharactersSet");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "characterIsMember:", v13);

      if (v15)
        break;
      if (v11 == ++v12)
        goto LABEL_7;
    }
    v25 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid %@: \"%@\" contains whitespace or separator character: '%c'"), v9, v8, v13, *MEMORY[0x1E0CB2D50]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v20;
    v26 = (void *)MEMORY[0x1E0C99D80];
    v27 = &v32;
    v28 = &v31;
    goto LABEL_14;
  }
LABEL_7:
  v16 = 1;
LABEL_18:

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

+ (id)descriptorsFromEncodedString:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2D50];
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("Invalid class for encodedString - expected: %@ received: %@"), v10, objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("BMResourceDescriptorError"), 1, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (a4 && v13)
      *a4 = objc_retainAutorelease(v13);

LABEL_18:
    v6 = 0;
LABEL_19:

    goto LABEL_20;
  }
  if ((objc_msgSend(v5, "isEqual:", &stru_1E5E40E10) & 1) == 0)
  {
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("&"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v15, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = v15;
    v16 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
      while (2)
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v10);
          v20 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithEncodedString:error:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v19), a4);
          if (!v20)
          {

            goto LABEL_18;
          }
          v21 = (void *)v20;
          objc_msgSend(v11, "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v17)
          continue;
        break;
      }
    }

    v6 = (void *)objc_msgSend(v11, "copy");
    goto LABEL_19;
  }
  v6 = (void *)MEMORY[0x1E0C9AA60];
LABEL_20:

  return v6;
}

- (id)encodedString
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), self->_key, CFSTR("="), self->_value);
}

+ (id)encodedStringFromDescriptors:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!objc_msgSend(v6, "count"))
    {
      v16 = &stru_1E5E40E10;
      goto LABEL_18;
    }
    v28 = 0;
    objc_msgSend(a1, "sortedDescriptorsDetectingDuplicates:error:", v6, &v28);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v28;
    v9 = v8;
    if (!v7 || v8)
    {
      v16 = 0;
      if (a4 && v8)
      {
        v9 = objc_retainAutorelease(v8);
        v16 = 0;
        *a4 = v9;
      }
    }
    else
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v7, "count"));
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v7 = v7;
      v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v25 != v13)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "encodedString");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v15);

          }
          v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v12);
      }

      objc_msgSend(v10, "componentsJoinedByString:", CFSTR("&"));
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2D50];
    v18 = (void *)MEMORY[0x1E0CB3940];
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("Invalid class for descriptors - expected: %@ received: %@"), v9, objc_opt_class());
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v31[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("BMResourceDescriptorError"), 1, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (a4 && v21)
      *a4 = objc_retainAutorelease(v21);

    v16 = 0;
  }

LABEL_18:
  return v16;
}

+ (id)sortedDescriptorsDetectingDuplicates:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __67__BMResourceDescriptor_sortedDescriptorsDetectingDuplicates_error___block_invoke;
  v14[3] = &unk_1E5E3D190;
  v14[4] = &v15;
  objc_msgSend(v5, "sortedArrayUsingComparator:", v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)v16[5], "count"))
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found descriptors with duplicate keys: %@"), v16[5]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("BMResourceDescriptorError"), 2, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a4 && v10)
      *a4 = objc_retainAutorelease(v10);

    v12 = 0;
  }
  else
  {
    v12 = v6;
  }

  _Block_object_dispose(&v15, 8);
  return v12;
}

uint64_t __67__BMResourceDescriptor_sortedDescriptorsDetectingDuplicates_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", v8))
  {
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v9)
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v9, "addObject:", v5);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v6);
  }
  v13 = objc_msgSend(v7, "compare:", v8);

  return v13;
}

+ (id)_illegalCharactersSet
{
  if (_illegalCharactersSet_onceToken != -1)
    dispatch_once(&_illegalCharactersSet_onceToken, &__block_literal_global_11);
  return (id)_illegalCharactersSet_characterSet;
}

void __45__BMResourceDescriptor__illegalCharactersSet__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceAndNewlineCharacterSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCharactersInString:", CFSTR("="));
  objc_msgSend(v2, "addCharactersInString:", CFSTR("&"));
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)_illegalCharactersSet_characterSet;
  _illegalCharactersSet_characterSet = v0;

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[BMResourceDescriptor key](self, "key");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "key");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[BMResourceDescriptor value](self, "value");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[BMResourceDescriptor key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[BMResourceDescriptor value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMResourceDescriptor key](self, "key");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMResourceDescriptor value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ - key: %@ value: %@"), v5, v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BMResourceDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  BMResourceDescriptor *v6;
  id v7;
  BMResourceDescriptor *v8;
  BOOL v9;
  NSObject *v10;
  BMResourceDescriptor *v11;
  objc_class *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("s"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v15 = 0;
    v6 = -[BMResourceDescriptor initWithEncodedString:error:](self, "initWithEncodedString:error:", v5, &v15);
    v7 = v15;
    v8 = v6;
    self = v8;
    if (v8)
      v9 = v7 == 0;
    else
      v9 = 0;
    if (v9)
    {
      v11 = v8;
    }
    else
    {
      __biome_log_for_category(0);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v13 = (objc_class *)objc_opt_class();
        NSStringFromClass(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v17 = v14;
        v18 = 2112;
        v19 = v5;
        v20 = 2112;
        v21 = v7;
        _os_log_error_impl(&dword_1AEB31000, v10, OS_LOG_TYPE_ERROR, "%@ could not unarchive descriptor from encoded string: %@, error: %@", buf, 0x20u);

      }
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BMResourceDescriptor encodedString](self, "encodedString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("s"));

}

- (NSString)value
{
  return self->_value;
}

@end
