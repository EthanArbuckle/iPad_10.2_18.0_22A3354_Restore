@implementation TabLimitCleanupWizard

- (id)initForPrivateBrowsing:(BOOL)a3 withBrowserController:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  TabLimitCleanupWizard *v10;
  TabLimitCleanupWizard *v11;
  void *v12;
  id resultHandler;
  TabLimitCleanupWizard *v14;
  objc_super v16;

  v8 = a4;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)TabLimitCleanupWizard;
  v10 = -[TabLimitCleanupWizard init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_privateBrowsing = a3;
    objc_storeWeak((id *)&v10->_browserController, v8);
    v12 = _Block_copy(v9);
    resultHandler = v11->_resultHandler;
    v11->_resultHandler = v12;

    v14 = v11;
  }

  return v11;
}

- (id)makeViewController
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
  void *v12;
  void *v13;
  _QWORD v15[5];

  -[TabLimitCleanupWizard _smallCleanupGroup](self, "_smallCleanupGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TabLimitCleanupWizard _cleanupGroupForRange:](self, "_cleanupGroupForRange:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(v3, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "action");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v9);

  objc_msgSend(v4, "action");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v10);

  v11 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __43__TabLimitCleanupWizard_makeViewController__block_invoke;
  v15[3] = &unk_1E9CF3290;
  v15[4] = self;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v13);

  return v8;
}

uint64_t __43__TabLimitCleanupWizard_makeViewController__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) + 16))();
}

- (id)_smallCleanupGroup
{
  uint64_t v3;
  void *v4;

  v3 = 0;
  while (1)
  {
    -[TabLimitCleanupWizard _cleanupGroupForRange:](self, "_cleanupGroupForRange:", qword_1D7EA8828[v3]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      break;
    if (++v3 == 3)
    {
      -[TabLimitCleanupWizard _cleanupGroupForRange:](self, "_cleanupGroupForRange:", 3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
  }
  return v4;
}

- (id)_cleanupGroupForRange:(int64_t)a3
{
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  TabLimitCleanupGroup *v26;
  void *v28;
  void *v29;
  void *v30;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (self->_privateBrowsing)
    objc_msgSend(v6, "privateUnpinnedTabs");
  else
    objc_msgSend(v6, "normalUnpinnedTabs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v8;
  v9 = objc_msgSend(v8, "count");
  switch(a3)
  {
    case 0:
      v10 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      objc_msgSend(v10, "setMonth:", -1);
      objc_msgSend(v7, "tabsOlderThan:inPrivateBrowsing:", v10, self->_privateBrowsing);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringWithFormat:", v13, v9, objc_msgSend(v11, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      _WBSLocalizedString();
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 1:
      v23 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      objc_msgSend(v23, "setWeekOfYear:", -2);
      objc_msgSend(v7, "tabsOlderThan:inPrivateBrowsing:", v23, self->_privateBrowsing);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      v24 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "localizedStringWithFormat:", v25, v9, objc_msgSend(v11, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      _WBSLocalizedString();
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 2:
      v16 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      objc_msgSend(v16, "setWeekOfYear:", -1);
      objc_msgSend(v7, "tabsOlderThan:inPrivateBrowsing:", v16, self->_privateBrowsing);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringWithFormat:", v18, v9, objc_msgSend(v11, "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      _WBSLocalizedString();
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 3:
      objc_msgSend(v7, "oldestTabsWithLimit:inPrivateBrowsing:", 100, self->_privateBrowsing);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB3940];
      _WBSLocalizedString();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringWithFormat:", v21, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "count") == 1)
      {
        _WBSLocalizedString();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v28 = (void *)MEMORY[0x1E0CB3940];
        _WBSLocalizedString();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "localizedStringWithFormat:", v29, objc_msgSend(v19, "count"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v11 = v19;
      break;
    case 4:
      v11 = v8;
      v14 = 0;
      _WBSLocalizedString();
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v22 = (void *)v15;
      break;
    default:
      v14 = 0;
      v22 = 0;
      v11 = 0;
      break;
  }
  v26 = -[TabLimitCleanupGroup initWithAlertMesssage:actionTitle:tabs:browserController:resultHandler:]([TabLimitCleanupGroup alloc], "initWithAlertMesssage:actionTitle:tabs:browserController:resultHandler:", v14, v22, v11, WeakRetained, self->_resultHandler);

  return v26;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultHandler, 0);
  objc_destroyWeak((id *)&self->_browserController);
}

@end
