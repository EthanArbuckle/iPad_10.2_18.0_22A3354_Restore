@implementation HFActionSetBuilderPair

- (HFActionSetBuilderPair)initWithActionSet:(id)a3 builder:(id)a4
{
  id v7;
  id v8;
  HFActionSetBuilderPair *v9;
  HFActionSetBuilderPair *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HFActionSetBuilderPair;
  v9 = -[HFActionSetBuilderPair init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionSet, a3);
    objc_storeStrong((id *)&v10->_builder, a4);
  }

  return v10;
}

- (HFActionSetBuilderPair)initWithBuilder:(id)a3
{
  return -[HFActionSetBuilderPair initWithActionSet:builder:](self, "initWithActionSet:builder:", 0, a3);
}

- (id)commitActionSetInHome:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id *v11;
  id v12;
  id *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  void *v27;

  v4 = a3;
  -[HFActionSetBuilderPair builder](self, "builder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HFActionSetBuilderPair builder](self, "builder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFActionSetBuilderPair actionSet](self, "actionSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = (void *)MEMORY[0x1E0D519C0];
    if (v7)
    {
      v10 = MEMORY[0x1E0C809B0];
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __48__HFActionSetBuilderPair_commitActionSetInHome___block_invoke;
      v25[3] = &unk_1EA728590;
      v11 = &v26;
      v12 = v7;
      v13 = &v27;
      v26 = v12;
      v27 = v6;
      v14 = v6;
      objc_msgSend(v9, "futureWithErrorOnlyHandlerAdapterBlock:", v25);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v10;
      v23[1] = 3221225472;
      v23[2] = __48__HFActionSetBuilderPair_commitActionSetInHome___block_invoke_2;
      v23[3] = &unk_1EA726940;
      v24 = v12;
      objc_msgSend(v15, "flatMap:", v23);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __48__HFActionSetBuilderPair_commitActionSetInHome___block_invoke_3;
      v20[3] = &unk_1EA72BB28;
      v11 = &v21;
      v13 = &v22;
      v21 = v4;
      v22 = v6;
      v18 = v6;
      objc_msgSend(v9, "futureWithCompletionHandlerAdapterBlock:", v20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    NSLog(&stru_1EA741FF8.isa);
    v17 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "futureWithError:", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

uint64_t __48__HFActionSetBuilderPair_commitActionSetInHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateWithBuilder:completionHandler:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __48__HFActionSetBuilderPair_commitActionSetInHome___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", *(_QWORD *)(a1 + 32));
}

uint64_t __48__HFActionSetBuilderPair_commitActionSetInHome___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addActionSetFromBuilder:completionHandler:", *(_QWORD *)(a1 + 40), a2);
}

- (HMActionSetBuilder)builder
{
  return self->_builder;
}

- (HMActionSet)actionSet
{
  return self->_actionSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionSet, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

@end
