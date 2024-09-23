@implementation MUBlockActivity

- (MUBlockActivity)initWithTitle:(id)a3 systemImageName:(id)a4 activityType:(id)a5 block:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  MUBlockActivity *v15;
  MUBlockActivity *v16;
  void *v17;
  id block;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MUBlockActivity;
  v15 = -[UIActivity init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_title, a3);
    v17 = _Block_copy(v14);
    block = v16->_block;
    v16->_block = v17;

    objc_storeStrong((id *)&v16->_type, a5);
    objc_storeStrong((id *)&v16->_systemImageName, a4);
  }

  return v16;
}

- (id)_systemImageName
{
  return self->_systemImageName;
}

- (id)activityType
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  -[MUBlockActivity type](self, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUBlockActivity title](self, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@.%@"), v7, v8);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (int64_t)activityCategory
{
  return 0;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (void)performActivity
{
  void (**block)(id, SEL);

  block = (void (**)(id, SEL))self->_block;
  if (block)
    block[2](block, a2);
  -[UIActivity activityDidFinish:](self, "activityDidFinish:", 1);
}

- (id)block
{
  return self->_block;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)systemImageName
{
  return self->_systemImageName;
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_systemImageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_block, 0);
}

+ (id)createBlockActivitiesFromPlaceActionItems:(id)a3 usingActionManager:(id)a4 presentationOptions:(id)a5 analyticsModuleMetadata:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  MUBlockActivity *v22;
  id v23;
  id v24;
  MUBlockActivity *v25;
  void *v26;
  id obj;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v32 = a4;
  v10 = a5;
  v11 = a6;
  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v38;
    v29 = *MEMORY[0x1E0CC16A0];
    v30 = *MEMORY[0x1E0CC16A8];
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v38 != v14)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v15), "resolvedActionItem");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "titleForDisplayStyle:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "symbolForDisplayStyle:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        objc_msgSend(v10, "sourceView");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v20)
        {
          objc_msgSend(v10, "sourceView");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, v30);

        }
        if (v11)
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v11, v29);
        v22 = [MUBlockActivity alloc];
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __152__MUBlockActivity_MKPlaceActionManagerExtras__createBlockActivitiesFromPlaceActionItems_usingActionManager_presentationOptions_analyticsModuleMetadata___block_invoke;
        v33[3] = &unk_1E2E023E8;
        v34 = v32;
        v35 = v16;
        v36 = v19;
        v23 = v19;
        v24 = v16;
        v25 = -[MUBlockActivity initWithTitle:systemImageName:activityType:block:](v22, "initWithTitle:systemImageName:activityType:block:", v17, v18, 0, v33);
        objc_msgSend(v31, "addObject:", v25);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v13);
  }

  v26 = (void *)objc_msgSend(v31, "copy");
  return v26;
}

void __152__MUBlockActivity_MKPlaceActionManagerExtras__createBlockActivitiesFromPlaceActionItems_usingActionManager_presentationOptions_analyticsModuleMetadata___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = (id)objc_msgSend(*(id *)(a1 + 48), "copy");
  objc_msgSend(v1, "performAction:options:completion:", v2, v3, 0);

}

@end
