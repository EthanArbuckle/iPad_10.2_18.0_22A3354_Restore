@implementation CRKUpdateASMClassOperation

- (CRKUpdateASMClassOperation)initWithObjectID:(id)a3 properties:(id)a4 requirements:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRKUpdateASMClassOperation *v11;
  uint64_t v12;
  NSString *objectID;
  uint64_t v14;
  CRKASMCourseUpdateProperties *properties;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CRKUpdateASMClassOperation;
  v11 = -[CRKUpdateASMClassOperation init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    objectID = v11->_objectID;
    v11->_objectID = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    properties = v11->_properties;
    v11->_properties = (CRKASMCourseUpdateProperties *)v14;

    objc_storeStrong((id *)&v11->_requirements, a5);
  }

  return v11;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__CRKUpdateASMClassOperation_main__block_invoke;
  block[3] = &unk_24D9C7020;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __34__CRKUpdateASMClassOperation_main__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fetchClasses");
}

- (void)fetchClasses
{
  void *v3;
  _QWORD v4[5];

  -[CRKUpdateASMClassOperation requirements](self, "requirements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__CRKUpdateASMClassOperation_fetchClasses__block_invoke;
  v4[3] = &unk_24D9C84E8;
  v4[4] = self;
  objc_msgSend(v3, "classesWithCompletion:", v4);

}

void __42__CRKUpdateASMClassOperation_fetchClasses__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__CRKUpdateASMClassOperation_fetchClasses__block_invoke_2;
  block[3] = &unk_24D9C84C0;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __42__CRKUpdateASMClassOperation_fetchClasses__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didFetchClasses:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)didFetchClasses:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (a4)
  {
    -[CRKUpdateASMClassOperation endOperationWithError:](self, "endOperationWithError:", a4);
  }
  else
  {
    -[CRKUpdateASMClassOperation objectID](self, "objectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRKUpdateASMClassOperation classWithObjectID:inClasses:](self, "classWithObjectID:inClasses:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[CRKUpdateASMClassOperation applyPropertiesToClass:](self, "applyPropertiesToClass:", v8);
    }
    else
    {
      v14 = CFSTR("kCRKItemNameErrorKey");
      -[CRKUpdateASMClassOperation objectID](self, "objectID");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = CFSTR("self.objectID");
      if (v9)
        v11 = (const __CFString *)v9;
      v15[0] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CRKErrorWithCodeAndUserInfo(12, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRKUpdateASMClassOperation endOperationWithError:](self, "endOperationWithError:", v13);

    }
  }

}

- (void)applyPropertiesToClass:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  -[CRKUpdateASMClassOperation makePropertyApplicator](self, "makePropertyApplicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRKUpdateASMClassOperation properties](self, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v5, "applyProperties:toClass:error:", v6, v4, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;

  if (v7)
  {
    if ((objc_msgSend(v7, "classWasModified") & 1) != 0)
      -[CRKUpdateASMClassOperation saveClass:](self, "saveClass:", v4);
    else
      -[CRKUpdateASMClassOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
  }
  else
  {
    -[CRKUpdateASMClassOperation endOperationWithError:](self, "endOperationWithError:", v8);
  }

}

- (void)saveClass:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[CRKUpdateASMClassOperation requirements](self, "requirements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__CRKUpdateASMClassOperation_saveClass___block_invoke;
  v6[3] = &unk_24D9C6E18;
  v6[4] = self;
  objc_msgSend(v5, "saveClass:completion:", v4, v6);

}

void __40__CRKUpdateASMClassOperation_saveClass___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__CRKUpdateASMClassOperation_saveClass___block_invoke_2;
  v6[3] = &unk_24D9C72D0;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __40__CRKUpdateASMClassOperation_saveClass___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2)
    return objc_msgSend(v1, "endOperationWithError:");
  else
    return objc_msgSend(v1, "endOperationWithResultObject:");
}

- (id)makePropertyApplicator
{
  CRKClassKitClassPropertyApplicator *v3;
  void *v4;
  CRKClassKitClassPropertyApplicator *v5;

  v3 = [CRKClassKitClassPropertyApplicator alloc];
  -[CRKUpdateASMClassOperation requirements](self, "requirements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CRKClassKitClassPropertyApplicator initWithRequirements:](v3, "initWithRequirements:", v4);

  return v5;
}

- (id)classWithObjectID:(id)a3 inClasses:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v6;
    v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v12, "objectID", (_QWORD)v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v5, "isEqualToString:", v13);

          if ((v14 & 1) != 0)
          {
            v9 = v12;
            goto LABEL_12;
          }
        }
        v9 = (id)objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)objectID
{
  return self->_objectID;
}

- (CRKASMCourseUpdateProperties)properties
{
  return self->_properties;
}

- (CRKClassKitRosterRequirements)requirements
{
  return self->_requirements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requirements, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

@end
