@implementation FIValidation

+ (id)validationWithName:(id)a3 test:(id)a4
{
  NSString *v5;
  id v6;
  FIValidation *v7;
  NSString *name;
  NSString *v9;
  void *v10;
  id test;

  v5 = (NSString *)a3;
  v6 = a4;
  v7 = objc_alloc_init(FIValidation);
  name = v7->_name;
  v7->_name = v5;
  v9 = v5;

  v10 = _Block_copy(v6);
  test = v7->_test;
  v7->_test = v10;

  return v7;
}

- (BOOL)validateObject:(id)a3 withError:(id *)a4
{
  id v6;
  uint64_t (**v7)(_QWORD, _QWORD);
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  -[FIValidation test](self, "test");
  v7 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v8 = ((uint64_t (**)(_QWORD, id))v7)[2](v7, v6);

  if ((v8 & 1) == 0)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    -[FIValidation name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("Failed validation step: %@ for object %@"), v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    FIIntervalErrorWithDescription(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    FISetOutErrorIfNotNull(a4, v12);

  }
  return v8;
}

+ (BOOL)performValidations:(id)a3 withObject:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "validateObject:withError:", v8, a5, (_QWORD)v16))
        {
          v14 = 0;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_11:

  return v14;
}

- (NSString)name
{
  return self->_name;
}

- (id)test
{
  return self->_test;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_test, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
