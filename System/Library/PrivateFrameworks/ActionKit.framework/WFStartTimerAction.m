@implementation WFStartTimerAction

- (id)parameterOverrides
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  objc_super v20;
  _QWORD v21[3];
  _QWORD v22[6];
  _QWORD v23[7];

  v23[6] = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)WFStartTimerAction;
  -[WFOverridableLinkAction parameterOverrides](&v20, sel_parameterOverrides);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v22[0] = *MEMORY[0x24BEC4510];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BEC1BC8];
  v23[0] = v5;
  v23[1] = v6;
  v7 = *MEMORY[0x24BEC45C0];
  v22[1] = *MEMORY[0x24BEC4610];
  v22[2] = v7;
  v8 = *MEMORY[0x24BEC43A8];
  v21[0] = *MEMORY[0x24BEC43B0];
  v21[1] = v8;
  v21[2] = *MEMORY[0x24BEC43A0];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BEC4580];
  v23[2] = v9;
  v23[3] = CFSTR("WFDuration");
  v11 = *MEMORY[0x24BEC45D0];
  v22[3] = v10;
  v22[4] = v11;
  WFLocalizedStringResourceWithKey(CFSTR("For how long?"), CFSTR("For how long?"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22[5] = *MEMORY[0x24BEC45B8];
  v23[4] = v12;
  v23[5] = &unk_24F939A58;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 6);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v3;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("duration"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "definitionByAddingEntriesInDictionary:", v13);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BEC3F38]), "initWithDictionary:", v13);
  }
  v18 = (void *)v17;
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("duration"));

  return v14;
}

- (id)serializedParametersForDonatedIntent:(id)a3 allowDroppingUnconfigurableValues:(BOOL)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    v7 = objc_msgSend(v6, "type");
    objc_msgSend(v6, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

    }
    else if ((v7 & 0xFFFFFFFFFFFFFFFDLL) == 0)
    {
      -[WFStartTimerAction parameterForKey:](self, "parameterForKey:", CFSTR("duration"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "duration");
      objc_msgSend(v11, "stateForDuration:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("WFDuration");
      objc_msgSend(v12, "serializedRepresentation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    v9 = 0;
LABEL_7:

    goto LABEL_8;
  }
  v9 = 0;
LABEL_8:

  return v9;
}

- (void)getValueForParameterData:(id)a3 ofProcessedParameters:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD, void *);
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  objc_super v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  v10 = a3;
  objc_msgSend(v10, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("duration"));

  if (v12)
  {
    objc_msgSend(v10, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKey:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v15 = v14;
      else
        v15 = 0;
    }
    else
    {
      v15 = 0;
    }
    v10 = v15;

    objc_msgSend(v10, "magnitude");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = v17;

    if (v18 <= 0.0)
    {
      v34 = (void *)MEMORY[0x24BDD1540];
      v35 = *MEMORY[0x24BEC47B0];
      v44 = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("Please provide a duration for the timer."));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v22;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, &v44, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "errorWithDomain:code:userInfo:", v35, 5, v25);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0, v30);
    }
    else
    {
      v19 = (void *)MEMORY[0x24BEC3CB0];
      objc_msgSend(v10, "unitString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "calendarUnitFromUnitString:", v20);

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "magnitude");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "dateByAddingUnit:value:toDate:options:", v21, objc_msgSend(v24, "integerValue"), v22, 0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v25, "timeIntervalSinceDate:", v22);
      v27 = v26;
      if (v26 >= 86400.0)
      {
        v36 = (void *)MEMORY[0x24BDD1540];
        v37 = *MEMORY[0x24BEC47B0];
        v42 = *MEMORY[0x24BDD0FC8];
        WFLocalizedString(CFSTR("The timer's duration must be less than 24 hours."));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = v38;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "errorWithDomain:code:userInfo:", v37, 5, v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, 0, v40);

        goto LABEL_14;
      }
      v28 = objc_alloc(MEMORY[0x24BDD1660]);
      objc_msgSend(MEMORY[0x24BDD18D8], "seconds");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(v28, "initWithDoubleValue:unit:", v29, v27);

      v31 = objc_alloc(MEMORY[0x24BE5FE00]);
      objc_msgSend(MEMORY[0x24BE5FCF0], "durationValueType");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)objc_msgSend(v31, "initWithValue:valueType:", v30, v32);
      ((void (**)(id, void *, void *))v9)[2](v9, v33, 0);

    }
LABEL_14:

    goto LABEL_15;
  }
  v41.receiver = self;
  v41.super_class = (Class)WFStartTimerAction;
  -[WFAppIntentExecutionAction getValueForParameterData:ofProcessedParameters:completionHandler:](&v41, sel_getValueForParameterData_ofProcessedParameters_completionHandler_, v10, v8, v9);
LABEL_15:

}

- (id)sessionKitSessionConfiguration
{
  void *v2;
  void *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "hasSystemAperture") & 1) != 0)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC3A70]), "initWithBundleIdentifier:toastDurationPerRunSource:", CFSTR("com.apple.mobiletimerd"), 0);
  }
  else
  {
    getWFSessionKitLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[WFStartTimerAction sessionKitSessionConfiguration]";
      _os_log_impl(&dword_22D353000, v4, OS_LOG_TYPE_DEFAULT, "%s Opting Start Timer out of session assertions because we're on a non-Dynamic Island device and they don't yet support banner presentations...", (uint8_t *)&v6, 0xCu);
    }

    v3 = 0;
  }

  return v3;
}

- (id)sessionKitSessionInvocationType
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BEC1440], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasSystemAperture"))
    v3 = (id)*MEMORY[0x24BEC4308];
  else
    v3 = 0;

  return v3;
}

@end
