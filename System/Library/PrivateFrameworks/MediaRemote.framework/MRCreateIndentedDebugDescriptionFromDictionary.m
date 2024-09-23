@implementation MRCreateIndentedDebugDescriptionFromDictionary

void __MRCreateIndentedDebugDescriptionFromDictionary_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v4 = *(void **)(a1 + 32);
  v5 = (objc_class *)MEMORY[0x1E0CB3940];
  v6 = a3;
  v7 = a2;
  v8 = [v5 alloc];
  _MRCreateIndentedDebugDescriptionFrom(v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%@ = %@,"), v7, v10);
  objc_msgSend(v4, "addObject:", v9);

}

@end
