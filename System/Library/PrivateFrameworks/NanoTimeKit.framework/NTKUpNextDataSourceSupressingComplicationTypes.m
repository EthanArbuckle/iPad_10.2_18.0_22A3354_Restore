@implementation NTKUpNextDataSourceSupressingComplicationTypes

void __NTKUpNextDataSourceSupressingComplicationTypes_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addIndex:", 2);
  objc_msgSend(v2, "addIndex:", 19);
  objc_msgSend(v2, "addIndex:", 9);
  objc_msgSend(v2, "addIndex:", 4);
  objc_msgSend(v2, "addIndex:", 3);
  objc_msgSend(v2, "addIndex:", 7);
  objc_msgSend(v2, "addIndex:", 18);
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexSet:", v2);
  v1 = (void *)NTKUpNextDataSourceSupressingComplicationTypes_hideDuplicatesOnSupergreen;
  NTKUpNextDataSourceSupressingComplicationTypes_hideDuplicatesOnSupergreen = v0;

}

@end
