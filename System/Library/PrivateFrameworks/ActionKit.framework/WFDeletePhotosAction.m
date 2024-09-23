@implementation WFDeletePhotosAction

- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  id v21;
  objc_super v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_msgSend(v12, "wf_slotName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("assetIdentifiers"));

  if (v18)
  {
    v19 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __82__WFDeletePhotosAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke;
    v23[3] = &unk_24F8B7C28;
    v24 = v16;
    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v20 = (void *)getPHAssetClass_softClass_37638;
    v29 = getPHAssetClass_softClass_37638;
    if (!getPHAssetClass_softClass_37638)
    {
      v25[0] = v19;
      v25[1] = 3221225472;
      v25[2] = __getPHAssetClass_block_invoke_37639;
      v25[3] = &unk_24F8BB430;
      v25[4] = &v26;
      __getPHAssetClass_block_invoke_37639((uint64_t)v25);
      v20 = (void *)v27[3];
    }
    v21 = objc_retainAutorelease(v20);
    _Block_object_dispose(&v26, 8);
    objc_msgSend(v15, "getObjectRepresentations:forClass:", v23, v21);

  }
  else
  {
    v22.receiver = self;
    v22.super_class = (Class)WFDeletePhotosAction;
    -[WFHandleIntentAction resolveSlot:withProcessedValue:parameter:input:completion:](&v22, sel_resolveSlot_withProcessedValue_parameter_input_completion_, v12, v13, v14, v15, v16);
  }

}

- (BOOL)inputPassthrough
{
  return 0;
}

- (BOOL)populatesInputFromInputParameter
{
  return 1;
}

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

void __82__WFDeletePhotosAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "if_map:", &__block_literal_global_37656);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __82__WFDeletePhotosAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

@end
