@implementation CEKIsSFCameraSupportedForLocale

void __CEKIsSFCameraSupportedForLocale_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("en"), CFSTR("fr"), CFSTR("es"), CFSTR("de"), CFSTR("pt"), CFSTR("it"), CFSTR("nl"), 0x1E70A6000, CFSTR("da"), CFSTR("fi"), CFSTR("no"), CFSTR("tr"), CFSTR("id"), CFSTR("ms"), CFSTR("hu"), CFSTR("pl"), CFSTR("cs"),
    CFSTR("sk"),
    CFSTR("ca"),
    CFSTR("ro"),
    CFSTR("hr"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)CEKIsSFCameraSupportedForLocale_sfCameraLanguageCodes;
  CEKIsSFCameraSupportedForLocale_sfCameraLanguageCodes = v0;

}

@end
