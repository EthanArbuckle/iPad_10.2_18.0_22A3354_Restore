@implementation HMTrigger(HREAdditions)

- (id)hre_triggerComparisonIdentifierInHome:()HREAdditions
{
  id v4;
  objc_class *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  id (*v26)(uint64_t, void *);
  void *v27;
  id v28;
  id v29;

  v4 = a3;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = a1;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;
  v9 = v8;

  if (v9)
  {
    objc_msgSend(v9, "events");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = __65__HMTrigger_HREAdditions__hre_triggerComparisonIdentifierInHome___block_invoke;
    v27 = &unk_24F218F20;
    v28 = v7;
    v29 = v4;
    objc_msgSend(v10, "na_map:", &v24);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "componentsJoinedByString:", CFSTR("-"));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  objc_opt_class();
  v14 = v7;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (v16)
  {
    v17 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v16, "fireDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "recurrence");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@-%@"), v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();

    v13 = (__CFString *)v20;
  }
  v21 = &stru_24F219000;
  if (v13)
    v21 = v13;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v6, v21, v24, v25, v26, v27, v28);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)hre_verboseHashForEvent:()HREAdditions inHome:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  v8 = v6;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    objc_msgSend(v10, "characteristic");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hre_triggeringValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v11, "uniqueIdentifier");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v13 != 1)
    {
      objc_msgSend(v10, "thresholdRange");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "minValue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "thresholdRange");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "maxValue");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("thresholdCharacteristic:%@, range:(min:%@, max:%@)"), v15, v17, v22);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
    objc_msgSend(v10, "hre_triggeringValues");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v15;
    v30 = v17;
    goto LABEL_12;
  }
  objc_opt_class();
  v18 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v11 = v19;

  if (v11)
  {
    objc_msgSend(v11, "characteristic");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v15, "uniqueIdentifier");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "triggerValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v16;
    v30 = v17;
LABEL_12:
    objc_msgSend(v14, "stringWithFormat:", CFSTR("characteristic:%@, targetValue:%@"), v29, v30);
LABEL_13:
    v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

    goto LABEL_16;
  }
  objc_opt_class();
  v24 = v18;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v25 = v24;
  else
    v25 = 0;
  v15 = v25;

  if (v15)
  {
    v26 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v15, "significantEvent");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "offset");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("timeEvent:%@, offset:%@"), v16, v17);
    goto LABEL_13;
  }
  objc_opt_class();
  v27 = v24;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v28 = v27;
  else
    v28 = 0;
  v16 = v28;

  if (v16)
    objc_msgSend(a1, "_hre_hashForPresenceEvent:inHome:verbose:", v16, v7, 1);
  else
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v20;
}

+ (id)_hre_hashForPresenceEvent:()HREAdditions inHome:verbose:
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  void *v15;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "presenceEventType");
  objc_msgSend(v8, "users");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v8, "currentUser");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "removeObject:", v12);
  v13 = &stru_24F219000;
  if (objc_msgSend(v11, "count") && a5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("userType:%lu"), objc_msgSend(v7, "presenceUserType"));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (!objc_msgSend(v11, "count") || (a5 & 1) == 0)
  {
    v14 = 2;
    if (v9 != 4)
      v14 = v9;
    if (v9 == 3)
      v9 = 1;
    else
      v9 = v14;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("presenceEventType:%lu, %@"), v9, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
