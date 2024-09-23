@implementation FCCKShortcutKeys

id __FCCKShortcutKeys_block_invoke()
{
  if (qword_1ED0F8020 != -1)
    dispatch_once(&qword_1ED0F8020, &__block_literal_global_1287);
  return (id)qword_1ED0F8018;
}

void __FCCKShortcutKeys_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("dateAdded"), CFSTR("order"), CFSTR("type"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8018;
  qword_1ED0F8018 = v0;

}

@end
