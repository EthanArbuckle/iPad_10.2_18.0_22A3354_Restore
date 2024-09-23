@implementation MapsSuggestionsLocalizedVisitedTimeAgo

void __MapsSuggestionsLocalizedVisitedTimeAgo_block_invoke()
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
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Visited %@"), CFSTR("Visited %@<unlocalized>"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsNonNilString(v2, &stru_1E4BDFC28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = v0;
  v7[1] = 3221225472;
  v7[2] = __MapsSuggestionsLocalizedVisitedTimeAgo_block_invoke_2;
  v7[3] = &unk_1E4BD1A20;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(v7);
  v6 = (void *)qword_1ED22F3C0;
  qword_1ED22F3C0 = (uint64_t)v5;

}

id __MapsSuggestionsLocalizedVisitedTimeAgo_block_invoke_2(uint64_t a1, double a2)
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = objc_alloc_init(MEMORY[0x1E0CB38F0]);
  v5 = (void *)MapsSuggestionsLocalizedVisitedTimeAgo_s_formatter;
  MapsSuggestionsLocalizedVisitedTimeAgo_s_formatter = (uint64_t)v4;

  objc_msgSend((id)MapsSuggestionsLocalizedVisitedTimeAgo_s_formatter, "setDateTimeStyle:", 1);
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend((id)MapsSuggestionsLocalizedVisitedTimeAgo_s_formatter, "localizedStringFromTimeInterval:", -a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithFormat:", v7, v8);

  return v9;
}

@end
