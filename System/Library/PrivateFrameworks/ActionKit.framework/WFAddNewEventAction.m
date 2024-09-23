@implementation WFAddNewEventAction

- (void)wasAddedToWorkflow:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFAddNewEventAction;
  -[WFAddNewEventAction wasAddedToWorkflow:](&v5, sel_wasAddedToWorkflow_, a3);
  -[WFAddNewEventAction resourceManager](self, "resourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:selector:", self, sel_updateCalendars);

}

- (void)wasRemovedFromWorkflow:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFAddNewEventAction;
  -[WFAddNewEventAction wasRemovedFromWorkflow:](&v5, sel_wasRemovedFromWorkflow_, a3);
  -[WFAddNewEventAction resourceManager](self, "resourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:selector:", self, sel_updateCalendars);

}

- (void)updateCalendars
{
  id v2;

  -[WFAddNewEventAction parameterForKey:](self, "parameterForKey:", CFSTR("WFCalendarDescriptor"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "possibleStatesLoadingState") == 2)
    objc_msgSend(v2, "loadPossibleStatesWithCompletionHandler:", &__block_literal_global_26027);

}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];

  -[WFAddNewEventAction resourceManager](self, "resourceManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceObjectsOfClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "status") != 4)
  {
    objc_msgSend(v6, "availabilityError");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  -[WFAddNewEventAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("ShowWhenRun"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  -[WFAddNewEventAction userInterface](self, "userInterface");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isRunningWithSiriUI");

  if (v10 && v8)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "wfUnsupportedUserInterfaceError");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v12 = (void *)v11;
    -[WFAddNewEventAction finishRunningWithError:](self, "finishRunningWithError:", v11);

    goto LABEL_7;
  }
  if (v8)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __50__WFAddNewEventAction_runAsynchronouslyWithInput___block_invoke;
    v13[3] = &unk_24F8B5548;
    v13[4] = self;
    -[WFAddNewEventAction requestInterfacePresentationWithCompletionHandler:](self, "requestInterfacePresentationWithCompletionHandler:", v13);
  }
  else
  {
    -[WFAddNewEventAction runWithoutUI](self, "runWithoutUI");
  }
LABEL_7:

}

- (void)runWithoutUI
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;

  v3 = (void *)objc_opt_class();
  -[WFAddNewEventAction processedParameters](self, "processedParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v3, "eventFromParameters:requiringFullySpecifiedEvent:error:", v4, 1, &v21);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v21;

  if (v5)
  {
    WFGetWorkflowEventStore();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v6;
    v8 = objc_msgSend(v7, "saveEvent:span:commit:error:", v5, 0, 1, &v20);
    v9 = v20;

    if (v8)
    {
      -[WFAddNewEventAction processedParameters](self, "processedParameters");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", CFSTR("WFAlertTime"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v12 = v11;
        else
          v12 = 0;
      }
      else
      {
        v12 = 0;
      }
      v13 = v12;

      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("None"));
      if (!v14
        || (objc_msgSend(v5, "setAlarms:", 0),
            v19 = v9,
            v15 = objc_msgSend(v7, "saveEvent:span:commit:error:", v5, 0, 1, &v19),
            v16 = v19,
            v9,
            v9 = v16,
            v15))
      {
        -[WFAddNewEventAction output](self, "output");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BE193E0], "itemWithEKEvent:fromEventStore:", v5, v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addItem:", v18);

      }
    }
    -[WFAddNewEventAction finishRunningWithError:](self, "finishRunningWithError:", v9);

    v6 = v9;
  }
  else
  {
    -[WFAddNewEventAction finishRunningWithError:](self, "finishRunningWithError:", v6);
  }

}

- (id)currentSelectedCalendar
{
  void *v2;
  void *v3;

  -[WFAddNewEventAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFCalendarDescriptor"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "calendarFromDescriptor:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)contentDestinationWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WFAddNewEventAction currentSelectedCalendar](self, "currentSelectedCalendar", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[WFAddNewEventAction appDefinition](self, "appDefinition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)MEMORY[0x24BE19470];
      objc_msgSend(v4, "source");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "locationWithCalendarSource:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
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
  WFLocalizedString(CFSTR("Allow “%1$@” to use %2$@ in a new calendar event?"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v9, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)updateForcesAllDayFlags
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[WFAddNewEventAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFCalendarItemAllDay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  objc_msgSend(v5, "number");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "BOOLValue");
  -[WFAddNewEventAction parameterForKey:](self, "parameterForKey:", CFSTR("WFCalendarItemStartDate"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[WFAddNewEventAction parameterForKey:](self, "parameterForKey:", CFSTR("WFCalendarItemEndDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setForcesAllDayDates:", v7);
  objc_msgSend(v8, "setForcesAllDayDates:", v7);

}

- (void)initializeParameters
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFAddNewEventAction;
  -[WFAddNewEventAction initializeParameters](&v3, sel_initializeParameters);
  -[WFAddNewEventAction updateForcesAllDayFlags](self, "updateForcesAllDayFlags");
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  _BOOL4 v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)WFAddNewEventAction;
  v7 = -[WFAddNewEventAction setParameterState:forKey:](&v9, sel_setParameterState_forKey_, a3, v6);
  if (v7 && objc_msgSend(v6, "isEqualToString:", CFSTR("WFCalendarItemAllDay")))
    -[WFAddNewEventAction updateForcesAllDayFlags](self, "updateForcesAllDayFlags");

  return v7;
}

- (BOOL)requiresUnlock
{
  void *v2;
  char v3;

  -[WFAddNewEventAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("ShowWhenRun"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

void __50__WFAddNewEventAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  if (a3)
  {
    objc_msgSend(v6, "finishRunningWithError:", a3);
  }
  else
  {
    objc_msgSend(v6, "processedParameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __50__WFAddNewEventAction_runAsynchronouslyWithInput___block_invoke_2;
    v8[3] = &unk_24F8BB768;
    v8[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "showWithEventParameters:completionHandler:", v7, v8);

  }
}

void __50__WFAddNewEventAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a2;
  WFGetWorkflowEventStore();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventWithIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "output");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE193E0], "itemWithEKEvent:fromEventStore:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addItem:", v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v10);

}

+ (double)relativeOffsetFromTimeString:(id)a3
{
  id v3;
  double v4;

  v3 = a3;
  v4 = 0.0;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("At time of event")) & 1) == 0)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("5 minutes before")) & 1) != 0)
    {
      v4 = -300.0;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("15 minutes before")) & 1) != 0)
    {
      v4 = -900.0;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("30 minutes before")) & 1) != 0)
    {
      v4 = -1800.0;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("1 hour before")) & 1) != 0)
    {
      v4 = -3600.0;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("2 hours before")) & 1) != 0)
    {
      v4 = -7200.0;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("1 day before")) & 1) != 0)
    {
      v4 = -86400.0;
    }
    else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("2 days before")) & 1) != 0)
    {
      v4 = -172800.0;
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("1 week before")))
    {
      v4 = -604800.0;
    }
    else
    {
      v4 = 0.0;
    }
  }

  return v4;
}

+ (id)eventFromParameters:(id)a3 requiringFullySpecifiedEvent:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  void *v19;
  void *v20;
  id v21;
  void (**v22)(void *, void *);
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  int v35;
  int v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v56;
  void *v57;
  _BOOL4 v58;
  void *v59;
  id v60;
  id *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  _QWORD aBlock[5];

  v6 = a4;
  v8 = a3;
  objc_msgSend(v8, "objectForKey:", CFSTR("WFCalendarItemTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  objc_msgSend(v8, "objectForKey:", CFSTR("WFCalendarItemLocation"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  objc_msgSend(v8, "objectForKey:", CFSTR("WFCalendarItemAllDay"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
  }
  else
  {
    v16 = 0;
  }
  v17 = v16;

  v18 = objc_msgSend(v17, "BOOLValue");
  objc_msgSend(v8, "objectForKey:", CFSTR("WFCalendarItemNotes"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v20 = v19;
    else
      v20 = 0;
  }
  else
  {
    v20 = 0;
  }
  v21 = v20;

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__WFAddNewEventAction_eventFromParameters_requiringFullySpecifiedEvent_error___block_invoke;
  aBlock[3] = &__block_descriptor_40_e18__16__0__NSString_8l;
  aBlock[4] = a5;
  v22 = (void (**)(void *, void *))_Block_copy(aBlock);
  if (objc_msgSend(v11, "length") || !v6)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("WFCalendarItemStartDate"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = a5;
    v66 = a1;
    if (v25)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v26 = v25;
      else
        v26 = 0;
    }
    else
    {
      v26 = 0;
    }
    v23 = v26;

    objc_msgSend(v23, "date");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v27 && v6)
    {
      WFLocalizedString(CFSTR("An invalid start date was provided. Please provide a start date for this event."));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v22[2](v22, v28);
      v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_79:

      goto LABEL_80;
    }
    objc_msgSend(v8, "objectForKey:", CFSTR("WFCalendarItemEndDate"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v21;
    if (v29)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v30 = v29;
      else
        v30 = 0;
    }
    else
    {
      v30 = 0;
    }
    v31 = v30;

    objc_msgSend(v31, "date");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = v27;
    objc_msgSend(v66, "endDateByCorrectingDate:withStartDate:", v32, v27);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v65 = v14;
    v60 = v31;
    if (v18)
    {
      v58 = v33 != 0;
      v34 = 1;
    }
    else
    {
      v35 = objc_msgSend(v23, "timeIsSignificant");
      v34 = (v35 | objc_msgSend(v31, "timeIsSignificant")) ^ 1;
      if (v33)
        v36 = 1;
      else
        v36 = v34;
      if (((v36 | !v6) & 1) == 0)
      {
        WFLocalizedString(CFSTR("An invalid end date was provided. Please provide an end date for this event."));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (*)(void (**)(void *, void *)))v22[2])(v22);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        v21 = v59;
        v28 = v60;
        goto LABEL_78;
      }
      v58 = v33 != 0;
    }
    v21 = v59;
    WFGetWorkflowEventStore();
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("WFCalendarDescriptor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v33;
    if (v37)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v38 = v37;
      else
        v38 = 0;
    }
    else
    {
      v38 = 0;
    }
    v39 = v38;

    objc_msgSend(v66, "calendarFromDescriptor:", v39);
    v40 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDC74E0], "eventWithEventStore:", v63);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setTitle:", v11);
    if (objc_msgSend(v65, "length"))
      v42 = v65;
    else
      v42 = 0;
    objc_msgSend(v41, "setLocation:", v42);
    v57 = (void *)v40;
    objc_msgSend(v41, "setCalendar:", v40);
    objc_msgSend(v41, "setStartDate:", v64);
    objc_msgSend(v41, "setAllDay:", v34);
    if (v58)
      v43 = v33;
    else
      v43 = v64;
    objc_msgSend(v41, "setEndDate:", v43);
    if (objc_msgSend(v59, "length"))
      v44 = v59;
    else
      v44 = 0;
    objc_msgSend(v41, "setNotes:", v44);
    objc_msgSend(v8, "objectForKey:", CFSTR("WFAlertTime"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v46 = v45;
      else
        v46 = 0;
    }
    else
    {
      v46 = 0;
    }
    v14 = v65;
    v47 = v46;

    objc_msgSend(v8, "objectForKey:", CFSTR("WFAlertCustomTime"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (v48)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v49 = v48;
      else
        v49 = 0;
    }
    else
    {
      v49 = 0;
    }
    v50 = v49;

    if (objc_msgSend(v47, "isEqualToString:", CFSTR("Custom")))
    {
      if (objc_msgSend(v50, "length"))
      {
        objc_msgSend(MEMORY[0x24BE194C8], "datesInString:error:", v50, v61);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "firstObject");
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v52)
        {
          WFLocalizedString(CFSTR("The alert time provided was invalid. Please check for spelling errors and ensure you provide a time of day."));
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v22[2](v22, v56);
          v24 = (id)objc_claimAutoreleasedReturnValue();

          v14 = v65;
          goto LABEL_76;
        }
        objc_msgSend(MEMORY[0x24BDC7468], "alarmWithAbsoluteDate:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "addAlarm:", v53);

        v14 = v65;
        goto LABEL_74;
      }
    }
    else if (objc_msgSend(v47, "length"))
    {
      v54 = (void *)MEMORY[0x24BDC7468];
      objc_msgSend(v66, "relativeOffsetFromTimeString:", v47);
      objc_msgSend(v54, "alarmWithRelativeOffset:");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addAlarm:", v52);
LABEL_74:

    }
    v24 = v41;
LABEL_76:

    v28 = v60;
    v33 = v62;
LABEL_78:

    v27 = v64;
    goto LABEL_79;
  }
  WFLocalizedString(CFSTR("No title was provided. Please provide a title for this event."));
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v22[2](v22, v23);
  v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_80:

  return v24;
}

+ (id)endDateByCorrectingDate:(id)a3 withStartDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "compare:", v5) == 1)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "components:fromDate:", 32992, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "components:fromDate:", 30, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateFromComponents:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingComponents:toDate:options:", v8, v10, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v11;
  }

  return v5;
}

+ (id)calendarFromDescriptor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v3 = a3;
  WFGetWorkflowEventStore();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarsForEntityType:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "matchingCalendarsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v4, "defaultCalendarForNewEvents");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

+ (id)userInterfaceProtocol
{
  return &unk_255DFD190;
}

+ (id)userInterfaceXPCInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___WFAddNewEventAction;
  objc_msgSendSuper2(&v10, sel_userInterfaceXPCInterface);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_showWithEventParameters_completionHandler_, 0, 0);

  return v2;
}

uint64_t __78__WFAddNewEventAction_eventFromParameters_requiringFullySpecifiedEvent_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1540];
  v4 = *MEMORY[0x24BEC4270];
  v9 = *MEMORY[0x24BDD0FC8];
  v10[0] = a2;
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = a2;
  objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, 5, v7);
  **(_QWORD **)(a1 + 32) = (id)objc_claimAutoreleasedReturnValue();

  return 0;
}

@end
