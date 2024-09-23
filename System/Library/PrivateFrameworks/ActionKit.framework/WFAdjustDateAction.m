@implementation WFAdjustDateAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[6];
  _QWORD v18[4];
  id v19;

  v4 = a3;
  -[WFAdjustDateAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFAdjustOperation"), objc_opt_class());
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Add")) & 1) != 0)
    goto LABEL_2;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Subtract")) & 1) != 0)
  {
    v6 = 1;
    goto LABEL_5;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Get Start of Year")) & 1) != 0)
  {
    v16 = 2;
LABEL_20:

    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __49__WFAdjustDateAction_runAsynchronouslyWithInput___block_invoke_2;
    v17[3] = &unk_24F8B55C0;
    v17[4] = self;
    v17[5] = v16;
    -[WFAdjustDateAction finishWithInput:dateTransform:](self, "finishWithInput:dateTransform:", v4, v17);
    goto LABEL_21;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Get Start of Month")) & 1) != 0)
  {
    v16 = 3;
    goto LABEL_20;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Get Start of Week")) & 1) != 0)
  {
    v16 = 4;
    goto LABEL_20;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Get Start of Day")) & 1) != 0)
  {
    v16 = 5;
    goto LABEL_20;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Get Start of Hour")) & 1) != 0)
  {
    v16 = 6;
    goto LABEL_20;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Get Start of Minute")) & 1) != 0)
  {
    v16 = 7;
    goto LABEL_20;
  }
LABEL_2:
  v6 = 0;
LABEL_5:

  -[WFAdjustDateAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFDuration"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BEC3CB0];
  objc_msgSend(v7, "unitString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "calendarUnitFromUnitString:", v9);

  objc_msgSend(v7, "magnitude");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  if (v6)
    v13 = -v13;
  v14 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v14, "setValue:forComponent:", (uint64_t)v13, v10);
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __49__WFAdjustDateAction_runAsynchronouslyWithInput___block_invoke;
  v18[3] = &unk_24F8B5598;
  v19 = v14;
  v15 = v14;
  -[WFAdjustDateAction finishWithInput:dateTransform:](self, "finishWithInput:dateTransform:", v4, v18);

LABEL_21:
}

- (id)transformDate:(id)a3 operation:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  switch(a4)
  {
    case 2uLL:
      objc_msgSend(v6, "wf_startOfYearForDate:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3uLL:
      objc_msgSend(v6, "wf_startOfMonthForDate:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4uLL:
      objc_msgSend(v6, "wf_startOfWeekForDate:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 5uLL:
      objc_msgSend(v6, "startOfDayForDate:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 6uLL:
      objc_msgSend(v6, "wf_startOfHourForDate:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 7uLL:
      objc_msgSend(v6, "wf_startOfMinuteForDate:", v5);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v9 = (void *)v8;
      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

- (void)finishWithInput:(id)a3 dateTransform:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_class();
  v10[4] = self;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __52__WFAdjustDateAction_finishWithInput_dateTransform___block_invoke;
  v11[3] = &unk_24F8B55E8;
  v12 = v6;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__WFAdjustDateAction_finishWithInput_dateTransform___block_invoke_2;
  v10[3] = &unk_24F8BAFA8;
  v9 = v6;
  objc_msgSend(v7, "transformObjectRepresentationsForClass:usingBlock:completionHandler:", v8, v11, v10);

}

void __52__WFAdjustDateAction_finishWithInput_dateTransform___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void (**a5)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (**v10)(_QWORD, _QWORD, _QWORD);
  id v11;
  id v12;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void (**)(uint64_t, uint64_t))(v8 + 16);
  v10 = a5;
  v11 = a4;
  v9(v8, a2);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id, id))a5)[2](v10, v12, v11);

}

void __52__WFAdjustDateAction_finishWithInput_dateTransform___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

id __49__WFAdjustDateAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a2;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingComponents:toDate:options:", *(_QWORD *)(a1 + 32), v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __49__WFAdjustDateAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "transformDate:operation:", a2, *(_QWORD *)(a1 + 40));
}

@end
