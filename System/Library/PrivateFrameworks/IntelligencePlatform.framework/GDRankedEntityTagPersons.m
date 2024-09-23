@implementation GDRankedEntityTagPersons

- (GDRankedEntityTagPersons)initWithTag:(int64_t)a3 scoredEntities:(id)a4 entityRelevanceInferenceEventId:(int64_t)a5
{
  id v8;
  GDRankedEntityTagPersons *v9;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  GDScoredPersonInner *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  const char *v26;
  const char *v27;
  GDScoreRankedEntityTagPersonsInner *v28;
  const char *v29;
  uint64_t v30;
  GDScoreRankedEntityTagPersonsInner *inner;
  int64_t v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)GDRankedEntityTagPersons;
  v9 = -[GDRankedEntityTagPersons init](&v39, sel_init);
  if (v9)
  {
    v33 = a5;
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v34 = v8;
    v11 = v8;
    v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v35, v40, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v36 != v15)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v18 = [GDScoredPersonInner alloc];
          v21 = objc_msgSend_idValue(v17, v19, v20);
          objc_msgSend_score(v17, v22, v23);
          v25 = (void *)objc_msgSend_initWithIdValue_score_inferenceEventIdValue_(v18, v24, v21, 0);
          objc_msgSend_addObject_(v10, v26, (uint64_t)v25);

        }
        v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v27, (uint64_t)&v35, v40, 16);
      }
      while (v14);
    }

    v28 = [GDScoreRankedEntityTagPersonsInner alloc];
    v30 = objc_msgSend_initWithGdTag_scoredEntities_inferenceEventIdValue_(v28, v29, a3, v10, v33);
    inner = v9->inner;
    v9->inner = (GDScoreRankedEntityTagPersonsInner *)v30;

    v8 = v34;
  }

  return v9;
}

- (int64_t)tag
{
  uint64_t v2;

  return objc_msgSend_gdTag(self->inner, a2, v2);
}

- (NSArray)scoredEntities
{
  id v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  GDScoredPersonEntity *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  const char *v21;
  const char *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend_scoredEntities(self->inner, v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v24, v28, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v11);
        v13 = [GDScoredPersonEntity alloc];
        v16 = objc_msgSend_idValue(v12, v14, v15);
        objc_msgSend_score(v12, v17, v18);
        v20 = (void *)objc_msgSend_initWithIDValue_score_(v13, v19, v16);
        objc_msgSend_addObject_(v3, v21, (uint64_t)v20);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v22, (uint64_t)&v24, v28, 16);
    }
    while (v9);
  }

  return (NSArray *)v3;
}

- (int64_t)feedbackEventId
{
  uint64_t v2;

  return objc_msgSend_inferenceEventIdValue(self->inner, a2, v2);
}

- (void)setScoredEntities:(id)a3
{
  objc_storeStrong((id *)&self->_scoredEntities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoredEntities, 0);
  objc_storeStrong((id *)&self->inner, 0);
}

@end
