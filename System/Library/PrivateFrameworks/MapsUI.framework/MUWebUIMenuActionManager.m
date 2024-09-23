@implementation MUWebUIMenuActionManager

- (MUWebUIMenuActionManager)initWithPlaceActionManager:(id)a3 mapItem:(id)a4 externalActionViewModel:(id)a5
{
  id v8;
  id v9;
  MUWebUIMenuActionManager *v10;
  MUWebUIMenuActionManager *v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)MUWebUIMenuActionManager;
  v10 = -[MUWebUIMenuActionManager init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_placeActionManager, a3);
    objc_storeStrong((id *)&v11->_externalActionViewModels, a5);
  }

  return v11;
}

- (void)performActionWithAction:(id)a3 contextMenu:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint8_t v19[16];
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v22 = *MEMORY[0x1E0CC16A8];
  v23[0] = v8;
  v10 = (void *)MEMORY[0x1E0C99D80];
  v11 = a3;
  objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MUWebUIMenuActionManager _buttonItemTypeFromMUUserInteractionType:](self, "_buttonItemTypeFromMUUserInteractionType:", objc_msgSend(v11, "userInteractionType"));
  v14 = objc_msgSend(v11, "hasUserInteractionType");

  if (v14 && (_DWORD)v13)
  {
    -[MUWebUIMenuActionManager placeActionManager](self, "placeActionManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "actionItemForButtonType:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[MUWebUIMenuActionManager placeActionManager](self, "placeActionManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __75__MUWebUIMenuActionManager_performActionWithAction_contextMenu_completion___block_invoke;
    v20[3] = &unk_1E2E017C8;
    v21 = v9;
    objc_msgSend(v17, "performAction:options:completion:", v16, v12, v20);

  }
  else
  {
    MUGetPlaceCardLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_191DB8000, v18, OS_LOG_TYPE_ERROR, "PerformAction fails: Unknown ButtonItemType", v19, 2u);
    }

    if (v9)
      (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

uint64_t __75__MUWebUIMenuActionManager_performActionWithAction_contextMenu_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

- (void)performActionUsingArguments:(id)a3 contextMenu:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v13, "hasAction"))
  {
    objc_msgSend(v13, "action");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUWebUIMenuActionManager performActionWithAction:contextMenu:completion:](self, "performActionWithAction:contextMenu:completion:", v10, v8, v9);
  }
  else
  {
    objc_msgSend(v13, "url");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "length");

    if (v12)
    {
      -[NSArray firstObject](self->_externalActionViewModels, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "performSingleVendorSelectionAction");
    }
    else
    {
      objc_msgSend(v13, "groupDatas");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "count");
    }
  }

}

- (int)_buttonItemTypeFromMUUserInteractionType:(int)a3
{
  if ((a3 - 6) > 0xB)
    return 0;
  else
    return dword_191F065AC[a3 - 6];
}

- (MUPlaceActionManager)placeActionManager
{
  return self->_placeActionManager;
}

- (void)setPlaceActionManager:(id)a3
{
  objc_storeStrong((id *)&self->_placeActionManager, a3);
}

- (NSArray)externalActionViewModels
{
  return self->_externalActionViewModels;
}

- (void)setExternalActionViewModels:(id)a3
{
  objc_storeStrong((id *)&self->_externalActionViewModels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalActionViewModels, 0);
  objc_storeStrong((id *)&self->_placeActionManager, 0);
}

@end
