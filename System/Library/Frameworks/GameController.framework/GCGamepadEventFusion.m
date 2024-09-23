@implementation GCGamepadEventFusion

void __55___GCGamepadEventFusion_initWithConfiguration_sources___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  _GCGamepadEventImpl *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(v5 + 8);
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __55___GCGamepadEventFusion_initWithConfiguration_sources___block_invoke_2;
  v19[3] = &unk_24D2B5818;
  v21 = v5;
  v22 = v6;
  v8 = v4;
  v20 = v8;
  objc_msgSend(v7, "enumerateElementsForSourceAtIndex:withBlock:", v6, v19);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 216) + 8 * *(_QWORD *)(a1 + 40)), a2);
  v9 = -[_GCGamepadEventImpl initWithTimeStamp:inputs:validMask:]([_GCGamepadEventImpl alloc], "initWithTimeStamp:inputs:validMask:", objc_msgSend(v8, "timestamp"), *(_QWORD *)(a1 + 32) + 24, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_getProperty(*(id *)(a1 + 32), sel_observers, 232, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14++) + 16))();
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

void __55___GCGamepadEventFusion_initWithConfiguration_sources___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  id v5;
  int v6;
  int v7;
  float v8;
  float v9;
  float v10;
  float v11;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;

  if (a3 == 1)
    goto LABEL_7;
  if (a3 == 2)
  {
    v5 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 216) + 8 * *(_QWORD *)(a1 + 48));
    v6 = objc_msgSend(v5, "hasValidValueForElement:", a2);
    v7 = objc_msgSend(*(id *)(a1 + 32), "hasValidValueForElement:", a2);
    objc_msgSend(v5, "floatValueForElement:", a2);
    v9 = v8;
    objc_msgSend(*(id *)(a1 + 32), "floatValueForElement:", a2);
    v11 = v10;

    if (v6 != v7 || v9 != v11)
    {
LABEL_7:
      v13 = objc_msgSend(*(id *)(a1 + 32), "hasValidValueForElement:", a2);
      v14 = 1 << a2;
      v15 = *(_QWORD *)(a1 + 40);
      if (v13)
        v16 = *(_QWORD *)(v15 + 16) | v14;
      else
        v16 = *(_QWORD *)(v15 + 16) & ~v14;
      *(_QWORD *)(v15 + 16) = v16;
      objc_msgSend(*(id *)(a1 + 32), "floatValueForElement:", a2);
      *(_DWORD *)(*(_QWORD *)(a1 + 40) + 4 * a2 + 24) = v17;
    }
  }
}

void __46___GCGamepadEventFusion_observeGamepadEvents___block_invoke(uint64_t a1)
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
