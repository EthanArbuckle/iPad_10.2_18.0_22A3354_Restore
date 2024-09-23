@implementation WFMakeArchiveAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__WFMakeArchiveAction_runAsynchronouslyWithInput___block_invoke;
  v3[3] = &unk_24F8BB6B0;
  v3[4] = self;
  objc_msgSend(a3, "getFileRepresentations:forType:", v3, 0);
}

- (id)currentlySelectedArchiveFormat
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[WFMakeArchiveAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFArchiveFormat"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[WFMakeArchiveAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFArchiveFormat"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "value");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)inputsMultipleItems
{
  void *v2;
  char v3;

  -[WFMakeArchiveAction currentlySelectedArchiveFormat](self, "currentlySelectedArchiveFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = WFArchiveFormatSupportsMultipleFiles();
  else
    v3 = 1;

  return v3;
}

- (id)localizedKeywordsWithContext:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFMakeArchiveAction;
  -[WFMakeArchiveAction localizedKeywordsWithContext:](&v8, sel_localizedKeywordsWithContext_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WFSupportedArchiveFormats();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_map:", &__block_literal_global_46182);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __52__WFMakeArchiveAction_localizedKeywordsWithContext___block_invoke()
{
  void *v0;
  void *v1;

  WFArchiveFormatFileExtension();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("."), "stringByAppendingString:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void __50__WFMakeArchiveAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFArchiveFormat"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFZIPName"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WFCreateArchiveWithFiles();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v6;

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 32), "output");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addFile:", v9);

    }
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v10);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);
    v10 = v6;
  }

}

@end
