@implementation HFControlItem

uint64_t __91__HFControlItem_HUQuickControlsAdditions__hu_preferredToggleableControlItemInControlItems___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_1EF32AFD0);
}

uint64_t __91__HFControlItem_HUQuickControlsAdditions__hu_preferredToggleableControlItemInControlItems___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __91__HFControlItem_HUQuickControlsAdditions__hu_preferredToggleableControlItemInControlItems___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_msgSend(v2, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30538]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_msgSend(v4, "integerValue") & 8) != 0)
    v5 = objc_msgSend(v2, "conformsToProtocol:", &unk_1EF32AFD0);
  else
    v5 = 0;

  return v5;
}

void __79__HFControlItem_HUQuickControlsAdditions___hu_prioritizedViewControllerClasses__block_invoke_2()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[16];

  v2[15] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  v2[10] = objc_opt_class();
  v2[11] = objc_opt_class();
  v2[12] = objc_opt_class();
  v2[13] = objc_opt_class();
  v2[14] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 15);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED580E18;
  qword_1ED580E18 = v0;

}

id __101__HFControlItem_HUQuickControlsAdditions___hu_quickControlContextOfClass_controlItems_configuration___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "copyItems") & 1) == 0)
  {
    v9 = v3;
LABEL_6:
    v8 = v9;
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "valueSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v9 = (id)objc_msgSend(v3, "copy");
    goto LABEL_6;
  }
  objc_msgSend(v3, "valueSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "valueSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "copyWithValueSource:", v6);

  v8 = (void *)objc_msgSend(v3, "copyWithValueSource:", v7);
LABEL_7:

  return v8;
}

BOOL __131__HFControlItem_HUQuickControlsAdditions___hu_quickControlContextForControlItemWithPreferredPurposes_inControlItems_configuration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "latestResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D30538]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = (*(_QWORD *)(a1 + 32) & ~objc_msgSend(v4, "integerValue")) == 0;
  else
    v5 = 0;

  return v5;
}

BOOL __122__HFControlItem_HUQuickControlsAdditions__hu_preferredQuickControlGroupContextForControlItems_configuration_ignoringGrid___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a2, "latestResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D30538]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &unk_1E7041DB8;
  v5 = objc_msgSend(v3, "unsignedIntegerValue");

  return (v5 & 0x10) == 0;
}

void __122__HFControlItem_HUQuickControlsAdditions__hu_preferredQuickControlGroupContextForControlItems_configuration_ignoringGrid___block_invoke_61(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  if (v3)
  {
    v9 = v3;
    objc_msgSend(v3, "affectedCharacteristics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "na_map:", &__block_literal_global_63_2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = *(void **)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __122__HFControlItem_HUQuickControlsAdditions__hu_preferredQuickControlGroupContextForControlItems_configuration_ignoringGrid___block_invoke_3;
    v10[3] = &unk_1E6F5FFE8;
    v11 = v9;
    v12 = v5;
    v7 = v5;
    objc_msgSend(v6, "na_filter:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setArray:", v8);

    v3 = v9;
  }

}

uint64_t __122__HFControlItem_HUQuickControlsAdditions__hu_preferredQuickControlGroupContextForControlItems_configuration_ignoringGrid___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristicType");
}

BOOL __122__HFControlItem_HUQuickControlsAdditions__hu_preferredQuickControlGroupContextForControlItems_configuration_ignoringGrid___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  _BOOL8 v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "controlItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  if ((v5 & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "characteristicOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E7041DD0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = !objc_msgSend(v8, "count") || (objc_msgSend(v8, "isSubsetOfSet:", *(_QWORD *)(a1 + 40)) & 1) == 0;
  }

  return v6;
}

uint64_t __122__HFControlItem_HUQuickControlsAdditions__hu_preferredQuickControlGroupContextForControlItems_configuration_ignoringGrid___block_invoke_68(uint64_t a1)
{
  void *i;
  uint64_t result;
  void *v4;

  for (i = *(void **)(a1 + 32); ; i = *(void **)(a1 + 32))
  {
    result = objc_msgSend(i, "count");
    if (!result)
      break;
    objc_msgSend((id)objc_opt_class(), "_hu_quickControlContextForControlItemWithPreferredPurposes:inControlItems:configuration:", 4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    result = objc_claimAutoreleasedReturnValue();
    if (!result)
      break;
    v4 = (void *)result;
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);

  }
  return result;
}

uint64_t __67__HFControlItem_HUQuickControlsAdditions__hf_controlItemComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v4, "sortPriority"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "sortPriority"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "compare:", v7);

  if (!v8)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "characteristicOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allCharacteristicTypes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "characteristicOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allCharacteristicTypes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v12, "compare:", v16);

    if (!v8)
    {
      if (qword_1ED580E20 != -1)
        dispatch_once(&qword_1ED580E20, &__block_literal_global_123_0);
      v17 = (id)qword_1ED580E28;
      objc_msgSend(v4, "latestResults");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = *MEMORY[0x1E0D30538];
      objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0D30538]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "unsignedIntegerValue");

      objc_msgSend(v5, "latestResults");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKeyedSubscript:", v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "unsignedIntegerValue");

      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v25 = v17;
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v26)
      {
        v27 = v26;
        v34 = v5;
        v35 = v4;
        v28 = *(_QWORD *)v37;
LABEL_7:
        v29 = 0;
        while (1)
        {
          if (*(_QWORD *)v37 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v29);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (objc_msgSend(v30, "unsignedIntegerValue", v34, v35, (_QWORD)v36) & ~v21) == 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (objc_msgSend(v30, "unsignedIntegerValue") & ~v24) == 0);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v31, "compare:", v32);

          if (v8)
            break;
          if (v27 == ++v29)
          {
            v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
            if (v27)
              goto LABEL_7;
            v8 = 0;
            break;
          }
        }
        v5 = v34;
        v4 = v35;
      }
      else
      {
        v8 = 0;
      }

    }
  }

  return v8;
}

void __67__HFControlItem_HUQuickControlsAdditions__hf_controlItemComparator__block_invoke_3()
{
  void *v0;

  v0 = (void *)qword_1ED580E28;
  qword_1ED580E28 = (uint64_t)&unk_1E7042DF8;

}

@end
