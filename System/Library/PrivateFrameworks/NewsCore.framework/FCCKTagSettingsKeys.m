@implementation FCCKTagSettingsKeys

id __FCCKTagSettingsKeys_block_invoke()
{
  if (qword_1ED0F8070 != -1)
    dispatch_once(&qword_1ED0F8070, &__block_literal_global_1445);
  return (id)qword_1ED0F8068;
}

void __FCCKTagSettingsKeys_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("fontMultiplier"), CFSTR("fontMultiplierMacOS"), CFSTR("contentScale"), CFSTR("contentScaleMacOS"), CFSTR("tagID"), CFSTR("accessToken"), CFSTR("webAccessOptIn"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8068;
  qword_1ED0F8068 = v0;

}

@end
