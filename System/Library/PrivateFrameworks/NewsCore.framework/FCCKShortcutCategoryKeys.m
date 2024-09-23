@implementation FCCKShortcutCategoryKeys

id __FCCKShortcutCategoryKeys_block_invoke()
{
  if (qword_1ED0F8030 != -1)
    dispatch_once(&qword_1ED0F8030, &__block_literal_global_1303);
  return (id)qword_1ED0F8028;
}

void __FCCKShortcutCategoryKeys_block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", CFSTR("dateAdded"), CFSTR("type"), CFSTR("categoryID"), CFSTR("status"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0F8028;
  qword_1ED0F8028 = v0;

}

@end
