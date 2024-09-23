@implementation BSDateFormatterCache

+ (id)formatterForDateAsTimeNoAMPMWithLocale:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v4, "setLocale:", v3);
  objc_msgSend(v4, "setLocalizedDateFormatFromTemplate:", CFSTR("Jmm"));

  return v4;
}

- (BSDateFormatterCache)init
{
  BSDateFormatterCache *v2;
  BSDateFormatterCache *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BSDateFormatterCache;
  v2 = -[BSDateFormatterCache init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[BSDateFormatterCache _resetFormatters](v2, "_resetFormatters");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel__resetFormatters, *MEMORY[0x1E0C998A0], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)BSDateFormatterCache;
  -[BSDateFormatterCache dealloc](&v4, sel_dealloc);
}

+ (id)sharedInstance
{
  if (qword_1ECD39B20 != -1)
    dispatch_once(&qword_1ECD39B20, &__block_literal_global_32);
  return (id)_MergedGlobals_35;
}

void __38__BSDateFormatterCache_sharedInstance__block_invoke()
{
  BSDateFormatterCache *v0;
  void *v1;

  v0 = objc_alloc_init(BSDateFormatterCache);
  v1 = (void *)_MergedGlobals_35;
  _MergedGlobals_35 = (uint64_t)v0;

}

- (void)resetFormattersIfNecessary
{
  NSLocale *v2;
  NSLocale *locale;
  BOOL v4;
  BSDateFormatterCache *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (NSLocale *)objc_claimAutoreleasedReturnValue();
  locale = obj->_locale;
  if (v2 != locale)
  {
    if (v2)
      v4 = locale == 0;
    else
      v4 = 1;
    if (v4 || (-[NSLocale isEqual:](v2, "isEqual:") & 1) == 0)
      -[BSDateFormatterCache _resetFormatters:](obj, "_resetFormatters:", v2);
  }

  objc_sync_exit(obj);
}

- (id)formatNumberAsDecimal:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__BSDateFormatterCache_formatNumberAsDecimal___block_invoke;
  v8[3] = &unk_1E1EC00D8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __46__BSDateFormatterCache_formatNumberAsDecimal___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 144);
    *(_QWORD *)(v4 + 144) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setLocale:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "setNumberStyle:", 1);
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
  }
  return objc_msgSend(v2, "stringFromNumber:", *(_QWORD *)(a1 + 40));
}

- (id)_performFormattingWithSynchronizedBlock:(void *)a1
{
  void (**v3)(_QWORD);
  void (**v4)(_QWORD);
  id v5;
  void *v6;
  void *v8;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel__performFormattingWithSynchronizedBlock_, a1, CFSTR("BSDateFormatterCache.m"), 436, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

    }
    v5 = a1;
    objc_sync_enter(v5);
    objc_msgSend(v5, "resetFormattersIfNecessary");
    v4[2](v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)formatDateAsDayOfWeek:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__BSDateFormatterCache_formatDateAsDayOfWeek___block_invoke;
  v8[3] = &unk_1E1EC00D8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __46__BSDateFormatterCache_formatDateAsDayOfWeek___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setLocale:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("cccc"), 0, *(_QWORD *)(v6 + 8));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDateFormat:", v8);

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  return objc_msgSend(v2, "stringFromDate:", *(_QWORD *)(a1 + 40));
}

- (id)formatDateAsAbbreviatedDayOfWeekWithTime:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__BSDateFormatterCache_formatDateAsAbbreviatedDayOfWeekWithTime___block_invoke;
  v8[3] = &unk_1E1EC00D8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __65__BSDateFormatterCache_formatDateAsAbbreviatedDayOfWeekWithTime___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setLocale:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 24);
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("EEEjmm"), 0, *(_QWORD *)(v6 + 8));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDateFormat:", v8);

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  return objc_msgSend(v2, "stringFromDate:", *(_QWORD *)(a1 + 40));
}

- (id)formatDateAsDayMonthYearStyle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__BSDateFormatterCache_formatDateAsDayMonthYearStyle___block_invoke;
  v8[3] = &unk_1E1EC00D8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __54__BSDateFormatterCache_formatDateAsDayMonthYearStyle___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setLocale:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 32);
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("yMd"), 0, *(_QWORD *)(v6 + 8));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDateFormat:", v8);

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  }
  return objc_msgSend(v2, "stringFromDate:", *(_QWORD *)(a1 + 40));
}

- (id)formatDateAsShortDayMonthWithTimeStyle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__BSDateFormatterCache_formatDateAsShortDayMonthWithTimeStyle___block_invoke;
  v8[3] = &unk_1E1EC00D8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __63__BSDateFormatterCache_formatDateAsShortDayMonthWithTimeStyle___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setLocale:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 40);
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("Mdjmm"), 0, *(_QWORD *)(v6 + 8));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDateFormat:", v8);

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  }
  return objc_msgSend(v2, "stringFromDate:", *(_QWORD *)(a1 + 40));
}

- (id)formatDateAsAbbreviatedDayOfWeekMonthDayStyle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__BSDateFormatterCache_formatDateAsAbbreviatedDayOfWeekMonthDayStyle___block_invoke;
  v8[3] = &unk_1E1EC00D8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __70__BSDateFormatterCache_formatDateAsAbbreviatedDayOfWeekMonthDayStyle___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 48);
    *(_QWORD *)(v4 + 48) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setLocale:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 48);
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("EEEMMMd"), 0, *(_QWORD *)(v6 + 8));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDateFormat:", v8);

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  }
  return objc_msgSend(v2, "stringFromDate:", *(_QWORD *)(a1 + 40));
}

- (id)formatDateAsAbbreviatedDayMonthStyle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__BSDateFormatterCache_formatDateAsAbbreviatedDayMonthStyle___block_invoke;
  v8[3] = &unk_1E1EC00D8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __61__BSDateFormatterCache_formatDateAsAbbreviatedDayMonthStyle___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 56);
    *(_QWORD *)(v4 + 56) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setLocale:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 56);
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("MMMd"), 0, *(_QWORD *)(v6 + 8));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDateFormat:", v8);

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  }
  return objc_msgSend(v2, "stringFromDate:", *(_QWORD *)(a1 + 40));
}

- (id)formatDateAsAbbreviatedDayMonthWithTimeStyle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__BSDateFormatterCache_formatDateAsAbbreviatedDayMonthWithTimeStyle___block_invoke;
  v8[3] = &unk_1E1EC00D8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __69__BSDateFormatterCache_formatDateAsAbbreviatedDayMonthWithTimeStyle___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 64);
    *(_QWORD *)(v4 + 64) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setLocale:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 64);
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("MMMdjmm"), 0, *(_QWORD *)(v6 + 8));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDateFormat:", v8);

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  }
  return objc_msgSend(v2, "stringFromDate:", *(_QWORD *)(a1 + 40));
}

- (id)formatDateAsTimeStyle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__BSDateFormatterCache_formatDateAsTimeStyle___block_invoke;
  v8[3] = &unk_1E1EC00D8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __46__BSDateFormatterCache_formatDateAsTimeStyle___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 72);
    *(_QWORD *)(v4 + 72) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setLocale:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setDateStyle:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setTimeStyle:", 1);
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  }
  return objc_msgSend(v2, "stringFromDate:", *(_QWORD *)(a1 + 40));
}

- (id)formatDateAsRelativeDateAndTimeStyle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__BSDateFormatterCache_formatDateAsRelativeDateAndTimeStyle___block_invoke;
  v8[3] = &unk_1E1EC00D8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __61__BSDateFormatterCache_formatDateAsRelativeDateAndTimeStyle___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 80);
    *(_QWORD *)(v4 + 80) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setLocale:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setDateStyle:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setTimeStyle:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setDoesRelativeDateFormatting:", 1);
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 80);
  }
  return objc_msgSend(v2, "stringFromDate:", *(_QWORD *)(a1 + 40));
}

- (id)formatDateAsDayOfWeekMonthDayStyle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__BSDateFormatterCache_formatDateAsDayOfWeekMonthDayStyle___block_invoke;
  v8[3] = &unk_1E1EC00D8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __59__BSDateFormatterCache_formatDateAsDayOfWeekMonthDayStyle___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 96);
    *(_QWORD *)(v4 + 96) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setLocale:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setFormattingContext:", 2);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 96);
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("EEEEMMMMd"), 0, *(_QWORD *)(v6 + 8));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDateFormat:", v8);

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  }
  return objc_msgSend(v2, "stringFromDate:", *(_QWORD *)(a1 + 40));
}

- (id)formatDateAsMultiLineDayOfWeekMonthDayStyle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__BSDateFormatterCache_formatDateAsMultiLineDayOfWeekMonthDayStyle___block_invoke;
  v8[3] = &unk_1E1EC00D8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __68__BSDateFormatterCache_formatDateAsMultiLineDayOfWeekMonthDayStyle___block_invoke(uint64_t a1)
{
  -[BSDateFormatterCache _configureMultiLineDayOfWeekMonthDayFormatterIfNecessary](*(void **)(a1 + 32));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "stringFromDate:", *(_QWORD *)(a1 + 40));
}

- (void)_configureMultiLineDayOfWeekMonthDayFormatterIfNecessary
{
  id *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  id *obj;

  if (a1)
  {
    obj = a1;
    objc_sync_enter(obj);
    v1 = obj;
    if (obj[13])
    {
LABEL_21:
      objc_sync_exit(v1);

      return;
    }
    v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v3 = obj[13];
    obj[13] = v2;

    objc_msgSend(obj[13], "setLocale:", obj[1]);
    objc_msgSend(obj[13], "setFormattingContext:", 4);
    v4 = obj[13];
    v5 = obj[1];
    objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("EEEEMMMMd"), 0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "hasPrefix:", CFSTR("EEEE ")) & 1) != 0)
    {
      v7 = CFSTR("EEEE\n");
      v8 = CFSTR("EEEE ");
    }
    else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("cccc ")) & 1) != 0)
    {
      v7 = CFSTR("cccc\n");
      v8 = CFSTR("cccc ");
    }
    else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("EEEE, ")) & 1) != 0)
    {
      v7 = CFSTR("EEEE,\n");
      v8 = CFSTR("EEEE, ");
    }
    else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("cccc, ")) & 1) != 0)
    {
      v7 = CFSTR("cccc,\n");
      v8 = CFSTR("cccc, ");
    }
    else if ((objc_msgSend(v6, "hasPrefix:", CFSTR("EEEE، ")) & 1) != 0)
    {
      v7 = CFSTR("EEEE،\n");
      v8 = CFSTR("EEEE، ");
    }
    else if ((objc_msgSend(v6, "hasSuffix:", CFSTR(", EEEE")) & 1) != 0)
    {
      v7 = CFSTR(",\nEEEE");
      v8 = CFSTR(", EEEE");
    }
    else if ((objc_msgSend(v6, "hasSuffix:", CFSTR(" EEEE")) & 1) != 0)
    {
      v7 = CFSTR("\nEEEE");
      v8 = CFSTR(" EEEE");
    }
    else
    {
      if (!objc_msgSend(v6, "hasSuffix:", CFSTR("EEEE")))
      {
LABEL_20:

        objc_msgSend(v4, "setDateFormat:", v6);
        v1 = obj;
        goto LABEL_21;
      }
      v7 = CFSTR("\nEEEE");
      v8 = CFSTR("EEEE");
    }
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", v8, v7);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
    goto LABEL_20;
  }
}

- (id)formatDateAsTimeNoAMPM:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__BSDateFormatterCache_formatDateAsTimeNoAMPM___block_invoke;
  v8[3] = &unk_1E1EC00D8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __47__BSDateFormatterCache_formatDateAsTimeNoAMPM___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  if (!v2)
  {
    objc_msgSend((id)objc_opt_class(), "formatterForDateAsTimeNoAMPMWithLocale:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 112);
    *(_QWORD *)(v4 + 112) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  }
  return objc_msgSend(v2, "stringFromDate:", *(_QWORD *)(a1 + 40));
}

- (id)formatDateAsLongYMDHMSZWithDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__BSDateFormatterCache_formatDateAsLongYMDHMSZWithDate___block_invoke;
  v8[3] = &unk_1E1EC00D8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __56__BSDateFormatterCache_formatDateAsLongYMDHMSZWithDate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 120);
    *(_QWORD *)(v4 + 120) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setDateFormat:", CFSTR("yyyy'-'MM'-'dd HH:mm:ss.SSS Z"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setLocale:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  }
  return objc_msgSend(v2, "stringFromDate:", *(_QWORD *)(a1 + 40));
}

- (id)formatDateAsLongYMDHMSZPosixLocaleWithDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __67__BSDateFormatterCache_formatDateAsLongYMDHMSZPosixLocaleWithDate___block_invoke;
  v8[3] = &unk_1E1EC00D8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __67__BSDateFormatterCache_formatDateAsLongYMDHMSZPosixLocaleWithDate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 128);
    *(_QWORD *)(v4 + 128) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setDateFormat:", CFSTR("yyyy'-'MM'-'dd HH:mm:ss.SSS Z"));
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "setLocale:", v6);

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  }
  return objc_msgSend(v2, "stringFromDate:", *(_QWORD *)(a1 + 40));
}

- (id)formatDateAsLongYMDHMSNoSpacesWithDate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__BSDateFormatterCache_formatDateAsLongYMDHMSNoSpacesWithDate___block_invoke;
  v8[3] = &unk_1E1EC00D8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __63__BSDateFormatterCache_formatDateAsLongYMDHMSNoSpacesWithDate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 136);
    *(_QWORD *)(v4 + 136) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setDateFormat:", CFSTR("yyyy'-'MM'-'dd'-'HHmmss"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "setLocale:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  }
  return objc_msgSend(v2, "stringFromDate:", *(_QWORD *)(a1 + 40));
}

- (id)formatDateAsRelativeDateStyle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__BSDateFormatterCache_formatDateAsRelativeDateStyle___block_invoke;
  v8[3] = &unk_1E1EC00D8;
  v8[4] = self;
  v9 = v4;
  v5 = v4;
  -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __54__BSDateFormatterCache_formatDateAsRelativeDateStyle___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 88);
    *(_QWORD *)(v4 + 88) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setLocale:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setDateStyle:", 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setTimeStyle:", 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "setDoesRelativeDateFormatting:", 1);
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  }
  return objc_msgSend(v2, "stringFromDate:", *(_QWORD *)(a1 + 40));
}

- (id)formatDuration:(double)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__BSDateFormatterCache_formatDuration___block_invoke;
  v4[3] = &unk_1E1EC0100;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  -[BSDateFormatterCache _performFormattingWithSynchronizedBlock:](self, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __39__BSDateFormatterCache_formatDuration___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3570]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 152);
    *(_QWORD *)(v4 + 152) = v3;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setUnitsStyle:", 2);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "setAllowedUnits:", 252);
    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 152);
  }
  return objc_msgSend(v2, "stringFromTimeInterval:", *(double *)(a1 + 40));
}

- (id)formatTimerDuration:(double)a3
{
  uint64_t v3;
  BOOL v4;
  int v5;
  BSDateFormatterCache *v6;
  NSNumberFormatter *timerNumberFormatter;
  NSNumberFormatter *v8;
  NSNumberFormatter *v9;
  NSNumberFormatter *v10;
  void *v11;
  __CFString *v12;
  NSNumberFormatter *v13;
  void *v14;
  void *v15;
  NSNumberFormatter *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = (uint64_t)a3;
  if (self)
    v4 = v3 <= 3599;
  else
    v4 = 1;
  v5 = !v4;
  v6 = self;
  objc_sync_enter(v6);
  -[BSDateFormatterCache resetFormattersIfNecessary](v6, "resetFormattersIfNecessary");
  timerNumberFormatter = v6->_timerNumberFormatter;
  if (!timerNumberFormatter)
  {
    v8 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v9 = v6->_timerNumberFormatter;
    v6->_timerNumberFormatter = v8;

    -[NSNumberFormatter setNumberStyle:](v6->_timerNumberFormatter, "setNumberStyle:", 0);
    timerNumberFormatter = v6->_timerNumberFormatter;
  }
  -[NSNumberFormatter setPositiveFormat:](timerNumberFormatter, "setPositiveFormat:", CFSTR("0"));
  if (v5)
  {
    v10 = v6->_timerNumberFormatter;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3 / 3600);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSNumberFormatter stringFromNumber:](v10, "stringFromNumber:", v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = &stru_1E1EC08D0;
  }
  -[NSNumberFormatter setPositiveFormat:](v6->_timerNumberFormatter, "setPositiveFormat:", CFSTR("00"));
  v13 = v6->_timerNumberFormatter;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3 / 60 % 60);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](v13, "stringFromNumber:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v6->_timerNumberFormatter;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v3 % 60);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumberFormatter stringFromNumber:](v16, "stringFromNumber:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v6);
  v19 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("COUNT_DOWN_TIMER_HMMSS_FORMAT"), &stru_1E1EC08D0, CFSTR("SpringBoard"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", v21, v12, v15, v18);
  }
  else
  {
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("COUNT_DOWN_TIMER_MMSS_FORMAT"), &stru_1E1EC08D0, CFSTR("SpringBoard"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", v21, v15, v18);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)formatAbbreviatedTimerDuration:(double)a3
{
  BSDateFormatterCache *v4;
  NSDateComponentsFormatter *abbreviatedTimerFormatter;
  NSDateComponentsFormatter *v6;
  NSDateComponentsFormatter *v7;
  uint64_t v8;
  void *v9;

  v4 = self;
  objc_sync_enter(v4);
  -[BSDateFormatterCache resetFormattersIfNecessary](v4, "resetFormattersIfNecessary");
  abbreviatedTimerFormatter = v4->_abbreviatedTimerFormatter;
  if (!abbreviatedTimerFormatter)
  {
    v6 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E0CB3570]);
    v7 = v4->_abbreviatedTimerFormatter;
    v4->_abbreviatedTimerFormatter = v6;

    -[NSDateComponentsFormatter setZeroFormattingBehavior:](v4->_abbreviatedTimerFormatter, "setZeroFormattingBehavior:", 0);
    abbreviatedTimerFormatter = v4->_abbreviatedTimerFormatter;
  }
  if ((uint64_t)a3 <= 3599)
    v8 = 192;
  else
    v8 = 224;
  -[NSDateComponentsFormatter setAllowedUnits:](abbreviatedTimerFormatter, "setAllowedUnits:", v8);
  -[NSDateComponentsFormatter stringFromTimeInterval:](v4->_abbreviatedTimerFormatter, "stringFromTimeInterval:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v4);

  return v9;
}

- (id)formatAlarmSnoozeDuration:(double)a3
{
  BSDateFormatterCache *v4;
  NSDateComponentsFormatter *alarmSnoozeFormatter;
  NSDateComponentsFormatter *v6;
  NSDateComponentsFormatter *v7;
  uint64_t v8;
  void *v9;

  v4 = self;
  objc_sync_enter(v4);
  -[BSDateFormatterCache resetFormattersIfNecessary](v4, "resetFormattersIfNecessary");
  alarmSnoozeFormatter = v4->_alarmSnoozeFormatter;
  if (!alarmSnoozeFormatter)
  {
    v6 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x1E0CB3570]);
    v7 = v4->_alarmSnoozeFormatter;
    v4->_alarmSnoozeFormatter = v6;

    -[NSDateComponentsFormatter setZeroFormattingBehavior:](v4->_alarmSnoozeFormatter, "setZeroFormattingBehavior:", 0);
    alarmSnoozeFormatter = v4->_alarmSnoozeFormatter;
  }
  if ((uint64_t)a3 <= 3599)
    v8 = 192;
  else
    v8 = 224;
  -[NSDateComponentsFormatter setAllowedUnits:](alarmSnoozeFormatter, "setAllowedUnits:", v8);
  -[NSDateComponentsFormatter stringFromTimeInterval:](v4->_alarmSnoozeFormatter, "stringFromTimeInterval:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v4);

  return v9;
}

- (BOOL)supportsMultiLineDayOfWeekMonthDayStyle
{
  BSDateFormatterCache *v2;
  void *v3;
  char v4;

  v2 = self;
  objc_sync_enter(v2);
  -[BSDateFormatterCache _configureMultiLineDayOfWeekMonthDayFormatterIfNecessary](v2);
  -[NSDateFormatter dateFormat](v2->_multiLineDayOfWeekMonthDayFormatter, "dateFormat");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", CFSTR("\n"));

  objc_sync_exit(v2);
  return v4;
}

- (void)_resetFormatters:(id)a3
{
  NSLocale *v4;
  NSLocale *locale;
  NSLocale *v6;
  NSDateFormatter *dayOfWeekFormatter;
  NSDateFormatter *dayOfWeekWithTimeFormatter;
  NSDateFormatter *dayMonthYearFormatter;
  NSDateFormatter *shortDayMonthTimeFormatter;
  NSDateFormatter *abbrevDayOfWeekWithMonthDayFormatter;
  NSDateFormatter *abbrevDayMonthFormatter;
  NSDateFormatter *abbrevDayMonthTimeFormatter;
  NSDateFormatter *dayOfWeekMonthDayFormatter;
  NSDateFormatter *multiLineDayOfWeekMonthDayFormatter;
  NSDateFormatter *timeNoAMPMFormatter;
  NSDateFormatter *timeFormatter;
  NSDateFormatter *relativeDateTimeFormatter;
  NSDateFormatter *relativeDateFormatter;
  NSNumberFormatter *decimalFormatter;
  NSDateComponentsFormatter *durationFormatter;
  NSNumberFormatter *timerNumberFormatter;
  NSDateComponentsFormatter *abbreviatedTimerFormatter;
  NSDateComponentsFormatter *alarmSnoozeFormatter;
  NSDateFormatter *longYMDHMSZFormatter;
  NSDateFormatter *longYMDHMSNoSpaceFormatter;
  BSDateFormatterCache *obj;

  v4 = (NSLocale *)a3;
  obj = self;
  objc_sync_enter(obj);
  locale = obj->_locale;
  obj->_locale = v4;
  v6 = v4;

  dayOfWeekFormatter = obj->_dayOfWeekFormatter;
  obj->_dayOfWeekFormatter = 0;

  dayOfWeekWithTimeFormatter = obj->_dayOfWeekWithTimeFormatter;
  obj->_dayOfWeekWithTimeFormatter = 0;

  dayMonthYearFormatter = obj->_dayMonthYearFormatter;
  obj->_dayMonthYearFormatter = 0;

  shortDayMonthTimeFormatter = obj->_shortDayMonthTimeFormatter;
  obj->_shortDayMonthTimeFormatter = 0;

  abbrevDayOfWeekWithMonthDayFormatter = obj->_abbrevDayOfWeekWithMonthDayFormatter;
  obj->_abbrevDayOfWeekWithMonthDayFormatter = 0;

  abbrevDayMonthFormatter = obj->_abbrevDayMonthFormatter;
  obj->_abbrevDayMonthFormatter = 0;

  abbrevDayMonthTimeFormatter = obj->_abbrevDayMonthTimeFormatter;
  obj->_abbrevDayMonthTimeFormatter = 0;

  dayOfWeekMonthDayFormatter = obj->_dayOfWeekMonthDayFormatter;
  obj->_dayOfWeekMonthDayFormatter = 0;

  multiLineDayOfWeekMonthDayFormatter = obj->_multiLineDayOfWeekMonthDayFormatter;
  obj->_multiLineDayOfWeekMonthDayFormatter = 0;

  timeNoAMPMFormatter = obj->_timeNoAMPMFormatter;
  obj->_timeNoAMPMFormatter = 0;

  timeFormatter = obj->_timeFormatter;
  obj->_timeFormatter = 0;

  relativeDateTimeFormatter = obj->_relativeDateTimeFormatter;
  obj->_relativeDateTimeFormatter = 0;

  relativeDateFormatter = obj->_relativeDateFormatter;
  obj->_relativeDateFormatter = 0;

  decimalFormatter = obj->_decimalFormatter;
  obj->_decimalFormatter = 0;

  durationFormatter = obj->_durationFormatter;
  obj->_durationFormatter = 0;

  timerNumberFormatter = obj->_timerNumberFormatter;
  obj->_timerNumberFormatter = 0;

  abbreviatedTimerFormatter = obj->_abbreviatedTimerFormatter;
  obj->_abbreviatedTimerFormatter = 0;

  alarmSnoozeFormatter = obj->_alarmSnoozeFormatter;
  obj->_alarmSnoozeFormatter = 0;

  longYMDHMSZFormatter = obj->_longYMDHMSZFormatter;
  obj->_longYMDHMSZFormatter = 0;

  longYMDHMSNoSpaceFormatter = obj->_longYMDHMSNoSpaceFormatter;
  obj->_longYMDHMSNoSpaceFormatter = 0;

  objc_sync_exit(obj);
}

- (void)_resetFormatters
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BSDateFormatterCache _resetFormatters:](self, "_resetFormatters:");

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmSnoozeFormatter, 0);
  objc_storeStrong((id *)&self->_abbreviatedTimerFormatter, 0);
  objc_storeStrong((id *)&self->_timerNumberFormatter, 0);
  objc_storeStrong((id *)&self->_durationFormatter, 0);
  objc_storeStrong((id *)&self->_decimalFormatter, 0);
  objc_storeStrong((id *)&self->_longYMDHMSNoSpaceFormatter, 0);
  objc_storeStrong((id *)&self->_longYMDHMSZPosixLocaleFormatter, 0);
  objc_storeStrong((id *)&self->_longYMDHMSZFormatter, 0);
  objc_storeStrong((id *)&self->_timeNoAMPMFormatter, 0);
  objc_storeStrong((id *)&self->_multiLineDayOfWeekMonthDayFormatter, 0);
  objc_storeStrong((id *)&self->_dayOfWeekMonthDayFormatter, 0);
  objc_storeStrong((id *)&self->_relativeDateFormatter, 0);
  objc_storeStrong((id *)&self->_relativeDateTimeFormatter, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_abbrevDayMonthTimeFormatter, 0);
  objc_storeStrong((id *)&self->_abbrevDayMonthFormatter, 0);
  objc_storeStrong((id *)&self->_abbrevDayOfWeekWithMonthDayFormatter, 0);
  objc_storeStrong((id *)&self->_shortDayMonthTimeFormatter, 0);
  objc_storeStrong((id *)&self->_dayMonthYearFormatter, 0);
  objc_storeStrong((id *)&self->_dayOfWeekWithTimeFormatter, 0);
  objc_storeStrong((id *)&self->_dayOfWeekFormatter, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
