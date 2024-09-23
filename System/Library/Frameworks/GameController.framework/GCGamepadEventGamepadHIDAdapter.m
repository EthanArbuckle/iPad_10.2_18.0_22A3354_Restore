@implementation GCGamepadEventGamepadHIDAdapter

void __59___GCGamepadEventGamepadHIDAdapter_initWithSource_service___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _GCGamepadEventHID *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (IOHIDEventGetType() == 35)
  {
    v4 = *(_QWORD *)(a1 + 32);
    if (!v4 || v4 == IOHIDEventGetSenderID() || IOHIDEventGetSenderID() == -1)
    {
      v5 = -[_GCGamepadEventHID initWithHIDEvent:]([_GCGamepadEventHID alloc], "initWithHIDEvent:", a2);
      objc_getProperty(*(id *)(a1 + 40), sel_observers, 24, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 0u;
      v12 = 0u;
      v13 = 0u;
      v14 = 0u;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v12;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v6);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++) + 16))();
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }

    }
  }
}

void __57___GCGamepadEventGamepadHIDAdapter_observeGamepadEvents___block_invoke(uint64_t a1)
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
