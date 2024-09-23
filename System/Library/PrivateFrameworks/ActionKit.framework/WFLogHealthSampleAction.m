@implementation WFLogHealthSampleAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  -[WFLogHealthSampleAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFQuantitySampleType"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[WFLogHealthSampleAction setCurrentDate:](self, "setCurrentDate:", 0);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[WFLogHealthSampleAction handleWithCategoryType:](self, "handleWithCategoryType:", v4);
    else
      -[WFLogHealthSampleAction handleWithQuantityType:](self, "handleWithQuantityType:", v4);
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD1540];
    v6 = *MEMORY[0x24BEC4270];
    v11[0] = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("No Type Selected"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v11[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Please select a type for this Health sample."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 5, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLogHealthSampleAction finishRunningWithError:](self, "finishRunningWithError:", v10);

  }
}

- (id)generatedResourceNodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  WFHealthKitAccessResource *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  WFHealthKitAccessResource *v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)WFLogHealthSampleAction;
  -[WFLogHealthSampleAction generatedResourceNodes](&v16, sel_generatedResourceNodes);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[WFLogHealthSampleAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFQuantitySampleType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = [WFHealthKitAccessResource alloc];
    v17[0] = *MEMORY[0x24BEC4630];
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    v18[1] = CFSTR("Write");
    v17[1] = CFSTR("AccessType");
    v17[2] = CFSTR("ReadableType");
    v17[3] = CFSTR("ObjectType");
    v18[2] = CFSTR("Quantity");
    v18[3] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[WFHealthKitAccessResource initWithDefinition:](v7, "initWithDefinition:", v10);
    v19[0] = v11;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "if_map:", &__block_literal_global_40519);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v13);
    v14 = v4;

  }
  else
  {
    v14 = (id)MEMORY[0x24BDBD1A8];
  }

  return v14;
}

- (void)handleWithCategoryType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  int64_t v19;
  void *v20;
  int v21;
  int64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD *v46;
  _QWORD *v47;
  void *v48;
  int v49;
  int64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  int64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD v79[2];
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[2];
  uint64_t v85;
  uint64_t v86;
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[4];

  v92[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v76 = 0;
  -[WFLogHealthSampleAction dateForParameterValueWithKey:error:](self, "dateForParameterValueWithKey:error:", CFSTR("WFQuantitySampleDate"), &v76);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v76;
  if (!v6)
  {
    v75 = 0;
    -[WFLogHealthSampleAction dateForParameterValueWithKey:error:](self, "dateForParameterValueWithKey:error:", CFSTR("WFSampleEndDate"), &v75);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v75;
    -[WFLogHealthSampleAction parameterForKey:](self, "parameterForKey:", CFSTR("WFSampleEndDate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isHidden");

    if ((v10 & 1) != 0)
      goto LABEL_4;
    if (v7)
    {
      -[WFLogHealthSampleAction finishRunningWithError:](self, "finishRunningWithError:", v7);
    }
    else
    {
      if (objc_msgSend(v5, "compare:", v8) == -1)
      {
LABEL_4:
        -[WFLogHealthSampleAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFCategorySampleEnumeration"), objc_opt_class());
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BDD29A0]);

        if (v13)
        {
          objc_msgSend(MEMORY[0x24BDD3988], "categorySampleWithType:value:startDate:endDate:", v4, 0, v5, v8);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = 0;
        }
        objc_msgSend(v4, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BDD2948]);

        if (v16)
        {
          v17 = (void *)MEMORY[0x24BDD3988];
          v18 = v4;
          v19 = 0;
LABEL_20:
          v31 = v5;
          v32 = v5;
LABEL_21:
          objc_msgSend(v17, "categorySampleWithType:value:startDate:endDate:", v18, v19, v31, v32);
          v33 = v14;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

          objc_msgSend(MEMORY[0x24BE19450], "itemWithObject:", v14);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFLogHealthSampleAction saveObject:withObjectType:item:](self, "saveObject:withObjectType:item:", v14, v4, v33);
LABEL_23:

          goto LABEL_24;
        }
        objc_msgSend(v4, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x24BDD2890]);

        if (v21)
        {
          if (!v11)
          {
            v74 = (void *)MEMORY[0x24BDD1540];
            v38 = *MEMORY[0x24BEC4270];
            v89[0] = *MEMORY[0x24BDD0FD8];
            WFLocalizedString(CFSTR("No Value Selected"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v90[0] = v33;
            v89[1] = *MEMORY[0x24BDD0FC8];
            WFLocalizedString(CFSTR("Please select a value for this cervical mucus quality sample."));
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v90[1] = v69;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v90, v89, 2);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "errorWithDomain:code:userInfo:", v38, 5, v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFLogHealthSampleAction finishRunningWithError:](self, "finishRunningWithError:", v40);

            v11 = 0;
            goto LABEL_23;
          }
          v22 = +[WFHealthKitHelper enumFromReadableCervicalMucusQuality:](WFHealthKitHelper, "enumFromReadableCervicalMucusQuality:", v11);
          goto LABEL_19;
        }
        v73 = v11;
        objc_msgSend(v4, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isEqualToString:", *MEMORY[0x24BDD29C0]);

        if (v30)
        {
          v11 = v73;
          if (v73)
          {
            v22 = +[WFHealthKitHelper enumFromReadableOvulationTestResult:](WFHealthKitHelper, "enumFromReadableOvulationTestResult:", v73);
LABEL_19:
            v19 = v22;
            v17 = (void *)MEMORY[0x24BDD3988];
            v18 = v4;
            goto LABEL_20;
          }
          v43 = (void *)MEMORY[0x24BDD1540];
          v70 = *MEMORY[0x24BEC4270];
          v87[0] = *MEMORY[0x24BDD0FD8];
          WFLocalizedString(CFSTR("No Value Selected"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v88[0] = v33;
          v87[1] = *MEMORY[0x24BDD0FC8];
          WFLocalizedString(CFSTR("Please select a value for this ovulation test result sample."));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v88[1] = v44;
          v45 = (void *)MEMORY[0x24BDBCE70];
          v46 = v88;
          v47 = v87;
LABEL_44:
          objc_msgSend(v45, "dictionaryWithObjects:forKeys:count:", v46, v47, 2);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "errorWithDomain:code:userInfo:", v70, 5, v58);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          -[WFLogHealthSampleAction finishRunningWithError:](self, "finishRunningWithError:", v59);

          v11 = 0;
          goto LABEL_23;
        }
        objc_msgSend(v4, "identifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "isEqualToString:", *MEMORY[0x24BDD2A08]);

        if (v35)
        {
          +[WFHealthKitHelper BOOLFromReadableSexualActivity:](WFHealthKitHelper, "BOOLFromReadableSexualActivity:", v73);
          v36 = objc_claimAutoreleasedReturnValue();
          v33 = (void *)v36;
          if (v73)
          {
            v85 = *MEMORY[0x24BDD31F8];
            v86 = v36;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v37 = (void *)MEMORY[0x24BDBD1B8];
          }
          objc_msgSend(MEMORY[0x24BDD3988], "categorySampleWithType:value:startDate:endDate:metadata:", v4, 0, v5, v5, v37);
          v57 = objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v4, "identifier");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend(v41, "isEqualToString:", *MEMORY[0x24BDD2A28]);

          if (v42)
          {
            v11 = v73;
            if (v73)
            {
              v19 = +[WFHealthKitHelper enumFromReadableSleepAnalysis:](WFHealthKitHelper, "enumFromReadableSleepAnalysis:", v73);
              v17 = (void *)MEMORY[0x24BDD3988];
              v18 = v4;
              v31 = v5;
              v32 = v8;
              goto LABEL_21;
            }
            v43 = (void *)MEMORY[0x24BDD1540];
            v70 = *MEMORY[0x24BEC4270];
            v83[0] = *MEMORY[0x24BDD0FD8];
            WFLocalizedString(CFSTR("No Value Selected"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v84[0] = v33;
            v83[1] = *MEMORY[0x24BDD0FC8];
            WFLocalizedString(CFSTR("Please select a value for this sleep analysis sample."));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v84[1] = v44;
            v45 = (void *)MEMORY[0x24BDBCE70];
            v46 = v84;
            v47 = v83;
            goto LABEL_44;
          }
          objc_msgSend(v4, "identifier");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = objc_msgSend(v48, "isEqualToString:", *MEMORY[0x24BDD2998]);

          if (!v49)
          {
            objc_msgSend(MEMORY[0x24BDD3988], "categorySampleWithType:value:startDate:endDate:", v4, 0, v5, v8);
            v33 = v14;
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_41;
          }
          if (!v73)
          {
            v60 = (void *)MEMORY[0x24BDD1540];
            v71 = *MEMORY[0x24BEC4270];
            v81[0] = *MEMORY[0x24BDD0FD8];
            WFLocalizedString(CFSTR("No Value Selected"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v82[0] = v33;
            v81[1] = *MEMORY[0x24BDD0FC8];
            WFLocalizedString(CFSTR("Please select a value for this menstruation sample."));
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v82[1] = v67;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v82, v81, 2);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "errorWithDomain:code:userInfo:", v71, 5, v61);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFLogHealthSampleAction finishRunningWithError:](self, "finishRunningWithError:", v62);

            v11 = 0;
            goto LABEL_23;
          }
          v50 = +[WFHealthKitHelper enumFromReadableMenstrualFlow:](WFHealthKitHelper, "enumFromReadableMenstrualFlow:", v73);
          -[WFLogHealthSampleAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFCategorySampleAdditionalEnumerationKey"), objc_opt_class());
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          +[WFHealthKitHelper BOOLFromReadableMenstrualFlowIsStartOfCycle:](WFHealthKitHelper, "BOOLFromReadableMenstrualFlowIsStartOfCycle:", v33);
          v51 = objc_claimAutoreleasedReturnValue();
          if (!v51)
          {
            v68 = (void *)MEMORY[0x24BDD1540];
            v63 = *MEMORY[0x24BEC4270];
            v79[0] = *MEMORY[0x24BDD0FD8];
            WFLocalizedString(CFSTR("No Value Selected"));
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v80[0] = v72;
            v79[1] = *MEMORY[0x24BDD0FC8];
            WFLocalizedString(CFSTR("Please select whether or not this sample was at the start of a cycle."));
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v80[1] = v64;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "errorWithDomain:code:userInfo:", v63, 5, v65);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFLogHealthSampleAction finishRunningWithError:](self, "finishRunningWithError:", v66);

            v11 = v73;
            goto LABEL_23;
          }
          v52 = (void *)v51;
          v53 = (void *)MEMORY[0x24BDD3988];
          v77 = *MEMORY[0x24BDD31E0];
          v78 = v51;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
          v54 = objc_claimAutoreleasedReturnValue();
          v55 = v50;
          v56 = (void *)v54;
          objc_msgSend(v53, "categorySampleWithType:value:startDate:endDate:metadata:", v4, v55, v5, v5, v54);
          v57 = objc_claimAutoreleasedReturnValue();

        }
        v14 = (void *)v57;
LABEL_41:
        v11 = v73;
        goto LABEL_22;
      }
      v23 = (void *)MEMORY[0x24BDD1540];
      v24 = *MEMORY[0x24BEC4270];
      v91[0] = *MEMORY[0x24BDD0FD8];
      WFLocalizedString(CFSTR("Invalid Date Range"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v92[0] = v25;
      v91[1] = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("Please select an end date that is after the start date."));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v92[1] = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v92, v91, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 5, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFLogHealthSampleAction finishRunningWithError:](self, "finishRunningWithError:", v28);

    }
LABEL_24:

    goto LABEL_25;
  }
  v7 = v6;
  -[WFLogHealthSampleAction finishRunningWithError:](self, "finishRunningWithError:", v6);
LABEL_25:

}

- (void)handleWithQuantityType:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t *v33;
  uint64_t *v34;
  id v35;
  id v36;
  _QWORD v37[4];
  NSObject *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _QWORD v53[2];
  _QWORD v54[4];

  v54[2] = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  -[WFLogHealthSampleAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFQuantitySampleQuantity"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLogHealthSampleAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFQuantitySampleAdditionalQuantity"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_group_create();
  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__40465;
  v51 = __Block_byref_object_dispose__40466;
  objc_msgSend(v4, "unitString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDD4048];
    objc_msgSend(v4, "unitString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wf_safeUnitFromString:", v9);
    v52 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v52 = 0;
  }

  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__40465;
  v45 = __Block_byref_object_dispose__40466;
  objc_msgSend(v5, "unitString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD4048];
    objc_msgSend(v5, "unitString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "wf_safeUnitFromString:", v12);
    v46 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v46 = 0;
  }

  if (!v48[5] || !v42[5])
  {
    dispatch_group_enter(v6);
    v37[0] = MEMORY[0x24BDAC760];
    v37[1] = 3221225472;
    v37[2] = __50__WFLogHealthSampleAction_handleWithQuantityType___block_invoke;
    v37[3] = &unk_24F8B8348;
    v39 = &v47;
    v40 = &v41;
    v38 = v6;
    +[WFHealthKitHelper validUnitsForQuantityType:completion:](WFHealthKitHelper, "validUnitsForQuantityType:completion:", v26, v37);

  }
  v36 = 0;
  -[WFLogHealthSampleAction dateForParameterValueWithKey:error:](self, "dateForParameterValueWithKey:error:", CFSTR("WFQuantitySampleDate"), &v36);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v36;
  if (!v14)
  {
    v35 = 0;
    -[WFLogHealthSampleAction dateForParameterValueWithKey:error:](self, "dateForParameterValueWithKey:error:", CFSTR("WFSampleEndDate"), &v35);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v35;
    -[WFLogHealthSampleAction parameterForKey:](self, "parameterForKey:", CFSTR("WFSampleEndDate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isHidden");

    if ((v18 & 1) != 0)
    {
      v19 = v13;

      v16 = v19;
    }
    else
    {
      if (v15)
      {
        -[WFLogHealthSampleAction finishRunningWithError:](self, "finishRunningWithError:", v15);
        goto LABEL_19;
      }
      if (objc_msgSend(v13, "compare:", v16) != -1)
      {
        v21 = (void *)MEMORY[0x24BDD1540];
        v53[0] = *MEMORY[0x24BDD0FD8];
        WFLocalizedString(CFSTR("Invalid Date Range"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v54[0] = v22;
        v53[1] = *MEMORY[0x24BDD0FC8];
        WFLocalizedString(CFSTR("Please select an end date that is after the start date."));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v54[1] = v25;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 5, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFLogHealthSampleAction finishRunningWithError:](self, "finishRunningWithError:", v24);

        goto LABEL_19;
      }
    }
    dispatch_get_global_queue(0, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__WFLogHealthSampleAction_handleWithQuantityType___block_invoke_2;
    block[3] = &unk_24F8B8370;
    v33 = &v47;
    v34 = &v41;
    block[4] = self;
    v28 = v4;
    v29 = v5;
    v30 = v26;
    v31 = v13;
    v16 = v16;
    v32 = v16;
    dispatch_group_notify(v6, v20, block);

LABEL_19:
    goto LABEL_20;
  }
  v15 = v14;
  -[WFLogHealthSampleAction finishRunningWithError:](self, "finishRunningWithError:", v14);
LABEL_20:

  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v47, 8);

}

- (id)dateForParameterValueWithKey:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[WFLogHealthSampleAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", v6, objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    objc_msgSend(MEMORY[0x24BE194C8], "datesInString:error:", v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_6;
  }
  else
  {
    -[WFLogHealthSampleAction currentDate](self, "currentDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      goto LABEL_6;
  }
  if (!*a4)
  {
    v12 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BEC4270];
    v17[0] = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("Invalid Date"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v14;
    v17[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("An invalid date was provided. Please provide a date for the sample or leave the date field blank to use the current date."));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 5, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
LABEL_6:
  v10 = v9;
LABEL_7:

  return v9;
}

- (id)outputContentClasses
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[WFLogHealthSampleAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFQuantitySampleType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDD33A8]) & 1) != 0
    || objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDD33A0]))
  {
    v10[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)WFLogHealthSampleAction;
    -[WFLogHealthSampleAction outputContentClasses](&v9, sel_outputContentClasses);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

- (void)initializeParameters
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFLogHealthSampleAction;
  -[WFLogHealthSampleAction initializeParameters](&v9, sel_initializeParameters);
  -[WFLogHealthSampleAction parameterForKey:](self, "parameterForKey:", CFSTR("WFQuantitySampleQuantity"));
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

  objc_msgSend(v5, "setAction:", self);
  -[WFLogHealthSampleAction parameterForKey:](self, "parameterForKey:", CFSTR("WFQuantitySampleAdditionalQuantity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v8, "setAction:", self);
  -[WFLogHealthSampleAction updateParameterStates](self, "updateParameterStates");
}

- (id)parametersRequiringUserInputAlongsideParameter:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  objc_msgSend(v4, "key");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("WFQuantitySampleType"));

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDBCF20];
    -[WFLogHealthSampleAction parameterForKey:](self, "parameterForKey:", CFSTR("WFQuantitySampleQuantity"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLogHealthSampleAction parameterForKey:](self, "parameterForKey:", CFSTR("WFQuantitySampleAdditionalQuantity"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLogHealthSampleAction parameterForKey:](self, "parameterForKey:", CFSTR("WFCategorySampleEnumeration"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLogHealthSampleAction parameterForKey:](self, "parameterForKey:", CFSTR("WFCategorySampleAdditionalEnumerationKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLogHealthSampleAction parameterForKey:](self, "parameterForKey:", CFSTR("WFQuantitySampleDate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLogHealthSampleAction parameterForKey:](self, "parameterForKey:", CFSTR("WFSampleEndDate"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, v12, v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)WFLogHealthSampleAction;
    -[WFLogHealthSampleAction parametersRequiringUserInputAlongsideParameter:](&v16, sel_parametersRequiringUserInputAlongsideParameter_, v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (void)wasAddedToWorkflow:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFLogHealthSampleAction;
  -[WFLogHealthSampleAction wasAddedToWorkflow:](&v5, sel_wasAddedToWorkflow_, a3);
  -[WFLogHealthSampleAction resourceManager](self, "resourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:selector:", self, sel_resourceAvailabilityChanged);

}

- (void)wasRemovedFromWorkflow:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFLogHealthSampleAction;
  -[WFLogHealthSampleAction wasRemovedFromWorkflow:](&v5, sel_wasRemovedFromWorkflow_, a3);
  -[WFLogHealthSampleAction resourceManager](self, "resourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:selector:", self, sel_resourceAvailabilityChanged);

}

- (void)resourceAvailabilityChanged
{
  -[WFLogHealthSampleAction forceUpdateSelectedUnit](self, "forceUpdateSelectedUnit");
  -[WFLogHealthSampleAction updateParameterStates](self, "updateParameterStates");
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  _BOOL4 v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)WFLogHealthSampleAction;
  v7 = -[WFLogHealthSampleAction setParameterState:forKey:](&v9, sel_setParameterState_forKey_, a3, v6);
  if (v7 && objc_msgSend(v6, "isEqualToString:", CFSTR("WFQuantitySampleType")))
  {
    -[WFLogHealthSampleAction recreateResourcesIfNeeded](self, "recreateResourcesIfNeeded");
    -[WFLogHealthSampleAction forceUpdateSelectedUnit](self, "forceUpdateSelectedUnit");
    -[WFLogHealthSampleAction updateParameterStates](self, "updateParameterStates");
    -[WFLogHealthSampleAction outputDetailsUpdated](self, "outputDetailsUpdated");
  }

  return v7;
}

- (void)updateParameterStates
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;

  -[WFLogHealthSampleAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFQuantitySampleType"));
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "value");
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

  -[WFLogHealthSampleAction parameterForKey:](self, "parameterForKey:", CFSTR("WFQuantitySampleDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSampleType:", v5);
  -[WFLogHealthSampleAction parameterForKey:](self, "parameterForKey:", CFSTR("WFSampleEndDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSampleType:", v5);
  v8 = v5;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  -[WFLogHealthSampleAction parameterForKey:](self, "parameterForKey:", CFSTR("WFCategorySampleEnumeration"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setCategoryType:", v10);
  -[WFLogHealthSampleAction parameterForKey:](self, "parameterForKey:", CFSTR("WFCategorySampleAdditionalEnumerationKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCategoryType:", v10);
  v13 = v8;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;
  }
  else
  {
    v14 = 0;
  }
  v15 = v14;

  -[WFLogHealthSampleAction parameterForKey:](self, "parameterForKey:", CFSTR("WFQuantitySampleAdditionalEnumeration"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setQuantityType:", v15);

}

- (void)forceUpdateSelectedUnit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  WFLogHealthSampleAction *v14;

  -[WFLogHealthSampleAction parameterForKey:](self, "parameterForKey:", CFSTR("WFQuantitySampleQuantity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatePossibleUnits");
  -[WFLogHealthSampleAction parameterForKey:](self, "parameterForKey:", CFSTR("WFQuantitySampleAdditionalQuantity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatePossibleUnits");
  -[WFLogHealthSampleAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFQuantitySampleType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "value");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __50__WFLogHealthSampleAction_forceUpdateSelectedUnit__block_invoke;
      v11[3] = &unk_24F8B8398;
      v12 = v3;
      v13 = v9;
      v14 = self;
      v10 = v9;
      +[WFHealthKitHelper validUnitsForQuantityType:completion:](WFHealthKitHelper, "validUnitsForQuantityType:completion:", v10, v11);

    }
  }

}

- (void)saveObject:(id)a3 withObjectType:(id)a4 item:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v7 = a5;
  v8 = (void *)MEMORY[0x24BDD3C40];
  v9 = a3;
  objc_msgSend(v8, "wf_shortcutsAppHealthStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__WFLogHealthSampleAction_saveObject_withObjectType_item___block_invoke;
  v12[3] = &unk_24F8B83C0;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "saveObject:withCompletion:", v9, v12);

}

- (id)appIdentifier
{
  return (id)*MEMORY[0x24BEC16D0];
}

- (id)localizedSmartPromptUsageSentenceWithcontentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a5;
  v8 = a3;
  WFLocalizedString(CFSTR("Allow “%1$@” to use %2$@ in a new Health sample?"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v9, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSDate)currentDate
{
  NSDate *currentDate;
  NSDate *v4;
  NSDate *v5;

  currentDate = self->_currentDate;
  if (!currentDate)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v5 = self->_currentDate;
    self->_currentDate = v4;

    currentDate = self->_currentDate;
  }
  return currentDate;
}

- (void)setCurrentDate:(id)a3
{
  objc_storeStrong((id *)&self->_currentDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDate, 0);
}

void __58__WFLogHealthSampleAction_saveObject_withObjectType_item___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v4, "output");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addItem:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);
}

void __50__WFLogHealthSampleAction_forceUpdateSelectedUnit__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  uint64_t v9;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__WFLogHealthSampleAction_forceUpdateSelectedUnit__block_invoke_2;
  v5[3] = &unk_24F8B9728;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  v9 = *(_QWORD *)(a1 + 48);
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

void __50__WFLogHealthSampleAction_forceUpdateSelectedUnit__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD v26[2];
  _BYTE v27[128];
  uint64_t v28;

  v1 = a1;
  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "quantityType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(v1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(v1 + 48), "valueForKey:", CFSTR("unitString"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26[0] = CFSTR("WFQuantitySampleQuantity");
    v26[1] = CFSTR("WFQuantitySampleAdditionalQuantity");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 2);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v23;
      do
      {
        v8 = 0;
        v20 = v6;
        do
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v8);
          objc_msgSend(*(id *)(v1 + 56), "parameterStateForKey:", v9, v20);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "unitString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v4, "containsObject:", v11);

          if ((v12 & 1) == 0)
          {
            v13 = *(void **)(v1 + 56);
            v14 = objc_alloc(MEMORY[0x24BEC3FC0]);
            objc_msgSend(v10, "magnitudeState");
            v15 = v1;
            v16 = v7;
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "firstObject");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)objc_msgSend(v14, "initWithMagnitudeState:unitString:", v17, v18);
            objc_msgSend(v13, "setParameterState:forKey:", v19, v9);

            v7 = v16;
            v1 = v15;
            v6 = v20;
          }

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v6);
    }

  }
}

void __50__WFLogHealthSampleAction_handleWithQuantityType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    objc_msgSend(v9, "firstObject");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(v9, "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __50__WFLogHealthSampleAction_handleWithQuantityType___block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  int v39;
  int64_t v40;
  void *v41;
  void *v42;
  void **v43;
  uint64_t *v44;
  void *v45;
  int v46;
  int64_t v47;
  void *v48;
  int v49;
  int64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[2];
  _QWORD v63[2];
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  void *v69;
  _QWORD v70[2];
  _QWORD v71[4];

  v71[2] = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40)
    && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "magnitude");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "doubleValue");
    v4 = v3;

    objc_msgSend(*(id *)(a1 + 48), "magnitude");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;

    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDD4048], "percentUnit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v8, "isEqual:", v9);

    if ((_DWORD)v8)
      v10 = v4 / 100.0;
    else
      v10 = v4;
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
    objc_msgSend(MEMORY[0x24BDD4048], "percentUnit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v11) = objc_msgSend(v11, "isEqual:", v12);

    if ((_DWORD)v11)
      v13 = v7 / 100.0;
    else
      v13 = v7;
    objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x24BDD33A8];
    if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BDD33A8]))
    {

      v17 = *MEMORY[0x24BDD33A0];
LABEL_13:
      objc_msgSend(MEMORY[0x24BDD3E50], "quantityWithUnit:doubleValue:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), v13);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", v16);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", v17);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD3E68], "quantitySampleWithType:quantity:startDate:endDate:", v61, v14, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD3E68], "quantitySampleWithType:quantity:startDate:endDate:", v26, v60, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD3AA8], "correlationTypeForIdentifier:", *MEMORY[0x24BDD2B08]);
      v29 = v14;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)MEMORY[0x24BDD3A98];
      v33 = *(_QWORD *)(a1 + 64);
      v32 = *(_QWORD *)(a1 + 72);
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", v27, v28, 0);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "correlationWithType:startDate:endDate:objects:", v30, v33, v32, v34);
      v35 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE19450], "itemWithObject:", v35);
      v36 = objc_claimAutoreleasedReturnValue();

      v14 = v29;
LABEL_30:
      objc_msgSend(*(id *)(a1 + 32), "saveObject:withObjectType:item:", v35, *(_QWORD *)(a1 + 56), v36);
      v22 = (void *)v36;
      v21 = (void *)v35;
      goto LABEL_31;
    }
    objc_msgSend(*(id *)(a1 + 56), "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x24BDD33A0];
    v25 = objc_msgSend(v24, "isEqualToString:", *MEMORY[0x24BDD33A0]);

    if (v25)
      goto LABEL_13;
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFQuantitySampleAdditionalEnumeration"), objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      v21 = 0;
      v38 = *MEMORY[0x24BDD35E0];
      goto LABEL_25;
    }
    objc_msgSend(*(id *)(a1 + 56), "identifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = *MEMORY[0x24BDD35E0];
    v39 = objc_msgSend(v37, "isEqualToString:", *MEMORY[0x24BDD35E0]);

    if (v39)
    {
      v40 = +[WFHealthKitHelper enumFromReadableInsulinDeliveryReason:](WFHealthKitHelper, "enumFromReadableInsulinDeliveryReason:", v22);
      v68 = *MEMORY[0x24BDD31C8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = v41;
      v42 = (void *)MEMORY[0x24BDBCE70];
      v43 = &v69;
      v44 = &v68;
LABEL_23:
      objc_msgSend(v42, "dictionaryWithObjects:forKeys:count:", v43, v44, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_25;
    }
    objc_msgSend(*(id *)(a1 + 56), "identifier");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "isEqualToString:", *MEMORY[0x24BDD3398]);

    if (v46)
    {
      v47 = +[WFHealthKitHelper enumFromReadableBloodGlucoseMealTime:](WFHealthKitHelper, "enumFromReadableBloodGlucoseMealTime:", v22);
      if (v47)
      {
        v66 = *MEMORY[0x24BDD3170];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v47);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v41;
        v42 = (void *)MEMORY[0x24BDBCE70];
        v43 = &v67;
        v44 = &v66;
        goto LABEL_23;
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "identifier");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "isEqualToString:", *MEMORY[0x24BDD36A0]);

      if (v49)
      {
        v50 = +[WFHealthKitHelper enumFromReadableVO2MaxTestType:](WFHealthKitHelper, "enumFromReadableVO2MaxTestType:", v22);
        v64 = *MEMORY[0x24BDD3228];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v50);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v41;
        v42 = (void *)MEMORY[0x24BDBCE70];
        v43 = &v65;
        v44 = &v64;
        goto LABEL_23;
      }
    }
    v21 = 0;
LABEL_25:
    objc_msgSend(*(id *)(a1 + 56), "identifier");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v51, "isEqualToString:", v38) & 1) != 0)
    {
      objc_msgSend(v21, "objectForKeyedSubscript:", *MEMORY[0x24BDD31C8]);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v52)
      {
        v53 = *(void **)(a1 + 32);
        v54 = (void *)MEMORY[0x24BDD1540];
        v55 = *MEMORY[0x24BEC4270];
        v62[0] = *MEMORY[0x24BDD0FD8];
        WFLocalizedString(CFSTR("No Reason Selected"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v63[0] = v56;
        v62[1] = *MEMORY[0x24BDD0FC8];
        WFLocalizedString(CFSTR("Please select an insulin delivery reason."));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v63[1] = v57;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "errorWithDomain:code:userInfo:", v55, 5, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "finishRunningWithError:", v59);

        goto LABEL_31;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x24BDD3E68], "quantitySampleWithType:quantity:startDate:endDate:metadata:", *(_QWORD *)(a1 + 56), v14, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), v21);
    v35 = objc_claimAutoreleasedReturnValue();
    +[WFHKSampleContentItem itemWithQuantitySample:unit:](WFHKSampleContentItem, "itemWithQuantitySample:unit:", v35, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
    v36 = objc_claimAutoreleasedReturnValue();

    goto LABEL_30;
  }
  v18 = *(void **)(a1 + 32);
  v19 = (void *)MEMORY[0x24BDD1540];
  v20 = *MEMORY[0x24BEC4270];
  v70[0] = *MEMORY[0x24BDD0FD8];
  WFLocalizedString(CFSTR("No Unit Selected"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v14;
  v70[1] = *MEMORY[0x24BDD0FC8];
  WFLocalizedString(CFSTR("Please select a unit of measurement for this Health sample."));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, 5, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "finishRunningWithError:", v23);

LABEL_31:
}

id __49__WFLogHealthSampleAction_generatedResourceNodes__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BEC3FF8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithResource:", v3);

  return v4;
}

@end
