@implementation HFItemBuilder

+ (Class)homeKitRepresentationClass
{
  return (Class)objc_opt_class();
}

- (id)commitItem
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemBuilder.m"), 29, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HFItemBuilder commitItem]", objc_opt_class());

  return 0;
}

- (void)setHomeKitRepresentation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id homeKitRepresentation;
  id v11;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(), "homeKitRepresentationClass");
  v11 = v4;
  if (!v11)
    goto LABEL_7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v11;
  else
    v6 = 0;
  v7 = v11;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v5, objc_opt_class());

LABEL_7:
    v7 = 0;
  }

  homeKitRepresentation = self->_homeKitRepresentation;
  self->_homeKitRepresentation = v7;

}

- (HFItemBuilder)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithHome_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemBuilder.m"), 40, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFItemBuilder init]",
    v5);

  return 0;
}

- (HFItemBuilder)initWithHome:(id)a3
{
  return -[HFItemBuilder initWithExistingObject:inHome:](self, "initWithExistingObject:inHome:", 0, a3);
}

- (HFItemBuilder)initWithExistingObject:(id)a3 inHome:(id)a4
{
  id v6;
  id v7;
  HFItemBuilder *v8;
  HFItemBuilder *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id homeKitRepresentation;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HFItemBuilder;
  v8 = -[HFItemBuilder init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_home, a4);
    v10 = objc_msgSend((id)objc_opt_class(), "homeKitRepresentationClass");
    v11 = v6;
    if (v11)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v12 = v11;
      else
        v12 = 0;
      v13 = v11;
      if (v12)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, CFSTR("NSObject+NAAdditions.h"), 54, CFSTR("Expected class of %@ but was %@"), v10, objc_opt_class());

    }
    v13 = 0;
LABEL_9:

    homeKitRepresentation = v9->_homeKitRepresentation;
    v9->_homeKitRepresentation = v13;

  }
  return v9;
}

- (void)setHome:(id)a3
{
  HMHome *v5;
  HMHome **p_home;
  HMHome *home;
  HMHome *v8;

  v5 = (HMHome *)a3;
  home = self->_home;
  p_home = &self->_home;
  if (home != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_home, a3);
    v5 = v8;
  }

}

- (id)commitSetDiff:(id)a3 addBlock:(id)a4 updateBlock:(id)a5 deleteBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HFMutableSetDiff *v16;
  void *v17;
  HFMutableSetDiff *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  HFMutableSetDiff *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  HFMutableSetDiff *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[4];
  HFMutableSetDiff *v41;
  _QWORD v42[4];
  id v43;
  HFMutableSetDiff *v44;
  id v45;
  id v46;
  _QWORD v47[5];

  v47[3] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (!v12 || !v13 || !v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemBuilder.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("addBlock && updateBlock && deleteBlock"));

  }
  v16 = [HFMutableSetDiff alloc];
  objc_msgSend(v11, "fromSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HFMutableSetDiff initWithFromSet:](v16, "initWithFromSet:", v17);

  objc_msgSend(v11, "deletions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemBuilder _commitSetDiff:withBlock:](self, "_commitSetDiff:withBlock:", v19, v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "additions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemBuilder _commitSetDiff:withBlock:](self, "_commitSetDiff:withBlock:", v21, v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "updates");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemBuilder _commitSetDiff:withBlock:](self, "_commitSetDiff:withBlock:", v23, v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)MEMORY[0x1E0D519C0];
  v47[0] = v20;
  v47[1] = v22;
  v47[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "chainFutures:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v13;
  v28 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __64__HFItemBuilder_commitSetDiff_addBlock_updateBlock_deleteBlock___block_invoke;
  v42[3] = &unk_1EA72A028;
  v43 = v20;
  v38 = v12;
  v29 = v18;
  v44 = v29;
  v45 = v22;
  v46 = v24;
  v30 = v24;
  v31 = v22;
  v32 = v20;
  v33 = (id)objc_msgSend(v27, "addCompletionBlock:", v42);
  v40[0] = v28;
  v40[1] = 3221225472;
  v40[2] = __64__HFItemBuilder_commitSetDiff_addBlock_updateBlock_deleteBlock___block_invoke_5;
  v40[3] = &unk_1EA72A050;
  v41 = v29;
  v34 = v29;
  objc_msgSend(v27, "recover:", v40);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

void __64__HFItemBuilder_commitSetDiff_addBlock_updateBlock_deleteBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v2 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__HFItemBuilder_commitSetDiff_addBlock_updateBlock_deleteBlock___block_invoke_2;
  v13[3] = &unk_1EA72A000;
  v3 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v4 = (id)objc_msgSend(v3, "addCompletionBlock:", v13);
  v11[0] = v2;
  v11[1] = 3221225472;
  v11[2] = __64__HFItemBuilder_commitSetDiff_addBlock_updateBlock_deleteBlock___block_invoke_3;
  v11[3] = &unk_1EA72A000;
  v5 = *(void **)(a1 + 48);
  v12 = *(id *)(a1 + 40);
  v6 = (id)objc_msgSend(v5, "addCompletionBlock:", v11);
  v7 = *(void **)(a1 + 56);
  v9[0] = v2;
  v9[1] = 3221225472;
  v9[2] = __64__HFItemBuilder_commitSetDiff_addBlock_updateBlock_deleteBlock___block_invoke_4;
  v9[3] = &unk_1EA72A000;
  v10 = *(id *)(a1 + 40);
  v8 = (id)objc_msgSend(v7, "addCompletionBlock:", v9);

}

uint64_t __64__HFItemBuilder_commitSetDiff_addBlock_updateBlock_deleteBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteObjects:", a2);
}

uint64_t __64__HFItemBuilder_commitSetDiff_addBlock_updateBlock_deleteBlock___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObjects:", a2);
}

uint64_t __64__HFItemBuilder_commitSetDiff_addBlock_updateBlock_deleteBlock___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateObjects:", a2);
}

id __64__HFItemBuilder_commitSetDiff_addBlock_updateBlock_deleteBlock___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D519C0];
  v3 = *(_QWORD *)(a1 + 32);
  v10 = CFSTR("HFItemBuilderErrorUserInfoSuccessfulChangesKey");
  v11[0] = v3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a2;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_errorWithAddedUserInfo:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "futureWithError:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_commitSetDiff:(id)a3 withBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0D519C0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __42__HFItemBuilder__commitSetDiff_withBlock___block_invoke;
  v16[3] = &unk_1EA72A0F0;
  v18 = v7;
  v19 = v6;
  v17 = v5;
  v9 = (void *)MEMORY[0x1E0D519E8];
  v10 = v7;
  v11 = v6;
  v12 = v5;
  objc_msgSend(v9, "mainThreadScheduler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lazyFutureWithBlock:scheduler:", v16, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __42__HFItemBuilder__commitSetDiff_withBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v3 = a2;
  v4 = MEMORY[0x1E0C809B0];
  v5 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __42__HFItemBuilder__commitSetDiff_withBlock___block_invoke_2;
  v15[3] = &unk_1EA72A0A0;
  v17 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 40);
  objc_msgSend(v5, "na_map:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(v6, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "chainFutures:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __42__HFItemBuilder__commitSetDiff_withBlock___block_invoke_4;
  v12[3] = &unk_1EA72A0C8;
  v13 = v3;
  v14 = *(id *)(a1 + 40);
  v10 = v3;
  v11 = (id)objc_msgSend(v9, "addCompletionBlock:", v12);

}

id __42__HFItemBuilder__commitSetDiff_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__HFItemBuilder__commitSetDiff_withBlock___block_invoke_3;
  v8[3] = &unk_1EA72A078;
  v9 = *(id *)(a1 + 32);
  v10 = v3;
  v5 = v3;
  objc_msgSend(v4, "addSuccessBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __42__HFItemBuilder__commitSetDiff_withBlock___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __42__HFItemBuilder__commitSetDiff_withBlock___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", *(_QWORD *)(a1 + 40), a3);
}

- (id)commitItemBuilderSetDiff:(id)a3 addBlock:(id)a4 deleteBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v16;
  _QWORD v17[4];
  id v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (!v10 || !v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemBuilder.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("addBlock && deleteBlock"));

  }
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __63__HFItemBuilder_commitItemBuilderSetDiff_addBlock_deleteBlock___block_invoke;
  v17[3] = &unk_1EA72A140;
  v18 = v10;
  v13 = v10;
  -[HFItemBuilder commitSetDiff:addBlock:updateBlock:deleteBlock:](self, "commitSetDiff:addBlock:updateBlock:deleteBlock:", v9, v17, &__block_literal_global_29, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __63__HFItemBuilder_commitItemBuilderSetDiff_addBlock_deleteBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "commitItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__HFItemBuilder_commitItemBuilderSetDiff_addBlock_deleteBlock___block_invoke_2;
  v9[3] = &unk_1EA72A118;
  v5 = *(id *)(a1 + 32);
  v10 = v3;
  v11 = v5;
  v6 = v3;
  objc_msgSend(v4, "flatMap:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __63__HFItemBuilder_commitItemBuilderSetDiff_addBlock_deleteBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __63__HFItemBuilder_commitItemBuilderSetDiff_addBlock_deleteBlock___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "commitItem");
}

- (id)verifyPropertyIsSet:(id)a3
{
  return -[HFItemBuilder verifyProperty:matchesCondition:description:](self, "verifyProperty:matchesCondition:description:", a3, &__block_literal_global_33, CFSTR("Property is required but not set"));
}

BOOL __37__HFItemBuilder_verifyPropertyIsSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

- (id)verifyPropertiesAreSet:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        -[HFItemBuilder verifyPropertyIsSet:](self, "verifyPropertyIsSet:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8), (_QWORD)v12);
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)verifyNameIsNotEmpty:(id)a3
{
  if (objc_msgSend(a3, "length"))
    return 0;
  objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)verifyProperty:(id)a3 matchesCondition:(id)a4 description:(id)a5
{
  id v9;
  uint64_t (**v10)(id, void *);
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v18;
  uint8_t buf[4];
  HFItemBuilder *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (uint64_t (**)(id, void *))a4;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFItemBuilder.m"), 166, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("condition"));

  }
  -[HFItemBuilder valueForKey:](self, "valueForKey:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v10[2](v10, v12);

  if ((v13 & 1) != 0)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ has invalid property \"%@\": %@"), self, v9, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HFLogForCategory(0x28uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v20 = self;
      v21 = 2112;
      v22 = v15;
      _os_log_error_impl(&dword_1DD34E000, v16, OS_LOG_TYPE_ERROR, "Failed to verify builder: %@ for reason: %@", buf, 0x16u);
    }

    -[HFItemBuilder _failureErrorWithReason:](self, "_failureErrorWithReason:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (id)lazy_verifyPropertyIsSet:(id)a3
{
  return -[HFItemBuilder lazy_verifyProperty:matchesCondition:description:](self, "lazy_verifyProperty:matchesCondition:description:", a3, &__block_literal_global_42, CFSTR("Property is required but not set"));
}

BOOL __42__HFItemBuilder_lazy_verifyPropertyIsSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return a2 != 0;
}

- (id)lazy_verifyPropertiesAreSet:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];

  v3 = (void *)MEMORY[0x1E0D519C0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__HFItemBuilder_lazy_verifyPropertiesAreSet___block_invoke;
  v7[3] = &unk_1EA72A1E8;
  v7[4] = self;
  objc_msgSend(a3, "na_map:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chainFutures:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __45__HFItemBuilder_lazy_verifyPropertiesAreSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "verifyPropertyIsSet:", a2);
}

- (id)lazy_verifyProperty:(id)a3 matchesCondition:(id)a4 description:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0D519C0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __66__HFItemBuilder_lazy_verifyProperty_matchesCondition_description___block_invoke;
  v17[3] = &unk_1EA72A210;
  v17[4] = self;
  v18 = v8;
  v19 = v10;
  v20 = v9;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "lazyFutureWithBlock:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __66__HFItemBuilder_lazy_verifyProperty_matchesCondition_description___block_invoke(_QWORD *a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v5 = a1[6];
  v4 = a1[7];
  v6 = a2;
  objc_msgSend(v2, "verifyProperty:matchesCondition:description:", v3, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (id)v7;
  if (v7)
    objc_msgSend(v6, "finishWithError:", v7);
  else
    objc_msgSend(v6, "finishWithNoResult");

}

- (id)lazy_verifyNameIsNotEmpty:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_msgSend(a3, "length");
  v4 = (void *)MEMORY[0x1E0D519C0];
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "futureWithError:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_failureErrorWithReason:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = CFSTR("HFItemBuilderFailureReason");
  v9[0] = a3;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D51980], 2, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)homeKitRepresentation
{
  return self->_homeKitRepresentation;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong(&self->_homeKitRepresentation, 0);
}

@end
