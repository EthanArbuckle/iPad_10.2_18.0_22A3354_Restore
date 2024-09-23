@implementation NTKAllSimpleTextComplicationTypes

void __NTKAllSimpleTextComplicationTypes_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addIndex:", 45);
  objc_msgSend(v2, "addIndex:", 14);
  objc_msgSend(v2, "addIndex:", 1);
  objc_msgSend(v2, "addIndex:", 4);
  objc_msgSend(v2, "addIndex:", 3);
  objc_msgSend(v2, "addIndex:", 48);
  objc_msgSend(v2, "addIndex:", 23);
  objc_msgSend(v2, "addIndex:", 20);
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexSet:", v2);
  v1 = (void *)NTKAllSimpleTextComplicationTypes_results;
  NTKAllSimpleTextComplicationTypes_results = v0;

}

@end
