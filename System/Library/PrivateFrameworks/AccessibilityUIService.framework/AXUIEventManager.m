@implementation AXUIEventManager

+ (id)sharedEventManager
{
  if (sharedEventManager_onceToken != -1)
    dispatch_once(&sharedEventManager_onceToken, &__block_literal_global_0);
  return (id)sharedEventManager__SharedEventManager;
}

void __38__AXUIEventManager_sharedEventManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AXUIEventManager _init]([AXUIEventManager alloc], "_init");
  v1 = (void *)sharedEventManager__SharedEventManager;
  sharedEventManager__SharedEventManager = (uint64_t)v0;

}

- (id)_init
{
  AXUIEventManager *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AXUIEventManager;
  v2 = -[AXUIEventManager init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BE006C8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_laserEnabled = objc_msgSend(v3, "laserEnabled");

  }
  return v2;
}

- (BOOL)_handleUIEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[AXUIEventManager laserEnabled](self, "laserEnabled"))
  {
    _AXUIPointerEventFromHIDEvent((const void *)objc_msgSend(v4, "_hidEvent"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[AXUIEventManager eventHandlers](self, "eventHandlers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "allObjects");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
      {
        v10 = v9;
        v11 = 0;
        v12 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v18 != v12)
              objc_enumerationMutation(v8);
            v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v11 = v11 & 1 | objc_msgSend(v14, "handlePointerEvent:", v5, (_QWORD)v17);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        }
        while (v10);
      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }

    v15 = v11 & 1;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)registerEventHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[AXUIEventManager eventHandlers](self, "eventHandlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIEventManager setEventHandlers:](self, "setEventHandlers:", v6);

  }
  -[AXUIEventManager eventHandlers](self, "eventHandlers");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

}

- (void)unregisterEventHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  -[AXUIEventManager eventHandlers](self, "eventHandlers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

  -[AXUIEventManager eventHandlers](self, "eventHandlers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    -[AXUIEventManager setEventHandlers:](self, "setEventHandlers:", 0);
}

- (NSHashTable)eventHandlers
{
  return self->_eventHandlers;
}

- (void)setEventHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_eventHandlers, a3);
}

- (BOOL)laserEnabled
{
  return self->_laserEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventHandlers, 0);
}

@end
