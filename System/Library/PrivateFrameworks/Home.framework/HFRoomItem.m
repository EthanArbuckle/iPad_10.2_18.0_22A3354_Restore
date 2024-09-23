@implementation HFRoomItem

- (HFRoomItem)initWithHome:(id)a3 room:(id)a4
{
  id v7;
  id v8;
  HFRoomItem *v9;
  HFRoomItem *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *uuidString;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HFRoomItem;
  v9 = -[HFRoomItem init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_room, a4);
    -[HFRoomItem room](v10, "room");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = objc_claimAutoreleasedReturnValue();
    uuidString = v10->_uuidString;
    v10->_uuidString = (NSString *)v13;

  }
  return v10;
}

- (HFRoomItem)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFRoomItem.m"), 47, CFSTR("Use -initWithHome:room:"));

  return 0;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFRoomItem room](self, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hf_prettyDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFItem latestResults](self, "latestResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, %@ %@>"), v5, self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HFReorderableHomeKitItemList *v15;
  void *v16;
  HFReorderableHomeKitItemList *v17;
  HFReorderableHomeKitItemList *v18;
  void *v19;
  HFReorderableHomeKitItemList *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  -[HFRoomItem room](self, "room", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    NSLog(CFSTR("room must be set on HFRoomItem before requesting an update"));
  -[HFRoomItem room](self, "room");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0D519C0];
  if (v5)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFRoomItem room](self, "room");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("title"));

    -[HFRoomItem room](self, "room");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, CFSTR("roomIdentifier"));

    -[HFRoomItem room](self, "room");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hf_reorderableServicesList");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("reorderableServiceItemList"));

    v15 = [HFReorderableHomeKitItemList alloc];
    -[HFRoomItem room](self, "room");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HFReorderableHomeKitItemList initWithApplicationDataContainer:category:](v15, "initWithApplicationDataContainer:category:", v16, CFSTR("roomActionSets"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("reorderableActionSetItemList"));

    v18 = [HFReorderableHomeKitItemList alloc];
    -[HFRoomItem room](self, "room");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HFReorderableHomeKitItemList initWithApplicationDataContainer:category:](v18, "initWithApplicationDataContainer:category:", v19, CFSTR("roomCameras"));
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, CFSTR("reorderableCameraItemList"));

    -[HFRoomItem _reorderableListsForAccessoryTypes](self, "_reorderableListsForAccessoryTypes");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, CFSTR("reorderableServicesByTypeList"));

    v22 = (void *)MEMORY[0x1E0CB37E8];
    -[HFRoomItem room](self, "room");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "home");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "numberWithBool:", objc_msgSend(v24, "hf_currentUserIsAdministrator"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, CFSTR("administrator"));

    -[HFRoomItem room](self, "room");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v27, CFSTR("HFResultDisplayAccessibilityIDKey"));

    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v8);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishWithResult:", v28);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 30);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "futureWithError:", v8);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_reorderableListsForAccessoryTypes
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  HFReorderableHomeKitItemList *v12;
  void *v13;
  HFReorderableHomeKitItemList *v14;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[HFAccessoryListUtilities sortedAccessoryTypeGroups](HFAccessoryListUtilities, "sortedAccessoryTypeGroups");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v8), "uniqueIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "UUIDString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(CFSTR("roomServicesGroupedByType-"), "stringByAppendingString:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = [HFReorderableHomeKitItemList alloc];
        -[HFRoomItem room](self, "room");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[HFReorderableHomeKitItemList initWithApplicationDataContainer:category:](v12, "initWithApplicationDataContainer:category:", v13, v11);

        objc_msgSend(v4, "setValue:forKey:", v14, v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  return v4;
}

- (id)togglePowerState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HFCharacteristicValueSet *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  HFRoomItem *v32;
  id v33;
  id v34;
  void *v35;
  id obj;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int v44;
  _QWORD v45[4];
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[4];
  id v60;
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  -[HFRoomItem room](self, "room");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    NSLog(CFSTR("room must be set on HFRoomItem before requesting toggling the power state"));
  -[HFRoomItem room](self, "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v32 = self;
    -[HFRoomItem home](self, "home");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hf_characteristicValueManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "accessories");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __30__HFRoomItem_togglePowerState__block_invoke;
    v59[3] = &unk_1EA727840;
    v33 = v6;
    v60 = v33;
    v44 = objc_msgSend(v7, "na_all:", v59);

    v34 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    v8 = objc_alloc_init(HFCharacteristicValueSet);
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v35 = v4;
    objc_msgSend(v4, "accessories");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    if (v38)
    {
      v37 = *(_QWORD *)v56;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v56 != v37)
            objc_enumerationMutation(obj);
          v39 = v9;
          v10 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v9);
          v51 = 0u;
          v52 = 0u;
          v53 = 0u;
          v54 = 0u;
          objc_msgSend(v10, "services");
          v40 = (id)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
          if (v42)
          {
            v41 = *(_QWORD *)v52;
            do
            {
              v11 = 0;
              do
              {
                if (*(_QWORD *)v52 != v41)
                  objc_enumerationMutation(v40);
                v43 = v11;
                v12 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v11);
                v47 = 0u;
                v48 = 0u;
                v49 = 0u;
                v50 = 0u;
                objc_msgSend(v12, "characteristics");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
                if (v14)
                {
                  v15 = v14;
                  v16 = *(_QWORD *)v48;
                  do
                  {
                    for (i = 0; i != v15; ++i)
                    {
                      if (*(_QWORD *)v48 != v16)
                        objc_enumerationMutation(v13);
                      v18 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
                      objc_msgSend(MEMORY[0x1E0CBA458], "hf_powerStateCharacteristicTypes");
                      v19 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v18, "characteristicType");
                      v20 = (void *)objc_claimAutoreleasedReturnValue();
                      v21 = objc_msgSend(v19, "containsObject:", v20);

                      if (v21)
                      {
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v44);
                        v22 = (void *)objc_claimAutoreleasedReturnValue();
                        -[HFCharacteristicValueSet setValue:forCharacteristic:](v8, "setValue:forCharacteristic:", v22, v18);

                      }
                    }
                    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v61, 16);
                  }
                  while (v15);
                }

                v11 = v43 + 1;
              }
              while (v43 + 1 != v42);
              v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
            }
            while (v42);
          }

          v9 = v39 + 1;
        }
        while (v39 + 1 != v38);
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      }
      while (v38);
    }

    -[HFCharacteristicValueSet allCharacteristics](v8, "allCharacteristics");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");

    if (v24)
    {
      -[HFRoomItem home](v32, "home");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "hf_characteristicValueManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v26, "beginTransactionWithReason:", CFSTR("HFRoomItemTransactionReasonTogglePowerState"));
      objc_msgSend(v26, "writeValuesForCharacteristics:", v8);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __30__HFRoomItem_togglePowerState__block_invoke_4;
      v45[3] = &unk_1EA728EC8;
      v28 = v34;
      v46 = v34;
      v29 = (id)objc_msgSend(v27, "addCompletionBlock:", v45);

      objc_msgSend(v26, "commitTransactionWithReason:", CFSTR("HFRoomItemTransactionReasonTogglePowerState"));
      v30 = v46;
    }
    else
    {
      NAEmptyResult();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v34;
      objc_msgSend(v34, "finishWithResult:", v30);
      v26 = v33;
    }

    v4 = v35;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D519C0], "futureWithNoResult");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v28;
}

uint64_t __30__HFRoomItem_togglePowerState__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "services");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__HFRoomItem_togglePowerState__block_invoke_2;
  v6[3] = &unk_1EA7283A0;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_all:", v6);

  return v4;
}

uint64_t __30__HFRoomItem_togglePowerState__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(a2, "characteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__HFRoomItem_togglePowerState__block_invoke_3;
  v6[3] = &unk_1EA72BB50;
  v7 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_all:", v6);

  return v4;
}

uint64_t __30__HFRoomItem_togglePowerState__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CBA458], "hf_powerStateCharacteristicTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "characteristicType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "cachedValueForCharacteristic:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = objc_msgSend(v7, "isEqual:", MEMORY[0x1E0C9AAA0]);
    else
      v9 = 0;

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

uint64_t __30__HFRoomItem_togglePowerState__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (HMRoom)room
{
  return self->_room;
}

- (HMHome)home
{
  return self->_home;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
}

@end
