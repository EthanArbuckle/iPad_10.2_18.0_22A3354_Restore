@implementation HMPredicateUtilities

+ (id)rewritePredicateForClient:(id)a3 home:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v43;
  id v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v44 = v5;
    v7 = v5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend(v7, "subpredicates");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v47;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v47 != v12)
            objc_enumerationMutation(v9);
          +[HMPredicateUtilities rewritePredicateForClient:home:](HMPredicateUtilities, "rewritePredicateForClient:home:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * v13), v6);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", v14);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      }
      while (v11);
    }

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", objc_msgSend(v7, "compoundPredicateType"), v8);
    v5 = v44;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v17 = v5;
    v15 = v17;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v17, "leftExpression");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "rightExpression");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "expressionType") == 3)
      {
        objc_msgSend(v18, "keyPath");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("characteristic"));

        if (v21)
        {
          objc_msgSend(v15, "rightExpression");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v22, "expressionType"))
          {
            objc_msgSend(v22, "constantValue");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v24 = objc_opt_isKindOfClass();

            if ((v24 & 1) != 0)
            {
              objc_msgSend(v22, "constantValue");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "hmf_UUIDForKey:", CFSTR("kAccessoryUUID"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "hmf_numberForKey:", CFSTR("kServiceInstanceID"));
              v27 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "hmf_numberForKey:", CFSTR("kCharacteristicInstanceID"));
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = (void *)v27;
              objc_msgSend(v6, "_findCharacteristic:forService:accessoryUUID:", v28, v27, v26);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if (v29)
              {
                objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v29);
                v43 = v26;
                v30 = objc_claimAutoreleasedReturnValue();

                v22 = (void *)v30;
                v26 = v43;
              }

            }
          }
          v19 = v22;
        }
      }
      if (objc_msgSend(v18, "expressionType", v43) == 3)
      {
        objc_msgSend(v18, "keyPath");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("presence"));

        if (v32)
        {
          objc_msgSend(v15, "rightExpression");
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v33, "expressionType"))
          {
            objc_msgSend(v33, "constantValue");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v35 = objc_opt_isKindOfClass();

            if ((v35 & 1) != 0)
            {
              objc_msgSend(v33, "constantValue");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              +[HMPresenceEvent createWithDictionary:home:](HMPresenceEvent, "createWithDictionary:home:", v36, v6);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              if (v37)
              {
                objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", v37);
                v38 = objc_claimAutoreleasedReturnValue();

                v33 = (void *)v38;
              }

            }
          }
          v19 = v33;
        }
      }
      v39 = objc_alloc(MEMORY[0x1E0CB3518]);
      objc_msgSend(v15, "leftExpression");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v39, "initWithLeftExpression:rightExpression:modifier:type:options:", v40, v19, objc_msgSend(v15, "comparisonPredicateModifier"), objc_msgSend(v15, "predicateOperatorType"), objc_msgSend(v15, "options"));

      v15 = (void *)v41;
    }
  }

  return v15;
}

+ (BOOL)validatePredicate:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  const char *v50;
  void *v51;
  char v52;
  void *v53;
  void *v54;
  void *v55;
  BOOL valid;
  void *v58;
  char v59;
  uint64_t v60;
  void *v61;
  void *v62;
  char v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t v68[128];
  uint8_t buf[4];
  void *v70;
  __int16 v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
    goto LABEL_80;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_82;
    v10 = v3;
    +[HMHAPMetadata getSharedInstance](HMHAPMetadata, "getSharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leftExpression");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rightExpression");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "expressionType") != 3 || objc_msgSend(v10, "comparisonPredicateModifier"))
      goto LABEL_25;
    objc_msgSend(v12, "keyPath");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("characteristic")))
    {
      v15 = objc_msgSend(v10, "predicateOperatorType");

      if (v15 != 4)
        goto LABEL_25;
      if (objc_msgSend(v13, "expressionType"))
        goto LABEL_25;
      objc_msgSend(v13, "constantValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
        goto LABEL_25;
      objc_msgSend(v13, "constantValue");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
      v14 = v19;

      objc_msgSend(v14, "characteristicType");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "shouldNotCacheCharacteristicOfType:", v20) & 1) == 0)
      {
        objc_msgSend(v14, "properties");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "containsObject:", CFSTR("HMCharacteristicPropertyReadable"));

        if ((v59 & 1) != 0)
          goto LABEL_79;
LABEL_26:
        v21 = v10;
        objc_msgSend(v21, "leftExpression");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "rightExpression");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "expressionType") == 3 && !objc_msgSend(v21, "comparisonPredicateModifier"))
        {
          objc_msgSend(v22, "keyPath");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "isEqualToString:", CFSTR("characteristicValue")))
          {
            if (!objc_msgSend(v21, "predicateOperatorType")
              || objc_msgSend(v21, "predicateOperatorType") == 1
              || objc_msgSend(v21, "predicateOperatorType") == 2
              || objc_msgSend(v21, "predicateOperatorType") == 3
              || objc_msgSend(v21, "predicateOperatorType") == 4)
            {

            }
            else
            {
              v60 = objc_msgSend(v21, "predicateOperatorType");

              if (v60 != 5)
                goto LABEL_40;
            }
            if (!objc_msgSend(v23, "expressionType"))
              goto LABEL_71;
          }
          else
          {

          }
        }
LABEL_40:

        v25 = v21;
        objc_msgSend(v25, "leftExpression");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "rightExpression");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "expressionType") == 3 && !objc_msgSend(v25, "comparisonPredicateModifier"))
        {
          objc_msgSend(v22, "keyPath");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v37, "isEqualToString:", CFSTR("sunrise")))
          {

          }
          else
          {
            objc_msgSend(v22, "keyPath");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("sunset"));

            if (!v39)
              goto LABEL_42;
          }
          if (objc_msgSend(v25, "predicateOperatorType") == 2 || objc_msgSend(v25, "predicateOperatorType") == 1)
          {
            if (objc_msgSend(v23, "expressionType") == 4
              && (objc_msgSend(v23, "function"),
                  v40 = (void *)objc_claimAutoreleasedReturnValue(),
                  v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("add:to:")),
                  v40,
                  v41))
            {
              objc_msgSend(v23, "arguments");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "objectAtIndexedSubscript:", 0);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v43, "expressionType") == 4)
              {
                objc_msgSend(v43, "function");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = objc_msgSend(v44, "isEqualToString:", CFSTR("now"));

                if (v45)
                {
                  objc_msgSend(v42, "objectAtIndexedSubscript:", 1);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v46, "expressionType"))
                  {

                  }
                  else
                  {
                    objc_msgSend(v46, "constantValue");
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_opt_class();
                    v63 = objc_opt_isKindOfClass();

                    if ((v63 & 1) != 0)
                    {

                      goto LABEL_71;
                    }
                  }
                }
              }

            }
            else if (objc_msgSend(v23, "expressionType") == 4)
            {
              objc_msgSend(v23, "function");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = objc_msgSend(v51, "isEqualToString:", CFSTR("now"));

              if ((v52 & 1) != 0)
                goto LABEL_71;
            }
          }
        }
LABEL_42:

        v21 = v25;
        objc_msgSend(v21, "leftExpression");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "rightExpression");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v22, "expressionType") != 3 || objc_msgSend(v21, "comparisonPredicateModifier"))
          goto LABEL_76;
        objc_msgSend(v22, "keyPath");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "isEqualToString:", CFSTR("presence")))
        {
          v27 = objc_msgSend(v21, "predicateOperatorType");

          if (v27 == 4)
          {
            if (!objc_msgSend(v23, "expressionType"))
            {
              objc_msgSend(v23, "constantValue");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v29 = objc_opt_isKindOfClass();

              if ((v29 & 1) != 0)
              {
                objc_msgSend(v23, "constantValue");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v31 = v30;
                else
                  v31 = 0;
                v32 = v31;

                v33 = objc_msgSend(v32, "presenceEventType");
                if ((unint64_t)(v33 - 3) >= 2)
                {
                  if ((unint64_t)(v33 - 1) > 1)
                  {
                    v34 = (void *)MEMORY[0x1A1AC1AAC]();
                    HMFGetOSLogHandle();
                    v35 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                    {
                      HMFGetLogIdentifier();
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v32, "presenceEventType"));
                      *(_DWORD *)buf = 138543618;
                      v70 = v36;
                      v71 = 2112;
                      v72 = objc_claimAutoreleasedReturnValue();
                      v62 = (void *)v72;
                      _os_log_impl(&dword_19B1B0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Unsupported presence eventType: %@", buf, 0x16u);

                      goto LABEL_94;
                    }
                  }
                  else
                  {
                    v34 = (void *)MEMORY[0x1A1AC1AAC]();
                    HMFGetOSLogHandle();
                    v35 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                    {
                      HMFGetLogIdentifier();
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138543362;
                      v70 = v36;
                      _os_log_impl(&dword_19B1B0000, v35, OS_LOG_TYPE_INFO, "%{public}@Every entry or exit is not supported in presence events in predicate", buf, 0xCu);
LABEL_94:

                    }
                  }

                  objc_autoreleasePoolPop(v34);
LABEL_76:

                  +[HMPredicateUtilities significantEventTypesInComparisonPredicate:](HMPredicateUtilities, "significantEventTypesInComparisonPredicate:", v21);
                  v53 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v53)
                    goto LABEL_79;
                  +[HMPredicateUtilities personFamiliarityOptionsInComparisonPredicate:](HMPredicateUtilities, "personFamiliarityOptionsInComparisonPredicate:", v21);
                  v54 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v54)
                    goto LABEL_79;
                  +[HMPredicateUtilities audioAnalysisNotificationOptionsInPredicate:](HMPredicateUtilities, "audioAnalysisNotificationOptionsInPredicate:", v21);
                  v55 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v55)
                    goto LABEL_79;
                  valid = isValidTimeComparison(v21);

                  if (valid)
                    goto LABEL_80;
LABEL_82:
                  v9 = 0;
                  goto LABEL_83;
                }

LABEL_71:
LABEL_79:

LABEL_80:
                v9 = 1;
                goto LABEL_83;
              }
            }
            v47 = (void *)MEMORY[0x1A1AC1AAC]();
            HMFGetOSLogHandle();
            v48 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v70 = v49;
              v71 = 2112;
              v72 = (uint64_t)v21;
              v50 = "%{public}@Invalid presence right condition: %@";
              goto LABEL_74;
            }
            goto LABEL_75;
          }
        }
        else
        {

        }
        v47 = (void *)MEMORY[0x1A1AC1AAC]();
        HMFGetOSLogHandle();
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v70 = v49;
          v71 = 2112;
          v72 = (uint64_t)v21;
          v50 = "%{public}@Invalid presence left condition: %@";
LABEL_74:
          _os_log_impl(&dword_19B1B0000, v48, OS_LOG_TYPE_ERROR, v50, buf, 0x16u);

        }
LABEL_75:

        objc_autoreleasePoolPop(v47);
        goto LABEL_76;
      }

    }
LABEL_25:

    goto LABEL_26;
  }
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend(v3, "subpredicates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v65;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v65 != v7)
          objc_enumerationMutation(v4);
        if (!+[HMPredicateUtilities validatePredicate:](HMPredicateUtilities, "validatePredicate:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i)))
        {
          v9 = 0;
          goto LABEL_38;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_38:

LABEL_83:
  return v9;
}

+ (BOOL)areOnlyHourAndMinuteSet:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v3 = (objc_class *)MEMORY[0x1E0C99D78];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setMinute:", objc_msgSend(v4, "minute"));
  objc_msgSend(v5, "setHour:", objc_msgSend(v4, "hour"));
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_dateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setMinute:", objc_msgSend(v4, "minute"));
  objc_msgSend(v7, "setHour:", objc_msgSend(v4, "hour"));
  LODWORD(v6) = objc_msgSend(v4, "isEqual:", v5);

  if ((_DWORD)v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isValidDateInCalendar:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)rewritePredicateForDaemon:(id)a3
{
  char v4;

  v4 = 0;
  objc_msgSend(a1, "rewritePredicateForDaemon:characteristicIsInvalid:", a3, &v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)rewritePredicateForDaemon:(id)a3 characteristicIsInvalid:(BOOL *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[3];
  _QWORD v52[3];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v6, "subpredicates");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v48;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v48 != v11)
            objc_enumerationMutation(v8);
          +[HMPredicateUtilities rewritePredicateForDaemon:characteristicIsInvalid:](HMPredicateUtilities, "rewritePredicateForDaemon:characteristicIsInvalid:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v12), a4);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v7, "count"))
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3528]), "initWithType:subpredicates:", objc_msgSend(v6, "compoundPredicateType"), v7);
    else
      v14 = 0;
    goto LABEL_37;
  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v16 = v5;
  v14 = v16;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v16, "leftExpression");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "rightExpression");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "expressionType") == 3
      && (objc_msgSend(v7, "keyPath"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("characteristic")),
          v18,
          v19))
    {
      if (!objc_msgSend(v17, "expressionType"))
      {
        objc_msgSend(v17, "constantValue");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v21 = objc_opt_isKindOfClass();

        if ((v21 & 1) != 0)
        {
          objc_msgSend(v17, "constantValue");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "service");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "accessory");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v24
            || (objc_msgSend(v23, "accessoryUUID"),
                v25 = (void *)objc_claimAutoreleasedReturnValue(),
                v25,
                !v22)
            || !v23
            || !v25)
          {
            if (a4)
              *a4 = 1;

            v14 = 0;
            goto LABEL_36;
          }
          v43 = (void *)MEMORY[0x1E0CB35D0];
          v51[0] = CFSTR("kAccessoryUUID");
          objc_msgSend(v23, "accessoryUUID");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "UUIDString");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v52[0] = v45;
          v51[1] = CFSTR("kServiceInstanceID");
          objc_msgSend(v23, "instanceID");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v52[1] = v42;
          v51[2] = CFSTR("kCharacteristicInstanceID");
          objc_msgSend(v22, "instanceID");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v52[2] = v26;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 3);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "expressionForConstantValue:", v27);
          v44 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v44;
        }
      }
    }
    else if (objc_msgSend(v7, "expressionType") == 3
           && (objc_msgSend(v7, "keyPath"),
               v28 = (void *)objc_claimAutoreleasedReturnValue(),
               v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("characteristicValue")),
               v28,
               v29))
    {
      v30 = objc_msgSend(v17, "expressionType");
      if (a4 && !v30 && *a4)
      {
        v14 = 0;
        *a4 = 0;
LABEL_36:

LABEL_37:
        goto LABEL_38;
      }
    }
    else if (objc_msgSend(v7, "expressionType") == 3)
    {
      objc_msgSend(v7, "keyPath");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("presence"));

      if (v32)
      {
        if (!objc_msgSend(v17, "expressionType"))
        {
          objc_msgSend(v17, "constantValue");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v34 = objc_opt_isKindOfClass();

          if ((v34 & 1) != 0)
          {
            objc_msgSend(v17, "constantValue");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = (void *)MEMORY[0x1E0CB35D0];
            objc_msgSend(v35, "_serializeForAdd");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "expressionForConstantValue:", v37);
            v38 = objc_claimAutoreleasedReturnValue();

            v17 = (void *)v38;
          }
        }
      }
    }
    v39 = objc_alloc(MEMORY[0x1E0CB3518]);
    objc_msgSend(v14, "leftExpression");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v39, "initWithLeftExpression:rightExpression:modifier:type:options:", v40, v17, objc_msgSend(v14, "comparisonPredicateModifier"), objc_msgSend(v14, "predicateOperatorType"), objc_msgSend(v14, "options"));

    goto LABEL_36;
  }
LABEL_38:

  return v14;
}

+ (BOOL)containsPresenceEvents:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v4, "subpredicates", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v5);
          if ((v8 & 1) != 0)
            v8 = 1;
          else
            v8 = objc_msgSend(a1, "containsPresenceEvents:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "leftExpression");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "expressionType") == 3)
      {
        objc_msgSend(v11, "keyPath");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v12, "isEqualToString:", CFSTR("presence"));

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
  }

  return v8;
}

+ (id)significantEventTypesInComparisonPredicate:(id)a3
{
  return (id)objc_msgSend(a1, "bitwiseAndValueWithKeyPath:inComparisonPredicate:validValues:", CFSTR("cameraSignificantEvent"), a3, 31);
}

+ (id)personFamiliarityOptionsInComparisonPredicate:(id)a3
{
  return (id)objc_msgSend(a1, "bitwiseAndValueWithKeyPath:inComparisonPredicate:validValues:", CFSTR("personFamiliarityOptions"), a3, 7);
}

+ (id)audioAnalysisNotificationOptionsInPredicate:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "bitwiseAndValueWithKeyPath:inPredicate:validValues:", CFSTR("audioAnalysisEventNotificationOptions"), v3, -1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)bitwiseAndValueWithKeyPath:(id)a3 inPredicate:(id)a4 validValues:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;
  v12 = v11;
  if (v11)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v11, "subpredicates", 0);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
LABEL_7:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(a1, "bitwiseAndValueWithKeyPath:inPredicate:validValues:", v8, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v17), a5);
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
          goto LABEL_19;
        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          if (v15)
            goto LABEL_7;
          break;
        }
      }
    }
LABEL_20:
    v21 = 0;
    goto LABEL_21;
  }
  v19 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v20 = v19;
  else
    v20 = 0;
  v13 = v20;

  if (!v13)
    goto LABEL_20;
  objc_msgSend(a1, "bitwiseAndValueWithKeyPath:inComparisonPredicate:validValues:", v8, v13, a5);
  v18 = objc_claimAutoreleasedReturnValue();
LABEL_19:
  v21 = (void *)v18;
LABEL_21:

  return v21;
}

+ (id)bitwiseAndValueWithKeyPath:(id)a3 inComparisonPredicate:(id)a4 validValues:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  id v22;
  void *v24;
  void *v25;
  id v26;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "leftExpression");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rightExpression");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "predicateOperatorType");

  if (v11 == 5 && !objc_msgSend(v10, "expressionType"))
  {
    objc_msgSend(v10, "constantValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", &unk_1E3B2E110);

    if (v13)
    {
      if (objc_msgSend(v9, "expressionType") == 4)
      {
        objc_msgSend(v9, "function");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v14, "isEqualToString:", CFSTR("bitwiseAnd:with:")))
          goto LABEL_13;
        objc_msgSend(v9, "arguments");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "count");

        if (v16 == 2)
        {
          objc_msgSend(v9, "arguments");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v14, "expressionType") == 3)
          {
            objc_msgSend(v14, "keyPath");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "isEqualToString:", v7);

            if (v19)
            {
              objc_msgSend(v9, "arguments");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v21, "expressionType"))
              {
                v22 = 0;
              }
              else
              {
                objc_msgSend(v21, "constantValue");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                  v25 = v24;
                else
                  v25 = 0;
                v26 = v25;

                v22 = 0;
                if ((objc_msgSend(v26, "unsignedIntegerValue") & ~a5) == 0)
                  v22 = v26;

              }
              goto LABEL_14;
            }
          }
LABEL_13:
          v22 = 0;
LABEL_14:

          goto LABEL_12;
        }
      }
    }
  }
  v22 = 0;
LABEL_12:

  return v22;
}

@end
