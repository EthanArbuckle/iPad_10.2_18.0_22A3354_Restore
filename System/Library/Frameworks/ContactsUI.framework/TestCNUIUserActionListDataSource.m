@implementation TestCNUIUserActionListDataSource

- (TestCNUIUserActionListDataSource)initWithActionsByActionTypeByContact:(id)a3
{
  id v5;
  TestCNUIUserActionListDataSource *v6;
  TestCNUIUserActionListDataSource *v7;
  uint64_t v8;
  NSDictionary *userActionListModelResultBlocksByActionTypeAskedFor;
  TestCNUIUserActionListDataSource *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TestCNUIUserActionListDataSource;
  v6 = -[TestCNUIUserActionListDataSource init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_actionsByActionTypeByContact, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    userActionListModelResultBlocksByActionTypeAskedFor = v7->_userActionListModelResultBlocksByActionTypeAskedFor;
    v7->_userActionListModelResultBlocksByActionTypeAskedFor = (NSDictionary *)v8;

    v10 = v7;
  }

  return v7;
}

- (void)setContact:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  objc_storeStrong((id *)&self->_contact, a3);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[TestCNUIUserActionListDataSource userActionListModelResultBlocksByActionTypeAskedFor](self, "userActionListModelResultBlocksByActionTypeAskedFor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
        -[TestCNUIUserActionListDataSource userActionListModelResultBlocksByActionTypeAskedFor](self, "userActionListModelResultBlocksByActionTypeAskedFor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

        -[TestCNUIUserActionListDataSource actionsByActionTypeByContact](self, "actionsByActionTypeByContact");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TestCNUIUserActionListDataSource contact](self, "contact");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *))v13)[2](v13, v17);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

}

- (id)consumer:(id)a3 actionModelsForActionType:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  -[TestCNUIUserActionListDataSource userActionListModelResultBlocksByActionTypeAskedFor](self, "userActionListModelResultBlocksByActionTypeAskedFor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "copy");

  objc_msgSend(v9, "setValue:forKey:", v10, v8);
  return objc_alloc_init(MEMORY[0x1E0D139B8]);
}

- (id)consumer:(id)a3 localizedDisplayNameForButtonWithDefaultAction:(id)a4 actionType:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;

  v6 = a5;
  v7 = v6;
  if (a4)
  {
    objc_msgSend(a4, "label");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = v6;
  }
  v9 = v8;

  return v9;
}

- (id)actionTypesForConsumer:(id)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "allActionTypes");
}

- (id)consumer:(id)a3 actionModelsForActionType:(id)a4
{
  id v6;
  id v7;
  TestCNUIUserActionListDataSource *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CNUnimplementedMethodException();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (id)consumer:(id)a3 localizedDisplayNameForActionType:(id)a4
{
  id v6;
  id v7;
  TestCNUIUserActionListDataSource *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CNUnimplementedMethodException();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (id)consumer:(id)a3 localizedButtonDisplayNameForActionType:(id)a4
{
  id v6;
  id v7;
  TestCNUIUserActionListDataSource *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CNUnimplementedMethodException();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (id)thirdPartyTargetsForActionTypes:(id)a3
{
  id v4;
  TestCNUIUserActionListDataSource *v5;
  id v6;

  v4 = a3;
  v5 = self;
  CNUnimplementedMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (id)thirdPartyActionsForContactProperty:(id)a3
{
  id v4;
  TestCNUIUserActionListDataSource *v5;
  id v6;

  v4 = a3;
  v5 = self;
  CNUnimplementedMethodException();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v6);
}

- (id)thirdPartyActionsForCurrentContactAndPropertyKey:(id)a3 identifier:(id)a4
{
  id v6;
  id v7;
  TestCNUIUserActionListDataSource *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CNUnimplementedMethodException();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (id)consumer:(id)a3 imageForActionType:(id)a4
{
  id v6;
  id v7;
  TestCNUIUserActionListDataSource *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  CNUnimplementedMethodException();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v9);
}

- (BOOL)tracksChanges
{
  return self->_tracksChanges;
}

- (void)setTracksChanges:(BOOL)a3
{
  self->_tracksChanges = a3;
}

- (NSDictionary)userActionListModelResultBlocksByActionTypeAskedFor
{
  return self->_userActionListModelResultBlocksByActionTypeAskedFor;
}

- (void)setUserActionListModelResultBlocksByActionTypeAskedFor:(id)a3
{
  objc_storeStrong((id *)&self->_userActionListModelResultBlocksByActionTypeAskedFor, a3);
}

- (NSDictionary)actionsByActionTypeByContact
{
  return self->_actionsByActionTypeByContact;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_actionsByActionTypeByContact, 0);
  objc_storeStrong((id *)&self->_userActionListModelResultBlocksByActionTypeAskedFor, 0);
}

+ (id)allActionTypes
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0C96620];
  v5[0] = *MEMORY[0x1E0C96618];
  v5[1] = v2;
  v3 = *MEMORY[0x1E0C965F8];
  v5[2] = *MEMORY[0x1E0C96658];
  v5[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
