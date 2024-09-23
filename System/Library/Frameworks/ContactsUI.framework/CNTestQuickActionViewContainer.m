@implementation CNTestQuickActionViewContainer

- (CNTestQuickActionViewContainer)initWithActionTypes:(id)a3
{
  id v4;
  CNTestQuickActionViewContainer *v5;
  void *v6;
  uint64_t v7;
  NSDictionary *actionViewsByActionType;
  CNTestQuickActionViewContainer *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNTestQuickActionViewContainer;
  v5 = -[CNTestQuickActionViewContainer init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "_cn_indexBy:", *MEMORY[0x1E0D137E0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_cn_map:", &__block_literal_global_33454);
    v7 = objc_claimAutoreleasedReturnValue();
    actionViewsByActionType = v5->_actionViewsByActionType;
    v5->_actionViewsByActionType = (NSDictionary *)v7;

    v9 = v5;
  }

  return v5;
}

- (id)viewForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNTestQuickActionViewContainer actionViewsByActionType](self, "actionViewsByActionType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDictionary)actionViewsByActionType
{
  return self->_actionViewsByActionType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionViewsByActionType, 0);
}

id __54__CNTestQuickActionViewContainer_initWithActionTypes___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  CNTestQuickActionView *v3;
  void *v4;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v2 = a2;
  v3 = objc_alloc_init(CNTestQuickActionView);
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
