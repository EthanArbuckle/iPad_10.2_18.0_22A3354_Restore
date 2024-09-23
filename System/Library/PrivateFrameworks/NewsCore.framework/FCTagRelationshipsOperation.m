@implementation FCTagRelationshipsOperation

- (FCTagRelationshipsOperation)initWithContext:(id)a3 tag:(id)a4
{
  id v7;
  id v8;
  FCTagRelationshipsOperation *v9;
  FCTagRelationshipsOperation *v10;
  uint64_t v11;
  FCTagProviding *tag;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)FCTagRelationshipsOperation;
  v9 = -[FCOperation init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    v11 = objc_msgSend(v8, "copy");
    tag = v10->_tag;
    v10->_tag = (FCTagProviding *)v11;

  }
  return v10;
}

- (void)performOperation
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  FCCKContentFetchOperation *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  id v20;
  _QWORD newValue[5];
  id v22;
  __CFString *v23;
  _QWORD v24[2];
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("relatedChannelTagIDsForOnboarding");
  +[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentStoreFrontID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FCCKLocalizedRecordKey((uint64_t)v3, (uint64_t)v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(FCCKContentFetchOperation);
  -[FCTagRelationshipsOperation context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "internalContentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCCKContentFetchOperation setDatabase:]((uint64_t)v7, v10);

  v11 = objc_alloc(MEMORY[0x1E0C95070]);
  -[FCTagRelationshipsOperation tag](self, "tag");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithRecordName:", v13);
  v25[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_setProperty_nonatomic_copy(v7, v15, v16, 384);

  v24[0] = v3;
  v24[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_setProperty_nonatomic_copy(v7, v17, v18, 400);

  newValue[0] = MEMORY[0x1E0C809B0];
  newValue[1] = 3221225472;
  newValue[2] = __47__FCTagRelationshipsOperation_performOperation__block_invoke;
  newValue[3] = &unk_1E4645498;
  newValue[4] = self;
  v22 = v6;
  v23 = v3;
  v20 = v6;
  if (v7)
    objc_setProperty_nonatomic_copy(v7, v19, newValue, 416);
  -[FCOperation associateChildOperation:](self, "associateChildOperation:", v7);
  -[FCOperation start](v7, "start");

}

void __47__FCTagRelationshipsOperation_performOperation__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  uint64_t v18;
  id v19;

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:");
  }
  else
  {
    objc_msgSend(a2, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fc_onlyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    v8 = 40;
    if (!v7)
      v8 = 48;
    objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + v8));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tagController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchOperationForTagsWithIDs:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __47__FCTagRelationshipsOperation_performOperation__block_invoke_3;
    v17 = &unk_1E463A9C0;
    v18 = *(_QWORD *)(a1 + 32);
    v19 = v9;
    v13 = v9;
    objc_msgSend(v12, "setFetchCompletionBlock:", &v14);
    objc_msgSend(*(id *)(a1 + 32), "associateChildOperation:", v12, v14, v15, v16, v17, v18);
    objc_msgSend(v12, "start");

  }
}

void __47__FCTagRelationshipsOperation_performOperation__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  FCTagRelationships *v6;
  id v7;

  v3 = a2;
  if (objc_msgSend(v3, "status"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "error");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "finishedPerformingOperationWithError:", v7);
  }
  else
  {
    objc_msgSend(v3, "fetchedObject");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "nf_objectsForKeysWithoutMarker:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[FCTagRelationships initWithRelatedChannelsForOnboarding:]([FCTagRelationships alloc], "initWithRelatedChannelsForOnboarding:", v5);
    objc_msgSend(*(id *)(a1 + 32), "setResultTagRelationships:", v6);

    objc_msgSend(*(id *)(a1 + 32), "finishedPerformingOperationWithError:", 0);
  }

}

- (void)operationWillFinishWithError:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  id v7;

  v7 = a3;
  -[FCTagRelationshipsOperation completionHandler](self, "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCTagRelationshipsOperation completionHandler](self, "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[FCTagRelationshipsOperation resultTagRelationships](self, "resultTagRelationships");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v5)[2](v5, v6, v7);

  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (FCContentContext)context
{
  return self->_context;
}

- (FCTagProviding)tag
{
  return self->_tag;
}

- (FCTagRelationships)resultTagRelationships
{
  return self->_resultTagRelationships;
}

- (void)setResultTagRelationships:(id)a3
{
  objc_storeStrong((id *)&self->_resultTagRelationships, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultTagRelationships, 0);
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
