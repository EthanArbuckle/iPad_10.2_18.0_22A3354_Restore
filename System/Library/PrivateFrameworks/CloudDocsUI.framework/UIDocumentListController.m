@implementation UIDocumentListController

id __59___UIDocumentListController_listControllerHierarchyForURL___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = *(objc_class **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithURL:", v3);

  return v4;
}

@end
