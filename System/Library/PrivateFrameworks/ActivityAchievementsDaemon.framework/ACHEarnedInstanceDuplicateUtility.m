@implementation ACHEarnedInstanceDuplicateUtility

- (ACHEarnedInstanceDuplicateUtility)initWithTemplateStore:(id)a3
{
  id v4;
  ACHEarnedInstanceDuplicateUtility *v5;
  ACHEarnedInstanceDuplicateUtility *v6;
  uint64_t v7;
  NSCalendar *gregorianCalendar;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ACHEarnedInstanceDuplicateUtility;
  v5 = -[ACHEarnedInstanceDuplicateUtility init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_templateStore, v4);
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v7 = objc_claimAutoreleasedReturnValue();
    gregorianCalendar = v6->_gregorianCalendar;
    v6->_gregorianCalendar = (NSCalendar *)v7;

  }
  return v6;
}

- (id)earnedInstancesWithoutDuplicates:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  char v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  int v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  void *v57;
  id v58;
  id v59;
  id v60;
  id v61;
  char v62;
  void *v63;
  void *v64;
  void *v66;
  void *v67;
  id v68;
  void *context;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  id obj;
  id v82;
  uint64_t v83;
  void *v84;
  id v85;
  id v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;

  v97 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "hk_map:", &__block_literal_global_17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") != 1)
  {
    ACHLogDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ACHEarnedInstanceDuplicateUtility earnedInstancesWithoutDuplicates:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  -[ACHEarnedInstanceDuplicateUtility templateStore](self, "templateStore", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "templateUniqueName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "templateForUniqueName:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v68 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[ACHEarnedInstanceDuplicateUtility gregorianCalendar](self, "gregorianCalendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = HKFirstDayOfWeekForWeeklyGoalCalculations();
  v18 = v4;
  v67 = v18;
  if (objc_msgSend(v18, "count"))
  {
    v76 = v16;
    v80 = v17;
    do
    {
      context = (void *)MEMORY[0x2199C8FE0]();
      objc_msgSend(v18, "anyObject");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v82 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      obj = v18;
      v85 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
      if (!v85)
        goto LABEL_46;
      v83 = *(_QWORD *)v88;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v88 != v83)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * (_QWORD)v19);
          v21 = (void *)MEMORY[0x2199C8FE0]();
          v22 = v16;
          v23 = v17;
          v24 = v84;
          v25 = v20;
          if ((objc_msgSend(v24, "isEqual:", v25) & 1) != 0)
          {
LABEL_13:

LABEL_14:
            objc_msgSend(v82, "addObject:", v25);
            goto LABEL_42;
          }
          if (objc_msgSend(v22, "duplicateRemovalStrategy") == 4)
          {
            objc_msgSend(v24, "externalIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "externalIdentifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v26, "isEqual:", v27);
            goto LABEL_17;
          }
          if (!objc_msgSend(v22, "duplicateRemovalCalendarUnit"))
            goto LABEL_41;
          v29 = objc_msgSend(v22, "duplicateRemovalCalendarUnit");
          v30 = objc_msgSend(v24, "packedEarnedDateComponents");
          v31 = objc_msgSend(v25, "packedEarnedDateComponents");
          v32 = v30 & 0xFFFFFFFFFFLL;
          v33 = v31 & 0xFFFFFFFFFFLL;
          v77 = (v30 >> 16) & 0xFFFFFF;
          v34 = (v31 >> 16) & 0xFFFFFF;
          v35 = v23;
          if (v29 > 15)
          {
            if (v29 == 16)
            {
              if ((unsigned __int16)v33 != (unsigned __int16)v32 || v34 != v77)
              {

                v16 = v76;
                v17 = v80;
LABEL_41:

                goto LABEL_42;
              }
              v36 = (v33 ^ v32) & 0xFF000000;
LABEL_24:

              v16 = v76;
              v17 = v80;
              if (v36)
                goto LABEL_41;
              goto LABEL_33;
            }
            if (v29 != 0x2000)
            {
LABEL_30:
              v41 = v35;
              ACHDateComponentsForPackedDateComponents(v32);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "dateFromComponents:", v79);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              ACHDateComponentsForPackedDateComponents(v33);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "dateFromComponents:", v75);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(v41, "isDate:equalToDate:toUnitGranularity:", v72, v42, v29);

              v16 = v76;
              v17 = v80;
              if ((v43 & 1) == 0)
                goto LABEL_41;
              goto LABEL_33;
            }
            v37 = v35;
            ACHDateComponentsForPackedDateComponents(v32);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = v37;
            objc_msgSend(v37, "dateFromComponents:", v78);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            ACHDateComponentsForPackedDateComponents(v33);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "dateFromComponents:", v74);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", v70, v71, 0);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", v70, v38, 0);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v37) = objc_msgSend(v39, "isEqual:", v40);

            v16 = v76;
            v17 = v80;
            if ((v37 & 1) == 0)
              goto LABEL_41;
          }
          else
          {
            if (v29 != 2)
            {
              if (v29 != 8)
                goto LABEL_30;
              v36 = (unsigned __int16)(v33 ^ v32) | (unint64_t)(v34 ^ v77);
              goto LABEL_24;
            }

            v16 = v76;
            v17 = v80;
          }
LABEL_33:
          v44 = objc_msgSend(v22, "duplicateRemovalStrategy");
          if ((v44 - 1) < 2)
            goto LABEL_13;
          if (v44 != 3)
            goto LABEL_41;
          objc_msgSend(v24, "value");
          v45 = objc_claimAutoreleasedReturnValue();
          if (!v45)
            goto LABEL_41;
          v46 = (void *)v45;
          objc_msgSend(v25, "value");
          v47 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v47)
            goto LABEL_41;
          objc_msgSend(v24, "value");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "value");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v26, "compare:", v27) == 0;
LABEL_17:

          v17 = v80;
          if ((v28 & 1) != 0)
            goto LABEL_14;
LABEL_42:
          objc_autoreleasePoolPop(v21);
          v19 = (char *)v19 + 1;
        }
        while (v85 != v19);
        v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v95, 16);
        v85 = (id)v48;
      }
      while (v48);
LABEL_46:

      v49 = v16;
      v50 = v17;
      v51 = v82;
      objc_msgSend(v51, "anyObject");
      v52 = (id)objc_claimAutoreleasedReturnValue();
      v91 = 0u;
      v92 = 0u;
      v93 = 0u;
      v94 = 0u;
      v86 = v51;
      v53 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v91, v96, 16);
      if (v53)
      {
        v54 = v53;
        v55 = *(_QWORD *)v92;
        do
        {
          for (i = 0; i != v54; ++i)
          {
            if (*(_QWORD *)v92 != v55)
              objc_enumerationMutation(v86);
            v57 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
            v58 = v49;
            v59 = v50;
            v60 = v52;
            v61 = v57;
            v62 = objc_msgSend(v60, "isEqual:", v61);
            v63 = v60;
            if ((v62 & 1) == 0)
            {
              if (ACHComparisonForEarnedInstances(v58, v59, v60, v61) == -1)
                v63 = v61;
              else
                v63 = v60;
            }
            v52 = v63;

          }
          v54 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v91, v96, 16);
        }
        while (v54);
      }

      objc_msgSend(v68, "addObject:", v52);
      objc_msgSend(obj, "hk_minus:", v86);
      v18 = (id)objc_claimAutoreleasedReturnValue();

      objc_autoreleasePoolPop(context);
      v16 = v76;
      v17 = v80;
    }
    while (objc_msgSend(v18, "count"));
  }
  v64 = (void *)objc_msgSend(v68, "copy");

  return v64;
}

uint64_t __70__ACHEarnedInstanceDuplicateUtility_earnedInstancesWithoutDuplicates___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "templateUniqueName");
}

- (id)earnedInstancesLimitedByEarnLimit:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, void *, void *);
  void *v27;
  id v28;
  ACHEarnedInstanceDuplicateUtility *v29;

  v4 = a3;
  objc_msgSend(v4, "hk_map:", &__block_literal_global_185);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") != 1)
  {
    ACHLogDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ACHEarnedInstanceDuplicateUtility earnedInstancesWithoutDuplicates:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  }
  -[ACHEarnedInstanceDuplicateUtility templateStore](self, "templateStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "anyObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "templateUniqueName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "templateForUniqueName:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "earnLimit");
  if (*MEMORY[0x24BE01610] == v17)
  {
    v18 = v4;
  }
  else
  {
    v19 = v17;
    objc_msgSend(v4, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = __71__ACHEarnedInstanceDuplicateUtility_earnedInstancesLimitedByEarnLimit___block_invoke_186;
    v27 = &unk_24D13BF88;
    v28 = v16;
    v29 = self;
    objc_msgSend(v20, "sortedArrayUsingComparator:", &v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "subarrayWithRange:", objc_msgSend(v21, "count", v24, v25, v26, v27) - v19, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v22);
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

uint64_t __71__ACHEarnedInstanceDuplicateUtility_earnedInstancesLimitedByEarnLimit___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "templateUniqueName");
}

uint64_t __71__ACHEarnedInstanceDuplicateUtility_earnedInstancesLimitedByEarnLimit___block_invoke_186(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;

  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "gregorianCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = ACHComparisonForEarnedInstances(v4, v8, v7, v6);

  return v9;
}

- (ACHTemplateStore)templateStore
{
  return (ACHTemplateStore *)objc_loadWeakRetained((id *)&self->_templateStore);
}

- (void)setTemplateStore:(id)a3
{
  objc_storeWeak((id *)&self->_templateStore, a3);
}

- (NSCalendar)gregorianCalendar
{
  return self->_gregorianCalendar;
}

- (void)setGregorianCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_gregorianCalendar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gregorianCalendar, 0);
  objc_destroyWeak((id *)&self->_templateStore);
}

- (void)earnedInstancesWithoutDuplicates:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21407B000, a2, a3, "-earnedInstancesWithoutDuplicates: called with instances of multiple templates, template names: %@", a5, a6, a7, a8, 2u);
}

@end
