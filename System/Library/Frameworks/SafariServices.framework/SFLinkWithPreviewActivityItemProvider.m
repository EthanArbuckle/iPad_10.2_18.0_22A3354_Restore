@implementation SFLinkWithPreviewActivityItemProvider

id __77___SFLinkWithPreviewActivityItemProvider_activityViewControllerLinkMetadata___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "webView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "_selectionAttributes") & 2) != 0
    && objc_msgSend(v1, "_contentViewIsFirstResponder"))
  {
    objc_msgSend(v1, "firstResponder");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v2, "selectedText");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
