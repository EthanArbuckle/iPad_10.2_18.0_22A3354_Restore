@implementation WFAddNewReminderAction

- (void)wasAddedToWorkflow:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFAddNewReminderAction;
  -[WFAddNewReminderAction wasAddedToWorkflow:](&v5, sel_wasAddedToWorkflow_, a3);
  -[WFAddNewReminderAction resourceManager](self, "resourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:selector:", self, sel_updateLists);

  -[WFAddNewReminderAction updateHiddenParameters](self, "updateHiddenParameters");
}

- (void)wasRemovedFromWorkflow:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFAddNewReminderAction;
  -[WFAddNewReminderAction wasRemovedFromWorkflow:](&v5, sel_wasRemovedFromWorkflow_, a3);
  -[WFAddNewReminderAction resourceManager](self, "resourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:selector:", self, sel_updateLists);

}

- (void)updateLists
{
  id v2;

  -[WFAddNewReminderAction parameterForKey:](self, "parameterForKey:", CFSTR("WFCalendarDescriptor"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadStates");

}

- (NSDateFormatter)dateFormatter
{
  NSDateFormatter *dateFormatter;
  NSDateFormatter *v4;
  NSDateFormatter *v5;

  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    v4 = (NSDateFormatter *)objc_opt_new();
    v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    dateFormatter = self->_dateFormatter;
  }
  return dateFormatter;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  -[WFAddNewReminderAction resourceManager](self, "resourceManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resourceObjectsOfClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "status") == 4)
  {
    -[WFAddNewReminderAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFCalendarItemTitle"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAddNewReminderAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFURL"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAddNewReminderAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFCalendarItemNotes"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAddNewReminderAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPriority"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAddNewReminderAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFFlag"), objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAddNewReminderAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTags"), objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __53__WFAddNewReminderAction_runAsynchronouslyWithInput___block_invoke;
      v22[3] = &unk_24F8B57B0;
      v22[4] = self;
      v23 = v7;
      v24 = v9;
      v25 = v8;
      v26 = v11;
      v27 = v10;
      v28 = v12;
      -[WFAddNewReminderAction getSelectedListOrParentReminder:](self, "getSelectedListOrParentReminder:", v22);

    }
    else
    {
      v21 = v11;
      v13 = (void *)MEMORY[0x24BDD1540];
      v20 = *MEMORY[0x24BEC4270];
      v29 = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("No title was provided. Please provide a title for this reminder."));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
      v15 = v7;
      v16 = v9;
      v17 = v8;
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v20, 5, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFAddNewReminderAction finishRunningWithError:](self, "finishRunningWithError:", v19);

      v11 = v21;
      v8 = v17;
      v9 = v16;
      v7 = v15;

    }
  }
  else
  {
    objc_msgSend(v6, "availabilityError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAddNewReminderAction finishRunningWithError:](self, "finishRunningWithError:", v7);
  }

}

- (void)addAlertToReminderChange:(id)a3 forAccount:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  id v33;
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
  _QWORD v44[5];
  id v45;
  id v46;
  void (**v47)(_QWORD);
  _QWORD v48[5];
  id v49;
  void (**v50)(_QWORD);
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  _QWORD v65[3];

  v65[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  -[WFAddNewReminderAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAlertEnabled"), objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("No Alert")))
  {
    v10[2](v10);
  }
  else
  {
    -[WFAddNewReminderAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAlertCondition"), objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("At Time")))
    {
      -[WFAddNewReminderAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAlertCustomTime"), objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "date");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "timeIsSignificant");
        objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v16)
        {
          objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "componentsInTimeZone:fromDate:", v19, v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v17, "components:fromDate:", 30, v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(v8, "setDueDateComponents:", v20);
        v56 = 0;
        v57 = &v56;
        v58 = 0x2050000000;
        v31 = (void *)getREMAlarmDateTriggerClass_softClass;
        v59 = getREMAlarmDateTriggerClass_softClass;
        if (!getREMAlarmDateTriggerClass_softClass)
        {
          v51 = MEMORY[0x24BDAC760];
          v52 = 3221225472;
          v53 = __getREMAlarmDateTriggerClass_block_invoke;
          v54 = &unk_24F8BB430;
          v55 = &v56;
          __getREMAlarmDateTriggerClass_block_invoke((uint64_t)&v51);
          v31 = (void *)v57[3];
        }
        v32 = objc_retainAutorelease(v31);
        _Block_object_dispose(&v56, 8);
        v30 = (void *)objc_msgSend([v32 alloc], "initWithDateComponents:", v20);
        v33 = (id)objc_msgSend(v8, "addAlarmWithTrigger:", v30);
        v10[2](v10);
      }
      else
      {
        v29 = (void *)MEMORY[0x24BDD1540];
        v64 = *MEMORY[0x24BDD0FC8];
        WFLocalizedString(CFSTR("The alert time provided was invalid. Please check for spelling errors and ensure you provide a time of day."));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v65[0] = v15;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, &v64, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 5, v20);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFAddNewReminderAction finishRunningWithError:](self, "finishRunningWithError:", v30);
      }

    }
    else if (objc_msgSend(v12, "isEqualToString:", CFSTR("When Messaging")))
    {
      objc_msgSend(v9, "capabilities");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "supportsPersonTrigger");

      if ((v22 & 1) != 0)
      {
        -[WFAddNewReminderAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAlertPerson"), objc_opt_class());
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "contentCollection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v48[0] = MEMORY[0x24BDAC760];
        v48[1] = 3221225472;
        v48[2] = __80__WFAddNewReminderAction_addAlertToReminderChange_forAccount_completionHandler___block_invoke;
        v48[3] = &unk_24F8B57D8;
        v48[4] = self;
        v50 = v10;
        v49 = v8;
        objc_msgSend(v14, "getObjectRepresentation:forClass:", v48, objc_opt_class());

      }
      else
      {
        v34 = (void *)MEMORY[0x24BDD1540];
        v62 = *MEMORY[0x24BDD0FC8];
        v35 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("Add New Reminder failed because the Reminders account “%@” does not support notifications when messaging people."));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "displayName");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "stringWithFormat:", v14, v42);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = v36;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 5, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFAddNewReminderAction finishRunningWithError:](self, "finishRunningWithError:", v38);

      }
    }
    else
    {
      -[WFAddNewReminderAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAlertLocation"), objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "items");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "firstObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        v26 = MEMORY[0x24BDAC760];
        v44[0] = MEMORY[0x24BDAC760];
        v44[1] = 3221225472;
        v44[2] = __80__WFAddNewReminderAction_addAlertToReminderChange_forAccount_completionHandler___block_invoke_2;
        v44[3] = &unk_24F8B5800;
        v44[4] = self;
        v45 = v12;
        v46 = v8;
        v47 = v10;
        v56 = 0;
        v57 = &v56;
        v58 = 0x2050000000;
        v27 = (void *)getMKMapItemClass_softClass_26710;
        v59 = getMKMapItemClass_softClass_26710;
        if (!getMKMapItemClass_softClass_26710)
        {
          v51 = v26;
          v52 = 3221225472;
          v53 = __getMKMapItemClass_block_invoke_26711;
          v54 = &unk_24F8BB430;
          v55 = &v56;
          __getMKMapItemClass_block_invoke_26711((uint64_t)&v51);
          v27 = (void *)v57[3];
        }
        v28 = objc_retainAutorelease(v27);
        _Block_object_dispose(&v56, 8);
        objc_msgSend(v25, "getObjectRepresentation:forClass:", v44, v28);

      }
      else
      {
        v39 = (void *)MEMORY[0x24BDD1540];
        v60 = *MEMORY[0x24BDD0FC8];
        WFLocalizedString(CFSTR("No alert location was provided. Please provide a location for this reminder's alert."));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v61 = v43;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 5, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFAddNewReminderAction finishRunningWithError:](self, "finishRunningWithError:", v41);

      }
    }

  }
}

- (void)addImagesToReminderChange:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  void (**v13)(_QWORD);

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[WFAddNewReminderAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFImages"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "numberOfItems"))
  {
    objc_msgSend(v6, "attachmentContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __70__WFAddNewReminderAction_addImagesToReminderChange_completionHandler___block_invoke;
      v11[3] = &unk_24F8BAD90;
      v11[4] = self;
      v13 = v7;
      v12 = v9;
      objc_msgSend(MEMORY[0x24BEC14A0], "typeWithUTType:", *MEMORY[0x24BDF8410]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "getFileRepresentations:forType:", v11, v10);

    }
    else
    {
      v7[2](v7);
    }

  }
  else
  {
    v7[2](v7);
  }

}

- (void)finishAddingReminderWithSaveRequest:(id)a3 reminderChange:(id)a4 reminderStore:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v8 = a4;
  v9 = a5;
  dispatch_get_global_queue(0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __91__WFAddNewReminderAction_finishAddingReminderWithSaveRequest_reminderChange_reminderStore___block_invoke;
  v13[3] = &unk_24F8B61E0;
  v13[4] = self;
  v14 = v9;
  v15 = v8;
  v11 = v8;
  v12 = v9;
  objc_msgSend(a3, "saveWithQueue:completion:", v10, v13);

}

- (void)getSelectedListOrParentReminder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  -[WFAddNewReminderAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFParentTask"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __58__WFAddNewReminderAction_getSelectedListOrParentReminder___block_invoke;
    v10[3] = &unk_24F8B5828;
    v10[4] = self;
    v11 = v4;
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v7 = (void *)getREMReminderClass_softClass;
    v16 = getREMReminderClass_softClass;
    if (!getREMReminderClass_softClass)
    {
      v12[0] = v6;
      v12[1] = 3221225472;
      v12[2] = __getREMReminderClass_block_invoke;
      v12[3] = &unk_24F8BB430;
      v12[4] = &v13;
      __getREMReminderClass_block_invoke((uint64_t)v12);
      v7 = (void *)v14[3];
    }
    v8 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v13, 8);
    objc_msgSend(v5, "getObjectRepresentation:forClass:", v10, v8);

  }
  else
  {
    -[WFAddNewReminderAction selectedList](self, "selectedList");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v4 + 2))(v4, v9, 0);

  }
}

- (id)selectedList
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE195D8], "allLists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAddNewReminderAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFCalendarDescriptor"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "matchingRemindersListsFromArray:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE195D8], "defaultList");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__WFAddNewReminderAction_getContentDestinationWithCompletionHandler___block_invoke;
  v6[3] = &unk_24F8B5850;
  v7 = v4;
  v5 = v4;
  -[WFAddNewReminderAction getSelectedListOrParentReminder:](self, "getSelectedListOrParentReminder:", v6);

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
  WFLocalizedString(CFSTR("Allow “%1$@” to add %2$@ to a new reminder?"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v9, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)selectedListIfDeterministic
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[WFAddNewReminderAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFCalendarDescriptor"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "variable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE195D8], "allLists");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "matchingRemindersListsFromArray:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE195D8], "defaultList");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v4 = v10;

  }
  return v4;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  _BOOL4 v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)WFAddNewReminderAction;
  v7 = -[WFAddNewReminderAction setParameterState:forKey:](&v9, sel_setParameterState_forKey_, a3, v6);
  if (v7 && objc_msgSend(v6, "isEqualToString:", CFSTR("WFCalendarDescriptor")))
    -[WFAddNewReminderAction updateHiddenParameters](self, "updateHiddenParameters");

  return v7;
}

- (void)updateHiddenParameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[WFAddNewReminderAction selectedListIfDeterministic](self, "selectedListIfDeterministic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "capabilities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "supportsAttachments");

    v8 = v7 ^ 1u;
  }
  else
  {
    v8 = 0;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[WFAddNewReminderAction parameterKeysToHideWhenAttachmentsAreUnavailable](self, "parameterKeysToHideWhenAttachmentsAreUnavailable", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        -[WFAddNewReminderAction parameterForKey:](self, "parameterForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setHidden:", v8);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (id)parameterKeysToHideWhenAttachmentsAreUnavailable
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("WFURL");
  v3[1] = CFSTR("WFImages");
  v3[2] = CFSTR("WFFlag");
  v3[3] = CFSTR("WFParentTask");
  v3[4] = CFSTR("WFTags");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_parameterSummary, 0);
}

void __69__WFAddNewReminderAction_getContentDestinationWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = v9;
  if (v9 || (v6 = v5) != 0)
  {
    objc_msgSend(v6, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WFMakeContentLocationForRemindersAccount();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __58__WFAddNewReminderAction_getSelectedListOrParentReminder___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(v2 + 16))(*(_QWORD *)(a1 + 40), 0, a2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "selectedList");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

  }
}

void __91__WFAddNewReminderAction_finishAddingReminderWithSaveRequest_reminderChange_reminderStore___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v3);
  }
  else
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 48), "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(v5, "fetchReminderWithObjectID:error:", v6, &v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v10;

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "output");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE195D8], "itemWithReminder:fromReminderStore:", v7, *(_QWORD *)(a1 + 40));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addItem:", v9);

    }
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v4);

  }
}

void __70__WFAddNewReminderAction_addImagesToReminderChange_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BE195E0], "addImageFiles:toAttachmentContext:", v5, *(_QWORD *)(a1 + 40));
LABEL_3:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_8;
  }
  if (!v6)
    goto LABEL_3;
  getWFActionsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = 136315394;
    v9 = "-[WFAddNewReminderAction addImagesToReminderChange:completionHandler:]_block_invoke";
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_ERROR, "%s Loading images failed with error %@", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);
LABEL_8:

}

void __80__WFAddNewReminderAction_addAlertToReminderChange_forAccount_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(MEMORY[0x24BE195D8], "contactRepresentationWithContact:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "setContactHandles:", v6);
  }
  else if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
    goto LABEL_6;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_6:

}

void __80__WFAddNewReminderAction_addAlertToReminderChange_forAccount_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  objc_class *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[3];

  v58[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v47 = a3;
  v8 = a4;
  v9 = (uint64_t)v8;
  if (v7)
  {
    v53 = 0;
    v54 = &v53;
    v55 = 0x2050000000;
    v10 = (void *)getREMStructuredLocationClass_softClass;
    v56 = getREMStructuredLocationClass_softClass;
    if (!getREMStructuredLocationClass_softClass)
    {
      v48 = MEMORY[0x24BDAC760];
      v49 = 3221225472;
      v50 = __getREMStructuredLocationClass_block_invoke;
      v51 = &unk_24F8BB430;
      v52 = &v53;
      __getREMStructuredLocationClass_block_invoke((uint64_t)&v48);
      v10 = (void *)v54[3];
    }
    v46 = (void *)v9;
    v11 = objc_retainAutorelease(v10);
    _Block_object_dispose(&v53, 8);
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "setTitle:", v47);
    objc_msgSend(v7, "placemark");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "location");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "coordinate");
    v16 = v15;
    v18 = v17;

    objc_msgSend(v12, "setLatitude:", v16);
    objc_msgSend(v12, "setLongitude:", v18);
    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v13, "region");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%d"), objc_msgSend(v20, "referenceFrame"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setReferenceFrameString:", v21);

    v53 = 0;
    v54 = &v53;
    v55 = 0x2050000000;
    v22 = (void *)getCNPostalAddressFormatterClass_softClass;
    v56 = getCNPostalAddressFormatterClass_softClass;
    if (!getCNPostalAddressFormatterClass_softClass)
    {
      v48 = MEMORY[0x24BDAC760];
      v49 = 3221225472;
      v50 = __getCNPostalAddressFormatterClass_block_invoke;
      v51 = &unk_24F8BB430;
      v52 = &v53;
      __getCNPostalAddressFormatterClass_block_invoke((uint64_t)&v48);
      v22 = (void *)v54[3];
    }
    v23 = objc_retainAutorelease(v22);
    _Block_object_dispose(&v53, 8);
    objc_msgSend(v7, "placemark");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "postalAddress");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringFromPostalAddress:style:", v25, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAddress:", v26);

    objc_msgSend(v7, "_handle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMapKitHandle:", v27);

    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFAlertLocationRadius"), objc_opt_class());
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)MEMORY[0x24BEC1540];
    objc_msgSend(v28, "unitString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "unitFromString:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = objc_alloc(MEMORY[0x24BDD1660]);
    objc_msgSend(v28, "magnitude");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "doubleValue");
    v34 = (void *)objc_msgSend(v32, "initWithDoubleValue:unit:", v31);

    objc_msgSend(MEMORY[0x24BDD1928], "meters");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v29) = objc_msgSend(v34, "canBeConvertedToUnit:", v35);

    if ((_DWORD)v29)
    {
      objc_msgSend(MEMORY[0x24BDD1928], "meters");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "measurementByConvertingToUnit:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v37, "doubleValue");
      objc_msgSend(v12, "setRadius:");

    }
    else
    {
      objc_msgSend(v12, "setRadius:", 0.0);
    }
    if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("When I Arrive")))
      v41 = 1;
    else
      v41 = 2;
    v53 = 0;
    v54 = &v53;
    v55 = 0x2050000000;
    v42 = (void *)getREMAlarmLocationTriggerClass_softClass;
    v56 = getREMAlarmLocationTriggerClass_softClass;
    if (!getREMAlarmLocationTriggerClass_softClass)
    {
      v48 = MEMORY[0x24BDAC760];
      v49 = 3221225472;
      v50 = __getREMAlarmLocationTriggerClass_block_invoke;
      v51 = &unk_24F8BB430;
      v52 = &v53;
      __getREMAlarmLocationTriggerClass_block_invoke((uint64_t)&v48);
      v42 = (void *)v54[3];
    }
    v43 = objc_retainAutorelease(v42);
    _Block_object_dispose(&v53, 8);
    v44 = (void *)objc_msgSend([v43 alloc], "initWithStructuredLocation:proximity:", v12, v41);
    v45 = (id)objc_msgSend(*(id *)(a1 + 48), "addAlarmWithTrigger:", v44);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    if (!v8)
    {
      v38 = (void *)MEMORY[0x24BDD1540];
      v57 = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("The alert location provided could not be found."));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v58[0] = v39;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 5, v40);
      v9 = objc_claimAutoreleasedReturnValue();

    }
    v46 = (void *)v9;
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v9);
  }

}

void __53__WFAddNewReminderAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id location[5];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  _BYTE v59[128];
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  _QWORD v64[2];
  _QWORD v65[4];

  v65[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v43 = a3;
  if (v5 | v43)
  {
    WFGetWorkflowReminderStore();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    v56 = &v55;
    v57 = 0x2050000000;
    v6 = (void *)getREMSaveRequestClass_softClass_26761;
    v58 = getREMSaveRequestClass_softClass_26761;
    if (!getREMSaveRequestClass_softClass_26761)
    {
      location[0] = (id)MEMORY[0x24BDAC760];
      location[1] = (id)3221225472;
      location[2] = __getREMSaveRequestClass_block_invoke_26762;
      location[3] = &unk_24F8BB430;
      location[4] = &v55;
      __getREMSaveRequestClass_block_invoke_26762((uint64_t)location);
      v6 = (void *)v56[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v55, 8);
    v8 = (void *)objc_msgSend([v7 alloc], "initWithStore:", v44);
    v9 = v8;
    if (v5)
    {
      objc_msgSend(v8, "updateList:", v5);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v5, "account");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addReminderWithTitle:toListChangeItem:", *(_QWORD *)(a1 + 40), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v8, "updateReminder:", v43);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "subtaskContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v43, "account");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        objc_msgSend(v42, "capabilities");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "supportsSubtasks");

        v24 = *(void **)(a1 + 32);
        v25 = (void *)MEMORY[0x24BDD1540];
        if ((v23 & 1) != 0)
        {
          v60 = *MEMORY[0x24BDD0FC8];
          v26 = (void *)MEMORY[0x24BDD17C8];
          WFLocalizedString(CFSTR("Add New Reminder failed because the reminder “%@” is a subtask, and subtasks cannot have their own subtasks."));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v43, "title");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "string");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "stringWithFormat:", v42, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v29;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
        }
        else
        {
          v62 = *MEMORY[0x24BDD0FC8];
          v39 = (void *)MEMORY[0x24BDD17C8];
          WFLocalizedString(CFSTR("Add New Reminder failed because the Reminders account “%@” does not support subtasks."));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v43, "account");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "displayName");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "stringWithFormat:", v42, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v29;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
        }
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 5, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "finishRunningWithError:", v41);

LABEL_36:
        goto LABEL_37;
      }
      objc_msgSend(v9, "addReminderWithTitle:toReminderSubtaskContextChangeItem:", *(_QWORD *)(a1 + 40), v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(*(id *)(a1 + 48), "length"))
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", *(_QWORD *)(a1 + 48));
      objc_msgSend(v11, "setNotes:", v16);

    }
    if (*(_QWORD *)(a1 + 56))
    {
      objc_msgSend(v11, "attachmentContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (id)objc_msgSend(v17, "addURLAttachmentWithURL:", *(_QWORD *)(a1 + 56));

    }
    if (*(_QWORD *)(a1 + 64))
    {
      objc_msgSend(v11, "flaggedContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setFlagged:", objc_msgSend(*(id *)(a1 + 64), "integerValue"));

    }
    v20 = *(void **)(a1 + 72);
    if (v20)
    {
      if ((objc_msgSend(v20, "isEqualToString:", CFSTR("Low")) & 1) != 0)
      {
        v21 = 7;
      }
      else if ((objc_msgSend(*(id *)(a1 + 72), "isEqualToString:", CFSTR("Medium")) & 1) != 0)
      {
        v21 = 5;
      }
      else if (objc_msgSend(*(id *)(a1 + 72), "isEqualToString:", CFSTR("High")))
      {
        v21 = 3;
      }
      else
      {
        v21 = 0;
      }
      objc_msgSend(v11, "setPriority:", v21);
    }
    if (objc_msgSend(*(id *)(a1 + 80), "length"))
    {
      objc_msgSend(*(id *)(a1 + 80), "componentsSeparatedByString:", CFSTR(","));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      if (v31)
      {
        v32 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v51 != v32)
              objc_enumerationMutation(v30);
            v34 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
            objc_msgSend(v11, "hashtagContext");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = (id)objc_msgSend(v35, "addHashtagWithType:name:", 0, v34);

          }
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
        }
        while (v31);
      }

    }
    v37 = *(void **)(a1 + 32);
    v38 = objc_initWeak(location, v37);
    v45[0] = MEMORY[0x24BDAC760];
    v45[1] = 3221225472;
    v45[2] = __53__WFAddNewReminderAction_runAsynchronouslyWithInput___block_invoke_2;
    v45[3] = &unk_24F8B5788;
    objc_copyWeak(&v49, location);
    v10 = v11;
    v46 = v10;
    v47 = v9;
    v48 = v44;
    objc_msgSend(v37, "addAlertToReminderChange:forAccount:completionHandler:", v10, v42, v45);

    objc_destroyWeak(&v49);
    objc_destroyWeak(location);
    goto LABEL_36;
  }
  WFLocalizedString(CFSTR("No Reminders lists"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  WFLocalizedString(CFSTR("Add New Reminders couldn't find any Reminders lists. Make sure you have at least one set up in the Reminders app."));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD1540];
  v13 = *MEMORY[0x24BDD0FC8];
  v64[0] = *MEMORY[0x24BDD0FD8];
  v64[1] = v13;
  v65[0] = v44;
  v65[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 5, v14);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v10);
LABEL_37:

}

void __53__WFAddNewReminderAction_runAsynchronouslyWithInput___block_invoke_2(id *a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v2 = a1 + 7;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v4 = a1[4];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__WFAddNewReminderAction_runAsynchronouslyWithInput___block_invoke_3;
  v5[3] = &unk_24F8B5788;
  objc_copyWeak(&v9, v2);
  v6 = a1[5];
  v7 = a1[4];
  v8 = a1[6];
  objc_msgSend(WeakRetained, "addImagesToReminderChange:completionHandler:", v4, v5);

  objc_destroyWeak(&v9);
}

void __53__WFAddNewReminderAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "finishAddingReminderWithSaveRequest:reminderChange:reminderStore:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

@end
