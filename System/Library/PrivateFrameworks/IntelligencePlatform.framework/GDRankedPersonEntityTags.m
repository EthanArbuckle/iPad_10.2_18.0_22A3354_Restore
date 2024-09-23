@implementation GDRankedPersonEntityTags

- (GDRankedPersonEntityTags)initWithIDValue:(int64_t)a3 scoredPersonEntityTags:(id)a4 entityRelevanceInferenceEventId:(int64_t)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  GDRankedPersonEntityTags *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  GDScoredPersonEntityTagInner *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  const char *v30;
  const char *v31;
  GDScoreRankedPersonEntityTagsInner *v32;
  const char *v33;
  uint64_t v34;
  GDScoreRankedPersonEntityTagsInner *inner;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  objc_super v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)GDRankedPersonEntityTags;
  v10 = -[GDRankedPersonEntityTags init](&v42, sel_init);
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0C99DE8];
    v12 = objc_msgSend_count(v7, v8, v9);
    objc_msgSend_arrayWithCapacity_(v11, v13, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v37 = v7;
    v15 = v7;
    v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v38, v43, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v39 != v19)
            objc_enumerationMutation(v15);
          v21 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          v22 = [GDScoredPersonEntityTagInner alloc];
          v25 = objc_msgSend_tag(v21, v23, v24);
          objc_msgSend_score(v21, v26, v27);
          v29 = (void *)objc_msgSend_initWithGdTag_score_inferenceEventIdValue_(v22, v28, v25, 0);
          objc_msgSend_addObject_(v14, v30, (uint64_t)v29);

        }
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v31, (uint64_t)&v38, v43, 16);
      }
      while (v18);
    }

    v32 = [GDScoreRankedPersonEntityTagsInner alloc];
    v34 = objc_msgSend_initWithIdValue_scoredPersonEntityTags_inferenceEventIdValue_(v32, v33, a3, v14, 0);
    inner = v10->inner;
    v10->inner = (GDScoreRankedPersonEntityTagsInner *)v34;

    v7 = v37;
  }

  return v10;
}

- (int64_t)idValue
{
  uint64_t v2;

  return objc_msgSend_idValue(self->inner, a2, v2);
}

- (NSArray)scoredPersonEntityTags
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
  GDScoredPersonEntityTagType *v13;
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
  objc_msgSend_scoredPersonEntityTags(self->inner, v4, v5, 0);
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
        v13 = [GDScoredPersonEntityTagType alloc];
        v16 = objc_msgSend_gdTag(v12, v14, v15);
        objc_msgSend_score(v12, v17, v18);
        v20 = (void *)objc_msgSend_initWithTag_score_(v13, v19, v16);
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

- (void)setScoredPersonEntityTags:(id)a3
{
  objc_storeStrong((id *)&self->_scoredPersonEntityTags, a3);
}

- (int64_t)entityRelevanceInferenceEventId
{
  return self->_entityRelevanceInferenceEventId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoredPersonEntityTags, 0);
  objc_storeStrong((id *)&self->inner, 0);
}

@end
