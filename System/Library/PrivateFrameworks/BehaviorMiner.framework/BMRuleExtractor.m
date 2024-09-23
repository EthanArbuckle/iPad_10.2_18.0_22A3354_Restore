@implementation BMRuleExtractor

- (BMRuleExtractor)initWithPatterns:(id)a3 items:(id)a4 basketCount:(unint64_t)a5
{
  id v8;
  id v9;
  BMRuleExtractor *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSMutableDictionary *patterns;
  uint64_t v19;
  NSArray *items;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)BMRuleExtractor;
  v10 = -[BMRuleExtractor init](&v22, sel_init);
  if (v10)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
    if (objc_msgSend(v9, "count"))
    {
      v12 = 0;
      do
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "copy");

        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndex:", v12);
        objc_msgSend(v8, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setAbsoluteSupport:", objc_msgSend(v16, "unsignedIntegerValue"));
        objc_msgSend(v11, "addObject:", v14);

        ++v12;
      }
      while (v12 < objc_msgSend(v9, "count"));
    }
    v17 = objc_msgSend(v8, "mutableCopy");
    patterns = v10->_patterns;
    v10->_patterns = (NSMutableDictionary *)v17;

    v19 = objc_msgSend(v11, "copy");
    items = v10->_items;
    v10->_items = (NSArray *)v19;

    v10->_basketCount = a5;
    v10->_shouldStop = 0;

  }
  return v10;
}

- (void)terminateEarly
{
  -[BMRuleExtractor setShouldStop:](self, "setShouldStop:", 1);
}

- (id)subsetsOfItemset:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "firstIndex");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = v5;
    do
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v8 = v4;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v19;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v8);
            v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "mutableCopy");
            objc_msgSend(v13, "addIndex:", v6);
            v14 = (void *)objc_msgSend(v13, "copy");
            objc_msgSend(v7, "addObject:", v14);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v10);
      }

      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndex:", v6);
      objc_msgSend(v8, "addObject:", v15);

      objc_msgSend(v7, "allObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObjectsFromArray:", v16);

      v6 = objc_msgSend(v3, "indexGreaterThanIndex:", v6);
    }
    while (v6 != 0x7FFFFFFFFFFFFFFFLL);
  }

  return v4;
}

- (unint64_t)supportOfItemSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[BMRuleExtractor patterns](self, "patterns");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
  }
  else
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[BMRuleExtractor patterns](self, "patterns", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v7 = 0;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v13, "containsIndexes:", v4))
          {
            -[BMRuleExtractor patterns](self, "patterns");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKey:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v7 += objc_msgSend(v15, "integerValue");

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }
    else
    {
      v7 = 0;
    }

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMRuleExtractor patterns](self, "patterns");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v4);

  }
  return v7;
}

- (id)itemSetForItemIndexSet:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v6 = objc_msgSend(v4, "firstIndex");
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = v6; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v4, "indexGreaterThanIndex:", i))
    {
      -[BMRuleExtractor items](self, "items");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v9);

    }
  }
  v10 = (void *)objc_msgSend(v5, "copy");

  return v10;
}

- (void)extractRulesWithMinSupport:(unint64_t)a3 minConfidence:(double)a4 targetTypes:(id)a5 batchSize:(unint64_t)a6 handler:(id)a7
{
  -[BMRuleExtractor extractRulesWithMinSupport:minConfidence:targetTypes:batchSize:currentDate:datedBaskets:handler:](self, "extractRulesWithMinSupport:minConfidence:targetTypes:batchSize:currentDate:datedBaskets:handler:", a3, a5, a6, 0, 0, a7, a4);
}

- (void)extractRulesWithMinSupport:(unint64_t)a3 minConfidence:(double)a4 targetTypes:(id)a5 batchSize:(unint64_t)a6 currentDate:(id)a7 datedBaskets:(id)a8 handler:(id)a9
{
  id v16;
  id v17;
  id v18;
  uint64_t (**v19)(id, void *);
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  double v26;
  uint64_t v27;
  BMRuleExtractor *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  void *v57;
  int v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  int v69;
  BMRule *v70;
  void *v71;
  void *v72;
  BMRule *v73;
  void *v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  id v82;
  id v83;
  id v84;
  uint64_t (**v85)(id, void *);
  void *v86;
  uint64_t v87;
  void *v88;
  unint64_t v89;
  uint64_t v90;
  id v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  void *v95;
  void *v96;
  uint64_t v97;
  id v98;
  id obj;
  void *v100;
  id v101;
  id v102;
  BMRuleExtractor *v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *context;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _QWORD v121[4];
  id v122;
  id v123;
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x24BDAC8D0];
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = (uint64_t (**)(id, void *))a9;
  if (v19)
  {
    v89 = a6;
    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[BMRuleExtractor items](self, "items");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v121[0] = MEMORY[0x24BDAC760];
    v121[1] = 3221225472;
    v121[2] = __115__BMRuleExtractor_extractRulesWithMinSupport_minConfidence_targetTypes_batchSize_currentDate_datedBaskets_handler___block_invoke;
    v121[3] = &unk_24D21E6F8;
    v122 = v16;
    v22 = v20;
    v123 = v22;
    objc_msgSend(v21, "enumerateObjectsUsingBlock:", v121);

    v86 = v22;
    v97 = objc_msgSend(v22, "copy");
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    v103 = self;
    -[BMRuleExtractor patterns](self, "patterns");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "copy");

    v119 = 0u;
    v120 = 0u;
    v117 = 0u;
    v118 = 0u;
    v25 = v24;
    v87 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v117, v126, 16);
    if (v87)
    {
      v26 = (double)a3;
      v27 = *(_QWORD *)v118;
      v28 = v103;
      v83 = v17;
      v84 = v16;
      v91 = v18;
      v85 = v19;
      v81 = *(_QWORD *)v118;
      v82 = v25;
      do
      {
        v29 = 0;
        do
        {
          if (*(_QWORD *)v118 != v27)
          {
            v30 = v29;
            objc_enumerationMutation(v25);
            v29 = v30;
          }
          v90 = v29;
          v31 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v29);
          v95 = (void *)MEMORY[0x2199D5B54]();
          -[BMRuleExtractor patterns](v28, "patterns");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKey:", v31);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "doubleValue");
          v35 = v34;

          if (v35 >= v26)
          {
            -[BMRuleExtractor subsetsOfItemset:](v28, "subsetsOfItemset:", v31);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v113 = 0u;
            v114 = 0u;
            v115 = 0u;
            v116 = 0u;
            obj = v37;
            v36 = (void *)v97;
            v105 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v125, 16);
            if (v105)
            {
              v38 = v31;
              v104 = *(_QWORD *)v114;
              v88 = v31;
              v39 = v89;
              do
              {
                v40 = 0;
                do
                {
                  if (*(_QWORD *)v114 != v104)
                    objc_enumerationMutation(obj);
                  v41 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * v40);
                  v42 = (void *)MEMORY[0x2199D5B54]();
                  if (-[BMRuleExtractor shouldStop](v28, "shouldStop"))
                  {
                    v17 = v83;
                    v16 = v84;
                    v78 = v95;
                    v80 = v96;
                    v25 = v82;
                    goto LABEL_50;
                  }
                  context = v42;
                  v43 = (void *)objc_msgSend(v38, "mutableCopy");
                  objc_msgSend(v43, "removeIndexes:", v41);
                  if (objc_msgSend(v43, "count"))
                  {
                    v44 = (void *)objc_msgSend(v43, "mutableCopy");
                    objc_msgSend(v44, "removeIndexes:", v36);
                    v106 = v44;
                    if (objc_msgSend(v44, "count")
                      || (v45 = -[BMRuleExtractor supportOfItemSet:](v28, "supportOfItemSet:", v41),
                          v46 = v35 / (double)v45,
                          v46 < a4))
                    {
                      v47 = v44;
                    }
                    else
                    {
                      v94 = v45;
                      v92 = -[BMRuleExtractor basketCount](v28, "basketCount");
                      v93 = -[BMRuleExtractor supportOfItemSet:](v28, "supportOfItemSet:", v43);
                      if (v18)
                      {
                        v101 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
                        v98 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
                        v48 = (void *)MEMORY[0x24BDBCEF0];
                        -[BMRuleExtractor itemSetForItemIndexSet:](v28, "itemSetForItemIndexSet:", v41);
                        v49 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v48, "setWithSet:", v49);
                        v50 = (void *)objc_claimAutoreleasedReturnValue();

                        -[BMRuleExtractor itemSetForItemIndexSet:](v28, "itemSetForItemIndexSet:", v43);
                        v51 = (void *)objc_claimAutoreleasedReturnValue();
                        v107 = v50;
                        objc_msgSend(v50, "unionSet:", v51);

                        objc_msgSend(MEMORY[0x24BDBCE60], "now");
                        v100 = (void *)objc_claimAutoreleasedReturnValue();
                        v109 = 0u;
                        v110 = 0u;
                        v111 = 0u;
                        v112 = 0u;
                        v102 = v18;
                        v52 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v109, v124, 16);
                        if (v52)
                        {
                          v53 = v52;
                          v54 = *(_QWORD *)v110;
                          while (2)
                          {
                            for (i = 0; i != v53; ++i)
                            {
                              if (*(_QWORD *)v110 != v54)
                                objc_enumerationMutation(v102);
                              v56 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
                              if (-[BMRuleExtractor shouldStop](v28, "shouldStop"))
                              {

                                v69 = 0;
                                v66 = 0;
                                v68 = 0;
                                v67 = v101;
                                v65 = v98;
                                goto LABEL_37;
                              }
                              objc_msgSend(v56, "basket");
                              v57 = (void *)objc_claimAutoreleasedReturnValue();
                              v58 = objc_msgSend(v107, "isSubsetOfSet:", v57);

                              if (v58)
                              {
                                objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
                                v59 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v56, "date");
                                v60 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v59, "components:fromDate:", 28, v60);
                                v61 = (void *)objc_claimAutoreleasedReturnValue();

                                objc_msgSend(v101, "addObject:", v61);
                                objc_msgSend(v56, "date");
                                v62 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(v100, "timeIntervalSinceDate:", v62);
                                v64 = v63;

                                if (v64 < 604800.0)
                                  objc_msgSend(v98, "addObject:", v61);

                                v28 = v103;
                              }
                            }
                            v53 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v109, v124, 16);
                            if (v53)
                              continue;
                            break;
                          }
                        }

                        v65 = v98;
                        v66 = objc_msgSend(v98, "count");
                        v67 = v101;
                        v68 = objc_msgSend(v101, "count");
                        v69 = 1;
LABEL_37:

                        v18 = v91;
                        v19 = v85;
                        v39 = v89;
                        if (!v69)
                        {
                          v80 = v96;
                          goto LABEL_58;
                        }
                      }
                      else
                      {
                        v66 = 0;
                        v68 = 0;
                      }
                      v70 = [BMRule alloc];
                      -[BMRuleExtractor itemSetForItemIndexSet:](v103, "itemSetForItemIndexSet:", v41);
                      v71 = (void *)objc_claimAutoreleasedReturnValue();
                      -[BMRuleExtractor itemSetForItemIndexSet:](v103, "itemSetForItemIndexSet:", v43);
                      v72 = (void *)objc_claimAutoreleasedReturnValue();
                      v73 = -[BMRule initWithAntecedent:consequent:support:confidence:basketCount:absoluteSupport:absoluteAntecedentSupport:absoluteConsequentSupport:uniqueDaysLastWeek:uniqueDaysTotal:](v70, "initWithAntecedent:consequent:support:confidence:basketCount:absoluteSupport:absoluteAntecedentSupport:absoluteConsequentSupport:uniqueDaysLastWeek:uniqueDaysTotal:", v71, v72, -[BMRuleExtractor basketCount](v103, "basketCount"), (unint64_t)v35, v94, v93, v35 / (double)v92, v46, v66, v68);

                      objc_msgSend(v96, "addObject:", v73);
                      if (objc_msgSend(v96, "count") >= v39)
                      {
                        v74 = (void *)objc_msgSend(v96, "copy");
                        v75 = v19[2](v19, v74);

                        objc_msgSend(MEMORY[0x24BDBCEF0], "set");
                        v76 = objc_claimAutoreleasedReturnValue();

                        if (v75)
                        {

                          v80 = (void *)v76;
                          v18 = v91;
LABEL_58:

                          v17 = v83;
                          v16 = v84;
                          v36 = (void *)v97;
                          v25 = v82;
                          v78 = v95;
                          v42 = context;
LABEL_50:
                          objc_autoreleasePoolPop(v42);

                          objc_autoreleasePoolPop(v78);
                          v79 = v25;
                          goto LABEL_54;
                        }
                        v96 = (void *)v76;
                      }
                      v18 = v91;
                      v47 = v106;

                      v36 = (void *)v97;
                      v28 = v103;
                      v38 = v88;
                    }

                  }
                  objc_autoreleasePoolPop(context);
                  ++v40;
                }
                while (v40 != v105);
                v77 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v113, v125, 16);
                v105 = v77;
              }
              while (v77);
            }

            v17 = v83;
            v16 = v84;
            v27 = v81;
            v25 = v82;
          }
          else
          {
            v36 = (void *)v97;
          }
          objc_autoreleasePoolPop(v95);
          v29 = v90 + 1;
        }
        while (v90 + 1 != v87);
        v87 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v117, v126, 16);
      }
      while (v87);
    }
    else
    {
      v36 = (void *)v97;
    }

    v80 = v96;
    if (objc_msgSend(v96, "count"))
    {
      v79 = (void *)objc_msgSend(v96, "copy");
      v19[2](v19, v79);
LABEL_54:

    }
  }

}

void __115__BMRuleExtractor_extractRulesWithMinSupport_minConfidence_targetTypes_batchSize_currentDate_datedBaskets_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "containsObject:", v6);

  if ((_DWORD)v5)
    objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
}

- (NSMutableDictionary)patterns
{
  return self->_patterns;
}

- (void)setPatterns:(id)a3
{
  objc_storeStrong((id *)&self->_patterns, a3);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (unint64_t)basketCount
{
  return self->_basketCount;
}

- (BOOL)shouldStop
{
  return self->_shouldStop;
}

- (void)setShouldStop:(BOOL)a3
{
  self->_shouldStop = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_patterns, 0);
}

@end
