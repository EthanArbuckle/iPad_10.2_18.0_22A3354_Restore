@implementation WFFormatDateAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  char v26;

  v4 = a3;
  -[WFFormatDateAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFDateFormatStyle"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFormatDateAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTimeFormatStyle"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFormatDateAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFRelativeDateFormatStyle"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFormatDateAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFDateFormat"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFFormatDateAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFISO8601IncludeTime"), objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  -[WFFormatDateAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFLocale"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "length"))
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_opt_class();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __49__WFFormatDateAction_runAsynchronouslyWithInput___block_invoke;
  v20[3] = &unk_24F8B4B00;
  v21 = v5;
  v22 = v6;
  v23 = v7;
  v24 = v8;
  v26 = v10;
  v25 = v12;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __49__WFFormatDateAction_runAsynchronouslyWithInput___block_invoke_2;
  v19[3] = &unk_24F8BAFA8;
  v19[4] = self;
  v14 = v12;
  v15 = v8;
  v16 = v7;
  v17 = v6;
  v18 = v5;
  objc_msgSend(v4, "transformObjectRepresentationsForClass:usingBlock:completionHandler:", v13, v20, v19);

}

void __49__WFFormatDateAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5)
{
  void (**v8)(id, void *, id);
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a2;
  v8 = a5;
  v9 = a4;
  objc_msgSend(v21, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dateFromComponents:", v21);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 48);
  v17 = *(_QWORD *)(a1 + 56);
  v18 = *(unsigned __int8 *)(a1 + 72);
  objc_msgSend(v21, "timeZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "wf_formattedStringWithDateStyle:timeStyle:relativeDateStyle:customDateFormat:includeTimeForISO8601:timeZone:locale:", v14, v15, v16, v17, v18, v19, *(_QWORD *)(a1 + 64));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v8[2](v8, v20, v9);
}

void __49__WFFormatDateAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

@end
