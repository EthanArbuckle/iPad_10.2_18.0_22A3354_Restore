@implementation MapsSuggestionsFullDepartureAirportString

void __MapsSuggestionsFullDepartureAirportString_block_invoke()
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
  block[2] = ___ZL22_MapsSuggestionsBundlePKc_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = "Flight";
  if (qword_1ED22EED0 != -1)
    dispatch_once(&qword_1ED22EED0, block);
  v1 = (id)qword_1ED22EEC8;
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("MAPS_TO_AIRPORT_TERMINAL"), CFSTR("%@ Terminal %@<unlocalized>"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsNonNilString(v2, &stru_1E4BDFC28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = v0;
  v7[1] = 3221225472;
  v7[2] = __MapsSuggestionsFullDepartureAirportString_block_invoke_2;
  v7[3] = &unk_1E4BCE500;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(v7);
  v6 = (void *)_MergedGlobals_28;
  _MergedGlobals_28 = (uint64_t)v5;

}

id __MapsSuggestionsFullDepartureAirportString_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;

  v5 = a2;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", *(_QWORD *)(a1 + 32), v5, v6);

  return v7;
}

@end
