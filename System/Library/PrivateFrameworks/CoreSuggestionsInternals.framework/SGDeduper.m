@implementation SGDeduper

+ (id)dedupe:(id)a3 bucketer:(id)a4 resolver:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *);
  CFMutableSetRef Mutable;
  __CFSet *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  const void *v26;
  id v27;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  Mutable = CFSetCreateMutable(0, 16, 0);
  if (!Mutable)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v27);
  }
  v11 = Mutable;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v29 = v8;
  v30 = v7;
  (*((void (**)(id, id))v8 + 2))(v8, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v40 != v14)
          objc_enumerationMutation(v12);
        v16 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        if ((unint64_t)objc_msgSend(v16, "count") < 2)
        {
          objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          CFSetAddValue(v11, v17);
        }
        else
        {
          v37 = 0u;
          v38 = 0u;
          v35 = 0u;
          v36 = 0u;
          v9[2](v9, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
          if (v18)
          {
            v19 = *(_QWORD *)v36;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v36 != v19)
                  objc_enumerationMutation(v17);
                CFSetAddValue(v11, *(const void **)(*((_QWORD *)&v35 + 1) + 8 * j));
              }
              v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
            }
            while (v18);
          }
        }

      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v13);
  }

  v21 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v22 = v30;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(v22);
        v26 = *(const void **)(*((_QWORD *)&v31 + 1) + 8 * k);
        if (CFSetContainsValue(v11, v26))
        {
          objc_msgSend(v21, "addObject:", v26);
          CFSetRemoveValue(v11, v26);
        }
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v23);
  }

  CFRelease(v11);
  return v21;
}

+ (id)bucketerWithMapping:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__SGDeduper_bucketerWithMapping___block_invoke;
  v7[3] = &unk_1E7DA9828;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1C3BD5158](v7);

  return v5;
}

+ (id)bucketerWithLabeledBuckets:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__SGDeduper_bucketerWithLabeledBuckets___block_invoke;
  v7[3] = &unk_1E7DA9850;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1C3BD5158](v7);

  return v5;
}

+ (id)bucketerWithEqualityTest:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__SGDeduper_bucketerWithEqualityTest___block_invoke;
  v7[3] = &unk_1E7DA9878;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1C3BD5158](v7);

  return v5;
}

+ (id)resolveByPairs:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __28__SGDeduper_resolveByPairs___block_invoke;
  v7[3] = &unk_1E7DA98A0;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1C3BD5158](v7);

  return v5;
}

+ (id)resolveByScoreBreakTiesArbitrarily:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SGDeduper_resolveByScoreBreakTiesArbitrarily___block_invoke;
  v7[3] = &unk_1E7DA98A0;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1C3BD5158](v7);

  return v5;
}

+ (id)resolveSGContactDetailsPreferringPhraseExtractionsAndLabels
{
  return +[SGDeduper resolveByScoreBreakTiesArbitrarily:](SGDeduper, "resolveByScoreBreakTiesArbitrarily:", &__block_literal_global_4528);
}

+ (unsigned)eventsHaveIdenticalReservationIds:(id)a3 ekEventFromStore:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(a3, "tags", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v22;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v8)
        objc_enumerationMutation(v6);
      v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
      if (objc_msgSend(v10, "isEventMetadata"))
      {
        objc_msgSend(v10, "eventMetadata");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          break;
      }
      if (v7 == (void *)++v9)
      {
        v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v14 = v11;
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0D19D78]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("reservationId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v12 = 0;
      v13 = 1;
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0D19818], "eventMetadataFromEKEvent:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "schemaOrg");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("reservationId"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12 && objc_msgSend(v7, "isEqualToString:", v12))
    {

      v19 = 2;
      goto LABEL_21;
    }
    v13 = 0;
  }
  else
  {
LABEL_10:
    v12 = 0;
    v13 = 1;
  }

LABEL_18:
  if (v12)
    v19 = v13;
  else
    v19 = 1;
LABEL_21:

  return v19;
}

+ (BOOL)eventsHaveSimilarTitles:(id)a3 ekEventFromStore:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  unsigned int v29;
  id v31;
  void *v32;
  void *v33;

  v5 = a4;
  objc_msgSend(a3, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) == 0)
  {
    v10 = +[SGLevenshtein distanceBetweenStrings:and:](SGLevenshtein, "distanceBetweenStrings:and:", v6, v7);
    v11 = objc_msgSend(v6, "length");
    v12 = objc_msgSend(v7, "length");
    if (v11 <= v12)
      v13 = v12;
    else
      v13 = v11;
    if ((double)v10 / (double)v13 < 0.5)
    {
      _PASGetNounsAndNames();
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v14 = v7;
      if (objc_msgSend(v8, "count"))
      {
        _PASGetNounsAndNames();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToArray:", v15))
        {
LABEL_10:

          goto LABEL_3;
        }
        v16 = objc_msgSend(v8, "count");
        v17 = objc_msgSend(v15, "count");
        if (v16 >= v17)
          v18 = v15;
        else
          v18 = v8;
        if (v16 >= v17)
          v19 = v8;
        else
          v19 = v15;
        v20 = v18;
        v21 = v19;
        if ((unint64_t)objc_msgSend(v20, "count") >= 3)
        {
          v22 = objc_msgSend(v20, "count") + 1;
          if (v22 == objc_msgSend(v21, "count"))
          {
            if (!objc_msgSend(v21, "count"))
            {

              goto LABEL_10;
            }
            v31 = v5;
            v32 = v15;
            v33 = v14;
            v23 = 0;
            v24 = 0;
            do
            {
              if (v24 < objc_msgSend(v20, "count"))
              {
                objc_msgSend(v20, "objectAtIndexedSubscript:", v24);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "objectAtIndexedSubscript:", v23);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = v21;
                v28 = v20;
                v29 = objc_msgSend(v25, "isEqualToString:", v26);

                v24 += v29;
                v20 = v28;
                v21 = v27;
              }
              ++v23;
            }
            while (v23 < objc_msgSend(v21, "count"));

            if (v23 - v24 < 2)
            {
              v9 = 1;
              v5 = v31;
              goto LABEL_30;
            }
            v5 = v31;
LABEL_29:
            v9 = 0;
            goto LABEL_30;
          }
        }

      }
      goto LABEL_29;
    }
    v8 = 0;
    goto LABEL_29;
  }
  v8 = 0;
LABEL_3:
  v9 = 1;
LABEL_30:

  return v9;
}

+ (void)enumerateEKEventsForPseudoEventBySimilarStartAndEndTime:(id)a3 store:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "timeRange");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "absoluteRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "start");
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v13);

  objc_msgSend(v8, "timeRange");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "absoluteRange");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "end");
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v17);

  objc_msgSend(v10, "predicateForEventsWithStartDate:endDate:calendars:", v14, v18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __86__SGDeduper_enumerateEKEventsForPseudoEventBySimilarStartAndEndTime_store_usingBlock___block_invoke;
  v23[3] = &unk_1E7DA9908;
  v24 = v14;
  v25 = v8;
  v26 = v9;
  v27 = a1;
  v20 = v9;
  v21 = v8;
  v22 = v14;
  objc_msgSend(v10, "enumerateEventsMatchingPredicate:usingBlock:", v19, v23);

}

+ (id)_dedupePostalAddresses:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") > 0x14)
    +[SGDeduper bucketerWithMapping:](SGDeduper, "bucketerWithMapping:", &__block_literal_global_20);
  else
    +[SGDeduper bucketerWithEqualityTest:](SGDeduper, "bucketerWithEqualityTest:", &__block_literal_global_18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGDeduper resolveSGContactDetailsPreferringPhraseExtractionsAndLabels](SGDeduper, "resolveSGContactDetailsPreferringPhraseExtractionsAndLabels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGDeduper dedupe:bucketer:resolver:](SGDeduper, "dedupe:bucketer:resolver:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_dedupeGenericContactDetails:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t, void *);
  void *v11;
  SEL v12;
  id v13;

  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __42__SGDeduper__dedupeGenericContactDetails___block_invoke;
  v11 = &__block_descriptor_48_e35___NSString_16__0__SGContactDetail_8l;
  v12 = a2;
  v13 = a1;
  v3 = a3;
  +[SGDeduper bucketerWithMapping:](SGDeduper, "bucketerWithMapping:", &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGDeduper resolveSGContactDetailsPreferringPhraseExtractionsAndLabels](SGDeduper, "resolveSGContactDetailsPreferringPhraseExtractionsAndLabels", v8, v9, v10, v11, v12, v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGDeduper dedupe:bucketer:resolver:](SGDeduper, "dedupe:bucketer:resolver:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)dedupeContactDetails:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGDeduper.m"), 340, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("details"));

  }
  +[SGDeduper bucketerWithMapping:](SGDeduper, "bucketerWithMapping:", &__block_literal_global_31);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGDeduper resolveSGContactDetailsPreferringPhraseExtractionsAndLabels](SGDeduper, "resolveSGContactDetailsPreferringPhraseExtractionsAndLabels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGDeduper dedupe:bucketer:resolver:](SGDeduper, "dedupe:bucketer:resolver:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v16, "type") == 1)
          v17 = v10;
        else
          v17 = v9;
        objc_msgSend(v17, "addObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v13);
  }

  objc_msgSend(a1, "_dedupeGenericContactDetails:", v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  objc_msgSend(a1, "_dedupePostalAddresses:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "addObjectsFromArray:", v20);

  return v19;
}

+ (id)splitContactDetailsByType:(id)a3
{
  id v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;

  v3 = a3;
  +[SGDeduper bucketerWithLabeledBuckets:](SGDeduper, "bucketerWithLabeledBuckets:", &__block_literal_global_35);
  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v4)[2](v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __39__SGDeduper_splitContactDetailsByType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "type"));
}

id __34__SGDeduper_dedupeContactDetails___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "label");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (const __CFString *)v3;
  else
    v5 = &stru_1E7DB83A8;
  v10[0] = v5;
  objc_msgSend(v2, "value");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v6;
  else
    v7 = &stru_1E7DB83A8;
  v10[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __42__SGDeduper__dedupeGenericContactDetails___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v6;

  v3 = a2;
  if (objc_msgSend(v3, "type") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("SGDeduper.m"), 329, CFSTR("postal address details should be filtered out"));

  }
  objc_msgSend(v3, "normalizedValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __36__SGDeduper__dedupePostalAddresses___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SGNormalizeAddress(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __36__SGDeduper__dedupePostalAddresses___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = SGPostalAddressesMatchWithParsed(v5, v6, 0, 0, 0, 0, 1);
  return v7;
}

void __86__SGDeduper_enumerateEKEventsForPseudoEventBySimilarStartAndEndTime_store_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  objc_msgSend(v3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "isEqualToDate:", v5);

  if ((_DWORD)v4
    && (objc_msgSend(*(id *)(a1 + 56), "eventsHaveIdenticalReservationIds:ekEventFromStore:", *(_QWORD *)(a1 + 40), v6) == 2|| objc_msgSend(*(id *)(a1 + 56), "eventsHaveSimilarTitles:ekEventFromStore:", *(_QWORD *)(a1 + 40), v6)&& objc_msgSend(v6, "status") != 3))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __72__SGDeduper_resolveSGContactDetailsPreferringPhraseExtractionsAndLabels__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v2 = a2;
  objc_msgSend(v2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
    v5 = 3;
  else
    v5 = 0;
  objc_msgSend(v2, "extractionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "extractionType");

  if (v7)
  {
    objc_msgSend(v2, "extractionInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "extractionType");

    if (v9 == 2)
      v5 = (v5 + 2);
    else
      v5 = (v5 + 1);
  }

  return v5;
}

id __48__SGDeduper_resolveByScoreBreakTiesArbitrarily___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  signed int v8;
  uint64_t i;
  void *v10;
  signed int v11;
  signed int v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (!v4)
    goto LABEL_12;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v17;
  v8 = 0x80000000;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v17 != v7)
        objc_enumerationMutation(v3);
      v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
      v11 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      if (v11 > v8)
      {
        v12 = v11;
        v13 = v10;

        v8 = v12;
        v6 = v13;
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  }
  while (v5);
  if (v6)
  {
    v20 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_12:
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v14;
}

id __28__SGDeduper_resolveByPairs___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  id v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (!v4)
    goto LABEL_13;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v13;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v3);
      if (v6)
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        v9 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v9;
      }
      else
      {
        v6 = *(id *)(*((_QWORD *)&v12 + 1) + 8 * i);
      }
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  }
  while (v5);
  if (v6)
  {
    v16 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_13:
    v10 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

id __38__SGDeduper_bucketerWithEqualityTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t i;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id obj;
  uint64_t v17;
  id v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v18 = (id)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v3;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v19)
  {
    v17 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v6 = v18;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v21;
          while (2)
          {
            for (j = 0; j != v8; ++j)
            {
              if (*(_QWORD *)v21 != v9)
                objc_enumerationMutation(v6);
              v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
              v12 = *(_QWORD *)(a1 + 32);
              objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v12) = (*(uint64_t (**)(uint64_t, uint64_t, void *))(v12 + 16))(v12, v5, v13);

              if ((_DWORD)v12)
              {
                objc_msgSend(v11, "addObject:", v5);
                goto LABEL_16;
              }
            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v8)
              continue;
            break;
          }
        }

        v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v5, 0);
        objc_msgSend(v6, "addObject:", v14);
        v6 = (id)v14;
LABEL_16:

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v19);
  }

  return v18;
}

id __40__SGDeduper_bucketerWithLabeledBuckets___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v11, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v12 = (void *)objc_opt_new();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);
        }
        objc_msgSend(v12, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

id __33__SGDeduper_bucketerWithMapping___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1C3BD4F6C](v6);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v11);
        objc_msgSend(v4, "objectForKeyedSubscript:", v12, (_QWORD)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v13 = (void *)objc_opt_new();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v12);
        }
        objc_msgSend(v13, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v7 = v6;
    }
    while (v6);
  }

  v14 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v4, "allValues");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v14);

  return v15;
}

@end
