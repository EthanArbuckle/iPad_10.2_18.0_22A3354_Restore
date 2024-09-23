@implementation UINavigationItem(DOCExtensions)

- (void)doc_setPendingSearchControllerUpdateRequest:()DOCExtensions
{
  objc_setAssociatedObject(a1, &doc_pendingSearchControllerUpdateRequestKey, a3, (void *)0x301);
}

- (id)doc_pendingSearchControllerUpdateRequest
{
  return objc_getAssociatedObject(a1, &doc_pendingSearchControllerUpdateRequestKey);
}

- (void)doc_safeSetSearchController:()DOCExtensions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v4 = a3;
  objc_msgSend(a1, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitionCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1, "doc_pendingSearchControllerUpdateRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setSearchController:", v4);

    objc_msgSend(a1, "doc_setPendingSearchControllerUpdateRequest:", v8);
    if (!v7)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __63__UINavigationItem_DOCExtensions__doc_safeSetSearchController___block_invoke;
      v9[3] = &unk_24E327890;
      v9[4] = a1;
      objc_msgSend(v6, "animateAlongsideTransition:completion:", 0, v9);
    }
  }
  else
  {
    objc_msgSend(a1, "doc_setPendingSearchControllerUpdateRequest:", 0);
    objc_msgSend(a1, "setSearchController:", v4);
    v8 = v4;
  }

}

@end
