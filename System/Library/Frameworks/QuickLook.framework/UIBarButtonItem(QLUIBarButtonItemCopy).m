@implementation UIBarButtonItem(QLUIBarButtonItemCopy)

- (id)ql_copySystemItem
{
  int v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a1, "customView");
  if (objc_claimAutoreleasedReturnValue())
    -[UIBarButtonItem(QLUIBarButtonItemCopy) ql_copySystemItem].cold.1();
  v2 = objc_msgSend(a1, "isSystemItem");
  v3 = objc_alloc(MEMORY[0x24BEBD410]);
  if (v2)
  {
    v4 = objc_msgSend(a1, "systemItem");
    objc_msgSend(a1, "target");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithBarButtonSystemItem:target:action:", v4, v5, objc_msgSend(a1, "action"));

  }
  else
  {
    objc_msgSend(a1, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(a1, "style");
    objc_msgSend(a1, "target");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v3, "initWithTitle:style:target:action:", v7, v8, v9, objc_msgSend(a1, "action"));

    objc_msgSend(a1, "image");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v10);

    objc_msgSend(a1, "possibleTitles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPossibleTitles:", v11);

    objc_msgSend(a1, "primaryAction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPrimaryAction:", v12);

  }
  objc_msgSend(a1, "accessibilityIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIdentifier:", v13);

  return v6;
}

- (void)ql_copySystemItem
{
  __assert_rtn("-[UIBarButtonItem(QLUIBarButtonItemCopy) ql_copySystemItem]", "QLPreviewController+Overlay.m", 71, "self.customView == nil");
}

@end
