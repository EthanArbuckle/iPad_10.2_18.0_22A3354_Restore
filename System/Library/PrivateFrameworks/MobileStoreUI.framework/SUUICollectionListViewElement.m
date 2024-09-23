@implementation SUUICollectionListViewElement

- (SUUICollectionListViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  SUUICollectionListViewElement *v5;
  SUUICollectionListViewElement *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)SUUICollectionListViewElement;
  v5 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v17, sel_initWithDOMElement_parent_elementFactory_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    v15 = 0u;
    v16 = 0u;
    v14 = 0u;
    -[SUUICollectionListViewElement children](v5, "children", 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            NSLog(CFSTR("OMG SEARCH IN A COLLECTION"));
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v9);
    }

  }
  return v6;
}

- (SUUISearchBarViewElement)searchHeader
{
  return self->_searchHeader;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchHeader, 0);
}

@end
