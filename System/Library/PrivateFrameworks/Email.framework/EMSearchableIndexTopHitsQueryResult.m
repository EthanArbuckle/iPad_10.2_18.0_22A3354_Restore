@implementation EMSearchableIndexTopHitsQueryResult

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__EMSearchableIndexTopHitsQueryResult_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_37 != -1)
    dispatch_once(&log_onceToken_37, block);
  return (id)log_log_37;
}

void __42__EMSearchableIndexTopHitsQueryResult_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_37;
  log_log_37 = (uint64_t)v1;

}

- (EMSearchableIndexTopHitsQueryResult)initWithTopHitSearchQuery:(id)a3 foundItems:(id)a4 foundMatchingHintsByPersistentID:(id)a5
{
  id v9;
  id v10;
  id v11;
  EMSearchableIndexTopHitsQueryResult *v12;
  EMSearchableIndexTopHitsQueryResult *v13;
  uint64_t v14;
  NSArray *foundItems;
  uint64_t v16;
  NSDictionary *foundMatchingHintsByPersistentID;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)EMSearchableIndexTopHitsQueryResult;
  v12 = -[EMSearchableIndexTopHitsQueryResult init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_topHitSearchQuery, a3);
    v14 = objc_msgSend(v10, "copy");
    foundItems = v13->_foundItems;
    v13->_foundItems = (NSArray *)v14;

    v16 = objc_msgSend(v11, "copy");
    foundMatchingHintsByPersistentID = v13->_foundMatchingHintsByPersistentID;
    v13->_foundMatchingHintsByPersistentID = (NSDictionary *)v16;

  }
  return v13;
}

- (NSArray)searchableItemIdentifiers
{
  void *v2;
  NSArray *searchableItemIdentifiers;
  NSArray *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  NSDictionary *matchingHintsByPersistentID;
  NSArray *v18;
  uint64_t v20;
  uint64_t v21;
  __CFString *v22;
  EMSearchableIndexTopHitsQueryResult *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  __CFString *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  searchableItemIdentifiers = self->_searchableItemIdentifiers;
  if (!searchableItemIdentifiers)
  {
    v23 = self;
    v5 = (NSArray *)objc_opt_new();
    v6 = (void *)objc_opt_new();
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[EMSearchableIndexTopHitsQueryResult foundItems](v23, "foundItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          +[EMSearchableIndex persistentIDForSearchableItem:](EMSearchableIndex, "persistentIDForSearchableItem:", v11);
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          if (v2)
          {
            -[NSArray addObject:](v5, "addObject:", v2);
            objc_msgSend(v11, "attributeSet");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "matchingHints");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, v2);

          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v8);
    }

    if (_os_feature_enabled_impl())
    {
      objc_msgSend(v6, "allValues");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[EMSearchableIndexTopHitsQueryResult log](EMSearchableIndexTopHitsQueryResult, "log");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v20 = objc_msgSend(v14, "count");
        v21 = objc_msgSend(v14, "count");
        if (v21)
        {
          objc_msgSend(v14, "firstObject");
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          +[EMCSLoggingAdditions publicDescriptionForSnippetHintsArray:](EMCSLoggingAdditions, "publicDescriptionForSnippetHintsArray:", v2);
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = CFSTR("No values found.");
        }
        *(_DWORD *)buf = 134218242;
        v29 = v20;
        v30 = 2112;
        v31 = v22;
        _os_log_debug_impl(&dword_1B99BB000, v15, OS_LOG_TYPE_DEBUG, "Top hits query collected %lu snippet hints: %@", buf, 0x16u);
        if (v21)
        {

        }
      }

    }
    v16 = objc_msgSend(v6, "copy");
    matchingHintsByPersistentID = v23->_matchingHintsByPersistentID;
    v23->_matchingHintsByPersistentID = (NSDictionary *)v16;

    v18 = v23->_searchableItemIdentifiers;
    v23->_searchableItemIdentifiers = v5;

    searchableItemIdentifiers = v23->_searchableItemIdentifiers;
  }
  return searchableItemIdentifiers;
}

- (NSDictionary)mailRankingSignalsByPersistentID
{
  NSDictionary *mailRankingSignalsByPersistentID;
  NSDictionary *v3;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  float v16;
  float v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  int v47;
  int v48;
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t j;
  unint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  id *p_mailRankingSignalsByPersistentID;
  NSDictionary *v63;
  uint64_t v65;
  id obj;
  uint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  uint64_t i;
  id v74;
  uint64_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[5];
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  mailRankingSignalsByPersistentID = self->_mailRankingSignalsByPersistentID;
  if (mailRankingSignalsByPersistentID)
  {
    v3 = mailRankingSignalsByPersistentID;
  }
  else
  {
    v68 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v83 = 0u;
    -[EMSearchableIndexTopHitsQueryResult foundItems](self, "foundItems");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
    if (v70)
    {
      v69 = *(_QWORD *)v81;
      v67 = *MEMORY[0x1E0CA6A90];
      v65 = *MEMORY[0x1E0CA6A60];
      do
      {
        for (i = 0; i != v70; ++i)
        {
          if (*(_QWORD *)v81 != v69)
            objc_enumerationMutation(obj);
          v5 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
          +[EMSearchableIndex persistentIDForSearchableItem:](EMSearchableIndex, "persistentIDForSearchableItem:", v5);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          if (v72)
          {
            v85 = 0;
            v86 = &v85;
            v87 = 0x2050000000;
            v6 = (void *)getSFMailRankingSignalsClass_softClass;
            v88 = getSFMailRankingSignalsClass_softClass;
            if (!getSFMailRankingSignalsClass_softClass)
            {
              v84[0] = MEMORY[0x1E0C809B0];
              v84[1] = 3221225472;
              v84[2] = __getSFMailRankingSignalsClass_block_invoke;
              v84[3] = &unk_1E70F5D48;
              v84[4] = &v85;
              __getSFMailRankingSignalsClass_block_invoke((uint64_t)v84);
              v6 = (void *)v86[3];
            }
            v7 = objc_retainAutorelease(v6);
            _Block_object_dispose(&v85, 8);
            v74 = objc_alloc_init(v7);
            objc_msgSend(v5, "attributeSet");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "attributeDictionary");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "valueForKey:", v67);
            v71 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v74, "setIsSemanticMatch:", ((unint64_t)objc_msgSend(v71, "integerValue") >> 1) & 1);
            objc_msgSend(v74, "setIsSyntacticMatch:", objc_msgSend(v71, "integerValue") & 1);
            if (objc_msgSend(v74, "isSemanticMatch"))
            {
              objc_msgSend(v5, "attributeSet");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "attributeDictionary");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "valueForKey:", v65);
              v12 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v12, "count") == 3)
              {
                objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();

                if ((isKindOfClass & 1) != 0)
                {
                  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "floatValue");
                  v17 = v16;

                  if (v17 >= 0.0 && v17 <= 4.0)
                  {
                    *(float *)&v18 = (float)(v17 * -0.5) + 1.0;
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v18);
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v74, "setSemanticScore:", v19);

                  }
                }
              }

            }
            v20 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v5, "attributeSet");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "mailResultScoreL1");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "doubleValue");
            objc_msgSend(v20, "numberWithDouble:");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "setSyntacticScore:", v23);

            objc_msgSend(v5, "attributeSet");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "mailFlagged");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "setIsFlagged:", objc_msgSend(v25, "BOOLValue"));

            objc_msgSend(v5, "attributeSet");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "mailRepliedTo");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "setIsRepliedTo:", objc_msgSend(v27, "BOOLValue"));

            v28 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v5, "attributeSet");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "mailResultScoreL1");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "doubleValue");
            objc_msgSend(v28, "numberWithDouble:");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "setL1Score:", v31);

            v32 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v5, "attributeSet");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "mailResultScoreL2");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "doubleValue");
            objc_msgSend(v32, "numberWithDouble:");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "setL2Score:", v35);

            objc_msgSend(v5, "attributeSet");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "mailUseCount");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "setNumEngagements:", objc_msgSend(v37, "unsignedLongLongValue"));

            objc_msgSend(v5, "attributeSet");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "mailDateReceived");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "setDaysSinceReceipt:", -[EMSearchableIndexTopHitsQueryResult getDaysSinceTheDate:](self, "getDaysSinceTheDate:", v39));

            v40 = objc_alloc(MEMORY[0x1E0C99E20]);
            objc_msgSend(v5, "attributeSet");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "mailUsedDates");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = (void *)objc_msgSend(v40, "initWithCapacity:", objc_msgSend(v42, "count"));

            v78 = 0u;
            v79 = 0u;
            v76 = 0u;
            v77 = 0u;
            objc_msgSend(v5, "attributeSet");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "mailUsedDates");
            v45 = (void *)objc_claimAutoreleasedReturnValue();

            v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
            if (v46)
            {
              v47 = 0;
              v48 = 0;
              v75 = 0;
              v49 = *(_QWORD *)v77;
              v50 = -1.0;
              v51 = -1.0;
              v52 = -1.0;
              v53 = -1.0;
              do
              {
                for (j = 0; j != v46; ++j)
                {
                  if (*(_QWORD *)v77 != v49)
                    objc_enumerationMutation(v45);
                  v55 = -[EMSearchableIndexTopHitsQueryResult getDaysSinceTheDate:](self, "getDaysSinceTheDate:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * j));
                  if (v55 <= 0x1E)
                  {
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v55);
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v43, "addObject:", v56);

                    if (v55 > 6)
                    {
                      if (v55 > 0xD)
                      {
                        if (v55 > 0x14)
                        {
                          if (v55 <= 0x1D)
                          {
                            v53 = v53 + (double)v55 + 1.0;
                            LODWORD(v75) = v75 + 1;
                          }
                        }
                        else
                        {
                          v52 = v52 + (double)v55 + 1.0;
                          ++HIDWORD(v75);
                        }
                      }
                      else
                      {
                        v51 = v51 + (double)v55 + 1.0;
                        ++v48;
                      }
                    }
                    else
                    {
                      v50 = v50 + (double)v55 + 1.0;
                      ++v47;
                    }
                  }
                }
                v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v76, v89, 16);
              }
              while (v46);

              if (v47 >= 1)
                v50 = (v50 + 1.0) / (double)v47;
              if (v48 >= 1)
                v51 = (v51 + 1.0) / (double)v48;
              if (SHIDWORD(v75) >= 1)
                v52 = (v52 + 1.0) / (double)SHIDWORD(v75);
              if ((int)v75 >= 1)
                v53 = (v53 + 1.0) / (double)(int)v75;
            }
            else
            {

              v52 = -1.0;
              v50 = -1.0;
              v51 = -1.0;
              v53 = -1.0;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v50);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "setAverageEngagementAgeLast7Days:", v57);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v51);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "setAverageEngagementAgeLast14Days:", v58);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v52);
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "setAverageEngagementAgeLast21Days:", v59);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v53);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "setAverageEngagementAgeLast30Days:", v60);

            objc_msgSend(v74, "setNumDaysEngagedLast30Days:", objc_msgSend(v43, "count"));
            objc_msgSend(v68, "setObject:forKeyedSubscript:", v74, v72);

          }
        }
        v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v90, 16);
      }
      while (v70);
    }

    v61 = objc_msgSend(v68, "copy");
    v63 = self->_mailRankingSignalsByPersistentID;
    p_mailRankingSignalsByPersistentID = (id *)&self->_mailRankingSignalsByPersistentID;
    *p_mailRankingSignalsByPersistentID = (id)v61;

    v3 = (NSDictionary *)*p_mailRankingSignalsByPersistentID;
  }
  return v3;
}

- (unint64_t)getDaysSinceTheDate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeZone:", v4);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components:fromDate:toDate:options:", 16, v3, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "day") < 0)
      v8 = 0;
    else
      v8 = objc_msgSend(v7, "day");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)userDidInteractWithLibraryIdentifier:(id)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = -[EMSearchableIndexTopHitsQueryResult rankingIndexForMessageLibraryID:](self, "rankingIndexForMessageLibraryID:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[EMSearchableIndexTopHitsQueryResult topHitSearchQuery](self, "topHitSearchQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSearchableIndexTopHitsQueryResult foundItems](self, "foundItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userEngagedWithResult:interactionType:", v7, 0);

  }
}

- (int64_t)rankingIndexForMessageLibraryID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  -[EMSearchableIndexTopHitsQueryResult foundItems](self, "foundItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__EMSearchableIndexTopHitsQueryResult_rankingIndexForMessageLibraryID___block_invoke;
  v9[3] = &unk_1E70F5CF8;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __71__EMSearchableIndexTopHitsQueryResult_rankingIndexForMessageLibraryID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;

  objc_msgSend(a2, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)userDidInteractWithConversationID:(id)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = -[EMSearchableIndexTopHitsQueryResult rankingIndexForConversationID:](self, "rankingIndexForConversationID:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[EMSearchableIndexTopHitsQueryResult topHitSearchQuery](self, "topHitSearchQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSearchableIndexTopHitsQueryResult foundItems](self, "foundItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userEngagedWithResult:interactionType:", v7, 0);

  }
}

- (int64_t)rankingIndexForConversationID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0x7FFFFFFFFFFFFFFFLL;
  -[EMSearchableIndexTopHitsQueryResult foundItems](self, "foundItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__EMSearchableIndexTopHitsQueryResult_rankingIndexForConversationID___block_invoke;
  v9[3] = &unk_1E70F5CF8;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __69__EMSearchableIndexTopHitsQueryResult_rankingIndexForConversationID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;

  objc_msgSend(a2, "attributeSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mailConversationID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)setSearchableItemIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_searchableItemIdentifiers, a3);
}

- (NSDictionary)matchingHintsByPersistentID
{
  return self->_matchingHintsByPersistentID;
}

- (void)setMailRankingSignalsByPersistentID:(id)a3
{
  objc_storeStrong((id *)&self->_mailRankingSignalsByPersistentID, a3);
}

- (CSTopHitQuery)topHitSearchQuery
{
  return self->_topHitSearchQuery;
}

- (void)setTopHitSearchQuery:(id)a3
{
  objc_storeStrong((id *)&self->_topHitSearchQuery, a3);
}

- (NSArray)foundItems
{
  return self->_foundItems;
}

- (void)setFoundItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)foundMatchingHintsByPersistentID
{
  return self->_foundMatchingHintsByPersistentID;
}

- (void)setFoundMatchingHintsByPersistentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundMatchingHintsByPersistentID, 0);
  objc_storeStrong((id *)&self->_foundItems, 0);
  objc_storeStrong((id *)&self->_topHitSearchQuery, 0);
  objc_storeStrong((id *)&self->_mailRankingSignalsByPersistentID, 0);
  objc_storeStrong((id *)&self->_matchingHintsByPersistentID, 0);
  objc_storeStrong((id *)&self->_searchableItemIdentifiers, 0);
}

@end
