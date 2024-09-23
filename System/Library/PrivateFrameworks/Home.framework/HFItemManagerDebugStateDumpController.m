@implementation HFItemManagerDebugStateDumpController

void __56___HFItemManagerDebugStateDumpController_sharedInstance__block_invoke_2()
{
  _HFItemManagerDebugStateDumpController *v0;
  void *v1;

  v0 = objc_alloc_init(_HFItemManagerDebugStateDumpController);
  v1 = (void *)qword_1ED378C30;
  qword_1ED378C30 = (uint64_t)v0;

}

id __46___HFItemManagerDebugStateDumpController_init__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_performStateDump");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    v1 = (void *)MEMORY[0x1E0C9AA70];
  v3 = v1;

  return v3;
}

id __59___HFItemManagerDebugStateDumpController__performStateDump__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  +[HFStateDumpBuilderContext contextWithDetailLevel:](HFStateDumpBuilderContext, "contextWithDetailLevel:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hf_stateDumpBuilderWithContext:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buildPropertyListRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
