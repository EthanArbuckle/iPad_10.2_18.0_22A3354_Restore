@implementation HMDPredicateUtilities

- (HMDPredicateUtilities)initWithHome:(id)a3 logIdentifier:(id)a4
{
  id v6;
  id v7;
  HMDPredicateUtilities *v8;
  HMDPredicateUtilities *v9;
  uint64_t v10;
  NSString *logIdentifier;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDPredicateUtilities;
  v8 = -[HMDPredicateUtilities init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_home, v6);
    v10 = objc_msgSend(v7, "copy");
    logIdentifier = v9->_logIdentifier;
    v9->_logIdentifier = (NSString *)v10;

  }
  return v9;
}

- (id)sunrise
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDPredicateUtilities *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HMDPredicateUtilities home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeLocationHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDLocation sunriseTimeForLocation:](HMDLocation, "sunriseTimeForLocation:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_localTimeDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Sunrise time: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  return v6;
}

- (id)sunset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDPredicateUtilities *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HMDPredicateUtilities home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeLocationHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDLocation sunsetTimeForLocation:](HMDLocation, "sunsetTimeForLocation:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x227676638]();
  v8 = self;
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hmf_localTimeDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Sunset time: %@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v7);
  return v6;
}

- (id)rewritePredicate:(id)a3 currentCharacteristicInPredicate:(id *)a4 characteristicsToRead:(id)a5 homePresence:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  char isKindOfClass;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  int v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  char v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  char v71;
  HMDPresenceEvent *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  id v77;
  id v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  uint64_t v87;
  id v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[HMDPredicateUtilities home](self, "home");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v24 = 0x24BDD1000uLL;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v26 = v10;
    v23 = v26;
    if ((isKindOfClass & 1) == 0)
      goto LABEL_63;
    v92 = v13;
    v87 = objc_msgSend(v26, "predicateOperatorType");
    objc_msgSend(v23, "rightExpression");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "leftExpression");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "expressionType") == 4)
    {
      objc_msgSend(v27, "function");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("add:to:"));

      if (v30)
      {
        objc_msgSend(v27, "arguments");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v32, "expressionType") != 4)
        {
LABEL_43:

          goto LABEL_60;
        }
        objc_msgSend(v32, "function");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("now"));

        if (!v34)
        {
          v24 = 0x24BDD1000;
          goto LABEL_43;
        }
        objc_msgSend(v31, "objectAtIndexedSubscript:", 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v35, "expressionType"))
        {
          objc_msgSend(v35, "constantValue");
          v83 = v35;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v37 = objc_opt_isKindOfClass();

          if ((v37 & 1) == 0)
          {
            v24 = 0x24BDD1000;
            v35 = v83;
            goto LABEL_22;
          }
          v79 = (void *)MEMORY[0x24BDD1548];
          v35 = v83;
          objc_msgSend(v83, "constantValue");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "expressionWithFormat:", CFSTR("FUNCTION($THIS_OBJECT, 'addDeltaToNow:', %@)"), v38);
          v80 = objc_claimAutoreleasedReturnValue();

          v27 = (void *)v80;
        }
        v24 = 0x24BDD1000;
LABEL_22:

        goto LABEL_43;
      }
    }
    if (!objc_msgSend(v27, "expressionType"))
    {
      objc_msgSend(v27, "constantValue");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v40 = objc_opt_isKindOfClass();

      if ((v40 & 1) != 0)
      {
        v41 = (void *)MEMORY[0x24BDD1548];
        objc_msgSend(v27, "constantValue");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "expressionWithFormat:", CFSTR("FUNCTION($THIS_OBJECT, 'dateTodayMatchingComponents:', %@)"), v42);
        v43 = objc_claimAutoreleasedReturnValue();

        v27 = (void *)v43;
        goto LABEL_59;
      }
    }
    if (objc_msgSend(v28, "expressionType") == 3)
    {
      objc_msgSend(v28, "keyPath");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "isEqualToString:", *MEMORY[0x24BDD56D8]);

      if (v45)
      {
        objc_msgSend(v23, "rightExpression");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v24 = 0x24BDD1000;
        if (objc_msgSend(v46, "expressionType"))
        {
          v27 = v46;
LABEL_60:
          v56 = v87;
          goto LABEL_61;
        }
        objc_msgSend(v46, "constantValue");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v61 = objc_opt_isKindOfClass();

        if ((v61 & 1) != 0)
        {
          objc_msgSend(v46, "constantValue");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "hmf_UUIDForKey:", CFSTR("kAccessoryUUID"));
          v63 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "hmf_numberForKey:", CFSTR("kServiceInstanceID"));
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = v62;
          objc_msgSend(v62, "hmf_numberForKey:", CFSTR("kCharacteristicInstanceID"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = (void *)v63;
          objc_msgSend(v92, "accessoryWithUUID:", v63);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v66 = v65;
          else
            v66 = 0;
          v67 = v66;

          if (v67)
          {
            objc_msgSend(v67, "findCharacteristic:forService:", v64, v81);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            if (a4 && v68)
            {
              v78 = v68;
              v77 = objc_retainAutorelease(v68);
              *a4 = v77;
              objc_msgSend(v11, "objectForKey:", v67);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v69)
              {
                objc_msgSend(MEMORY[0x24BDBCEF0], "set");
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "setObject:forKey:", v69, v67);
              }
              objc_msgSend(v69, "addObject:", v77);

              v68 = v78;
            }

          }
          v50 = 0;
          goto LABEL_62;
        }
        v27 = v46;
LABEL_59:
        v24 = 0x24BDD1000uLL;
        goto LABEL_60;
      }
    }
    if (objc_msgSend(v28, "expressionType") == 3)
    {
      objc_msgSend(v28, "keyPath");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "isEqualToString:", *MEMORY[0x24BDD5AB0]);

      if (v48)
      {
        objc_msgSend(v23, "rightExpression");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = objc_msgSend(v46, "expressionType");
        v50 = 0;
        if (!a4 || v49)
          goto LABEL_62;
        v88 = v10;
        v51 = *a4;
        if (!*a4)
        {
          v50 = 0;
          v10 = v88;
          goto LABEL_62;
        }
        v52 = (void *)MEMORY[0x24BDD1548];
        objc_msgSend(v46, "constantValue");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v23, "predicateOperatorType"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "expressionWithFormat:", CFSTR("FUNCTION($THIS_OBJECT, 'compareValueOfCharacteristic:againstValue:operatorType:', %@, %@, %@)"), v51, v53, v54);
        v55 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD1548], "expressionForConstantValue:", MEMORY[0x24BDBD1C8]);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        *a4 = 0;
        v56 = 4;
        v28 = (void *)v55;
        v10 = v88;
        goto LABEL_66;
      }
    }
    if (objc_msgSend(v28, "expressionType") != 3)
      goto LABEL_59;
    objc_msgSend(v28, "keyPath");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend(v57, "isEqualToString:", *MEMORY[0x24BDD6A00]);

    v24 = 0x24BDD1000;
    v56 = v87;
    if (v58)
    {
      objc_msgSend(v23, "rightExpression");
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(v59, "expressionType"))
      {
        objc_msgSend(v59, "constantValue");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v71 = objc_opt_isKindOfClass();

        if ((v71 & 1) != 0)
        {
          objc_msgSend(v59, "constantValue");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          +[HMDPresenceEventModel eventModelWithDictionary:home:eventTriggerUUID:message:](HMDPresenceEventModel, "eventModelWithDictionary:home:eventTriggerUUID:message:", v90, v92, 0, 0);
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = -[HMDPresenceEvent initWithModel:home:]([HMDPresenceEvent alloc], "initWithModel:home:", v85, v92);
          v73 = (void *)MEMORY[0x24BDD1548];
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v23, "predicateOperatorType"));
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "expressionWithFormat:", CFSTR("FUNCTION($THIS_OBJECT, 'comparePresence:operatorType:homePresence:', %@, %@, %@)"), v72, v74, v12);
          v75 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x24BDD1548], "expressionForConstantValue:", MEMORY[0x24BDBD1C8]);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = (void *)v75;
          v56 = 4;
        }
        else
        {
          v27 = v59;
        }
LABEL_66:
        v24 = 0x24BDD1000;
        goto LABEL_61;
      }
      v27 = v59;
    }
LABEL_61:
    v50 = objc_msgSend(objc_alloc(*(Class *)(v24 + 1208)), "initWithLeftExpression:rightExpression:modifier:type:options:", v28, v27, objc_msgSend(v23, "comparisonPredicateModifier"), v56, objc_msgSend(v23, "options"));
    v46 = v27;
LABEL_62:

    v23 = (void *)v50;
    v13 = v92;
    goto LABEL_63;
  }
  v86 = v10;
  v91 = v13;
  v14 = v10;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v82 = v14;
  objc_msgSend(v14, "subpredicates");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v93, v97, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v94;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v94 != v19)
          objc_enumerationMutation(v16);
        -[HMDPredicateUtilities rewritePredicate:currentCharacteristicInPredicate:characteristicsToRead:homePresence:](self, "rewritePredicate:currentCharacteristicInPredicate:characteristicsToRead:homePresence:", *(_QWORD *)(*((_QWORD *)&v93 + 1) + 8 * i), a4, v11, v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          objc_msgSend(v15, "addObject:", v21);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v93, v97, 16);
    }
    while (v18);
  }

  if (objc_msgSend(v15, "count"))
  {
    v22 = v82;
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", objc_msgSend(v82, "compoundPredicateType"), v15);
    v13 = v91;
  }
  else
  {
    v23 = 0;
    v13 = v91;
    v22 = v82;
  }

  v10 = v86;
LABEL_63:

  return v23;
}

- (id)compareValueOfCharacteristic:(id)a3 againstValue:(id)a4 operatorType:(id)a5
{
  return +[HMDCharacteristicEventBase compareValueOfCharacteristic:againstValue:operatorType:](HMDCharacteristicEventBase, "compareValueOfCharacteristic:againstValue:operatorType:", a3, a4, a5);
}

- (id)comparePresence:(id)a3 operatorType:(id)a4 homePresence:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  HMDPredicateUtilities *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "unsignedIntegerValue") == 4)
  {
    if (!v10)
    {
      -[HMDPredicateUtilities home](self, "home");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "presenceMonitor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "currentHomePresence");
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    v13 = (void *)MEMORY[0x227676638]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543874;
      v21 = v16;
      v22 = 2112;
      v23 = v10;
      v24 = 2112;
      v25 = v8;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Checking whether the homePresence %@ agree with the presence events in condition: %@", (uint8_t *)&v20, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    v17 = objc_msgSend(v8, "evaluateWithHomePresence:", v10);
  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)updatePredicate:(id)a3 currentCharacteristicInPredicate:(id *)a4 conditionModified:(BOOL *)a5 removedCharacteristic:(id)a6 underService:(id)a7 underAccessory:(id)a8
{
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  int v43;
  void *v44;
  char isKindOfClass;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  HMDPredicateUtilities *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  int v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  id v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v72 = a6;
  v71 = a7;
  v15 = a8;
  -[HMDPredicateUtilities home](self, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_53:
      v26 = v14;
      goto LABEL_54;
    }
    v27 = v14;
    objc_msgSend(v27, "rightExpression");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "leftExpression");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v28;
    if (objc_msgSend(v29, "expressionType") == 4)
    {
      objc_msgSend(v29, "function");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v30, "isEqualToString:", CFSTR("now")))
      {
LABEL_18:

        goto LABEL_19;
      }
      v68 = v27;
      v31 = v14;
      objc_msgSend(v16, "homeLocationHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "timeZone");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        objc_msgSend(v16, "homeLocationHandler");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "timeZone");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDPredicateUtilities rewriteNowAdjustedForHomeTimeZone:](self, "rewriteNowAdjustedForHomeTimeZone:", v34);
        v35 = objc_claimAutoreleasedReturnValue();

        v29 = (void *)v35;
        v14 = v31;
        v28 = v66;
        v27 = v68;
        goto LABEL_18;
      }
      v14 = v31;
      v28 = v66;
      v27 = v68;
    }
LABEL_19:
    if (objc_msgSend(v28, "expressionType") == 4)
    {
      objc_msgSend(v28, "function");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v36, "isEqualToString:", CFSTR("now")))
      {
        v69 = v27;
        v37 = v14;
        objc_msgSend(v16, "homeLocationHandler");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "timeZone");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v39)
        {
          v14 = v37;
          v27 = v69;
          goto LABEL_24;
        }
        objc_msgSend(v16, "homeLocationHandler");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "timeZone");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDPredicateUtilities rewriteNowAdjustedForHomeTimeZone:](self, "rewriteNowAdjustedForHomeTimeZone:", v40);
        v41 = objc_claimAutoreleasedReturnValue();

        v66 = (void *)v41;
        v14 = v37;
        v27 = v69;
      }

    }
LABEL_24:
    if (objc_msgSend(v29, "expressionType") != 3
      || (objc_msgSend(v29, "keyPath"),
          v42 = (void *)objc_claimAutoreleasedReturnValue(),
          v43 = objc_msgSend(v42, "isEqualToString:", *MEMORY[0x24BDD56D8]),
          v42,
          !v43))
    {
      if (objc_msgSend(v29, "expressionType") == 3)
      {
        objc_msgSend(v29, "keyPath");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "isEqualToString:", *MEMORY[0x24BDD5AB0]);

        if (v56)
        {
          v57 = objc_msgSend(v66, "expressionType");
          if (a4)
          {
            if (!v57 && *a4)
            {
              *a4 = 0;
              v54 = v66;
              if (a5)
                *a5 = 1;
              goto LABEL_46;
            }
          }
        }
      }
      goto LABEL_52;
    }
    if (objc_msgSend(v66, "expressionType")
      || (objc_msgSend(v66, "constantValue"),
          v44 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v44,
          (isKindOfClass & 1) == 0))
    {
LABEL_52:

      goto LABEL_53;
    }
    objc_msgSend(v66, "constantValue");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "hmf_UUIDForKey:", CFSTR("kAccessoryUUID"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "hmf_numberForKey:", CFSTR("kServiceInstanceID"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "hmf_numberForKey:", CFSTR("kCharacteristicInstanceID"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "uuid");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v64, "isEqual:", v47))
    {
      v60 = v46;
      objc_msgSend(v72, "instanceID");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v62, "isEqual:", v48) & 1) != 0)
      {
        objc_msgSend(v71, "instanceID");
        v70 = v14;
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v61, "isEqual:", v49);

        v14 = v70;
        v46 = v60;
        if (v59)
        {
          v50 = (void *)MEMORY[0x227676638]();
          v51 = self;
          HMFGetOSLogHandle();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v78 = v53;
            v79 = 2112;
            v80 = v72;
            _os_log_impl(&dword_2218F0000, v52, OS_LOG_TYPE_INFO, "%{public}@Char %@ has been removed, and it has reference in the condition, updating the condition", buf, 0x16u);

            v14 = v70;
          }

          objc_autoreleasePoolPop(v50);
          v46 = v60;
          if (a4)
          {
            *a4 = objc_retainAutorelease(v72);
            if (a5)
              *a5 = 1;

            v54 = v66;
LABEL_46:

            v26 = 0;
            goto LABEL_54;
          }
        }
        goto LABEL_51;
      }

      v46 = v60;
    }

LABEL_51:
    goto LABEL_52;
  }
  v65 = v16;
  v67 = v14;
  v17 = v14;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  v63 = v17;
  objc_msgSend(v17, "subpredicates");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v74 != v22)
          objc_enumerationMutation(v19);
        -[HMDPredicateUtilities updatePredicate:currentCharacteristicInPredicate:conditionModified:removedCharacteristic:underService:underAccessory:](self, "updatePredicate:currentCharacteristicInPredicate:conditionModified:removedCharacteristic:underService:underAccessory:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i), a4, a5, v72, v71, v15);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
          objc_msgSend(v18, "addObject:", v24);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v73, v81, 16);
    }
    while (v21);
  }

  if (objc_msgSend(v18, "count"))
  {
    v25 = v63;
    v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", objc_msgSend(v63, "compoundPredicateType"), v18);
  }
  else
  {
    v26 = 0;
    v25 = v63;
  }
  v16 = v65;

  v14 = v67;
LABEL_54:

  return v26;
}

- (id)updatePredicate:(id)a3 removedUser:(id)a4 conditionModified:(BOOL *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  char isKindOfClass;
  void *v27;
  HMDPredicateUtilities *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v38;
  HMDPresenceEvent *v39;
  void *v40;
  HMDPresenceEvent *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[HMDPredicateUtilities home](self, "home");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v50 = v8;
    v52 = v10;
    v11 = v8;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    objc_msgSend(v11, "subpredicates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v56 != v16)
            objc_enumerationMutation(v13);
          -[HMDPredicateUtilities updatePredicate:removedUser:conditionModified:](self, "updatePredicate:removedUser:conditionModified:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i), v9, a5);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend(v12, "addObject:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
      }
      while (v15);
    }

    if (objc_msgSend(v12, "count"))
      v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", objc_msgSend(v11, "compoundPredicateType"), v12);
    else
      v19 = 0;
    v10 = v52;

    v8 = v50;
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_26:
    v19 = v8;
    goto LABEL_27;
  }
  v20 = v8;
  v51 = objc_msgSend(v20, "predicateOperatorType");
  objc_msgSend(v20, "leftExpression");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "expressionType") != 3
    || (objc_msgSend(v21, "keyPath"),
        v22 = (void *)objc_claimAutoreleasedReturnValue(),
        v23 = objc_msgSend(v22, "isEqualToString:", *MEMORY[0x24BDD6A00]),
        v22,
        !v23))
  {
LABEL_25:

    goto LABEL_26;
  }
  objc_msgSend(v20, "rightExpression");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v24, "expressionType")
    || (objc_msgSend(v24, "constantValue"),
        v49 = v24,
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v25,
        v24 = v49,
        (isKindOfClass & 1) == 0))
  {

    goto LABEL_25;
  }
  objc_msgSend(v49, "constantValue");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)MEMORY[0x227676638]();
  v28 = self;
  HMFGetOSLogHandle();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v53 = v27;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v60 = v30;
    v61 = 2112;
    v62 = v48;
    _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_INFO, "%{public}@presence event dictionary: %@", buf, 0x16u);

    v27 = v53;
  }

  objc_autoreleasePoolPop(v27);
  objc_msgSend(v48, "hmf_arrayForKey:", CFSTR("kPresenceEventUsers"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "mutableCopy");

  objc_msgSend(v9, "uuid");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "UUIDString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = objc_msgSend(v32, "indexOfObject:", v34);
  v36 = v48;
  if (v35 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = 0;
  }
  else
  {
    v46 = v34;
    objc_msgSend(v32, "removeObjectAtIndex:", v35);
    v38 = (void *)objc_msgSend(v48, "mutableCopy");
    v47 = v32;
    objc_msgSend(v38, "setObject:forKey:", v32, CFSTR("kPresenceEventUsers"));
    v45 = v38;
    +[HMDPresenceEventModel eventModelWithDictionary:home:eventTriggerUUID:message:](HMDPresenceEventModel, "eventModelWithDictionary:home:eventTriggerUUID:message:", v38, v10, 0, 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v10;
    v39 = -[HMDPresenceEvent initWithModel:home:]([HMDPresenceEvent alloc], "initWithModel:home:", v44, v10);
    v40 = (void *)MEMORY[0x24BDD1548];
    v41 = v39;
    -[HMDPresenceEvent createPresenceEventPayload:](v39, "createPresenceEventPayload:", 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "expressionForConstantValue:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD14B8]), "initWithLeftExpression:rightExpression:modifier:type:options:", v21, v43, objc_msgSend(v20, "comparisonPredicateModifier"), v51, objc_msgSend(v20, "options"));
    if (a5)
      *a5 = 1;

    v10 = v54;
    v32 = v47;
    v36 = v48;
    v34 = v46;
  }

LABEL_27:
  return v19;
}

- (id)predicateWithoutStaleCharacteristicsFromPredicate:(id)a3 accessory:(id)a4 conditionModified:(BOOL *)a5
{
  char v6;

  v6 = 0;
  -[HMDPredicateUtilities _updatePredicate:staleCharacteristicInCurrentPredicate:accessory:conditionModified:](self, "_updatePredicate:staleCharacteristicInCurrentPredicate:accessory:conditionModified:", a3, &v6, a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_updatePredicate:(id)a3 staleCharacteristicInCurrentPredicate:(BOOL *)a4 accessory:(id)a5 conditionModified:(BOOL *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  char isKindOfClass;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  HMDPredicateUtilities *v34;
  NSObject *v35;
  HMDPredicateUtilities *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = v10;
      objc_msgSend(v22, "rightExpression");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "leftExpression");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "expressionType") == 3
        && (objc_msgSend(v24, "keyPath"),
            v25 = (void *)objc_claimAutoreleasedReturnValue(),
            v26 = objc_msgSend(v25, "isEqualToString:", *MEMORY[0x24BDD56D8]),
            v25,
            v26))
      {
        if (!objc_msgSend(v23, "expressionType"))
        {
          objc_msgSend(v23, "constantValue");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v23, "constantValue");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "hmf_UUIDForKey:", CFSTR("kAccessoryUUID"));
            v30 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "hmf_numberForKey:", CFSTR("kServiceInstanceID"));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = v29;
            objc_msgSend(v29, "hmf_numberForKey:", CFSTR("kCharacteristicInstanceID"));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "uuid");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = (void *)v30;
            if ((objc_msgSend(v31, "isEqual:", v30) & 1) != 0)
            {
              objc_msgSend(v11, "findCharacteristic:forService:", v44, v46);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v32)
              {
                v48 = v10;
                v33 = (void *)MEMORY[0x227676638]();
                v34 = self;
                HMFGetOSLogHandle();
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v36 = v34;
                  v37 = v33;
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  v54 = v38;
                  v55 = 2112;
                  v56 = v22;
                  _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_INFO, "%{public}@Removing predicate %@ because referenced characteristic no longer exists", buf, 0x16u);

                  v33 = v37;
                  v34 = v36;
                }

                objc_autoreleasePoolPop(v33);
                *a4 = 1;
                *a6 = 1;

                v10 = v48;
                goto LABEL_30;
              }
            }
            else
            {

            }
          }
        }
      }
      else if (objc_msgSend(v24, "expressionType") == 3)
      {
        objc_msgSend(v24, "keyPath");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "isEqualToString:", *MEMORY[0x24BDD5AB0]);

        if (v40)
        {
          if (!objc_msgSend(v23, "expressionType") && *a4)
          {
            *a4 = 0;
            *a6 = 1;
LABEL_30:

            v21 = 0;
            goto LABEL_35;
          }
        }
      }

    }
    v21 = v10;
    goto LABEL_35;
  }
  v47 = v10;
  v12 = v10;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v45 = v12;
  objc_msgSend(v12, "subpredicates");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v50;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v50 != v17)
          objc_enumerationMutation(v14);
        -[HMDPredicateUtilities _updatePredicate:staleCharacteristicInCurrentPredicate:accessory:conditionModified:](self, "_updatePredicate:staleCharacteristicInCurrentPredicate:accessory:conditionModified:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v18), a4, v11, a6);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
          objc_msgSend(v13, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v16);
  }

  if (objc_msgSend(v13, "count"))
  {
    v20 = v45;
    v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", objc_msgSend(v45, "compoundPredicateType"), v13);
  }
  else
  {
    v21 = 0;
    v20 = v45;
  }

  v10 = v47;
LABEL_35:

  return v21;
}

- (id)rewriteNowAdjustedForHomeTimeZone:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x24BDBCE68];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v7, "setDateStyle:", 4);
  objc_msgSend(v7, "setTimeStyle:", 4);
  objc_msgSend(v7, "setTimeZone:", v4);
  objc_msgSend(v7, "setDateFormat:", CFSTR("HH"));
  objc_msgSend(v7, "stringFromDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHour:", (int)objc_msgSend(v8, "intValue"));

  objc_msgSend(v7, "setDateFormat:", CFSTR("mm"));
  objc_msgSend(v7, "stringFromDate:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinute:", (int)objc_msgSend(v9, "intValue"));

  objc_msgSend(v5, "setTimeZone:", v4);
  objc_msgSend(MEMORY[0x24BDD1548], "expressionWithFormat:", CFSTR("FUNCTION($THIS_OBJECT, 'dateTodayMatchingComponents:', %@)"), v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)addDeltaToNow:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDBCE60];
  v4 = a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeZone:", v7);

  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v4, v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dateTodayMatchingComponents:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDBCE60];
  v4 = a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 124, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHour:", objc_msgSend(v4, "hour"));
  v8 = objc_msgSend(v4, "minute");

  objc_msgSend(v7, "setMinute:", v8);
  objc_msgSend(v6, "dateFromComponents:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)rewritePredicateForClient:(id)a3
{
  return -[HMDPredicateUtilities rewritePredicate:forDaemon:message:](self, "rewritePredicate:forDaemon:message:", a3, 0, 0);
}

- (id)rewritePredicateForDaemon:(id)a3 message:(id)a4
{
  return -[HMDPredicateUtilities rewritePredicate:forDaemon:message:](self, "rewritePredicate:forDaemon:message:", a3, 1, a4);
}

- (id)rewritePredicate:(id)a3 forDaemon:(BOOL)a4 message:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  char isKindOfClass;
  void *v28;
  HMDPresenceEvent *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v6 = a4;
  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v20 = v8;
      v21 = objc_msgSend(v20, "predicateOperatorType");
      objc_msgSend(v20, "leftExpression");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "expressionType") == 3)
      {
        objc_msgSend(v22, "keyPath");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "isEqualToString:", *MEMORY[0x24BDD6A00]);

        if (v24)
        {
          v37 = v21;
          objc_msgSend(v20, "rightExpression");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v25, "expressionType"))
          {
            objc_msgSend(v25, "constantValue");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              -[HMDPredicateUtilities home](self, "home");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "constantValue");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              +[HMDPresenceEventModel eventModelWithDictionary:home:eventTriggerUUID:message:](HMDPresenceEventModel, "eventModelWithDictionary:home:eventTriggerUUID:message:", v35, v28, 0, v9);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = -[HMDPresenceEvent initWithModel:home:]([HMDPresenceEvent alloc], "initWithModel:home:", v34, v28);
              v30 = (void *)MEMORY[0x24BDD1548];
              -[HMDPresenceEvent createPresenceEventPayload:](v29, "createPresenceEventPayload:", v6);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "expressionForConstantValue:", v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();

              v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD14B8]), "initWithLeftExpression:rightExpression:modifier:type:options:", v22, v32, objc_msgSend(v20, "comparisonPredicateModifier"), v37, objc_msgSend(v20, "options"));
              goto LABEL_24;
            }
          }

        }
      }

    }
    v19 = v8;
    goto LABEL_24;
  }
  v10 = v8;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v36 = v10;
  objc_msgSend(v10, "subpredicates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v39;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v39 != v15)
          objc_enumerationMutation(v12);
        -[HMDPredicateUtilities rewritePredicate:forDaemon:message:](self, "rewritePredicate:forDaemon:message:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v16), v6, v9);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v11, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v11, "count"))
  {
    v18 = v36;
    v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", objc_msgSend(v36, "compoundPredicateType"), v11);
  }
  else
  {
    v19 = 0;
    v18 = v36;
  }

LABEL_24:
  return v19;
}

- (BOOL)containsPresenceEvents:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char isKindOfClass;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v4, "subpredicates", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      isKindOfClass = 0;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v5);
          if ((isKindOfClass & 1) != 0)
            isKindOfClass = 1;
          else
            isKindOfClass = -[HMDPredicateUtilities containsPresenceEvents:](self, "containsPresenceEvents:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }
    else
    {
      isKindOfClass = 0;
    }

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = v4;
      objc_msgSend(v11, "rightExpression");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "leftExpression");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "expressionType") == 3
        && (objc_msgSend(v13, "keyPath"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BDD6A00]),
            v14,
            v15)
        && !objc_msgSend(v12, "expressionType"))
      {
        objc_msgSend(v12, "constantValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
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
  }

  return isKindOfClass & 1;
}

- (id)generateAnalyticsData:(id)a3
{
  id v4;
  HMDAnalyticsPredicateData *v5;

  v4 = a3;
  v5 = objc_alloc_init(HMDAnalyticsPredicateData);
  -[HMDPredicateUtilities fillAnalyticsData:forPredicate:](self, "fillAnalyticsData:forPredicate:", v5, v4);

  return v5;
}

- (void)fillAnalyticsData:(id)a3 forPredicate:(id)a4
{
  _BYTE *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  char isKindOfClass;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  uint64_t v39;
  void *v40;
  HMDPresenceEvent *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  int v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    objc_msgSend(v7, "subpredicates");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v51 != v11)
            objc_enumerationMutation(v8);
          -[HMDPredicateUtilities fillAnalyticsData:forPredicate:](self, "fillAnalyticsData:forPredicate:", v6, *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i));
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v54, 16);
      }
      while (v10);
    }
    goto LABEL_53;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    objc_msgSend(v8, "rightExpression");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leftExpression");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "expressionType") == 4)
    {
      objc_msgSend(v13, "function");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("add:to:"));

      if (v16)
      {
        objc_msgSend(v13, "arguments");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v18, "expressionType") != 4)
          goto LABEL_51;
        objc_msgSend(v18, "function");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("now"));

        if (!v20)
          goto LABEL_51;
        objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v21, "expressionType"))
        {
          objc_msgSend(v21, "constantValue");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0 && objc_msgSend(v14, "expressionType") == 3)
          {
            objc_msgSend(v14, "keyPath");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v24, "isEqualToString:", *MEMORY[0x24BDD6CF8]))
            {

              if (!v6)
                goto LABEL_50;
            }
            else
            {
              objc_msgSend(v14, "keyPath");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v49 = objc_msgSend(v47, "isEqualToString:", *MEMORY[0x24BDD6D00]);

              if (!v6 || !v49)
                goto LABEL_50;
            }
            v6[11] = 1;
            v6[10] = 1;
          }
        }
LABEL_50:

LABEL_51:
        goto LABEL_52;
      }
    }
    if (objc_msgSend(v14, "expressionType") == 4
      && (objc_msgSend(v14, "function"),
          v25 = (void *)objc_claimAutoreleasedReturnValue(),
          v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("now")),
          v25,
          v26))
    {
      if (v6)
      {
        v27 = 8;
LABEL_46:
        v6[v27] = 1;
      }
    }
    else if (objc_msgSend(v13, "expressionType") == 4
           && (objc_msgSend(v13, "function"),
               v28 = (void *)objc_claimAutoreleasedReturnValue(),
               v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("now")),
               v28,
               v29))
    {
      if (objc_msgSend(v14, "expressionType") == 3)
      {
        objc_msgSend(v14, "keyPath");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "isEqualToString:", *MEMORY[0x24BDD6CF8]))
        {

          if (!v6)
            goto LABEL_52;
        }
        else
        {
          objc_msgSend(v14, "keyPath");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "isEqualToString:", *MEMORY[0x24BDD6D00]);

          if (!v6 || !v46)
            goto LABEL_52;
        }
        v27 = 10;
        goto LABEL_46;
      }
    }
    else
    {
      if (objc_msgSend(v14, "expressionType") != 3
        || (objc_msgSend(v14, "keyPath"),
            v31 = (void *)objc_claimAutoreleasedReturnValue(),
            v32 = objc_msgSend(v31, "isEqualToString:", *MEMORY[0x24BDD56D8]),
            v31,
            !v32))
      {
        if (objc_msgSend(v14, "expressionType") == 3)
        {
          objc_msgSend(v14, "keyPath");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "isEqualToString:", *MEMORY[0x24BDD6A00]);

          if (v34)
          {
            objc_msgSend(v8, "rightExpression");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (!objc_msgSend(v35, "expressionType"))
            {
              objc_msgSend(v35, "constantValue");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              v37 = objc_opt_isKindOfClass();

              if ((v37 & 1) != 0)
              {
                -[HMDPredicateUtilities home](self, "home");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "constantValue");
                v39 = objc_claimAutoreleasedReturnValue();
                +[HMDPresenceEventModel eventModelWithDictionary:home:eventTriggerUUID:message:](HMDPresenceEventModel, "eventModelWithDictionary:home:eventTriggerUUID:message:", v39, v38, 0, 0);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = -[HMDPresenceEvent initWithModel:home:]([HMDPresenceEvent alloc], "initWithModel:home:", v40, v38);
                v48 = (void *)v39;
                if (v6)
                  v42 = (void *)*((_QWORD *)v6 + 2);
                else
                  v42 = 0;
                v43 = v42;
                -[HMDPresenceEvent analyticsPresenceEventData](v41, "analyticsPresenceEventData");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "addObject:", v44);

              }
            }
            v13 = v35;
          }
        }
        goto LABEL_52;
      }
      if (v6)
      {
        v27 = 9;
        goto LABEL_46;
      }
    }
LABEL_52:

LABEL_53:
  }

}

- (unint64_t)cameraSignificantEvent
{
  return self->_cameraSignificantEvent;
}

- (void)setCameraSignificantEvent:(unint64_t)a3
{
  self->_cameraSignificantEvent = a3;
}

- (unint64_t)personFamiliarityOptions
{
  return self->_personFamiliarityOptions;
}

- (void)setPersonFamiliarityOptions:(unint64_t)a3
{
  self->_personFamiliarityOptions = a3;
}

- (unint64_t)audioAnalysisEventNotificationOptions
{
  return self->_audioAnalysisEventNotificationOptions;
}

- (void)setAudioAnalysisEventNotificationOptions:(unint64_t)a3
{
  self->_audioAnalysisEventNotificationOptions = a3;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logIdentifier, 0);
  objc_destroyWeak((id *)&self->_home);
}

+ (NSSet)predicateCodingClasses
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  return (NSSet *)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

+ (id)decodePredicateFromData:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  if (a3)
  {
    v6 = (void *)MEMORY[0x24BDD1620];
    v7 = a3;
    objc_msgSend(a1, "predicateCodingClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v8, v7, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
    }
    else if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 22);
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (id)encodePredicate:(id)a3 error:(id *)a4
{
  if (!a3)
    return 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t1_182269 != -1)
    dispatch_once(&logCategory__hmf_once_t1_182269, &__block_literal_global_182270);
  return (id)logCategory__hmf_once_v2_182271;
}

+ (id)filteredPredicate:(id)a3 withUserUUIDs:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  char isKindOfClass;
  void *v24;
  void *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v6;
      objc_msgSend(v8, "leftExpression");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "expressionType") == 3)
      {
        objc_msgSend(v9, "keyPath");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x24BDD6A00]);

        if (v20)
        {
          objc_msgSend(v8, "rightExpression");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v21, "expressionType"))
          {
            objc_msgSend(v21, "constantValue");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) != 0)
            {
              objc_msgSend(v21, "constantValue");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "hmf_arrayForKey:", CFSTR("kPresenceEventUsers"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v25, "count"))
              {
                v41[0] = MEMORY[0x24BDAC760];
                v41[1] = 3221225472;
                v41[2] = __57__HMDPredicateUtilities_filteredPredicate_withUserUUIDs___block_invoke;
                v41[3] = &unk_24E78E048;
                v42 = v7;
                objc_msgSend(v25, "hmf_objectsPassingTest:", v41);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "count");
                if (v27 < objc_msgSend(v25, "count"))
                {
                  if (objc_msgSend(v26, "count"))
                  {
                    v40 = (void *)objc_msgSend(v24, "mutableCopy");
                    objc_msgSend(v40, "setObject:forKeyedSubscript:", v26, CFSTR("kPresenceEventUsers"));
                    v37 = (void *)MEMORY[0x24BDD1548];
                    v28 = (void *)objc_msgSend(v40, "copy");
                    objc_msgSend(v37, "expressionForConstantValue:", v28);
                    v38 = objc_claimAutoreleasedReturnValue();

                    v29 = objc_alloc(MEMORY[0x24BDD14B8]);
                    v30 = objc_msgSend(v8, "comparisonPredicateModifier");
                    v31 = objc_msgSend(v8, "predicateOperatorType");
                    v32 = objc_msgSend(v8, "options");
                    v33 = v29;
                    v21 = (void *)v38;
                    v34 = (id)objc_msgSend(v33, "initWithLeftExpression:rightExpression:modifier:type:options:", v9, v38, v30, v31, v32);

                  }
                  else
                  {
                    v34 = 0;
                  }

                  goto LABEL_26;
                }

              }
            }
          }

        }
      }

    }
    v34 = v6;
    goto LABEL_33;
  }
  v8 = v6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v8, "subpredicates");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (!v11)
  {

LABEL_24:
    v18 = v8;
    goto LABEL_25;
  }
  v12 = v11;
  v36 = v8;
  v39 = v6;
  v13 = 0;
  v14 = *(_QWORD *)v44;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v44 != v14)
        objc_enumerationMutation(v10);
      v16 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
      objc_msgSend(a1, "filteredPredicate:withUserUUIDs:", v16, v7);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        objc_msgSend(v9, "addObject:", v17);
      v13 |= v17 != v16;

    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  }
  while (v12);

  v8 = v36;
  v6 = v39;
  if ((v13 & 1) == 0)
    goto LABEL_24;
  if (!objc_msgSend(v9, "count"))
  {
    v34 = 0;
    goto LABEL_26;
  }
  v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", objc_msgSend(v36, "compoundPredicateType"), v9);
LABEL_25:
  v34 = v18;
LABEL_26:

LABEL_33:
  return v34;
}

+ (id)unarchiveFromData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v9, v6, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18;
  if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v12 = v10;
  }
  else
  {
    v13 = (void *)MEMORY[0x227676638]();
    v14 = a1;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v16;
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive predicate: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
    v12 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v11);
  }

  return v12;
}

uint64_t __57__HMDPredicateUtilities_filteredPredicate_withUserUUIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  objc_class *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = (objc_class *)MEMORY[0x24BDD1880];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", v4);

  v6 = objc_msgSend(v2, "containsObject:", v5);
  return v6;
}

void __36__HMDPredicateUtilities_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v2_182271;
  logCategory__hmf_once_v2_182271 = v0;

}

@end
