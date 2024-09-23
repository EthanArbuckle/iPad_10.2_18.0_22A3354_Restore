@implementation HFCharacteristicStateItemProvider

- (HFCharacteristicStateItemProvider)initWithValueSource:(id)a3 accessory:(id)a4
{
  return -[HFCharacteristicStateItemProvider initWithValueSource:accessory:service:](self, "initWithValueSource:accessory:service:", a3, a4, 0);
}

- (HFCharacteristicStateItemProvider)initWithValueSource:(id)a3 service:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HFCharacteristicStateItemProvider *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HFCharacteristicStateItemProvider initWithValueSource:accessory:service:](self, "initWithValueSource:accessory:service:", v7, v8, v6);

  return v9;
}

- (HFCharacteristicStateItemProvider)initWithValueSource:(id)a3 accessory:(id)a4 service:(id)a5
{
  id v9;
  id v10;
  id v11;
  HFCharacteristicStateItemProvider *v12;
  HFCharacteristicStateItemProvider *v13;
  uint64_t v14;
  NSSet *characteristicStateItems;
  uint64_t v16;
  NSSet *batteryItems;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HFCharacteristicStateItemProvider;
  v12 = -[HFItemProvider init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_accessory, a4);
    objc_storeStrong((id *)&v13->_service, a5);
    objc_storeStrong((id *)&v13->_valueSource, a3);
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v14 = objc_claimAutoreleasedReturnValue();
    characteristicStateItems = v13->_characteristicStateItems;
    v13->_characteristicStateItems = (NSSet *)v14;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v16 = objc_claimAutoreleasedReturnValue();
    batteryItems = v13->_batteryItems;
    v13->_batteryItems = (NSSet *)v16;

  }
  return v13;
}

- (HFCharacteristicStateItemProvider)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithValueSource_accessory_service_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFCharacteristicStateItemProvider.m"), 61, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFCharacteristicStateItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HFCharacteristicStateItemProvider valueSource](self, "valueSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicStateItemProvider accessory](self, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicStateItemProvider service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithValueSource:accessory:service:", v5, v6, v7);

  return v8;
}

- (id)invalidationReasons
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HFCharacteristicStateItemProvider;
  -[HFItemProvider invalidationReasons](&v5, sel_invalidationReasons);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setByAddingObject:", CFSTR("service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)items
{
  void *v3;
  void *v4;
  void *v5;

  -[HFCharacteristicStateItemProvider characteristicStateItems](self, "characteristicStateItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicStateItemProvider batteryItems](self, "batteryItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)reloadItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HFCharacteristicStateItemProvider _reloadCharacteristicStateItems](self, "_reloadCharacteristicStateItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicStateItemProvider _reloadBatteryItems](self, "_reloadBatteryItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resultsByMergingWithResults:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D519C0], "futureWithResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_reloadBatteryItems
{
  void *v3;
  uint64_t v4;
  HFItemProviderReloadResults *v5;
  HFAccessoryBatteryLevelItem *v6;
  void *v7;
  void *v8;
  HFItemProviderReloadResults *v9;
  HFAccessoryBatteryLevelItem *v10;
  void *v11;
  void *v12;
  void *v13;
  HFItemProviderReloadResults *v14;
  void *v15;
  void *v16;

  -[HFCharacteristicStateItemProvider batteryItems](self, "batteryItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = [HFItemProviderReloadResults alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (HFAccessoryBatteryLevelItem *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicStateItemProvider batteryItems](self, "batteryItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HFItemProviderReloadResults initWithAddedItems:removedItems:existingItems:](v5, "initWithAddedItems:removedItems:existingItems:", v6, v7, v8);
  }
  else
  {
    v10 = [HFAccessoryBatteryLevelItem alloc];
    -[HFCharacteristicStateItemProvider accessory](self, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicStateItemProvider valueSource](self, "valueSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[HFAccessoryBatteryLevelItem initWithAccessory:valueSource:](v10, "initWithAccessory:valueSource:", v11, v12);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_createBatteryItemWithSourceItem:characteristicType:valueFormatBlock:", v6, *MEMORY[0x1E0CB87B8], &__block_literal_global_225);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);
    objc_msgSend((id)objc_opt_class(), "_createBatteryItemWithSourceItem:characteristicType:valueFormatBlock:", v6, *MEMORY[0x1E0CB8808], &__block_literal_global_15_16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v13);
    -[HFCharacteristicStateItemProvider setBatteryItems:](self, "setBatteryItems:", v7);
    v14 = [HFItemProviderReloadResults alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HFItemProviderReloadResults initWithAddedItems:removedItems:existingItems:](v14, "initWithAddedItems:removedItems:existingItems:", v7, v15, v16);

  }
  return v9;
}

id __56__HFCharacteristicStateItemProvider__reloadBatteryItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "percentFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setMaximumValue:", &unk_1EA7CD920);
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("batteryPercentage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "stringForObjectValue:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __56__HFCharacteristicStateItemProvider__reloadBatteryItems__block_invoke_14(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "BOOLeanFormatter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("batteryCharging"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "stringForObjectValue:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_reloadCharacteristicStateItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HFSimpleAggregatedCharacteristicValueSource *v33;
  void *v34;
  void *v35;
  void *v36;
  HFSimpleAggregatedCharacteristicValueSource *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  HFItemProviderReloadResults *v51;
  id v53;
  HFCharacteristicStateItemProvider *v54;
  void *v55;
  id obj;
  uint64_t v57;
  HFSimpleAggregatedCharacteristicValueSource *v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;
  _QWORD v63[4];
  id v64;
  _QWORD v65[4];
  id v66;
  _QWORD v67[4];
  id v68;
  HFCharacteristicStateItemProvider *v69;
  HFSimpleAggregatedCharacteristicValueSource *v70;
  _QWORD aBlock[5];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x1E0C80C00];
  -[HFCharacteristicStateItemProvider characteristicStateItems](self, "characteristicStateItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_17_14);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "standardCharacteristicTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicStateItemProvider service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[HFCharacteristicStateItemProvider service](self, "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hf_childServices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicStateItemProvider service](self, "service");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setByAddingObject:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v54 = self;

  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = v10;
  v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
  if (v59)
  {
    v57 = *(_QWORD *)v77;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v77 != v57)
          objc_enumerationMutation(obj);
        v61 = v11;
        v12 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v11);
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v75 = 0u;
        objc_msgSend(v12, "characteristics");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v73;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v73 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
              objc_msgSend(v18, "characteristicType");
              v19 = objc_claimAutoreleasedReturnValue();
              if (v19)
              {
                v20 = (void *)v19;
                objc_msgSend(v18, "characteristicType");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = objc_msgSend(v4, "containsObject:", v21);

                if (v22)
                {
                  objc_msgSend(v18, "characteristicType");
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "objectForKeyedSubscript:", v23);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v24)
                  {
                    v25 = (void *)MEMORY[0x1E0CBA458];
                    objc_msgSend(v18, "characteristicType");
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "localizedDescriptionForCharacteristicType:", v26);
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    NSLog(CFSTR("Already have a characteristic for type %@!"), v27);

                  }
                  objc_msgSend(v18, "characteristicType");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, v28);

                }
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v72, v80, 16);
          }
          while (v15);
        }

        v11 = v61 + 1;
      }
      while (v61 + 1 != v59);
      v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v81, 16);
    }
    while (v59);
  }

  v29 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "allKeys");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setWithArray:", v30);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v5, "allValues");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setWithArray:", v32);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  -[HFCharacteristicStateItemProvider valueSource](v54, "valueSource");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicStateItemProvider service](v54, "service");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "hf_serviceDescriptor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[HFSimpleAggregatedCharacteristicValueSource initWithValueSource:characteristics:primaryServiceDescriptor:](v33, "initWithValueSource:characteristics:primaryServiceDescriptor:", v34, v62, v36);

  +[HFSetDiff diffFromSet:toSet:](HFSetDiff, "diffFromSet:toSet:", v55, v60);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__HFCharacteristicStateItemProvider__reloadCharacteristicStateItems__block_invoke_2;
  aBlock[3] = &unk_1EA73FAA0;
  aBlock[4] = v54;
  v40 = _Block_copy(aBlock);
  objc_msgSend(v38, "additions");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v39;
  v67[1] = 3221225472;
  v67[2] = __68__HFCharacteristicStateItemProvider__reloadCharacteristicStateItems__block_invoke_4;
  v67[3] = &unk_1EA73FAC8;
  v68 = v5;
  v69 = v54;
  v70 = v37;
  v58 = v37;
  v53 = v5;
  objc_msgSend(v41, "na_map:", v67);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = v38;
  objc_msgSend(v38, "deletions");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v39;
  v65[1] = 3221225472;
  v65[2] = __68__HFCharacteristicStateItemProvider__reloadCharacteristicStateItems__block_invoke_5;
  v65[3] = &unk_1EA73FAF0;
  v45 = v40;
  v66 = v45;
  objc_msgSend(v44, "na_map:", v65);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v43, "updates");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v63[0] = v39;
  v63[1] = 3221225472;
  v63[2] = __68__HFCharacteristicStateItemProvider__reloadCharacteristicStateItems__block_invoke_6;
  v63[3] = &unk_1EA73FAF0;
  v64 = v45;
  v48 = v45;
  objc_msgSend(v47, "na_map:", v63);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v49, "setByAddingObjectsFromSet:", v42);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFCharacteristicStateItemProvider setCharacteristicStateItems:](v54, "setCharacteristicStateItems:", v50);

  v51 = -[HFItemProviderReloadResults initWithAddedItems:removedItems:existingItems:]([HFItemProviderReloadResults alloc], "initWithAddedItems:removedItems:existingItems:", v42, v46, v49);
  return v51;
}

uint64_t __68__HFCharacteristicStateItemProvider__reloadCharacteristicStateItems__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristicType");
}

id __68__HFCharacteristicStateItemProvider__reloadCharacteristicStateItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "characteristicStateItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__HFCharacteristicStateItemProvider__reloadCharacteristicStateItems__block_invoke_3;
  v8[3] = &unk_1EA73FA78;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __68__HFCharacteristicStateItemProvider__reloadCharacteristicStateItems__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "characteristicType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

id __68__HFCharacteristicStateItemProvider__reloadCharacteristicStateItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    NSLog(CFSTR("Missing characteristic in diff for type: %@"), v3);
  v5 = (void *)objc_opt_class();
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v4, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setupCharacteristicStateItemForCharacteristic:valueSource:serviceType:", v4, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __68__HFCharacteristicStateItemProvider__reloadCharacteristicStateItems__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __68__HFCharacteristicStateItemProvider__reloadCharacteristicStateItems__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)characteristicStateItemComparator
{
  return &__block_literal_global_29_5;
}

uint64_t __70__HFCharacteristicStateItemProvider_characteristicStateItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "latestResults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "latestResults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "localizedStandardCompare:", v8);

  return v9;
}

+ (id)standardCharacteristicTypes
{
  if (_MergedGlobals_4_3 != -1)
    dispatch_once(&_MergedGlobals_4_3, &__block_literal_global_33_4);
  return (id)qword_1F03ED398;
}

void __64__HFCharacteristicStateItemProvider_standardCharacteristicTypes__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CB8980], *MEMORY[0x1E0CB8850], *MEMORY[0x1E0CB8898], *MEMORY[0x1E0CB8880], *MEMORY[0x1E0CB8A48], *MEMORY[0x1E0CB8A68], *MEMORY[0x1E0CB8860], *MEMORY[0x1E0CB8990], *MEMORY[0x1E0CB87B0], *MEMORY[0x1E0CB87A0], *MEMORY[0x1E0CB87A8], *MEMORY[0x1E0CB87D8], *MEMORY[0x1E0CB87E0], *MEMORY[0x1E0CB87E8], *MEMORY[0x1E0CB87F0], *MEMORY[0x1E0CB87F8], *MEMORY[0x1E0CB8800],
    *MEMORY[0x1E0CB89A0],
    *MEMORY[0x1E0CB8978],
    *MEMORY[0x1E0CB8A70],
    *MEMORY[0x1E0CB89B0],
    *MEMORY[0x1E0CB89A8],
    *MEMORY[0x1E0CB8B30],
    *MEMORY[0x1E0CB8820],
    *MEMORY[0x1E0CB8930],
    *MEMORY[0x1E0CB8958],
    *MEMORY[0x1E0CB8988],
    *MEMORY[0x1E0CB8A38],
    *MEMORY[0x1E0CB88B8],
    *MEMORY[0x1E0CB88C0],
    *MEMORY[0x1E0CB8B48],
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1F03ED398;
  qword_1F03ED398 = v0;

}

+ (id)_setupCharacteristicStateItemForCharacteristic:(id)a3 valueSource:(id)a4 serviceType:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  HFCharacteristicStateItem *v19;
  void *v20;
  HFCharacteristicStateItem *v21;
  uint64_t v23;
  uint64_t v24;
  id (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  id v28;
  id v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0CB3658];
  v30 = CFSTR("serviceType");
  v31[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hf_valueFormatterForCharacteristic:options:", v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v7, "localizedDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "characteristicType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFCharacteristicGroup groupedTitleForCharacteristicType:](HFCharacteristicGroup, "groupedTitleForCharacteristicType:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __108__HFCharacteristicStateItemProvider__setupCharacteristicStateItemForCharacteristic_valueSource_serviceType___block_invoke;
    v26 = &unk_1EA73FB58;
    v27 = v13;
    v28 = v15;
    v29 = v12;
    v16 = v15;
    v17 = v13;
    v18 = _Block_copy(&v23);
    v19 = [HFCharacteristicStateItem alloc];
    objc_msgSend(v7, "characteristicType", v23, v24, v25, v26);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[HFCharacteristicStateItem initWithCharacteristicType:valueSource:resultsProvider:](v19, "initWithCharacteristicType:valueSource:resultsProvider:", v20, v8, v18);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

id __108__HFCharacteristicStateItemProvider__setupCharacteristicStateItemForCharacteristic_valueSource_serviceType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("title"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AccessoryDetails.%@"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), &stru_1EA741FF8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("HFResultDisplayAccessibilityIDKey"));

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("groupedTitle"));
  objc_msgSend(*(id *)(a1 + 48), "stringForObjectValue:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    _HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicValueUnknownString"), CFSTR("HFCharacteristicValueUnknownString"), 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("description"));

  return v4;
}

+ (id)_createBatteryItemWithSourceItem:(id)a3 characteristicType:(id)a4 valueFormatBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  HFTransformItem *v10;
  void *v11;
  id v12;
  id v13;
  HFTransformItem *v14;
  _QWORD v16[4];
  id v17;
  id v18;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  v10 = [HFTransformItem alloc];
  v11 = (void *)objc_msgSend(v9, "copy");

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __106__HFCharacteristicStateItemProvider__createBatteryItemWithSourceItem_characteristicType_valueFormatBlock___block_invoke;
  v16[3] = &unk_1EA73FB80;
  v17 = v7;
  v18 = v8;
  v12 = v8;
  v13 = v7;
  v14 = -[HFTransformItem initWithSourceItem:transformationBlock:](v10, "initWithSourceItem:transformationBlock:", v11, v16);

  return v14;
}

id __106__HFCharacteristicStateItemProvider__createBatteryItemWithSourceItem_characteristicType_valueFormatBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString **v10;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CBA458], "localizedDescriptionForCharacteristicType:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("title"));

  +[HFCharacteristicGroup groupedTitleForCharacteristicType:](HFCharacteristicGroup, "groupedTitleForCharacteristicType:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("groupedTitle"));

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("characteristicTypes"));

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = v8;
  else
    v9 = (void *)MEMORY[0x1E0C9AAB0];
  v10 = HFResultHiddenKey;
  if (v8)
    v10 = HFResultDisplayDescriptionKey;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, *v10);

  return v4;
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (HMService)service
{
  return self->_service;
}

- (HFCharacteristicValueSource)valueSource
{
  return self->_valueSource;
}

- (NSSet)characteristicStateItems
{
  return self->_characteristicStateItems;
}

- (void)setCharacteristicStateItems:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicStateItems, a3);
}

- (NSSet)batteryItems
{
  return self->_batteryItems;
}

- (void)setBatteryItems:(id)a3
{
  objc_storeStrong((id *)&self->_batteryItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryItems, 0);
  objc_storeStrong((id *)&self->_characteristicStateItems, 0);
  objc_storeStrong((id *)&self->_valueSource, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

@end
