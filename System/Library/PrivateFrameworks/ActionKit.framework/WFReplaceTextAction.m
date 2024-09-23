@implementation WFReplaceTextAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  __CFString *v20;
  _QWORD v21[5];
  _QWORD v22[4];
  __CFString *v23;
  __CFString *v24;
  uint64_t v25;

  v4 = a3;
  -[WFReplaceTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFReplaceTextRegularExpression"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  -[WFReplaceTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFReplaceTextCaseSensitive"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  -[WFReplaceTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFReplaceTextFind"), objc_opt_class());
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (__CFString *)v9;
  else
    v11 = &stru_24F8BBA48;
  v12 = v11;

  -[WFReplaceTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFReplaceTextReplace"), objc_opt_class());
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (__CFString *)v13;
  else
    v15 = &stru_24F8BBA48;
  v16 = v15;

  if (v6)
    v17 = v8 ^ 1u | 0x400;
  else
    v17 = v8 ^ 1u;
  v18 = objc_opt_class();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __50__WFReplaceTextAction_runAsynchronouslyWithInput___block_invoke;
  v22[3] = &unk_24F8B2588;
  v23 = v12;
  v24 = v16;
  v25 = v17;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __50__WFReplaceTextAction_runAsynchronouslyWithInput___block_invoke_2;
  v21[3] = &unk_24F8BAFA8;
  v21[4] = self;
  v19 = v16;
  v20 = v12;
  objc_msgSend(v4, "transformObjectRepresentationsForClass:usingBlock:completionHandler:", v18, v22, v21);

}

void __50__WFReplaceTextAction_runAsynchronouslyWithInput___block_invoke(_QWORD *a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(id, id, id);
  id v11;
  id v12;
  id v13;

  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v10 = a5;
  v11 = a4;
  v12 = a2;
  objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:options:range:", v7, v8, v9, 0, objc_msgSend(v12, "length"));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v10[2](v10, v13, v11);
}

uint64_t __50__WFReplaceTextAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setOutput:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

@end
