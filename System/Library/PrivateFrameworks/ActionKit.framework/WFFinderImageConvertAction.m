@implementation WFFinderImageConvertAction

- (BOOL)isProgressIndeterminate
{
  return 0;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];

  v4 = a3;
  -[WFFinderImageConvertAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFFileFormat"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFinderImageConvertAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSize"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFinderImageConvertAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPreserveMetadata"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = WFFinderImageResizeFormatFromDescription();
  v9 = WFFinderImageResizeSizeFromDescription();
  v10 = objc_alloc_init(MEMORY[0x24BEC3D38]);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC14A8]), "initWithFormat:size:preserveMetadata:", v8, v9, objc_msgSend(v7, "BOOLValue"));
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __57__WFFinderImageConvertAction_runAsynchronouslyWithInput___block_invoke;
  v15[3] = &unk_24F8BAFA8;
  v15[4] = self;
  objc_msgSend(v10, "resizeImages:toSize:completion:", v4, v11, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFFinderImageConvertAction progress](self, "progress");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTotalUnitCount:", 1);

  -[WFFinderImageConvertAction progress](self, "progress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addChild:withPendingUnitCount:", v12, 1);

}

- (BOOL)prefersActionAttribution
{
  return 1;
}

- (id)localizedAttributionWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  -[WFFinderImageConvertAction contextualAction](self, "contextualAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "displayString");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)WFFinderImageConvertAction;
    -[WFFinderImageConvertAction localizedAttributionWithContext:](&v10, sel_localizedAttributionWithContext_, v4);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  return v8;
}

- (id)contextualAction
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  -[WFFinderImageConvertAction runningDelegate](self, "runningDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[WFFinderImageConvertAction runningDelegate](self, "runningDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentRunningContextForAction:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "contextualAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

void __57__WFFinderImageConvertAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

@end
