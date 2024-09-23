@implementation MapsSuggestionsAgeAsStringForLocation

uint64_t __MapsSuggestionsAgeAsStringForLocation_block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___MapsSuggestionsBundle_block_invoke_6;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = "Location";
  if (qword_1ED22F1B0 != -1)
    dispatch_once(&qword_1ED22F1B0, block);
  v0 = (id)qword_1ED22F1A8;
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Just Now"), CFSTR("Just Now<unlocalized>"), 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsNonNilString(v1, &stru_1E4BDFC28);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED22F190;
  qword_1ED22F190 = v2;

  v4 = objc_alloc_init(MEMORY[0x1E0CB38F0]);
  v5 = (void *)qword_1ED22F180;
  qword_1ED22F180 = (uint64_t)v4;

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ED22F180, "setLocale:", v6);

  return objc_msgSend((id)qword_1ED22F180, "setDateTimeStyle:", 1);
}

@end
