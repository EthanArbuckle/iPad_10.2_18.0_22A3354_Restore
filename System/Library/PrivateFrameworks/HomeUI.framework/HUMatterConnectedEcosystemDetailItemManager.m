@implementation HUMatterConnectedEcosystemDetailItemManager

- (HUMatterConnectedEcosystemDetailItemManager)initWithConnectedEcosystem:(id)a3 connectedEcosystemItemProvider:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  HUMatterConnectedEcosystemDetailItemManager *v11;
  HUMatterConnectedEcosystemDetailItemManager *v12;
  void *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HUMatterConnectedEcosystemDetailItemManager;
  v11 = -[HFItemManager initWithDelegate:sourceItem:](&v15, sel_initWithDelegate_sourceItem_, a5, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_connectedEcosystem, a3);
    objc_storeStrong((id *)&v12->_connectedEcosystemItemProvider, a4);
    objc_msgSend(v10, "home");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFItemManager setHome:](v12, "setHome:", v13);

  }
  return v12;
}

- (id)_buildItemProvidersForHome:(id)a3
{
  HUInstructionsItem *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  HUInstructionsItem *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HUMatterConnectedEcosystemDetailItemProvider *v21;
  void *v22;
  void *v23;
  void *v24;
  HUMatterConnectedEcosystemDetailItemProvider *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v4 = [HUInstructionsItem alloc];
  -[HUMatterConnectedEcosystemDetailItemManager connectedEcosystem](self, "connectedEcosystem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vendor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HULocalizedStringWithFormat(CFSTR("HUMatterConnectedEcosystemDetailInfoTitle"), CFSTR("%@"), v8, v9, v10, v11, v12, v13, (uint64_t)v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HUInstructionsItem initWithStyle:title:description:](v4, "initWithStyle:title:description:", 4, v14, 0);
  -[HUMatterConnectedEcosystemDetailItemManager setInstructionsItem:](self, "setInstructionsItem:", v15);

  v16 = objc_alloc(MEMORY[0x1E0D31848]);
  v17 = (void *)MEMORY[0x1E0C99E60];
  -[HUMatterConnectedEcosystemDetailItemManager instructionsItem](self, "instructionsItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithObject:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v16, "initWithItems:", v19);

  v21 = [HUMatterConnectedEcosystemDetailItemProvider alloc];
  -[HUMatterConnectedEcosystemDetailItemManager connectedEcosystem](self, "connectedEcosystem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUMatterConnectedEcosystemDetailItemManager connectedEcosystemItemProvider](self, "connectedEcosystemItemProvider");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItemManager home](self, "home");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[HUMatterConnectedEcosystemDetailItemProvider initWithConnectedEcosystem:connectedEcosystemItemProvider:home:](v21, "initWithConnectedEcosystem:connectedEcosystemItemProvider:home:", v22, v23, v24);

  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31928]), "initWithSourceProvider:transformationBlock:", v25, &__block_literal_global_12);
  -[HUMatterConnectedEcosystemDetailItemManager setConnectedEcosystemAccessoryItemProvider:](self, "setConnectedEcosystemAccessoryItemProvider:", v26);

  v30[0] = v20;
  -[HUMatterConnectedEcosystemDetailItemManager connectedEcosystemAccessoryItemProvider](self, "connectedEcosystemAccessoryItemProvider");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

id __74__HUMatterConnectedEcosystemDetailItemManager__buildItemProvidersForHome___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D31920];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithSourceItem:transformationBlock:", v3, &__block_literal_global_12);

  return v4;
}

id __74__HUMatterConnectedEcosystemDetailItemManager__buildItemProvidersForHome___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v2 = a2;
  v3 = (void *)objc_msgSend(v2, "mutableCopy");
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_opt_class();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30CD8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "serviceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D30D18]);

  v11 = *MEMORY[0x1E0D30C60];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C60]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30C78]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D317C8], "displayIconDescriptorFromIconDescriptor:symbolName:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v11);

  v15 = (void *)objc_msgSend(v6, "copy");
  return v15;
}

- (id)_buildSectionsWithDisplayedItems:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[5];
  id v38;
  _BYTE v39[128];
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D31570]), "initWithIdentifier:", CFSTR("ConnectedEcosystemDetailInstructions"));
  -[HUMatterConnectedEcosystemDetailItemManager instructionsItem](self, "instructionsItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setItems:", v8);

  v31 = v6;
  v32 = v4;
  objc_msgSend(v4, "addObject:", v6);
  -[HUMatterConnectedEcosystemDetailItemManager connectedEcosystemAccessoryItemProvider](self, "connectedEcosystemAccessoryItemProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __80__HUMatterConnectedEcosystemDetailItemManager__buildSectionsWithDisplayedItems___block_invoke;
  v37[3] = &unk_1E6F4D3A0;
  v37[4] = self;
  v12 = v5;
  v38 = v12;
  objc_msgSend(v11, "na_each:", v37);

  -[HFItemManager home](self, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hf_orderedRooms");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v20, "uniqueIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "items");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");

        if (v24)
        {
          v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D316D8]), "initWithApplicationDataContainer:category:", v20, CFSTR("roomAccessories"));
          objc_msgSend(v22, "items");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "sortedHomeKitItemComparator");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "sortedArrayUsingComparator:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setItems:", v28);

          objc_msgSend(v22, "setForceShowHeaderTitle:", 1);
          objc_msgSend(v32, "addObject:", v22);

        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v17);
  }

  v29 = (void *)objc_msgSend(v32, "copy");
  return v29;
}

void __80__HUMatterConnectedEcosystemDetailItemManager__buildSectionsWithDisplayedItems___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "sourceItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_roomForItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = v8;
      objc_msgSend(v8, "items");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "arrayByAddingObject:", v3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setItems:", v11);

    }
    else
    {
      v12 = objc_alloc(MEMORY[0x1E0D31570]);
      objc_msgSend(v7, "UUIDString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v12, "initWithIdentifier:", v13);

      v16[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setItems:", v14);

      objc_msgSend(v6, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHeaderTitle:", v15);

      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v7);
    }

  }
}

- (id)_roomForItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a3;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EF2AC470))
    v4 = v3;
  else
    v4 = 0;
  objc_msgSend(v4, "homeKitObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EF2D9368))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v7, "hf_parentRoom");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (HMCHIPEcosystem)connectedEcosystem
{
  return self->_connectedEcosystem;
}

- (HUMatterHomeConnectedEcosystemItemProvider)connectedEcosystemItemProvider
{
  return self->_connectedEcosystemItemProvider;
}

- (HFTransformItemProvider)connectedEcosystemAccessoryItemProvider
{
  return self->_connectedEcosystemAccessoryItemProvider;
}

- (void)setConnectedEcosystemAccessoryItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_connectedEcosystemAccessoryItemProvider, a3);
}

- (HFItem)instructionsItem
{
  return self->_instructionsItem;
}

- (void)setInstructionsItem:(id)a3
{
  objc_storeStrong((id *)&self->_instructionsItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instructionsItem, 0);
  objc_storeStrong((id *)&self->_connectedEcosystemAccessoryItemProvider, 0);
  objc_storeStrong((id *)&self->_connectedEcosystemItemProvider, 0);
  objc_storeStrong((id *)&self->_connectedEcosystem, 0);
}

@end
