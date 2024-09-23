@implementation ECTagValueList

void ___ef_log_ECTagValueList_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "ECTagValueList");
  v1 = (void *)_ef_log_ECTagValueList_log;
  _ef_log_ECTagValueList_log = (uint64_t)v0;

}

- (id)_initWithDictionaryRepresentation:(id)a3
{
  id v4;
  ECTagValueList *v5;
  uint64_t v6;
  NSDictionary *dictionaryRepresentation;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ECTagValueList;
  v5 = -[ECTagValueList init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    dictionaryRepresentation = v5->_dictionaryRepresentation;
    v5->_dictionaryRepresentation = (NSDictionary *)v6;

  }
  return v5;
}

- (id)_initWithDictionaryRepresentation:(id)a3 stringRepresentation:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = -[ECTagValueList _initWithDictionaryRepresentation:](self, "_initWithDictionaryRepresentation:", v6);
  if (v8)
    v9 = (id)EFAtomicObjectSetIfNil();

  return v8;
}

- (void)dealloc
{
  id v3;
  objc_super v4;

  v3 = (id)EFAtomicObjectRelease();
  v4.receiver = self;
  v4.super_class = (Class)ECTagValueList;
  -[ECTagValueList dealloc](&v4, sel_dealloc);
}

+ (id)tagValueListFromString:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v23;
  void *v24;
  id v25;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "ef_stringByTrimmingTrailingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v5;
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(";"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v7 = v23;
  v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (!v8)
  {
    v28 = 1;
    goto LABEL_18;
  }
  v9 = *(_QWORD *)v30;
  v28 = 1;
  while (2)
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v30 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
      if (objc_msgSend(v11, "length"))
      {
        objc_msgSend(v11, "ef_componentsSeparatedByString:maxSeparations:", CFSTR("="), 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "count") == 2)
        {
          objc_msgSend(v12, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "ef_stringByTrimmingWhitespaceAndNewlineCharacters");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "lastObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "ef_stringByTrimmingWhitespaceAndNewlineCharacters");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "objectForKeyedSubscript:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v14);

            continue;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Duplicate '%@' tags in tag value list"), v14);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[ECTagValueList _errorWithCode:failureReason:]((uint64_t)a1, 2, v18);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          +[ECTagValueList _errorWithCode:failureReason:]((uint64_t)a1, 1, 0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_18;
      }
      v28 = 0;
    }
    v8 = (void *)objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v8)
      continue;
    break;
  }
LABEL_18:

  if (!objc_msgSend(v6, "count"))
  {
    +[ECTagValueList _errorWithCode:failureReason:]((uint64_t)a1, 1, 0);
    v19 = objc_claimAutoreleasedReturnValue();

    v6 = 0;
    v8 = (void *)v19;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v8);
  if (v8)
  {
    v20 = 0;
  }
  else
  {
    if ((v28 & 1) != 0)
      v21 = objc_msgSend(objc_alloc((Class)a1), "_initWithDictionaryRepresentation:stringRepresentation:", v6, v25);
    else
      v21 = objc_msgSend(objc_alloc((Class)a1), "_initWithDictionaryRepresentation:", v6);
    v20 = (void *)v21;
  }

  return v20;
}

+ (id)_errorWithCode:(void *)a3 failureReason:
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_self();
  if (v4)
  {
    v8 = *MEMORY[0x1E0CB2D68];
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ECTagValueListErrorDomain"), a2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)tagValueListFromDictionary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithDictionaryRepresentation:", v6);
  }
  else if (a4)
  {
    +[ECTagValueList _errorWithCode:failureReason:]((uint64_t)a1, 1, 0);
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)stringRepresentation
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  EFAtomicObjectLoad();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[ECTagValueList dictionaryRepresentation](self, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __38__ECTagValueList_stringRepresentation__block_invoke;
    v9[3] = &unk_1E7121BE0;
    v6 = v4;
    v10 = v6;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(";"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    EFAtomicObjectSetIfNil();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v3;
}

void __38__ECTagValueList_stringRepresentation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%@"), a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:");

}

- (id)valueForTag:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ECTagValueList dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)objectForKeyedSubscript:(id)a3
{
  -[ECTagValueList valueForTag:](self, "valueForTag:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)dictionaryRepresentation
{
  return self->_dictionaryRepresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionaryRepresentation, 0);
}

@end
