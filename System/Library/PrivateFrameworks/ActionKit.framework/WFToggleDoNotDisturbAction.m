@implementation WFToggleDoNotDisturbAction

- (id)appResource
{
  return 0;
}

- (id)appIdentifier
{
  return 0;
}

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

- (id)displayableAppDescriptor
{
  return 0;
}

- (void)resolveSlot:(id)a3 withProcessedValue:(id)a4 parameter:(id)a5 input:(id)a6 completion:(id)a7
{
  id v12;
  void (**v13)(id, id, _QWORD);
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  id v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  objc_super v61;
  _QWORD v62[4];
  void (**v63)(id, id, _QWORD);
  objc_super v64;
  _QWORD v65[4];
  id v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  _QWORD v73[3];
  _QWORD v74[5];

  v74[3] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v55 = a4;
  v58 = a5;
  v57 = a6;
  v13 = (void (**)(id, id, _QWORD))a7;
  -[WFToggleDoNotDisturbAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("Operation"), objc_opt_class());
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFToggleDoNotDisturbAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("Enabled"), objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  -[WFToggleDoNotDisturbAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("AssertionType"), objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFToggleDoNotDisturbAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("FocusModes"), objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = CFSTR("Time");
  v73[1] = CFSTR("I Leave");
  v74[0] = CFSTR("duration");
  v74[1] = CFSTR("location");
  v73[2] = CFSTR("Event Ends");
  v74[2] = CFSTR("event");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v74, v73, 3);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "wf_slotName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a6) = objc_msgSend(v18, "isEqualToString:", CFSTR("mode"));

  v60 = v12;
  if ((_DWORD)a6)
  {
    objc_msgSend(MEMORY[0x24BEC3D40], "availableModes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = MEMORY[0x24BDAC760];
    v65[1] = 3221225472;
    v65[2] = __88__WFToggleDoNotDisturbAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke;
    v65[3] = &unk_24F8B56B8;
    v20 = v17;
    v66 = v20;
    objc_msgSend(v19, "if_objectsPassingTest:", v65);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    v23 = v17;
    if (v22)
    {
      v13[2](v13, v20, 0);
    }
    else
    {
      v36 = (void *)MEMORY[0x24BDD1540];
      v71 = *MEMORY[0x24BDD0FC8];
      v37 = (void *)MEMORY[0x24BDD17C8];
      WFLocalizedString(CFSTR("The action could not run because a Focus named “%@” does not exist on this device. You can create a new Focus in Settings."));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "displayString");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringWithFormat:", v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = v40;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("WFToggleDoNotDisturbActionErrorDomain"), 0, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, id, void *))v13)[2](v13, 0, v42);

    }
    v28 = v16;

    v33 = v55;
    v27 = v56;
LABEL_20:
    v34 = v57;
    v35 = v58;
    goto LABEL_21;
  }
  v24 = v17;
  objc_msgSend(v12, "wf_slotName");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("state"));

  if (v26)
  {
    v27 = v56;
    v28 = v16;
    v23 = v24;
    if (objc_msgSend(v56, "isEqualToString:", CFSTR("Toggle")))
    {
      v13[2](v13, &unk_24F93A580, 0);
    }
    else
    {
      if (v15)
        v43 = &unk_24F93A598;
      else
        v43 = &unk_24F93A5B0;
      v13[2](v13, v43, 0);
    }
    v33 = v55;
    goto LABEL_20;
  }
  v28 = v16;
  if (!v15
    || (objc_msgSend(v59, "objectForKeyedSubscript:", v16),
        v29 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v60, "wf_slotName"),
        v30 = (void *)objc_claimAutoreleasedReturnValue(),
        v31 = objc_msgSend(v29, "isEqualToString:", v30),
        v30,
        v29,
        (v31 & 1) == 0))
  {
    v64.receiver = self;
    v64.super_class = (Class)WFToggleDoNotDisturbAction;
    v33 = v55;
    v34 = v57;
    v35 = v58;
    -[WFHandleIntentAction resolveSlot:withProcessedValue:parameter:input:completion:](&v64, sel_resolveSlot_withProcessedValue_parameter_input_completion_, v60, v55, v58, v57, v13);
    goto LABEL_14;
  }
  if (objc_msgSend(v16, "isEqualToString:", CFSTR("I Leave")))
  {
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9EC8]), "initWithIdentifier:displayString:", 0, CFSTR("Current Location"));
    v13[2](v13, v32, 0);

    v33 = v55;
    v34 = v57;
    v35 = v58;
LABEL_14:
    v27 = v56;
    v23 = v24;
    goto LABEL_21;
  }
  v44 = objc_msgSend(v16, "isEqualToString:", CFSTR("Time"));
  v33 = v55;
  if (v44)
  {
    v45 = v55;
    v35 = v58;
    v23 = v17;
    if (v45 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v45, "compare:", v46);

      if (v47 == -1)
      {
        v69 = *MEMORY[0x24BDD0FC8];
        WFLocalizedString(CFSTR("Please provide an end time that is later than the current time for Do Not Disturb."));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v53;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 5, v49);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, id, void *))v13)[2](v13, 0, v54);

      }
      else
      {
        v48 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v45, "timeIntervalSinceNow");
        objc_msgSend(v48, "numberWithDouble:");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v13[2](v13, v49, 0);
      }
    }
    else
    {

      v67 = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("An invalid end time was provided. Please provide an end time for Do Not Disturb."));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v51;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
      v45 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 5, v45);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, id, void *))v13)[2](v13, 0, v49);
    }
    v34 = v57;

    v27 = v56;
  }
  else
  {
    v35 = v58;
    v27 = v56;
    v23 = v24;
    if (objc_msgSend(v28, "isEqualToString:", CFSTR("Event Ends")))
    {
      v34 = v57;
      if (v55)
        v50 = v55;
      else
        v50 = (id)objc_opt_new();
      v52 = v50;
      v62[0] = MEMORY[0x24BDAC760];
      v62[1] = 3221225472;
      v62[2] = __88__WFToggleDoNotDisturbAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_168;
      v62[3] = &unk_24F8B56E0;
      v63 = v13;
      objc_msgSend(v52, "getObjectRepresentation:forClass:", v62, objc_opt_class());

    }
    else
    {
      v61.receiver = self;
      v61.super_class = (Class)WFToggleDoNotDisturbAction;
      v34 = v57;
      -[WFHandleIntentAction resolveSlot:withProcessedValue:parameter:input:completion:](&v61, sel_resolveSlot_withProcessedValue_parameter_input_completion_, v60, v55, v58, v57, v13);
    }
  }
LABEL_21:

}

- (void)generatePopulatedIntentFromInput:(id)a3 processedParameters:(id)a4 completion:(id)a5
{
  id v8;
  objc_super v9;
  _QWORD v10[4];
  id v11;

  v10[1] = 3221225472;
  v10[2] = __94__WFToggleDoNotDisturbAction_generatePopulatedIntentFromInput_processedParameters_completion___block_invoke;
  v10[3] = &unk_24F8B5708;
  v11 = a5;
  v9.receiver = self;
  v9.super_class = (Class)WFToggleDoNotDisturbAction;
  v10[0] = MEMORY[0x24BDAC760];
  v8 = v11;
  -[WFHandleIntentAction generatePopulatedIntentFromInput:processedParameters:completion:](&v9, sel_generatePopulatedIntentFromInput_processedParameters_completion_, a3, a4, v10);

}

void __94__WFToggleDoNotDisturbAction_generatePopulatedIntentFromInput_processedParameters_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (v5)
  {
    a3;
    objc_msgSend(v5, "setValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("userInteractive"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, a3);
  }

}

uint64_t __88__WFToggleDoNotDisturbAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "activityDisplayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "displayString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

void __88__WFToggleDoNotDisturbAction_resolveSlot_withProcessedValue_parameter_input_completion___block_invoke_168(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (!v7 || v9)
  {
    v19 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("No calendar event was provided. Please provide a calendar event to enable Do Not Disturb for that duration."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = *(_QWORD *)(a1 + 32);
    if (v10)
    {
      (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 5, v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *))(v17 + 16))(v17, 0, v18);

    }
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = objc_alloc(MEMORY[0x24BDD9EC8]);
    objc_msgSend(v7, "uniqueId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithIdentifier:displayString:", v13, v8);
    (*(void (**)(uint64_t, void *, _QWORD))(v11 + 16))(v11, v14, 0);

  }
}

@end
