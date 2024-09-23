@implementation WFAppendFileAction

- (void)runAsynchronouslyWithInput:(id)a3 storageService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[WFStorageServiceAction filePathKey](self, "filePathKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAppendFileAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", v8, objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFAppendFileAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFFile"), objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "length"))
  {
    -[WFAppendFileAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAppendOnNewLine"), objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    -[WFAppendFileAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAppendFileWriteMode"), objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("Prepend"));

    v15 = 9;
    if (!v12)
      v15 = 1;
    v16 = 2;
    if (v14)
      v16 = 4;
    v17 = v16 | v15;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __64__WFAppendFileAction_runAsynchronouslyWithInput_storageService___block_invoke;
    v24[3] = &unk_24F8B2C00;
    v24[4] = self;
    v25 = v7;
    v26 = v10;
    v27 = v9;
    v28 = v17;
    objc_msgSend(v6, "getStringRepresentation:", v24);

  }
  else
  {
    v18 = (void *)MEMORY[0x24BDD1540];
    v19 = *MEMORY[0x24BEC4270];
    v29[0] = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("No File Path Provided"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v20;
    v29[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("You must specify a filename or path in Append to File."));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 5, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppendFileAction finishRunningWithError:](self, "finishRunningWithError:", v23);

  }
}

- (BOOL)requiresRemoteExecution
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFAppendFileAction;
  return -[WFStorageServiceAction requiresRemoteExecution](&v3, sel_requiresRemoteExecution);
}

- (id)filenamePlaceholderText
{
  void *v2;
  void *v3;
  int v4;
  __CFString *v5;

  -[WFStorageServiceAction storageService](self, "storageService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storageLocationPrefix");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSuffix:", CFSTR("/"));

  if (v4)
    v5 = CFSTR("example.txt");
  else
    v5 = CFSTR("/example.txt");
  WFLocalizedString(v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)contentDestinationWithError:(id *)a3
{
  void *v3;
  void *v4;

  -[WFAppendFileAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFFile"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19470], "contentLocationForFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;

  v7 = a5;
  v8 = a3;
  -[WFAppendFileAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAppendFileWriteMode"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("Prepend"));

  v11 = (void *)MEMORY[0x24BDD17C8];
  if (v10)
    v12 = CFSTR("Allow “%1$@” to prepend %2$@ to a text file?");
  else
    v12 = CFSTR("Allow “%1$@” to append %2$@ to a text file?");
  WFLocalizedString(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringWithFormat:", v13, v7, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)minimumSupportedClientVersion
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFAppendFileAction;
  -[WFAppendFileAction minimumSupportedClientVersion](&v5, sel_minimumSupportedClientVersion);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WFMaximumBundleVersion();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __64__WFAppendFileAction_runAsynchronouslyWithInput_storageService___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  const __CFString *v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];

  v5 = a2;
  v6 = (__CFString *)v5;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a3);
  }
  else
  {
    if (v5)
      v7 = v5;
    else
      v7 = &stru_24F8BBA48;
    v8 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 56);
    v11 = *(_QWORD *)(a1 + 64);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __64__WFAppendFileAction_runAsynchronouslyWithInput_storageService___block_invoke_2;
    v12[3] = &unk_24F8B96D8;
    v12[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v8, "appendText:toDirectory:subpath:options:completionHandler:", v7, v9, v10, v11, v12);

  }
}

void __64__WFAppendFileAction_runAsynchronouslyWithInput_storageService___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v9 = v5;
  if (v5)
  {
    objc_msgSend(v6, "output");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addFileWithOriginAttribution:", v9);

    v6 = *(void **)(a1 + 32);
    v8 = 0;
  }
  else
  {
    v8 = a3;
  }
  objc_msgSend(v6, "finishRunningWithError:", v8);

}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

@end
