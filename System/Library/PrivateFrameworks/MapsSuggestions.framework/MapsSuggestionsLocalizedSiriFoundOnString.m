@implementation MapsSuggestionsLocalizedSiriFoundOnString

void __MapsSuggestionsLocalizedSiriFoundOnString_block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
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
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Siri found on [originating website url from DuetExpertCenter donation]"), CFSTR("Siri found on %@<unlocalized>"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsNonNilString(v2, &stru_1E4BDFC28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = v0;
  v6[1] = 3221225472;
  v6[2] = __MapsSuggestionsLocalizedSiriFoundOnString_block_invoke_2;
  v6[3] = &unk_1E4BD1610;
  v6[4] = v3;
  v4 = _Block_copy(v6);
  v5 = (void *)qword_1ED22F240;
  qword_1ED22F240 = (uint64_t)v4;

}

id __MapsSuggestionsLocalizedSiriFoundOnString_block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", *(_QWORD *)(a1 + 32), v4);

  return v5;
}

@end
