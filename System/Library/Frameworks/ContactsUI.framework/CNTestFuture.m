@implementation CNTestFuture

- (CNTestFuture)initWithResult:(id)a3
{
  id v5;
  CNTestFuture *v6;
  CNTestFuture *v7;
  CNTestFuture *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNTestFuture;
  v6 = -[CNTestFuture init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_result, a3);
    v8 = v7;
  }

  return v7;
}

- (CNTestFuture)initWithError:(id)a3
{
  id v5;
  CNTestFuture *v6;
  CNTestFuture *v7;
  CNTestFuture *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNTestFuture;
  v6 = -[CNTestFuture init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    v8 = v7;
  }

  return v7;
}

- (CNTestFuture)initWithCoder:(id)a3
{
  id v5;
  CNTestFuture *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CNTestFuture *v17;
  void *v18;
  void *v20;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CNTestFuture;
  v6 = -[CNTestFuture init](&v21, sel_init);
  if (v6)
  {

    if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, 0, CFSTR("CNTestFuture.m"), 56, 0);

    }
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v9, CFSTR("resultClasses"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v10, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_cn_map:", &__block_literal_global_3406);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v14, CFSTR("result"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0D13A68], "futureWithResult:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D13A68], "futureWithError:", v18);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v17 = v16;

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(v5, "allowsKeyedCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNTestFuture.m"), 87, 0);

  }
  -[CNTestFuture result](self, "result");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNTestFuture result](self, "result");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_class();

    v9 = (void *)MEMORY[0x1E0C99E20];
    nameForSanitizedClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setWithObject:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[CNTestFuture result](self, "result");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "conformsToProtocol:", &unk_1EE082DD8);

    if (v13)
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      -[CNTestFuture result](self, "result");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v28;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v28 != v17)
              objc_enumerationMutation(v14);
            if ((objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v18), "conformsToProtocol:", &unk_1EDFB8B20) & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v26 = a2;
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", v26, self, CFSTR("CNTestFuture.m"), 93, 0);

              a2 = v26;
            }
            v19 = (void *)objc_opt_class();
            nameForSanitizedClass(v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v20);

            ++v18;
          }
          while (v16 != v18);
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v16);
      }

    }
    objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("resultClasses"));
    -[CNTestFuture result](self, "result");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:forKey:", v22, CFSTR("result"));

  }
  else
  {
    -[CNTestFuture error](self, "error");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[CNTestFuture error](self, "error");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "encodeObject:forKey:", v24, CFSTR("error"));

    }
  }

}

- (NSObject)result
{
  return self->_result;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_result, 0);
}

Class __30__CNTestFuture_initWithCoder___block_invoke(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

+ (id)futureWithResult:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithResult:", v4);

  return v5;
}

+ (id)futureWithError:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithError:", v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
