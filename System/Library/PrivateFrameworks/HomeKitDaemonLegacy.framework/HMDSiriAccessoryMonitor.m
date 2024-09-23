@implementation HMDSiriAccessoryMonitor

- (HMDSiriAccessoryMonitor)initWithDelegate:(id)a3
{
  id v4;
  HMDSiriAccessoryMonitor *v5;
  HMDSiriAccessoryMonitor *v6;
  uint64_t v7;
  NSMapTable *accessories;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HMDSiriAccessoryMonitor;
  v5 = -[HMDSiriAccessoryMonitor init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    accessories = v6->_accessories;
    v6->_accessories = (NSMapTable *)v7;

  }
  return v6;
}

- (id)_getInfoForAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMDSiriAccessoryMonitor accessories](self, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasAnyActiveTargetingAccessories
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[HMDSiriAccessoryMonitor accessories](self, "accessories", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "isActiveAndSupportsDragonSiri") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_accessoriesTargetingAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[HMDSiriAccessoryMonitor accessories](self, "accessories", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        -[HMDSiriAccessoryMonitor accessories](self, "accessories");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v13, "targetsAccessory");
          v14 = (id)objc_claimAutoreleasedReturnValue();

          if (v14 == v4)
            objc_msgSend(v5, "addObject:", v11);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (void)_addAccessory:(id)a3 withTarget:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[HMDSiriAccessoryMonitor accessories](self, "accessories");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDSiriAccessoryInfo infoWithTargetableAccessory:](HMDSiriAccessoryInfo, "infoWithTargetableAccessory:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKey:", v9, v7);
  -[HMDSiriAccessoryMonitor delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "monitor:needsSiriCapabilityForAccessory:", self, v7);

}

- (void)_removeAccessory:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[HMDSiriAccessoryMonitor _getInfoForAccessory:](self, "_getInfoForAccessory:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMDSiriAccessoryMonitor accessories](self, "accessories");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v7);

    if (objc_msgSend(v4, "isActiveAndSupportsDragonSiri"))
    {
      -[HMDSiriAccessoryMonitor delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "monitor:willNotAllowAccessoryForDragonSiri:", self, v7);
      if (!-[HMDSiriAccessoryMonitor hasAnyActiveTargetingAccessories](self, "hasAnyActiveTargetingAccessories"))
        objc_msgSend(v6, "monitorHasNoAccessoriesForDragonSiri:", self);

    }
  }

}

- (void)setTargetableAccessory:(id)a3 withControllers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDSiriAccessoryMonitor _accessoriesTargetingAccessory:](self, "_accessoriesTargetingAccessory:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __66__HMDSiriAccessoryMonitor_setTargetableAccessory_withControllers___block_invoke;
  v35[3] = &unk_1E89A5760;
  v11 = v8;
  v36 = v11;
  objc_msgSend(v9, "objectsPassingTest:", v35);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = v10;
  v33[1] = 3221225472;
  v33[2] = __66__HMDSiriAccessoryMonitor_setTargetableAccessory_withControllers___block_invoke_2;
  v33[3] = &unk_1E89A5760;
  v13 = v7;
  v34 = v13;
  objc_msgSend(v11, "objectsPassingTest:", v33);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v15 = v12;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v30;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v15);
        -[HMDSiriAccessoryMonitor _addAccessory:withTarget:](self, "_addAccessory:withTarget:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v19++), v6);
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v17);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = v14;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        -[HMDSiriAccessoryMonitor _removeAccessory:](self, "_removeAccessory:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v24++), (_QWORD)v25);
      }
      while (v22 != v24);
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v22);
  }

}

- (void)accessory:(id)a3 setSupportsDragonSiri:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[HMDSiriAccessoryMonitor _getInfoForAccessory:](self, "_getInfoForAccessory:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "supportsDragonSiri") != v4)
    {
      objc_msgSend(v7, "setSupportsDragonSiri:", v4);
      if (objc_msgSend(v7, "isActiveAndSupportsDragonSiri"))
      {
        -[HMDSiriAccessoryMonitor delegate](self, "delegate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "monitor:willAllowAccessoryForDragonSiri:", self, v9);

      }
    }
  }

}

- (HMDSiriAccessoryMonitorDelegate)delegate
{
  return (HMDSiriAccessoryMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSMapTable)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_accessories, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __66__HMDSiriAccessoryMonitor_setTargetableAccessory_withControllers___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

uint64_t __66__HMDSiriAccessoryMonitor_setTargetableAccessory_withControllers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

@end
