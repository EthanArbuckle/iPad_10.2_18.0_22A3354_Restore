@implementation WFConvertTimeZoneAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  -[WFConvertTimeZoneAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("SourceTimeZone"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFConvertTimeZoneAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("DestinationTimeZone"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v10[4] = self;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__WFConvertTimeZoneAction_runAsynchronouslyWithInput___block_invoke;
  v11[3] = &unk_24F8BAF80;
  v12 = v5;
  v13 = v6;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__WFConvertTimeZoneAction_runAsynchronouslyWithInput___block_invoke_2;
  v10[3] = &unk_24F8BAFA8;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v4, "transformObjectRepresentationsForClass:usingBlock:completionHandler:", v7, v11, v10);

}

void __54__WFConvertTimeZoneAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  void *v8;
  void (**v9)(id, void *, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v7 = a2;
  v8 = (void *)MEMORY[0x24BDBCE48];
  v9 = a5;
  objc_msgSend(v8, "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 32);
  v16 = v7;
  objc_msgSend(v11, "timeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTimeZone:", v12);

  objc_msgSend(v10, "dateFromComponents:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "timeZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsInTimeZone:fromDate:", v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v9[2](v9, v15, 0);
}

void __54__WFConvertTimeZoneAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

@end
