@implementation MapsSuggestionsLocalizedTitleFormatForEVResumeRouteEntryWithChargePercentage

void __MapsSuggestionsLocalizedTitleFormatForEVResumeRouteEntryWithChargePercentage_block_invoke()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD aBlock[4];
  id v12;
  id v13;
  uint64_t block;
  uint64_t v15;
  void (*v16)();
  void *v17;
  const char *v18;

  v0 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = ___MapsSuggestionsBundle_block_invoke_7;
  v17 = &__block_descriptor_40_e5_v8__0l;
  v18 = "LocalizedString";
  if (qword_1ED22F618 != -1)
    dispatch_once(&qword_1ED22F618, &block);
  v1 = (id)qword_1ED22F610;
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Charge to at least %@%% [Proactive Tray EV Resume Route title when charging]"), CFSTR("Charge to at least %@%%<unlocalized>"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsNonNilString(v2, &stru_1E4BDFC28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  block = v0;
  v15 = 3221225472;
  v16 = ___MapsSuggestionsBundle_block_invoke_7;
  v17 = &__block_descriptor_40_e5_v8__0l;
  v18 = "LocalizedString";
  if (qword_1ED22F618 != -1)
    dispatch_once(&qword_1ED22F618, &block);
  v4 = (id)qword_1ED22F610;
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Charge to %@%% [Proactive Tray EV Resume Route title when charging]"), CFSTR("Charge to %@%%<unlocalized>"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsNonNilString(v5, &stru_1E4BDFC28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = v0;
  aBlock[1] = 3221225472;
  aBlock[2] = __MapsSuggestionsLocalizedTitleFormatForEVResumeRouteEntryWithChargePercentage_block_invoke_2;
  aBlock[3] = &unk_1E4BD1B28;
  v12 = v3;
  v13 = v6;
  v7 = v6;
  v8 = v3;
  v9 = _Block_copy(aBlock);
  v10 = (void *)qword_1ED22F430;
  qword_1ED22F430 = (uint64_t)v9;

}

id __MapsSuggestionsLocalizedTitleFormatForEVResumeRouteEntryWithChargePercentage_block_invoke_2(uint64_t a1, float a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%d"), (int)(float)(a2 * 100.0));
  v5 = objc_alloc(MEMORY[0x1E0CB3940]);
  v6 = 40;
  if (a2 < 100.0)
    v6 = 32;
  v7 = (void *)objc_msgSend(v5, "initWithFormat:", *(_QWORD *)(a1 + v6), v4);

  return v7;
}

@end
