@implementation CRKClassKitPersonaAdopter

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend((id)objc_opt_class(), "currentUserProviderObservedKeyPaths");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[CRKClassKitCurrentUserProvider removeObserver:forKeyPath:context:](self->_currentUserProvider, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), CFSTR("CRKClassKitPersonaAdopterKVOContext"));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[CRKClassKitPersonaAdopter callStashedBlocks](self, "callStashedBlocks");
  v8.receiver = self;
  v8.super_class = (Class)CRKClassKitPersonaAdopter;
  -[CRKClassKitPersonaAdopter dealloc](&v8, sel_dealloc);
}

- (CRKClassKitPersonaAdopter)initWithClassKitFacade:(id)a3 personaBlockPerformer:(id)a4
{
  id v6;
  id v7;
  CRKClassKitPersonaAdopter *v8;
  uint64_t v9;
  NSMutableArray *stashedBlocks;
  CRKClassKitCurrentUserProvider *v11;
  CRKClassKitCurrentUserProvider *currentUserProvider;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)CRKClassKitPersonaAdopter;
  v8 = -[CRKClassKitPersonaAdopter init](&v23, sel_init);
  if (v8)
  {
    v9 = objc_opt_new();
    stashedBlocks = v8->_stashedBlocks;
    v8->_stashedBlocks = (NSMutableArray *)v9;

    objc_storeStrong((id *)&v8->_personaBlockPerformer, a4);
    v11 = -[CRKClassKitCurrentUserProvider initWithClassKitFacade:]([CRKClassKitCurrentUserProvider alloc], "initWithClassKitFacade:", v6);
    currentUserProvider = v8->_currentUserProvider;
    v8->_currentUserProvider = v11;

    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend((id)objc_opt_class(), "currentUserProviderObservedKeyPaths", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          -[CRKClassKitCurrentUserProvider addObserver:forKeyPath:options:context:](v8->_currentUserProvider, "addObserver:forKeyPath:options:context:", v8, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v17++), 0, CFSTR("CRKClassKitPersonaAdopterKVOContext"));
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v15);
    }

    -[CRKClassKitPersonaAdopter currentUserChanged](v8, "currentUserChanged");
  }

  return v8;
}

- (void)performBlockWithClassKitPersona:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BDD17F0];
  v6 = a3;
  if ((objc_msgSend(v5, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassKitPersonaAdopter.m"), 71, CFSTR("%@ must be called from the main thread"), v10);

  }
  -[CRKClassKitPersonaAdopter stashedBlocks](self, "stashedBlocks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x219A226E8](v6);

  objc_msgSend(v7, "addObject:", v8);
  -[CRKClassKitPersonaAdopter callStashedBlocksIfPersonaFetched](self, "callStashedBlocksIfPersonaFetched");
}

- (void)callStashedBlocksIfPersonaFetched
{
  if (-[CRKClassKitPersonaAdopter personaFetched](self, "personaFetched"))
    -[CRKClassKitPersonaAdopter callStashedBlocks](self, "callStashedBlocks");
}

- (void)callStashedBlocks
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[CRKClassKitPersonaAdopter stashedBlocks](self, "stashedBlocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[CRKClassKitPersonaAdopter currentPersonaUniqueString](self, "currentPersonaUniqueString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[CRKClassKitPersonaAdopter captureStashedBlocks](self, "captureStashedBlocks", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
          -[CRKClassKitPersonaAdopter personaBlockPerformer](self, "personaBlockPerformer");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "adoptPersonaWithUniqueString:andPerformBlock:", v5, v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

- (BOOL)personaFetched
{
  void *v2;
  char v3;

  -[CRKClassKitPersonaAdopter currentUserProvider](self, "currentUserProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentUserFetched");

  return v3;
}

- (id)captureStashedBlocks
{
  void *v3;
  void *v4;
  void *v5;

  -[CRKClassKitPersonaAdopter stashedBlocks](self, "stashedBlocks");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  -[CRKClassKitPersonaAdopter stashedBlocks](self, "stashedBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

  return v4;
}

+ (id)currentUserProviderObservedKeyPaths
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("currentUserFetched");
  v3[1] = CFSTR("currentUser");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a6 == CFSTR("CRKClassKitPersonaAdopterKVOContext"))
  {
    -[CRKClassKitPersonaAdopter currentUserChanged](self, "currentUserChanged", a3, a4, a5);
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)CRKClassKitPersonaAdopter;
    -[CRKClassKitPersonaAdopter observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)currentUserChanged
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;

  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CRKClassKitPersonaAdopter.m"), 129, CFSTR("%@ must be called from the main thread"), v10);

  }
  -[CRKClassKitPersonaAdopter currentUserProvider](self, "currentUserProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountPersonaUniqueIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();

  -[CRKClassKitPersonaAdopter currentPersonaUniqueString](self, "currentPersonaUniqueString");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6 | v11)
  {
    -[CRKClassKitPersonaAdopter currentPersonaUniqueString](self, "currentPersonaUniqueString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", v11);

    if ((v8 & 1) == 0)
      -[CRKClassKitPersonaAdopter setCurrentPersonaUniqueString:](self, "setCurrentPersonaUniqueString:", v11);
  }
  -[CRKClassKitPersonaAdopter callStashedBlocksIfPersonaFetched](self, "callStashedBlocksIfPersonaFetched");

}

- (NSString)currentPersonaUniqueString
{
  return self->_currentPersonaUniqueString;
}

- (void)setCurrentPersonaUniqueString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CRKPersonaBlockPerforming)personaBlockPerformer
{
  return self->_personaBlockPerformer;
}

- (CRKClassKitCurrentUserProvider)currentUserProvider
{
  return self->_currentUserProvider;
}

- (NSMutableArray)stashedBlocks
{
  return self->_stashedBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stashedBlocks, 0);
  objc_storeStrong((id *)&self->_currentUserProvider, 0);
  objc_storeStrong((id *)&self->_personaBlockPerformer, 0);
  objc_storeStrong((id *)&self->_currentPersonaUniqueString, 0);
}

@end
