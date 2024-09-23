@implementation NPKExpressPassesManager

- (NPKExpressPassesManager)init
{
  NPKExpressPassesManager *v2;
  uint64_t v3;
  NSHashTable *observers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NPKExpressPassesManager;
  v2 = -[NPKExpressPassesManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "pk_weakObjectsHashTableUsingPointerPersonality");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

  }
  return v2;
}

- (void)registerObserver:(id)a3
{
  id v4;
  BOOL v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = -[NSHashTable containsObject:](self->_observers, "containsObject:", v4);
    v4 = v6;
    if (!v5)
    {
      -[NSHashTable addObject:](self->_observers, "addObject:", v6);
      v4 = v6;
    }
  }

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = -[NSHashTable containsObject:](self->_observers, "containsObject:", v4);
    v4 = v6;
    if (v5)
    {
      -[NSHashTable removeObject:](self->_observers, "removeObject:", v6);
      v4 = v6;
    }
  }

}

- (void)updateWithExpressPass:(id)a3 siblingExpressPasses:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSArray *v10;
  NSArray *currentPasses;
  id v12;
  id v13;
  NSArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  NSArray *v22;
  NSArray *currentPaymentPasses;
  NSArray *v24;
  NSArray *currentSecureElementPasses;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
    objc_msgSend(v8, "addObject:", v6);
  v32 = v6;
  if (v7)
    objc_msgSend(v9, "addObjectsFromArray:", v7);
  v10 = (NSArray *)objc_msgSend(v9, "copy", v7);
  currentPasses = self->_currentPasses;
  self->_currentPasses = v10;

  v12 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v14 = self->_currentPasses;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v38 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v19, "paymentPass");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "safelyAddObject:", v20);

        objc_msgSend(v19, "secureElementPass");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "safelyAddObject:", v21);

      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v16);
  }

  v22 = (NSArray *)objc_msgSend(v12, "copy");
  currentPaymentPasses = self->_currentPaymentPasses;
  self->_currentPaymentPasses = v22;

  v24 = (NSArray *)objc_msgSend(v13, "copy");
  currentSecureElementPasses = self->_currentSecureElementPasses;
  self->_currentSecureElementPasses = v24;

  -[NSHashTable allObjects](self->_observers, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v34 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "passesDataSourceDidReloadPasses:", self);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v28);
  }

}

- (BOOL)shouldAllowMovingItemAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  return 0;
}

- (id)defaultPaymentPass
{
  return 0;
}

- (id)expiredPasses
{
  return 0;
}

- (id)passForUniqueID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__13;
  v16 = __Block_byref_object_dispose__13;
  v17 = 0;
  -[NPKExpressPassesManager passes](self, "passes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __43__NPKExpressPassesManager_passForUniqueID___block_invoke;
  v9[3] = &unk_24CFE7C48;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __43__NPKExpressPassesManager_passForUniqueID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)dynamicStateForPass:(id)a3
{
  return 0;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSArray)currentPasses
{
  return self->_currentPasses;
}

- (void)setCurrentPasses:(id)a3
{
  objc_storeStrong((id *)&self->_currentPasses, a3);
}

- (NSArray)currentPaymentPasses
{
  return self->_currentPaymentPasses;
}

- (void)setCurrentPaymentPasses:(id)a3
{
  objc_storeStrong((id *)&self->_currentPaymentPasses, a3);
}

- (NSArray)currentSecureElementPasses
{
  return self->_currentSecureElementPasses;
}

- (void)setCurrentSecureElementPasses:(id)a3
{
  objc_storeStrong((id *)&self->_currentSecureElementPasses, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSecureElementPasses, 0);
  objc_storeStrong((id *)&self->_currentPaymentPasses, 0);
  objc_storeStrong((id *)&self->_currentPasses, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
