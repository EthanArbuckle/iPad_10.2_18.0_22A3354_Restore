@implementation CRKCreateASMClassOperation

- (CRKCreateASMClassOperation)initWithProperties:(id)a3 requirements:(id)a4
{
  id v6;
  id v7;
  CRKCreateASMClassOperation *v8;
  uint64_t v9;
  CRKASMCourseCreateProperties *properties;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKCreateASMClassOperation;
  v8 = -[CRKCreateASMClassOperation init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    properties = v8->_properties;
    v8->_properties = (CRKASMCourseCreateProperties *)v9;

    objc_storeStrong((id *)&v8->_requirements, a4);
  }

  return v8;
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
  block[2] = __34__CRKCreateASMClassOperation_main__block_invoke;
  block[3] = &unk_24D9C7020;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __34__CRKCreateASMClassOperation_main__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "validateParameters");
}

- (void)validateParameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  -[CRKCreateASMClassOperation properties](self, "properties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CRKCreateASMClassOperation properties](self, "properties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[CRKCreateASMClassOperation properties](self, "properties");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateProperties");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[CRKCreateASMClassOperation fetchInstructor](self, "fetchInstructor");
        return;
      }
      v11 = &unk_24DA07DA0;
    }
    else
    {
      v11 = &unk_24DA07D78;
    }
  }
  else
  {
    v11 = &unk_24DA07D50;
  }
  CRKErrorWithCodeAndUserInfo(2, v11);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[CRKCreateASMClassOperation endOperationWithError:](self, "endOperationWithError:", v12);

}

- (void)fetchInstructor
{
  void *v3;
  _QWORD v4[5];

  -[CRKCreateASMClassOperation requirements](self, "requirements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__CRKCreateASMClassOperation_fetchInstructor__block_invoke;
  v4[3] = &unk_24D9C8B18;
  v4[4] = self;
  objc_msgSend(v3, "currentUserWithCompletion:", v4);

}

void __45__CRKCreateASMClassOperation_fetchInstructor__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__CRKCreateASMClassOperation_fetchInstructor__block_invoke_2;
  block[3] = &unk_24D9C84C0;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v13 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __45__CRKCreateASMClassOperation_fetchInstructor__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "endOperationWithError:");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "person");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(a1 + 40);
    v5 = (id)v2;
    if (v2)
    {
      objc_msgSend(v3, "validateDesiredLocationExistsForInstructor:", v2);
    }
    else
    {
      CRKErrorWithCodeAndUserInfo(150, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "endOperationWithError:", v4);

    }
  }
}

- (void)validateDesiredLocationExistsForInstructor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[CRKCreateASMClassOperation requirements](self, "requirements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __73__CRKCreateASMClassOperation_validateDesiredLocationExistsForInstructor___block_invoke;
  v8[3] = &unk_24D9CA758;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "locationsWithManagePermissionsForUserWithObjectID:completion:", v6, v8);

}

void __73__CRKCreateASMClassOperation_validateDesiredLocationExistsForInstructor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __73__CRKCreateASMClassOperation_validateDesiredLocationExistsForInstructor___block_invoke_2;
  v11[3] = &unk_24D9C7280;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v6;
  v13 = v7;
  v14 = v5;
  v15 = v8;
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

void __73__CRKCreateASMClassOperation_validateDesiredLocationExistsForInstructor___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "endOperationWithError:");
  }
  else
  {
    objc_msgSend(v2, "properties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(*(id *)(a1 + 40), "location:hasMatchInLocations:", v8, *(_QWORD *)(a1 + 48));
    v6 = *(void **)(a1 + 40);
    if ((v5 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "constructClassWithInstructor:", *(_QWORD *)(a1 + 56));
    }
    else
    {
      CRKErrorWithCodeAndUserInfo(151, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "endOperationWithError:", v7);

    }
  }
}

- (void)constructClassWithInstructor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;

  v4 = a3;
  -[CRKCreateASMClassOperation properties](self, "properties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKCreateASMClassOperation properties](self, "properties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKCreateASMClassOperation requirements](self, "requirements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "makeClassWithLocationID:name:", v7, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CRKCreateASMClassOperation requirements](self, "requirements");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addPerson:toClass:", v4, v12);

  -[CRKCreateASMClassOperation properties](self, "properties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updateProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v16 = -[CRKCreateASMClassOperation applyProperties:toClass:error:](self, "applyProperties:toClass:error:", v15, v12, &v21);
  v17 = v21;

  if (v16)
  {
    -[CRKCreateASMClassOperation requirements](self, "requirements");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __59__CRKCreateASMClassOperation_constructClassWithInstructor___block_invoke;
    v19[3] = &unk_24D9C8FB8;
    v19[4] = self;
    v20 = v12;
    objc_msgSend(v18, "saveClass:completion:", v20, v19);

  }
  else
  {
    -[CRKCreateASMClassOperation endOperationWithError:](self, "endOperationWithError:", v17);
  }

}

void __59__CRKCreateASMClassOperation_constructClassWithInstructor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CRKCreateASMClassOperation_constructClassWithInstructor___block_invoke_2;
  block[3] = &unk_24D9C84C0;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v6 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __59__CRKCreateASMClassOperation_constructClassWithInstructor___block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 40);
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "endOperationWithError:");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "objectID");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "endOperationWithResultObject:", v2);

  }
}

- (BOOL)location:(id)a3 hasMatchInLocations:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
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
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "objectID", (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqualToString:", v13);

          if ((v14 & 1) != 0)
          {
            LOBYTE(v9) = 1;
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)applyProperties:(id)a3 toClass:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  CRKClassKitClassPropertyApplicator *v10;
  void *v11;
  CRKClassKitClassPropertyApplicator *v12;
  void *v13;

  v8 = a4;
  v9 = a3;
  v10 = [CRKClassKitClassPropertyApplicator alloc];
  -[CRKCreateASMClassOperation requirements](self, "requirements");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CRKClassKitClassPropertyApplicator initWithRequirements:](v10, "initWithRequirements:", v11);

  -[CRKClassKitClassPropertyApplicator applyProperties:toClass:error:](v12, "applyProperties:toClass:error:", v9, v8, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13 != 0;
}

- (CRKASMCourseCreateProperties)properties
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
}

@end
