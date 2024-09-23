@implementation MapsSuggestionsLocalizedETAFormatStringWithTime

void __MapsSuggestionsLocalizedETAFormatStringWithTime_block_invoke()
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
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("MSG_EVENT_TIME_WITH_ETA_WITH_TRANSPORT_MODE"), CFSTR("%@, %@ %@<unlocalized>"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsNonNilString(v2, &stru_1E4BDFC28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = v0;
  v7[1] = 3221225472;
  v7[2] = __MapsSuggestionsLocalizedETAFormatStringWithTime_block_invoke_2;
  v7[3] = &unk_1E4BD15A8;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(v7);
  v6 = (void *)_MergedGlobals_50;
  _MergedGlobals_50 = (uint64_t)v5;

}

id __MapsSuggestionsLocalizedETAFormatStringWithTime_block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;

  v7 = (objc_class *)MEMORY[0x1E0CB3940];
  v8 = a4;
  v9 = a3;
  v10 = a2;
  v11 = (void *)objc_msgSend([v7 alloc], "initWithFormat:", *(_QWORD *)(a1 + 32), v10, v9, v8);

  return v11;
}

@end
