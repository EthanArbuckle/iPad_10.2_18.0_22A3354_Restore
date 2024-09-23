@implementation _CDSpotlightCoalescedDeletionOperation

- (_CDSpotlightCoalescedDeletionOperation)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _CDSpotlightCoalescedDeletionOperation *v7;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = -[_CDSpotlightCoalescedDeletionOperation initWithBundleIdToIdentifiers:bundleIdToCompletionBlocks:bundleIdToDomainIdentifiers:bundleIdToDomainCompletionBlocks:](self, "initWithBundleIdToIdentifiers:bundleIdToCompletionBlocks:bundleIdToDomainIdentifiers:bundleIdToDomainCompletionBlocks:", v3, v4, v5, v6);

  return v7;
}

- (_CDSpotlightCoalescedDeletionOperation)initWithBundleIdToIdentifiers:(id)a3 bundleIdToCompletionBlocks:(id)a4 bundleIdToDomainIdentifiers:(id)a5 bundleIdToDomainCompletionBlocks:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _CDSpotlightCoalescedDeletionOperation *v15;
  _CDSpotlightCoalescedDeletionOperation *v16;
  uint64_t v17;
  OS_os_transaction *transaction;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_CDSpotlightCoalescedDeletionOperation;
  v15 = -[_CDSpotlightCoalescedDeletionOperation init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_bundleIdToItemIdentifiers, a3);
    objc_storeStrong((id *)&v16->_bundleIdToItemCompletionBlocks, a4);
    objc_storeStrong((id *)&v16->_bundleIdToDomainIdentifiers, a5);
    objc_storeStrong((id *)&v16->_bundleIdToDomainCompletionBlocks, a6);
    v17 = os_transaction_create();
    transaction = v16->_transaction;
    v16->_transaction = (OS_os_transaction *)v17;

  }
  return v16;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *bundleIdToDomainIdentifiers;
  void *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
  {
    v6 = self->_bundleIdToItemIdentifiers;
    bundleIdToDomainIdentifiers = self->_bundleIdToDomainIdentifiers;
  }
  else
  {
    v6 = 0;
    bundleIdToDomainIdentifiers = 0;
  }
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ - itemIdentifierIds: %@, domainIdentifierIds: %@"), v5, v6, bundleIdToDomainIdentifiers);

  return v8;
}

- (BOOL)addDeletion:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  NSMutableDictionary *bundleIdToItemCompletionBlocks;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;

  v4 = a3;
  v5 = v4;
  if (v4)
    v4 = (_QWORD *)v4[1];
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("identifiers")))
  {
    if (v5)
      v6 = v5[2];
    else
      v6 = 0;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_bundleIdToItemIdentifiers, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = (void *)objc_opt_new();
      if (v5)
        v9 = v5[2];
      else
        v9 = 0;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bundleIdToItemIdentifiers, "setObject:forKeyedSubscript:", v8, v9);

    }
    if (v5)
      v10 = v5[2];
    else
      v10 = 0;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_bundleIdToItemCompletionBlocks, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = (void *)objc_opt_new();
      if (v5)
        v13 = v5[2];
      else
        v13 = 0;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bundleIdToItemCompletionBlocks, "setObject:forKeyedSubscript:", v12, v13);

    }
    if (v5)
      v14 = v5[2];
    else
      v14 = 0;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_bundleIdToItemIdentifiers, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");
    if (v5)
      v17 = v5[3];
    else
      v17 = 0;
    objc_msgSend(v15, "unionSet:", v17);
    v18 = objc_msgSend(v15, "count") > v16;
    if (!v5 || !v5[5])
      goto LABEL_24;
    bundleIdToItemCompletionBlocks = self->_bundleIdToItemCompletionBlocks;
    goto LABEL_23;
  }
  if (v5)
    v23 = (void *)v5[1];
  else
    v23 = 0;
  if (!objc_msgSend(v23, "isEqualToString:", CFSTR("domainIdentifiers")))
  {
    v18 = 0;
    goto LABEL_48;
  }
  if (v5)
    v24 = v5[2];
  else
    v24 = 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_bundleIdToDomainIdentifiers, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
    v26 = (void *)objc_opt_new();
    if (v5)
      v27 = v5[2];
    else
      v27 = 0;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bundleIdToDomainIdentifiers, "setObject:forKeyedSubscript:", v26, v27);

  }
  if (v5)
    v28 = v5[2];
  else
    v28 = 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_bundleIdToItemCompletionBlocks, "objectForKeyedSubscript:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v29)
  {
    v30 = (void *)objc_opt_new();
    if (v5)
      v31 = v5[2];
    else
      v31 = 0;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bundleIdToItemCompletionBlocks, "setObject:forKeyedSubscript:", v30, v31);

  }
  if (v5)
    v32 = v5[2];
  else
    v32 = 0;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_bundleIdToDomainIdentifiers, "objectForKeyedSubscript:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v33;
  if (v5)
    v34 = v5[4];
  else
    v34 = 0;
  v18 = objc_msgSend(v33, "addDomainsFromSet:", v34);
  if (v5 && v5[5])
  {
    bundleIdToItemCompletionBlocks = self->_bundleIdToDomainCompletionBlocks;
LABEL_23:
    v20 = (id)v5[2];
    -[NSMutableDictionary objectForKeyedSubscript:](bundleIdToItemCompletionBlocks, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x193FEEAF4](v5[5]);
    objc_msgSend(v21, "addObject:", v22);

  }
LABEL_24:

LABEL_48:
  return v18;
}

- (void)enumerateDeletionPredicatesAndCompletionsWithBlock:(id)a3
{
  id v4;
  uint64_t v5;
  NSMutableDictionary *bundleIdToItemIdentifiers;
  id v7;
  NSMutableDictionary *bundleIdToDomainIdentifiers;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  bundleIdToItemIdentifiers = self->_bundleIdToItemIdentifiers;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __93___CDSpotlightCoalescedDeletionOperation_enumerateDeletionPredicatesAndCompletionsWithBlock___block_invoke;
  v12[3] = &unk_1E26E4FD0;
  v12[4] = self;
  v7 = v4;
  v13 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](bundleIdToItemIdentifiers, "enumerateKeysAndObjectsUsingBlock:", v12);
  bundleIdToDomainIdentifiers = self->_bundleIdToDomainIdentifiers;
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __93___CDSpotlightCoalescedDeletionOperation_enumerateDeletionPredicatesAndCompletionsWithBlock___block_invoke_2;
  v10[3] = &unk_1E26E4FF8;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](bundleIdToDomainIdentifiers, "enumerateKeysAndObjectsUsingBlock:", v10);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_bundleIdToDomainCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_bundleIdToDomainIdentifiers, 0);
  objc_storeStrong((id *)&self->_bundleIdToItemCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_bundleIdToItemIdentifiers, 0);
}

@end
