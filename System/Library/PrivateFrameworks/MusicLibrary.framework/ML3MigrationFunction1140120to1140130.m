@implementation ML3MigrationFunction1140120to1140130

void __ML3MigrationFunction1140120to1140130_block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "stringForColumnIndex:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end
