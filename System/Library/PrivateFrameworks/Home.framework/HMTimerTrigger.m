@implementation HMTimerTrigger

BOOL __125__HMTimerTrigger_NaturalLanguage__hf_recurrenceNaturalLanguageStringKeyWithOptions_recurrences_intendedForTimeTriggerEditor___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  v3 = objc_msgSend(v2, "weekday") >= 1 && objc_msgSend(v2, "weekday") != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

id __125__HMTimerTrigger_NaturalLanguage__hf_recurrenceNaturalLanguageStringKeyWithOptions_recurrences_intendedForTimeTriggerEditor___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "weekday") < 1)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v2, "weekday") - 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

uint64_t __125__HMTimerTrigger_NaturalLanguage__hf_recurrenceNaturalLanguageStringKeyWithOptions_recurrences_intendedForTimeTriggerEditor___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0D0C2B0], "weekdayIsWeekend:", (int)(objc_msgSend(a2, "intValue") + 1));
}

id __125__HMTimerTrigger_NaturalLanguage__hf_recurrenceNaturalLanguageStringKeyWithOptions_recurrences_intendedForTimeTriggerEditor___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(v3, "integerValue") < 0
    || (v4 = objc_msgSend(v3, "integerValue"), v4 >= objc_msgSend(*(id *)(a1 + 32), "count")))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", objc_msgSend(v3, "integerValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

void __102__HMTimerTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_timeString_fireDate_recurrences___block_invoke_2()
{
  void *v0;

  v0 = (void *)qword_1ED378F40;
  qword_1ED378F40 = (uint64_t)CFSTR("timeString");

}

void __102__HMTimerTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_timeString_fireDate_recurrences___block_invoke_4()
{
  void *v0;

  v0 = (void *)qword_1ED378F50;
  qword_1ED378F50 = (uint64_t)CFSTR("weekdays");

}

void __102__HMTimerTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_timeString_fireDate_recurrences___block_invoke_6()
{
  void *v0;

  v0 = (void *)qword_1ED378F60;
  qword_1ED378F60 = (uint64_t)CFSTR("actionsDescription");

}

id __102__HMTimerTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_timeString_fireDate_recurrences___block_invoke_7(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__HMTimerTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_timeString_fireDate_recurrences___block_invoke_8;
  block[3] = &unk_1EA727DD8;
  block[4] = *(_QWORD *)(a1 + 32);
  if (qword_1ED378F68 != -1)
    dispatch_once(&qword_1ED378F68, block);
  return (id)qword_1ED378F70;
}

void __102__HMTimerTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_timeString_fireDate_recurrences___block_invoke_8(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED378F70;
  qword_1ED378F70 = v1;

}

void __102__HMTimerTrigger_NaturalLanguage___hf_naturalLanguageNameWithOptions_timeString_fireDate_recurrences___block_invoke_10()
{
  void *v0;

  v0 = (void *)qword_1ED378F80;
  qword_1ED378F80 = (uint64_t)&unk_1EA7CDF08;

}

void __88__HMTimerTrigger_NaturalLanguage__hf_naturalLanguageDetailsWithRecurrences_withOptions___block_invoke_2()
{
  HFListFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(HFListFormatter);
  v1 = (void *)qword_1ED378F90;
  qword_1ED378F90 = (uint64_t)v0;

}

uint64_t __70__HMTimerTrigger_AutomationBuilders__hf_newTriggerWithBuilder_inHome___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addTimerTriggerFromBuilder:completionHandler:", *(_QWORD *)(a1 + 40), a2);
}

@end
