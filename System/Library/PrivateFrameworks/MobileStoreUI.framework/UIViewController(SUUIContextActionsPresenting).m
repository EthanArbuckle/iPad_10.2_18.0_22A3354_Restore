@implementation UIViewController(SUUIContextActionsPresenting)

- (SUUIContextActionsPresentationRegistration)registerForPreviewingFromSourceView:()SUUIContextActionsPresenting handler:
{
  id v6;
  id v7;
  SUUIContextActionsPresentationRegistration *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = -[SUUIContextActionsPresentationRegistration initWithViewController:handler:]([SUUIContextActionsPresentationRegistration alloc], "initWithViewController:handler:", a1, v6);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD880]), "initWithView:", v7);
  objc_msgSend(v9, "setDelegate:", v8);
  -[SUUIContextActionsPresentationRegistration setPreviewInteraction:](v8, "setPreviewInteraction:", v9);
  v10 = objc_alloc_init(MEMORY[0x24BEBD740]);
  objc_msgSend(v10, "setAllowableMovement:", 10.0);
  objc_msgSend(v7, "addGestureRecognizer:", v10);

  -[SUUIContextActionsPresentationRegistration setLongPressGestureRecognizer:](v8, "setLongPressGestureRecognizer:", v10);
  return v8;
}

- (void)unregisterForPreviewing:()SUUIContextActionsPresenting
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(v3, "longPressGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeGestureRecognizer:", v6);

  }
  objc_msgSend(v3, "previewInteraction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancelInteraction");

  objc_msgSend(v3, "setPreviewInteraction:", 0);
}

@end
