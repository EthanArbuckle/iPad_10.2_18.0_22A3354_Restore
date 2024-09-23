@implementation CFLocalePrefsChanged

void ____CFLocalePrefsChanged_block_invoke(uint64_t a1)
{
  if (*(double *)(a1 + 32) == *(double *)&__lastNote)
  {
    _CFCalendarResetCurrent();
    CFPreferencesAppSynchronize(CFSTR("kCFPreferencesCurrentApplication"));
    dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_13);
  }
}

@end
