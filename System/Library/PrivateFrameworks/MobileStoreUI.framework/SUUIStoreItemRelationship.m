@implementation SUUIStoreItemRelationship

- (SUUIStoreItemRelationship)initWithParent:(id)a3 andChildren:(id)a4
{
  id v6;
  id v7;
  SUUIStoreItemRelationship *v8;
  uint64_t v9;
  SUUIStoreIdentifier *singleParent;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSSet *chidItems;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)SUUIStoreItemRelationship;
  v8 = -[SUUIStoreItemRelationship init](&v25, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    singleParent = v8->_singleParent;
    v8->_singleParent = (SUUIStoreIdentifier *)v9;

    v11 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16), "copy", (_QWORD)v21);
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v14);
    }

    v18 = objc_msgSend(v11, "copy");
    chidItems = v8->_chidItems;
    v8->_chidItems = (NSSet *)v18;

  }
  return v8;
}

- (SUUIStoreIdentifier)singleParent
{
  return self->_singleParent;
}

- (NSSet)chidItems
{
  return self->_chidItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chidItems, 0);
  objc_storeStrong((id *)&self->_singleParent, 0);
}

@end
