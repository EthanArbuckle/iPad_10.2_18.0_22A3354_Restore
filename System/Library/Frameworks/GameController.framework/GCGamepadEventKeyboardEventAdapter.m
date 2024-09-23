@implementation GCGamepadEventKeyboardEventAdapter

void __68___GCGamepadEventKeyboardEventAdapter_initWithConfiguration_source___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  float v7;
  _GCGamepadEventImpl *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _OWORD v19[12];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  memset(v19, 0, sizeof(v19));
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "gamepadElementForUsagePage:usage:", objc_msgSend(v3, "usagePage"), objc_msgSend(v3, "usage"));
  if (v4 <= 0x2E)
  {
    v5 = v4;
    v6 = objc_msgSend(v3, "down");
    v7 = 0.0;
    if (v6 > 0)
      v7 = 1.0;
    *((float *)v19 + v5) = v7;
    v18 = 1 << v5;
    v8 = -[_GCGamepadEventImpl initWithTimeStamp:inputs:validMask:]([_GCGamepadEventImpl alloc], "initWithTimeStamp:inputs:validMask:", objc_msgSend(v3, "timestamp"), v19, 1 << v5);
    objc_getProperty(*(id *)(a1 + 32), sel_observers, 24, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++) + 16))();
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v11);
    }

  }
}

void __60___GCGamepadEventKeyboardEventAdapter_observeGamepadEvents___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(a1 + 40));
  v4 = objc_msgSend(v2, "containsObject:", v3);

  if (v4)
  {
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "observers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "mutableCopy");

      v7 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(a1 + 40));
      objc_msgSend(v6, "removeObject:", v7);

      objc_msgSend(*(id *)(a1 + 32), "setObservers:", v6);
      objc_msgSend(*(id *)(a1 + 32), "observers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(a1 + 40));
      v10 = objc_msgSend(v8, "containsObject:", v9);

    }
    while ((v10 & 1) != 0);
  }
}

@end
