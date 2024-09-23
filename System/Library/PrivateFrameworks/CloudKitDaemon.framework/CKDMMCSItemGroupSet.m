@implementation CKDMMCSItemGroupSet

- (CKDMMCSItemGroupSet)init
{
  CKDMMCSItemGroupSet *v2;
  uint64_t v3;
  NSMutableDictionary *itemsByGroupTuple;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKDMMCSItemGroupSet;
  v2 = -[CKDMMCSItemGroupSet init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    itemsByGroupTuple = v2->_itemsByGroupTuple;
    v2->_itemsByGroupTuple = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (CKDMMCSItemGroupSet)initWithItems:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  CKDMMCSItemGroupSet *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v7 = (CKDMMCSItemGroupSet *)objc_msgSend_init(self, v5, v6);
  if (v7)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v4;
    v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v16, v20, 16);
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v8);
          objc_msgSend_addItem_(v7, v11, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14++), (_QWORD)v16);
        }
        while (v12 != v14);
        v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v16, v20, 16);
      }
      while (v12);
    }

  }
  return v7;
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  void *v3;
  void *v4;
  const char *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_allItemGroups(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("itemGroups=%@"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  return (id)((uint64_t (*)(CKDMMCSItemGroupSet *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

- (NSError)error
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend_allItemGroups(self, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v24, v28, 16);
  if (v8)
  {
    v11 = v8;
    v12 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend_error(v14, v9, v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend_error(v14, v9, v10);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v3, v17, (uint64_t)v16);

        }
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v24, v28, 16);
    }
    while (v11);
  }

  if (objc_msgSend_count(v3, v18, v19))
  {
    objc_msgSend_anyObject(v3, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  return (NSError *)v22;
}

- (id)allItemGroups
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_itemsByGroupTuple(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)addItem:(id)a3
{
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  CKDMMCSItemGroup *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  id v18;

  v18 = a3;
  objc_msgSend_tupleForItem_(CKDMMCSItemGroup, v4, (uint64_t)v18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_itemsByGroupTuple(self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v12 = [CKDMMCSItemGroup alloc];
    v10 = (void *)objc_msgSend_initWithTuple_(v12, v13, (uint64_t)v5);
    objc_msgSend_itemsByGroupTuple(self, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v16, v17, (uint64_t)v10, v5);

  }
  objc_msgSend_addItem_(v10, v11, (uint64_t)v18);

}

- (void)setCloneContext:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a3;
  if (v8)
  {
    objc_msgSend_itemsByGroupTuple(self, v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1BEB9F0EC;
    v9[3] = &unk_1E7835F88;
    v10 = v8;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v6, v7, (uint64_t)v9);

  }
}

- (NSMutableDictionary)itemsByGroupTuple
{
  return self->_itemsByGroupTuple;
}

- (void)setItemsByGroupTuple:(id)a3
{
  objc_storeStrong((id *)&self->_itemsByGroupTuple, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsByGroupTuple, 0);
}

@end
