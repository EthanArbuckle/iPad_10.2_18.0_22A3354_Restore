@implementation FCPersonalizationActionToIndex

void __FCPersonalizationActionToIndex_block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v0 = (void *)objc_opt_new();
  FCPersonalizationActions();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __FCPersonalizationActionToIndex_block_invoke_3;
  v5[3] = &unk_1E463C6B8;
  v6 = v0;
  v2 = v0;
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v5);

  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)_MergedGlobals_4;
  _MergedGlobals_4 = v3;

}

void __FCPersonalizationActionToIndex_block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

@end
