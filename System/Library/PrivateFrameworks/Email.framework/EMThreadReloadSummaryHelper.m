@implementation EMThreadReloadSummaryHelper

- (id)summariesToReloadForChanges:(id)a3 mailboxScope:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__EMThreadReloadSummaryHelper_summariesToReloadForChanges_mailboxScope___block_invoke;
  v13[3] = &unk_1E70F35A8;
  v8 = v6;
  v14 = v8;
  v9 = v7;
  v15 = v9;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v13);
  v10 = v15;
  v11 = v9;

  return v11;
}

void __72__EMThreadReloadSummaryHelper_summariesToReloadForChanges_mailboxScope___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  EMMessageObjectID *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "displayMessageItemID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v9, "summary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v6)
    {
      objc_msgSend(v9, "displayMessageItemID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[EMMessageObjectID initWithCollectionItemID:mailboxScope:]([EMMessageObjectID alloc], "initWithCollectionItemID:mailboxScope:", v7, *(_QWORD *)(a1 + 32));
      if (v8)
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

    }
  }

}

@end
