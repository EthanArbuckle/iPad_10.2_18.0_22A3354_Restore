@implementation GCHIDEventSubject

void __38___GCHIDEventSubject_publishHIDEvent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
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
  v3 = a3;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
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
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

void __50___GCHIDEventSubject_observeHIDEvents_forService___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v5, "mutableCopy");

  if (!v9)
    v9 = objc_alloc_init((Class)&off_254DEBB20);
  v6 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  objc_msgSend(v9, "addObject:", v6);

  v7 = *(void **)(a1 + 32);
  v8 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v7, "setObject:forKey:", v8, v4);

}

void __50___GCHIDEventSubject_observeHIDEvents_forService___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  id v13;
  uint64_t v14;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "mutableCopy");
  v9 = MEMORY[0x24BDAC760];
  v11 = __50___GCHIDEventSubject_observeHIDEvents_forService___block_invoke_3;
  v12 = &unk_24D2B2FE0;
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v10 = 3221225472;
  v13 = v2;
  v14 = v3;
  v5 = v2;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v9);
  v6 = objc_msgSend(v5, "copy", v9, v10, v11, v12);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  *(_QWORD *)(v7 + 16) = v6;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

void __50___GCHIDEventSubject_observeHIDEvents_forService___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    v8 = (void *)objc_msgSend(v5, "mutableCopy");
    v9 = (void *)MEMORY[0x2199DEBB0](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(v8, "removeObject:", v9);

    v10 = *(void **)(a1 + 32);
    v11 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v10, "setObject:forKey:", v11, v12);

  }
}

@end
