@implementation BLSAlwaysOnFrequencyPerMinuteTimeline

- (BLSAlwaysOnFrequencyPerMinuteTimeline)initWithPerMinuteUpdateFrequency:(int64_t)a3 identifier:(id)a4 configure:(id)a5
{
  id v8;
  id v9;
  BLSAlwaysOnFrequencyPerMinuteTimeline *v10;
  NSObject *v11;
  uint64_t v12;
  NSCalendar *calendar;
  objc_super v15;

  v8 = a4;
  v9 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BLSAlwaysOnFrequencyPerMinuteTimeline;
  v10 = -[BLSAlwaysOnTimeline initWithIdentifier:configure:](&v15, sel_initWithIdentifier_configure_, v8, v9);
  if (v10)
  {
    if (a3 <= 0)
    {
      bls_timelines_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        -[BLSAlwaysOnFrequencyPerMinuteTimeline initWithPerMinuteUpdateFrequency:identifier:configure:].cold.1(a3, (uint64_t)v8, v11);

      a3 = 1;
    }
    v10->_frequencyPerMinute = a3;
    objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
    v12 = objc_claimAutoreleasedReturnValue();
    calendar = v10->_calendar;
    v10->_calendar = (NSCalendar *)v12;

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
  BLSAlwaysOnFrequencyPerMinuteTimeline *v12;

  v3 = (void *)objc_opt_new();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __52__BLSAlwaysOnFrequencyPerMinuteTimeline_description__block_invoke;
  v10 = &unk_1E621A880;
  v4 = v3;
  v11 = v4;
  v12 = self;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __52__BLSAlwaysOnFrequencyPerMinuteTimeline_description__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("id"));

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendDouble:withName:decimalPrecision:", CFSTR("freq"), 4, (double)*(uint64_t *)(*(_QWORD *)(a1 + 40) + 32));
}

- (int64_t)requestedFidelityForStartEntryInDateInterval:(id)a3 withPreviousEntry:(id)a4
{
  if (self)
    return +[BLSFidelityThreshold fidelityForUpdateInterval:](BLSFidelityThreshold, "fidelityForUpdateInterval:", a3, a4, 60.0 / (double)*(uint64_t *)(self + 32));
  return self;
}

- (id)unconfiguredEntriesForDateInterval:(id)a3 previousEntry:(id)a4
{
  void *v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  NSCalendar *v15;
  int64_t frequencyPerMinute;
  void *v17;
  NSCalendar *v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(_QWORD, _QWORD, _QWORD);
  NSCalendar *calendar;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  uint64_t v30;
  void *v31;
  int v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  _QWORD v43[5];
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  void (**v47)(_QWORD, _QWORD, _QWORD);
  char v48;
  _QWORD v49[4];
  NSCalendar *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  int64_t v55;
  char v56;
  uint8_t buf[4];
  BLSAlwaysOnFrequencyPerMinuteTimeline *v58;
  __int16 v59;
  id v60;
  __int16 v61;
  int v62;
  __int16 v63;
  id v64;
  __int16 v65;
  int v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  uint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v38 = a4;
  objc_msgSend(v42, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "presentationTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v7;
  if (v7 && objc_msgSend(v6, "compare:", v7) != 1)
  {
    v9 = v7;

    v8 = 1;
    v6 = v9;
  }
  else
  {
    v8 = 0;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  v41 = v10;
  objc_msgSend(v10, "setSecond:", 0);
  -[NSCalendar components:fromDate:](self->_calendar, "components:fromDate:", 32896, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v11;
  if (objc_msgSend(v11, "second"))
    v12 = 0;
  else
    v12 = objc_msgSend(v11, "nanosecond") == 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v6;
  }
  else
  {
    -[NSCalendar nextDateAfterDate:matchingComponents:options:](self->_calendar, "nextDateAfterDate:matchingComponents:options:", v6, v10, 5124);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  v15 = self->_calendar;
  frequencyPerMinute = self->_frequencyPerMinute;
  objc_msgSend(v42, "endDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __90__BLSAlwaysOnFrequencyPerMinuteTimeline_unconfiguredEntriesForDateInterval_previousEntry___block_invoke;
  v49[3] = &unk_1E621A8A8;
  v55 = frequencyPerMinute;
  v18 = v15;
  v50 = v18;
  v19 = v14;
  v51 = v19;
  v20 = v6;
  v52 = v20;
  v56 = v8;
  v21 = v40;
  v53 = v21;
  v36 = v17;
  v54 = v36;
  v22 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5E0F100](v49);
  v48 = 0;
  ((void (**)(_QWORD, id, char *))v22)[2](v22, v19, &v48);
  if (!v48)
  {
    calendar = self->_calendar;
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __90__BLSAlwaysOnFrequencyPerMinuteTimeline_unconfiguredEntriesForDateInterval_previousEntry___block_invoke_2;
    v46[3] = &unk_1E621A8D0;
    v47 = v22;
    -[NSCalendar enumerateDatesStartingAfterDate:matchingComponents:options:usingBlock:](calendar, "enumerateDatesStartingAfterDate:matchingComponents:options:usingBlock:", v19, v10, 5120, v46);

  }
  v24 = objc_msgSend(v21, "count");
  if (v24 >= 2)
  {
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __90__BLSAlwaysOnFrequencyPerMinuteTimeline_unconfiguredEntriesForDateInterval_previousEntry___block_invoke_3;
    v44[3] = &unk_1E621A8F8;
    v45 = v20;
    v25 = objc_msgSend(v21, "indexOfObjectPassingTest:", v44);
    if (v25 == 0x7FFFFFFFFFFFFFFFLL || (v24 = v25, v25 > 1))
      objc_msgSend(v21, "removeObjectsInRange:", 0, v24 - 1);

  }
  v26 = +[BLSFidelityThreshold fidelityForUpdateInterval:](BLSFidelityThreshold, "fidelityForUpdateInterval:", 60.0 / (double)self->_frequencyPerMinute);
  bls_timelines_log();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    -[BLSAlwaysOnTimeline identifier](self, "identifier");
    v35 = (id)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v21, "count");
    NSStringFromBLSUpdateFidelity(v26);
    v34 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "bls_shortLoggingString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "bls_boundedDescriptionWithMax:transformer:", 8, &__block_literal_global_5);
    v30 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219522;
    v58 = self;
    v59 = 2114;
    v60 = v35;
    v61 = 1024;
    v62 = v32;
    v63 = 2112;
    v64 = v34;
    v65 = 1024;
    v66 = frequencyPerMinute;
    v67 = 2114;
    v68 = v31;
    v69 = 2112;
    v33 = (void *)v30;
    v70 = v30;
    _os_log_debug_impl(&dword_1B0C75000, v27, OS_LOG_TYPE_DEBUG, "%p:%{public}@ -> %d entries(%@) @ %d/m for %{public}@ : %@", buf, 0x40u);

  }
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __90__BLSAlwaysOnFrequencyPerMinuteTimeline_unconfiguredEntriesForDateInterval_previousEntry___block_invoke_57;
  v43[3] = &__block_descriptor_40_e16__16__0__NSDate_8l;
  v43[4] = v26;
  objc_msgSend(v21, "bs_map:", v43);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

void __90__BLSAlwaysOnFrequencyPerMinuteTimeline_unconfiguredEntriesForDateInterval_previousEntry___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  _BOOL4 v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = 0;
  v7 = *(_QWORD *)(a1 + 72);
  v13 = v5;
  v8 = v5;
  while (1)
  {
    objc_msgSend(*(id *)(a1 + 32), "dateByAddingUnit:value:toDate:options:", 128, (uint64_t)((double)++v6 * (60.0 / (double)v7) + 0.5), v13, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(id *)(a1 + 40) != v13
      || ((v10 = objc_msgSend(*(id *)(a1 + 48), "compare:", v9), *(_BYTE *)(a1 + 80))
        ? (v11 = v10 == -1)
        : (v11 = v10 != 1),
          v11))
    {
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v8);
    }
    v12 = v9;

    if (objc_msgSend(v12, "compare:", *(_QWORD *)(a1 + 64)) == 1)
      break;

    v7 = *(_QWORD *)(a1 + 72);
    v8 = v12;
    if (v6 >= v7)
      goto LABEL_12;
  }
  *a3 = 1;

LABEL_12:
}

uint64_t __90__BLSAlwaysOnFrequencyPerMinuteTimeline_unconfiguredEntriesForDateInterval_previousEntry___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

BOOL __90__BLSAlwaysOnFrequencyPerMinuteTimeline_unconfiguredEntriesForDateInterval_previousEntry___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:", *(_QWORD *)(a1 + 32)) != -1;
}

id __90__BLSAlwaysOnFrequencyPerMinuteTimeline_unconfiguredEntriesForDateInterval_previousEntry___block_invoke_4(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "bls_shortLoggingString");
  return (id)objc_claimAutoreleasedReturnValue();
}

id __90__BLSAlwaysOnFrequencyPerMinuteTimeline_unconfiguredEntriesForDateInterval_previousEntry___block_invoke_57(uint64_t a1, uint64_t a2)
{
  +[BLSAlwaysOnTimelineUnconfiguredEntry entryForPresentationTime:withRequestedFidelity:](BLSAlwaysOnTimelineUnconfiguredEntry, "entryForPresentationTime:withRequestedFidelity:", a2, *(_QWORD *)(a1 + 32));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
}

- (void)initWithPerMinuteUpdateFrequency:(int)a1 identifier:(uint64_t)a2 configure:(os_log_t)log .cold.1(int a1, uint64_t a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a1;
  v4 = 2112;
  v5 = a2;
  _os_log_fault_impl(&dword_1B0C75000, log, OS_LOG_TYPE_FAULT, "frequency:%d for identifier:%@ must be > 0, using 1 instead", (uint8_t *)v3, 0x12u);
}

@end
