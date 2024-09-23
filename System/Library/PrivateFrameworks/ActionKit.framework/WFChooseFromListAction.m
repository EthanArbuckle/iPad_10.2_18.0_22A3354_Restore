@implementation WFChooseFromListAction

- (id)appResource
{
  return 0;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  WFChooseFromListAction *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void (**v20)(_QWORD);
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void (**v27)(_QWORD);
  uint64_t v28;
  BOOL v29;
  char v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[5];
  id v35;
  id v36;
  void (**v37)(_QWORD);
  char v38;
  char v39;
  _QWORD aBlock[5];
  id v41;
  id v42;
  objc_super v43;

  v4 = a3;
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    -[WFChooseFromListAction setOutput:](self, "setOutput:", v4);
    -[WFHandleIntentAction finishRunningWithError:](self, "finishRunningWithError:", 0);
    goto LABEL_21;
  }
  -[WFChooseFromListAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFChooseFromListActionSelectMultiple"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  -[WFChooseFromListAction userInterface](self, "userInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userInterfaceType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE19948]);

  if (!v11)
  {
    -[WFChooseFromListAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFChooseFromListActionPrompt"), objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v12, "length") && (v8 & 1) == 0)
    {
      -[WFChooseFromListAction localizedDefaultDisambiguationPrompt](self, "localizedDefaultDisambiguationPrompt");
      v15 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v15;
    }
    objc_msgSend(v4, "items");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (!v17)
    {
      -[WFChooseFromListAction setOutput:](self, "setOutput:", v4);
      v13 = self;
      v14 = 0;
      goto LABEL_14;
    }
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__WFChooseFromListAction_runAsynchronouslyWithInput___block_invoke;
    aBlock[3] = &unk_24F8BB0A0;
    aBlock[4] = self;
    v18 = v12;
    v41 = v18;
    v19 = v4;
    v42 = v19;
    v20 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(v19, "collectionByFilteringItemsWithBlock:excludedItems:", &__block_literal_global_5550, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFChooseFromListAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFChooseFromListActionSelectAll"), objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "BOOLValue");

    -[WFChooseFromListAction userInterface](self, "userInterface");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v21;
    if (objc_msgSend(v24, "isRunningWithSiriUI"))
    {

    }
    else
    {
      v30 = v23;
      v31 = v18;
      objc_msgSend(v21, "items");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v25, "count");
      objc_msgSend(v19, "items");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v20;
      v28 = objc_msgSend(v26, "count");

      v29 = v32 == v28;
      v20 = v27;
      if (v29)
      {
        v34[0] = MEMORY[0x24BDAC760];
        v34[1] = 3221225472;
        v34[2] = __53__WFChooseFromListAction_runAsynchronouslyWithInput___block_invoke_3;
        v34[3] = &unk_24F8B1130;
        v34[4] = self;
        v35 = v31;
        v38 = v30;
        v39 = v8;
        v36 = v19;
        v37 = v27;
        -[WFChooseFromListAction requestUnlock:](self, "requestUnlock:", v34);

LABEL_19:
        goto LABEL_20;
      }
    }
    v20[2](v20);
    goto LABEL_19;
  }
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "wfUnsupportedUserInterfaceError");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = self;
    v14 = v12;
LABEL_14:
    -[WFHandleIntentAction finishRunningWithError:](v13, "finishRunningWithError:", v14);
LABEL_20:

    goto LABEL_21;
  }
  v43.receiver = self;
  v43.super_class = (Class)WFChooseFromListAction;
  -[WFHandleIntentAction runAsynchronouslyWithInput:](&v43, sel_runAsynchronouslyWithInput_, v4);
LABEL_21:

}

- (id)itemsFromDictionaryItem:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  objc_msgSend(a3, "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__WFChooseFromListAction_itemsFromDictionaryItem___block_invoke;
  v8[3] = &unk_24F8B1158;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "if_compactMap:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)contentItemsFromSelectedItem:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "attributionSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attributionSetByFilteringNeighborsOfContentItem:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAttributionSet:", v5);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "items");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (void)presentAlertWithUserInterface:(id)a3 prompt:(id)a4 input:(id)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  _QWORD v38[4];
  id v39;
  WFChooseFromListAction *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  id v46;
  id v47;
  WFChooseFromListAction *v48;
  char v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v37 = a3;
  v8 = a4;
  v9 = a5;
  -[WFChooseFromListAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFChooseFromListActionSelectMultiple"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  -[WFChooseFromListAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFChooseFromListActionSelectAll"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");

  objc_msgSend(v9, "items");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count") == 1)
  {
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v9, "items");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFChooseFromListAction itemsFromDictionaryItem:](self, "itemsFromDictionaryItem:", v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v19;
    }
  }
  v35 = v9;
  if ((v11 & v13 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v14, "count", v9));
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = objc_opt_new();
  }
  v21 = (void *)v20;
  objc_msgSend(MEMORY[0x24BE19370], "alertWithPreferredStyle:", 1, v35);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
    v23 = v8;
  else
    v23 = 0;
  objc_msgSend(v22, "setTitle:", v23);
  v45[0] = MEMORY[0x24BDAC760];
  v45[1] = 3221225472;
  v45[2] = __69__WFChooseFromListAction_presentAlertWithUserInterface_prompt_input___block_invoke;
  v45[3] = &unk_24F8B11A8;
  v24 = v21;
  v46 = v24;
  v49 = v11;
  v25 = v22;
  v47 = v25;
  v48 = self;
  objc_msgSend(v14, "if_compactMap:", v45);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v42 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(v25, "addButton:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    }
    while (v28);
  }
  objc_msgSend(MEMORY[0x24BE19378], "cancelButtonWithTarget:action:", self, sel_cancel);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addButton:", v31);

  if (v11)
  {
    v32 = (void *)MEMORY[0x24BE19378];
    WFLocalizedString(CFSTR("Done"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x24BDAC760];
    v38[1] = 3221225472;
    v38[2] = __69__WFChooseFromListAction_presentAlertWithUserInterface_prompt_input___block_invoke_4;
    v38[3] = &unk_24F8BA480;
    v39 = v26;
    v40 = self;
    objc_msgSend(v32, "buttonWithTitle:style:preferred:handler:", v33, 0, 1, v38);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addButton:", v34);

  }
  objc_msgSend(v37, "presentAlert:", v25);

}

- (BOOL)populatesInputFromInputParameter
{
  return 1;
}

- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  NSObject *v19;
  dispatch_queue_t v20;
  void *v21;
  NSObject *v22;
  objc_super v23;
  _QWORD v24[5];
  dispatch_queue_t v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "wf_slotName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("originalItems"));

  if (v18)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("com.apple.shortcuts.choose-from-list", v19);

    objc_msgSend(v15, "items");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __84__WFChooseFromListAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke;
    v24[3] = &unk_24F8B1248;
    v24[4] = self;
    v25 = v20;
    v22 = v20;
    objc_msgSend(v21, "if_mapAsynchronouslyOnQueue:transform:completionHandler:", v22, v24, v16);

  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)WFChooseFromListAction;
    -[WFHandleIntentAction resolveSlot:withProcessedValue:parameter:input:completion:](&v23, sel_resolveSlot_withProcessedValue_parameter_input_completion_, v12, v13, v14, v15, v16);
  }

}

- (id)roundedImageFromWFImage:(id)a3 roundingStyle:(unint64_t)a4 desiredSize:(CGSize)a5 desiredScale:(double)a6
{
  double height;
  double width;
  id v9;
  double v10;
  CGFloat v11;
  id v12;
  CGContext *v13;
  const CGPath *v14;
  void *v15;
  CGRect v17;

  height = a5.height;
  width = a5.width;
  v9 = a3;
  WFContentItemListThumbnailCornerRadiusForRoundingStyle();
  v11 = v10;
  objc_msgSend(MEMORY[0x24BEC1378], "contextWithSize:scale:", width, height, a6);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = (CGContext *)objc_msgSend(v12, "CGContext");
  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  v17.size.width = width;
  v17.size.height = height;
  v14 = CGPathCreateWithRoundedRect(v17, v11, v11, 0);
  CGContextAddPath(v13, v14);
  CGContextClip(v13);
  objc_msgSend(v9, "drawInContext:inRect:", v12, 0.0, 0.0, width, height);

  objc_msgSend(v12, "image");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)getOutputFromIntentResponse:(id)a3 completionHandler:(id)a4
{
  void (**v7)(id, _QWORD);
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFChooseFromListAction.m"), 243, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"), v23);

  }
  v8 = objc_opt_class();
  WFEnforceClass(v23, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "selectedItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    -[WFChooseFromListAction input](self, "input");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "numberOfItems");

    if (v13 >= v15)
    {
      v7[2](v7, 0);
    }
    else
    {
      -[WFChooseFromListAction input](self, "input");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "items");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndex:", v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = (void *)MEMORY[0x24BE19438];
      -[WFChooseFromListAction contentItemsFromSelectedItem:](self, "contentItemsFromSelectedItem:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "collectionWithItems:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))v7)[2](v7, v21);

    }
  }
  else
  {
    v7[2](v7, 0);
  }

}

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

void __84__WFChooseFromListAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD v28[4];
  NSObject *v29;
  _QWORD *v30;
  _QWORD v31[5];
  NSObject *v32;
  _QWORD *v33;
  __int128 v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[5];
  id v38;

  v7 = a2;
  v8 = a4;
  v9 = dispatch_group_create();
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__5530;
  v37[4] = __Block_byref_object_dispose__5531;
  v38 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__5530;
  v35[4] = __Block_byref_object_dispose__5531;
  v36 = 0;
  dispatch_group_enter(v9);
  v10 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __84__WFChooseFromListAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_194;
  v31[3] = &unk_24F8B11D0;
  v11 = *(_QWORD *)(a1 + 32);
  v33 = v35;
  v31[4] = v11;
  __asm { FMOV            V0.2D, #31.0 }
  v34 = _Q0;
  v17 = v9;
  v32 = v17;
  if ((objc_msgSend(v7, "getListThumbnail:forSize:", v31, 31.0, 31.0) & 1) == 0)
    dispatch_group_leave(v17);
  dispatch_group_enter(v17);
  v28[0] = v10;
  v28[1] = 3221225472;
  v28[2] = __84__WFChooseFromListAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_2;
  v28[3] = &unk_24F8B11F8;
  v30 = v37;
  v18 = v17;
  v29 = v18;
  if ((objc_msgSend(v7, "getListSubtitle:", v28) & 1) == 0)
    dispatch_group_leave(v18);
  v19 = *(NSObject **)(a1 + 40);
  v22[0] = v10;
  v22[1] = 3221225472;
  v22[2] = __84__WFChooseFromListAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_3;
  v22[3] = &unk_24F8B1220;
  v23 = v7;
  v24 = v8;
  v25 = v37;
  v26 = v35;
  v27 = a3;
  v20 = v7;
  v21 = v8;
  dispatch_group_notify(v18, v19, v22);

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(v37, 8);

}

void __84__WFChooseFromListAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_194(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BEC1820]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v6 = objc_msgSend(v5, "unsignedIntegerValue");
  else
    v6 = 0;

  if (v15)
  {
    v7 = (void *)MEMORY[0x24BDD9DA8];
    v8 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "screenScale");
    objc_msgSend(v8, "roundedImageFromWFImage:roundingStyle:desiredSize:desiredScale:", v15, v6, *(double *)(a1 + 56), *(double *)(a1 + 64), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithWFImage:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __84__WFChooseFromListAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __84__WFChooseFromListAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  WFChooseFromListItem *v3;
  void *v4;
  WFChooseFromListItem *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu"), *(_QWORD *)(a1 + 64));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  v3 = [WFChooseFromListItem alloc];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[WFChooseFromListItem initWithIdentifier:displayString:subtitleString:displayImage:](v3, "initWithIdentifier:displayString:subtitleString:displayImage:", v6, v4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  (*(void (**)(uint64_t, WFChooseFromListItem *, _QWORD))(v2 + 16))(v2, v5, 0);

}

id __69__WFChooseFromListAction_presentAlertWithUserInterface_prompt_input___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  id v12;
  _QWORD aBlock[4];
  id v14;
  uint64_t v15;

  v5 = a2;
  v6 = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a3);
  if (*(_BYTE *)(a1 + 56))
  {
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __69__WFChooseFromListAction_presentAlertWithUserInterface_prompt_input___block_invoke_2;
    aBlock[3] = &unk_24F8B1180;
    v14 = *(id *)(a1 + 40);
    v15 = a3;
    v7 = _Block_copy(aBlock);
    v8 = v14;
  }
  else
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __69__WFChooseFromListAction_presentAlertWithUserInterface_prompt_input___block_invoke_3;
    v11[3] = &unk_24F8BA480;
    v11[4] = *(_QWORD *)(a1 + 48);
    v12 = v5;
    v7 = _Block_copy(v11);
    v8 = v12;
  }

  objc_msgSend(MEMORY[0x24BE19420], "buttonWithContentItem:selected:stickySelection:handler:", v5, v6, *(unsigned __int8 *)(a1 + 56), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __69__WFChooseFromListAction_presentAlertWithUserInterface_prompt_input___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v8, "isSelected", (_QWORD)v13))
        {
          v9 = *(void **)(a1 + 40);
          objc_msgSend(v8, "contentItem");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "contentItemsFromSelectedItem:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObjectsFromArray:", v11);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x24BE19438], "collectionWithItems:", v2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setOutput:", v12);

  objc_msgSend(*(id *)(a1 + 40), "finishRunningWithError:", 0);
}

void __69__WFChooseFromListAction_presentAlertWithUserInterface_prompt_input___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "buttons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  WFEnforceClass(v3, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setSelected:", objc_msgSend(v5, "isSelected") ^ 1);
}

uint64_t __69__WFChooseFromListAction_presentAlertWithUserInterface_prompt_input___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BE19438];
  objc_msgSend(*(id *)(a1 + 32), "contentItemsFromSelectedItem:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "collectionWithItems:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setOutput:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

id __50__WFChooseFromListAction_itemsFromDictionaryItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(v3, "description");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    +[WFChooseFromListArrayContentItem itemWithObjects:named:](WFChooseFromListArrayContentItem, "itemWithObjects:named:", v6, v5);
  else
    objc_msgSend(MEMORY[0x24BE19450], "itemWithObject:named:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __53__WFChooseFromListAction_runAsynchronouslyWithInput___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;

  v2 = (void *)a1[4];
  objc_msgSend(v2, "userInterface");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentAlertWithUserInterface:prompt:input:", v3, a1[5], a1[6]);

}

void __53__WFChooseFromListAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, char a2)
{
  void *v2;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  __int16 v12;

  v2 = *(void **)(a1 + 32);
  if ((a2 & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __53__WFChooseFromListAction_runAsynchronouslyWithInput___block_invoke_4;
    v7[3] = &unk_24F8B1108;
    v8 = *(id *)(a1 + 40);
    v12 = *(_WORD *)(a1 + 64);
    v4 = *(id *)(a1 + 48);
    v5 = *(_QWORD *)(a1 + 32);
    v9 = v4;
    v10 = v5;
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v2, "requestInterfacePresentationWithCompletionHandler:", v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "deviceLockedError");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "finishRunningWithError:", v6);

  }
}

void __53__WFChooseFromListAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(unsigned __int8 *)(a1 + 64);
    v8 = *(unsigned __int8 *)(a1 + 65);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __53__WFChooseFromListAction_runAsynchronouslyWithInput___block_invoke_5;
    v11[3] = &unk_24F8BAFA8;
    v11[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(a2, "showImagesWithPrompt:canSelectAll:canSelectMultiple:inputItems:completionHandler:", v9, v7, v8, v10, v11);
  }
  else if (objc_msgSend(v5, "wf_isUserCancelledError"))
  {
    objc_msgSend(*(id *)(a1 + 48), "finishRunningWithError:", v6);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __53__WFChooseFromListAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

uint64_t __53__WFChooseFromListAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (id)userInterfaceProtocol
{
  return &unk_255DFC6F8;
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

@end
