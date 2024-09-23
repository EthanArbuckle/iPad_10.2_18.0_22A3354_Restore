@implementation INUICKPCardSectionViewProvider

- (NSString)providerIdentifier
{
  return (NSString *)CFSTR("com.apple.cards.IntentsUICardKitProvider");
}

- (unint64_t)displayPriorityForCardSection:(id)a3
{
  return 1;
}

- (BOOL)vetoDisplayOfCardSection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[INUICKPViewControllerAllocating redundantInterfaceSections](self->_allocator, "redundantInterfaceSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __59__INUICKPCardSectionViewProvider_vetoDisplayOfCardSection___block_invoke;
    v9[3] = &unk_24EB4F288;
    v10 = v4;
    v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", v9);

    v7 = v6 != 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __59__INUICKPCardSectionViewProvider_vetoDisplayOfCardSection___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "cardSection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cardSectionIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cardSectionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

  }
  else
  {
    v10 = 0;
  }
  *a4 = v10;

  return v10;
}

+ (void)requestInstanceFromDefaultAllocatorWithCard:(id)a3 delegate:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  INUICKPSynchronousRemoteViewControllerAllocator *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(INUICKPSynchronousRemoteViewControllerAllocator);
  -[INUICKPSynchronousRemoteViewControllerAllocator setSynchronousRemoteViewControllerClass:](v11, "setSynchronousRemoteViewControllerClass:", objc_opt_class());
  objc_msgSend(a1, "requestInstanceWithCard:delegate:allocator:reply:", v10, v9, v11, v8);

}

+ (void)requestInstanceWithCard:(id)a3 delegate:(id)a4 allocator:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  void (**v28)(_QWORD, _QWORD);
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(_QWORD, _QWORD))v13;
  if (v10)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "interactions");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "anyObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 && v16)
      {
        v17 = objc_alloc_init((Class)objc_opt_class());
        objc_msgSend(v17, "setCardSectionViewProviderDelegate:", v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v18 = objc_msgSend(v11, "cardSectionDisplayRequiresUserConsentForProvider:", v17);
          v19 = (void *)*MEMORY[0x24BE15490];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
          {
            v20 = (void *)MEMORY[0x24BDD16E0];
            v21 = v19;
            objc_msgSend(v20, "numberWithBool:", v18);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v31 = a1;
            v32 = 2112;
            v33 = v11;
            v34 = 2112;
            v35 = v22;
            _os_log_impl(&dword_222C18000, v21, OS_LOG_TYPE_INFO, "%@ respecting delegate %@ preference to require user consent: %@", buf, 0x20u);

          }
        }
        else
        {
          v18 = 1;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "setDelegate:", v17);
        objc_msgSend(v12, "setRequiresUserConsent:", v18);
        INUICKPInterfaceSectionsFromCard(v10);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x24BDAC760];
        v25[1] = 3221225472;
        v25[2] = __83__INUICKPCardSectionViewProvider_requestInstanceWithCard_delegate_allocator_reply___block_invoke;
        v25[3] = &unk_24EB4F2B0;
        v29 = a1;
        v26 = v12;
        v27 = v17;
        v28 = v14;
        v24 = v17;
        objc_msgSend(v26, "performAllocationsFromInteraction:initialInterfaceSections:completion:", v16, v23, v25);

LABEL_17:
        goto LABEL_18;
      }
    }
    else
    {
      v16 = 0;
    }
    if (v14)
      v14[2](v14, 0);
    goto LABEL_17;
  }
  if (v13)
    (*((void (**)(id, _QWORD))v13 + 2))(v13, 0);
LABEL_18:

}

void __83__INUICKPCardSectionViewProvider_requestInstanceWithCard_delegate_allocator_reply___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void (*v4)(void);
  void *v5;

  objc_msgSend(*(id *)(a1 + 56), "_viewConfigurationsFromAllocator:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v5 = v2;
    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 40), "setViewConfigurations:", v2);
      objc_msgSend(*(id *)(a1 + 40), "setAllocator:", *(_QWORD *)(a1 + 32));
      v4 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    }
    else
    {
      v4 = *(void (**)(void))(v3 + 16);
    }
    v4();
    v2 = v5;
  }

}

- (double)boundingWidthForViewControllerAllocator:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  double v7;
  double v8;

  -[INUICKPCardSectionViewProvider cardSectionViewProviderDelegate](self, "cardSectionViewProviderDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0)
    return 0.0;
  -[INUICKPCardSectionViewProvider cardSectionViewProviderDelegate](self, "cardSectionViewProviderDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "boundingWidthForProvider:", self);
  v8 = v7;

  return v8;
}

+ (id)_viewConfigurationsFromAllocator:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  __int128 v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(v3, "allocatedViewControllers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v23;
    *(_QWORD *)&v6 = 138412290;
    v20 = v6;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
        v11 = objc_alloc_init(MEMORY[0x24BE15458]);
        objc_msgSend(v3, "viewControllersByInitialInterfaceSection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "allKeysForObject:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "cardSection");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setCardSection:", v15);

        }
        else
        {
          v16 = *MEMORY[0x24BE15490];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v20;
            v27 = v14;
            _os_log_error_impl(&dword_222C18000, v16, OS_LOG_TYPE_ERROR, "Interface section is not a card interface section\n    Interface section: %@", buf, 0xCu);
          }
        }
        objc_msgSend(v10, "view", v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setCardSectionView:", v17);

        if (objc_msgSend(v10, "conformsToProtocol:", &unk_2557787A0))
          v18 = v10;
        else
          v18 = 0;
        objc_msgSend(v11, "setCardSectionViewController:", v18);
        objc_msgSend(v4, "addObject:", v11);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v7);
  }

  return v4;
}

- (CRCard)card
{
  return self->_card;
}

- (NSArray)viewConfigurations
{
  return self->_viewConfigurations;
}

- (void)setViewConfigurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (INUICKPViewControllerAllocating)allocator
{
  return self->_allocator;
}

- (void)setAllocator:(id)a3
{
  objc_storeStrong((id *)&self->_allocator, a3);
}

- (CRKCardSectionViewProviderDelegate)cardSectionViewProviderDelegate
{
  return (CRKCardSectionViewProviderDelegate *)objc_loadWeakRetained((id *)&self->_cardSectionViewProviderDelegate);
}

- (void)setCardSectionViewProviderDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cardSectionViewProviderDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cardSectionViewProviderDelegate);
  objc_storeStrong((id *)&self->_allocator, 0);
  objc_storeStrong((id *)&self->_viewConfigurations, 0);
  objc_storeStrong((id *)&self->_card, 0);
}

@end
