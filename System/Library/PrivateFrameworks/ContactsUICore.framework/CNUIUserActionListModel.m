@implementation CNUIUserActionListModel

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundOnDeviceActions, 0);
  objc_storeStrong((id *)&self->_directoryServiceActions, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_defaultAction, 0);
}

void __37__CNUIUserActionListModel_emptyModel__block_invoke()
{
  CNUIUserActionListModel *v0;
  uint64_t v1;
  void *v2;

  v0 = [CNUIUserActionListModel alloc];
  v1 = -[CNUIUserActionListModel initWithDefaultAction:actions:directoryServiceActions:foundOnDeviceActions:](v0, "initWithDefaultAction:actions:directoryServiceActions:foundOnDeviceActions:", 0, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
  v2 = (void *)emptyModel_cn_once_object_1;
  emptyModel_cn_once_object_1 = v1;

}

- (CNUIUserActionListModel)initWithModel:(id)a3 actions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  CNUIUserActionListModel *v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "defaultAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "directoryServiceActions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "foundOnDeviceActions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[CNUIUserActionListModel initWithDefaultAction:actions:directoryServiceActions:foundOnDeviceActions:](self, "initWithDefaultAction:actions:directoryServiceActions:foundOnDeviceActions:", v8, v6, v9, v10);
  return v11;
}

- (BOOL)isEmpty
{
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  char v10;

  -[CNUIUserActionListModel defaultAction](self, "defaultAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0;
  v4 = *MEMORY[0x1E0D137F8];
  -[CNUIUserActionListModel actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if (!v6)
    return 0;
  -[CNUIUserActionListModel directoryServiceActions](self, "directoryServiceActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v7);

  if (!v8)
    return 0;
  -[CNUIUserActionListModel foundOnDeviceActions](self, "foundOnDeviceActions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v9);

  return v10;
}

- (CNUIUserActionItem)defaultAction
{
  return self->_defaultAction;
}

- (NSArray)actions
{
  return self->_actions;
}

- (NSArray)foundOnDeviceActions
{
  return self->_foundOnDeviceActions;
}

- (NSArray)directoryServiceActions
{
  return self->_directoryServiceActions;
}

- (CNUIUserActionListModel)initWithDefaultAction:(id)a3 actions:(id)a4 directoryServiceActions:(id)a5 foundOnDeviceActions:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  CNUIUserActionListModel *v15;
  CNUIUserActionListModel *v16;
  CNUIUserActionListModel *v17;
  objc_super v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CNUIUserActionListModel;
  v15 = -[CNUIUserActionListModel init](&v19, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_defaultAction, a3);
    objc_storeStrong((id *)&v16->_actions, a4);
    objc_storeStrong((id *)&v16->_directoryServiceActions, a5);
    objc_storeStrong((id *)&v16->_foundOnDeviceActions, a6);
    v17 = v16;
  }

  return v16;
}

+ (id)emptyModel
{
  if (emptyModel_cn_once_token_1 != -1)
    dispatch_once(&emptyModel_cn_once_token_1, &__block_literal_global_53);
  return (id)emptyModel_cn_once_object_1;
}

- (id)allActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionListModel actions](self, "actions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  -[CNUIUserActionListModel directoryServiceActions](self, "directoryServiceActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  -[CNUIUserActionListModel foundOnDeviceActions](self, "foundOnDeviceActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v6);

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUIUserActionListModel defaultAction](self, "defaultAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __38__CNUIUserActionListModel_description__block_invoke((uint64_t)v4, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("default"), v5);

  -[CNUIUserActionListModel actions](self, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_cn_map:", &__block_literal_global_3_2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("actions"), v9);

  objc_msgSend(v3, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __38__CNUIUserActionListModel_description__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a2;
  objc_msgSend(v3, "targetHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ (%p)"), v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setDefaultAction:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAction, a3);
}

- (void)setActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setDirectoryServiceActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setFoundOnDeviceActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
