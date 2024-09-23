@implementation WFRecordAudioAction

+ (id)userInterfaceProtocol
{
  return &unk_255DFCD10;
}

+ (id)userInterfaceXPCInterface
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___WFRecordAudioAction;
  objc_msgSendSuper2(&v5, sel_userInterfaceXPCInterface);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_showWithOutputFormat_startImmediately_recordingDuration_completionHandler_, 0, 1);

  return v2;
}

+ (id)fileTypeForFormat:(int64_t)a3
{
  void *v3;
  void *v4;
  _QWORD *v5;

  switch(a3)
  {
    case 0:
      v4 = (void *)MEMORY[0x24BEC14A0];
      v5 = (_QWORD *)MEMORY[0x24BDF8268];
LABEL_7:
      objc_msgSend(v4, "typeWithUTType:", *v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 2:
      v4 = (void *)MEMORY[0x24BEC14A0];
      v5 = (_QWORD *)MEMORY[0x24BDF8650];
      goto LABEL_7;
    case 1:
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithString:", *MEMORY[0x24BEC1898]);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

+ (id)datedFilenameForFormat:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "fileTypeForFormat:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  WFLocalizedString(CFSTR("Audio Recording"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wf_datedFilenameWithTypeString:fileExtension:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v5;
  int64_t v6;
  _BOOL8 v7;
  _QWORD v8[5];

  v5 = a3;
  v6 = -[WFRecordAudioAction outputFormat](self, "outputFormat");
  v7 = -[WFRecordAudioAction startImmediately](self, "startImmediately");
  -[WFRecordAudioAction recordingDuration](self, "recordingDuration");
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__WFRecordAudioAction_runWithRemoteUserInterface_input___block_invoke;
  v8[3] = &unk_24F8B96D8;
  v8[4] = self;
  objc_msgSend(v5, "showWithOutputFormat:startImmediately:recordingDuration:completionHandler:", v6, v7, v8);

}

- (int64_t)outputFormat
{
  void *v2;
  int64_t v3;

  -[WFRecordAudioAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFRecordingCompression"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("Normal")))
    v3 = 1;
  else
    v3 = 2;

  return v3;
}

- (BOOL)startImmediately
{
  void *v2;
  char v3;

  -[WFRecordAudioAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFRecordingStart"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Immediately"));

  return v3;
}

- (double)recordingDuration
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;

  -[WFRecordAudioAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFRecordingEnd"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("After Time"));

  if (!v4)
    return 0.0;
  -[WFRecordAudioAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFRecordingTimeInterval"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BEC3CB0];
  objc_msgSend(v5, "unitString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "calendarUnitFromUnitString:", v7);

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "magnitude");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateByAddingUnit:value:toDate:options:", v8, v11, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "timeIntervalSinceNow");
  v15 = v14;

  return v15;
}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE19470], "microphoneLocation", a3);
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a5;
  v8 = a3;
  WFLocalizedString(CFSTR("Allow “%1$@” to access the Microphone?"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v9, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __56__WFRecordAudioAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (a2)
  {
    v5 = (void *)MEMORY[0x24BE19450];
    v6 = (void *)MEMORY[0x24BE19470];
    v7 = a2;
    objc_msgSend(v6, "microphoneLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemWithFile:origin:disclosureLevel:", v7, v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "output");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addItem:", v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v11);

}

@end
