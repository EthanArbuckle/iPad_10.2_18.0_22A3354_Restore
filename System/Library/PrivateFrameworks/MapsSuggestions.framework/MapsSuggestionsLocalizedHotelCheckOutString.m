@implementation MapsSuggestionsLocalizedHotelCheckOutString

void __MapsSuggestionsLocalizedHotelCheckOutString_block_invoke()
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
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD aBlock[4];
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t block;
  uint64_t v25;
  void (*v26)();
  void *v27;
  const char *v28;

  v0 = MEMORY[0x1E0C809B0];
  block = MEMORY[0x1E0C809B0];
  v25 = 3221225472;
  v26 = ___MapsSuggestionsBundle_block_invoke_7;
  v27 = &__block_descriptor_40_e5_v8__0l;
  v28 = "LocalizedString";
  if (qword_1ED22F618 != -1)
    dispatch_once(&qword_1ED22F618, &block);
  v1 = (id)qword_1ED22F610;
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("MSG_HOTEL_ENTRY_SUBTITLE_CHECK_OUT_AT_0"), CFSTR("Check out at %@<unlocalized>"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsNonNilString(v2, &stru_1E4BDFC28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  block = v0;
  v25 = 3221225472;
  v26 = ___MapsSuggestionsBundle_block_invoke_7;
  v27 = &__block_descriptor_40_e5_v8__0l;
  v28 = "LocalizedString";
  if (qword_1ED22F618 != -1)
    dispatch_once(&qword_1ED22F618, &block);
  v4 = (id)qword_1ED22F610;
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MSG_HOTEL_ENTRY_SUBTITLE_CHECK_OUT_AT_1"), CFSTR("Check out at %@<unlocalized>"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsNonNilString(v5, &stru_1E4BDFC28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  block = v0;
  v25 = 3221225472;
  v26 = ___MapsSuggestionsBundle_block_invoke_7;
  v27 = &__block_descriptor_40_e5_v8__0l;
  v28 = "LocalizedString";
  if (qword_1ED22F618 != -1)
    dispatch_once(&qword_1ED22F618, &block);
  v7 = (id)qword_1ED22F610;
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("MSG_HOTEL_ENTRY_SUBTITLE_CHECK_OUT_AT_13"), CFSTR("Check out at %@<unlocalized>"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsNonNilString(v8, &stru_1E4BDFC28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  block = v0;
  v25 = 3221225472;
  v26 = ___MapsSuggestionsBundle_block_invoke_7;
  v27 = &__block_descriptor_40_e5_v8__0l;
  v28 = "LocalizedString";
  if (qword_1ED22F618 != -1)
    dispatch_once(&qword_1ED22F618, &block);
  v10 = (id)qword_1ED22F610;
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("MSG_HOTEL_ENTRY_SUBTITLE_CHECK_OUT"), CFSTR("Check out at %@<unlocalized>"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsNonNilString(v11, &stru_1E4BDFC28);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  aBlock[0] = v0;
  aBlock[1] = 3221225472;
  aBlock[2] = __MapsSuggestionsLocalizedHotelCheckOutString_block_invoke_2;
  aBlock[3] = &unk_1E4BD1838;
  v20 = v3;
  v21 = v6;
  v22 = v9;
  v23 = v12;
  v13 = v12;
  v14 = v9;
  v15 = v6;
  v16 = v3;
  v17 = _Block_copy(aBlock);
  v18 = (void *)qword_1ED22F2F0;
  qword_1ED22F2F0 = (uint64_t)v17;

}

id __MapsSuggestionsLocalizedHotelCheckOutString_block_invoke_2(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a2;
  if (a3 == 13)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    v7 = a1[6];
  }
  else if (a3 == 1)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    v7 = a1[5];
  }
  else if (a3)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    v7 = a1[7];
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3940]);
    v7 = a1[4];
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithFormat:locale:", v7, v8, v5);

  return v9;
}

@end
