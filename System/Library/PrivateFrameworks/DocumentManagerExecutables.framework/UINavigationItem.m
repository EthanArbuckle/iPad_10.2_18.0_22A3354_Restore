@implementation UINavigationItem

void __63__UINavigationItem_DOCExtensions__doc_safeSetSearchController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "doc_pendingSearchControllerUpdateRequest");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "doc_setPendingSearchControllerUpdateRequest:", 0);
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v4, "searchController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setSearchController:", v3);

  }
}

@end
