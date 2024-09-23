@implementation UIViewController(DOCAppearanceInheritance)

- (void)setAppearance:()DOCAppearanceInheritance
{
  id v4;

  objc_setAssociatedObject(a1, &_docAppearanceIdentifier, a3, (void *)3);
  objc_msgSend(a1, "effectiveAppearance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_notifyAppearanceChange:", v4);

}

- (void)_notifyAppearanceChange:()DOCAppearanceInheritance
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BEBDB00];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__UIViewController_DOCAppearanceInheritance___notifyAppearanceChange___block_invoke;
  v7[3] = &unk_24E327A10;
  v7[4] = a1;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performWithoutAnimation:", v7);

}

- (void)doc_viewDidLoad
{
  void *v2;
  id v3;

  objc_msgSend(a1, "doc_viewDidLoad");
  objc_msgSend(a1, "_appearance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1, "viewIfLoaded");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_notifyAppearanceChange:", v3);

  }
}

- (id)effectiveAppearance
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_appearance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "viewIfLoaded");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "effectiveAppearance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      objc_msgSend(a1, "parentViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "effectiveAppearance");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  return v2;
}

- (id)_appearance
{
  return objc_getAssociatedObject(a1, &_docAppearanceIdentifier);
}

+ (uint64_t)load
{
  return objc_msgSend(a1, "_doc_swapMethodWithSelector:withMethodWithSelector:", sel_viewDidLoad, sel_doc_viewDidLoad);
}

@end
