@implementation _CDInteractionPolicies

+ (id)interactionPolicies
{
  return objc_alloc_init((Class)a1);
}

- (_CDInteractionPolicies)init
{
  _CDInteractionPolicies *v2;
  _CDInteractionPolicies *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CDInteractionPolicies;
  v2 = -[_CDInteractionPolicies init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[_CDInteractionPolicies setupDefaultHardcodedPolicies](v2, "setupDefaultHardcodedPolicies");
  return v3;
}

- (id)whitelistedFirstPartyBundleIds
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("com.apple.MobileSMS");
  v3[1] = CFSTR("com.apple.iChat");
  v3[2] = CFSTR("com.apple.mobilemail");
  v3[3] = CFSTR("com.apple.mail");
  v3[4] = CFSTR("com.apple.UIKit.activity.AirDrop");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)policyForMechanism:(int64_t)a3
{
  NSDictionary *specialPoliciesForMechanisms;
  void *v5;
  _CDInteractionPolicy *v6;

  specialPoliciesForMechanisms = self->_specialPoliciesForMechanisms;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](specialPoliciesForMechanisms, "objectForKeyedSubscript:", v5);
  v6 = (_CDInteractionPolicy *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    v6 = self->_defaultPolicy;
  return v6;
}

- (unint64_t)maxNumberOfInteractionsStored
{
  return self->_maxNumberOfInteractions;
}

- (unint64_t)maxNumberOfInteractionsDeleted
{
  return self->_maxNumberOfInteractionsDeletedInBatch;
}

- (NSDate)dateOfOldestAllowedInteraction
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -14515200.0);
}

- (id)dateOfOldestAllowedInteractionForWhitelistedFirstPartyBundleIds
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -14515200.0);
}

- (id)dateOfOldestAllowedInteractionForMechanism:(int64_t)a3
{
  void *v3;
  unint64_t v4;
  double v5;

  -[_CDInteractionPolicies policyForMechanism:](self, "policyForMechanism:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "lifespanInSeconds");

  v5 = (double)v4;
  if ((double)v4 > 14515200.0)
    v5 = 14515200.0;
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -v5);
}

+ (id)modifyDate:(id)a3 usingPolicy:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  id v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (objc_msgSend(v6, "timeResolutionInSeconds"))
    {
      objc_msgSend(v5, "timeIntervalSinceReferenceDate");
      v9 = v8;
      v10 = (double)(unint64_t)objc_msgSend(v7, "timeResolutionInSeconds");
      v11 = objc_msgSend(v7, "timeResolutionInSeconds");
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", floor(v9 / (double)v11) * v10);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = v5;
    }
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)limitArray:(id)a3 toMaxCount:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count") > a4)
  {
    objc_msgSend(v6, "subarrayWithRange:", 0, a4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;

  return v8;
}

- (id)filterAndModifyInteractionsWithPolicies:(id)a3 enforceDataLimits:(BOOL)a4 enforcePrivacy:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t i;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  NSDictionary *specialPoliciesForBundleIds;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  NSDictionary *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  NSObject *v43;
  int v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  unint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v80;
  id v81;
  void *v82;
  uint64_t v83;
  _BOOL4 v84;
  _CDInteractionPolicies *v85;
  void *v86;
  id obj;
  _BOOL4 v88;
  uint64_t v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint8_t buf[4];
  void *v96;
  __int16 v97;
  void *v98;
  __int16 v99;
  id v100;
  _BYTE v101[128];
  uint64_t v102;

  v5 = a5;
  v88 = a4;
  v102 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  +[_CDSiriLearningSettings sharedInstance](_CDSiriLearningSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allLearningDisabledBundleIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SELF.bundleId IN %@"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[_CDDeviceInfo isRunningOnInternalBuild](_CDDeviceInfo, "isRunningOnInternalBuild"))
    {
      objc_msgSend(v7, "filteredArrayUsingPredicate:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "count"))
      {
        v12 = (void *)MEMORY[0x1E0C99E60];
        objc_msgSend(v11, "valueForKey:", CFSTR("bundleId"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setWithArray:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v96 = v14;
          _os_log_impl(&dword_18DDBE000, v15, OS_LOG_TYPE_INFO, "Filtered interactions for bundles with Siri Learning disabled: %@", buf, 0xCu);
        }

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filteredArrayUsingPredicate:", v16);
    v17 = objc_claimAutoreleasedReturnValue();

    v7 = (id)v17;
  }
  v18 = objc_msgSend(v7, "count");
  if (!v88 && !v5 || !v18)
  {
    v78 = v7;
    goto LABEL_57;
  }
  v80 = v9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInteractionPolicies policyForMechanism:](self, "policyForMechanism:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CDInteractionPolicies dateOfOldestAllowedInteractionForMechanism:](self, "dateOfOldestAllowedInteractionForMechanism:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v94 = 0u;
  v81 = v7;
  obj = v7;
  v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
  if (!v90)
    goto LABEL_55;
  v89 = *(_QWORD *)v92;
  v83 = 1;
  v84 = v5;
  v85 = self;
  do
  {
    for (i = 0; i != v90; ++i)
    {
      if (*(_QWORD *)v92 != v89)
        objc_enumerationMutation(obj);
      v22 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = v22;
        v24 = objc_msgSend(v23, "mechanism");
        -[_CDInteractionPolicies whitelistedFirstPartyBundleIds](self, "whitelistedFirstPartyBundleIds");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "bundleId");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v25, "containsObject:", v26);

        if (v27)
        {
          specialPoliciesForBundleIds = self->_specialPoliciesForBundleIds;
          objc_msgSend(v23, "bundleId");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](specialPoliciesForBundleIds, "objectForKeyedSubscript:", v29);
          v30 = objc_claimAutoreleasedReturnValue();

          -[_CDInteractionPolicies dateOfOldestAllowedInteractionForWhitelistedFirstPartyBundleIds](self, "dateOfOldestAllowedInteractionForWhitelistedFirstPartyBundleIds");
          v31 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v30;
          goto LABEL_27;
        }
        objc_msgSend(v23, "targetBundleId");
        v32 = objc_claimAutoreleasedReturnValue();
        if (!v32)
          goto LABEL_22;
        v33 = (void *)v32;
        -[_CDInteractionPolicies whitelistedFirstPartyBundleIds](self, "whitelistedFirstPartyBundleIds");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "targetBundleId");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v34, "containsObject:", v35);

        if (v36)
        {
          v37 = self->_specialPoliciesForBundleIds;
          objc_msgSend(v23, "targetBundleId");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](v37, "objectForKeyedSubscript:", v38);
          v39 = objc_claimAutoreleasedReturnValue();

          -[_CDInteractionPolicies dateOfOldestAllowedInteractionForWhitelistedFirstPartyBundleIds](self, "dateOfOldestAllowedInteractionForWhitelistedFirstPartyBundleIds");
          v31 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v39;
LABEL_26:
          v5 = v84;
LABEL_27:

          v20 = (void *)v31;
          if (v5)
            goto LABEL_28;
LABEL_32:
          v44 = 0;
        }
        else
        {
LABEL_22:
          if (v24 != v83)
          {
            -[_CDInteractionPolicies policyForMechanism:](self, "policyForMechanism:", v24);
            v40 = objc_claimAutoreleasedReturnValue();

            -[_CDInteractionPolicies dateOfOldestAllowedInteractionForMechanism:](self, "dateOfOldestAllowedInteractionForMechanism:", v24);
            v31 = objc_claimAutoreleasedReturnValue();
            v19 = (void *)v40;
            v83 = v24;
            goto LABEL_26;
          }
          v5 = v84;
          if (!v84)
            goto LABEL_32;
LABEL_28:
          objc_msgSend(v23, "startDate");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "earlierDate:", v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          if (v42 == v20)
            goto LABEL_32;
          +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
          v43 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v23, "startDate");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v96 = v77;
            v97 = 2112;
            v98 = v20;
            v99 = 2112;
            v100 = v23;
            _os_log_debug_impl(&dword_18DDBE000, v43, OS_LOG_TYPE_DEBUG, "Incoming interaction fails retention policy. %@ (oldest allowed is %@). %@", buf, 0x20u);

          }
          v44 = 1;
        }
        if (v88)
        {
          objc_msgSend(v19, "rateLimiter");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = objc_msgSend(v45, "debited");

        }
        else
        {
          v46 = 1;
        }
        if (((v44 | v46 ^ 1) & 1) == 0)
        {
          if (v5)
          {
            v47 = (void *)objc_opt_class();
            objc_msgSend(v23, "startDate");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "modifyDate:usingPolicy:", v48, v19);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setStartDate:", v49);

            v50 = (void *)objc_opt_class();
            objc_msgSend(v23, "endDate");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "modifyDate:usingPolicy:", v51, v19);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setEndDate:", v52);

          }
          if (v88)
          {
            v53 = (void *)objc_opt_class();
            objc_msgSend(v23, "recipients");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "limitArray:toMaxCount:", v54, objc_msgSend(v19, "maxNumberOfRecipients"));
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setRecipients:", v55);

            v56 = (void *)objc_opt_class();
            objc_msgSend(v23, "keywords");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "limitArray:toMaxCount:", v57, objc_msgSend(v19, "maxNumberOfKeywords"));
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setKeywords:", v58);

            v59 = (void *)objc_opt_class();
            objc_msgSend(v23, "attachments");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "limitArray:toMaxCount:", v60, objc_msgSend(v19, "maxNumberOfAttachments"));
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setAttachments:", v61);

          }
          if (objc_msgSend(v23, "mechanism") == 13)
          {
            objc_msgSend(v23, "targetBundleId");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = objc_msgSend(v62, "isEqualToString:", CFSTR("com.apple.UIKit.activity.Mail"));

            if (v63)
            {
              objc_msgSend(v23, "recipients");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v64, "count"));
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v64, "count"))
              {
                v66 = 0;
                v86 = v19;
                do
                {
                  objc_msgSend(v64, "objectAtIndexedSubscript:", v66);
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v67, "personId");
                  v68 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v68)
                  {
                    objc_msgSend(v67, "setPersonId:", 0);
                  }
                  else
                  {
                    objc_msgSend(v67, "identifier");
                    v69 = (void *)objc_claimAutoreleasedReturnValue();
                    +[_CDContactResolver resolveContactIfPossibleFromContactIdentifierString:](_CDContactResolver, "resolveContactIfPossibleFromContactIdentifierString:", v69);
                    v70 = v65;
                    v71 = v64;
                    v72 = i;
                    v73 = v23;
                    v74 = v20;
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v75, "identifier");
                    v76 = (void *)objc_claimAutoreleasedReturnValue();

                    v20 = v74;
                    v23 = v73;
                    i = v72;
                    v64 = v71;
                    v65 = v70;

                    self = v85;
                    v19 = v86;
                    objc_msgSend(v67, "setPersonId:", v76);
                    if (v76)
                    {
                      objc_msgSend(v67, "setPersonIdType:", 3);

                    }
                  }
                  objc_msgSend(v65, "addObject:", v67);

                  ++v66;
                }
                while (objc_msgSend(v64, "count") > v66);
              }
              objc_msgSend(v23, "setRecipients:", v65);

              v5 = v84;
            }
          }
          objc_msgSend(v82, "addObject:", v23);
        }

        continue;
      }
    }
    v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v101, 16);
  }
  while (v90);
LABEL_55:

  v78 = (id)objc_msgSend(v82, "copy");
  v9 = v80;
  v7 = v81;
LABEL_57:

  return v78;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NSDictionary *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ { \n"), v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maxNumberOfInteractions);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("         maxNumber: %@\n"), v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maxLifespanInSeconds);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("       maxLifespan: %@\n"), v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maxNumberOfInteractionsDeletedInBatch);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" maxDeletedInBatch: %@\n"), v8);

  objc_msgSend(v3, "appendFormat:", CFSTR("     defaultPolicy: %@\n"), self->_defaultPolicy);
  objc_msgSend(v3, "appendFormat:", CFSTR("   specialPolicies: {\n"));
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v9 = self->_specialPoliciesForMechanisms;
  v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        mechanismToString(objc_msgSend(v14, "integerValue"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](self->_specialPoliciesForMechanisms, "objectForKeyedSubscript:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR(" %@  : %@\n"), v15, v16);

      }
      v11 = -[NSDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v11);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = self->_specialPoliciesForBundleIds;
  v18 = -[NSDictionary countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
        -[NSDictionary objectForKeyedSubscript:](self->_specialPoliciesForBundleIds, "objectForKeyedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR(" %@  : %@\n"), v22, v23, (_QWORD)v25);

      }
      v19 = -[NSDictionary countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v19);
  }

  objc_msgSend(v3, "appendFormat:", CFSTR("}\n"));
  objc_msgSend(v3, "appendString:", CFSTR("}\n"));
  return v3;
}

- (void)setupDefaultHardcodedPolicies
{
  _CDInteractionPolicy *v3;
  _CDInteractionPolicy *defaultPolicy;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSDictionary *v10;
  NSDictionary *specialPoliciesForMechanisms;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSDictionary *v17;
  NSDictionary *specialPoliciesForBundleIds;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&self->_maxNumberOfInteractions = xmmword_18DF4CA20;
  self->_maxLifespanInSeconds = 14515200.0;
  +[_CDInteractionPolicy defaultPolicy](_CDInteractionPolicy, "defaultPolicy");
  v3 = (_CDInteractionPolicy *)objc_claimAutoreleasedReturnValue();
  defaultPolicy = self->_defaultPolicy;
  self->_defaultPolicy = v3;

  v21[0] = &unk_1E272AE10;
  +[_CDInteractionPolicy defaultPolicyForEmail](_CDInteractionPolicy, "defaultPolicyForEmail");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  v21[1] = &unk_1E272AE28;
  +[_CDInteractionPolicy defaultPolicyForMessages](_CDInteractionPolicy, "defaultPolicyForMessages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v6;
  v21[2] = &unk_1E272AE40;
  +[_CDInteractionPolicy defaultPolicyForMessages](_CDInteractionPolicy, "defaultPolicyForMessages");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v7;
  v21[3] = &unk_1E272AE58;
  +[_CDInteractionPolicy defaultPolicyForMessages](_CDInteractionPolicy, "defaultPolicyForMessages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[3] = v8;
  v21[4] = &unk_1E272AE70;
  +[_CDInteractionPolicy defaultPolicyForMeetings](_CDInteractionPolicy, "defaultPolicyForMeetings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
  v10 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  specialPoliciesForMechanisms = self->_specialPoliciesForMechanisms;
  self->_specialPoliciesForMechanisms = v10;

  v19[0] = CFSTR("com.apple.MobileSMS");
  +[_CDInteractionPolicy specialPolicyForFirstPartyApps](_CDInteractionPolicy, "specialPolicyForFirstPartyApps");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v12;
  v19[1] = CFSTR("com.apple.iChat");
  +[_CDInteractionPolicy specialPolicyForFirstPartyApps](_CDInteractionPolicy, "specialPolicyForFirstPartyApps");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v13;
  v19[2] = CFSTR("com.apple.mobilemail");
  +[_CDInteractionPolicy specialPolicyForFirstPartyApps](_CDInteractionPolicy, "specialPolicyForFirstPartyApps");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v14;
  v19[3] = CFSTR("com.apple.mail");
  +[_CDInteractionPolicy specialPolicyForFirstPartyApps](_CDInteractionPolicy, "specialPolicyForFirstPartyApps");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v15;
  v19[4] = CFSTR("com.apple.UIKit.activity.AirDrop");
  +[_CDInteractionPolicy specialPolicyForFirstPartyApps](_CDInteractionPolicy, "specialPolicyForFirstPartyApps");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[4] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
  v17 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  specialPoliciesForBundleIds = self->_specialPoliciesForBundleIds;
  self->_specialPoliciesForBundleIds = v17;

}

- (void)readConfigurationPlist
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  +[_CDPaths policiesConfigPath](_CDPaths, "policiesConfigPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_18DDBE000, a1, OS_LOG_TYPE_ERROR, "Failed to read %@", (uint8_t *)&v3, 0xCu);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultPolicy, 0);
  objc_storeStrong((id *)&self->_specialPoliciesForMechanisms, 0);
  objc_storeStrong((id *)&self->_specialPoliciesForBundleIds, 0);
}

@end
