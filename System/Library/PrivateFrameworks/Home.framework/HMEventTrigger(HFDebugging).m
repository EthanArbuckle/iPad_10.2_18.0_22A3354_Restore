@implementation HMEventTrigger(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = a1;
  v15.super_class = (Class)&off_1F04514F8;
  v4 = a3;
  objc_msgSendSuper2(&v15, sel_hf_stateDumpBuilderWithContext_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "events", v15.receiver, v15.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("events"));

  v7 = objc_msgSend(v4, "detailLevel");
  if (v7 == 2)
  {
    objc_msgSend(a1, "endEvents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendObject:withName:options:", v8, CFSTR("endEvents"), 1);

    objc_msgSend(a1, "predicate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("predicate"));

    objc_msgSend(a1, "hf_effectiveRecurrences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "na_map:", &__block_literal_global_271);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(","));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("recurrences"));

    objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "executeOnce"), CFSTR("executeOnce"), 1);
    if (objc_msgSend(a1, "triggerActivationState") != 4)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "triggerActivationState"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("activationState"));

    }
  }
  return v5;
}

@end
