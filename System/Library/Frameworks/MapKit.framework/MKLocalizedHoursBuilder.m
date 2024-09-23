@implementation MKLocalizedHoursBuilder

uint64_t __39___MKLocalizedHoursBuilder__commonInit__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v3 = (void *)_MergedGlobals_160;
  _MergedGlobals_160 = (uint64_t)v2;

  objc_msgSend((id)_MergedGlobals_160, "setDateFormat:", CFSTR("MMMM dd"));
  objc_msgSend((id)_MergedGlobals_160, "setFormattingContext:", 4);
  objc_msgSend((id)_MergedGlobals_160, "setTimeZone:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  v4 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v5 = (void *)qword_1ECE2DC90;
  qword_1ECE2DC90 = (uint64_t)v4;

  objc_msgSend((id)qword_1ECE2DC90, "setDateFormat:", CFSTR("cccc"));
  objc_msgSend((id)qword_1ECE2DC90, "setFormattingContext:", 4);
  objc_msgSend((id)qword_1ECE2DC90, "setTimeZone:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  v6 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v7 = (void *)qword_1ECE2DC98;
  qword_1ECE2DC98 = (uint64_t)v6;

  objc_msgSend((id)qword_1ECE2DC98, "setDateFormat:", CFSTR("ccc"));
  objc_msgSend((id)qword_1ECE2DC98, "setFormattingContext:", 4);
  objc_msgSend((id)qword_1ECE2DC98, "setTimeZone:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  v8 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v9 = (void *)qword_1ECE2DCA0;
  qword_1ECE2DCA0 = (uint64_t)v8;

  objc_msgSend((id)qword_1ECE2DCA0, "setDateStyle:", 0);
  objc_msgSend((id)qword_1ECE2DCA0, "setTimeStyle:", 1);
  objc_msgSend((id)qword_1ECE2DCA0, "setTimeZone:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  v10 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v11 = (void *)qword_1ECE2DCA8;
  qword_1ECE2DCA8 = (uint64_t)v10;

  objc_msgSend((id)qword_1ECE2DCA8, "setAllowedUnits:", 32);
  objc_msgSend((id)qword_1ECE2DCA8, "setUnitsStyle:", 1);
  v12 = objc_alloc_init(MEMORY[0x1E0CB3570]);
  v13 = (void *)qword_1ECE2DCB0;
  qword_1ECE2DCB0 = (uint64_t)v12;

  objc_msgSend((id)qword_1ECE2DCB0, "setAllowedUnits:", 32);
  return objc_msgSend((id)qword_1ECE2DCB0, "setUnitsStyle:", 3);
}

void __51___MKLocalizedHoursBuilder__isCurrentTimeSingular___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECE2DCC0;
  qword_1ECE2DCC0 = v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECE2DCC0, "setLocale:", v2);

}

void __66___MKLocalizedHoursBuilder__localizedTimeStringFromDate_timezone___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v3 = (void *)qword_1ECE2DCC8;
  qword_1ECE2DCC8 = (uint64_t)v2;

  objc_msgSend((id)qword_1ECE2DCC8, "setLocalizedDateFormatFromTemplate:", CFSTR("jmm"));
  objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)qword_1ECE2DCD8;
  qword_1ECE2DCD8 = v4;

  objc_msgSend((id)qword_1ECE2DCD8, "setTimeZone:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ECE2DCD8, "setLocale:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  v8 = (void *)qword_1ECE2DCD0;
  qword_1ECE2DCD0 = (uint64_t)v7;

}

void __54___MKLocalizedHoursBuilder__findNextOperatingWeekday___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[7];
  _QWORD v10[8];

  v10[7] = *MEMORY[0x1E0C80C00];
  v9[0] = &unk_1E2158E90;
  _MKLocalizedStringFromThisBundle(CFSTR("Business Hours Sunday"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v0;
  v9[1] = &unk_1E2158EA8;
  _MKLocalizedStringFromThisBundle(CFSTR("Business Hours Monday"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v1;
  v9[2] = &unk_1E2158EC0;
  _MKLocalizedStringFromThisBundle(CFSTR("Business Hours Tuesday"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v2;
  v9[3] = &unk_1E2158ED8;
  _MKLocalizedStringFromThisBundle(CFSTR("Business Hours Wednesday"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v3;
  v9[4] = &unk_1E2158EF0;
  _MKLocalizedStringFromThisBundle(CFSTR("Business Hours Thursday"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v4;
  v9[5] = &unk_1E2158F08;
  _MKLocalizedStringFromThisBundle(CFSTR("Business Hours Friday"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v5;
  v9[6] = &unk_1E2158F20;
  _MKLocalizedStringFromThisBundle(CFSTR("Business Hours Saturday"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[6] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 7);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)qword_1ECE2DCE8;
  qword_1ECE2DCE8 = v7;

}

uint64_t __62___MKLocalizedHoursBuilder_concatenateStrings_joinedByString___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = MKApplicationLayoutDirectionIsRightToLeft();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
