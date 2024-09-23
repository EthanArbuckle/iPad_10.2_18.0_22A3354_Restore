@implementation WFGenerateMachineReadableCodeAction

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  v14[0] = CFSTR("Low");
  v14[1] = CFSTR("Medium");
  v15[0] = CFSTR("L");
  v15[1] = CFSTR("M");
  v14[2] = CFSTR("Quartile");
  v14[3] = CFSTR("High");
  v15[2] = CFSTR("Q");
  v15[3] = CFSTR("H");
  v4 = (void *)MEMORY[0x24BDBCE70];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGenerateMachineReadableCodeAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFQRErrorCorrectionLevel"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  v11[4] = self;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __66__WFGenerateMachineReadableCodeAction_runAsynchronouslyWithInput___block_invoke;
  v12[3] = &unk_24F8B90A8;
  v13 = v8;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __66__WFGenerateMachineReadableCodeAction_runAsynchronouslyWithInput___block_invoke_2;
  v11[3] = &unk_24F8BAFA8;
  v10 = v8;
  objc_msgSend(v5, "transformObjectRepresentationsForClass:usingBlock:completionHandler:", v9, v12, v11);

}

void __66__WFGenerateMachineReadableCodeAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void (**a5)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;
  id v11;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = a5;
  v10 = a4;
  +[WFMachineReadableCodeContentItem qrCodeItemWithString:errorCorrectionLevel:](WFMachineReadableCodeContentItem, "qrCodeItemWithString:errorCorrectionLevel:", a2, v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id))a5)[2](v9, v11, v10);

}

void __66__WFGenerateMachineReadableCodeAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

@end
