@implementation HFAbstractControlStatusItem

- (BOOL)supportsInvalidation
{
  return 1;
}

id __61__HFAbstractControlStatusItem__buildControlItemsForServices___block_invoke_2(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copyWithValueSource:", *(_QWORD *)(a1 + 32));
}

id __61__HFAbstractControlStatusItem__buildServiceItemsForServices___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "valueSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFServiceItem serviceItemForService:valueSource:](HFServiceItem, "serviceItemForService:valueSource:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __61__HFAbstractControlStatusItem__buildControlItemsForServices___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "characteristicOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "characteristicTypesForUsage:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

uint64_t __61__HFAbstractControlStatusItem__buildControlItemsForServices___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  v4 = objc_msgSend((id)objc_opt_class(), "_isControlItem:similarToControlItem:", v3, *(_QWORD *)(a1 + 40));

  return v4;
}

+ (BOOL)_isControlItem:(id)a3 similarToControlItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(v5, "characteristicOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1EA7CB8C0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "characteristicOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", &unk_1EA7CB8C0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "intersectsSet:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id __68__HFAbstractControlStatusItem__primaryServiceDescriptorForServices___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_msgSend(v2, "hf_isChildService") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "hf_serviceDescriptor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

id __70__HFAbstractControlStatusItem__aggregatedValueSourceWithServiceItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_childServices");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setByAddingObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)standardResultsForBatchReadResponse:(id)a3 serviceTypes:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)HFAbstractControlStatusItem;
  -[HFStatusItem standardResultsForBatchReadResponse:serviceTypes:](&v20, sel_standardResultsForBatchReadResponse_serviceTypes_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("representedHomeKitObjects"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "anyObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_class();
    v11 = objc_opt_class();

    if (v10 == v11)
    {
      -[HFAbstractControlStatusItem _buildControlItemsForServices:](self, "_buildControlItemsForServices:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFItem latestResults](self, "latestResults");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("childItems"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
      {
        v16 = v14;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "set");
        v16 = (id)objc_claimAutoreleasedReturnValue();
      }
      v17 = v16;

      objc_msgSend(v17, "na_setByDiffingWithSet:", v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("childItems"));

      if (objc_msgSend(v12, "count"))
        objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1EA7CB8A8, CFSTR("statusItemCategory"));

    }
  }

  return v6;
}

- (id)_buildControlItemsForServices:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  id v28;
  id obj;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  id v37;
  _QWORD v38[6];
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  _BYTE v49[128];
  _BYTE v50[128];
  __CFString *v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x1E0C80C00];
  v28 = a3;
  -[HFAbstractControlStatusItem _buildServiceItemsForServices:](self, "_buildServiceItemsForServices:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v4;
  if (objc_msgSend(v4, "count"))
  {
    -[HFAbstractControlStatusItem _aggregatedValueSourceWithServiceItems:](self, "_aggregatedValueSourceWithServiceItems:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = HFItemUpdateOptionDisableOptionalData;
    v52[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v32 = v6;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "createControlItemsWithOptions:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "na_filter:", &__block_literal_global_22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __61__HFAbstractControlStatusItem__buildControlItemsForServices___block_invoke_2;
    v47[3] = &unk_1EA7292E0;
    v35 = v5;
    v48 = v35;
    objc_msgSend(v7, "na_map:", v47);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (id)objc_msgSend(v8, "mutableCopy");

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = v4;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    if (v33)
    {
      v31 = *(_QWORD *)v44;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v44 != v31)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v9);
          if (v10 != v32)
          {
            v34 = v9;
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = 0u;
            v40 = 0u;
            v41 = 0u;
            v42 = 0u;
            objc_msgSend(v10, "createControlItemsWithOptions:", v30);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
            if (v12)
            {
              v13 = v12;
              v14 = *(_QWORD *)v40;
              do
              {
                v15 = 0;
                do
                {
                  if (*(_QWORD *)v40 != v14)
                    objc_enumerationMutation(v11);
                  v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v15);
                  v38[0] = MEMORY[0x1E0C809B0];
                  v38[1] = 3221225472;
                  v38[2] = __61__HFAbstractControlStatusItem__buildControlItemsForServices___block_invoke_3;
                  v38[3] = &unk_1EA729308;
                  v38[4] = self;
                  v38[5] = v16;
                  objc_msgSend(v37, "na_firstObjectPassingTest:", v38);
                  v17 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v17)
                  {
                    objc_msgSend(v16, "characteristicOptions");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v18, "characteristicTypesForUsage:", 0);
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    v20 = objc_msgSend(v19, "count");

                    if (v20)
                    {
                      if (objc_msgSend((id)objc_opt_class(), "_isControlItem:identicalToControlItem:", v17, v16))
                      {
                        objc_msgSend(v36, "addObject:", v17);
                      }
                      else
                      {
                        objc_msgSend(v16, "characteristicOptions");
                        v21 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v17, "characteristicOptions");
                        v22 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v21, "optionsByIntersectingWithOptions:", v22);
                        v23 = (void *)objc_claimAutoreleasedReturnValue();

                        if (objc_msgSend(v17, "canCopyWithCharacteristicOptions:", v23))
                        {
                          v24 = (void *)objc_msgSend(v17, "copyWithCharacteristicOptions:valueSource:", v23, v35);
                          objc_msgSend(v36, "addObject:", v24);

                        }
                      }
                    }
                  }

                  ++v15;
                }
                while (v13 != v15);
                v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
              }
              while (v13);
            }

            v37 = v36;
            v9 = v34;
          }
          ++v9;
        }
        while (v9 != v33);
        v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      }
      while (v33);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v37 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v37;
}

+ (BOOL)_isControlItem:(id)a3 identicalToControlItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()))
  {
    objc_msgSend(v5, "characteristicOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "characteristicOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_buildServiceItemsForServices:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__HFAbstractControlStatusItem__buildServiceItemsForServices___block_invoke;
  v4[3] = &unk_1EA729278;
  v4[4] = self;
  objc_msgSend(a3, "na_map:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_aggregatedValueSourceWithServiceItems:(id)a3
{
  void *v4;
  void *v5;
  HFSimpleAggregatedCharacteristicValueSource *v6;
  void *v7;
  HFSimpleAggregatedCharacteristicValueSource *v8;

  objc_msgSend(a3, "na_flatMap:", &__block_literal_global_12_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFAbstractControlStatusItem _primaryServiceDescriptorForServices:](self, "_primaryServiceDescriptorForServices:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [HFSimpleAggregatedCharacteristicValueSource alloc];
  -[HFStatusItem valueSource](self, "valueSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFSimpleAggregatedCharacteristicValueSource initWithValueSource:services:primaryServiceDescriptor:](v6, "initWithValueSource:services:primaryServiceDescriptor:", v7, v4, v5);

  return v8;
}

- (id)_primaryServiceDescriptorForServices:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  HFAbstractControlStatusItem *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "na_map:", &__block_literal_global_10_1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") != 1)
  {
    HFLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138413058;
      v9 = self;
      v10 = 2048;
      v11 = objc_msgSend(v4, "count");
      v12 = 2112;
      v13 = v4;
      v14 = 2112;
      v15 = v5;
      _os_log_error_impl(&dword_1DD34E000, v6, OS_LOG_TYPE_ERROR, "%@ Invalid number of service descriptors (expected 1, found %lu): %@. Defaulting to %@.", (uint8_t *)&v8, 0x2Au);
    }

  }
  return v5;
}

+ (NSSet)serviceTypes
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAbstractControlStatusItem.m"), 179, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HFAbstractControlStatusItem serviceTypes]", objc_opt_class());

  return 0;
}

@end
