@implementation AAUIAchievementsDataProvider

void __56__AAUIAchievementsDataProvider_setDidFinishInitialLoad___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    *(_BYTE *)(v1 + 8) = *(_BYTE *)(a1 + 40);
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = *(id *)(*(_QWORD *)(a1 + 32) + 224);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "achievementsDataProviderDidFinishInitialLoad:", *(_QWORD *)(a1 + 32), (_QWORD)v8);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_1);
  }
}

- (void)startFetching
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21CC08000, v0, v1, "Error starting awards query: %@", v2);
}

void __56__AAUIAchievementsDataProvider_setDidFinishInitialLoad___block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("AAUIAchievementsDataProviderDidFinishInitialLoad"), 0);

}

void __39__AAUIAchievementsDataProvider__reload__block_invoke_3()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("AAUIAchievementsDataProviderDidUpdateAchievement"), 0);

}

void __39__AAUIAchievementsDataProvider__reload__block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 232);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v6++), "achievementsDataProviderDidUpdate:", *(_QWORD *)(a1 + 32));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v4);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 240);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "achievementsDataProviderDidUpdate:", *(_QWORD *)(a1 + 32), (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    }
    while (v9);
  }

}

void __39__AAUIAchievementsDataProvider__reload__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "_deepCopyClientFacingModel");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 192);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__AAUIAchievementsDataProvider__reload__block_invoke_2;
  block[3] = &unk_24E0B2E78;
  block[4] = v2;
  dispatch_sync(v3, block);
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_292);
}

- (void)_reload
{
  AAUIAchievementsDataProvider *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  AAUIAchievementsDataProvider *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  void *v62;
  uint64_t v63;
  os_unfair_lock_t lock;
  uint64_t v65;
  void *v66;
  AAUIAchievementsDataProvider *v67;
  uint64_t v68;
  id v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD block[5];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint64_t v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, void *, void *);
  void *v100;
  char v101;
  uint64_t v102;

  v2 = self;
  v102 = *MEMORY[0x24BDAC8D0];
  lock = &self->_modelLock;
  os_unfair_lock_lock(&self->_modelLock);
  -[AAUIAchievementsDataProvider recentAchievements](v2, "recentAchievements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = MEMORY[0x24BDAC760];
  v98 = 3221225472;
  v99 = __AAUISortAchievementsByMostRecentEarnedDate_block_invoke;
  v100 = &__block_descriptor_33_e43_q24__0__ACHAchievement_8__ACHAchievement_16l;
  v101 = 0;
  objc_msgSend(v3, "sortUsingComparator:", &v97);

  -[AAUIAchievementsDataProvider relevantAchievements](v2, "relevantAchievements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_570);

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  -[AAUIAchievementsDataProvider achievementsBySection](v2, "achievementsBySection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v83;
    v72 = *MEMORY[0x24BE01210];
    v71 = *MEMORY[0x24BE011F8];
    v66 = v6;
    v67 = v2;
    v65 = *(_QWORD *)v83;
    do
    {
      v10 = 0;
      v68 = v8;
      do
      {
        if (*(_QWORD *)v83 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v10);
        -[AAUIAchievementsDataProvider achievementsBySection](v2, "achievementsBySection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "isEqualToString:", v72))
        {
          v14 = v13;
          objc_msgSend(v14, "hk_filter:", &__block_literal_global_572);
          v73 = v13;
          v75 = v10;
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "hk_filter:", &__block_literal_global_573);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          AAUISortSubAchievementsByActivityType(v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          AAUISortSubAchievementsByActivityType(v16);
          v18 = v8;
          v19 = v6;
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v20);
          v21 = v2;
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v6 = v19;
          v8 = v18;

          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v2 = v21;
          -[AAUIAchievementsDataProvider achievementsBySection](v21, "achievementsBySection");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v11);

          v13 = v73;
          v10 = v75;

        }
        else if (objc_msgSend(v11, "isEqualToString:", v71))
        {
          v70 = v11;
          v74 = v13;
          v76 = v10;
          v25 = v13;
          v69 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          v26 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          v90 = 0u;
          v91 = 0u;
          v92 = 0u;
          v93 = 0u;
          v27 = v25;
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v90, &v97, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v91;
            do
            {
              for (i = 0; i != v29; ++i)
              {
                if (*(_QWORD *)v91 != v30)
                  objc_enumerationMutation(v27);
                v32 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
                v33 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v32, "template");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "numberWithUnsignedInteger:", objc_msgSend(v34, "displayOrder"));
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "objectForKeyedSubscript:", v35);
                v36 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v36)
                {
                  v37 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                  v38 = (void *)MEMORY[0x24BDD16E0];
                  objc_msgSend(v32, "template");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v38, "numberWithUnsignedInteger:", objc_msgSend(v39, "displayOrder"));
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "setObject:forKeyedSubscript:", v37, v40);

                }
                v41 = (void *)MEMORY[0x24BDD16E0];
                objc_msgSend(v32, "template");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "numberWithUnsignedInteger:", objc_msgSend(v42, "displayOrder"));
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "objectForKeyedSubscript:", v43);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "addObject:", v32);

              }
              v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v90, &v97, 16);
            }
            while (v29);
          }

          objc_msgSend(v26, "allKeys");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "sortedArrayUsingSelector:", sel_compare_);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          v88 = 0u;
          v89 = 0u;
          v86 = 0u;
          v87 = 0u;
          v47 = v46;
          v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
          if (v48)
          {
            v49 = v48;
            v50 = *(_QWORD *)v87;
            do
            {
              for (j = 0; j != v49; ++j)
              {
                if (*(_QWORD *)v87 != v50)
                  objc_enumerationMutation(v47);
                objc_msgSend(v26, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * j));
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                if ((unint64_t)objc_msgSend(v27, "count") < 2)
                {
                  objc_msgSend(v69, "addObjectsFromArray:", v52);
                }
                else
                {
                  objc_msgSend(v52, "sortedArrayUsingComparator:", &__block_literal_global_576);
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v69, "addObjectsFromArray:", v53);

                }
              }
              v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
            }
            while (v49);
          }

          v2 = v67;
          -[AAUIAchievementsDataProvider achievementsBySection](v67, "achievementsBySection");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setObject:forKeyedSubscript:", v69, v70);

          v9 = v65;
          v6 = v66;
          v8 = v68;
          v13 = v74;
          v10 = v76;
        }
        else
        {
          objc_msgSend(v13, "sortUsingComparator:", &__block_literal_global_570);
        }

        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
    }
    while (v8);
  }

  v55 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  -[AAUIAchievementsDataProvider achievementsByEarnedDateComponents](v2, "achievementsByEarnedDateComponents");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "allValues");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v79;
    do
    {
      for (k = 0; k != v59; ++k)
      {
        if (*(_QWORD *)v79 != v60)
          objc_enumerationMutation(v57);
        objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * k), "allObjects");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "addObjectsFromArray:", v62);

      }
      v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
    }
    while (v59);
  }

  v63 = MEMORY[0x24BDAC760];
  v97 = MEMORY[0x24BDAC760];
  v98 = 3221225472;
  v99 = __AAUISortAchievementsByMostRecentEarnedDate_block_invoke;
  v100 = &__block_descriptor_33_e43_q24__0__ACHAchievement_8__ACHAchievement_16l;
  v101 = 0;
  objc_msgSend(v55, "sortUsingComparator:", &v97);
  -[AAUIAchievementsDataProvider setAllAchievementsSortedByEarnedDate:](v2, "setAllAchievementsSortedByEarnedDate:", v55);
  os_unfair_lock_unlock(lock);
  block[0] = v63;
  block[1] = 3221225472;
  block[2] = __39__AAUIAchievementsDataProvider__reload__block_invoke;
  block[3] = &unk_24E0B2E78;
  block[4] = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

- (void)setAllAchievementsSortedByEarnedDate:(id)a3
{
  objc_storeStrong((id *)&self->_allAchievementsSortedByEarnedDate, a3);
}

- (void)_deepCopyClientFacingModel
{
  os_unfair_lock_s *p_modelLock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  p_modelLock = &self->_modelLock;
  os_unfair_lock_lock(&self->_modelLock);
  -[AAUIAchievementsDataProvider recentAchievements](self, "recentAchievements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  -[AAUIAchievementsDataProvider setClientRecentAchievements:](self, "setClientRecentAchievements:", v5);

  -[AAUIAchievementsDataProvider relevantAchievements](self, "relevantAchievements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  -[AAUIAchievementsDataProvider setClientRelevantAchievements:](self, "setClientRelevantAchievements:", v7);

  -[AAUIAchievementsDataProvider filteredAchievementsByTemplateUniqueName](self, "filteredAchievementsByTemplateUniqueName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  -[AAUIAchievementsDataProvider setClientFilteredAchievementsByTemplateUniqueName:](self, "setClientFilteredAchievementsByTemplateUniqueName:", v9);

  -[AAUIAchievementsDataProvider achievementsByTemplateUniqueName](self, "achievementsByTemplateUniqueName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");
  -[AAUIAchievementsDataProvider setClientAchievementsByTemplateUniqueName:](self, "setClientAchievementsByTemplateUniqueName:", v11);

  v12 = objc_alloc(MEMORY[0x24BDBCE70]);
  -[AAUIAchievementsDataProvider achievementsBySection](self, "achievementsBySection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithDictionary:copyItems:", v13, 1);
  -[AAUIAchievementsDataProvider setClientAchievementsBySection:](self, "setClientAchievementsBySection:", v14);

  v15 = objc_alloc(MEMORY[0x24BDBCE70]);
  -[AAUIAchievementsDataProvider achievementsByEarnedDateComponents](self, "achievementsByEarnedDateComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithDictionary:copyItems:", v16, 1);
  -[AAUIAchievementsDataProvider setClientAchievementsByEarnedDateComponents:](self, "setClientAchievementsByEarnedDateComponents:", v17);

  v18 = (void *)-[NSMutableArray copy](self->_allAchievementsSortedByEarnedDate, "copy");
  -[AAUIAchievementsDataProvider setClientAllAchievementsSortedByEarnedDate:](self, "setClientAllAchievementsSortedByEarnedDate:", v18);

  os_unfair_lock_unlock(p_modelLock);
}

- (NSMutableDictionary)achievementsByEarnedDateComponents
{
  return self->_achievementsByEarnedDateComponents;
}

- (void)setClientRelevantAchievements:(id)a3
{
  objc_storeStrong((id *)&self->_clientRelevantAchievements, a3);
}

- (void)setClientRecentAchievements:(id)a3
{
  objc_storeStrong((id *)&self->_clientRecentAchievements, a3);
}

- (void)setClientFilteredAchievementsByTemplateUniqueName:(id)a3
{
  objc_storeStrong((id *)&self->_clientFilteredAchievementsByTemplateUniqueName, a3);
}

- (void)setClientAllAchievementsSortedByEarnedDate:(id)a3
{
  objc_storeStrong((id *)&self->_clientAllAchievementsSortedByEarnedDate, a3);
}

- (void)setClientAchievementsByTemplateUniqueName:(id)a3
{
  objc_storeStrong((id *)&self->_clientAchievementsByTemplateUniqueName, a3);
}

- (void)setClientAchievementsBySection:(id)a3
{
  objc_storeStrong((id *)&self->_clientAchievementsBySection, a3);
}

- (void)setClientAchievementsByEarnedDateComponents:(id)a3
{
  objc_storeStrong((id *)&self->_clientAchievementsByEarnedDateComponents, a3);
}

- (BOOL)_builtInBelongsInRelevants:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  BOOL v17;
  int v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  unint64_t v28;

  v3 = a3;
  objc_msgSend(v3, "template");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "canonicalUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "template");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "canonicalUnit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "progress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValueForUnit:", v7);
    v10 = v9;

    objc_msgSend(v3, "goal");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValueForUnit:", v7);
    v13 = v12;

    objc_msgSend(v3, "template");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uniqueName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("NewMoveRecord")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("NewMoveTimeRecord")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("NewExerciseRecord")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("MoveGoal200Percent")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("MoveGoal300Percent")) & 1) != 0
      || objc_msgSend(v15, "isEqualToString:", CFSTR("MoveGoal400Percent")))
    {
      v16 = v13 > 2.22044605e-16 && (v13 - v10) / v13 < 0.1;
      v18 = v13 > v10 && v16;
    }
    else
    {
      v18 = 0;
    }
    if ((objc_msgSend(v15, "isEqualToString:", CFSTR("PerfectWeekMove")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("PerfectWeekExercise")) & 1) != 0
      || (objc_msgSend(v15, "isEqualToString:", CFSTR("PerfectWeekStand")) & 1) != 0
      || objc_msgSend(v15, "isEqualToString:", CFSTR("PerfectWeekAll")))
    {
      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (AAUITrophyCaseShouldShowPerfectWeekAchievement(v19, v20, v10))
        v18 = 1;

    }
    v21 = llround(v10);
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("LongestMoveStreak")))
    {
      if ((ACHShouldUseNewAwardsSystem() & 1) != 0)
      {
        objc_msgSend(v3, "relevantEarnedInstance");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v3, "earnedInstances");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "lastObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(v22, "value");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "template");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "canonicalUnit");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "doubleValueForUnit:", v26);
      v28 = llround(v27);

      if (v28 + ~v21 < 2)
        v18 = 1;

    }
    if (((objc_msgSend(v15, "isEqualToString:", CFSTR("100MoveGoals")) & 1) != 0
       || (objc_msgSend(v15, "isEqualToString:", CFSTR("365MoveGoals")) & 1) != 0
       || (objc_msgSend(v15, "isEqualToString:", CFSTR("500MoveGoals")) & 1) != 0
       || (objc_msgSend(v15, "isEqualToString:", CFSTR("1000MoveGoals")) & 1) != 0
       || (objc_msgSend(v15, "isEqualToString:", CFSTR("1250MoveGoals")) & 1) != 0
       || (objc_msgSend(v15, "isEqualToString:", CFSTR("1500MoveGoals")) & 1) != 0
       || (objc_msgSend(v15, "isEqualToString:", CFSTR("1750MoveGoals")) & 1) != 0
       || objc_msgSend(v15, "isEqualToString:", CFSTR("2000MoveGoals")))
      && llround(v13) + ~v21 < 9)
    {
      v18 = 1;
    }

    v17 = v18 != 0;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __59__AAUIAchievementsDataProvider__handleUpdatedAchievements___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  char v19;
  char v20;
  id v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v28 = 0;
  objc_msgSend(v2, "activityMoveModeWithError:", &v28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v28;
  if (v4)
  {
    ACHLogUI();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __59__AAUIAchievementsDataProvider__handleUpdatedAchievements___block_invoke_cold_1();

  }
  if (v3)
    v6 = objc_msgSend(v3, "activityMoveMode");
  else
    v6 = 1;
  v7 = FIExperienceTypeWithHealthStore();
  if (v7)
    v8 = v7;
  else
    v8 = 3;
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = *(id *)(a1 + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v10)
  {
    v11 = v10;
    v22 = v3;
    obj = v9;
    v21 = v4;
    v12 = a1;
    v13 = 0;
    v14 = 0;
    v15 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v18 = (void *)MEMORY[0x22078928C]();
        v19 = objc_msgSend(*(id *)(v12 + 32), "_updateAchievement:activityMoveMode:experienceType:", v17, v6, v8);
        v14 |= (v19 & 0x15) != 0;
        v13 |= (v19 & 0x2A) != 0;
        objc_autoreleasePoolPop(v18);
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v11);
    v20 = v14 | v13;

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(v12 + 32) + 12));
    v4 = v21;
    v3 = v22;
    if ((v20 & 1) != 0)
      objc_msgSend(*(id *)(v12 + 32), "_reload");
  }
  else
  {

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  }

}

- (int64_t)_updateAchievement:(id)a3 activityMoveMode:(int64_t)a4 experienceType:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  id v39;
  void *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _BOOL4 v49;
  void *v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[AAUIAchievementsDataProvider achievementsByTemplateUniqueName](self, "achievementsByTemplateUniqueName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "template");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uniqueName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v11);

  if (-[AAUIAchievementsDataProvider _shouldShowAchievement:activityMoveMode:experienceType:](self, "_shouldShowAchievement:activityMoveMode:experienceType:", v8, a4, a5))
  {
    if (ACHShouldUseNewAwardsSystem())
    {
      objc_msgSend(v8, "relevantEarnedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
        -[AAUIAchievementsDataProvider _updateAchievementsByEarnedDateComponentsWithAchievement:earnedInstance:](self, "_updateAchievementsByEarnedDateComponentsWithAchievement:earnedInstance:", v8, v12);
    }
    else
    {
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      objc_msgSend(v8, "earnedInstances");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v55 != v16)
              objc_enumerationMutation(v12);
            v18 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
            v19 = (void *)MEMORY[0x22078928C]();
            -[AAUIAchievementsDataProvider _updateAchievementsByEarnedDateComponentsWithAchievement:earnedInstance:](self, "_updateAchievementsByEarnedDateComponentsWithAchievement:earnedInstance:", v8, v18);
            objc_autoreleasePoolPop(v19);
          }
          v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
        }
        while (v15);
      }
    }

    -[AAUIAchievementsDataProvider filteredAchievementsByTemplateUniqueName](self, "filteredAchievementsByTemplateUniqueName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "template");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "uniqueName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v8, v22);

    objc_msgSend(v8, "section");
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      ACHLogDefault();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "template");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "uniqueName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v59 = v26;
        _os_log_impl(&dword_21CC08000, v24, OS_LOG_TYPE_DEFAULT, "SECTION NOT FOUND FOR ACHIEVEMENT %@", buf, 0xCu);

      }
      v23 = CFSTR("NOT_FOUND");
    }
    -[AAUIAchievementsDataProvider achievementsBySection](self, "achievementsBySection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", v23);
    v28 = (id)objc_claimAutoreleasedReturnValue();

    if (!v28)
    {
      v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      -[AAUIAchievementsDataProvider achievementsBySection](self, "achievementsBySection");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, v23);

    }
    objc_msgSend(v8, "template");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "uniqueName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    AAUIAchievementInArrayWithUniqueName(v28, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      if (AAUICompareAchievements(v32, v8) == 1)
      {
        v13 = 0;
        goto LABEL_25;
      }
      objc_msgSend(v28, "removeObject:", v32);
      v13 = 1;
    }
    else
    {
      v13 = 16;
    }
    objc_msgSend(v28, "addObject:", v8);
LABEL_25:

    v53 = 0;
    v33 = -[AAUIAchievementsDataProvider _achievementBelongsInRecents:replacingRecent:](self, "_achievementBelongsInRecents:replacingRecent:", v8, &v53);
    v34 = v53;
    if (v33)
    {
      -[AAUIAchievementsDataProvider recentAchievements](self, "recentAchievements");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v35;
      if (v34)
      {
        v13 |= 2uLL;
        objc_msgSend(v35, "removeObject:", v34);

        -[AAUIAchievementsDataProvider recentAchievements](self, "recentAchievements");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 |= 0x20uLL;
      }
      objc_msgSend(v36, "addObject:", v8);

    }
    if ((ACHShouldUseNewAwardsSystem() & 1) != 0)
      objc_msgSend(v8, "shallowCopyWithRelevantEarnedInstance:", 0);
    else
      objc_msgSend(v8, "shallowCopyReplacingEarnedInstances:", MEMORY[0x24BDBD1A8]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    v38 = -[AAUIAchievementsDataProvider _achievementBelongsInRelevants:replacingRelevant:](self, "_achievementBelongsInRelevants:replacingRelevant:", v8, &v52);
    v39 = v52;
    if (v38)
    {
      -[AAUIAchievementsDataProvider relevantAchievements](self, "relevantAchievements");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = v40;
      if (v39)
      {
        v13 |= 2uLL;
        objc_msgSend(v40, "removeObject:", v39);

        -[AAUIAchievementsDataProvider relevantAchievements](self, "relevantAchievements");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v40;
      }
      else
      {
        v13 |= 0x20uLL;
      }
      objc_msgSend(v40, "addObject:", v37);
    }
    else
    {
      v51 = v37;
      v42 = v23;
      -[AAUIAchievementsDataProvider relevantAchievements](self, "relevantAchievements");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "template");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "uniqueName");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      AAUIAchievementInArrayWithUniqueName(v43, v45);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        -[AAUIAchievementsDataProvider relevantAchievements](self, "relevantAchievements");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "removeObject:", v41);

        v13 |= 8uLL;
      }
      v23 = v42;
      v37 = v51;
    }

    objc_msgSend(v8, "template");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "sourceName");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v48, "isEqualToString:", *MEMORY[0x24BE01638]))
    {
      v49 = -[AAUIAchievementsDataProvider _monthlyChallengeBelongsInRelevants:](self, "_monthlyChallengeBelongsInRelevants:", v8);

      if (!v49)
      {
LABEL_45:

        goto LABEL_46;
      }
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v8);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[AAUIAchievementsDataProvider achievementsBySection](self, "achievementsBySection");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "setObject:forKeyedSubscript:", v47, CFSTR("CURRENT_MONTHLY_CHALLENGE"));
    }

    goto LABEL_45;
  }
  v13 = -[AAUIAchievementsDataProvider _deleteAchievement:fromUnfiltered:](self, "_deleteAchievement:fromUnfiltered:", v8, 0);
LABEL_46:

  return v13;
}

- (NSMutableDictionary)achievementsByTemplateUniqueName
{
  return self->_achievementsByTemplateUniqueName;
}

- (BOOL)_shouldShowAchievement:(id)a3 activityMoveMode:(int64_t)a4 experienceType:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  int v11;
  int IsEarnable;
  NSObject *v13;
  void *v14;
  void *v15;
  char v16;
  int v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if ((objc_msgSend(v8, "hasClientRequiredURLs") & 1) != 0)
  {
    objc_msgSend(v8, "template");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uniqueName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "containsString:", CFSTR("MonthlyChallenge")))
    {
      v11 = objc_msgSend(v8, "unearned");

      if (!v11)
      {
        IsEarnable = 1;
        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      IsEarnable = AAUIMonthlyChallengeIsEarnable(v8, v9);
    }
    else
    {

      IsEarnable = 1;
    }

LABEL_11:
    v17 = objc_msgSend(v8, "unearned") ^ 1;
    v16 = v17 & IsEarnable;
    if ((v17 & 1) == 0 && IsEarnable)
    {
      -[AAUIAchievementsDataProvider visibilityEvaluator](self, "visibilityEvaluator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v18, "unearnedAchievementIsVisibleNow:activityMoveMode:experienceType:", v8, a4, a5);

    }
    goto LABEL_14;
  }
  ACHLogAssets();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "template");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uniqueName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543362;
    v21 = v15;
    _os_log_impl(&dword_21CC08000, v13, OS_LOG_TYPE_DEFAULT, "AAUIAchievmentsProvider Filtering achievement from UI due to missing URLS: %{public}@", (uint8_t *)&v20, 0xCu);

  }
  v16 = 0;
LABEL_14:

  return v16;
}

- (ACHVisibilityEvaluator)visibilityEvaluator
{
  return self->_visibilityEvaluator;
}

- (int64_t)_deleteAchievement:(id)a3 fromUnfiltered:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  int64_t v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v4 = a4;
  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[AAUIAchievementsDataProvider filteredAchievementsByTemplateUniqueName](self, "filteredAchievementsByTemplateUniqueName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "template");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uniqueName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v9);

  if (v4)
  {
    -[AAUIAchievementsDataProvider achievementsByTemplateUniqueName](self, "achievementsByTemplateUniqueName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "template");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", 0, v12);

  }
  if (ACHShouldUseNewAwardsSystem())
  {
    objc_msgSend(v6, "relevantEarnedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      -[AAUIAchievementsDataProvider _deleteAchievementsByEarnedDateWithAchievement:earnedInstance:](self, "_deleteAchievementsByEarnedDateWithAchievement:earnedInstance:", v6, v13);
  }
  else
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    objc_msgSend(v6, "earnedInstances", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v38 != v16)
            objc_enumerationMutation(v13);
          -[AAUIAchievementsDataProvider _deleteAchievementsByEarnedDateWithAchievement:earnedInstance:](self, "_deleteAchievementsByEarnedDateWithAchievement:earnedInstance:", v6, *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      }
      while (v15);
    }
  }

  objc_msgSend(v6, "section");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAchievementsDataProvider achievementsBySection](self, "achievementsBySection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v6, "template");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "uniqueName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    AAUIAchievementInArrayWithUniqueName(v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v20, "removeObject:", v23);
      v24 = 4;
    }
    else
    {
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }
  -[AAUIAchievementsDataProvider recentAchievements](self, "recentAchievements");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "template");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "uniqueName");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  AAUIAchievementInArrayWithUniqueName(v25, v27);
  v28 = objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    -[AAUIAchievementsDataProvider recentAchievements](self, "recentAchievements");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "removeObject:", v28);

  }
  -[AAUIAchievementsDataProvider relevantAchievements](self, "relevantAchievements");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "template");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "uniqueName");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  AAUIAchievementInArrayWithUniqueName(v30, v32);
  v33 = objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    -[AAUIAchievementsDataProvider relevantAchievements](self, "relevantAchievements");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "removeObject:", v33);

  }
  if (v28 | v33)
    v35 = v24 | 8;
  else
    v35 = v24;

  return v35;
}

- (NSMutableDictionary)achievementsBySection
{
  return self->_achievementsBySection;
}

- (NSMutableArray)relevantAchievements
{
  return self->_relevantAchievements;
}

- (NSMutableArray)recentAchievements
{
  return self->_recentAchievements;
}

- (NSMutableDictionary)filteredAchievementsByTemplateUniqueName
{
  return self->_filteredAchievementsByTemplateUniqueName;
}

- (BOOL)_achievementBelongsInRecents:(id)a3 replacingRecent:(id *)a4
{
  id v6;
  BOOL v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v31;
  unint64_t v32;
  id *v33;
  void *v34;

  v6 = a3;
  if ((objc_msgSend(v6, "unearned") & 1) == 0)
  {
    v8 = ACHShouldUseNewAwardsSystem();
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v6, "relevantEarnedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "earnedInstances");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v10, "earnedDateComponents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateFromComponents:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingUnit:value:toDate:options:", 16, -7, v14, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "compare:", v15) == -1)
    {
      v7 = 0;
LABEL_24:

      goto LABEL_25;
    }
    v33 = a4;
    v34 = v10;
    -[AAUIAchievementsDataProvider recentAchievements](self, "recentAchievements");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "template");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uniqueName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    AAUIAchievementInArrayWithUniqueName(v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      if (AAUICompareAchievements(v19, v6) != -1)
      {
        v7 = 0;
LABEL_23:
        v10 = v34;

        goto LABEL_24;
      }
      *v33 = objc_retainAutorelease(v19);
    }
    else
    {
      -[AAUIAchievementsDataProvider recentAchievements](self, "recentAchievements");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");

      if (v21 >= 5)
      {
        -[AAUIAchievementsDataProvider _oldestRecentAchievement](self, "_oldestRecentAchievement");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if ((v8 & 1) != 0)
        {
          objc_msgSend(v22, "relevantEarnedInstance");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v22, "earnedInstances");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "lastObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v24, "earnedDateComponents");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "dateFromComponents:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v27, "compare:", v13) == -1)
          goto LABEL_20;
        if (objc_msgSend(v27, "compare:", v13))
          goto LABEL_21;
        objc_msgSend(v6, "template");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v28, "displayOrder");
        objc_msgSend(v23, "template");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "displayOrder");

        if (v32 <= v31)
        {
LABEL_21:
          v7 = 0;
        }
        else
        {
LABEL_20:
          *v33 = objc_retainAutorelease(v23);
          v7 = 1;
        }

        goto LABEL_23;
      }
    }
    v7 = 1;
    goto LABEL_23;
  }
  v7 = 0;
LABEL_25:

  return v7;
}

- (BOOL)_achievementBelongsInRelevants:(id)a3 replacingRelevant:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v6 = a3;
  if ((ACHShouldUseNewAwardsSystem() & 1) != 0)
  {
    objc_msgSend(v6, "relevantEarnedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "earnedInstances");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "earnedDateComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "components:fromDate:", 28, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v13 = (void *)ACHCompareYearMonthDayDateComponents();
    v14 = v13 != 0;
    if ((objc_msgSend(v6, "unearned") & 1) != 0)
    {
      if (!v13)
        goto LABEL_29;
LABEL_12:
      objc_msgSend(v6, "template");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "sourceName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BE01648]);

      if (v19)
      {
        if (!-[AAUIAchievementsDataProvider _remoteAchievementBelongsInRelevants:](self, "_remoteAchievementBelongsInRelevants:", v6))
        {
LABEL_25:
          LOBYTE(v13) = 0;
          goto LABEL_29;
        }
      }
      else
      {
        objc_msgSend(v6, "template");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "sourceName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x24BE01638]);

        if (v22)
        {
          if (!-[AAUIAchievementsDataProvider _monthlyChallengeBelongsInRelevants:](self, "_monthlyChallengeBelongsInRelevants:", v6))goto LABEL_25;
        }
        else
        {
          objc_msgSend(v6, "template");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "sourceName");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "isEqualToString:", *MEMORY[0x24BE01630]);

          if (!v25
            || !-[AAUIAchievementsDataProvider _builtInBelongsInRelevants:](self, "_builtInBelongsInRelevants:", v6))
          {
            goto LABEL_25;
          }
        }
      }
      -[AAUIAchievementsDataProvider relevantAchievements](self, "relevantAchievements");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "template");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "uniqueName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      AAUIAchievementInArrayWithUniqueName(v26, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        if ((!objc_msgSend(v29, "unearned") || (objc_msgSend(v6, "unearned") & 1) == 0)
          && AAUICompareAchievements(v29, v6) != -1)
        {
          LOBYTE(v13) = 0;
LABEL_28:

          goto LABEL_29;
        }
        *a4 = objc_retainAutorelease(v29);
      }
      LOBYTE(v13) = 1;
      goto LABEL_28;
    }
  }
  else
  {
    if ((objc_msgSend(v6, "unearned") & 1) != 0)
      goto LABEL_12;
    v14 = 1;
  }
  objc_msgSend(v6, "template");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "earnLimit");
  v16 = *MEMORY[0x24BE01610];

  LOBYTE(v13) = 0;
  if (v16 == v15 && v14)
    goto LABEL_12;
LABEL_29:

  return (char)v13;
}

- (_TtC22ActivityAchievementsUI15AAUIAwardsQuery)awardsQuery
{
  _TtC22ActivityAchievementsUI15AAUIAwardsQuery *awardsQuery;
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC22ActivityAchievementsUI15AAUIAwardsQuery *v7;
  _TtC22ActivityAchievementsUI15AAUIAwardsQuery *v8;
  _QWORD v10[4];
  id v11;
  _QWORD aBlock[4];
  id v13;
  id location;

  awardsQuery = self->_awardsQuery;
  if (!awardsQuery)
  {
    objc_initWeak(&location, self);
    v4 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __43__AAUIAchievementsDataProvider_awardsQuery__block_invoke;
    aBlock[3] = &unk_24E0B2D68;
    objc_copyWeak(&v13, &location);
    v5 = _Block_copy(aBlock);
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __43__AAUIAchievementsDataProvider_awardsQuery__block_invoke_2;
    v10[3] = &unk_24E0B2D68;
    objc_copyWeak(&v11, &location);
    v6 = _Block_copy(v10);
    v7 = -[AAUIAwardsQuery initWithInitialAwardsHandler:addedAwardsHandler:removedAwardsHandler:updatedAwardsHandler:]([_TtC22ActivityAchievementsUI15AAUIAwardsQuery alloc], "initWithInitialAwardsHandler:addedAwardsHandler:removedAwardsHandler:updatedAwardsHandler:", v5, v5, v6, v5);
    v8 = self->_awardsQuery;
    self->_awardsQuery = v7;

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    awardsQuery = self->_awardsQuery;
  }
  return awardsQuery;
}

void __43__AAUIAchievementsDataProvider_awardsQuery__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleUpdatedAchievements:", v4);

}

- (void)_handleUpdatedAchievements:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
    -[AAUIAchievementsDataProvider setDidFinishInitialLoad:](self, "setDidFinishInitialLoad:", 1);
  -[AAUIAchievementsDataProvider _achievementsRespectingOverrideDisplayState:](self, "_achievementsRespectingOverrideDisplayState:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[AAUIAchievementsDataProvider achievementsDataQueue](self, "achievementsDataQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__AAUIAchievementsDataProvider__handleUpdatedAchievements___block_invoke;
  v8[3] = &unk_24E0B2E08;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

- (void)setDidFinishInitialLoad:(BOOL)a3
{
  NSObject *observerQueue;
  _QWORD v4[5];
  BOOL v5;

  observerQueue = self->_observerQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__AAUIAchievementsDataProvider_setDidFinishInitialLoad___block_invoke;
  v4[3] = &unk_24E0B2E50;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(observerQueue, v4);
}

- (OS_dispatch_queue)achievementsDataQueue
{
  return self->_achievementsDataQueue;
}

- (id)_achievementsRespectingOverrideDisplayState:(id)a3
{
  id v4;
  char v5;
  int64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  uint64_t v35;
  id v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = ACHShouldUseNewAwardsSystem();
  v6 = -[AAUIAchievementsDataProvider overrideDisplayState](self, "overrideDisplayState");
  if (v6 == 2)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v26 = v4;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v27)
    {
      v28 = v27;
      v29 = v4;
      v30 = *(_QWORD *)v40;
      v31 = MEMORY[0x24BDBD1A8];
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v40 != v30)
            objc_enumerationMutation(v26);
          v33 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          if ((v5 & 1) != 0)
            objc_msgSend(v33, "shallowCopyWithRelevantEarnedInstance:", 0);
          else
            objc_msgSend(v33, "shallowCopyReplacingEarnedInstances:", v31);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v34);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
      }
      while (v28);
      v4 = v29;
    }
    goto LABEL_27;
  }
  if (v6 == 1)
  {
    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v4;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v8)
    {
      v9 = v8;
      v37 = v4;
      v10 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v9; ++j)
        {
          if (*(_QWORD *)v44 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
          v13 = objc_alloc_init(MEMORY[0x24BE01830]);
          objc_msgSend(v12, "template");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "canonicalUnit");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v16 = (void *)MEMORY[0x24BDD3E50];
            objc_msgSend(v12, "template");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "canonicalUnit");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "quantityWithUnit:doubleValue:", v18, 20.0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v13, "setValue:", v19);
          }
          ACHDateComponentsForYearMonthDay();
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setEarnedDateComponents:", v20);

          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setCreatedDate:", v21);

          objc_msgSend(v13, "setCreatorDevice:", 2);
          objc_msgSend(v12, "template");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "uniqueName");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setTemplateUniqueName:", v23);

          if ((v5 & 1) != 0)
          {
            objc_msgSend(v12, "shallowCopyWithRelevantEarnedInstance:", v13);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v48 = v13;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v48, 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "shallowCopyReplacingEarnedInstances:", v25);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v7, "addObject:", v24, v37);

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v9);
      v4 = v37;
    }
LABEL_27:

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
    v35 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v35;
  }
  return v4;
}

- (int64_t)overrideDisplayState
{
  return self->_overrideDisplayState;
}

- (AAUIAchievementsDataProvider)initWithHealthStore:(id)a3 layoutMode:(unint64_t)a4
{
  id v7;
  AAUIAchievementsDataProvider *v8;
  AAUIAchievementsDataProvider *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *achievementsBySection;
  NSMutableArray *v12;
  NSMutableArray *recentAchievements;
  NSMutableArray *v14;
  NSMutableArray *relevantAchievements;
  NSMutableDictionary *v16;
  NSMutableDictionary *filteredAchievementsByTemplateUniqueName;
  NSMutableDictionary *v18;
  NSMutableDictionary *achievementsByTemplateUniqueName;
  NSMutableDictionary *v20;
  NSMutableDictionary *achievementsByEarnedDateComponents;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSArray *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSArray *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSArray *orderedSections;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  NSArray *orderedMainSectionHeaderStrings;
  uint64_t v58;
  NSArray *orderedRecentAndRelevantHeaderStrings;
  ACHVisibilityEvaluator *v60;
  ACHVisibilityEvaluator *visibilityEvaluator;
  uint64_t v62;
  OS_dispatch_queue *achievementsDataQueue;
  uint64_t v64;
  OS_dispatch_queue *observerQueue;
  void *v66;
  CFIndex AppIntegerValue;
  uint64_t v68;
  NSHashTable *initialLoadObservers;
  uint64_t v70;
  NSHashTable *recentAndRelevantSectionObservers;
  uint64_t v72;
  NSHashTable *mainSectionObservers;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  objc_super v96;
  void *v97;
  _QWORD v98[8];
  _QWORD v99[2];
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  _QWORD v107[8];
  _QWORD v108[2];
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;

  v115 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v96.receiver = self;
  v96.super_class = (Class)AAUIAchievementsDataProvider;
  v8 = -[AAUIAchievementsDataProvider init](&v96, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_healthStore, a3);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    achievementsBySection = v9->_achievementsBySection;
    v9->_achievementsBySection = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    recentAchievements = v9->_recentAchievements;
    v9->_recentAchievements = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    relevantAchievements = v9->_relevantAchievements;
    v9->_relevantAchievements = v14;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    filteredAchievementsByTemplateUniqueName = v9->_filteredAchievementsByTemplateUniqueName;
    v9->_filteredAchievementsByTemplateUniqueName = v16;

    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    achievementsByTemplateUniqueName = v9->_achievementsByTemplateUniqueName;
    v9->_achievementsByTemplateUniqueName = v18;

    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    achievementsByEarnedDateComponents = v9->_achievementsByEarnedDateComponents;
    v9->_achievementsByEarnedDateComponents = v20;

    -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_achievementsBySection, "setObject:forKeyedSubscript:", v9->_relevantAchievements, CFSTR("GO_FOR_IT"));
    if (a4 == 1)
    {
      v95 = v7;
      v99[0] = CFSTR("RECENT");
      v99[1] = CFSTR("CURRENT_MONTHLY_CHALLENGE");
      v43 = *MEMORY[0x24BE011F8];
      v100 = *MEMORY[0x24BE011E8];
      v42 = v100;
      v101 = v43;
      v44 = *MEMORY[0x24BE01208];
      v102 = *MEMORY[0x24BE01200];
      v103 = v44;
      v78 = *MEMORY[0x24BE011F0];
      v104 = *MEMORY[0x24BE01210];
      v45 = v104;
      v105 = v78;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v99, 8);
      v46 = objc_claimAutoreleasedReturnValue();
      orderedSections = v9->_orderedSections;
      v9->_orderedSections = (NSArray *)v46;

      v98[0] = &stru_24E0B4958;
      v98[1] = &stru_24E0B4958;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "localizedStringForKey:value:table:", v42, &stru_24E0B4958);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "localizedUppercaseString");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v98[2] = v90;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "localizedStringForKey:value:table:", v43, &stru_24E0B4958, CFSTR("Localizable"));
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "localizedUppercaseString");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v98[3] = v84;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "localizedStringForKey:value:table:", CFSTR("LIMITED_EDITION_WATCH"), &stru_24E0B4958, CFSTR("Localizable"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "localizedUppercaseString");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v98[4] = v76;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "localizedStringForKey:value:table:", v44, &stru_24E0B4958, CFSTR("Localizable"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "localizedUppercaseString");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v98[5] = v49;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "localizedStringForKey:value:table:", v45, &stru_24E0B4958, CFSTR("Localizable"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "localizedUppercaseString");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v98[6] = v52;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "localizedStringForKey:value:table:", v78, &stru_24E0B4958, CFSTR("Localizable"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "localizedUppercaseString");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v98[7] = v55;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v98, 8);
      v56 = objc_claimAutoreleasedReturnValue();
      orderedMainSectionHeaderStrings = v9->_orderedMainSectionHeaderStrings;
      v9->_orderedMainSectionHeaderStrings = (NSArray *)v56;

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("RECENT"), &stru_24E0B4958, CFSTR("Localizable"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedUppercaseString");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = v41;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v97, 1);
      v58 = objc_claimAutoreleasedReturnValue();
      orderedRecentAndRelevantHeaderStrings = v9->_orderedRecentAndRelevantHeaderStrings;
      v9->_orderedRecentAndRelevantHeaderStrings = (NSArray *)v58;

    }
    else
    {
      if (a4)
      {
LABEL_7:
        v60 = (ACHVisibilityEvaluator *)objc_alloc_init(MEMORY[0x24BE01858]);
        visibilityEvaluator = v9->_visibilityEvaluator;
        v9->_visibilityEvaluator = v60;

        HKCreateSerialDispatchQueueWithQOSClass();
        v62 = objc_claimAutoreleasedReturnValue();
        achievementsDataQueue = v9->_achievementsDataQueue;
        v9->_achievementsDataQueue = (OS_dispatch_queue *)v62;

        HKCreateSerialDispatchQueueWithQOSClass();
        v64 = objc_claimAutoreleasedReturnValue();
        observerQueue = v9->_observerQueue;
        v9->_observerQueue = (OS_dispatch_queue *)v64;

        objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("ACHAchievementDisplayOverrideState"), (CFStringRef)objc_msgSend(v66, "bundleIdentifier"), 0);

        v9->_overrideDisplayState = AppIntegerValue;
        v9->_queryRetryDelay = 0.1;
        v9->_modelLock._os_unfair_lock_opaque = 0;
        objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
        v68 = objc_claimAutoreleasedReturnValue();
        initialLoadObservers = v9->_initialLoadObservers;
        v9->_initialLoadObservers = (NSHashTable *)v68;

        objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
        v70 = objc_claimAutoreleasedReturnValue();
        recentAndRelevantSectionObservers = v9->_recentAndRelevantSectionObservers;
        v9->_recentAndRelevantSectionObservers = (NSHashTable *)v70;

        objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
        v72 = objc_claimAutoreleasedReturnValue();
        mainSectionObservers = v9->_mainSectionObservers;
        v9->_mainSectionObservers = (NSHashTable *)v72;

        goto LABEL_8;
      }
      v95 = v7;
      v108[0] = CFSTR("RECENT");
      v108[1] = CFSTR("GO_FOR_IT");
      v23 = *MEMORY[0x24BE011F8];
      v109 = *MEMORY[0x24BE011E8];
      v22 = v109;
      v110 = v23;
      v25 = *MEMORY[0x24BE01208];
      v111 = *MEMORY[0x24BE01200];
      v24 = v111;
      v112 = v25;
      v87 = *MEMORY[0x24BE011F0];
      v26 = *MEMORY[0x24BE011F0];
      v113 = *MEMORY[0x24BE01210];
      v81 = v113;
      v114 = v26;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v108, 8);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v9->_orderedSections;
      v9->_orderedSections = (NSArray *)v27;

      v107[0] = &stru_24E0B4958;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "localizedStringForKey:value:table:", CFSTR("GO_FOR_IT"), &stru_24E0B4958);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v107[1] = v91;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "localizedStringForKey:value:table:", v22, &stru_24E0B4958, CFSTR("Localizable"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v107[2] = v85;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "localizedStringForKey:value:table:", v23, &stru_24E0B4958, CFSTR("Localizable"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v107[3] = v79;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "localizedStringForKey:value:table:", v24, &stru_24E0B4958, CFSTR("Localizable"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v107[4] = v29;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", v25, &stru_24E0B4958, CFSTR("Localizable"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v107[5] = v31;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringForKey:value:table:", v81, &stru_24E0B4958, CFSTR("Localizable"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v107[6] = v33;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringForKey:value:table:", v87, &stru_24E0B4958, CFSTR("Localizable"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v107[7] = v35;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v107, 8);
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = v9->_orderedMainSectionHeaderStrings;
      v9->_orderedMainSectionHeaderStrings = (NSArray *)v36;

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR("RECENT"), &stru_24E0B4958, CFSTR("Localizable"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = v39;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v106, 1);
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = v9->_orderedRecentAndRelevantHeaderStrings;
      v9->_orderedRecentAndRelevantHeaderStrings = (NSArray *)v40;
    }

    v7 = v95;
    goto LABEL_7;
  }
LABEL_8:

  return v9;
}

- (double)queryRetryDelay
{
  double result;

  result = fmin(self->_queryRetryDelay + 0.2, 5.0);
  self->_queryRetryDelay = result;
  return result;
}

void __43__AAUIAchievementsDataProvider_awardsQuery__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleDeletedAchievements:", v4);

}

- (ACHQuery)query
{
  ACHQuery *query;
  uint64_t v4;
  void *v5;
  void *v6;
  ACHQuery *v7;
  ACHQuery *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD aBlock[4];
  id v15;
  id location;

  query = self->_query;
  if (!query)
  {
    objc_initWeak(&location, self);
    v4 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __37__AAUIAchievementsDataProvider_query__block_invoke;
    aBlock[3] = &unk_24E0B2D90;
    objc_copyWeak(&v15, &location);
    v5 = _Block_copy(aBlock);
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __37__AAUIAchievementsDataProvider_query__block_invoke_2;
    v12[3] = &unk_24E0B2D90;
    objc_copyWeak(&v13, &location);
    v6 = _Block_copy(v12);
    v7 = (ACHQuery *)objc_msgSend(objc_alloc(MEMORY[0x24BE01840]), "initWithInitialAchievementsHandler:newAchievementsHandler:updatedAchievementsHandler:removedAchievementsHandler:", v5, v5, v5, v6);
    v8 = self->_query;
    self->_query = v7;

    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __37__AAUIAchievementsDataProvider_query__block_invoke_3;
    v10[3] = &unk_24E0B2DE0;
    objc_copyWeak(&v11, &location);
    -[ACHQuery setErrorHandler:](self->_query, "setErrorHandler:", v10);
    objc_destroyWeak(&v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    query = self->_query;
  }
  return query;
}

void __37__AAUIAchievementsDataProvider_query__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleUpdatedAchievements:", v3);

}

void __37__AAUIAchievementsDataProvider_query__block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleDeletedAchievements:", v3);

}

void __37__AAUIAchievementsDataProvider_query__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id *v5;
  id WeakRetained;
  double v7;
  dispatch_time_t v8;
  _QWORD block[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  ACHLogDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v3;
    _os_log_impl(&dword_21CC08000, v4, OS_LOG_TYPE_DEFAULT, "Restarting query due to error... : %@", buf, 0xCu);
  }

  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v5);
  v7 = (double)objc_msgSend(WeakRetained, "queryRetryCount");

  v8 = dispatch_time(0, (uint64_t)(v7 * 1000000000.0));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__AAUIAchievementsDataProvider_query__block_invoke_284;
  block[3] = &unk_24E0B2DB8;
  objc_copyWeak(&v10, v5);
  dispatch_after(v8, MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v10);

}

void __37__AAUIAchievementsDataProvider_query__block_invoke_284(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cycleQuery");

}

- (void)cycleQuery
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21CC08000, log, OS_LOG_TYPE_ERROR, "Max query retry count reached. This is fatal. We're giving up now.", v1, 2u);
}

- (void)addInitialLoadObserver:(id)a3
{
  id v4;
  NSObject *observerQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__AAUIAchievementsDataProvider_addInitialLoadObserver___block_invoke;
  block[3] = &unk_24E0B2E08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(observerQueue, block);

}

uint64_t __55__AAUIAchievementsDataProvider_addInitialLoadObserver___block_invoke(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "didFinishInitialLoad"))
    objc_msgSend(*(id *)(a1 + 40), "achievementsDataProviderDidFinishInitialLoad:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeInitialLoadObserver:(id)a3
{
  id v4;
  NSObject *observerQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__AAUIAchievementsDataProvider_removeInitialLoadObserver___block_invoke;
  block[3] = &unk_24E0B2E08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(observerQueue, block);

}

uint64_t __58__AAUIAchievementsDataProvider_removeInitialLoadObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)addRecentAndRelevantSectionObserver:(id)a3
{
  id v4;
  NSObject *observerQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__AAUIAchievementsDataProvider_addRecentAndRelevantSectionObserver___block_invoke;
  block[3] = &unk_24E0B2E08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(observerQueue, block);

}

uint64_t __68__AAUIAchievementsDataProvider_addRecentAndRelevantSectionObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeRecentAndRelevantSectionObserver:(id)a3
{
  id v4;
  NSObject *observerQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__AAUIAchievementsDataProvider_removeRecentAndRelevantSectionObserver___block_invoke;
  block[3] = &unk_24E0B2E08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(observerQueue, block);

}

uint64_t __71__AAUIAchievementsDataProvider_removeRecentAndRelevantSectionObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 232), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)addMainSectionObserver:(id)a3
{
  id v4;
  NSObject *observerQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__AAUIAchievementsDataProvider_addMainSectionObserver___block_invoke;
  block[3] = &unk_24E0B2E08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(observerQueue, block);

}

uint64_t __55__AAUIAchievementsDataProvider_addMainSectionObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeMainSectionObserver:(id)a3
{
  id v4;
  NSObject *observerQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__AAUIAchievementsDataProvider_removeMainSectionObserver___block_invoke;
  block[3] = &unk_24E0B2E08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(observerQueue, block);

}

uint64_t __58__AAUIAchievementsDataProvider_removeMainSectionObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)stopFetching
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (ACHShouldUseNewAwardsSystem())
  {
    -[AAUIAchievementsDataProvider awardsQuery](self, "awardsQuery");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deactivate");
    v4 = 32;
  }
  else
  {
    -[AAUIAchievementsDataProvider healthStore](self, "healthStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AAUIAchievementsDataProvider query](self, "query");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stopQuery:", v5);

    v4 = 24;
  }

  v6 = *(Class *)((char *)&self->super.isa + v4);
  *(Class *)((char *)&self->super.isa + v4) = 0;

}

- (id)headerStringForSection:(int64_t)a3 isRecentAndRelevant:(BOOL)a4
{
  void *v5;
  void *v6;

  if (a4)
    -[AAUIAchievementsDataProvider orderedRecentAndRelevantHeaderStrings](self, "orderedRecentAndRelevantHeaderStrings");
  else
    -[AAUIAchievementsDataProvider orderedMainSectionHeaderStrings](self, "orderedMainSectionHeaderStrings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)numberOfRecentAndRelevantSections
{
  return 1;
}

- (int64_t)numberOfItemsInRecentAndRelevantSection:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[AAUIAchievementsDataProvider clientRecentAchievements](self, "clientRecentAchievements", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)recentAndRelevantAchievementAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[AAUIAchievementsDataProvider clientRecentAchievements](self, "clientRecentAchievements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");

  objc_msgSend(v5, "objectAtIndexedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)numberOfSections
{
  void *v2;
  int64_t v3;

  -[AAUIAchievementsDataProvider orderedSections](self, "orderedSections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v11;
  int64_t v12;

  if (a3)
  {
    -[AAUIAchievementsDataProvider orderedSections](self, "orderedSections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[AAUIAchievementsDataProvider clientAchievementsBySection](self, "clientAchievementsBySection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "count");
    return v9;
  }
  else
  {
    -[AAUIAchievementsDataProvider clientRecentAchievements](self, "clientRecentAchievements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count") != 0;

    return v12;
  }
}

- (id)achievementAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[AAUIAchievementsDataProvider orderedSections](self, "orderedSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[AAUIAchievementsDataProvider clientAchievementsBySection](self, "clientAchievementsBySection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v4, "item");
  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)trophyCaseAchievementForTemplateUniqueName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[AAUIAchievementsDataProvider clientFilteredAchievementsByTemplateUniqueName](self, "clientFilteredAchievementsByTemplateUniqueName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)achievementForTemplateUniqueName:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[AAUIAchievementsDataProvider clientAchievementsByTemplateUniqueName](self, "clientAchievementsByTemplateUniqueName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)achievementsForDateComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[AAUIAchievementsDataProvider clientAchievementsByEarnedDateComponents](self, "clientAchievementsByEarnedDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  v8 = v7;

  return v8;
}

- (NSMutableArray)allAchievementsSortedByEarnedDate
{
  void *v3;
  void *v4;
  NSMutableArray *v5;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[AAUIAchievementsDataProvider clientAllAchievementsSortedByEarnedDate](self, "clientAllAchievementsSortedByEarnedDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x24BDBD1A8];
  v5 = v3;

  return v5;
}

- (void)_handleDeletedAchievements:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[AAUIAchievementsDataProvider achievementsDataQueue](self, "achievementsDataQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__AAUIAchievementsDataProvider__handleDeletedAchievements___block_invoke;
  v7[3] = &unk_24E0B2E08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __59__AAUIAchievementsDataProvider__handleDeletedAchievements___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v2);
        v9 = objc_msgSend(*(id *)(a1 + 32), "_deleteAchievement:fromUnfiltered:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8), 1, (_QWORD)v10);
        v6 |= (v9 >> 3) & 1;
        v5 |= (v9 >> 2) & 1;
        ++v8;
      }
      while (v4 != v8);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
    if (((v5 | v6) & 1) != 0)
      objc_msgSend(*(id *)(a1 + 32), "_reload");
  }
  else
  {

    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 12));
  }
}

- (id)_oldestRecentAchievement
{
  void *v3;
  char v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  char v15;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = ACHShouldUseNewAwardsSystem();
  -[AAUIAchievementsDataProvider recentAchievements](self, "recentAchievements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __56__AAUIAchievementsDataProvider__oldestRecentAchievement__block_invoke;
  v13 = &unk_24E0B2EC0;
  v15 = v4;
  v14 = v3;
  v6 = v3;
  objc_msgSend(v5, "sortedArrayUsingComparator:", &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject", v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __56__AAUIAchievementsDataProvider__oldestRecentAchievement__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
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
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v5, "relevantEarnedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "earnedInstances");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(v6, "relevantEarnedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "earnedInstances");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v7, "earnedDateComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateFromComponents:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *(void **)(a1 + 32);
  objc_msgSend(v9, "earnedDateComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dateFromComponents:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v13, "compare:", v16);
  return v17;
}

- (BOOL)_remoteAchievementBelongsInRelevants:(id)a3
{
  void *v3;
  id v4;
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
  void *v16;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "template");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "availabilityStart");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startOfDayForDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "template");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "availabilityEnd");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromComponents:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, 1, v12, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startOfDayForDate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v9, v14);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = objc_msgSend(v15, "containsDate:", v16);

  return (char)v12;
}

- (BOOL)_monthlyChallengeBelongsInRelevants:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char IsEarnable;

  v3 = (void *)MEMORY[0x24BDBCE60];
  v4 = a3;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IsEarnable = AAUIMonthlyChallengeIsEarnable(v4, v5);

  return IsEarnable;
}

- (void)_updateAchievementsByEarnedDateComponentsWithAchievement:(id)a3 earnedInstance:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  -[AAUIAchievementsDataProvider achievementsByEarnedDateComponents](self, "achievementsByEarnedDateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "earnedDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
    v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "template");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "uniqueName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  AAUIAchievementInArrayWithUniqueName(v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    goto LABEL_6;
  if (AAUICompareAchievementsByMostRecentEarnedDate(v13, v16) != 1)
  {
    objc_msgSend(v9, "removeObject:", v13);
LABEL_6:
    objc_msgSend(v9, "addObject:", v16);
  }
  -[AAUIAchievementsDataProvider achievementsByEarnedDateComponents](self, "achievementsByEarnedDateComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "earnedDateComponents");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, v15);

}

- (void)_deleteAchievementsByEarnedDateWithAchievement:(id)a3 earnedInstance:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[AAUIAchievementsDataProvider achievementsByEarnedDateComponents](self, "achievementsByEarnedDateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "earnedDateComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v9, "removeObject:", v10);

}

- (id)_recentAndRelevantSectionIndexPathForAchievement:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[AAUIAchievementsDataProvider recentAchievements](self, "recentAchievements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (id)_mainSectionIndexPathForAchievement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "section");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIAchievementsDataProvider orderedSections](self, "orderedSections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v5);

  -[AAUIAchievementsDataProvider achievementsBySection](self, "achievementsBySection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "indexOfObject:", v4);
  v11 = 0;
  if (v7 != 0x7FFFFFFFFFFFFFFFLL && v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v10, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (void)setAwardsQuery:(id)a3
{
  objc_storeStrong((id *)&self->_awardsQuery, a3);
}

- (void)setVisibilityEvaluator:(id)a3
{
  objc_storeStrong((id *)&self->_visibilityEvaluator, a3);
}

- (void)setAchievementsBySection:(id)a3
{
  objc_storeStrong((id *)&self->_achievementsBySection, a3);
}

- (void)setRecentAchievements:(id)a3
{
  objc_storeStrong((id *)&self->_recentAchievements, a3);
}

- (void)setRelevantAchievements:(id)a3
{
  objc_storeStrong((id *)&self->_relevantAchievements, a3);
}

- (void)setFilteredAchievementsByTemplateUniqueName:(id)a3
{
  objc_storeStrong((id *)&self->_filteredAchievementsByTemplateUniqueName, a3);
}

- (void)setAchievementsByTemplateUniqueName:(id)a3
{
  objc_storeStrong((id *)&self->_achievementsByTemplateUniqueName, a3);
}

- (void)setAchievementsByEarnedDateComponents:(id)a3
{
  objc_storeStrong((id *)&self->_achievementsByEarnedDateComponents, a3);
}

- (NSArray)orderedSections
{
  return self->_orderedSections;
}

- (void)setOrderedSections:(id)a3
{
  objc_storeStrong((id *)&self->_orderedSections, a3);
}

- (NSArray)orderedMainSectionHeaderStrings
{
  return self->_orderedMainSectionHeaderStrings;
}

- (void)setOrderedMainSectionHeaderStrings:(id)a3
{
  objc_storeStrong((id *)&self->_orderedMainSectionHeaderStrings, a3);
}

- (NSArray)orderedRecentAndRelevantHeaderStrings
{
  return self->_orderedRecentAndRelevantHeaderStrings;
}

- (void)setOrderedRecentAndRelevantHeaderStrings:(id)a3
{
  objc_storeStrong((id *)&self->_orderedRecentAndRelevantHeaderStrings, a3);
}

- (NSDictionary)clientAchievementsBySection
{
  return self->_clientAchievementsBySection;
}

- (NSArray)clientAllAchievementsSortedByEarnedDate
{
  return self->_clientAllAchievementsSortedByEarnedDate;
}

- (NSArray)clientRecentAchievements
{
  return self->_clientRecentAchievements;
}

- (NSArray)clientRelevantAchievements
{
  return self->_clientRelevantAchievements;
}

- (NSDictionary)clientFilteredAchievementsByTemplateUniqueName
{
  return self->_clientFilteredAchievementsByTemplateUniqueName;
}

- (NSDictionary)clientAchievementsByTemplateUniqueName
{
  return self->_clientAchievementsByTemplateUniqueName;
}

- (NSDictionary)clientAchievementsByEarnedDateComponents
{
  return self->_clientAchievementsByEarnedDateComponents;
}

- (BOOL)didFinishInitialLoad
{
  return self->_didFinishInitialLoad;
}

- (void)setAchievementsDataQueue:(id)a3
{
  objc_storeStrong((id *)&self->_achievementsDataQueue, a3);
}

- (OS_dispatch_queue)observerQueue
{
  return self->_observerQueue;
}

- (void)setObserverQueue:(id)a3
{
  objc_storeStrong((id *)&self->_observerQueue, a3);
}

- (void)setOverrideDisplayState:(int64_t)a3
{
  self->_overrideDisplayState = a3;
}

- (void)setQueryRetryDelay:(double)a3
{
  self->_queryRetryDelay = a3;
}

- (int64_t)queryRetryCount
{
  return self->_queryRetryCount;
}

- (void)setQueryRetryCount:(int64_t)a3
{
  self->_queryRetryCount = a3;
}

- (os_unfair_lock_s)modelLock
{
  return self->_modelLock;
}

- (void)setModelLock:(os_unfair_lock_s)a3
{
  self->_modelLock = a3;
}

- (NSHashTable)initialLoadObservers
{
  return self->_initialLoadObservers;
}

- (void)setInitialLoadObservers:(id)a3
{
  objc_storeStrong((id *)&self->_initialLoadObservers, a3);
}

- (NSHashTable)recentAndRelevantSectionObservers
{
  return self->_recentAndRelevantSectionObservers;
}

- (void)setRecentAndRelevantSectionObservers:(id)a3
{
  objc_storeStrong((id *)&self->_recentAndRelevantSectionObservers, a3);
}

- (NSHashTable)mainSectionObservers
{
  return self->_mainSectionObservers;
}

- (void)setMainSectionObservers:(id)a3
{
  objc_storeStrong((id *)&self->_mainSectionObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainSectionObservers, 0);
  objc_storeStrong((id *)&self->_recentAndRelevantSectionObservers, 0);
  objc_storeStrong((id *)&self->_initialLoadObservers, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_achievementsDataQueue, 0);
  objc_storeStrong((id *)&self->_clientAchievementsByEarnedDateComponents, 0);
  objc_storeStrong((id *)&self->_clientAchievementsByTemplateUniqueName, 0);
  objc_storeStrong((id *)&self->_clientFilteredAchievementsByTemplateUniqueName, 0);
  objc_storeStrong((id *)&self->_clientRelevantAchievements, 0);
  objc_storeStrong((id *)&self->_clientRecentAchievements, 0);
  objc_storeStrong((id *)&self->_clientAllAchievementsSortedByEarnedDate, 0);
  objc_storeStrong((id *)&self->_clientAchievementsBySection, 0);
  objc_storeStrong((id *)&self->_orderedRecentAndRelevantHeaderStrings, 0);
  objc_storeStrong((id *)&self->_orderedMainSectionHeaderStrings, 0);
  objc_storeStrong((id *)&self->_orderedSections, 0);
  objc_storeStrong((id *)&self->_allAchievementsSortedByEarnedDate, 0);
  objc_storeStrong((id *)&self->_achievementsByEarnedDateComponents, 0);
  objc_storeStrong((id *)&self->_achievementsByTemplateUniqueName, 0);
  objc_storeStrong((id *)&self->_filteredAchievementsByTemplateUniqueName, 0);
  objc_storeStrong((id *)&self->_relevantAchievements, 0);
  objc_storeStrong((id *)&self->_recentAchievements, 0);
  objc_storeStrong((id *)&self->_achievementsBySection, 0);
  objc_storeStrong((id *)&self->_visibilityEvaluator, 0);
  objc_storeStrong((id *)&self->_awardsQuery, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __59__AAUIAchievementsDataProvider__handleUpdatedAchievements___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0(&dword_21CC08000, v0, v1, "Error reading activity move mode characteristic while updating achievements. error=%@", v2);
}

@end
