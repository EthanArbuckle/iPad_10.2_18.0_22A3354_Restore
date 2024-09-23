@implementation WFAskForInputAction

- (id)appResource
{
  return 0;
}

- (NSString)inputType
{
  return (NSString *)-[WFAskForInputAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFInputType"), objc_opt_class());
}

- (NSString)promptText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  __CFString *v9;
  id v10;
  void *v11;
  void *v13;

  -[WFAskForInputAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAskActionPrompt"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAskForInputAction inputType](self, "inputType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (objc_msgSend(v3, "length"))
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("Text")))
    {
      v9 = CFSTR("What’s the text?");
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Number")))
    {
      v9 = CFSTR("What number?");
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("URL")))
    {
      v9 = CFSTR("What URL?");
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Date")))
    {
      v9 = CFSTR("What date?");
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Time")))
    {
      v9 = CFSTR("What time?");
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("Date and Time")))
      {
        -[WFAskForInputAction parameterForKey:](self, "parameterForKey:", CFSTR("WFAskActionPrompt"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedPlaceholder");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_20;
      }
      v9 = CFSTR("What date and time?");
    }
    WFLocalizedString(v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v3;
  }
  v11 = v10;
LABEL_20:

  return (NSString *)v11;
}

- (NSString)defaultAnswer
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;

  -[WFAskForInputAction inputType](self, "inputType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Number")))
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("URL")) & 1) != 0)
    {
      v7 = CFSTR("WFAskActionDefaultAnswerURL");
    }
    else
    {
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Date")) & 1) != 0)
      {
        v7 = CFSTR("WFAskActionDefaultAnswerDate");
      }
      else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Time")) & 1) != 0)
      {
        v7 = CFSTR("WFAskActionDefaultAnswerTime");
      }
      else
      {
        if (!objc_msgSend(v3, "isEqualToString:", CFSTR("Date and Time")))
        {
          v7 = CFSTR("WFAskActionDefaultAnswer");
          goto LABEL_12;
        }
        v7 = CFSTR("WFAskActionDefaultAnswerDateAndTime");
      }
      v4 = objc_opt_class();
    }
LABEL_12:
    -[WFAskForInputAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", v7, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  -[WFAskForInputAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAskActionDefaultAnswerNumber"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16F0], "localizedStringFromNumber:numberStyle:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return (NSString *)v6;
}

- (BOOL)immediatelyActivateWatchDictation
{
  void *v2;
  char v3;

  -[WFAskForInputAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAskActionImmediateDictation"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)datePickerModeFromInputType:(id)a3
{
  id v3;
  id *v4;
  int v5;
  id v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Date")) & 1) != 0)
  {
    v4 = (id *)MEMORY[0x24BEC1828];
  }
  else
  {
    v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("Time"));
    v4 = (id *)MEMORY[0x24BEC1830];
    if (v5)
      v4 = (id *)MEMORY[0x24BEC1838];
  }
  v6 = *v4;

  return v6;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  id v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _QWORD *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  int v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[5];
  id v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t);
  void *v53;
  WFAskForInputAction *v54;
  _QWORD block[4];
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  NSObject *v60;
  objc_super v61;
  _QWORD v62[5];

  v62[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFAskForInputAction userInterface](self, "userInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userInterfaceType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE19948]);

  if (v7)
  {
    v61.receiver = self;
    v61.super_class = (Class)WFAskForInputAction;
    -[WFHandleIntentAction runAsynchronouslyWithInput:](&v61, sel_runAsynchronouslyWithInput_, v4);
  }
  else
  {
    v62[0] = CFSTR("Date");
    v62[1] = CFSTR("Time");
    v62[2] = CFSTR("Date and Time");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v62, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAskForInputAction inputType](self, "inputType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "containsObject:", v9);

    objc_msgSend(MEMORY[0x24BE19370], "alertWithPreferredStyle:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAskForInputAction promptText](self, "promptText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTitle:", v12);

    v13 = dispatch_group_create();
    v14 = MEMORY[0x24BDAC760];
    if (v10)
    {
      v15 = objc_alloc_init(MEMORY[0x24BEC1430]);
      -[WFAskForInputAction inputType](self, "inputType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAskForInputAction datePickerModeFromInputType:](self, "datePickerModeFromInputType:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setDatePickerMode:", v17);

      -[WFAskForInputAction defaultAnswer](self, "defaultAnswer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        dispatch_group_enter(v13);
        v19 = (void *)MEMORY[0x24BE19450];
        -[WFAskForInputAction defaultAnswer](self, "defaultAnswer");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "itemWithObject:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = v14;
        v58[1] = 3221225472;
        v58[2] = __50__WFAskForInputAction_runAsynchronouslyWithInput___block_invoke;
        v58[3] = &unk_24F8B31A0;
        v59 = v15;
        v60 = v13;
        objc_msgSend(v21, "getObjectRepresentation:forClass:", v58, objc_opt_class());

      }
      block[0] = v14;
      v22 = &unk_22D6AD000;
      block[1] = 3221225472;
      block[2] = __50__WFAskForInputAction_runAsynchronouslyWithInput___block_invoke_2;
      block[3] = &unk_24F8BA480;
      v56 = v11;
      v57 = v15;
      v23 = v15;
      dispatch_group_notify(v13, MEMORY[0x24BDAC9B8], block);

    }
    else
    {
      -[WFAskForInputAction inputType](self, "inputType");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("Number"));

      if (v25)
      {
        -[WFAskForInputAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAskActionAllowsDecimalNumbers"), objc_opt_class());
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v26, "BOOLValue");

        -[WFAskForInputAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAskActionAllowsNegativeNumbers"), objc_opt_class());
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "BOOLValue");

        v23 = objc_alloc_init(MEMORY[0x24BEC1628]);
        -[WFAskForInputAction defaultAnswer](self, "defaultAnswer");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setText:", v29);

        v30 = (_QWORD *)MEMORY[0x24BEC1B00];
        if (!v44)
          v30 = (_QWORD *)MEMORY[0x24BEC1B20];
        objc_msgSend(v23, "setKeyboardType:", *v30);
        objc_msgSend(v23, "setAllowsNegativeNumbers:", v28);
        objc_msgSend(v23, "setPlaceholder:", CFSTR("0"));
        objc_msgSend(v11, "setTextFieldConfiguration:", v23);
        v22 = (_QWORD *)&unk_22D6AD000;
      }
      else
      {
        v23 = objc_alloc_init(MEMORY[0x24BEC1628]);
        -[WFAskForInputAction defaultAnswer](self, "defaultAnswer");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setText:", v31);

        -[WFAskForInputAction inputType](self, "inputType");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("URL"));

        if (v33)
        {
          objc_msgSend(v23, "setKeyboardType:", *MEMORY[0x24BEC1B40]);
          objc_msgSend(v23, "setAutocapitalizationType:", *MEMORY[0x24BEC1AA0]);
          objc_msgSend(v23, "setAutocorrectionType:", *MEMORY[0x24BEC1AC0]);
          objc_msgSend(v23, "setTextContentType:", *MEMORY[0x24BEC1C98]);
          objc_msgSend(v23, "setReturnKeyType:", *MEMORY[0x24BEC1B60]);
          WFLocalizedString(CFSTR("URL"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setPlaceholder:", v34);

        }
        else
        {
          -[WFAskForInputAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAllowsMultilineText"), objc_opt_class());
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v35, "BOOLValue");

          objc_msgSend(v23, "setMultiline:", v36);
          v37 = (_QWORD *)MEMORY[0x24BEC1B58];
          if (!(_DWORD)v36)
            v37 = (_QWORD *)MEMORY[0x24BEC1B60];
          objc_msgSend(v23, "setReturnKeyType:", *v37);
        }
        v22 = &unk_22D6AD000;
        objc_msgSend(v11, "setTextFieldConfiguration:", v23);
      }
    }

    v50 = v14;
    v51 = v22[22];
    v38 = v51;
    v52 = __50__WFAskForInputAction_runAsynchronouslyWithInput___block_invoke_3;
    v53 = &unk_24F8BB638;
    v54 = self;
    objc_msgSend(MEMORY[0x24BE19378], "cancelButtonWithHandler:", &v50);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)MEMORY[0x24BE19378];
    v47[0] = v14;
    v47[1] = v38;
    v47[2] = __50__WFAskForInputAction_runAsynchronouslyWithInput___block_invoke_4;
    v47[3] = &unk_24F8B31C8;
    v49 = v10;
    v47[4] = self;
    v41 = v11;
    v48 = v41;
    objc_msgSend(v40, "okButtonWithHandler:", v47);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addButton:", v39);
    objc_msgSend(v41, "addButton:", v42);
    v45[0] = v14;
    v45[1] = v38;
    v45[2] = __50__WFAskForInputAction_runAsynchronouslyWithInput___block_invoke_5;
    v45[3] = &unk_24F8BA480;
    v45[4] = self;
    v46 = v41;
    v43 = v41;
    dispatch_group_notify(v13, MEMORY[0x24BDAC9B8], v45);

  }
}

- (void)getOutputFromIntentResponse:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, void *);
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, void *))a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFAskForInputAction.m"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  v9 = objc_opt_class();
  v10 = v7;
  if (v10 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315906;
      v23 = "WFEnforceClass";
      v24 = 2114;
      v25 = v10;
      v26 = 2114;
      v27 = (id)objc_opt_class();
      v28 = 2114;
      v29 = v9;
      v13 = v27;
      _os_log_impl(&dword_22D353000, v12, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

    }
    v11 = 0;
  }
  else
  {
    v11 = v10;
  }

  objc_msgSend(v11, "result");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (!v14)
    goto LABEL_21;
  switch(objc_msgSend(v14, "type"))
  {
    case 1:
      objc_msgSend(v15, "stringValue");
      v16 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(v15, "numberValue");
      v16 = objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(v15, "urlValue");
      v16 = objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend(v15, "dateValue");
      v16 = objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend(v15, "timeValue");
      v16 = objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      objc_msgSend(v15, "dateAndTimeValue");
      v16 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      goto LABEL_21;
  }
  v17 = (void *)v16;
  if (v16)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dateFromComponents:", v17);
      v19 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v19;
    }
    v20 = (void *)objc_opt_new();
    objc_msgSend(v20, "addObject:", v17);
    v8[2](v8, v20);

  }
  else
  {
LABEL_21:
    v8[2](v8, 0);
  }

}

- (void)finishRunningWithResultText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[2];
  int v34;
  double v35;

  v4 = a3;
  -[WFAskForInputAction inputType](self, "inputType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "length"))
    goto LABEL_28;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("URL")))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x24BE19660], "stringMatchesExactly:", v4))
    {
      objc_msgSend(v6, "scheme");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        v8 = (void *)MEMORY[0x24BDBCF48];
        objc_msgSend(CFSTR("http://"), "stringByAppendingString:", v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "URLWithString:", v9);
        v10 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v10;
      }
    }
    if (v6)
      v11 = v6;
    else
      v11 = v4;
    v12 = v11;

    if (!v12)
      goto LABEL_28;
    goto LABEL_27;
  }
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("Number")))
  {
    v12 = v4;
    if (!v12)
      goto LABEL_28;
    goto LABEL_27;
  }
  v13 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(MEMORY[0x24BDD1690], "decimalDigitCharacterSet");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "minusSign");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addCharactersInString:", v15);

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", *MEMORY[0x24BDBCB00]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addCharactersInString:", v17);

  objc_msgSend(v14, "invertedSet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE194B8], "resultsForString:ofTypes:error:", v4, 0x200000000, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "number");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    if (objc_msgSend(v4, "wf_stringContainsCharacterInSet:", v18))
      v21 = v20;
    else
      v21 = v4;
    v12 = v21;
  }
  else
  {
    v32 = v13;
    objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "componentsJoinedByString:", &stru_24F8BBA48);
    v23 = objc_claimAutoreleasedReturnValue();

    v31 = (void *)v23;
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setLocale:", v25);

    v35 = 0.0;
    v26 = objc_msgSend(v24, "scanDouble:", &v35);
    v27 = (void *)MEMORY[0x24BDD1518];
    if (v26)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v35);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
      {
        objc_msgSend(v28, "decimalValue");
      }
      else
      {
        v33[0] = 0;
        v33[1] = 0;
        v34 = 0;
      }
      objc_msgSend(v27, "decimalNumberWithDecimal:", v33);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1518], "notANumber");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }

    v13 = v32;
  }

  if (v12)
  {
LABEL_27:
    -[WFAskForInputAction output](self, "output");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObject:", v12);

  }
LABEL_28:
  -[WFHandleIntentAction finishRunningWithError:](self, "finishRunningWithError:", 0);

}

- (void)finishRunningWithDate:(id)a3
{
  id v4;
  void *v5;

  if (a3)
  {
    v4 = a3;
    -[WFAskForInputAction output](self, "output");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v4);

  }
  -[WFHandleIntentAction finishRunningWithError:](self, "finishRunningWithError:", 0);
}

- (id)outputContentClasses
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  -[WFAskForInputAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFInputType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Text")))
  {
    v14[0] = objc_opt_class();
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = v14;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("Number")))
  {
    v13 = objc_opt_class();
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = &v13;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("URL")))
  {
    v12 = objc_opt_class();
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = &v12;
  }
  else
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Date")) & 1) == 0
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("Time")) & 1) == 0
      && !objc_msgSend(v4, "isEqualToString:", CFSTR("Date and Time")))
    {
      v10.receiver = self;
      v10.super_class = (Class)WFAskForInputAction;
      -[WFAskForInputAction outputContentClasses](&v10, sel_outputContentClasses);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    v11 = objc_opt_class();
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = &v11;
  }
  objc_msgSend(v5, "arrayWithObjects:count:", v6, 1);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v8 = (void *)v7;

  return v8;
}

void __50__WFAskForInputAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "setDefaultDate:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __50__WFAskForInputAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDatePickerConfiguration:", *(_QWORD *)(a1 + 40));
}

void __50__WFAskForInputAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "finishRunningWithError:", v2);

}

void __50__WFAskForInputAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1)
{
  int v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v1)
  {
    objc_msgSend(v2, "datePickerResult");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishRunningWithDate:");
  }
  else
  {
    objc_msgSend(v2, "textFieldResults");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishRunningWithResultText:", v4);

  }
}

void __50__WFAskForInputAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "userInterface");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentAlert:", *(_QWORD *)(a1 + 40));

}

@end
