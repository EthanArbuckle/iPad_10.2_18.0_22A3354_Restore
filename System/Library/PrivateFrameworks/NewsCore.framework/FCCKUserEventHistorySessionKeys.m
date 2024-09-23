@implementation FCCKUserEventHistorySessionKeys

id __FCCKUserEventHistorySessionKeys_block_invoke()
{
  if (qword_1ED0F8050 != -1)
    dispatch_once(&qword_1ED0F8050, &__block_literal_global_1329);
  return (id)qword_1ED0F8048;
}

void __FCCKUserEventHistorySessionKeys_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("sessionData"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8048;
  qword_1ED0F8048 = v0;

}

@end
