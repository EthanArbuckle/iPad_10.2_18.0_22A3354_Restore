@implementation GCKeyboardEventHIDAdapter

void __53___GCKeyboardEventHIDAdapter_initWithSource_service___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (IOHIDEventGetType() == 3)
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (!v2 || v2 == IOHIDEventGetSenderID() || IOHIDEventGetSenderID() == -1)
    {
      v3 = (void *)objc_opt_new();
      objc_msgSend(v3, "setTimestamp:", IOHIDEventGetTimeStamp());
      objc_msgSend(v3, "setUsagePage:", IOHIDEventGetIntegerValue());
      objc_msgSend(v3, "setUsage:", IOHIDEventGetIntegerValue());
      objc_msgSend(v3, "setDown:", IOHIDEventGetIntegerValue());
      objc_msgSend(v3, "setSender:", IOHIDEventGetSenderID());
      objc_getProperty(*(id *)(a1 + 40), sel_observers, 24, 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0u;
      v10 = 0u;
      v11 = 0u;
      v12 = 0u;
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v10;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v10 != v7)
              objc_enumerationMutation(v4);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++) + 16))();
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        }
        while (v6);
      }

    }
  }
}

void __52___GCKeyboardEventHIDAdapter_observeKeyboardEvents___block_invoke(uint64_t a1)
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
