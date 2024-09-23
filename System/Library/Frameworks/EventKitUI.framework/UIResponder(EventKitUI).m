@implementation UIResponder(EventKitUI)

- (uint64_t)EKUI_setDataOwnersFromEvent:()EventKitUI
{
  void *v4;
  int v5;
  uint64_t v6;

  objc_msgSend(a3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isManaged");

  if (v5)
    v6 = 2;
  else
    v6 = 1;
  objc_msgSend(a1, "_setDragDataOwner:", v6);
  objc_msgSend(a1, "_setDropDataOwner:", v6);
  objc_msgSend(a1, "_setDataOwnerForCopy:", v6);
  return objc_msgSend(a1, "_setDataOwnerForPaste:", v6);
}

- (id)EKUI_editor
{
  void *v1;
  id v2;

  objc_msgSend(a1, "undoManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v1, "undoableEditor"), (v2 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (EKUI_editor_onceToken != -1)
      dispatch_once(&EKUI_editor_onceToken, &__block_literal_global_13);
    v2 = (id)EKUI_editor_eventStoreEditor;
  }

  return v2;
}

@end
