@implementation WFLogWorkoutAction

- (void)wasAddedToWorkflow:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFLogWorkoutAction;
  -[WFLogWorkoutAction wasAddedToWorkflow:](&v5, sel_wasAddedToWorkflow_, a3);
  -[WFLogWorkoutAction resourceManager](self, "resourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addTarget:selector:", self, sel_resourceAvailabilityChanged);

  -[WFLogWorkoutAction resourceAvailabilityChanged](self, "resourceAvailabilityChanged");
}

- (void)wasRemovedFromWorkflow:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFLogWorkoutAction;
  -[WFLogWorkoutAction wasRemovedFromWorkflow:](&v5, sel_wasRemovedFromWorkflow_, a3);
  -[WFLogWorkoutAction resourceManager](self, "resourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeTarget:selector:", self, sel_resourceAvailabilityChanged);

}

- (void)resourceAvailabilityChanged
{
  void *v3;
  id v4;

  -[WFLogWorkoutAction parameterForKey:](self, "parameterForKey:", CFSTR("WFWorkoutCaloriesQuantity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatePossibleUnits");

  -[WFLogWorkoutAction parameterForKey:](self, "parameterForKey:", CFSTR("WFWorkoutDistanceQuantity"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updatePossibleUnits");

}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  WFLogWorkoutAction *v29;
  id v30;
  void *v31;
  unint64_t v32;
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x24BDAC8D0];
  -[WFLogWorkoutAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFWorkoutReadableActivityType"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLogWorkoutAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFWorkoutDate"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLogWorkoutAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFWorkoutDuration"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLogWorkoutAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFWorkoutCaloriesQuantity"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFLogWorkoutAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFWorkoutDistanceQuantity"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[WFHealthKitHelper workoutActivityTypeFromReadableWorkoutActivityType:](WFHealthKitHelper, "workoutActivityTypeFromReadableWorkoutActivityType:", v4);
  if (+[WFHealthKitHelper readableWorkoutActivityTypeIsValid:](WFHealthKitHelper, "readableWorkoutActivityTypeIsValid:", v4))
  {
    objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3340]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD3E80], "quantityTypeForIdentifier:", *MEMORY[0x24BDD3560]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLogWorkoutAction setCurrentState:](self, "setCurrentState:", 0);
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __49__WFLogWorkoutAction_runAsynchronouslyWithInput___block_invoke_3;
    v24[3] = &unk_24F8BA430;
    v31 = &__block_literal_global_45819;
    v25 = v11;
    v26 = v8;
    v27 = v6;
    v28 = v10;
    v32 = v9;
    v29 = self;
    v30 = v5;
    v12 = v10;
    v13 = v11;
    __49__WFLogWorkoutAction_runAsynchronouslyWithInput___block_invoke((uint64_t)v13, v12, v7, v24);

    v14 = v31;
  }
  else
  {
    v23 = v4;
    v15 = v8;
    v16 = v7;
    v17 = v6;
    v18 = v5;
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BEC4270];
    v33[0] = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("No Workout Type Selected"));
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v34[0] = v13;
    v33[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Please select a type of activity for this workout."));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v34[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v19;
    v5 = v18;
    v6 = v17;
    v7 = v16;
    v8 = v15;
    v4 = v23;
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v20, 5, v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLogWorkoutAction finishRunningWithError:](self, "finishRunningWithError:", v22);

  }
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
  WFLocalizedString(CFSTR("Allow “%1$@” to use %2$@ in a new Workout?"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringWithFormat:", v9, v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)logWorkoutContinue:(id)a3
{
  id v4;

  v4 = a3;
  switch(-[WFLogWorkoutAction currentState](self, "currentState"))
  {
    case 0uLL:
      -[WFLogWorkoutAction setCurrentState:](self, "setCurrentState:", 1);
      -[WFLogWorkoutAction beginCollection:](self, "beginCollection:", v4);
      break;
    case 1uLL:
      -[WFLogWorkoutAction setCurrentState:](self, "setCurrentState:", 2);
      -[WFLogWorkoutAction addSamples:](self, "addSamples:", v4);
      break;
    case 2uLL:
      -[WFLogWorkoutAction setCurrentState:](self, "setCurrentState:", 3);
      -[WFLogWorkoutAction endCollection:](self, "endCollection:", v4);
      break;
    case 3uLL:
      -[WFLogWorkoutAction setCurrentState:](self, "setCurrentState:", 4);
      -[WFLogWorkoutAction finishWorkout:](self, "finishWorkout:", v4);
      break;
    default:
      -[WFLogWorkoutAction setCurrentState:](self, "setCurrentState:", 0);
      break;
  }

}

- (void)beginCollection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFLogWorkoutAction workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__WFLogWorkoutAction_beginCollection___block_invoke;
  v7[3] = &unk_24F8BA480;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)addSamples:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFLogWorkoutAction workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__WFLogWorkoutAction_addSamples___block_invoke;
  v7[3] = &unk_24F8BA480;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)endCollection:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFLogWorkoutAction workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__WFLogWorkoutAction_endCollection___block_invoke;
  v7[3] = &unk_24F8BA480;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)finishWorkout:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WFLogWorkoutAction workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__WFLogWorkoutAction_finishWorkout___block_invoke;
  v7[3] = &unk_24F8BA480;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)disabledOnPlatforms
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFLogWorkoutAction;
  -[WFLogWorkoutAction disabledOnPlatforms](&v5, sel_disabledOnPlatforms);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObject:", *MEMORY[0x24BEC43E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HKWorkoutBuilder)builder
{
  return self->_builder;
}

- (void)setBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_builder, a3);
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_currentState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_builder, 0);
}

void __36__WFLogWorkoutAction_finishWorkout___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "builder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __36__WFLogWorkoutAction_finishWorkout___block_invoke_2;
  v3[3] = &unk_24F8BA4A8;
  objc_copyWeak(&v5, &location);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "finishWorkoutWithCompletion:", v3);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __36__WFLogWorkoutAction_finishWorkout___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v11)
  {
    objc_msgSend(WeakRetained, "output");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "distanceUnit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "calorieUnit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFHKWorkoutContentItem itemWithWorkout:distanceUnit:caloriesUnit:](WFHKWorkoutContentItem, "itemWithWorkout:distanceUnit:caloriesUnit:", v11, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addItem:", v10);

  }
  objc_msgSend(WeakRetained, "finishRunningWithError:", v5);

}

void __36__WFLogWorkoutAction_endCollection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "builder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__WFLogWorkoutAction_endCollection___block_invoke_2;
  v4[3] = &unk_24F8BA458;
  objc_copyWeak(&v6, &location);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "endCollectionWithEndDate:completion:", v3, v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __36__WFLogWorkoutAction_endCollection___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v6)
    objc_msgSend(WeakRetained, "finishRunningWithError:", v6);
  else
    objc_msgSend(WeakRetained, "logWorkoutContinue:", *(_QWORD *)(a1 + 32));

}

void __33__WFLogWorkoutAction_addSamples___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*v2, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "caloriesSample");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  objc_msgSend(*(id *)(a1 + 40), "distanceSample");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__WFLogWorkoutAction_addSamples___block_invoke_2;
  v7[3] = &unk_24F8BA458;
  objc_copyWeak(&v9, &location);
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v3, "addSamples:completion:", v6, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __33__WFLogWorkoutAction_addSamples___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v6)
    objc_msgSend(WeakRetained, "finishRunningWithError:", v6);
  else
    objc_msgSend(WeakRetained, "logWorkoutContinue:", *(_QWORD *)(a1 + 32));

}

void __38__WFLogWorkoutAction_beginCollection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "builder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__WFLogWorkoutAction_beginCollection___block_invoke_2;
  v4[3] = &unk_24F8BA458;
  objc_copyWeak(&v6, &location);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "beginCollectionWithStartDate:completion:", v3, v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __38__WFLogWorkoutAction_beginCollection___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v5;
  id v6;

  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v6)
    objc_msgSend(WeakRetained, "finishRunningWithError:", v6);
  else
    objc_msgSend(WeakRetained, "logWorkoutContinue:", *(_QWORD *)(a1 + 32));

}

void __49__WFLogWorkoutAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void (*v14)(uint64_t, uint64_t, uint64_t, _QWORD *);
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 80);
  v9 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __49__WFLogWorkoutAction_runAsynchronouslyWithInput___block_invoke_4;
  v17[3] = &unk_24F8BA408;
  v18 = *(id *)(a1 + 48);
  v19 = *(id *)(a1 + 56);
  v20 = v5;
  v10 = *(id *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 88);
  v12 = *(_QWORD *)(a1 + 64);
  v13 = *(void **)(a1 + 72);
  v21 = v10;
  v22 = v12;
  v25 = v11;
  v23 = v6;
  v24 = v13;
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(v7 + 16);
  v15 = v6;
  v16 = v5;
  v14(v7, v9, v8, v17);

}

void __49__WFLogWorkoutAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  void (**v20)(_QWORD, _QWORD, _QWORD);

  v6 = a2;
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))v8;
  if (v7)
  {
    objc_msgSend(v7, "unitString");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_6;
    v11 = (void *)v10;
    v12 = (void *)MEMORY[0x24BDD4048];
    objc_msgSend(v7, "unitString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "wf_safeUnitFromString:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)MEMORY[0x24BDD3E50];
      objc_msgSend(v7, "magnitude");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "doubleValue");
      objc_msgSend(v15, "quantityWithUnit:doubleValue:", v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v9)[2](v9, v17, v14);

    }
    else
    {
LABEL_6:
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __49__WFLogWorkoutAction_runAsynchronouslyWithInput___block_invoke_2;
      v18[3] = &unk_24F8BA390;
      v20 = v9;
      v19 = v7;
      +[WFHealthKitHelper validUnitsForQuantityType:completion:](WFHealthKitHelper, "validUnitsForQuantityType:completion:", v6, v18);

      v14 = v20;
    }

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v8 + 2))(v8, 0, 0);
  }

}

void __49__WFLogWorkoutAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD3E50];
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "magnitude");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  objc_msgSend(v3, "quantityWithUnit:doubleValue:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v4 + 16))(v4, v6, v7);

}

void __49__WFLogWorkoutAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  _QWORD aBlock[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;

  v5 = a2;
  v6 = a3;
  v7 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__WFLogWorkoutAction_runAsynchronouslyWithInput___block_invoke_5;
  aBlock[3] = &unk_24F8BA3B8;
  v18 = *(id *)(a1 + 32);
  v19 = *(id *)(a1 + 40);
  v20 = *(id *)(a1 + 48);
  v21 = *(id *)(a1 + 56);
  v8 = v5;
  v26 = *(_QWORD *)(a1 + 88);
  v9 = *(_QWORD *)(a1 + 64);
  v10 = *(void **)(a1 + 72);
  v22 = v8;
  v23 = v9;
  v24 = v10;
  v11 = v6;
  v25 = v11;
  v12 = _Block_copy(aBlock);
  if (objc_msgSend(*(id *)(a1 + 80), "length"))
  {
    objc_msgSend(MEMORY[0x24BE19450], "itemWithObject:", *(_QWORD *)(a1 + 80));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v7;
    v15[1] = 3221225472;
    v15[2] = __49__WFLogWorkoutAction_runAsynchronouslyWithInput___block_invoke_6;
    v15[3] = &unk_24F8BA3E0;
    v15[4] = *(_QWORD *)(a1 + 64);
    v16 = v12;
    objc_msgSend(v13, "getObjectRepresentation:forClass:", v15, objc_opt_class());

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v12 + 2))(v12, v14);

  }
}

void __49__WFLogWorkoutAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  WFLogWorkoutActionWorkout *v16;
  id v17;

  v3 = (void *)MEMORY[0x24BEC3CB0];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "unitString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "calendarUnitFromUnitString:", v6);

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "magnitude");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingUnit:value:toDate:options:", v7, objc_msgSend(v9, "integerValue"), v5, 0);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD3E68], "quantitySampleWithType:quantity:startDate:endDate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5, v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3E68], "quantitySampleWithType:quantity:startDate:endDate:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v5, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setActivityType:", *(_QWORD *)(a1 + 96));
  v13 = objc_alloc(MEMORY[0x24BDD4128]);
  objc_msgSend(MEMORY[0x24BDD3C40], "wf_shortcutsAppHealthStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithHealthStore:configuration:device:", v14, v12, 0);
  objc_msgSend(*(id *)(a1 + 72), "setBuilder:", v15);

  v16 = -[WFLogWorkoutActionWorkout initWithStartDate:endDate:caloriesSample:calorieUnit:distanceSample:distanceUnit:]([WFLogWorkoutActionWorkout alloc], "initWithStartDate:endDate:caloriesSample:calorieUnit:distanceSample:distanceUnit:", v5, v17, v10, *(_QWORD *)(a1 + 80), v11, *(_QWORD *)(a1 + 88));
  objc_msgSend(*(id *)(a1 + 72), "logWorkoutContinue:", v16);

}

uint64_t __49__WFLogWorkoutAction_runAsynchronouslyWithInput___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a4);
}

@end
