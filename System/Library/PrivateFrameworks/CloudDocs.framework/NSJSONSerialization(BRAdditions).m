@implementation NSJSONSerialization(BRAdditions)

+ (id)_jsonifyObject:()BRAdditions
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;

  v4 = a3;
  if (_jsonifyObject__onceToken != -1)
    dispatch_once(&_jsonifyObject__onceToken, &__block_literal_global_30);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend((id)_jsonifyObject__dateFormatter, "stringFromDate:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v7 = v5;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = (void *)objc_opt_new();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __51__NSJSONSerialization_BRAdditions___jsonifyObject___block_invoke_2;
    v14[3] = &unk_1E3DA7448;
    v7 = v6;
    v15 = v7;
    v16 = a1;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v14);
    v8 = v15;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = v4;
      goto LABEL_11;
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51__NSJSONSerialization_BRAdditions___jsonifyObject___block_invoke_3;
    v11[3] = &unk_1E3DA7470;
    v7 = v9;
    v12 = v7;
    v13 = a1;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v11);
    v8 = v12;
  }

LABEL_12:
  return v7;
}

+ (id)jsonStringFromDictionary:()BRAdditions options:error:
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v12;

  objc_msgSend(a1, "_jsonifyObject:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v6, 1, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  v9 = v8;
  if (v7)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);
  }
  else
  {
    v10 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v8);
  }

  return v10;
}

@end
