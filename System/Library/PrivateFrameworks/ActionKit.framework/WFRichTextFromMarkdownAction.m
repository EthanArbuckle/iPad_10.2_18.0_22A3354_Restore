@implementation WFRichTextFromMarkdownAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id *v12;
  _QWORD v13[4];
  void *v14;
  _QWORD v15[4];
  void *v16;
  _QWORD aBlock[5];
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = (void *)MEMORY[0x24BEC14A0];
  v5 = a3;
  objc_msgSend(v4, "typeFromFileExtension:", CFSTR("md"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __59__WFRichTextFromMarkdownAction_runAsynchronouslyWithInput___block_invoke;
  v19[3] = &unk_24F8B9340;
  v8 = v6;
  v20 = v8;
  v18 = v5;
  objc_msgSend(v5, "collectionByFilteringItemsWithBlock:excludedItems:", v19, &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v18;

  aBlock[0] = v7;
  aBlock[1] = 3221225472;
  aBlock[2] = __59__WFRichTextFromMarkdownAction_runAsynchronouslyWithInput___block_invoke_3;
  aBlock[3] = &unk_24F8BAFA8;
  aBlock[4] = self;
  v11 = _Block_copy(aBlock);
  if (objc_msgSend(v9, "numberOfItems"))
  {
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __59__WFRichTextFromMarkdownAction_runAsynchronouslyWithInput___block_invoke_4;
    v15[3] = &unk_24F8B93A8;
    v12 = &v16;
    v16 = &__block_literal_global_42884;
    objc_msgSend(v9, "transformFirstFileRepresentationForType:usingBlock:completionHandler:", v8, v15, v11);
  }
  else
  {
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __59__WFRichTextFromMarkdownAction_runAsynchronouslyWithInput___block_invoke_5;
    v13[3] = &unk_24F8B93D0;
    v12 = &v14;
    v14 = &__block_literal_global_42884;
    objc_msgSend(v10, "transformFirstObjectRepresentationForClass:usingBlock:completionHandler:", objc_opt_class(), v13, v11);
  }

}

uint64_t __59__WFRichTextFromMarkdownAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = objc_opt_class();
  if (v4 == objc_opt_class())
  {
    objc_msgSend(v3, "preferredFileType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "conformsToType:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __59__WFRichTextFromMarkdownAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

void __59__WFRichTextFromMarkdownAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = (objc_class *)MEMORY[0x24BDD17C8];
  v8 = a4;
  v9 = a3;
  v10 = a2;
  v11 = [v7 alloc];
  objc_msgSend(v10, "data");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "initWithData:encoding:", v14, 10);
  objc_msgSend(v10, "wfName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, void *, void *, id, id))(v6 + 16))(v6, v12, v13, v9, v8);
}

uint64_t __59__WFRichTextFromMarkdownAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__WFRichTextFromMarkdownAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  if (a2)
  {
    v17 = 0;
    +[MMMarkdown HTMLStringWithMarkdown:extensions:error:](MMMarkdown, "HTMLStringWithMarkdown:extensions:error:", a2, 873, &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v17;
    if (v12)
    {
      objc_msgSend(v12, "dataUsingEncoding:", 10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF83F8]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE194F8], "fileWithData:ofType:proposedFilename:", v14, v15, v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, id))v11)[2](v11, v16, v9);

    }
    else
    {
      ((void (**)(_QWORD, _QWORD, id))v11)[2](v11, 0, v13);
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v10 + 2))(v10, 0, v9);
  }

}

@end
