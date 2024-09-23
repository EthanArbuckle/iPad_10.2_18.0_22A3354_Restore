@implementation UIDocumentPickerContainerViewController

void __93___UIDocumentPickerContainerViewController__startSearchWithQueryString_becomeFirstResponder___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setText:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchBar:textDidChange:", v2, v3);

}

uint64_t __76___UIDocumentPickerContainerViewController_setChildViewController_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "didMoveToParentViewController:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "endAppearanceTransition");
  objc_msgSend(*(id *)(a1 + 48), "removeFromParentViewController");
  return objc_msgSend(*(id *)(a1 + 48), "didMoveToParentViewController:", 0);
}

@end
