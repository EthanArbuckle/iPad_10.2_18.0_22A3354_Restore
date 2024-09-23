@implementation MessageListSearchSectionDataSource

- (MessageListSearchSectionDataSource)initWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  MessageListSearchSectionDataSource *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "section");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchProgressView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "initialLoadCompletedPromise");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutValuesHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "state");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[MessageListSearchSectionDataSource initWithIdentifier:section:collectionView:searchProgressView:messageList:initialLoadCompletedPromise:layoutValuesHelper:state:](self, "initWithIdentifier:section:collectionView:searchProgressView:messageList:initialLoadCompletedPromise:layoutValuesHelper:state:", v5, v6, v7, v8, v9, v10, v11, v12);

  if (v13)
  {
    objc_msgSend(v4, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[MessageListSectionDataSource setDelegate:](v13, "setDelegate:", v14);

    objc_msgSend(v4, "selectionModelProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MessageListSectionDataSource setSelectionModelProvider:](v13, "setSelectionModelProvider:", v15);

  }
  return v13;
}

- (MessageListSearchSectionDataSource)initWithIdentifier:(id)a3 section:(id)a4 collectionView:(id)a5 searchProgressView:(id)a6 messageList:(id)a7 initialLoadCompletedPromise:(id)a8 layoutValuesHelper:(id)a9 state:(id)a10
{
  id v16;
  __CFString *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  MessageListSearchSectionDataSource *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v36;
  id v37;
  id v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id location;
  _QWORD v44[4];
  id v45;
  objc_super v46;

  v16 = a3;
  v17 = (__CFString *)a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v46.receiver = self;
  v46.super_class = (Class)MessageListSearchSectionDataSource;
  v39 = v18;
  v24 = v18;
  v25 = v20;
  v26 = -[MessageListRecentSectionDataSource initWithIdentifier:section:collectionView:messageList:initialLoadCompletedPromise:layoutValuesHelper:state:](&v46, sel_initWithIdentifier_section_collectionView_messageList_initialLoadCompletedPromise_layoutValuesHelper_state_, v16, v17, v24, v20, v21, v22, v23);
  if (!v26)
    goto LABEL_12;
  v38 = v16;
  v27 = (void *)MEMORY[0x1E0DC3640];
  v28 = objc_opt_class();
  v29 = *MEMORY[0x1E0DC48A0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __164__MessageListSearchSectionDataSource_initWithIdentifier_section_collectionView_searchProgressView_messageList_initialLoadCompletedPromise_layoutValuesHelper_state___block_invoke;
  v44[3] = &unk_1E99E1A10;
  v37 = v19;
  v45 = v19;
  objc_msgSend(v27, "registrationWithSupplementaryClass:elementKind:configurationHandler:", v28, v29, v44);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    if (CFSTR("MessageListSectionIndexedSearch") != v17)
    {
      v16 = v38;
      if (CFSTR("MessageListSectionServerSearch") == v17)
        -[MessageListSearchSectionDataSource setServerFooterRegistration:](v26, "setServerFooterRegistration:", v30);
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0DC3640], "registrationWithSupplementaryClass:elementKind:configurationHandler:", objc_opt_class(), v29, &__block_literal_global_6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[MessageListSearchSectionDataSource setIndexedFooterRegistration:](v26, "setIndexedFooterRegistration:", v31);

  }
  else
  {
    -[MessageListSearchSectionDataSource setIndexedFooterRegistration:](v26, "setIndexedFooterRegistration:", v30);
  }
  v16 = v38;
LABEL_9:
  if (_os_feature_enabled_impl())
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v26);
    v36 = (void *)MEMORY[0x1E0DC3640];
    v32 = objc_opt_class();
    v33 = *MEMORY[0x1E0DC48A8];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __164__MessageListSearchSectionDataSource_initWithIdentifier_section_collectionView_searchProgressView_messageList_initialLoadCompletedPromise_layoutValuesHelper_state___block_invoke_3;
    v40[3] = &unk_1E99E1A78;
    objc_copyWeak(&v42, &location);
    v41 = v22;
    objc_msgSend(v36, "registrationWithSupplementaryClass:elementKind:configurationHandler:", v32, v33, v40);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[MessageListSearchSectionDataSource setHeaderRegistration:](v26, "setHeaderRegistration:", v34);

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
    v16 = v38;
  }

  v19 = v37;
LABEL_12:

  return v26;
}

void __164__MessageListSearchSectionDataSource_initWithIdentifier_section_collectionView_searchProgressView_messageList_initialLoadCompletedPromise_layoutValuesHelper_state___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "removeFromSuperview");
  objc_msgSend(v4, "addSubview:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*(id *)(a1 + 32), "mf_pinToView:usingLayoutMargins:", v4, 1);

}

void __164__MessageListSearchSectionDataSource_initWithIdentifier_section_collectionView_searchProgressView_messageList_initialLoadCompletedPromise_layoutValuesHelper_state___block_invoke_3(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "section");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MUITitleFromSection(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTitle:", v6);

    objc_msgSend(v7, "setLayoutValuesHelper:", *(_QWORD *)(a1 + 32));
  }

}

- (BOOL)hasSupplementaryViewOfKind:(id)a3
{
  id v4;
  BOOL v5;
  __CFString *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC48A0]) & 1) != 0)
  {
    v5 = 1;
  }
  else if (_os_feature_enabled_impl()
         && objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0DC48A8]))
  {
    -[MessageListSectionDataSource section](self, "section");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v5 = v6 == CFSTR("MessageListSectionServerSearch");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldShowSupplementaryViewOfKindIfEmpty:(id)a3 isIndexing:(BOOL)a4
{
  id v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;

  v6 = a3;
  v7 = *MEMORY[0x1E0DC48A0];
  if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0DC48A0])
    && (-[MessageListSectionDataSource section](self, "section"),
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8 == CFSTR("MessageListSectionServerSearch")))
  {
    a4 = 1;
  }
  else if (objc_msgSend(v6, "isEqualToString:", v7))
  {
    -[MessageListSectionDataSource section](self, "section");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v9 != CFSTR("MessageListSectionIndexedSearch"))
      a4 = 0;

  }
  else
  {
    a4 = 0;
  }

  return a4;
}

- (id)configuredReusableSupplementaryViewForCollectionView:(id)a3 elementKind:(id)a4 indexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  __CFString *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC48A0]))
  {
    -[MessageListSectionDataSource section](self, "section");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v11 == CFSTR("MessageListSectionIndexedSearch"))
      -[MessageListSearchSectionDataSource indexedFooterRegistration](self, "indexedFooterRegistration");
    else
      -[MessageListSearchSectionDataSource serverFooterRegistration](self, "serverFooterRegistration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if (_os_feature_enabled_impl()
    && objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0DC48A8]))
  {
    -[MessageListSearchSectionDataSource headerRegistration](self, "headerRegistration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    objc_msgSend(v8, "dequeueConfiguredReusableSupplementaryViewWithRegistration:forIndexPath:", v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (UICollectionViewSupplementaryRegistration)indexedFooterRegistration
{
  return self->_indexedFooterRegistration;
}

- (void)setIndexedFooterRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_indexedFooterRegistration, a3);
}

- (UICollectionViewSupplementaryRegistration)serverFooterRegistration
{
  return self->_serverFooterRegistration;
}

- (void)setServerFooterRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_serverFooterRegistration, a3);
}

- (UICollectionViewSupplementaryRegistration)headerRegistration
{
  return self->_headerRegistration;
}

- (void)setHeaderRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_headerRegistration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerRegistration, 0);
  objc_storeStrong((id *)&self->_serverFooterRegistration, 0);
  objc_storeStrong((id *)&self->_indexedFooterRegistration, 0);
}

@end
