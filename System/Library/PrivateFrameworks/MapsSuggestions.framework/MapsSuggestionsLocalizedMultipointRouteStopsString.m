@implementation MapsSuggestionsLocalizedMultipointRouteStopsString

void __MapsSuggestionsLocalizedMultipointRouteStopsString_block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD block[5];

  v0 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___MapsSuggestionsBundle_block_invoke_7;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = "LocalizedString";
  if (qword_1ED22F618 != -1)
    dispatch_once(&qword_1ED22F618, block);
  v1 = (id)qword_1ED22F610;
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("MSg_RESUME_MULTIPOINT_ROUTE_WITH_ONE_STOP"), CFSTR("with 1 stop<unlocalized>"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsNonNilString(v2, &stru_1E4BDFC28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = v0;
  v7[1] = 3221225472;
  v7[2] = __MapsSuggestionsLocalizedMultipointRouteStopsString_block_invoke_2;
  v7[3] = &unk_1E4BD1CB8;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(v7);
  v6 = (void *)qword_1ED22F4C8;
  qword_1ED22F4C8 = (uint64_t)v5;

}

id __MapsSuggestionsLocalizedMultipointRouteStopsString_block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __MapsSuggestionsLocalizedMultipointRouteStopsString_block_invoke_3()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD block[5];

  v0 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___MapsSuggestionsBundle_block_invoke_7;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = "LocalizedString";
  if (qword_1ED22F618 != -1)
    dispatch_once(&qword_1ED22F618, block);
  v1 = (id)qword_1ED22F610;
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("MSg_RESUME_MULTIPOINT_ROUTE_WITH_STOPS"), CFSTR("with %lu stops<unlocalized>"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsNonNilString(v2, &stru_1E4BDFC28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = v0;
  v7[1] = 3221225472;
  v7[2] = __MapsSuggestionsLocalizedMultipointRouteStopsString_block_invoke_4;
  v7[3] = &unk_1E4BD1D00;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(v7);
  v6 = (void *)qword_1ED22F4D0;
  qword_1ED22F4D0 = (uint64_t)v5;

}

id __MapsSuggestionsLocalizedMultipointRouteStopsString_block_invoke_4(uint64_t a1, uint64_t a2)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", *(_QWORD *)(a1 + 32), a2);
}

@end
