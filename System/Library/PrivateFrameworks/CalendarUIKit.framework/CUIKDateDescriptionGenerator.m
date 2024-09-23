@implementation CUIKDateDescriptionGenerator

+ (id)sharedGenerator
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CUIKDateDescriptionGenerator_sharedGenerator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedGenerator_onceToken_0 != -1)
    dispatch_once(&sharedGenerator_onceToken_0, block);
  return (id)sharedGenerator___sharedInstance_0;
}

void __47__CUIKDateDescriptionGenerator_sharedGenerator__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *LocalCenter;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedGenerator___sharedInstance_0;
  sharedGenerator___sharedInstance_0 = (uint64_t)v1;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_CUIKDateDescriptionGeneratorDateTimeFormatChanged, (CFStringRef)*MEMORY[0x1E0D0C4B8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)_CUIKDateDescriptionGeneratorDateTimeFormatChanged, (CFStringRef)*MEMORY[0x1E0D0C4C8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (CUIKDateDescriptionGenerator)init
{
  CUIKDateDescriptionGenerator *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *serialFormatterEditQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUIKDateDescriptionGenerator;
  v2 = -[CUIKDateDescriptionGenerator init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("Serial Formatter Edit Queue", 0);
    serialFormatterEditQueue = v2->_serialFormatterEditQueue;
    v2->_serialFormatterEditQueue = (OS_dispatch_queue *)v3;

    -[CUIKDateDescriptionGenerator _initializeFormatters](v2, "_initializeFormatters");
  }
  return v2;
}

- (void)_initializeFormatters
{
  NSObject *serialFormatterEditQueue;
  _QWORD block[5];

  serialFormatterEditQueue = self->_serialFormatterEditQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CUIKDateDescriptionGenerator__initializeFormatters__block_invoke;
  block[3] = &unk_1E6EB60F8;
  block[4] = self;
  dispatch_sync(serialFormatterEditQueue, block);
}

uint64_t __53__CUIKDateDescriptionGenerator__initializeFormatters__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;

  v2 = objc_opt_new();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v2;

  v5 = objc_opt_new();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v5;

  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocale:", v9);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setDateStyle:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setTimeStyle:", 0);
  v10 = objc_opt_new();
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 32);
  *(_QWORD *)(v11 + 32) = v10;

  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLocale:", v14);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setDateStyle:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setTimeStyle:", 1);
  v15 = objc_opt_new();
  v16 = *(_QWORD *)(a1 + 32);
  v17 = *(void **)(v16 + 16);
  *(_QWORD *)(v16 + 16) = v15;

  v18 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLocale:", v19);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setDateStyle:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setTimeStyle:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setDateFormat:", CFSTR("EEEE"));
  v20 = objc_opt_new();
  v21 = *(_QWORD *)(a1 + 32);
  v22 = *(void **)(v21 + 24);
  *(_QWORD *)(v21 + 24) = v20;

  v23 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setLocale:", v24);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDateStyle:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setTimeStyle:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDateFormat:", CFSTR("EEE"));
  v25 = objc_opt_new();
  v26 = *(_QWORD *)(a1 + 32);
  v27 = *(void **)(v26 + 40);
  *(_QWORD *)(v26 + 40) = v25;

  v28 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setLocale:", v29);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setDateStyle:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setTimeStyle:", 1);
  v30 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v31 = *(_QWORD *)(a1 + 32);
  v32 = *(void **)(v31 + 56);
  *(_QWORD *)(v31 + 56) = v30;

  v33 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setLocale:", v34);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setDateStyle:", 4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "setTimeStyle:", 0);
  v35 = objc_opt_new();
  v36 = *(_QWORD *)(a1 + 32);
  v37 = *(void **)(v36 + 64);
  *(_QWORD *)(v36 + 64) = v35;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setDateFormat:", CFSTR("e"));
}

- (id)_customFormatter
{
  NSObject *serialFormatterEditQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  serialFormatterEditQueue = self->_serialFormatterEditQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__CUIKDateDescriptionGenerator__customFormatter__block_invoke;
  v5[3] = &unk_1E6EB71A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialFormatterEditQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __48__CUIKDateDescriptionGenerator__customFormatter__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)timeFormatter
{
  NSObject *serialFormatterEditQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  serialFormatterEditQueue = self->_serialFormatterEditQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__CUIKDateDescriptionGenerator_timeFormatter__block_invoke;
  v5[3] = &unk_1E6EB71A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialFormatterEditQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __45__CUIKDateDescriptionGenerator_timeFormatter__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)dayFormatter
{
  NSObject *serialFormatterEditQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  serialFormatterEditQueue = self->_serialFormatterEditQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__CUIKDateDescriptionGenerator_dayFormatter__block_invoke;
  v5[3] = &unk_1E6EB71A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialFormatterEditQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__CUIKDateDescriptionGenerator_dayFormatter__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)abbreviatedDayFormatter
{
  NSObject *serialFormatterEditQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  serialFormatterEditQueue = self->_serialFormatterEditQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__CUIKDateDescriptionGenerator_abbreviatedDayFormatter__block_invoke;
  v5[3] = &unk_1E6EB71A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialFormatterEditQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __55__CUIKDateDescriptionGenerator_abbreviatedDayFormatter__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)standardTimeFormatter
{
  NSObject *serialFormatterEditQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  serialFormatterEditQueue = self->_serialFormatterEditQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__CUIKDateDescriptionGenerator_standardTimeFormatter__block_invoke;
  v5[3] = &unk_1E6EB71A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialFormatterEditQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __53__CUIKDateDescriptionGenerator_standardTimeFormatter__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)fullStyleDateFormatter
{
  NSObject *serialFormatterEditQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  serialFormatterEditQueue = self->_serialFormatterEditQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__CUIKDateDescriptionGenerator_fullStyleDateFormatter__block_invoke;
  v5[3] = &unk_1E6EB71A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialFormatterEditQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __54__CUIKDateDescriptionGenerator_fullStyleDateFormatter__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)dayOfWeekFormatter
{
  NSObject *serialFormatterEditQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__9;
  v10 = __Block_byref_object_dispose__9;
  v11 = 0;
  serialFormatterEditQueue = self->_serialFormatterEditQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__CUIKDateDescriptionGenerator_dayOfWeekFormatter__block_invoke;
  v5[3] = &unk_1E6EB71A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialFormatterEditQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __50__CUIKDateDescriptionGenerator_dayOfWeekFormatter__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_dateFormatterWithLongFormat:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocale:", v5);

  v6 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(v4, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFormatFromTemplate:options:locale:", v3, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setDateFormat:", v8);
  return v4;
}

- (id)formatterForLongFormat:(id)a3
{
  id v4;
  NSObject *serialFormatterEditQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  v17 = 0;
  serialFormatterEditQueue = self->_serialFormatterEditQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CUIKDateDescriptionGenerator_formatterForLongFormat___block_invoke;
  block[3] = &unk_1E6EB71D0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(serialFormatterEditQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __55__CUIKDateDescriptionGenerator_formatterForLongFormat___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_dateFormatterWithLongFormat:", *(_QWORD *)(a1 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));
  }
}

- (id)stringForDate:(id)a3 withLongFormatString:(id)a4 useAbbreviatedFormats:(BOOL)a5 lowerCase:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v6 = a6;
  v7 = a5;
  v10 = (void *)MEMORY[0x1E0C99D68];
  v11 = a4;
  v12 = a3;
  objc_msgSend(v10, "date");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKDateDescriptionGenerator _stringForDate:relativeToReferenceDate:withLongFormatString:useAbbreviatedFormats:lowerCase:](self, "_stringForDate:relativeToReferenceDate:withLongFormatString:useAbbreviatedFormats:lowerCase:", v12, v13, v11, v7, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_stringForDate:(id)a3 relativeToReferenceDate:(id)a4 withLongFormatString:(id)a5 useAbbreviatedFormats:(BOOL)a6 lowerCase:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  const __CFString *v22;
  CUIKDateDescriptionGenerator *v23;
  char v24;
  uint64_t v25;
  unint64_t v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  BOOL v36;
  _BOOL8 v37;
  uint64_t v38;
  _BOOL8 v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  void *v47;
  uint64_t v48;
  id v49;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v49 = a5;
  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v48 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "CalGregorianCalendarForTimeZone:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLocale:", v15);

  v16 = objc_msgSend(v14, "isDate:inSameDayAsDate:", v12, v13);
  objc_msgSend(v13, "dateByAddingDays:inCalendar:", -1, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v14, "isDate:inSameDayAsDate:", v12, v17);
  objc_msgSend(v13, "dateByAddingDays:inCalendar:", 1, v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v14, "isDate:inSameDayAsDate:", v12, v19);
  if (v16)
  {
    CUIKBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v22 = CFSTR("today");
    else
      v22 = CFSTR("Today");
LABEL_19:
    objc_msgSend(v21, "localizedStringForKey:value:table:", v22, &stru_1E6EBAE30, 0);
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)v48;
    v28 = v49;
    goto LABEL_20;
  }
  if (v18)
  {
    CUIKBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v22 = CFSTR("yesterday");
    else
      v22 = CFSTR("Yesterday");
    goto LABEL_19;
  }
  if (v20)
  {
    CUIKBundle();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v22 = CFSTR("tomorrow");
    else
      v22 = CFSTR("Tomorrow");
    goto LABEL_19;
  }
  v23 = self;
  v24 = objc_msgSend(v12, "CalIsAfterDate:", v13);
  objc_msgSend(v14, "components:fromDate:toDate:options:", 240, v12, v13, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v21, "day");
  if (v25 >= 0)
    v26 = v25;
  else
    v26 = -v25;
  if (v26 > 6)
  {
    v28 = v49;
    if (v49)
      -[CUIKDateDescriptionGenerator formatterForLongFormat:](v23, "formatterForLongFormat:", v49);
    else
      -[CUIKDateDescriptionGenerator fullStyleDateFormatter](v23, "fullStyleDateFormatter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v31;
    v29 = (void *)v48;
    if (v12)
    {
      objc_msgSend(v31, "stringFromDate:", v12);
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = &stru_1E6EBAE30;
    }
  }
  else
  {
    v46 = v24;
    if (a6)
      -[CUIKDateDescriptionGenerator abbreviatedDayFormatter](v23, "abbreviatedDayFormatter");
    else
      -[CUIKDateDescriptionGenerator dayFormatter](v23, "dayFormatter");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "stringFromDate:", v12);
    v45 = objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v14, "component:fromDate:", 512, v12);
    v44 = objc_msgSend(v14, "component:fromDate:", 0x2000, v12);
    v33 = objc_msgSend(v14, "component:fromDate:", 0x2000, v13);
    v34 = (void *)objc_opt_class();
    if ((v46 & 1) != 0)
    {
      v35 = (void *)v45;
      v36 = v44 <= v33;
      v37 = v7;
      v29 = (void *)v48;
      v28 = v49;
      if (v36)
        objc_msgSend(v34, "_dateAfterTodayThisWeekFormatStringForDayOfWeek:generateLowercaseString:", v32, v37);
      else
        objc_msgSend(v34, "_dateAfterTodayNextWeekFormatStringForDayOfWeek:generateLowercaseString:", v32, v37);
    }
    else
    {
      v35 = (void *)v45;
      v36 = v44 < v33;
      v39 = v7;
      v29 = (void *)v48;
      v28 = v49;
      if (v36)
        objc_msgSend(v34, "_dateBeforeTodayLastWeekFormatStringForDayOfWeek:generateLowercaseString:", v32, v39);
      else
        objc_msgSend(v34, "_dateBeforeTodayThisWeekFormatStringForDayOfWeek:generateLowercaseString:", v32, v39);
    }
    v38 = objc_claimAutoreleasedReturnValue();
    v41 = (void *)v38;
    v27 = &stru_1E6EBAE30;
    if (v38 && v35)
    {
      v42 = (void *)v38;
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithValidatedFormat:validFormatSpecifiers:error:", v38, CFSTR("%@"), 0, v35);
      v43 = objc_claimAutoreleasedReturnValue();
      v41 = v42;
      v27 = (__CFString *)v43;
    }

    v40 = v47;
  }

LABEL_20:
  return v27;
}

+ (id)_dateAfterTodayNextWeekFormatStringForDayOfWeek:(int64_t)a3 generateLowercaseString:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  const __CFString *v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;

  v4 = a4;
  switch(a3)
  {
    case 1:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Date after today, but in next week ('next Thursday').  Format for #1 day of the week.");
        goto LABEL_19;
      }
      v6 = CFSTR("Date after today, but in next week ('next Thursday').  Format for #1 day of the week. (capitalized)");
      goto LABEL_27;
    case 2:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Date after today, but in next week ('next Thursday').  Format for #2 day of the week..");
        goto LABEL_19;
      }
      v6 = CFSTR("Date after today, but in next week ('next Thursday').  Format for #2 day of the week. (capitalized).");
      goto LABEL_27;
    case 3:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Date after today, but in next week ('next Thursday').  Format for #3 day of the week..");
        goto LABEL_19;
      }
      v6 = CFSTR("Date after today, but in next week ('next Thursday').  Format for #3 day of the week. (capitalized).");
      goto LABEL_27;
    case 4:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Date after today, but in next week ('next Thursday').  Format for #4 day of the week..");
        goto LABEL_19;
      }
      v6 = CFSTR("Date after today, but in next week ('next Thursday').  Format for #4 day of the week. (capitalized).");
      goto LABEL_27;
    case 5:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Date after today, but in next week ('next Thursday').  Format for #5 day of the week..");
        goto LABEL_19;
      }
      v6 = CFSTR("Date after today, but in next week ('next Thursday').  Format for #5 day of the week. (capitalized).");
      goto LABEL_27;
    case 6:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Date after today, but in next week ('next Thursday').  Format for #6 day of the week..");
        goto LABEL_19;
      }
      v6 = CFSTR("Date after today, but in next week ('next Thursday').  Format for #6 day of the week. (capitalized).");
      goto LABEL_27;
    case 7:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Date after today, but in next week ('next Thursday').  Format for #7 day of the week..");
LABEL_19:
        v9 = CFSTR("next %@");
      }
      else
      {
        v6 = CFSTR("Date after today, but in next week ('next Thursday').  Format for #7 day of the week. (capitalized).");
LABEL_27:
        v9 = CFSTR("Next %@");
      }
      objc_msgSend(v5, "localizedStringForKey:value:table:", v6, v9, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      return v8;
    default:
      +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[CUIKDateDescriptionGenerator _dateAfterTodayNextWeekFormatStringForDayOfWeek:generateLowercaseString:].cold.1();

      v8 = 0;
      return v8;
  }
}

+ (id)_dateAfterTodayThisWeekFormatStringForDayOfWeek:(int64_t)a3 generateLowercaseString:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  const __CFString *v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;

  v4 = a4;
  switch(a3)
  {
    case 1:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Date after today, but in this week ('this Friday').  Format 1.");
        goto LABEL_19;
      }
      v6 = CFSTR("Date after today, but in this week ('this Friday').  Format 1 (capitalized).");
      goto LABEL_27;
    case 2:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Date after today, but in this week ('this Friday').  Format 2.");
        goto LABEL_19;
      }
      v6 = CFSTR("Date after today, but in this week ('this Friday').  Format 2 (capitalized).");
      goto LABEL_27;
    case 3:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Date after today, but in this week ('this Friday').  Format 3.");
        goto LABEL_19;
      }
      v6 = CFSTR("Date after today, but in this week ('this Friday').  Format 3 (capitalized).");
      goto LABEL_27;
    case 4:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Date after today, but in this week ('this Friday').  Format 4.");
        goto LABEL_19;
      }
      v6 = CFSTR("Date after today, but in this week ('this Friday').  Format 4 (capitalized).");
      goto LABEL_27;
    case 5:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Date after today, but in this week ('this Friday').  Format 5.");
        goto LABEL_19;
      }
      v6 = CFSTR("Date after today, but in this week ('this Friday').  Format 5 (capitalized).");
      goto LABEL_27;
    case 6:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Date after today, but in this week ('this Friday').  Format 6.");
        goto LABEL_19;
      }
      v6 = CFSTR("Date after today, but in this week ('this Friday').  Format 6 (capitalized).");
      goto LABEL_27;
    case 7:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Date after today, but in this week ('this Friday').  Format 7.");
LABEL_19:
        v9 = CFSTR("this %@");
      }
      else
      {
        v6 = CFSTR("Date after today, but in this week ('this Friday').  Format 7 (capitalized).");
LABEL_27:
        v9 = CFSTR("This %@");
      }
      objc_msgSend(v5, "localizedStringForKey:value:table:", v6, v9, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      return v8;
    default:
      +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[CUIKDateDescriptionGenerator _dateAfterTodayThisWeekFormatStringForDayOfWeek:generateLowercaseString:].cold.1();

      v8 = 0;
      return v8;
  }
}

+ (id)_dateBeforeTodayThisWeekFormatStringForDayOfWeek:(int64_t)a3 generateLowercaseString:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  const __CFString *v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;

  v4 = a4;
  switch(a3)
  {
    case 1:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Prior day to today, but in this week ('this past Monday').  Format 1.");
        goto LABEL_19;
      }
      v6 = CFSTR("Prior day to today, but in this week ('this past Monday').  Format 1 (capitalized).");
      goto LABEL_27;
    case 2:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Prior day to today, but in this week ('this past Monday').  Format 2.");
        goto LABEL_19;
      }
      v6 = CFSTR("Prior day to today, but in this week ('this past Monday').  Format 2 (capitalized).");
      goto LABEL_27;
    case 3:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Prior day to today, but in this week ('this past Monday').  Format 3.");
        goto LABEL_19;
      }
      v6 = CFSTR("Prior day to today, but in this week ('this past Monday').  Format 3 (capitalized).");
      goto LABEL_27;
    case 4:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Prior day to today, but in this week ('this past Monday').  Format 4.");
        goto LABEL_19;
      }
      v6 = CFSTR("Prior day to today, but in this week ('this past Monday').  Format 4 (capitalized).");
      goto LABEL_27;
    case 5:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Prior day to today, but in this week ('this past Monday').  Format 5.");
        goto LABEL_19;
      }
      v6 = CFSTR("Prior day to today, but in this week ('this past Monday').  Format 5 (capitalized).");
      goto LABEL_27;
    case 6:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Prior day to today, but in this week ('this past Monday').  Format 6.");
        goto LABEL_19;
      }
      v6 = CFSTR("Prior day to today, but in this week ('this past Monday').  Format 6 (capitalized).");
      goto LABEL_27;
    case 7:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Prior day to today, but in this week ('this past Monday').  Format 7.");
LABEL_19:
        v9 = CFSTR("last %@");
      }
      else
      {
        v6 = CFSTR("Prior day to today, but in this week ('this past Monday').  Format 7 (capitalized).");
LABEL_27:
        v9 = CFSTR("Last %@");
      }
      objc_msgSend(v5, "localizedStringForKey:value:table:", v6, v9, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      return v8;
    default:
      +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[CUIKDateDescriptionGenerator _dateBeforeTodayThisWeekFormatStringForDayOfWeek:generateLowercaseString:].cold.1();

      v8 = 0;
      return v8;
  }
}

+ (id)_dateBeforeTodayLastWeekFormatStringForDayOfWeek:(int64_t)a3 generateLowercaseString:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  const __CFString *v6;
  NSObject *v7;
  __CFString *v8;
  const __CFString *v9;

  v4 = a4;
  switch(a3)
  {
    case 1:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Date prior to day, but in previous week ('last Monday').  Format 1.");
        goto LABEL_19;
      }
      v6 = CFSTR("Date prior to day, but in previous week ('last Monday').  Format 1 (capitalized).");
      goto LABEL_27;
    case 2:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Date prior to day, but in previous week ('last Monday').  Format 2.");
        goto LABEL_19;
      }
      v6 = CFSTR("Date prior to day, but in previous week ('last Monday').  Format 2 (capitalized).");
      goto LABEL_27;
    case 3:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Date prior to day, but in previous week ('last Monday').  Format 3.");
        goto LABEL_19;
      }
      v6 = CFSTR("Date prior to day, but in previous week ('last Monday').  Format 3 (capitalized).");
      goto LABEL_27;
    case 4:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Date prior to day, but in previous week ('last Monday').  Format 4.");
        goto LABEL_19;
      }
      v6 = CFSTR("Date prior to day, but in previous week ('last Monday').  Format 4 (capitalized).");
      goto LABEL_27;
    case 5:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Date prior to day, but in previous week ('last Monday').  Format 5.");
        goto LABEL_19;
      }
      v6 = CFSTR("Date prior to day, but in previous week ('last Monday').  Format 5 (capitalized).");
      goto LABEL_27;
    case 6:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Date prior to day, but in previous week ('last Monday').  Format 6.");
        goto LABEL_19;
      }
      v6 = CFSTR("Date prior to day, but in previous week ('last Monday').  Format 6 (capitalized).");
      goto LABEL_27;
    case 7:
      CUIKBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v6 = CFSTR("Date prior to day, but in previous week ('last Monday').  Format 7.");
LABEL_19:
        v9 = CFSTR("last %@");
      }
      else
      {
        v6 = CFSTR("Date prior to day, but in previous week ('last Monday').  Format 7 (capitalized).");
LABEL_27:
        v9 = CFSTR("Last %@");
      }
      objc_msgSend(v5, "localizedStringForKey:value:table:", v6, v9, 0);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      return v8;
    default:
      +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[CUIKDateDescriptionGenerator _dateBeforeTodayLastWeekFormatStringForDayOfWeek:generateLowercaseString:].cold.1();

      v8 = &stru_1E6EBAE30;
      return v8;
  }
}

- (id)_dateStringForDate:(id)a3 relativeToReferenceDate:(id)a4 allDay:(BOOL)a5 shortFormat:(BOOL)a6 lowercase:(BOOL)a7
{
  return -[CUIKDateDescriptionGenerator _stringForDate:relativeToReferenceDate:withLongFormatString:useAbbreviatedFormats:lowerCase:](self, "_stringForDate:relativeToReferenceDate:withLongFormatString:useAbbreviatedFormats:lowerCase:", a3, a4, CFSTR("EEE, MMM d"), 0, a7);
}

- (id)_timeStringForDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CUIKDateDescriptionGenerator timeFormatter](self, "timeFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)timeStringForDate:(id)a3 inTimeZone:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[CUIKDateDescriptionGenerator _timeStringForDate:](self, "_timeStringForDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "abbreviationForDate:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "localizedStringWithFormat:", CFSTR("%@ %@"), v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)dateStringForDate:(id)a3 allDay:(BOOL)a4 shortFormat:(BOOL)a5
{
  return -[CUIKDateDescriptionGenerator dateStringForDate:allDay:standalone:shortFormat:](self, "dateStringForDate:allDay:standalone:shortFormat:", a3, a4, 1, a5);
}

- (id)dateStringForDate:(id)a3 allDay:(BOOL)a4 standalone:(BOOL)a5 shortFormat:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v10 = (void *)MEMORY[0x1E0C99D68];
  v11 = a3;
  objc_msgSend(v10, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUIKDateDescriptionGenerator dateStringForDate:relativeToReferenceDate:allDay:standalone:shortFormat:](self, "dateStringForDate:relativeToReferenceDate:allDay:standalone:shortFormat:", v11, v12, v8, v7, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)dateStringForDate:(id)a3 relativeToReferenceDate:(id)a4 allDay:(BOOL)a5 standalone:(BOOL)a6 shortFormat:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  if (v9)
  {
    -[CUIKDateDescriptionGenerator _dateStringForDate:relativeToReferenceDate:allDay:shortFormat:lowercase:](self, "_dateStringForDate:relativeToReferenceDate:allDay:shortFormat:lowercase:", v12, v13, 1, v7, !v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "components:fromDate:", 28, v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "components:fromDate:", 28, v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_msgSend(v18, "year");
      if (v19 == objc_msgSend(v16, "year")
        && (v20 = objc_msgSend(v18, "month"), v20 == objc_msgSend(v16, "month"))
        && (v21 = objc_msgSend(v18, "day"), v21 == objc_msgSend(v16, "day")))
      {
        -[CUIKDateDescriptionGenerator _timeStringForDate:](self, "_timeStringForDate:", v12);
        v22 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[CUIKDateDescriptionGenerator _dateStringForDate:relativeToReferenceDate:allDay:shortFormat:lowercase:](self, "_dateStringForDate:relativeToReferenceDate:allDay:shortFormat:lowercase:", v12, v13, 0, 1, !v8);
        v22 = objc_claimAutoreleasedReturnValue();
      }
      v14 = (void *)v22;

    }
    else
    {
      -[CUIKDateDescriptionGenerator _timeStringForDate:](self, "_timeStringForDate:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUIKDateDescriptionGenerator _dateStringForDate:relativeToReferenceDate:allDay:shortFormat:lowercase:](self, "_dateStringForDate:relativeToReferenceDate:allDay:shortFormat:lowercase:", v12, v13, 0, 0, !v8);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(MEMORY[0x1E0D0C2B0], "requiresSingularLocalizationForDate:", v12);
      v25 = (void *)MEMORY[0x1E0CB3940];
      CUIKBundle();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v24)
        v28 = CFSTR("%@ at %@ (singular hour)");
      else
        v28 = CFSTR("%@ at %@ (plural hour)");
      objc_msgSend(v26, "localizedStringForKey:value:table:", v28, CFSTR("%@ at %@"), 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringWithFormat:", v29, v23, v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_longFormatters, 0);
  objc_storeStrong((id *)&self->_dayOfWeekFormatter, 0);
  objc_storeStrong((id *)&self->_fullStyleDateFormatter, 0);
  objc_storeStrong((id *)&self->_customFormatter, 0);
  objc_storeStrong((id *)&self->_standardTimeFormatter, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_abbrevDayFormatter, 0);
  objc_storeStrong((id *)&self->_dayFormatter, 0);
  objc_storeStrong((id *)&self->_serialFormatterEditQueue, 0);
}

+ (void)_dateAfterTodayNextWeekFormatStringForDayOfWeek:generateLowercaseString:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_3_3();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1B8A6A000, v1, v2, "Unknown day of week provided: [%@].  Will not generate a 'date after today (next week)' format string", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_0();
}

+ (void)_dateAfterTodayThisWeekFormatStringForDayOfWeek:generateLowercaseString:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_3_3();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1B8A6A000, v1, v2, "Unknown day of week provided: [%@].  Will not generate a 'date after today (this week)' format string", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_0();
}

+ (void)_dateBeforeTodayThisWeekFormatStringForDayOfWeek:generateLowercaseString:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_3_3();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1B8A6A000, v1, v2, "Unknown day of week provided: [%@].  Will not generate a 'date before today (this week)' format string", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_0();
}

+ (void)_dateBeforeTodayLastWeekFormatStringForDayOfWeek:generateLowercaseString:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_3_3();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_0(&dword_1B8A6A000, v1, v2, "Unknown day of week provided: [%@].  Will not generate a 'date before today (last week)' format string", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4_0();
}

@end
