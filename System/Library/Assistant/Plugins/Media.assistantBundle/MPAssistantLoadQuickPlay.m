@implementation MPAssistantLoadQuickPlay

- (void)performWithCompletion:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;

  v4 = (objc_class *)MEMORY[0x1E0D87FE8];
  v5 = a3;
  v7 = objc_alloc_init(v4);
  objc_msgSend(v7, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a3 + 2))(v5, v6);

}

@end
