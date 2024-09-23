@implementation BLSAlwaysOnTimeline

+ (id)emptyTimelineWithIdentifier:(id)a3
{
  id v3;
  BLSAlwaysOnTimeline *v4;

  v3 = a3;
  v4 = -[BLSAlwaysOnTimeline initWithIdentifier:configure:]([BLSAlwaysOnTimeline alloc], "initWithIdentifier:configure:", v3, 0);

  return v4;
}

+ (id)timelineWithPerMinuteUpdateFrequency:(int64_t)a3 identifier:(id)a4 configure:(id)a5
{
  id v7;
  id v8;
  BLSAlwaysOnFrequencyPerMinuteTimeline *v9;

  v7 = a4;
  v8 = a5;
  v9 = -[BLSAlwaysOnFrequencyPerMinuteTimeline initWithPerMinuteUpdateFrequency:identifier:configure:]([BLSAlwaysOnFrequencyPerMinuteTimeline alloc], "initWithPerMinuteUpdateFrequency:identifier:configure:", a3, v7, v8);

  return v9;
}

+ (id)everyMinuteTimelineWithIdentifier:(id)a3 configure:(id)a4
{
  id v5;
  id v6;
  BLSAlwaysOnFrequencyPerMinuteTimeline *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[BLSAlwaysOnFrequencyPerMinuteTimeline initWithPerMinuteUpdateFrequency:identifier:configure:]([BLSAlwaysOnFrequencyPerMinuteTimeline alloc], "initWithPerMinuteUpdateFrequency:identifier:configure:", 1, v5, v6);

  return v7;
}

+ (id)timelineWithUpdateInterval:(double)a3 startDate:(id)a4 identifier:(id)a5 configure:(id)a6
{
  id v9;
  id v10;
  id v11;
  BLSAlwaysOnPeriodicTimeline *v12;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  v12 = -[BLSAlwaysOnPeriodicTimeline initWithUpdateInterval:startDate:identifier:configure:]([BLSAlwaysOnPeriodicTimeline alloc], "initWithUpdateInterval:startDate:identifier:configure:", v9, v10, v11, a3);

  return v12;
}

+ (id)timelineWithEntries:(id)a3 identifier:(id)a4 configure:(id)a5
{
  id v7;
  id v8;
  id v9;
  BLSAlwaysOnExplicitEntriesTimeline *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = -[BLSAlwaysOnExplicitEntriesTimeline initWithEntries:identifier:configure:]([BLSAlwaysOnExplicitEntriesTimeline alloc], "initWithEntries:identifier:configure:", v7, v8, v9);

  return v10;
}

- (BLSAlwaysOnTimeline)initWithIdentifier:(id)a3 configure:(id)a4
{
  id v7;
  id v8;
  BLSAlwaysOnTimeline *v9;
  BLSAlwaysOnTimeline *v10;
  uint64_t v11;
  id configureEntryBlock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BLSAlwaysOnTimeline;
  v9 = -[BLSAlwaysOnTimeline init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v11 = objc_msgSend(v8, "copy");
    configureEntryBlock = v10->_configureEntryBlock;
    v10->_configureEntryBlock = (id)v11;

  }
  return v10;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  id (*v9)(uint64_t);
  void *v10;
  id v11;
  BLSAlwaysOnTimeline *v12;

  v3 = (void *)objc_opt_new();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __34__BLSAlwaysOnTimeline_description__block_invoke;
  v10 = &unk_1E621A880;
  v4 = v3;
  v11 = v4;
  v12 = self;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __34__BLSAlwaysOnTimeline_description__block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("id"));
}

- (id)configureEntry:(id)a3 previousEntry:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void (**configureEntryBlock)(id, id, id);
  void *v11;

  v6 = a3;
  v7 = a4;
  -[BLSAlwaysOnTimeline identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    bls_timelines_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[BLSAlwaysOnTimeline configureEntry:previousEntry:].cold.1((uint64_t)self, v9);

  }
  objc_msgSend(v6, "setTimelineIdentifier:", v8);
  configureEntryBlock = (void (**)(id, id, id))self->_configureEntryBlock;
  if (configureEntryBlock)
    configureEntryBlock[2](configureEntryBlock, v6, v7);
  v11 = (void *)objc_msgSend(v6, "copy");

  return v11;
}

- (id)configureEntries:(id)a3 previousEntry:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      v13 = v7;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        -[BLSAlwaysOnTimeline configureEntry:previousEntry:](self, "configureEntry:previousEntry:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), v13, (_QWORD)v16);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v7);

        ++v12;
        v13 = v7;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_msgSend(v8, "copy");
  return v14;
}

+ (_NSRange)rangeOfEntries:(id)a3 forDateInterval:(id)a4 shouldIncludePrevious:(BOOL)a5
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  BOOL v27;
  uint64_t v28;
  NSUInteger v29;
  NSUInteger v30;
  unint64_t v31;
  _BOOL4 v32;
  uint64_t v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;
  _NSRange result;

  v32 = a5;
  v46 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v35 = a4;
  v6 = objc_msgSend(v34, "count");
  v7 = 0;
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  if (v34)
  {
    v9 = v6;
    if (v6)
    {
      objc_msgSend(v35, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v11 = v34;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      if (v12)
      {
        v13 = 0;
        v14 = *(_QWORD *)v41;
        while (2)
        {
          v15 = 0;
          v16 = v13 + v12;
          do
          {
            if (*(_QWORD *)v41 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v15), "presentationTime");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "compare:", v10);

            if (v18 != -1)
            {
              LODWORD(v19) = v32;
              if (!v18)
                LODWORD(v19) = 0;
              if (v13 + v15)
                v19 = v19;
              else
                v19 = 0;
              v8 = v13 + v15 - v19;
              goto LABEL_18;
            }
            ++v15;
          }
          while (v12 != v15);
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
          v13 = v16;
          if (v12)
            continue;
          break;
        }
      }
      v8 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_18:

      if (v32 && v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = v9 - 1;
        v7 = 1;
      }
      else if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v7 = 0;
        v8 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        objc_msgSend(v35, "endDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        objc_msgSend(v11, "reverseObjectEnumerator");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        v7 = v9 - v8;
        if (v22)
        {
          v23 = *(_QWORD *)v37;
          v31 = v9 - v8;
          v24 = v9 - v8;
          while (2)
          {
            v25 = 0;
            v33 = v24;
            v7 = v24 - v22;
            do
            {
              if (*(_QWORD *)v37 != v23)
                objc_enumerationMutation(v21);
              objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v25), "presentationTime", v31);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v20, "compare:", v26) == -1;

              if (!v27)
              {
                if (v33 - v25 >= v31)
                  v28 = v33;
                else
                  v28 = v33 + 1;
                v7 = v28 - v25;
                goto LABEL_36;
              }
              ++v25;
            }
            while (v22 != v25);
            v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            v24 = v7;
            if (v22)
              continue;
            break;
          }
        }
LABEL_36:

      }
    }
  }

  v29 = v8;
  v30 = v7;
  result.length = v30;
  result.location = v29;
  return result;
}

- (int64_t)requestedFidelityForStartEntryInDateInterval:(id)a3 withPreviousEntry:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  os_log_type_t v11;
  objc_class *v12;
  void *v13;
  int64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v22;
  BLSAlwaysOnTimeline *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  BLSAlwaysOnTimeline *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class();
  if (v8 == objc_opt_class())
  {
    v14 = 0;
  }
  else
  {
    bls_timelines_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (-[BLSAlwaysOnTimeline requestedFidelityForStartEntryInDateInterval:withPreviousEntry:]::didFaultOnce)
      v11 = OS_LOG_TYPE_ERROR;
    else
      v11 = OS_LOG_TYPE_FAULT;
    if (os_log_type_enabled(v9, v11))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 134218498;
      v23 = self;
      v24 = 2114;
      v25 = v13;
      v26 = 2114;
      v27 = self;
      _os_log_impl(&dword_1B0C75000, v10, v11, "%p class:%{public}@ should override requestedFidelityForStartEntryInDateInterval:withPreviousEntry: to avoid brute force method for timeline:%{public}@", (uint8_t *)&v22, 0x20u);

    }
    -[BLSAlwaysOnTimeline requestedFidelityForStartEntryInDateInterval:withPreviousEntry:]::didFaultOnce = 1;
    if (v7)
    {
      v14 = objc_msgSend(v7, "requestedFidelity");
    }
    else
    {
      -[BLSAlwaysOnTimeline unconfiguredEntriesForDateInterval:previousEntry:](self, "unconfiguredEntriesForDateInterval:previousEntry:", v6, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");
      if (v16)
      {
        objc_msgSend(v15, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v17, "requestedFidelity");
        if (v14 == -1)
        {
          if (v16 < 2)
          {
            v14 = 0;
          }
          else
          {
            objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "presentationTime");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "presentationTime");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = -[BLSAlwaysOnTimeline estimatedFidelityForPresentationTime:nextPresentationTime:](self, "estimatedFidelityForPresentationTime:nextPresentationTime:", v19, v20);

          }
        }

      }
      else
      {
        v14 = 0;
      }

    }
  }

  return v14;
}

- (id)unconfiguredEntriesForDateInterval:(id)a3 previousEntry:(id)a4
{
  return 0;
}

- (int64_t)estimatedFidelityForPresentationTime:(id)a3 nextPresentationTime:(id)a4
{
  int64_t result;

  objc_msgSend(a4, "timeIntervalSinceDate:", a3);
  result = +[BLSFidelityThreshold fidelityForUpdateInterval:](BLSFidelityThreshold, "fidelityForUpdateInterval:");
  if (result == 3)
    return 2;
  return result;
}

- (void)entryBookkeepersForDateInterval:(char)a3@<W2> shouldConstructStartEntry:(void *)a4@<X3> framesPerSecond:(uint64_t *)a5@<X8> previousSpecifier:(double)a6@<D0>
{
  id v11;
  void *v12;
  void *v13;
  BLSAlwaysOnTimelineEntrySpecifier *v14;
  unint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  BLSAlwaysOnTimelineEntry *v27;
  BLSAlwaysOnTimelineEntry *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  BLSAlwaysOnTimelineEntry *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  void **v42[9];
  id v43;
  id v44;
  id *v45;
  BLSAlwaysOnTimelineEntry *v46;
  double *v47;
  uint64_t *v48;
  double v49;
  char v50;
  id v51;
  id v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[33];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v52 = a1;
  v51 = a2;
  v50 = a3;
  v49 = a6;
  v11 = a4;
  v12 = v11;
  a5[1] = 0;
  a5[2] = 0;
  *a5 = 0;
  if (a1)
  {
    v47 = &v49;
    v48 = a5;
    if (v11)
    {
      objc_msgSend(a1, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "entrySpecifierForTimelineIdentifier:", v13);
      v14 = (BLSAlwaysOnTimelineEntrySpecifier *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
    -[BLSAlwaysOnTimelineEntrySpecifier timelineEntry](v14, "timelineEntry");
    v46 = (BLSAlwaysOnTimelineEntry *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      BLSTimelineEntryBookkeeper::BLSTimelineEntryBookkeeper((BLSTimelineEntryBookkeeper *)&v53, v14);
    }
    else
    {
      memset(v55, 0, sizeof(v55));
      v53 = 0u;
      v54 = 0u;
    }
    v15 = a5[1];
    if (v15 >= a5[2])
    {
      v20 = std::vector<BLSTimelineEntryBookkeeper>::__push_back_slow_path<BLSTimelineEntryBookkeeper>(a5, &v53);
    }
    else
    {
      v16 = v53;
      v53 = 0u;
      *(_OWORD *)v15 = v16;
      v17 = v54;
      v54 = 0u;
      *(_OWORD *)(v15 + 16) = v17;
      v18 = *(_QWORD *)v55;
      *(_QWORD *)v55 = 0;
      *(_QWORD *)(v15 + 32) = v18;
      v19 = *(_OWORD *)&v55[8];
      *(_OWORD *)(v15 + 49) = *(_OWORD *)&v55[17];
      *(_OWORD *)(v15 + 40) = v19;
      v20 = v15 + 72;
    }
    a5[1] = v20;

    objc_msgSend(v52, "unconfiguredEntriesForDateInterval:previousEntry:", v51, v46);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v46)
    {
      if (objc_msgSend(v21, "count"))
      {
        objc_msgSend(v22, "firstObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "presentationTime");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[BLSAlwaysOnTimelineEntry presentationTime](v46, "presentationTime");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v24, "isEqualToDate:", v25);

        if (v26)
        {
          -[BLSAlwaysOnTimelineEntrySpecifier previousTimelineEntry](v14, "previousTimelineEntry");
          v27 = (BLSAlwaysOnTimelineEntry *)objc_claimAutoreleasedReturnValue();
          v28 = v46;
          v46 = v27;

        }
      }
    }
    v44 = 0;
    v45 = &v52;
    v42[0] = &v43;
    v42[1] = (void **)&v45;
    v42[2] = &v52;
    v42[3] = &v44;
    v42[4] = (void **)&v50;
    v42[5] = &v51;
    v42[6] = (void **)&v49;
    v42[7] = (void **)&v47;
    v42[8] = (void **)&v46;
    v43 = 0;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v29 = v22;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v56, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v39 != v31)
            objc_enumerationMutation(v29);
          -[BLSAlwaysOnTimeline entryBookkeepersForDateInterval:shouldConstructStartEntry:framesPerSecond:previousSpecifier:]::$_2::operator()(v42, *(void **)(*((_QWORD *)&v38 + 1) + 8 * i));
        }
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v56, 16);
      }
      while (v30);
    }

    if (v43)
    {
      -[BLSAlwaysOnTimeline entryBookkeepersForDateInterval:shouldConstructStartEntry:framesPerSecond:previousSpecifier:]::$_2::operator()(v42, 0);
    }
    else if (v50)
    {
      v33 = objc_msgSend(v52, "requestedFidelityForStartEntryInDateInterval:withPreviousEntry:", v51, v46, (_QWORD)v38);
      v34 = v52;
      objc_msgSend(v51, "startDate");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[BLSAlwaysOnTimelineUnconfiguredEntry entryForPresentationTime:withRequestedFidelity:](BLSAlwaysOnTimelineUnconfiguredEntry, "entryForPresentationTime:withRequestedFidelity:", v35, v33);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "configureEntry:previousEntry:", v36, v46);
      v37 = (BLSAlwaysOnTimelineEntry *)objc_claimAutoreleasedReturnValue();

      BLSTimelineEntryBookkeeper::BLSTimelineEntryBookkeeper((BLSTimelineEntryBookkeeper *)&v53, v37, v46, *v47);
      std::vector<BLSTimelineEntryBookkeeper>::push_back[abi:ne180100](v48, (uint64_t)&v53);

    }
  }

}

- (void)entryBookkeepersForDateInterval:shouldConstructStartEntry:framesPerSecond:previousSpecifier:
{
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (objc_msgSend(v9, "requestedFidelity") == -1)
  {
    v6 = **a1;
    objc_msgSend(v9, "presentationTime");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setRequestedFidelity:", objc_msgSend(v6, "estimatedFidelityForPresentationTime:nextPresentationTime:", v7, v8));

  }
}

+ (void)entriesCombinerForTimelines:(char)a3@<W3> dateInterval:(void *)a4@<X4> shouldConstructStartSpecifier:(uint64_t)a5@<X8> framesPerSecond:(double)a6@<D0> previousSpecifier:
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  _BYTE *v31;
  unint64_t v32;
  __int128 v33;
  uint64_t v34;
  _BYTE v35[8];
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void **v43;
  void **v44[18];

  v44[16] = *(void ***)MEMORY[0x1E0C80C00];
  v29 = a1;
  v11 = a2;
  v12 = a4;
  objc_opt_self();
  v13 = v11;
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v12, "presentationInterval", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "compare:", v16);

    v14 = v13;
    if (v18 == -1)
    {
      v19 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v13, "endDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "laterDate:", v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v19, "initWithStartDate:endDate:", v16, v21);

    }
  }
  v28 = a5;
  v31 = 0;
  v32 = 0;
  v30 = 0;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v22 = v29;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v40 != v24)
          objc_enumerationMutation(v22);
        -[BLSAlwaysOnTimeline entryBookkeepersForDateInterval:shouldConstructStartEntry:framesPerSecond:previousSpecifier:](*(void **)(*((_QWORD *)&v39 + 1) + 8 * i), v13, a3, v12, (uint64_t *)&v33, a6);
        v36 = v33;
        v37 = v34;
        v34 = 0;
        v33 = 0uLL;
        v38 = v36;
        v26 = v31;
        if ((unint64_t)v31 >= v32)
        {
          v27 = std::vector<BLSTimelineEntryIterator>::__push_back_slow_path<BLSTimelineEntryIterator>(&v30, (uint64_t)v35);
        }
        else
        {
          *v31 = v35[0];
          v26[2] = 0;
          v26[3] = 0;
          v26[1] = 0;
          *(_OWORD *)(v26 + 1) = v36;
          v26[3] = v37;
          v36 = 0uLL;
          v37 = 0;
          v26[4] = v38;
          v27 = (uint64_t)(v26 + 5);
        }
        v31 = (_BYTE *)v27;
        v43 = (void **)&v36;
        std::vector<BLSTimelineEntryBookkeeper>::__destroy_vector::operator()[abi:ne180100](&v43);
        v43 = (void **)&v33;
        std::vector<BLSTimelineEntryBookkeeper>::__destroy_vector::operator()[abi:ne180100](&v43);
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v23);
  }

  BLSTimelineEntriesCombiner::BLSTimelineEntriesCombiner(v28, (uint64_t)&v30, v14, a6);
  v44[0] = (void **)&v30;
  std::vector<BLSTimelineEntryIterator>::__destroy_vector::operator()[abi:ne180100](v44);

}

+ (id)constructFrameSpecifiersForTimelines:(id)a3 dateInterval:(id)a4 shouldConstructStartSpecifier:(BOOL)a5 framesPerSecond:(double)a6 previousSpecifier:(id)a7
{
  _BOOL4 v9;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  BLSAlwaysOnFrameSpecifier *v17;
  BLSAlwaysOnTimelineEntrySpecifier *v18;
  BLSAlwaysOnTimelineEntry *v19;
  void *v20;
  BLSAlwaysOnTimelineEntry *v21;
  BLSAlwaysOnTimelineEntrySpecifier *v22;
  void *v23;
  BLSAlwaysOnFrameSpecifier *v24;
  _BYTE v26[24];
  id v27;
  id v28;
  void **v29;
  BLSAlwaysOnTimelineEntrySpecifier *v30;
  BLSAlwaysOnFrameSpecifier *v31;
  uint8_t buf[24];
  uint64_t v33;

  v9 = a5;
  v33 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a7;
  bls_timelines_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v11, "bls_boundedDescriptionWithMax:", 10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[BLSAlwaysOnTimeline constructFrameSpecifiersForTimelines:dateInterval:shouldConstructStartSpecifier:framesPerSecond:previousSpecifier:].cold.1(v15, buf, v14);
  }

  if (objc_msgSend(v11, "count"))
  {
    +[BLSAlwaysOnTimeline entriesCombinerForTimelines:dateInterval:shouldConstructStartSpecifier:framesPerSecond:previousSpecifier:](v11, v12, v9, v13, (uint64_t)v26, a6);
    BLSTimelineEntriesCombiner::constructFrameSpecifiers((BLSTimelineEntriesCombiner *)v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = (void **)v26;
    std::vector<BLSTimelineEntryIterator>::__destroy_vector::operator()[abi:ne180100](&v29);
  }
  else if (v9)
  {
    v17 = [BLSAlwaysOnFrameSpecifier alloc];
    v18 = [BLSAlwaysOnTimelineEntrySpecifier alloc];
    v19 = [BLSAlwaysOnTimelineEntry alloc];
    objc_msgSend(v12, "startDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "duration");
    v21 = -[BLSAlwaysOnTimelineEntry initWithPresentationTime:requestedFidelity:animated:duration:timelineIdentifier:userObject:](v19, "initWithPresentationTime:requestedFidelity:animated:duration:timelineIdentifier:userObject:", v20, 0, 0, 0, 0);
    v22 = -[BLSAlwaysOnTimelineEntrySpecifier initWithTimelineEntry:percentComplete:previousTimelineEntry:didChange:](v18, "initWithTimelineEntry:percentComplete:previousTimelineEntry:didChange:", v21, 0, 1, 1.0);
    v30 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[BLSAlwaysOnFrameSpecifier initWithTimelineEntrySpecifiers:presentationInterval:](v17, "initWithTimelineEntrySpecifiers:presentationInterval:", v23, v12);
    v31 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v16;
}

+ (int64_t)requestedFidelityForTimelines:(id)a3 inDateInterval:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v8)
  {

LABEL_13:
    v10 = 1;
    goto LABEL_14;
  }
  v9 = *(_QWORD *)v15;
  v10 = -1;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(v7);
      v12 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "requestedFidelityForStartEntryInDateInterval:withPreviousEntry:", v6, 0, (_QWORD)v14);
      if (v12 > v10)
        v10 = v12;
    }
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  }
  while (v8);

  if (v10 == -1)
    goto LABEL_13;
LABEL_14:

  return v10;
}

- (NSObject)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_configureEntryBlock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)configureEntry:(uint64_t)a1 previousEntry:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 134218242;
  v3 = a1;
  v4 = 2114;
  v5 = a1;
  _os_log_fault_impl(&dword_1B0C75000, a2, OS_LOG_TYPE_FAULT, "%p nil identifier for timeline:%{public}@", (uint8_t *)&v2, 0x16u);
}

+ (void)constructFrameSpecifiersForTimelines:(os_log_t)log dateInterval:shouldConstructStartSpecifier:framesPerSecond:previousSpecifier:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1B0C75000, log, OS_LOG_TYPE_DEBUG, "constructFrameSpecifiersForTimelines:%{public}@", buf, 0xCu);

}

@end
