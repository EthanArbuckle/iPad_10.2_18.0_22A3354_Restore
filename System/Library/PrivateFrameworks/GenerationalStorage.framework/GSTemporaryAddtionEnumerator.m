@implementation GSTemporaryAddtionEnumerator

- (GSTemporaryAddtionEnumerator)initWithStorage:(id)a3 nameSpace:(id)a4 withOptions:(unint64_t)a5 withoutOptions:(unint64_t)a6 ordering:(int)a7
{
  id v13;
  id v14;
  void *v15;
  GSTemporaryAddtionEnumerator *v16;
  GSTemporaryAddtionEnumerator *v17;
  uint64_t v18;
  NSString *nameSpace;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *enumerator;
  uint64_t v26;
  NSArray *array;
  NSDirectoryEnumerator *v28;
  _QWORD v30[4];
  int v31;
  _QWORD v32[4];
  id v33;
  id location;
  id v35;
  objc_super v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36.receiver = self;
  v36.super_class = (Class)GSTemporaryAddtionEnumerator;
  v16 = -[GSTemporaryAddtionEnumerator init](&v36, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_withOptions = a5;
    v16->_withoutOption = a6;
    v18 = objc_msgSend(v14, "copy");
    nameSpace = v17->_nameSpace;
    v17->_nameSpace = (NSString *)v18;

    objc_storeStrong((id *)&v17->_storage, a3);
    v35 = 0;
    objc_msgSend(v13, "_URLForNameSpace:createIfNeeded:allowMissing:error:", v14, 0, 1, &v35);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v35;
    v22 = v35;
    if (v20)
    {
      objc_initWeak(&location, v17);
      v37[0] = *MEMORY[0x1E0C998D8];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __94__GSTemporaryAddtionEnumerator_initWithStorage_nameSpace_withOptions_withoutOptions_ordering___block_invoke;
      v32[3] = &unk_1E9771F60;
      objc_copyWeak(&v33, &location);
      objc_msgSend(v15, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v20, v23, 1, v32);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (a7)
      {
        objc_msgSend(v24, "allObjects");
        enumerator = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __94__GSTemporaryAddtionEnumerator_initWithStorage_nameSpace_withOptions_withoutOptions_ordering___block_invoke_2;
        v30[3] = &__block_descriptor_36_e25_q24__0__NSURL_8__NSURL_16l;
        v31 = a7;
        objc_msgSend(enumerator, "sortedArrayUsingComparator:", v30);
        v26 = objc_claimAutoreleasedReturnValue();
        array = v17->_array;
        v17->_array = (NSArray *)v26;

      }
      else
      {
        v28 = v24;
        enumerator = v17->_enumerator;
        v17->_enumerator = v28;
      }

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);

    }
    else
    {
      objc_storeStrong((id *)&v17->_error, v21);
      v24 = 0;
    }
  }
  else
  {
    v24 = 0;
    v22 = 0;
  }

  return v17;
}

uint64_t __94__GSTemporaryAddtionEnumerator_initWithStorage_nameSpace_withOptions_withoutOptions_ordering___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id *WeakRetained;
  id *v7;

  v5 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
    objc_storeStrong(WeakRetained + 5, a3);

  return 0;
}

uint64_t __94__GSTemporaryAddtionEnumerator_initWithStorage_nameSpace_withOptions_withoutOptions_ordering___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v12;
  id v13;

  v13 = 0;
  v5 = *MEMORY[0x1E0C998D8];
  v6 = a3;
  objc_msgSend(a2, "getResourceValue:forKey:error:", &v13, v5, 0);
  v7 = v13;
  v12 = 0;
  objc_msgSend(v6, "getResourceValue:forKey:error:", &v12, v5, 0);

  v8 = v12;
  if (*(_DWORD *)(a1 + 32) == 1)
  {
    v9 = v7;
  }
  else
  {
    v9 = v12;
    v8 = v7;
  }
  v10 = objc_msgSend(v9, "compare:", v8);

  return v10;
}

- (id)_nextURL
{
  NSDirectoryEnumerator *enumerator;
  void *v4;
  unint64_t pos;
  NSArray *array;

  enumerator = self->_enumerator;
  if (enumerator)
  {
    -[NSDirectoryEnumerator nextObject](enumerator, "nextObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    pos = self->_pos;
    if (pos >= -[NSArray count](self->_array, "count"))
    {
      v4 = 0;
    }
    else
    {
      array = self->_array;
      ++self->_pos;
      -[NSArray objectAtIndex:](array, "objectAtIndex:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v4;
}

- (id)nextObject
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  -[GSTemporaryAddtionEnumerator _nextURL](self, "_nextURL");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      objc_msgSend(v4, "lastPathComponent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "hasPrefix:", CFSTR(".")) & 1) != 0)
      {
        v6 = 0;
      }
      else
      {
        -[GSTemporaryStorage additionWithName:inNameSpace:error:](self->_storage, "additionWithName:inNameSpace:error:", v5, self->_nameSpace, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v7;
        if (v7
          && (!self->_withOptions || (self->_withOptions & ~objc_msgSend(v7, "options")) == 0)
          && (!self->_withoutOption || (self->_withoutOption & objc_msgSend(v6, "options")) == 0))
        {

          return v6;
        }
      }

      -[GSTemporaryAddtionEnumerator _nextURL](self, "_nextURL");
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v8;
    }
    while (v8);
  }
  v6 = 0;
  return v6;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
  objc_storeStrong((id *)&self->_enumerator, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_nameSpace, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
