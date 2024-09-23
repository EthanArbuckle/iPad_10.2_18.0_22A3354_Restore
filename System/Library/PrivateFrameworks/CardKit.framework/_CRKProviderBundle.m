@implementation _CRKProviderBundle

- (id)provider
{
  void *v3;
  void *v4;

  v3 = (void *)-[_CRKProviderBundle principalClass](self, "principalClass");
  if (!self->_provider)
  {
    v4 = v3;
    if (objc_msgSend(v3, "conformsToProtocol:", &unk_25504DD20))
      -[_CRKProviderBundle _initializeProviderWithClass:](self, "_initializeProviderWithClass:", v4);
  }
  return self->_provider;
}

- (void)_initializeProviderWithClass:(Class)a3
{
  os_log_t *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  CRKProviding *v8;
  CRKProviding *provider;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  Class v17;
  int v18;
  os_log_t v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  _CRKProviderBundle *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = (os_log_t *)MEMORY[0x24BE15490];
  v5 = (void *)*MEMORY[0x24BE15490];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE15490], OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    NSStringFromClass(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v34 = v7;
    _os_log_impl(&dword_218FCB000, v6, OS_LOG_TYPE_INFO, "Initializing a provider of class %@", buf, 0xCu);

  }
  v8 = (CRKProviding *)objc_alloc_init(a3);
  provider = self->_provider;
  self->_provider = v8;

  -[_CRKProviderBundle infoDictionary](self, "infoDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("Card section view controller classes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26 = v11;
    v27 = v10;
    v12 = v11;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v30;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v12);
          v17 = NSClassFromString(*(NSString **)(*((_QWORD *)&v29 + 1) + 8 * v16));
          v18 = -[objc_class isSubclassOfClass:](v17, "isSubclassOfClass:", objc_opt_class());
          v19 = *v4;
          if (v18)
          {
            if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
            {
              v20 = v19;
              NSStringFromClass(v17);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v34 = v21;
              v35 = 2112;
              v36 = self;
              _os_log_impl(&dword_218FCB000, v20, OS_LOG_TYPE_INFO, "Registering card section view controller %@ for plugin bundle %@", buf, 0x16u);

            }
            -[objc_class _registerWithCardKit](v17, "_registerWithCardKit", v26, v27);
          }
          else if (os_log_type_enabled(*v4, OS_LOG_TYPE_ERROR))
          {
            v22 = v19;
            NSStringFromClass(v17);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = (objc_class *)objc_opt_class();
            NSStringFromClass(v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v34 = v23;
            v35 = 2112;
            v36 = self;
            v37 = 2112;
            v38 = v25;
            _os_log_error_impl(&dword_218FCB000, v22, OS_LOG_TYPE_ERROR, "Cannot register card section view controller %@ for plugin bundle %@ as it is not a subclass of %@", buf, 0x20u);

          }
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
      }
      while (v14);
    }

    v11 = v26;
    v10 = v27;
  }

}

- (NSString)providerIdentifier
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  objc_class *v6;
  void *v7;

  -[_CRKProviderBundle bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), CFSTR("com.apple.cardkitbundleprovider."), v7);
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (void)requestCardSectionViewProviderForCard:(id)a3 delegate:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[_CRKProviderBundle provider](self, "provider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[_CRKProviderBundle provider](self, "provider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "requestCardSectionViewProviderForCard:delegate:reply:", v13, v8, v9);

  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }

}

- (void)requestIdentifiedCardSectionViewProviderForCard:(id)a3 delegate:(id)a4 reply:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  _QWORD v14[5];
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    -[_CRKProviderBundle provider](self, "provider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[_CRKProviderBundle provider](self, "provider");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __85___CRKProviderBundle_requestIdentifiedCardSectionViewProviderForCard_delegate_reply___block_invoke;
      v14[3] = &unk_24DA4D390;
      v14[4] = self;
      v15 = v10;
      objc_msgSend(v13, "requestCardSectionViewProviderForCard:delegate:reply:", v8, v9, v14);

    }
    else
    {
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
    }
  }

}

- (id)cardViewControllerForCard:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[_CRKProviderBundle provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[_CRKProviderBundle provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cardViewControllerForCard:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)unregisterCardViewController:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  -[_CRKProviderBundle provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[_CRKProviderBundle provider](self, "provider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unregisterCardViewController:", v7);

  }
}

- (unint64_t)displayPriorityForCard:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  -[_CRKProviderBundle provider](self, "provider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[_CRKProviderBundle provider](self, "provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "displayPriorityForCard:", v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)presentation:(id)a3 didApplyCardSectionViewSource:(id)a4 toCardViewController:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  -[_CRKProviderBundle provider](self, "provider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[_CRKProviderBundle provider](self, "provider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentation:didApplyCardSectionViewSource:toCardViewController:", v13, v8, v9);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
}

@end
