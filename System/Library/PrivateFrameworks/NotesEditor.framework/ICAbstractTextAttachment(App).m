@implementation ICAbstractTextAttachment(App)

- (id)viewForLayoutManager:()App
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  ICCheckedDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "viewForTextAttachment:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)newlyCreatedViewControllerForManualRendering:()App layoutManager:initialCharacterIndex:
{
  id v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  void *v13;

  v8 = a4;
  v9 = (void *)objc_msgSend(a1, "attachmentViewControllerClass");
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_1F040DAA0))
  {
    v10 = objc_msgSend(v9, "instancesRespondToSelector:", sel_initWithTextAttachment_forManualRendering_layoutManager_initialCharacterIndex_);
    v11 = objc_alloc((Class)v9);
    if (v10)
      v12 = objc_msgSend(v11, "initWithTextAttachment:forManualRendering:layoutManager:initialCharacterIndex:", a1, a3, v8, a5);
    else
      v12 = objc_msgSend(v11, "initWithTextAttachment:forManualRendering:layoutManager:", a1, a3, v8);
    v13 = (void *)v12;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

@end
