@implementation HMTimerTrigger(AutomationBuilders)

+ (id)hf_newTriggerWithBuilder:()AutomationBuilders inHome:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  objc_opt_class();
  v9 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0D519C0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __70__HMTimerTrigger_AutomationBuilders__hf_newTriggerWithBuilder_inHome___block_invoke;
    v18[3] = &unk_1EA72BB28;
    v19 = v8;
    v20 = v11;
    objc_msgSend(v12, "futureWithCompletionHandlerAdapterBlock:", v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@:%@ was passed a builder of the wrong class: %@"), a1, v14, v9);

    v15 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 33);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "futureWithError:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v13;
}

@end
