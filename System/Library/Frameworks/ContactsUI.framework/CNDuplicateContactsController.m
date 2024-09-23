@implementation CNDuplicateContactsController

- (CNDuplicateContactsController)initWithDataSource:(id)a3 environment:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  CNDuplicateContactsController *v12;
  CNDuplicateContactsController *v13;
  uint64_t v14;
  CNContactFormatter *contactFormatter;
  _TtC10ContactsUI18DuplicatesUIHelper *v16;
  _TtC10ContactsUI18DuplicatesUIHelper *duplicatesUIHelper;
  CNDuplicateContactsController *v18;
  objc_super v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CNDuplicateContactsController;
  v12 = -[CNDuplicateContactsController init](&v20, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_environment, a4);
    objc_storeStrong((id *)&v13->_dataSource, a3);
    +[CNDuplicateContactsController defaultContactFormatterForDataSource:](CNDuplicateContactsController, "defaultContactFormatterForDataSource:", v9);
    v14 = objc_claimAutoreleasedReturnValue();
    contactFormatter = v13->_contactFormatter;
    v13->_contactFormatter = (CNContactFormatter *)v14;

    objc_storeWeak((id *)&v13->_delegate, v11);
    *(_WORD *)&v13->_isPerformingMerge = 0;
    v13->_allDuplicatesCount = 0;
    v13->_mergeCompletedAt = 0.0;
    v13->_newDuplicatesCount = 0;
    v16 = -[DuplicatesUIHelper initWithDelegate:]([_TtC10ContactsUI18DuplicatesUIHelper alloc], "initWithDelegate:", v13);
    duplicatesUIHelper = v13->_duplicatesUIHelper;
    v13->_duplicatesUIHelper = v16;

    -[CNDuplicateContactsController updateDuplicatesCounts](v13, "updateDuplicatesCounts");
    v18 = v13;
  }

  return v13;
}

- (void)setDataSource:(id)a3
{
  id v5;
  CNContactFormatter *v6;
  CNContactFormatter *contactFormatter;

  objc_storeStrong((id *)&self->_dataSource, a3);
  v5 = a3;
  +[CNDuplicateContactsController defaultContactFormatterForDataSource:](CNDuplicateContactsController, "defaultContactFormatterForDataSource:", v5);
  v6 = (CNContactFormatter *)objc_claimAutoreleasedReturnValue();
  contactFormatter = self->_contactFormatter;
  self->_contactFormatter = v6;

  *(_WORD *)&self->_isPerformingMerge = 0;
  self->_allDuplicatesCount = 0;
  self->_mergeCompletedAt = 0.0;
  self->_newDuplicatesCount = 0;
  -[CNDuplicateContactsController updateDuplicatesCounts](self, "updateDuplicatesCounts");
}

- (CNContactStore)contactStore
{
  void *v3;
  void *v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CNContactDataSource store](self->_dataSource, "store");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNDuplicateContactsController environment](self, "environment");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "inProcessContactStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (CNContactStore *)v3;
}

- (void)resetDuplicates
{
  if (!self->_isPerformingMerge)
  {
    *(_WORD *)&self->_isPerformingMerge = 0;
    self->_mergeCompletedAt = 0.0;
  }
}

- (void)findDuplicates
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "featureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFeatureEnabled:", 8);

  if (v5)
  {
    if (!-[CNDuplicateContactsController isBusy](self, "isBusy"))
    {
      self->_isAlreadyFindingDuplicates = 1;
      objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "schedulerProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "backgroundScheduler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __47__CNDuplicateContactsController_findDuplicates__block_invoke;
      v9[3] = &unk_1E204F648;
      v9[4] = self;
      objc_msgSend(v8, "performBlock:", v9);

    }
  }
}

- (void)refreshManagedDuplicates
{
  -[CNDuplicateContactsController refreshManagedDuplicatesWithCompletionBlock:](self, "refreshManagedDuplicatesWithCompletionBlock:", 0);
}

- (void)refreshManagedDuplicatesWithCompletionBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C972F0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__CNDuplicateContactsController_refreshManagedDuplicatesWithCompletionBlock___block_invoke;
  v7[3] = &unk_1E204FB68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "refreshManagedDuplicatesWithCompletionHandler:", v7);

}

- (void)updateDuplicatesCounts
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__CNDuplicateContactsController_updateDuplicatesCounts__block_invoke;
  v2[3] = &unk_1E204F2B8;
  v2[4] = self;
  objc_msgSend(MEMORY[0x1E0C972F0], "duplicatesCountsWithCompletionHandler:", v2);
}

- (void)setNewDuplicatesCount:(int64_t)a3
{
  if (self->_newDuplicatesCount != a3)
  {
    self->_newDuplicatesCount = a3;
    -[CNDuplicateContactsController duplicatesDidChange](self, "duplicatesDidChange");
  }
}

- (void)setAllDuplicatesCount:(int64_t)a3
{
  if (self->_allDuplicatesCount != a3)
  {
    self->_allDuplicatesCount = a3;
    -[CNDuplicateContactsController duplicatesDidChange](self, "duplicatesDidChange");
  }
}

- (BOOL)isBusy
{
  return self->_isPerformingMerge || self->_isAlreadyFindingDuplicates;
}

- (int64_t)lastIgnoredNewDuplicatesCount
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x1E0C972B8], "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lastIgnoredNewDuplicatesCount");

  return v3;
}

- (void)setLastIgnoredNewDuplicatesCount:(int64_t)a3
{
  id v4;

  if (-[CNDuplicateContactsController lastIgnoredNewDuplicatesCount](self, "lastIgnoredNewDuplicatesCount") != a3)
  {
    objc_msgSend(MEMORY[0x1E0C972B8], "sharedDefaults");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLastIgnoredNewDuplicatesCount:", a3);

  }
}

- (void)ignoreNewDuplicatesBanner
{
  -[CNDuplicateContactsController setLastIgnoredNewDuplicatesCount:](self, "setLastIgnoredNewDuplicatesCount:", -[CNDuplicateContactsController newDuplicatesCount](self, "newDuplicatesCount"));
}

- (BOOL)wantsToDisplayNewDuplicatesBanner:(int64_t)a3
{
  if (-[CNDuplicateContactsController lastIgnoredNewDuplicatesCount](self, "lastIgnoredNewDuplicatesCount") > 0)
    return 0;
  if (-[CNDuplicateContactsController hasNewDuplicates](self, "hasNewDuplicates"))
    return 1;
  return -[CNDuplicateContactsController isInMergeCooldown:](self, "isInMergeCooldown:", a3);
}

- (BOOL)hasNewDuplicates
{
  return -[CNDuplicateContactsController newDuplicatesCount](self, "newDuplicatesCount") > 0;
}

- (BOOL)canMergeDuplicates
{
  _BOOL4 v3;

  v3 = -[CNDuplicateContactsController hasNewDuplicates](self, "hasNewDuplicates");
  if (v3)
    LOBYTE(v3) = !-[CNDuplicateContactsController isBusy](self, "isBusy");
  return v3;
}

- (BOOL)isInMergeCooldown:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;

  if (self->_mergeCompletedAt == 0.0)
    return 0;
  objc_msgSend(MEMORY[0x1E0D13BB8], "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timestamp");
  v7 = v6;

  return v7 - self->_mergeCompletedAt < (double)a3;
}

- (void)presentSheetBasedMergeForController:(id)a3 showsIgnored:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v8 = a3;
  -[DuplicatesUIHelper duplicateContactsListViewController:](self->_duplicatesUIHelper, "duplicateContactsListViewController:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setModalPresentationStyle:", 2);
    objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, 0);
  }
  else
  {
    -[CNDuplicateContactsController presentDuplicatesUIFailureAlertForController:](self, "presentDuplicatesUIFailureAlertForController:", v8);
  }

}

- (void)presentDuplicatesUIFailureAlertForController:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0DC3450];
  v4 = a3;
  CNContactsUIBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("COULD_NOT_LOAD_DUPLICATES"), &stru_1E20507A8, CFSTR("Localized"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v6, 0, 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3448];
  CNContactsUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_1E20507A8, CFSTR("Localized"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionWithTitle:style:handler:", v9, 0, &__block_literal_global_25_59438);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addAction:", v10);
  objc_msgSend(v4, "presentViewController:animated:completion:", v11, 1, 0);

}

- (void)decorateBannerViewCell:(id)a3
{
  _BOOL4 isPerformingMerge;
  id v5;
  id v6;

  isPerformingMerge = self->_isPerformingMerge;
  v5 = a3;
  v6 = v5;
  if (isPerformingMerge)
    objc_msgSend(v5, "updateWithState:", 1);
  else
    objc_msgSend(v5, "updateWithCount:", -[CNDuplicateContactsController newDuplicatesCount](self, "newDuplicatesCount"));

}

- (void)performMerge:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  CNDuplicateContactsController *v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "featureFlags");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFeatureEnabled:", 8);

  if (v7 && !-[CNDuplicateContactsController isBusy](self, "isBusy"))
  {
    self->_isPerformingMerge = 1;
    -[CNDuplicateContactsController willPerformDuplicatesMerge:](self, "willPerformDuplicatesMerge:", -[CNDuplicateContactsController allDuplicatesCount](self, "allDuplicatesCount") == objc_msgSend(v4, "count"));
    if ((unint64_t)objc_msgSend(v4, "count") >= 0x1F5)
      v8 = 3;
    else
      v8 = 4;
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "schedulerProvider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "backgroundSchedulerWithQualityOfService:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __46__CNDuplicateContactsController_performMerge___block_invoke;
    v12[3] = &unk_1E2050400;
    v13 = v4;
    v14 = self;
    objc_msgSend(v11, "performBlock:", v12);

  }
}

- (void)performIgnoreAll
{
  self->_mergeCompletedAt = 0.0;
  *(_WORD *)&self->_isPerformingMerge = 0;
  -[CNDuplicateContactsController updateDuplicatesCounts](self, "updateDuplicatesCounts");
}

- (void)duplicatesDidChange
{
  int64_t v3;
  NSObject *v4;
  id WeakRetained;
  char v6;
  id v7;
  int v8;
  int64_t v9;
  __int16 v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = -[CNDuplicateContactsController newDuplicatesCount](self, "newDuplicatesCount");
  if (v3 != -[CNDuplicateContactsController lastIgnoredNewDuplicatesCount](self, "lastIgnoredNewDuplicatesCount"))
  {
    objc_msgSend((id)objc_opt_class(), "os_log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v8 = 134218240;
      v9 = -[CNDuplicateContactsController lastIgnoredNewDuplicatesCount](self, "lastIgnoredNewDuplicatesCount");
      v10 = 2048;
      v11 = -[CNDuplicateContactsController newDuplicatesCount](self, "newDuplicatesCount");
      _os_log_debug_impl(&dword_18AC56000, v4, OS_LOG_TYPE_DEBUG, "Unignoring duplicates banner. Duplicates count updated from %ld to %ld", (uint8_t *)&v8, 0x16u);
    }

    -[CNDuplicateContactsController setLastIgnoredNewDuplicatesCount:](self, "setLastIgnoredNewDuplicatesCount:", 0);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "duplicatesDidChange:", self);

  }
}

- (void)willPerformDuplicatesMerge:(BOOL)a3
{
  id v4;
  char v5;
  id v6;
  char v7;
  id WeakRetained;

  if (a3
    && (v4 = objc_loadWeakRetained((id *)&self->_delegate),
        v5 = objc_opt_respondsToSelector(),
        v4,
        (v5 & 1) != 0))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "willPerformDuplicatesMergeAll:", self);
  }
  else
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = objc_opt_respondsToSelector();

    if ((v7 & 1) == 0)
      return;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "willPerformDuplicatesMerge:", self);
  }

}

- (void)didPerformDuplicatesMerge
{
  CNDuplicateContactsControllerDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "didPerformDuplicatesMerge:", self);

  }
}

- (void)didSelectMergeAllDuplicates:(id)a3 signaturesToMerge:(id)a4
{
  -[CNDuplicateContactsController performMerge:](self, "performMerge:", a4);
}

- (CNContactDataSource)dataSource
{
  return self->_dataSource;
}

- (CNDuplicateContactsControllerDelegate)delegate
{
  return (CNDuplicateContactsControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isPerformingMerge
{
  return self->_isPerformingMerge;
}

- (void)setIsPerformingMerge:(BOOL)a3
{
  self->_isPerformingMerge = a3;
}

- (_TtC10ContactsUI18DuplicatesUIHelper)duplicatesUIHelper
{
  return self->_duplicatesUIHelper;
}

- (void)setDuplicatesUIHelper:(id)a3
{
  objc_storeStrong((id *)&self->_duplicatesUIHelper, a3);
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (CNUIContactsEnvironment)environment
{
  return self->_environment;
}

- (void)setEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_environment, a3);
}

- (int64_t)newDuplicatesCount
{
  return self->_newDuplicatesCount;
}

- (int64_t)allDuplicatesCount
{
  return self->_allDuplicatesCount;
}

- (BOOL)isAlreadyFindingDuplicates
{
  return self->_isAlreadyFindingDuplicates;
}

- (void)setIsAlreadyFindingDuplicates:(BOOL)a3
{
  self->_isAlreadyFindingDuplicates = a3;
}

- (double)mergeCompletedAt
{
  return self->_mergeCompletedAt;
}

- (void)setMergeCompletedAt:(double)a3
{
  self->_mergeCompletedAt = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
  objc_storeStrong((id *)&self->_duplicatesUIHelper, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

void __46__CNDuplicateContactsController_performMerge___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C973D0]);
  if (objc_msgSend(MEMORY[0x1E0C972F0], "applyMergeResultToSaveRequest:signatures:", v2, *(_QWORD *)(a1 + 32)))
  {
    objc_msgSend(*(id *)(a1 + 40), "contactStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v3, "executeSaveRequest:error:", v2, &v12);
    v4 = v12;

    if (v4)
    {
      objc_msgSend((id)objc_opt_class(), "os_log");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v9 = objc_msgSend(*(id *)(a1 + 32), "count");
        objc_msgSend(v4, "localizedDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v14 = v9;
        v15 = 2112;
        v16 = v10;
        _os_log_error_impl(&dword_18AC56000, v5, OS_LOG_TYPE_ERROR, "Could not merge %lu duplicates. %@", buf, 0x16u);

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C972F0], "updateRecentImagesDatabaseForSignatures:", *(_QWORD *)(a1 + 32));
      objc_msgSend(MEMORY[0x1E0C972F0], "updateRecentPostersDatabaseForSignatures:", *(_QWORD *)(a1 + 32));
    }
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timestamp");
    objc_msgSend(*(id *)(a1 + 40), "setMergeCompletedAt:");

    v8 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __46__CNDuplicateContactsController_performMerge___block_invoke_27;
    v11[3] = &unk_1E204F320;
    v11[4] = v8;
    objc_msgSend(v8, "refreshManagedDuplicatesWithCompletionBlock:", v11);

  }
}

uint64_t __46__CNDuplicateContactsController_performMerge___block_invoke_27(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didPerformDuplicatesMerge");
  return objc_msgSend(*(id *)(a1 + 32), "setIsPerformingMerge:", 0);
}

uint64_t __55__CNDuplicateContactsController_updateDuplicatesCounts__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t result;

  v6 = objc_msgSend(*(id *)(a1 + 32), "newDuplicatesCount");
  v7 = *(_QWORD **)(a1 + 32);
  if (v6 != a2)
  {
    v7[7] = a2;
    if (objc_msgSend(*(id *)(a1 + 32), "allDuplicatesCount") == a3)
      return objc_msgSend(*(id *)(a1 + 32), "duplicatesDidChange");
LABEL_5:
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = a3;
    return objc_msgSend(*(id *)(a1 + 32), "duplicatesDidChange");
  }
  result = objc_msgSend(v7, "allDuplicatesCount");
  if (result != a3)
    goto LABEL_5;
  return result;
}

uint64_t __77__CNDuplicateContactsController_refreshManagedDuplicatesWithCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "updateDuplicatesCounts");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __47__CNDuplicateContactsController_findDuplicates__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "refreshManagedDuplicates");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CNDuplicateContactsController_findDuplicates__block_invoke_2;
  block[3] = &unk_1E204F648;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __47__CNDuplicateContactsController_findDuplicates__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsAlreadyFindingDuplicates:", 0);
}

+ (id)os_log
{
  if (os_log_cn_once_token_4_59459 != -1)
    dispatch_once(&os_log_cn_once_token_4_59459, &__block_literal_global_59460);
  return (id)os_log_cn_once_object_4_59461;
}

+ (id)defaultContactFormatterForDataSource:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v4, "contactFormatter"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    objc_msgSend(v4, "contactFormatter");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "defaultContactFormatter");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

+ (id)defaultContactFormatter
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C97218]);
  objc_msgSend(v2, "setStyle:", 0);
  objc_msgSend(v2, "setEmphasizesPrimaryNameComponent:", 1);
  objc_msgSend(v2, "setFallbackStyle:", -1);
  return v2;
}

void __39__CNDuplicateContactsController_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.deduplication", "duplicates-ui");
  v1 = (void *)os_log_cn_once_object_4_59461;
  os_log_cn_once_object_4_59461 = (uint64_t)v0;

}

@end
