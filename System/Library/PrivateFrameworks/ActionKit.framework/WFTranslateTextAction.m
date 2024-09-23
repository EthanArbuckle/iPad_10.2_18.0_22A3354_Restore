@implementation WFTranslateTextAction

- (id)disabledOnPlatforms
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFTranslateTextAction;
  -[WFTranslateTextAction disabledOnPlatforms](&v5, sel_disabledOnPlatforms);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", *MEMORY[0x24BEC43E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__WFTranslateTextAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_24F8BA068;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "getStringRepresentations:", v6);

}

- (void)translateText:(id)a3 fromLocale:(id)a4 toLocale:(id)a5 translator:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD);
  void *v17;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  void (**v24)(id, _QWORD);
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD))a7;
  if (objc_msgSend(v13, "isEqual:", v14))
  {
    -[WFTranslateTextAction output](self, "output");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v12);

    v16[2](v16, 0);
  }
  else
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v18 = (void *)get_LTTextTranslationRequestClass_softClass;
    v29 = get_LTTextTranslationRequestClass_softClass;
    v19 = MEMORY[0x24BDAC760];
    if (!get_LTTextTranslationRequestClass_softClass)
    {
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __get_LTTextTranslationRequestClass_block_invoke;
      v25[3] = &unk_24F8BB430;
      v25[4] = &v26;
      __get_LTTextTranslationRequestClass_block_invoke((uint64_t)v25);
      v18 = (void *)v27[3];
    }
    v20 = objc_retainAutorelease(v18);
    _Block_object_dispose(&v26, 8);
    v21 = (void *)objc_msgSend([v20 alloc], "initWithSourceLocale:targetLocale:", v13, v14);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v12);
    objc_msgSend(v21, "setText:", v22);

    objc_msgSend(v21, "setTaskHint:", 5);
    v23[0] = v19;
    v23[1] = 3221225472;
    v23[2] = __86__WFTranslateTextAction_translateText_fromLocale_toLocale_translator_completionBlock___block_invoke;
    v23[3] = &unk_24F8B1C28;
    v23[4] = self;
    v24 = v16;
    objc_msgSend(v21, "setTextTranslationHandler:", v23);
    objc_msgSend(v15, "translate:", v21);

  }
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a5;
  v8 = a3;
  WFLocalizedString(CFSTR("Allow “%1$@” to use %2$@ to translate?"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v9, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __86__WFTranslateTextAction_translateText_fromLocale_toLocale_translator_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void (*v10)(void);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v18, "length");
  if (v7 || v9)
  {
    if (v18)
    {
      objc_msgSend(*(id *)(a1 + 32), "output");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "string");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v12);
    }
    else
    {
      if (!v7)
        goto LABEL_10;
      objc_msgSend(v7, "translations");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "formattedString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_10;
      objc_msgSend(*(id *)(a1 + 32), "output");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "translations");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "formattedString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v17);

    }
LABEL_10:
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    goto LABEL_11;
  }
  v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
LABEL_11:
  v10();

}

void __52__WFTranslateTextAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  _QWORD *v23;
  _QWORD v24[5];
  id v25;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFSelectedFromLanguage"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFSelectedLanguage"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", v8))
    {
      objc_msgSend(*(id *)(a1 + 32), "setOutput:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
    }
    else
    {
      v9 = objc_alloc_init((Class)get_LTTranslatorClass());
      v24[0] = 0;
      v24[1] = v24;
      v24[2] = 0x3032000000;
      v24[3] = __Block_byref_object_copy__10027;
      v24[4] = __Block_byref_object_dispose__10028;
      v25 = 0;
      objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x24BDAC760];
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __52__WFTranslateTextAction_runAsynchronouslyWithInput___block_invoke_114;
      v18[3] = &unk_24F8B1C00;
      v12 = v7;
      v23 = v24;
      v13 = *(_QWORD *)(a1 + 32);
      v19 = v12;
      v20 = v13;
      v14 = v10;
      v21 = v14;
      v22 = v9;
      v16[0] = v11;
      v16[1] = 3221225472;
      v16[2] = __52__WFTranslateTextAction_runAsynchronouslyWithInput___block_invoke_3;
      v16[3] = &unk_24F8B37C8;
      v16[4] = *(_QWORD *)(a1 + 32);
      v15 = v22;
      v17 = v15;
      objc_msgSend(v5, "if_enumerateAsynchronouslyInSequence:completionHandler:", v18, v16);

      _Block_object_dispose(v24, 8);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
  }

}

void __52__WFTranslateTextAction_runAsynchronouslyWithInput___block_invoke_114(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id LTTranslatorClass;
  id v12;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v6 = a2;
  v7 = a4;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("Detect Language")) & 1) != 0
    || !objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    LTTranslatorClass = get_LTTranslatorClass();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __52__WFTranslateTextAction_runAsynchronouslyWithInput___block_invoke_2;
    v14[3] = &unk_24F8B1BD8;
    v12 = v7;
    v13 = *(_QWORD *)(a1 + 64);
    v18 = v12;
    v19 = v13;
    v14[4] = *(_QWORD *)(a1 + 40);
    v15 = v6;
    v16 = *(id *)(a1 + 48);
    v17 = *(id *)(a1 + 56);
    objc_msgSend(LTTranslatorClass, "languageForText:completion:", v15, v14);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", *(_QWORD *)(a1 + 32));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(a1 + 40), "translateText:fromLocale:toLocale:translator:completionBlock:", v6, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v7);
  }

}

uint64_t __52__WFTranslateTextAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

void __52__WFTranslateTextAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if (v3
    && (objc_msgSend(v3, "dominantLanguage"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    objc_msgSend(v4, "dominantLanguage");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    objc_msgSend(*(id *)(a1 + 32), "translateText:fromLocale:toLocale:translator:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  }
  else
  {
    WFLocalizedString(CFSTR("Unable to Detect Language"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedString(CFSTR("The language of the text provided may not be supported by Translate."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 64);
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BEC4270];
    v14 = *MEMORY[0x24BDD0FC8];
    v17[0] = *MEMORY[0x24BDD0FD8];
    v17[1] = v14;
    v18[0] = v9;
    v18[1] = v10;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 0x7FFFFFFFFFFFFFFFLL, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v16);

  }
}

@end
