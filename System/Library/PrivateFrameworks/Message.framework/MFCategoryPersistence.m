@implementation MFCategoryPersistence

void __60__MFCategoryPersistence_iOS_persistCategorizationResultMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(a3, "category");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCategory:", v4);

}

@end
