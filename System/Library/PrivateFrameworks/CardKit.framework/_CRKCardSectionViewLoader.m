@implementation _CRKCardSectionViewLoader

- (_CRKCardSectionViewLoader)init
{
  _CRKCardSectionViewLoader *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *cardSectionViewConfigurationsByCardSectionIdentifiersByProviderIdentifiers;
  NSMutableSet *v5;
  NSMutableSet *identifiedCardSectionViewProviders;
  NSMutableDictionary *v7;
  NSMutableDictionary *vetoingProviderIdentifiersByVetoedCardSectionIdentifiers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_CRKCardSectionViewLoader;
  v2 = -[_CRKCardSectionViewLoader init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cardSectionViewConfigurationsByCardSectionIdentifiersByProviderIdentifiers = v2->_cardSectionViewConfigurationsByCardSectionIdentifiersByProviderIdentifiers;
    v2->_cardSectionViewConfigurationsByCardSectionIdentifiersByProviderIdentifiers = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    identifiedCardSectionViewProviders = v2->_identifiedCardSectionViewProviders;
    v2->_identifiedCardSectionViewProviders = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    vetoingProviderIdentifiersByVetoedCardSectionIdentifiers = v2->_vetoingProviderIdentifiersByVetoedCardSectionIdentifiers;
    v2->_vetoingProviderIdentifiersByVetoedCardSectionIdentifiers = v7;

  }
  return v2;
}

- (void)_loadIdentifiedCardSectionViewProvidersFromCard:(id)a3 identifiedProviders:(id)a4 delegate:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  _QWORD block[4];
  id v25;
  id v26;
  _QWORD *v27;
  id v28;
  _QWORD v29[5];
  NSObject *v30;
  _QWORD *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id location;
  _QWORD v38[3];
  char v39;
  uint8_t v40[128];
  uint8_t buf[4];
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v21 = a4;
  v22 = a5;
  v11 = a6;
  v12 = v11;
  v23 = v10;
  if (v10)
  {
    v20 = v11;
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v39 = 0;
    objc_initWeak(&location, self);
    v13 = dispatch_group_create();
    v14 = *MEMORY[0x24BE15490];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v10;
      _os_log_impl(&dword_218FCB000, v14, OS_LOG_TYPE_DEFAULT, "Loading card section view providers for card\n    Card: %@", buf, 0xCu);
    }
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v15 = v21;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v34 != v17)
            objc_enumerationMutation(v15);
          v19 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            dispatch_group_enter(v13);
            v29[0] = MEMORY[0x24BDAC760];
            v29[1] = 3221225472;
            v29[2] = __117___CRKCardSectionViewLoader__loadIdentifiedCardSectionViewProvidersFromCard_identifiedProviders_delegate_completion___block_invoke;
            v29[3] = &unk_24DA4D468;
            objc_copyWeak(&v32, &location);
            v29[4] = v19;
            v31 = v38;
            v30 = v13;
            objc_msgSend(v19, "requestIdentifiedCardSectionViewProviderForCard:delegate:reply:", v23, v22, v29);

            objc_destroyWeak(&v32);
          }
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v40, 16);
      }
      while (v16);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __117___CRKCardSectionViewLoader__loadIdentifiedCardSectionViewProvidersFromCard_identifiedProviders_delegate_completion___block_invoke_5;
    block[3] = &unk_24DA4D490;
    objc_copyWeak(&v28, &location);
    v25 = v23;
    v26 = v20;
    v27 = v38;
    dispatch_group_notify(v13, MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    _Block_object_dispose(v38, 8);
    v12 = v20;
  }
  else if (v11)
  {
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
  }

}

- (id)viewConfigurationForCardSection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v25;
  uint64_t v26;
  BOOL (*v27)(uint64_t, void *);
  void *v28;
  _CRKCardSectionViewLoader *v29;
  id v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4 && -[_CRKCardSectionViewLoader cardSectionShouldBeDisplayed:](self, "cardSectionShouldBeDisplayed:", v4))
  {
    -[NSMutableSet allObjects](self->_identifiedCardSectionViewProviders, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __61___CRKCardSectionViewLoader_viewConfigurationForCardSection___block_invoke;
    v31[3] = &unk_24DA4D4B8;
    v31[4] = self;
    v7 = v4;
    v32 = v7;
    objc_msgSend(v5, "sortedArrayUsingComparator:", v31);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = v6;
    v26 = 3221225472;
    v27 = __61___CRKCardSectionViewLoader_viewConfigurationForCardSection___block_invoke_14;
    v28 = &unk_24DA4D4E0;
    v29 = self;
    v9 = v7;
    v30 = v9;
    v10 = objc_msgSend(v8, "indexOfObjectWithOptions:passingTest:", 2, &v25);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = *MEMORY[0x24BE15490];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_ERROR))
        -[_CRKCardSectionViewLoader viewConfigurationForCardSection:].cold.1((uint64_t)v9, v11, v12, v13, v14, v15, v16, v17);
      v18 = 0;
    }
    else
    {
      objc_msgSend(v8, "objectAtIndex:", v10, v25, v26, v27, v28, v29);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "providerIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary objectForKey:](self->_cardSectionViewConfigurationsByCardSectionIdentifiersByProviderIdentifiers, "objectForKey:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cardSectionIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKey:", v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = *MEMORY[0x24BE15490];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v34 = v18;
        v35 = 2112;
        v36 = v9;
        v37 = 2112;
        v38 = v20;
        _os_log_impl(&dword_218FCB000, v23, OS_LOG_TYPE_DEFAULT, "Found highest priority view configuration for card section\n    View configuration: %@\n    Card section: %@\n    Provider identifier: %@", buf, 0x20u);
      }

    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)cardSectionShouldBeDisplayed:(id)a3
{
  NSMutableDictionary *vetoingProviderIdentifiersByVetoedCardSectionIdentifiers;
  void *v4;
  void *v5;

  vetoingProviderIdentifiersByVetoedCardSectionIdentifiers = self->_vetoingProviderIdentifiersByVetoedCardSectionIdentifiers;
  objc_msgSend(a3, "cardSectionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](vetoingProviderIdentifiersByVetoedCardSectionIdentifiers, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(vetoingProviderIdentifiersByVetoedCardSectionIdentifiers) = v5 == 0;

  return (char)vetoingProviderIdentifiersByVetoedCardSectionIdentifiers;
}

- (id)_allViewConfigurations
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_cardSectionViewConfigurationsByCardSectionIdentifiersByProviderIdentifiers, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "allValues");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_viewConfigurationForCardSection:(id)a3 providerIdentifier:(id)a4
{
  void *v4;
  NSMutableDictionary *cardSectionViewConfigurationsByCardSectionIdentifiersByProviderIdentifiers;
  id v7;
  void *v8;
  void *v9;

  v4 = 0;
  if (a3 && a4)
  {
    cardSectionViewConfigurationsByCardSectionIdentifiersByProviderIdentifiers = self->_cardSectionViewConfigurationsByCardSectionIdentifiersByProviderIdentifiers;
    v7 = a3;
    -[NSMutableDictionary objectForKey:](cardSectionViewConfigurationsByCardSectionIdentifiersByProviderIdentifiers, "objectForKey:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cardSectionIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKey:", v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (NSMutableSet)identifiedCardSectionViewProviders
{
  return self->_identifiedCardSectionViewProviders;
}

- (_CRKCardSectionViewLoaderDelegate)delegate
{
  return (_CRKCardSectionViewLoaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CRCard)loadedCard
{
  return self->_loadedCard;
}

- (void)setLoadedCard:(id)a3
{
  objc_storeStrong((id *)&self->_loadedCard, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedCard, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifiedCardSectionViewProviders, 0);
  objc_storeStrong((id *)&self->_vetoingProviderIdentifiersByVetoedCardSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_cardSectionViewConfigurationsByCardSectionIdentifiersByProviderIdentifiers, 0);
}

- (void)viewConfigurationForCardSection:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_218FCB000, a2, a3, "Couldn't find a view configuration for card section\n    Card section: %@", a5, a6, a7, a8, 2u);
}

@end
