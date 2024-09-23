@implementation DPPListHelper

void __67___DPPListHelper_loadPropertyListFromPath_overridePath_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, id, uint64_t);
  id v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void (**)(uint64_t, id, uint64_t))(v5 + 16);
  v7 = a2;
  v6(v5, v7, a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

}

@end
