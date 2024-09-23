@implementation _GCUIInteractionCompatibilityManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_25);
  return (id)sharedInstance_SharedInstance;
}

- (id)_init
{
  objc_super v1;

  if (result)
  {
    v1.receiver = result;
    v1.super_class = (Class)_GCUIInteractionCompatibilityManager;
    return objc_msgSendSuper2(&v1, sel_init);
  }
  return result;
}

- (_GCUIInteractionCompatibilityManager)init
{
  -[_GCUIInteractionCompatibilityManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (BOOL)isEnabled
{
  return self->_installedInteractions != 0;
}

- (void)setEnabled:(BOOL)a3
{
  NSMutableSet *installedInteractions;
  NSMutableSet *v5;
  NSMutableSet *v6;
  void *v7;
  void *v8;
  NSMutableSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSMutableSet *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  installedInteractions = self->_installedInteractions;
  if (a3)
  {
    if (!installedInteractions)
    {
      v5 = (NSMutableSet *)objc_opt_new();
      v6 = self->_installedInteractions;
      self->_installedInteractions = v5;

      +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__windowDidBecomeKey_, *MEMORY[0x24BEBE9D8], 0);

      +[UIWindow _applicationKeyWindow](&off_254E115F8, "_applicationKeyWindow");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v18 = v8;
        -[_GCUIInteractionCompatibilityManager _installInteractionOnWindow:](self, "_installInteractionOnWindow:", v8);
        v8 = v18;
      }

    }
  }
  else if (installedInteractions)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = installedInteractions;
    v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v14, "view");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "removeInteraction:", v14);

        }
        v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

    v16 = self->_installedInteractions;
    self->_installedInteractions = 0;

    +[NSNotificationCenter defaultCenter](&off_254DEC7B0, "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "removeObserver:name:object:", self, *MEMORY[0x24BEBE9D8], 0);

  }
}

- (void)_installInteractionOnWindow:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v16 = a3;
  objc_msgSend(v16, "interactions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = -[NSMutableSet containsObject:](self->_installedInteractions, "containsObject:", v11);
          v13 = v11;
          if (v12)
            v14 = (void *)v8;
          else
            v14 = (void *)v7;
          if (v12)
            v8 = (unint64_t)v13;
          else
            v7 = (unint64_t)v13;

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }

  if (!(v8 | v7))
  {
    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "setHandledEventTypes:", 1);
    -[NSMutableSet addObject:](self->_installedInteractions, "addObject:", v15);
    objc_msgSend(v16, "addInteraction:", v15);

  }
}

- (void)_windowDidBecomeKey:(id)a3
{
  id v4;
  void *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  _GCUIInteractionCompatibilityManager *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_GCUIInteractionCompatibilityManager _installInteractionOnWindow:](self, "_installInteractionOnWindow:", v5);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = self->_installedInteractions;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (!v7)
    {
      v9 = v6;
      goto LABEL_16;
    }
    v8 = v7;
    v14 = self;
    v9 = 0;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          if (!v9)
          {
            +[NSMutableSet set](&off_254DEBF30, "set");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v9, "addObject:", v12);
        }
      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);

    if (v9)
    {
      -[NSMutableSet minusSet:](v14->_installedInteractions, "minusSet:", v9);
LABEL_16:

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedInteractions, 0);
}

@end
