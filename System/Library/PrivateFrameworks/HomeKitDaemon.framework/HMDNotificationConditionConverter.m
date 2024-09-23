@implementation HMDNotificationConditionConverter

+ (id)conditionsFromPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "presenceNotificationConditionFromPredicate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v5, "addObject:", v6);
    objc_msgSend(a1, "timePeriodNotificationConditionFromPredicate:", v4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v7)
      v7 = objc_msgSend(v5, "addObject:", v7);
    v9 = (void *)MEMORY[0x227676638](v7);
    v10 = a1;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v12;
      v21 = 2112;
      v22 = v4;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Converted predicate: %@ to conditions: %@", (uint8_t *)&v19, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
    v13 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = a1;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Predicate is nil, nothing to convert", (uint8_t *)&v19, 0xCu);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (id)predicatesFromConditions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__HMDNotificationConditionConverter_predicatesFromConditions___block_invoke;
  v11[3] = &__block_descriptor_40_e34__16__0__HMDNotificationCondition_8l;
  v11[4] = a1;
  objc_msgSend(v4, "na_map:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x227676638]();
  v7 = a1;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v13 = v9;
    v14 = 2112;
    v15 = v4;
    v16 = 2112;
    v17 = v5;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEBUG, "%{public}@Converted conditions: %@ to predicates: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v6);

  return v5;
}

+ (id)presenceNotificationConditionFromPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  HMDPresenceNotificationCondition *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  HMDPresenceNotificationCondition *v28;
  void *v29;
  void *v30;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "_presencePredicatesFromPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hmf_isEmpty"))
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = a1;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v9;
      v10 = "%{public}@No presence predicate found to convert.";
      v11 = v8;
      v12 = OS_LOG_TYPE_INFO;
      v13 = 12;
LABEL_7:
      _os_log_impl(&dword_2218F0000, v11, v12, v10, buf, v13);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = a1;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v9;
      v36 = 2112;
      v37 = v5;
      v10 = "%{public}@Expected at most 1 presence predicate, found: %@";
      v11 = v8;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 22;
      goto LABEL_7;
    }
LABEL_8:

    objc_autoreleasePoolPop(v6);
    v14 = 0;
    goto LABEL_12;
  }
  v33 = v4;
  objc_msgSend(v5, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x227676638]();
  v18 = a1;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v20;
    v36 = 2112;
    v37 = v16;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Converting presence predicate: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  objc_msgSend(v16, "rightExpression");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constantValue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "hmf_stringForKey:", CFSTR("kPresenceEventPresence"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD78E8], "activationGranularityWithDict:", v22);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "value");
  objc_msgSend(v22, "hmf_arrayForKey:", CFSTR("kPresenceEventUsers"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "na_map:", &__block_literal_global_179576);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = eventTypeForPresenceTypeAndGranularity();
  v27 = userTypeForPresenceTypeAndGranularity();
  v28 = [HMDPresenceNotificationCondition alloc];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v25);
  v29 = v16;
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HMDPresenceNotificationCondition initWithPresenceEventType:presenceEventUserType:userUUIDs:](v28, "initWithPresenceEventType:presenceEventUserType:userUUIDs:", v26, v27, v30);

  v4 = v33;
LABEL_12:

  return v14;
}

+ (id)timePeriodNotificationConditionFromPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  HMDTimePeriodNotificationCondition *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void (**v21)(void *, id);
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  _QWORD aBlock[5];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(a1, "_timePredicatesFromPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "hmf_isEmpty"))
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = a1;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v9;
      v10 = "%{public}@No time predicate found to convert.";
      v11 = v8;
      v12 = OS_LOG_TYPE_INFO;
      v13 = 12;
LABEL_7:
      _os_log_impl(&dword_2218F0000, v11, v12, v10, buf, v13);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = a1;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v35 = v9;
      v36 = 2112;
      v37 = v5;
      v10 = "%{public}@Expected at most 1 time predicate, found: %@";
      v11 = v8;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 22;
      goto LABEL_7;
    }
LABEL_8:

    objc_autoreleasePoolPop(v6);
    v14 = 0;
    goto LABEL_30;
  }
  objc_msgSend(v5, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x227676638]();
  v18 = a1;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v35 = v20;
    v36 = 2112;
    v37 = v16;
    _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Converting time range predicate: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__HMDNotificationConditionConverter_timePeriodNotificationConditionFromPredicate___block_invoke;
  aBlock[3] = &__block_descriptor_40_e53___HMDTimePeriodElement_16__0__NSComparisonPredicate_8l;
  aBlock[4] = v18;
  v21 = (void (**)(void *, id))_Block_copy(aBlock);
  objc_msgSend(v16, "subpredicates");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v24 = v23;
  else
    v24 = 0;
  v25 = v24;

  if (v25)
  {
    v21[2](v21, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v16, "subpredicates");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v29 = v28;
      else
        v29 = 0;
      v30 = v29;

      if (v30)
      {
        v21[2](v21, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
          v14 = -[HMDTimePeriodNotificationCondition initWithStartElement:endElement:]([HMDTimePeriodNotificationCondition alloc], "initWithStartElement:endElement:", v26, v31);
        else
          v14 = 0;

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

LABEL_30:
  return v14;
}

+ (id)_presencePredicatesFromPredicate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v4, "subpredicates", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v22;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v22 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "_presencePredicatesFromPredicate:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "unionSet:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v8);
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v12 = v4;
      objc_msgSend(v12, "rightExpression");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "leftExpression");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "expressionType") == 3)
      {
        objc_msgSend(v14, "keyPath");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BDD6A00]);

        if (v16)
        {
          if (!objc_msgSend(v13, "expressionType"))
          {
            objc_msgSend(v13, "constantValue");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
              objc_msgSend(v5, "addObject:", v12);
          }
        }
      }

    }
  }
  v19 = (void *)objc_msgSend(v5, "copy");

  return v19;
}

+ (BOOL)_isTimePredicate:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (v5
    && (objc_msgSend(v5, "subpredicates"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8 == 2))
  {
    objc_msgSend(v6, "subpredicates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "na_filter:", &__block_literal_global_13_179564);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "count") == 2;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)_timePredicatesFromPredicate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v4;
    if (objc_msgSend(a1, "_isTimePredicate:", v6))
    {
      objc_msgSend(v5, "addObject:", v6);
    }
    else
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      objc_msgSend(v6, "subpredicates", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v16;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(a1, "_timePredicatesFromPredicate:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "unionSet:", v12);

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v9);
      }

    }
  }
  v13 = (void *)objc_msgSend(v5, "copy");

  return v13;
}

+ (id)_sunriseSunsetTimePeriodElementFromComparisonPredicate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  char isKindOfClass;
  void *v22;
  HMDSunriseSunsetTimePeriodElement *v23;
  void *v25;
  void *v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "predicateOperatorType") > 3)
  {
    v23 = 0;
  }
  else
  {
    objc_msgSend(v4, "leftExpression");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "expressionType") != 3)
      goto LABEL_21;
    v6 = *MEMORY[0x24BDD6D00];
    v27[0] = *MEMORY[0x24BDD6CF8];
    v27[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

    if (v9)
    {
      objc_msgSend(v5, "keyPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_alloc_init(MEMORY[0x24BDBCE68]);
      objc_msgSend(v4, "rightExpression");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "expressionType") == 4)
      {
        objc_msgSend(v12, "function");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("add:to:"));

        if (v14)
        {
          objc_msgSend(v12, "arguments");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "expressionType") == 4)
          {
            objc_msgSend(v16, "function");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("now"));

            if (v18)
            {
              objc_msgSend(v15, "lastObject");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (!objc_msgSend(v19, "expressionType"))
              {
                objc_msgSend(v19, "constantValue");
                v26 = v19;
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();

                if ((isKindOfClass & 1) != 0)
                {
                  v19 = v26;
                  objc_msgSend(v26, "constantValue");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v25, "hour") != 0x7FFFFFFFFFFFFFFFLL
                    || objc_msgSend(v25, "minute") != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    objc_msgSend(v26, "constantValue");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();

                    if (objc_msgSend(v22, "hour") != 0x7FFFFFFFFFFFFFFFLL && !objc_msgSend(v22, "hour"))
                      objc_msgSend(v22, "setHour:", 0x7FFFFFFFFFFFFFFFLL);
                    if (objc_msgSend(v22, "minute") != 0x7FFFFFFFFFFFFFFFLL && !objc_msgSend(v22, "minute"))
                      objc_msgSend(v22, "setMinute:", 0x7FFFFFFFFFFFFFFFLL);
                    objc_msgSend(a1, "negateOffsetDateComponents:", v22);
                    v11 = (id)objc_claimAutoreleasedReturnValue();

                    v19 = v26;
                  }

                }
                else
                {
                  v19 = v26;
                }
              }

            }
          }

        }
      }
      v23 = -[HMDSunriseSunsetTimePeriodElement initWithSignificantEvent:offset:]([HMDSunriseSunsetTimePeriodElement alloc], "initWithSignificantEvent:offset:", v10, v11);

    }
    else
    {
LABEL_21:
      v23 = 0;
    }

  }
  return v23;
}

+ (id)_timeOfDayTimePeriodElementFromComparisonPredicate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  HMDTimeOfDayTimePeriodElement *v7;
  void *v8;
  char isKindOfClass;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "predicateOperatorType") <= 4)
  {
    objc_msgSend(v3, "leftExpression");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rightExpression");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "expressionType") == 4)
    {
      objc_msgSend(v4, "function");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("now")) || objc_msgSend(v5, "expressionType"))
      {
        v7 = 0;
LABEL_6:

LABEL_11:
        goto LABEL_12;
      }
      objc_msgSend(v5, "constantValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v5, "constantValue");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[HMDTimeOfDayTimePeriodElement initWithHour:minute:]([HMDTimeOfDayTimePeriodElement alloc], "initWithHour:minute:", objc_msgSend(v6, "hour"), objc_msgSend(v6, "minute"));
        goto LABEL_6;
      }
    }
    v7 = 0;
    goto LABEL_11;
  }
  v7 = 0;
LABEL_12:

  return v7;
}

+ (id)negateOffsetDateComponents:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  if (objc_msgSend(v3, "minute") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v4, "setMinute:", -objc_msgSend(v3, "minute"));
  if (objc_msgSend(v3, "hour") != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v4, "setHour:", -objc_msgSend(v3, "hour"));

  return v4;
}

+ (id)predicateFromPresenceCondition:(id)a3
{
  id v3;
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
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[6];

  v21[5] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "presenceEventType");
  objc_msgSend(v3, "presenceEventUserType");
  objc_msgSend(v3, "userUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "na_map:", &__block_literal_global_22_179549);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  presenceTypeForEventTypeAndGranularity();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD78E8], "activationGranularityWithValue:", granularityForEventType());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCED8];
  v20[0] = CFSTR("kEventUUIDKey");
  objc_msgSend(MEMORY[0x24BDD1880], "hmf_zeroUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  v21[1] = &unk_24E96C350;
  v20[1] = CFSTR("kEventTriggerEndEvent");
  v20[2] = CFSTR("kEventTriggerTypeKey");
  v21[2] = CFSTR("kEventTriggerTypePresenceEventKey");
  v21[3] = v6;
  v20[3] = CFSTR("kPresenceEventPresence");
  v20[4] = CFSTR("kPresenceEventActivationGranularity");
  objc_msgSend(v7, "number");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryWithDictionary:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "hmf_isEmpty") & 1) == 0)
  {
    objc_msgSend(v5, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("kPresenceEventUsers"));

  }
  v15 = (void *)MEMORY[0x24BDD1758];
  v16 = *MEMORY[0x24BDD6A00];
  v17 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v15, "predicateWithFormat:", CFSTR("%K = %@"), v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)predicateFromTimePeriodCondition:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  void *v39;
  void *v40;
  char v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  NSObject *v54;
  void *v55;
  _QWORD v56[2];
  uint8_t buf[4];
  void *v58;
  _QWORD v59[3];

  v59[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "startElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v4, "startElement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    v9 = v8;

    objc_msgSend(v4, "endElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    v13 = objc_msgSend(v9, "hour");
    v14 = objc_msgSend(v9, "minute") + 60 * v13;
    v15 = objc_msgSend(v12, "hour");
    v16 = objc_msgSend(v12, "minute") + 60 * v15;
    v17 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v17, "setHour:", objc_msgSend(v9, "hour"));
    v18 = objc_msgSend(v9, "minute");

    objc_msgSend(v17, "setMinute:", v18);
    v19 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v19, "setHour:", objc_msgSend(v12, "hour"));
    v20 = objc_msgSend(v12, "minute");

    objc_msgSend(v19, "setMinute:", v20);
    objc_msgSend(MEMORY[0x24BDD7648], "predicateForEvaluatingTriggerOccurringAfterDateWithComponents:", v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD7648], "predicateForEvaluatingTriggerOccurringBeforeDateWithComponents:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 <= v16)
      v23 = 1;
    else
      v23 = 2;
    v24 = objc_alloc(MEMORY[0x24BDD14C0]);
    v59[0] = v21;
    v59[1] = v22;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v59, 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithType:subpredicates:", v23, v25);

    goto LABEL_12;
  }
  objc_opt_class();
  v27 = objc_opt_isKindOfClass();

  if ((v27 & 1) == 0)
  {
    v26 = 0;
    goto LABEL_25;
  }
  objc_msgSend(v4, "startElement");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v29 = v28;
  else
    v29 = 0;
  v17 = v29;

  objc_msgSend(v4, "endElement");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v31 = v30;
  else
    v31 = 0;
  v19 = v31;

  objc_msgSend(v17, "significantEvent");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *MEMORY[0x24BDD6CF8];
  if ((objc_msgSend(v32, "isEqualToString:", *MEMORY[0x24BDD6CF8]) & 1) == 0)
  {

    v35 = *MEMORY[0x24BDD6D00];
LABEL_27:
    objc_msgSend(v17, "significantEvent");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v39, "isEqualToString:", v35) & 1) != 0)
    {
      objc_msgSend(v19, "significantEvent");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "isEqualToString:", v33);

      if ((v41 & 1) != 0)
      {
        v37 = 2;
        goto LABEL_30;
      }
    }
    else
    {

    }
    v52 = (void *)MEMORY[0x227676638]();
    v53 = a1;
    HMFGetOSLogHandle();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v58 = v55;
      _os_log_impl(&dword_2218F0000, v54, OS_LOG_TYPE_ERROR, "%{public}@Start & end are either both sunrise or both sunset, this is unsupported", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v52);
    v26 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v19, "significantEvent");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = *MEMORY[0x24BDD6D00];
  v36 = objc_msgSend(v34, "isEqualToString:", *MEMORY[0x24BDD6D00]);

  if ((v36 & 1) == 0)
    goto LABEL_27;
  v37 = 1;
LABEL_30:
  v42 = objc_alloc(MEMORY[0x24BDD79B0]);
  objc_msgSend(v17, "significantEvent");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "offset");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v42, "initWithSignificantEvent:offset:", v43, v44);

  objc_msgSend(MEMORY[0x24BDD7648], "predicateForEvaluatingTriggerOccurringAfterSignificantEvent:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_alloc(MEMORY[0x24BDD79B0]);
  objc_msgSend(v19, "significantEvent");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "offset");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v45, "initWithSignificantEvent:offset:", v46, v47);

  objc_msgSend(MEMORY[0x24BDD7648], "predicateForEvaluatingTriggerOccurringBeforeSignificantEvent:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_alloc(MEMORY[0x24BDD14C0]);
  v56[0] = v22;
  v56[1] = v49;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v56, 2);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v50, "initWithType:subpredicates:", v37, v51);

LABEL_12:
LABEL_13:

LABEL_25:
  return v26;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t21_179536 != -1)
    dispatch_once(&logCategory__hmf_once_t21_179536, &__block_literal_global_33_179537);
  return (id)logCategory__hmf_once_v22_179538;
}

void __48__HMDNotificationConditionConverter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v22_179538;
  logCategory__hmf_once_v22_179538 = v0;

}

uint64_t __68__HMDNotificationConditionConverter_predicateFromPresenceCondition___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

uint64_t __54__HMDNotificationConditionConverter__isTimePredicate___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "leftExpression");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rightExpression");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "expressionType") == 4)
    {
      objc_msgSend(v6, "function");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", CFSTR("now")) && !objc_msgSend(v7, "expressionType"))
      {
        objc_msgSend(v7, "constantValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

      }
      else
      {
        isKindOfClass = 0;
      }

    }
    else
    {
      isKindOfClass = 0;
    }
    if (objc_msgSend(v6, "expressionType") == 3)
    {
      v11 = *MEMORY[0x24BDD6D00];
      v17[0] = *MEMORY[0x24BDD6CF8];
      v17[1] = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "keyPath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "containsObject:", v13);

    }
    else
    {
      v14 = 0;
    }
    v10 = isKindOfClass | v14;

  }
  else
  {
    v10 = 0;
  }

  return v10 & 1;
}

id __82__HMDNotificationConditionConverter_timePeriodNotificationConditionFromPredicate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_timeOfDayTimePeriodElementFromComparisonPredicate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_sunriseSunsetTimePeriodElementFromComparisonPredicate:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

id __80__HMDNotificationConditionConverter_presenceNotificationConditionFromPredicate___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BDD1880];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

id __62__HMDNotificationConditionConverter_predicatesFromConditions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    objc_msgSend(v4, "predicateFromTimePeriodCondition:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v12 = (void *)v8;

    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = *(void **)(a1 + 32);
    v10 = v3;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
    v7 = v11;

    objc_msgSend(v9, "predicateFromPresenceCondition:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  v13 = (void *)MEMORY[0x227676638]();
  v14 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543618;
    v19 = v16;
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Unsupported condition: %@ when converting to predicate", (uint8_t *)&v18, 0x16u);

  }
  objc_autoreleasePoolPop(v13);
  v12 = 0;
LABEL_15:

  return v12;
}

@end
