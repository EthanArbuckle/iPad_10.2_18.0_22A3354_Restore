@implementation MapsSuggestionsLocalizedAddShortcutString

void __MapsSuggestionsLocalizedAddShortcutString_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  id v3;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___MapsSuggestionsBundle_block_invoke_7;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = "LocalizedString";
  if (qword_1ED22F618 != -1)
    dispatch_once(&qword_1ED22F618, block);
  v0 = (id)qword_1ED22F610;
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("SHORTCUT_SETUP_SHORT"), CFSTR("Add<unlocalized>"), 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  MapsSuggestionsNonNilString(v3, &stru_1E4BDFC28);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)qword_1ED22F2A0;
  qword_1ED22F2A0 = v1;

}

@end
