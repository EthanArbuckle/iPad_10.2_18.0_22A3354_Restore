@implementation CNPropertyListSerialization

+ (id)dataWithObject:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v7;

  v7 = 0;
  objc_msgSend(a1, "dataWithObject:error:", a3, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  +[CNResult resultWithValue:orError:](CNResult, "resultWithValue:orError:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)dataWithObject:(id)a3 error:(id *)a4
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a3, 200, 0, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)objectWithData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v7;

  v7 = 0;
  objc_msgSend(a1, "objectWithData:error:", a3, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  +[CNResult resultWithValue:orError:](CNResult, "resultWithValue:orError:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)objectWithData:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "objectWithData:options:error:", a3, 0, a4);
}

+ (id)mutableObjectWithData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v7;

  v7 = 0;
  objc_msgSend(a1, "mutableObjectWithData:error:", a3, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  +[CNResult resultWithValue:orError:](CNResult, "resultWithValue:orError:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)mutableObjectWithData:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "objectWithData:options:error:", a3, 1, a4);
}

+ (id)objectWithData:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v13;

  v7 = a3;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "length"))
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v8, a4, 0, &v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v13;
    if (v9)
    {
      v11 = v9;
LABEL_9:

      goto LABEL_10;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      +[CNPropertyListSerialization objectWithData:options:error:].cold.1((uint64_t)v10);
      if (!a5)
        goto LABEL_9;
    }
    else if (!a5)
    {
      goto LABEL_9;
    }
    *a5 = objc_retainAutorelease(v10);
    goto LABEL_9;
  }
  v9 = 0;
LABEL_10:

  return v9;
}

+ (void)objectWithData:(uint64_t)a1 options:error:.cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138543362;
  v2 = a1;
  _os_log_error_impl(&dword_18F80C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Error deserializing object: %{public}@", (uint8_t *)&v1, 0xCu);
}

@end
