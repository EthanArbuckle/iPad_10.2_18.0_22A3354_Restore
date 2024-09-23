@implementation HMTrigger

uint64_t __57__HMTrigger_HFDebugging__hf_stateDumpBuilderWithContext___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isAnonymous") ^ 1;
}

uint64_t __57__HMTrigger_HFDebugging__hf_stateDumpBuilderWithContext___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isAnonymous");
}

void __66__HMTrigger_NaturalLanguage__hf_naturalLangugeDetailsWithOptions___block_invoke_2()
{
  HFListFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(HFListFormatter);
  v1 = (void *)qword_1ED378F20;
  qword_1ED378F20 = (uint64_t)v0;

}

void __84__HMTrigger_NaturalLanguage___hf_naturalLanguageDetailsSentenceElementsWithOptions___block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E40], "orderedSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED378F30;
  qword_1ED378F30 = v0;

}

uint64_t __44__HMTrigger_HFAdditions__hf_isShortcutOwned__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isShortcutOwned");
}

void __45__HMTrigger_HFAdditions__hf_anonymousActions__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED379450;
  qword_1ED379450 = v0;

}

id __45__HMTrigger_HFAdditions__hf_anonymousActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "hf_isAnonymous"))
  {
    objc_msgSend(v2, "actions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __49__HMTrigger_HFAdditions__hf_shouldDisplayTrigger__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __49__HMTrigger_HFAdditions__hf_shouldDisplayTrigger__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  objc_opt_class();
  v3 = v2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (v5)
  {
    objc_msgSend(v5, "characteristic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "service");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hf_isProgrammableSwitch") ^ 1;

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

id __48__HMTrigger_HFAdditions__hf_forceDisableReasons__block_invoke(uint64_t a1, void *a2)
{
  _BOOL8 v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = objc_msgSend(a2, "authorizationStatus") != 2;
  +[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAccessAllowedWhenLocked");

  if (v5)
    v6 = v2;
  else
    v6 = v2 | 2;
  v7 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "futureWithResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __54__HMTrigger_HFAdditions__hf_sanitizeTriggerName_home___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

uint64_t __50__HMTrigger_HFAdditions__hf_affectsHomeKitObject___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristics");
}

uint64_t __50__HMTrigger_HFAdditions__hf_affectsHomeKitObject___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "characteristics");
}

uint64_t __52__HMTrigger_HFAdditions__hf_affectsCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "hf_affectedCharacteristics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intersectsSet:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __45__HMTrigger_HFAdditions__hf_affectsProfiles___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "hf_affectedProfiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intersectsSet:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
