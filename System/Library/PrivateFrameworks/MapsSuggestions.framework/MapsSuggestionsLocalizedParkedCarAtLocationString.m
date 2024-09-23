@implementation MapsSuggestionsLocalizedParkedCarAtLocationString

void __MapsSuggestionsLocalizedParkedCarAtLocationString_block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD aBlock[4];
  id v16;
  uint64_t block;
  uint64_t v18;
  void (*v19)();
  void *v20;
  const char *v21;

  v0 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = ___MapsSuggestionsBundle_block_invoke_7;
  v20 = &__block_descriptor_40_e5_v8__0l;
  v21 = "LocalizedString";
  if (qword_1ED22F618 != -1)
    dispatch_once(&qword_1ED22F618, &block);
  v1 = (id)qword_1ED22F610;
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("MAPS_PARKED_LOCATION_NAME_AND_DISTANCE"), CFSTR("%@ away, %@<unlocalized>"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsNonNilString(v2, &stru_1E4BDFC28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  block = v0;
  v18 = 3221225472;
  v19 = ___MapsSuggestionsBundle_block_invoke_7;
  v20 = &__block_descriptor_40_e5_v8__0l;
  v21 = "LocalizedString";
  if (qword_1ED22F618 != -1)
    dispatch_once(&qword_1ED22F618, &block);
  v4 = (id)qword_1ED22F610;
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MAPS_PARKED_DISTANCE"), CFSTR("%@ away<unlocalized>"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsNonNilString(v5, &stru_1E4BDFC28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = v0;
  aBlock[1] = 3221225472;
  aBlock[2] = __MapsSuggestionsLocalizedParkedCarAtLocationString_block_invoke_2;
  aBlock[3] = &unk_1E4BD1610;
  v16 = v6;
  v7 = v6;
  v8 = _Block_copy(aBlock);
  v9 = (void *)qword_1ED22F500;
  qword_1ED22F500 = (uint64_t)v8;

  v13[0] = v0;
  v13[1] = 3221225472;
  v13[2] = __MapsSuggestionsLocalizedParkedCarAtLocationString_block_invoke_3;
  v13[3] = &unk_1E4BCF248;
  v14 = v3;
  v10 = v3;
  v11 = _Block_copy(v13);
  v12 = (void *)qword_1ED22F508;
  qword_1ED22F508 = (uint64_t)v11;

}

id __MapsSuggestionsLocalizedParkedCarAtLocationString_block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", *(_QWORD *)(a1 + 32), v4);

  return v5;
}

id __MapsSuggestionsLocalizedParkedCarAtLocationString_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_msgSend([v5 alloc], "initWithFormat:", *(_QWORD *)(a1 + 32), v7, v6);

  return v8;
}

@end
