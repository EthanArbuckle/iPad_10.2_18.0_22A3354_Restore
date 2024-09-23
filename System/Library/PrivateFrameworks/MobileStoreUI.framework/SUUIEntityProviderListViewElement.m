@implementation SUUIEntityProviderListViewElement

- (SUUIEntityProviderListViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  SUUIEntityProviderListViewElement *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDictionary *entityProviders;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)SUUIEntityProviderListViewElement;
  v5 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v21, sel_initWithDOMElement_parent_elementFactory_, a3, a4, a5);
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[SUUIEntityProviderListViewElement children](v5, "children", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v12, "elementID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "length") && objc_msgSend(v12, "conformsToProtocol:", &unk_257264D28))
            objc_msgSend(v6, "setObject:forKey:", v12, v13);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v9);
    }

    v14 = objc_msgSend(v6, "copy");
    entityProviders = v5->_entityProviders;
    v5->_entityProviders = (NSDictionary *)v14;

  }
  return v5;
}

- (id)entityProviderWithIdentifier:(id)a3
{
  return -[NSDictionary objectForKey:](self->_entityProviders, "objectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityProviders, 0);
}

@end
