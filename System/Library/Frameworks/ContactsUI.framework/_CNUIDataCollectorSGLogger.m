@implementation _CNUIDataCollectorSGLogger

- (_CNUIDataCollectorSGLogger)initWithSuggestionsServiceProvider:(id)a3 schedulerProvider:(id)a4
{
  id v6;
  id v7;
  _CNUIDataCollectorSGLogger *v8;
  uint64_t v9;
  CNScheduler *workQueue;
  uint64_t v11;
  id serviceProvider;
  _CNUIDataCollectorSGLogger *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_CNUIDataCollectorSGLogger;
  v8 = -[_CNUIDataCollectorSGLogger init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "newSerialSchedulerWithName:", CFSTR("com.apple.contacts.ContactsUI.CNUIDataCollectorSGLogger"));
    workQueue = v8->_workQueue;
    v8->_workQueue = (CNScheduler *)v9;

    v11 = objc_msgSend(v6, "copy");
    serviceProvider = v8->_serviceProvider;
    v8->_serviceProvider = (id)v11;

    v13 = v8;
  }

  return v8;
}

- (void)performBlockWithService:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  -[_CNUIDataCollectorSGLogger serviceProvider](self, "serviceProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNUIDataCollectorSGLogger workQueue](self, "workQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54___CNUIDataCollectorSGLogger_performBlockWithService___block_invoke;
  v9[3] = &unk_1E2048C68;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  objc_msgSend(v6, "performBlock:qualityOfService:", v9, 2);

}

- (void)logContactSearchResultSelected:(id)a3 contactIdentifier:(id)a4 bundleID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88___CNUIDataCollectorSGLogger_logContactSearchResultSelected_contactIdentifier_bundleID___block_invoke;
  v14[3] = &unk_1E2048C90;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[_CNUIDataCollectorSGLogger performBlockWithService:](self, "performBlockWithService:", v14);

}

- (void)logSuggestedContactDetailShown:(id)a3 contactIdentifier:(id)a4 bundleID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __88___CNUIDataCollectorSGLogger_logSuggestedContactDetailShown_contactIdentifier_bundleID___block_invoke;
  v14[3] = &unk_1E2048C90;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[_CNUIDataCollectorSGLogger performBlockWithService:](self, "performBlockWithService:", v14);

}

- (void)logSuggestedContactDetailUsed:(id)a3 contactIdentifier:(id)a4 bundleID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87___CNUIDataCollectorSGLogger_logSuggestedContactDetailUsed_contactIdentifier_bundleID___block_invoke;
  v14[3] = &unk_1E2048C90;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[_CNUIDataCollectorSGLogger performBlockWithService:](self, "performBlockWithService:", v14);

}

- (void)logContactCreated:(id)a3 contactIdentifier:(id)a4 bundleID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __75___CNUIDataCollectorSGLogger_logContactCreated_contactIdentifier_bundleID___block_invoke;
  v14[3] = &unk_1E2048C90;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  -[_CNUIDataCollectorSGLogger performBlockWithService:](self, "performBlockWithService:", v14);

}

- (void)logSearchResultsIncludedPureSuggestionsWithBundleID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82___CNUIDataCollectorSGLogger_logSearchResultsIncludedPureSuggestionsWithBundleID___block_invoke;
  v6[3] = &unk_1E2048CB8;
  v7 = v4;
  v5 = v4;
  -[_CNUIDataCollectorSGLogger performBlockWithService:](self, "performBlockWithService:", v6);

}

- (id)serviceProvider
{
  return self->_serviceProvider;
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_serviceProvider, 0);
}

@end
