@implementation CADCalendarItemsWithExternalIdentifierPredicate(EKPredicateEvaluating)

- (id)ekPredicateEvaluateWithObject:()EKPredicateEvaluating
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  objc_super v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "externalIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if (v8)
    {
      v11.receiver = a1;
      v11.super_class = (Class)&off_1EE698640;
      v9 = objc_msgSendSuper2(&v11, sel_ekPredicateEvaluateWithObject_, v5);
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)expandWithObjectsPendingCommit:()EKPredicateEvaluating deletedObjectIDs:andResultArray:
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  EKEvent *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  EKEvent *v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  id v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v39 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v49 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v16, "objectID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v13);
  }

  v18 = (void *)MEMORY[0x1E0CB3880];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __137__CADCalendarItemsWithExternalIdentifierPredicate_EKPredicateEvaluating__expandWithObjectsPendingCommit_deletedObjectIDs_andResultArray___block_invoke;
  v44[3] = &unk_1E4786378;
  v19 = v9;
  v45 = v19;
  v20 = v10;
  v46 = v20;
  v47 = a1;
  objc_msgSend(v18, "predicateWithBlock:", v44);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "filterUsingPredicate:", v21);

  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v22 = v20;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v41;
    v38 = v22;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v41 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j);
        objc_msgSend(v22, "objectForKeyedSubscript:", v27, v38);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(a1, "ekPredicateEvaluateWithObject:", v28)
          && (objc_msgSend(v19, "containsObject:", v27) & 1) == 0)
        {
          v29 = [EKEvent alloc];
          objc_msgSend(v28, "persistentObject");
          v30 = v24;
          v31 = v25;
          v32 = a1;
          v33 = v19;
          v34 = v11;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "startDate");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = -[EKEvent initWithPersistentObject:occurrenceDate:](v29, "initWithPersistentObject:occurrenceDate:", v35, v36);

          v11 = v34;
          v19 = v33;
          a1 = v32;
          v25 = v31;
          v24 = v30;
          v22 = v38;
          objc_msgSend(v39, "addObject:", v37);

        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
    }
    while (v24);
  }

}

@end
