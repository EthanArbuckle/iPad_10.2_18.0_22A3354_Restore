@implementation NAMutableTreeNode

- (void)setChildNodes:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NATreeNode internalChildNodes](self, "internalChildNodes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSet:", v4);

}

- (void)addChild:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NATreeNode internalChildNodes](self, "internalChildNodes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_safeAddObject:", v4);

}

- (void)addChildren:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__NAMutableTreeNode_addChildren___block_invoke;
  v3[3] = &unk_1E6227D18;
  v3[4] = self;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v3);
}

uint64_t __33__NAMutableTreeNode_addChildren___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addChild:", a2);
}

- (void)removeChild:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NATreeNode internalChildNodes](self, "internalChildNodes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)removeChildrenPassingTest:(id)a3
{
  unsigned int (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (unsigned int (**)(id, void *))a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NATreeNode shallowNodeEnumerator](self, "shallowNodeEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (v4[2](v4, v10))
          -[NAMutableTreeNode removeChild:](self, "removeChild:", v10);
        else
          objc_msgSend(v10, "removeChildrenPassingTest:", v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

@end
