@implementation MessageContentItemRepresentationTask

- (MessageContentItemRepresentationTask)initWithContentItem:(id)a3 type:(id)a4 networkUsage:(int64_t)a5
{
  id v9;
  id v10;
  MessageContentItemRepresentationTask *v11;
  MessageContentItemRepresentationTask *v12;
  id v13;
  id v14;
  uint64_t v15;
  EFLocked *invokerIDs;
  uint64_t v17;
  NSProgress *topLevelProgress;
  uint64_t v19;
  EFPromise *contentRequestPromise;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v22.receiver = self;
  v22.super_class = (Class)MessageContentItemRepresentationTask;
  v11 = -[MessageContentItemRepresentationTask init](&v22, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_type, a4);
    objc_storeStrong((id *)&v12->_contentItem, a3);
    v12->_networkUsage = a5;
    v13 = objc_alloc(MEMORY[0x1E0D1EEF0]);
    v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v15 = objc_msgSend(v13, "initWithObject:", v14);
    invokerIDs = v12->_invokerIDs;
    v12->_invokerIDs = (EFLocked *)v15;

    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
    v17 = objc_claimAutoreleasedReturnValue();
    topLevelProgress = v12->_topLevelProgress;
    v12->_topLevelProgress = (NSProgress *)v17;

    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v19 = objc_claimAutoreleasedReturnValue();
    contentRequestPromise = v12->_contentRequestPromise;
    v12->_contentRequestPromise = (EFPromise *)v19;

  }
  return v12;
}

- (EFFuture)future
{
  void *v2;
  void *v3;

  -[MessageContentItemRepresentationTask contentRequestPromise](self, "contentRequestPromise");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "future");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (EFFuture *)v3;
}

- (void)addAccessedByInvokerWithID:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  if (v5)
  {
    -[MessageContentItemRepresentationTask invokerIDs](self, "invokerIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __67__MessageContentItemRepresentationTask_addAccessedByInvokerWithID___block_invoke;
    v6[3] = &unk_1E9A02C48;
    v7 = v5;
    objc_msgSend(v4, "performWhileLocked:", v6);

  }
}

uint64_t __67__MessageContentItemRepresentationTask_addAccessedByInvokerWithID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addObject:", *(_QWORD *)(a1 + 32));
}

- (BOOL)hasBeenAccessedByInvokerWithID:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    -[MessageContentItemRepresentationTask invokerIDs](self, "invokerIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __71__MessageContentItemRepresentationTask_hasBeenAccessedByInvokerWithID___block_invoke;
    v8[3] = &unk_1E9A02C70;
    v10 = &v11;
    v9 = v4;
    objc_msgSend(v5, "performWhileLocked:", v8);

    v6 = *((_BYTE *)v12 + 24) != 0;
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __71__MessageContentItemRepresentationTask_hasBeenAccessedByInvokerWithID___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "containsObject:", *(_QWORD *)(a1 + 32));

}

- (void)resume
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[MessageContentItemRepresentationTask contentRequestProgress](self, "contentRequestProgress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)MEMORY[0x1E0D1E130];
    -[MessageContentItemRepresentationTask type](self, "type");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "optionsWithRequestedRepresentationType:networkUsage:", v5, -[MessageContentItemRepresentationTask networkUsage](self, "networkUsage"));
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[MessageContentItemRepresentationTask contentItem](self, "contentItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MessageContentItemRepresentationTask contentRequestPromise](self, "contentRequestPromise");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "completionHandlerAdapter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "requestRepresentationWithOptions:completionHandler:", v11, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[MessageContentItemRepresentationTask setContentRequestProgress:](self, "setContentRequestProgress:", v9);
      -[MessageContentItemRepresentationTask topLevelProgress](self, "topLevelProgress");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addChild:withPendingUnitCount:", v9, 1);

    }
  }
}

- (int64_t)networkUsage
{
  return self->_networkUsage;
}

- (void)setNetworkUsage:(int64_t)a3
{
  self->_networkUsage = a3;
}

- (EMContentItem)contentItem
{
  return self->_contentItem;
}

- (void)setContentItem:(id)a3
{
  objc_storeStrong((id *)&self->_contentItem, a3);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (NSProgress)topLevelProgress
{
  return self->_topLevelProgress;
}

- (void)setTopLevelProgress:(id)a3
{
  objc_storeStrong((id *)&self->_topLevelProgress, a3);
}

- (EFPromise)contentRequestPromise
{
  return self->_contentRequestPromise;
}

- (void)setContentRequestPromise:(id)a3
{
  objc_storeStrong((id *)&self->_contentRequestPromise, a3);
}

- (NSProgress)contentRequestProgress
{
  return self->_contentRequestProgress;
}

- (void)setContentRequestProgress:(id)a3
{
  objc_storeStrong((id *)&self->_contentRequestProgress, a3);
}

- (EFLocked)invokerIDs
{
  return self->_invokerIDs;
}

- (void)setInvokerIDs:(id)a3
{
  objc_storeStrong((id *)&self->_invokerIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invokerIDs, 0);
  objc_storeStrong((id *)&self->_contentRequestProgress, 0);
  objc_storeStrong((id *)&self->_contentRequestPromise, 0);
  objc_storeStrong((id *)&self->_topLevelProgress, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_contentItem, 0);
}

@end
