@implementation BLSAlwaysOnExplicitEntriesTimeline

- (BLSAlwaysOnExplicitEntriesTimeline)initWithEntries:(id)a3 identifier:(id)a4 configure:(id)a5
{
  id v8;
  id v9;
  id v10;
  BLSAlwaysOnExplicitEntriesTimeline *v11;
  uint64_t v12;
  NSArray *explicitEntries;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BLSAlwaysOnExplicitEntriesTimeline;
  v11 = -[BLSAlwaysOnTimeline initWithIdentifier:configure:](&v15, sel_initWithIdentifier_configure_, v9, v10);
  if (v11)
  {
    objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_82);
    v12 = objc_claimAutoreleasedReturnValue();
    explicitEntries = v11->_explicitEntries;
    v11->_explicitEntries = (NSArray *)v12;

  }
  return v11;
}

uint64_t __75__BLSAlwaysOnExplicitEntriesTimeline_initWithEntries_identifier_configure___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  BLSAlwaysOnExplicitEntriesTimeline *v12;

  v3 = (void *)objc_opt_new();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __49__BLSAlwaysOnExplicitEntriesTimeline_description__block_invoke;
  v10 = &unk_1E621A880;
  v4 = v3;
  v11 = v4;
  v12 = self;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __49__BLSAlwaysOnExplicitEntriesTimeline_description__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "appendObject:withName:");

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "count"), CFSTR("count"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "firstObject");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "lastObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v15, "presentationTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bls_shortLoggingString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v6, "appendObject:withName:", v8, CFSTR("first"));

  if (v15 != v5)
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v5, "presentationTime");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bls_shortLoggingString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v10, "appendObject:withName:", v12, CFSTR("last"));

  }
}

- (int64_t)requestedFidelityForStartEntryInDateInterval:(id)a3 withPreviousEntry:(id)a4
{
  id v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v20 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "requestedFidelity");
  }
  else
  {
    v19 = self->_explicitEntries;
    if (-[NSArray count](v19, "count"))
    {
      -[NSArray firstObject](v19, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v9, "requestedFidelity");

      objc_msgSend(v20, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v11 = v19;
      v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v12)
      {
        v13 = *(_QWORD *)v22;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v22 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            objc_msgSend(v15, "presentationTime");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "compare:", v10);

            if (v17 != -1)
            {
              v8 = objc_msgSend(v15, "requestedFidelity");
              goto LABEL_14;
            }
          }
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          if (v12)
            continue;
          break;
        }
      }
LABEL_14:

    }
    else
    {
      v8 = -1;
    }

  }
  return v8;
}

- (id)unconfiguredEntriesForDateInterval:(id)a3 previousEntry:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  BLSAlwaysOnExplicitEntriesTimeline *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "presentationTime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && (objc_msgSend(v6, "startDate"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "compare:", v8),
        v9,
        v10 != 1))
  {
    v12 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v6, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "laterDate:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "initWithStartDate:endDate:", v8, v14);

    v11 = 0;
    v6 = (id)v15;
  }
  else
  {
    v11 = 1;
  }
  v16 = self->_explicitEntries;
  v18 = +[BLSAlwaysOnTimeline rangeOfEntries:forDateInterval:shouldIncludePrevious:](BLSAlwaysOnTimeline, "rangeOfEntries:forDateInterval:shouldIncludePrevious:", v16, v6, v11);
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v19 = 0;
  }
  else
  {
    -[NSArray subarrayWithRange:](v16, "subarrayWithRange:", v18, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  bls_timelines_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    -[BLSAlwaysOnTimeline identifier](self, "identifier");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v19, "count");
    objc_msgSend(v6, "bls_shortLoggingString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "bls_boundedDescriptionWithMax:transformer:", 8, &__block_literal_global_89);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 134219010;
    v27 = self;
    v28 = 2114;
    v29 = v22;
    v30 = 1024;
    v31 = v23;
    v32 = 2114;
    v33 = v24;
    v34 = 2112;
    v35 = v25;
    _os_log_debug_impl(&dword_1B0C75000, v20, OS_LOG_TYPE_DEBUG, "%p:%{public}@ -> %d entries(subset) for %{public}@ : %@", (uint8_t *)&v26, 0x30u);

  }
  return v19;
}

id __87__BLSAlwaysOnExplicitEntriesTimeline_unconfiguredEntriesForDateInterval_previousEntry___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "presentationTime");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bls_shortLoggingString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explicitEntries, 0);
}

@end
