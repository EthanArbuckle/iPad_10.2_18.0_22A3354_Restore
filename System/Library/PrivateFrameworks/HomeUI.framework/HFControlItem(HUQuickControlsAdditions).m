@implementation HFControlItem(HUQuickControlsAdditions)

+ (id)hu_preferredToggleableControlItemInControlItems:()HUQuickControlsAdditions
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_71_2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_116_2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(v3, "na_firstObjectPassingTest:", &__block_literal_global_118);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v4;
}

+ (id)_hu_prioritizedViewControllerClasses
{
  if (_MergedGlobals_644 != -1)
    dispatch_once(&_MergedGlobals_644, &__block_literal_global_36_6);
  return (id)qword_1ED580E18;
}

+ (HUQuickControlContext)_hu_quickControlContextOfClass:()HUQuickControlsAdditions controlItems:configuration:
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  HUQuickControlContext *v11;
  void *v12;
  void *v13;
  HUQuickControlContext *v14;
  _QWORD v16[4];
  id v17;

  v7 = a5;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __101__HFControlItem_HUQuickControlsAdditions___hu_quickControlContextOfClass_controlItems_configuration___block_invoke;
  v16[3] = &unk_1E6F5FF60;
  v17 = v7;
  v9 = v7;
  objc_msgSend(v8, "na_map:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [HUQuickControlContext alloc];
  objc_msgSend(v9, "home");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "itemUpdater");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HUQuickControlContext initWithQuickControlClass:controlItems:home:itemUpdater:](v11, "initWithQuickControlClass:controlItems:home:itemUpdater:", a3, v10, v12, v13);

  return v14;
}

+ (id)_hu_quickControlContextForControlItemWithPreferredPurposes:()HUQuickControlsAdditions inControlItems:configuration:
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[5];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __131__HFControlItem_HUQuickControlsAdditions___hu_quickControlContextForControlItemWithPreferredPurposes_inControlItems_configuration___block_invoke;
  v24[3] = &__block_descriptor_40_e23_B16__0__HFControlItem_8l;
  v24[4] = a3;
  objc_msgSend(a4, "na_filter:", v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    if (objc_msgSend(v9, "count") != 1)
      NSLog(CFSTR("Multiple controlItems specified the same purpose (%d) in their results. We're going to create a quick control for one of them, but which one we choose is arbitrary: %@"), a3, v9);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    objc_msgSend(a1, "_hu_prioritizedViewControllerClasses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v21;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          objc_msgSend(v15, "controlItemPredicate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "matchingControlItemsForControlItems:", v9);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v17, "count"))
          {
            objc_msgSend(a1, "_hu_quickControlContextOfClass:controlItems:configuration:", v15, v17, v8);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_14;
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
        if (v12)
          continue;
        break;
      }
    }
    v18 = 0;
LABEL_14:

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

+ (uint64_t)hu_preferredQuickControlGroupContextForControlItems:()HUQuickControlsAdditions configuration:
{
  return objc_msgSend(a1, "hu_preferredQuickControlGroupContextForControlItems:configuration:ignoringGrid:", a3, a4, 0);
}

+ (HUQuickControlGroupContext)hu_preferredQuickControlGroupContextForControlItems:()HUQuickControlsAdditions configuration:ignoringGrid:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(_QWORD);
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  BOOL v33;
  HUQuickControlGroupContext *v34;
  id v36;
  void *v37;
  void *v38;
  void (**v39)(_QWORD);
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  _QWORD aBlock[4];
  id v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "na_filter:", &__block_literal_global_59_3);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hf_controlItemComparator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sortedArrayUsingComparator:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = v12;
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __122__HFControlItem_HUQuickControlsAdditions__hu_preferredQuickControlGroupContextForControlItems_configuration_ignoringGrid___block_invoke_61;
  aBlock[3] = &unk_1E6F5F2C8;
  v15 = v13;
  v54 = v15;
  v16 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v15, "count"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v14;
  v47[1] = 3221225472;
  v47[2] = __122__HFControlItem_HUQuickControlsAdditions__hu_preferredQuickControlGroupContextForControlItems_configuration_ignoringGrid___block_invoke_68;
  v47[3] = &unk_1E6F60010;
  v18 = v15;
  v48 = v18;
  v52 = a1;
  v19 = v9;
  v49 = v19;
  v20 = v16;
  v51 = v20;
  v21 = v17;
  v50 = v21;
  v22 = (void (**)(_QWORD))_Block_copy(v47);
  v41 = v19;
  v42 = v18;
  objc_msgSend((id)objc_opt_class(), "_hu_quickControlContextForControlItemWithPreferredPurposes:inControlItems:configuration:", 2, v18, v19);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id))v20 + 2))(v20, v23);
  if (!v23 || (v22[2](v22), !objc_msgSend(v21, "count")))
  {
    v39 = v22;
    v40 = v21;
    v36 = v8;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend((id)objc_opt_class(), "_hu_prioritizedViewControllerClasses");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v44;
      while (2)
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v44 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          if (!a5 || (objc_msgSend(v29, "isEqual:", objc_opt_class()) & 1) == 0)
          {
            objc_msgSend(v29, "controlItemPredicate", v36);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "matchingControlItemsForControlItems:", v42);
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v31, "count"))
            {
              objc_msgSend((id)objc_opt_class(), "_hu_quickControlContextOfClass:controlItems:configuration:", v29, v31, v41);
              v32 = (id)objc_claimAutoreleasedReturnValue();
              (*((void (**)(id, id))v20 + 2))(v20, v32);
              if (v23)
              {
                if (v32)
                  v33 = v32 == v23;
                else
                  v33 = 1;
                if (v33)
                {

                  goto LABEL_24;
                }
                objc_msgSend(v40, "addObject:", v32);
              }
              else
              {
                v23 = v32;
                ((void (*)(void))v39[2])();
              }

            }
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
        if (v26)
          continue;
        break;
      }
    }
LABEL_24:

    v8 = v36;
    v22 = v39;
    v21 = v40;
  }
  v34 = -[HUQuickControlGroupContext initWithPrimaryQuickControlContext:alternateQuickControlContexts:]([HUQuickControlGroupContext alloc], "initWithPrimaryQuickControlContext:alternateQuickControlContexts:", v23, v21);

  return v34;
}

+ (id)hf_controlItemComparator
{
  void *v0;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __HFReversedComparator_block_invoke;
  v2[3] = &unk_1E6F56750;
  v3 = &__block_literal_global_120_2;
  v0 = (void *)objc_msgSend(v2, "copy");

  return v0;
}

@end
