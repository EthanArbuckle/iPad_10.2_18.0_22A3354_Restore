@implementation BLSHDefaultsObserver

- (BLSHDefaultsObserver)init
{
  BLSHDefaultsObserver *v2;
  uint64_t v3;
  NSUserDefaults *observedDefaults;
  uint64_t v5;
  NSMapTable *handlers;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;
  void *v20;
  void *v21;
  _QWORD v22[2];
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)BLSHDefaultsObserver;
  v2 = -[BLSHDefaultsObserver init](&v19, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.BacklightServices"));
    observedDefaults = v2->_observedDefaults;
    v2->_observedDefaults = (NSUserDefaults *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 258, 512, 4);
    handlers = v2->_handlers;
    v2->_handlers = (NSMapTable *)v5;

    objc_msgSend(MEMORY[0x24BE0B810], "alwaysFillFlipbook");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLSHDefaultsObserver addHandlerForKey:attributes:](v2, "addHandlerForKey:attributes:", CFSTR("alwaysFillFlipbook"), v8);

    objc_msgSend(MEMORY[0x24BE0B8D0], "disableWatchdogs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLSHDefaultsObserver addHandlerForKey:attributes:](v2, "addHandlerForKey:attributes:", CFSTR("backlightWatchdogsDisabled"), v10);

    objc_msgSend(MEMORY[0x24BE0B8E0], "disableFlipbook");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v11;
    objc_msgSend(MEMORY[0x24BE0B950], "pauseOnSystemSleep");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLSHDefaultsObserver addHandlerForKey:attributes:](v2, "addHandlerForKey:attributes:", CFSTR("disableFlipbook"), v13);

    objc_msgSend(MEMORY[0x24BE0B9B0], "transparentFlipbook");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLSHDefaultsObserver addHandlerForKey:attributes:](v2, "addHandlerForKey:attributes:", CFSTR("transparentFlipbook"), v15);

    objc_msgSend(MEMORY[0x24BE0B968], "usePseudoFlipbook");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BLSHDefaultsObserver addHandlerForKey:attributes:](v2, "addHandlerForKey:attributes:", CFSTR("usePseudoFlipbook"), v17);

  }
  return v2;
}

- (void)addHandlerForKey:(id)a3 attributes:(id)a4
{
  NSMapTable *handlers;
  void *v7;
  id v8;

  handlers = self->_handlers;
  v8 = a3;
  +[BLSHDefaultHandler handlerForKey:attributes:](BLSHDefaultHandler, "handlerForKey:attributes:", v8, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](handlers, "setObject:forKey:", v7, v8);

  -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_observedDefaults, "addObserver:forKeyPath:options:context:", self, v8, 5, v8);
}

- (void)dealloc
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_2145AC000, MEMORY[0x24BDACB70], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2_0();
}

- (void)invalidate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[BLSHDefaultsObserver setInvalidated:](self, "setInvalidated:", 1);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  NSAllMapTableValues(self->_handlers);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "invalidate", (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[NSMapTable objectForKey:](self->_handlers, "objectForKey:", a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 && !-[BLSHDefaultsObserver invalidated](self, "invalidated"))
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = objc_msgSend(v14, "BOOLValue");
    else
      v15 = 0;
    objc_msgSend(v13, "updateForNewValue:", v15);

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)BLSHDefaultsObserver;
    -[BLSHDefaultsObserver observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_observedDefaults, 0);
}

@end
