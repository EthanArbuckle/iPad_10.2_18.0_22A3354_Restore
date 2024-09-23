@implementation _CDInteractionAdvisorUtils

+ (id)stringKeyForAdvice:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v4, "contact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "mechanism");

  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@,%@,%@,%ld"), v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)hashForAdviceWithContact:(id)a3 account:(id)a4 bundleId:(id)a5 mechanism:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v9 = a5;
  v10 = a4;
  objc_msgSend(a3, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  v13 = objc_msgSend(v10, "hash");

  v14 = objc_msgSend(v9, "hash");
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12 ^ a6 ^ v13 ^ v14);
}

+ (id)unionSet:(id)a3 withSet:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = a4;
  if (!v5 || !objc_msgSend(v5, "count"))
  {
    v8 = v6;
LABEL_8:
    v7 = v8;
    goto LABEL_9;
  }
  if (!v6 || !objc_msgSend(v6, "count"))
  {
    v8 = v5;
    goto LABEL_8;
  }
  v7 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v7, "unionSet:", v6);
LABEL_9:

  return v7;
}

+ (BOOL)contact:(id)a3 mayRepresentTheSamePersonAsOneOf:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = a4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        if ((objc_msgSend(v5, "mayRepresentSamePersonAs:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11) & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)contactsForIdentifiers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _CDContact *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = -[_CDContact initWithIdentifier:type:customIdentifier:displayName:displayType:personId:personIdType:]([_CDContact alloc], "initWithIdentifier:type:customIdentifier:displayName:displayType:personId:personIdType:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), 0, 0, 0, 0, 0, 0);
          objc_msgSend(v5, "addObject:", v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)contactsInInteraction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v3, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v3, "sender");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

  }
  return v6;
}

+ (id)adviceBasedOnInteractions:(id)a3 forContacts:(id)a4 andRanker:(id)a5 ignoringContacts:(id)a6 withLimit:(unint64_t)a7 aggregateByIdentifier:(BOOL)a8 requireOneOutgoingInteraction:(BOOL)a9
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char *v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _CDAdvisedInteraction *v36;
  _CDAdvisedInteraction *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t m;
  void *v64;
  void *v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  char *v75;
  void *v78;
  id obj;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _BOOL4 v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  void *v106;
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _BYTE v110[128];
  uint64_t v111;

  v84 = a8;
  v111 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v89 = a5;
  v14 = a6;
  v78 = v13;
  if (v13)
  {
    v15 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v13, "valueForKey:", CFSTR("identifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v19 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEBUG))
    +[_CDInteractionAdvisorUtils adviceBasedOnInteractions:forContacts:andRanker:ignoringContacts:withLimit:aggregateByIdentifier:requireOneOutgoingInteraction:].cold.2(v12, v19);

  v104 = 0u;
  v105 = 0u;
  v102 = 0u;
  v103 = 0u;
  obj = v12;
  v87 = v18;
  v85 = v14;
  v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
  if (v81)
  {
    v80 = *(_QWORD *)v103;
    do
    {
      for (i = 0; i != v81; ++i)
      {
        if (*(_QWORD *)v103 != v80)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * i);
        objc_msgSend(v89, "rankInteraction:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v88 = v22;
          v82 = i;
          objc_msgSend(a1, "contactsInInteraction:", v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v98 = 0u;
          v99 = 0u;
          v100 = 0u;
          v101 = 0u;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v98, v109, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v99;
            v86 = v23;
            do
            {
              for (j = 0; j != v25; ++j)
              {
                if (*(_QWORD *)v99 != v26)
                  objc_enumerationMutation(v23);
                v28 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * j);
                if (v17)
                {
                  objc_msgSend(*(id *)(*((_QWORD *)&v98 + 1) + 8 * j), "identifier");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  v30 = objc_msgSend(v17, "containsObject:", v29);

                  if (!v30)
                    continue;
                }
                if (!v14
                  || !objc_msgSend(v14, "count")
                  || !+[_CDInteractionAdvisorUtils contact:mayRepresentTheSamePersonAsOneOf:](_CDInteractionAdvisorUtils, "contact:mayRepresentTheSamePersonAsOneOf:", v28, v14))
                {
                  if (v28)
                  {
                    if (objc_msgSend(v28, "personIdType")
                      || (objc_msgSend(v28, "identifier"),
                          v31 = (void *)objc_claimAutoreleasedReturnValue(),
                          v31,
                          v31))
                    {
                      if (objc_msgSend(v89, "contactIsAllowed:", v28))
                      {
                        if (v84)
                        {
                          v32 = (void *)MEMORY[0x1E0CB37E8];
                          objc_msgSend(v28, "identifier");
                          v33 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v32, "numberWithUnsignedInteger:", objc_msgSend(v33, "hash"));
                          v34 = (void *)objc_claimAutoreleasedReturnValue();
                        }
                        else
                        {
                          objc_msgSend(v21, "account");
                          v33 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v21, "bundleId");
                          v35 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(a1, "hashForAdviceWithContact:account:bundleId:mechanism:", v28, v33, v35, objc_msgSend(v21, "mechanism"));
                          v34 = (void *)objc_claimAutoreleasedReturnValue();

                        }
                        objc_msgSend(v87, "objectForKeyedSubscript:", v34);
                        v36 = (_CDAdvisedInteraction *)objc_claimAutoreleasedReturnValue();
                        if (v36)
                        {
                          v37 = v36;
                          -[_CDAdvisedInteraction contact](v36, "contact");
                          v38 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v38, "mergeWithContact:", v28);

                        }
                        else
                        {
                          v37 = objc_alloc_init(_CDAdvisedInteraction);
                          -[_CDAdvisedInteraction setMechanism:](v37, "setMechanism:", objc_msgSend(v21, "mechanism"));
                          objc_msgSend(v21, "bundleId");
                          v39 = (void *)objc_claimAutoreleasedReturnValue();
                          -[_CDAdvisedInteraction setBundleId:](v37, "setBundleId:", v39);

                          objc_msgSend(v21, "account");
                          v40 = (void *)objc_claimAutoreleasedReturnValue();
                          -[_CDAdvisedInteraction setAccount:](v37, "setAccount:", v40);

                          objc_msgSend(MEMORY[0x1E0C99E60], "set");
                          v41 = (void *)objc_claimAutoreleasedReturnValue();
                          -[_CDAdvisedInteraction setReasons:](v37, "setReasons:", v41);

                          -[_CDAdvisedInteraction setScore:](v37, "setScore:", 0.0);
                          -[_CDAdvisedInteraction setContact:](v37, "setContact:", v28);
                          objc_msgSend(v87, "setObject:forKeyedSubscript:", v37, v34);
                        }
                        v14 = v85;
                        if (objc_msgSend(v21, "direction") == 1)
                        {
                          -[_CDAdvisedInteraction setSimilarOutgoingInteractionsCount:](v37, "setSimilarOutgoingInteractionsCount:", -[_CDAdvisedInteraction similarOutgoingInteractionsCount](v37, "similarOutgoingInteractionsCount")+ 1);
                        }
                        else if (objc_msgSend(v21, "direction"))
                        {
                          if (objc_msgSend(v21, "direction") == 2)
                            -[_CDAdvisedInteraction setSimilarBidirectionalInteractionsCount:](v37, "setSimilarBidirectionalInteractionsCount:", -[_CDAdvisedInteraction similarBidirectionalInteractionsCount](v37, "similarBidirectionalInteractionsCount")+ 1);
                          else
                            objc_msgSend(v21, "direction");
                        }
                        else
                        {
                          -[_CDAdvisedInteraction setSimilarIncomingInteractionsCount:](v37, "setSimilarIncomingInteractionsCount:", -[_CDAdvisedInteraction similarIncomingInteractionsCount](v37, "similarIncomingInteractionsCount")+ 1);
                        }
                        if (objc_msgSend(v89, "rankAggregationMethod") == 1)
                        {
                          -[_CDAdvisedInteraction score](v37, "score");
                          v43 = v42;
                          objc_msgSend(v88, "score");
                          if (v43 >= v44)
                            v44 = v43;
                        }
                        else
                        {
                          objc_msgSend(v88, "score");
                          v46 = v45;
                          -[_CDAdvisedInteraction score](v37, "score");
                          v44 = v46 + v47;
                        }
                        -[_CDAdvisedInteraction setScore:](v37, "setScore:", v44);
                        objc_msgSend(v88, "reasons");
                        v48 = (void *)objc_claimAutoreleasedReturnValue();
                        -[_CDAdvisedInteraction addReasons:](v37, "addReasons:", v48);

                        v23 = v86;
                      }
                    }
                  }
                }
              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v98, v109, 16);
            }
            while (v25);
          }

          v18 = v87;
          v22 = v88;
          i = v82;
        }

      }
      v81 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v110, 16);
    }
    while (v81);
  }

  objc_msgSend(v18, "allValues");
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v94, v108, 16);
  if (v50)
  {
    v51 = v50;
    v52 = *(_QWORD *)v95;
    do
    {
      for (k = 0; k != v51; ++k)
      {
        if (*(_QWORD *)v95 != v52)
          objc_enumerationMutation(v49);
        v54 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * k);
        objc_msgSend(v54, "reasons");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = objc_msgSend(v55, "count");

        if (!v56)
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E272ABB8);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setReasons:", v57);

        }
      }
      v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v94, v108, 16);
    }
    while (v51);
  }

  if (objc_msgSend(v89, "canRankContacts"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v49, "count"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v59 = v49;
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v90, v107, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v91;
      do
      {
        for (m = 0; m != v61; ++m)
        {
          if (*(_QWORD *)v91 != v62)
            objc_enumerationMutation(v59);
          v64 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * m);
          objc_msgSend(v64, "contact");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "rankContact:", v65);
          v67 = v66;

          if (v67 > 0.0)
          {
            objc_msgSend(v64, "score");
            objc_msgSend(v64, "setScore:", v67 * v68);
            objc_msgSend(v58, "addObject:", v64);
          }
        }
        v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v90, v107, 16);
      }
      while (v61);
    }

  }
  else
  {
    v58 = v49;
  }
  if (a9)
  {
    objc_msgSend(v58, "indexesOfObjectsPassingTest:", &__block_literal_global_243);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "objectsAtIndexes:", v69);
    v70 = objc_claimAutoreleasedReturnValue();

    v58 = (void *)v70;
  }
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 0);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = v71;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1);
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v58, "sortedArrayUsingDescriptors:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v73, "count") > a7)
  {
    objc_msgSend(v73, "subarrayWithRange:", 0);
    v74 = objc_claimAutoreleasedReturnValue();

    v73 = (void *)v74;
  }
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v75 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v75, OS_LOG_TYPE_DEBUG))
    +[_CDInteractionAdvisorUtils adviceBasedOnInteractions:forContacts:andRanker:ignoringContacts:withLimit:aggregateByIdentifier:requireOneOutgoingInteraction:].cold.1(v73, v75);

  return v73;
}

+ (id)rankContacts:(id)a3 basedOnInteractions:(id)a4 andRanker:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  id obj;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  _QWORD v53[4];
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v48 = a5;
  v43 = v8;
  objc_msgSend(v8, "valueForKey:", CFSTR("identifier"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v11 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG))
    +[_CDInteractionAdvisorUtils rankContacts:basedOnInteractions:andRanker:].cold.1(v9, v11);

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v60;
    v44 = *(_QWORD *)v60;
    v45 = a1;
    do
    {
      v15 = 0;
      v46 = v13;
      do
      {
        if (*(_QWORD *)v60 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * v15);
        objc_msgSend(a1, "contactsInInteraction:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "valueForKey:", CFSTR("identifier"));
        v18 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v18;
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "intersectSet:", v51);
        if (objc_msgSend(v20, "count"))
        {
          v52 = v15;
          objc_msgSend(v48, "rankInteraction:", v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v49 = v20;
            v50 = v19;
            v57 = 0u;
            v58 = 0u;
            v55 = 0u;
            v56 = 0u;
            v22 = v20;
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
            if (v23)
            {
              v24 = v23;
              v25 = *(_QWORD *)v56;
              do
              {
                for (i = 0; i != v24; ++i)
                {
                  if (*(_QWORD *)v56 != v25)
                    objc_enumerationMutation(v22);
                  v27 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
                  objc_msgSend(v10, "objectForKeyedSubscript:", v27);
                  v28 = objc_claimAutoreleasedReturnValue();
                  if (v28)
                    v29 = (void *)v28;
                  else
                    v29 = &unk_1E272ABD0;
                  v30 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v29, "doubleValue");
                  v32 = v31;
                  objc_msgSend(v21, "score");
                  objc_msgSend(v30, "numberWithDouble:", v32 + v33);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v10, "setObject:forKeyedSubscript:", v34, v27);

                }
                v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
              }
              while (v24);
            }

            v14 = v44;
            a1 = v45;
            v13 = v46;
            v20 = v49;
            v19 = v50;
          }

          v15 = v52;
        }

        ++v15;
      }
      while (v15 != v13);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v42, "count"))
  {
    v35 = 0;
    do
    {
      objc_msgSend(v42, "objectAtIndexedSubscript:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v37)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v35 * -100.0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v38, v36);

      }
      ++v35;
    }
    while (v35 < objc_msgSend(v42, "count"));
  }
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __73___CDInteractionAdvisorUtils_rankContacts_basedOnInteractions_andRanker___block_invoke;
  v53[3] = &unk_1E26E4190;
  v54 = v10;
  v39 = v10;
  objc_msgSend(v43, "sortedArrayUsingComparator:", v53);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  return v40;
}

+ (id)createTimePredicateForReferenceDate:(id)a3 recentLookBackDays:(int)a4 windowHours:(int)a5 lookBackWeeks:(int)a6 lookAheadWeeks:(int)a7
{
  id v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v29;
  void *v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  objc_msgSend(v11, "dateByAddingTimeInterval:", (double)a4 * -86400.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateByAddingTimeInterval:", (double)(604800 * a7));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("startDate > %@ AND startDate <= %@"), v12, v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11;
  if (a6 >= 1)
  {
    v15 = -604800 - 1800 * a5;
    v16 = 1800 * a5 - 604800;
    do
    {
      objc_msgSend(v14, "dateByAddingTimeInterval:", (double)v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dateByAddingTimeInterval:", (double)v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceReferenceDate");
      v20 = v19;
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      if (v20 <= v21)
      {
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("startDate > %@ AND startDate <= %@"), v17, v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v22);

      }
      v15 -= 604800;
      v16 -= 604800;
      --a6;
    }
    while (a6);
  }
  if (objc_msgSend(v13, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)MEMORY[0x1E0CB3528];
    v25 = v29;
    v31[0] = v29;
    v31[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "orPredicateWithSubpredicates:", v26);
    v27 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = v29;
    v27 = v29;
  }

  return v27;
}

+ (id)inferConsumerIdentifierFromSettings:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
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
  void *v16;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint8_t v24[16];
  uint8_t buf[16];

  v3 = a3;
  objc_msgSend(v3, "consumerIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "consumerIdentifier");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  objc_msgSend(v3, "callerBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.mobilesms")))
    goto LABEL_10;
  objc_msgSend(v3, "contactPrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
LABEL_9:

LABEL_10:
    goto LABEL_11;
  }
  objc_msgSend(v3, "constrainMechanisms");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "containsObject:", &unk_1E272ABE8))
  {
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v3, "constrainPersonIds");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {

    goto LABEL_8;
  }
  objc_msgSend(v3, "constrainIdentifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (!v19)
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DDBE000, v20, OS_LOG_TYPE_INFO, "Inferred consumer mqa", buf, 2u);
    }

    v5 = CFSTR("com.apple.mobilesms.quickaction");
    goto LABEL_22;
  }
LABEL_11:
  objc_msgSend(v3, "callerBundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lowercaseString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.duetexpertd")) & 1) == 0)
  {
LABEL_20:

LABEL_21:
    v5 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v3, "contactPrefix");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "length"))
  {
LABEL_19:

    goto LABEL_20;
  }
  objc_msgSend(v3, "constrainMechanisms");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "containsObject:", &unk_1E272AC00))
  {
LABEL_18:

    goto LABEL_19;
  }
  objc_msgSend(v3, "constrainMechanisms");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "containsObject:", &unk_1E272ABE8) & 1) != 0)
  {
LABEL_17:

    goto LABEL_18;
  }
  objc_msgSend(v3, "constrainPersonIds");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {

    goto LABEL_17;
  }
  objc_msgSend(v3, "constrainIdentifiers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22)
    goto LABEL_21;
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v24 = 0;
    _os_log_impl(&dword_18DDBE000, v23, OS_LOG_TYPE_INFO, "Inferred consumer pqa", v24, 2u);
  }

  v5 = CFSTR("com.apple.mobilephone.quickaction");
LABEL_22:

  return v5;
}

+ (void)updateConsumerModelSettings:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.CoreDuet"));
  objc_msgSend(v4, "valueForKey:", CFSTR("com.apple.coreduet.peoplePrediction.quickAction.Messages"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1E272AC18);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, &unk_1E272AC18);

  }
  objc_msgSend(v4, "valueForKey:", CFSTR("com.apple.coreduet.peoplePrediction.quickAction.Phone"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1E272AC30);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, &unk_1E272AC18);

  }
  objc_msgSend(v4, "valueForKey:", CFSTR("com.apple.coreduet.peoplePrediction.shareSheet"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1E272AC48);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, &unk_1E272AC18);

  }
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    +[_CDInteractionAdvisorUtils updateConsumerModelSettings:].cold.1();

}

+ (unint64_t)modelTypeForConsumerIdentifier:(id)a3 modelSettings:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v12;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilesms.quickaction")))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E272AC18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilephone.quickaction")))
    {
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.peoplesuggester.consumer.sharesheet")))
      {
        v10 = 0;
        goto LABEL_10;
      }
      objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E272AC48);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKeyedSubscript:", &unk_1E272AC18);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v9 == 0;
      if (!v9)
        goto LABEL_10;
      goto LABEL_9;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1E272AC30);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", &unk_1E272AC18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = 0;
  else
    v10 = 3;
  if (v9)
  {
LABEL_9:
    v10 = objc_msgSend(v9, "integerValue");

  }
LABEL_10:

  return v10;
}

+ (void)adjustForConsumerSettings:(id)a3 modelSettings:(id)a4 andRanker:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(a1, "inferConsumerIdentifierFromSettings:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConsumerIdentifier:", v11);

  objc_msgSend(v8, "consumerIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lowercaseString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.mobilesms.quickaction")))
  {
    objc_msgSend(v8, "setConstrainMaxRecipientCount:", 1);
    v14 = objc_msgSend(v8, "resultLimit");
    if (v14 <= 0x14)
      v15 = 20;
    else
      v15 = v14;
    objc_msgSend(v8, "setResultLimit:", v15);
    v16 = objc_msgSend(a1, "modelTypeForConsumerIdentifier:modelSettings:", v13, v9);
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      +[_CDInteractionAdvisorUtils adjustForConsumerSettings:modelSettings:andRanker:].cold.3();
  }
  else if (objc_msgSend(v13, "isEqualToString:", CFSTR("frequency")))
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    v16 = 2;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      +[_CDInteractionAdvisorUtils adjustForConsumerSettings:modelSettings:andRanker:].cold.4();
      v16 = 2;
    }
  }
  else if (objc_msgSend(v13, "isEqualToString:", CFSTR("frecency")))
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      +[_CDInteractionAdvisorUtils adjustForConsumerSettings:modelSettings:andRanker:].cold.5();
    v16 = 5;
  }
  else if (objc_msgSend(v13, "isEqualToString:", CFSTR("recency")))
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      +[_CDInteractionAdvisorUtils adjustForConsumerSettings:modelSettings:andRanker:].cold.6();
    v16 = 1;
  }
  else
  {
    v16 = objc_msgSend(a1, "modelTypeForConsumerIdentifier:modelSettings:", v13, v9);
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      +[_CDInteractionAdvisorUtils adjustForConsumerSettings:modelSettings:andRanker:].cold.7();
  }

  v18 = objc_msgSend(a1, "adjustRanker:forModel:", v10, v16);
  if (v18)
  {
    +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      +[_CDInteractionAdvisorUtils adjustForConsumerSettings:modelSettings:andRanker:].cold.2();

  }
  +[_CDLogging interactionChannel](_CDLogging, "interactionChannel");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    +[_CDInteractionAdvisorUtils adjustForConsumerSettings:modelSettings:andRanker:].cold.1(a1, v16, v20);

}

+ (BOOL)adjustRanker:(id)a3 forModel:(unint64_t)a4
{
  id v5;
  void *v6;
  BOOL v7;
  double v8;
  uint64_t v9;

  v5 = a3;
  v6 = v5;
  v7 = 0;
  switch(a4)
  {
    case 1uLL:
      objc_msgSend(v5, "setTimeWeight:", 1.0);
      v8 = 0.0;
      objc_msgSend(v6, "setTimeOfDayWeight:", 0.0);
      objc_msgSend(v6, "setTimeOfWeekWeight:", 0.0);
      v9 = 1;
      goto LABEL_7;
    case 2uLL:
      objc_msgSend(v5, "setTimeWeight:", 0.0);
      objc_msgSend(v6, "setTimeOfDayWeight:", 0.0);
      objc_msgSend(v6, "setTimeOfWeekWeight:", 0.0);
      v9 = 0;
      v8 = 1.0;
      goto LABEL_7;
    case 3uLL:
      objc_msgSend(v5, "setTimeWeight:", 0.0);
      objc_msgSend(v6, "setTimeOfDayWeight:", 0.0);
      objc_msgSend(v6, "setTimeOfWeekWeight:", 0.0);
      objc_msgSend(v6, "setOutgoingWeight:", 4.0);
      v8 = 1.0;
      objc_msgSend(v6, "setSameWeekPeriodWeight:", 1.0);
      objc_msgSend(v6, "setDiffWeekPeriodWeight:", 0.01);
      goto LABEL_6;
    case 5uLL:
      objc_msgSend(v5, "setTimeWeight:", 1.0);
      objc_msgSend(v6, "setTimeHalfLife:", 345600.0);
      v8 = 0.0;
      objc_msgSend(v6, "setTimeOfDayWeight:", 0.0);
      objc_msgSend(v6, "setTimeOfWeekWeight:", 0.0);
LABEL_6:
      v9 = 0;
LABEL_7:
      objc_msgSend(v6, "setC:", v8);
      objc_msgSend(v6, "setRankAggregationMethod:", v9);
      v7 = 1;
      break;
    default:
      break;
  }

  return v7;
}

+ (id)nameFromModelID:(unint64_t)a3
{
  if (a3 - 1 > 4)
    return CFSTR("CDIModelPredictive");
  else
    return off_1E26E4DE0[a3 - 1];
}

+ (void)adviceBasedOnInteractions:(void *)a1 forContacts:(char *)a2 andRanker:ignoringContacts:withLimit:aggregateByIdentifier:requireOneOutgoingInteraction:.cold.1(void *a1, char *a2)
{
  uint8_t v4[12];
  __int16 v5;
  void *v6;

  OUTLINED_FUNCTION_7_6(a1, a2);
  OUTLINED_FUNCTION_3();
  v5 = 2112;
  v6 = a1;
  _os_log_debug_impl(&dword_18DDBE000, (os_log_t)a2, OS_LOG_TYPE_DEBUG, "Returned %lu advised interactions. Advice=%@", v4, 0x16u);
  OUTLINED_FUNCTION_1();
}

+ (void)adviceBasedOnInteractions:(void *)a1 forContacts:(char *)a2 andRanker:ignoringContacts:withLimit:aggregateByIdentifier:requireOneOutgoingInteraction:.cold.2(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_7_6(a1, a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, a2, v3, "Advising based on %lu interactions", v4);
  OUTLINED_FUNCTION_1();
}

+ (void)rankContacts:(void *)a1 basedOnInteractions:(char *)a2 andRanker:.cold.1(void *a1, char *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_7_6(a1, a2);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, a2, v3, "Ranking contact identifiers based on %lu interactions", v4);
  OUTLINED_FUNCTION_1();
}

+ (void)updateConsumerModelSettings:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, v0, v1, "Updating model parameters: %@", v2);
  OUTLINED_FUNCTION_5();
}

+ (void)adjustForConsumerSettings:(void *)a1 modelSettings:(uint64_t)a2 andRanker:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "nameFromModelID:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, a3, v5, "Using model type: %@", v6);

  OUTLINED_FUNCTION_1();
}

+ (void)adjustForConsumerSettings:modelSettings:andRanker:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Adjusted ranker parameters", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)adjustForConsumerSettings:modelSettings:andRanker:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, v0, v1, "Adjusted ranker for mqa consumer. Advisor Settings = %@", v2);
  OUTLINED_FUNCTION_5();
}

+ (void)adjustForConsumerSettings:modelSettings:andRanker:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Adjusted ranker for pure frequency consumer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)adjustForConsumerSettings:modelSettings:andRanker:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Adjusted ranker for simple frequency consumer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)adjustForConsumerSettings:modelSettings:andRanker:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_8(&dword_18DDBE000, v0, v1, "Adjusted ranker for recency consumer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)adjustForConsumerSettings:modelSettings:andRanker:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_18DDBE000, v0, v1, "Adjusted ranker for consumer %@", v2);
  OUTLINED_FUNCTION_5();
}

@end
