@implementation PageZoomActivity

- (id)activityTitle
{
  return (id)_WBSLocalizedString();
}

- (id)activityType
{
  return CFSTR("SafariActivityTypePageZoom");
}

- (id)systemImageNameWithTabDocument:(id)a3
{
  return CFSTR("textformat.size");
}

- (int64_t)actionTypeWithTabDocument:(id)a3
{
  if (objc_msgSend(a3, "isShowingReader"))
    return 4;
  else
    return 3;
}

- (void)performActivityWithTabDocument:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  CapsuleHidingStepperViewController *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[_SFActivity activityDidFinish:](self, "activityDidFinish:", 1);
  objc_msgSend(v14, "browserController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isShowingReader"))
  {
    v6 = objc_alloc(MEMORY[0x1E0CD55F8]);
    objc_msgSend(v14, "readerContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "initWithReaderContext:", v7);
  }
  else
  {
    v9 = objc_alloc(MEMORY[0x1E0CD55D8]);
    objc_msgSend(v4, "pageZoomManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "initWithDocument:preferenceManager:", v14, v7);
  }
  v10 = (void *)v8;

  v11 = -[StepperViewController initWithStepperController:]([CapsuleHidingStepperViewController alloc], "initWithStepperController:", v10);
  objc_msgSend(v5, "capsuleViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CapsuleHidingStepperViewController setCapsuleViewController:](v11, "setCapsuleViewController:", v12);

  objc_msgSend(v4, "viewControllerToPresentFrom");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentViewController:animated:completion:", v11, 1, 0);

}

@end
