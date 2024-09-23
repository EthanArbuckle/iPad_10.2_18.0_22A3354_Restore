@implementation WFExtractArchiveAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  _QWORD v3[5];
  _QWORD v4[5];

  v3[4] = self;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__WFExtractArchiveAction_runAsynchronouslyWithInput___block_invoke;
  v4[3] = &unk_24F8B54C0;
  v4[4] = self;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __53__WFExtractArchiveAction_runAsynchronouslyWithInput___block_invoke_2;
  v3[3] = &unk_24F8BAFA8;
  objc_msgSend(a3, "transformFirstFileRepresentationForType:usingBlock:completionHandler:", 0, v4, v3);
}

- (id)localizedKeywordsWithContext:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFExtractArchiveAction;
  -[WFExtractArchiveAction localizedKeywordsWithContext:](&v8, sel_localizedKeywordsWithContext_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFSupportedArchiveFormats();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_map:", &__block_literal_global_25973);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __55__WFExtractArchiveAction_localizedKeywordsWithContext___block_invoke()
{
  void *v0;
  void *v1;

  WFArchiveFormatFileExtension();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("."), "stringByAppendingString:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void __53__WFExtractArchiveAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void (**v7)(id, void *, _QWORD);
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v7 = a4;
  if (a2)
  {
    v8 = a3;
    WFExtractArchiveFile();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = v8;
    ((void (**)(id, void *, id))v7)[2](v7, v9, v12);

  }
  else
  {
    v13 = *(void **)(a1 + 32);
    v11 = a3;
    objc_msgSend(v13, "finishRunningWithError:", v11);
  }

}

void __53__WFExtractArchiveAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

@end
