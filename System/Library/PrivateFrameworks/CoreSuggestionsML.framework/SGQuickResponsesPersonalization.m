@implementation SGQuickResponsesPersonalization

- (SGQuickResponsesPersonalization)init
{
  return -[SGQuickResponsesPersonalization initWithStore:withRng:](self, "initWithStore:withRng:", 0, 0);
}

- (SGQuickResponsesPersonalization)initWithStore:(id)a3 withRng:(id)a4
{
  id v6;
  id v7;
  SGQuickResponsesPersonalization *v8;
  SGQuickResponsesStore *v9;
  SGQuickResponsesStore *store;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SGQuickResponsesPersonalization;
  v8 = -[SGQuickResponsesPersonalization init](&v12, sel_init);
  if (v8)
  {
    if (v6)
    {
      v9 = (SGQuickResponsesStore *)v6;
    }
    else
    {
      +[SGQuickResponsesStore sharedInstance](SGQuickResponsesStore, "sharedInstance");
      v9 = (SGQuickResponsesStore *)objc_claimAutoreleasedReturnValue();
    }
    store = v8->_store;
    v8->_store = v9;

    objc_storeStrong((id *)&v8->_rng, a4);
  }

  return v8;
}

- (id)replyPositionsForSemanticClass:(unint64_t)a3 responseCount:(unint64_t)a4 config:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v8 = a5;
  -[SGQuickResponsesPersonalization sortedReplyPositionsForSemanticClass:config:](self, "sortedReplyPositionsForSemanticClass:config:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v8, "replies");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "replyCountForIndex:", a3);

    +[SGRandomization shuffledSamplingWithoutReplacementForK:fromN:withRng:](SGRandomization, "shuffledSamplingWithoutReplacementForK:fromN:withRng:", v11, v11, self->_rng);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[SGQuickResponsesPersonalization deduplicatedReplyTextsForReplyPositions:semanticClass:responseCount:config:](SGQuickResponsesPersonalization, "deduplicatedReplyTextsForReplyPositions:semanticClass:responseCount:config:", v9, a3, a4, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)sortedReplyPositionsForSemanticClass:(unint64_t)a3 config:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  SGQuickResponsesStore *store;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(v6, "replies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "replyTextsForIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  store = self->_store;
  objc_msgSend(v6, "language");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGQuickResponsesStore recordsForResponsesInternal:language:](store, "recordsForResponsesInternal:language:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    +[SGQuickResponsesPersonalization augmentRecords:semanticClass:config:](SGQuickResponsesPersonalization, "augmentRecords:semanticClass:config:", v11, a3, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[SGQuickResponsesReplyOption sortedReplyOptionsForRecords:config:](SGQuickResponsesReplyOption, "sortedReplyOptionsForRecords:config:", v12, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predictionParams");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isReplyTextRandomized");

    if (v15)
      +[SGRandomization shuffleMutableArray:inApproxEqualEpsilon:withValueBlock:withRng:](SGRandomization, "shuffleMutableArray:inApproxEqualEpsilon:withValueBlock:withRng:", v13, &__block_literal_global_113, self->_rng, 0.000001);
    v16 = (void *)objc_opt_new();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = v13;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v25;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v25 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v21), "position", (_QWORD)v24);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v22);

          ++v21;
        }
        while (v19 != v21);
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v19);
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)registerDisplayedResponses:(id)a3 config:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  SGQuickResponsesStore *store;
  void *v17;
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v19 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        +[SGQuickResponsesReplies normalizeReplyText:](SGQuickResponsesReplies, "normalizeReplyText:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "replies");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "normalizedReplyTextsSet");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "containsObject:", v12);

        if ((v15 & 1) != 0)
        {
          objc_msgSend(v19, "addObject:", v12);
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v11;
          _os_log_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "No reply text string exists in config for displayed response: %@", buf, 0xCu);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v8);
  }

  store = self->_store;
  objc_msgSend(v6, "language");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGQuickResponsesStore addDisplayedToResponses:language:](store, "addDisplayedToResponses:language:", v19, v17);

}

- (void)registerSelectedResponse:(id)a3 config:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  SGQuickResponsesStore *store;
  void *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  +[SGQuickResponsesReplies normalizeReplyText:](SGQuickResponsesReplies, "normalizeReplyText:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "replies");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "normalizedReplyTextsSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v8);

  if ((v11 & 1) != 0)
  {
    store = self->_store;
    objc_msgSend(v7, "language");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGQuickResponsesStore addSelectedToResponse:language:](store, "addSelectedToResponse:language:", v8, v13);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    v14 = 138412290;
    v15 = v6;
    _os_log_error_impl(&dword_21ABF4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "No reply text string exists in config for selected response: %@", (uint8_t *)&v14, 0xCu);
  }

}

- (void)registerWrittenResponse:(id)a3 config:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  SGQuickResponsesStore *store;
  void *v15;
  id v16;

  v6 = (void *)MEMORY[0x24BDD14A8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "whitespaceAndNewlineCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  +[SGQuickResponsesReplies normalizeReplyText:](SGQuickResponsesReplies, "normalizeReplyText:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "replies");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "normalizedReplyTextsSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v10);

  store = self->_store;
  objc_msgSend(v7, "language");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[SGQuickResponsesStore addWrittenToResponse:language:isMatch:](store, "addWrittenToResponse:language:isMatch:", v10, v15, v13);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rng, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

double __79__SGQuickResponsesPersonalization_sortedReplyPositionsForSemanticClass_config___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a2, "ucb");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;

  return v4;
}

+ (id)deduplicatedReplyTextsForReplyPositions:(id)a3 semanticClass:(unint64_t)a4 responseCount:(unint64_t)a5 config:(id)a6
{
  id v9;
  id v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  void *i;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  unint64_t v40;
  id v41;
  void *v42;
  void *v43;
  unint64_t v44;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  unint64_t v52;
  id obj;
  void *v54;
  id v55;
  uint64_t v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a6;
  v55 = (id)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "replies");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v50 = v10;
    objc_msgSend(v10, "replies");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "semanticClassStyleGroups");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectAtIndexedSubscript:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "semanticClassReplyTexts");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndexedSubscript:", a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = v13;
    objc_msgSend(v13, "replyTextParent");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v18, "unsignedIntegerValue");

    v48 = v15;
    v19 = objc_msgSend(v15, "count");
    objc_msgSend(v17, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "unsignedIntegerValue");

    v47 = v17;
    v22 = objc_msgSend(v17, "count");
    for (i = (void *)objc_opt_new(); v19; --v19)
    {
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", 0);
      objc_msgSend(i, "addObject:", v24);

    }
    if (v22 >= a5)
      v25 = a5;
    else
      v25 = v22;
    v51 = v9;
    v52 = v25;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = v9;
    v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    if (v26)
    {
      v27 = v26;
      v28 = 0;
      v29 = *(_QWORD *)v59;
LABEL_9:
      v30 = 0;
      while (1)
      {
        if (*(_QWORD *)v59 != v29)
          objc_enumerationMutation(obj);
        v31 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * v30);
        objc_msgSend(v57, "objectAtIndexedSubscript:", objc_msgSend(v31, "unsignedIntegerValue") + v21);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "unsignedIntegerValue");

        v34 = v33 - v56;
        objc_msgSend(i, "objectAtIndexedSubscript:", v33 - v56);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "unsignedIntegerValue");

        if (!v36)
        {
          v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInteger:", 1);
          objc_msgSend(i, "setObject:atIndexedSubscript:", v37, v34);

          v38 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7A648]), "initWithFirst:second:", v54, v31);
          objc_msgSend(v55, "addObject:", v38);
          ++v28;

          if (v28 >= v52)
            break;
        }
        if (v27 == ++v30)
        {
          v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
          if (v27)
            goto LABEL_9;
          break;
        }
      }
    }

    v10 = v50;
    v9 = v51;
  }
  else
  {
    v39 = objc_msgSend(v9, "count");
    if (a5 && v39)
    {
      v40 = 1;
      do
      {
        v41 = objc_alloc(MEMORY[0x24BE7A648]);
        objc_msgSend(v9, "objectAtIndexedSubscript:", v40 - 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)objc_msgSend(v41, "initWithFirst:second:", v54, v42);

        objc_msgSend(v55, "addObject:", v43);
        v44 = objc_msgSend(v9, "count");
        if (v40 >= a5)
          break;
      }
      while (v40++ < v44);
    }
  }

  return v55;
}

+ (id)augmentRecords:(id)a3 semanticClass:(unint64_t)a4 config:(id)a5
{
  id v7;
  id v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  SGQuickResponsesReplyRecord *v33;
  double v34;
  SGQuickResponsesReplyRecord *v35;
  void *v36;
  unint64_t v37;
  void *v38;
  unint64_t v39;
  void *v40;
  unint64_t v41;
  SGQuickResponsesRecords *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  SGQuickResponsesRecords *v52;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v8, "replies");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "replies");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "semanticClassSelectedPseudocounts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  v14 = (void *)objc_opt_new();
  objc_msgSend(v8, "predictionParams");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "personalizationDisplayedPseudocount");
  v17 = v16;

  objc_msgSend(v8, "predictionParams");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "personalizationSelectedPseudocountPerSemanticClass");
  v20 = v19;

  objc_msgSend(v7, "replyRecords");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    v23 = 0;
    do
    {
      objc_msgSend(v7, "replyRecords");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectAtIndexedSubscript:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = v20;
      if (v13)
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "doubleValue");
        v26 = v20 * v28;

      }
      objc_msgSend(v25, "selected");
      v30 = v26 + v29;
      objc_msgSend(v25, "matched");
      v32 = v26 + v31;
      v33 = [SGQuickResponsesReplyRecord alloc];
      objc_msgSend(v25, "displayed");
      v35 = -[SGQuickResponsesReplyRecord initWithDisplayed:selected:matched:](v33, "initWithDisplayed:selected:matched:", v17 + v34, v30, v32);
      objc_msgSend(v14, "addObject:", v35);

      ++v23;
      objc_msgSend(v7, "replyRecords");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "count");

    }
    while (v23 < v37);
  }
  objc_msgSend(v8, "replies");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "replyTextCount");

  objc_msgSend(v8, "replies");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "replyClassCount");

  v42 = [SGQuickResponsesRecords alloc];
  objc_msgSend(v7, "totalOpportunities");
  v44 = v43 + v17 * (double)v41;
  objc_msgSend(v7, "totalDisplayed");
  v46 = v45 + v17 * (double)v39;
  objc_msgSend(v7, "totalSelected");
  v48 = v47 + v20 * (double)v41;
  objc_msgSend(v7, "totalMatched");
  v50 = v49 + v20 * (double)v41;
  objc_msgSend(v7, "totalUnmatched");
  v52 = -[SGQuickResponsesRecords initWithReplyRecords:totalOpportunities:totalDisplayed:totalSelected:totalMatched:totalUnmatched:](v42, "initWithReplyRecords:totalOpportunities:totalDisplayed:totalSelected:totalMatched:totalUnmatched:", v14, v44, v46, v48, v50, v51 + v17 * (double)v39 - v20 * (double)v41);

  return v52;
}

@end
