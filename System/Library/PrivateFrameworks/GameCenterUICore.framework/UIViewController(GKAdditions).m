@implementation UIViewController(GKAdditions)

- (uint64_t)_gkUpdateContentsWithCompletionHandlerAndError:()GKAdditions
{
  uint64_t result;

  if (a3)
    return (*(uint64_t (**)(uint64_t, _QWORD))(a3 + 16))(a3, 0);
  return result;
}

- (void)_gkResetContents
{
  id v2;

  objc_msgSend(a1, "_gkForceNextContentUpdate");
  objc_msgSend(a1, "presentedViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_gkResetContents");

}

- (void)_gkForceNextContentUpdate
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  const char *label;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  dispatch_get_current_queue();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 != MEMORY[0x24BDAC9B8])
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    label = dispatch_queue_get_label(v2);
    v6 = (void *)MEMORY[0x24BDAC9B8];
    v7 = dispatch_queue_get_label(MEMORY[0x24BDAC9B8]);
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%s invoked on the wrong queue (got:%s expected:%s) at %@"), "-[UIViewController(GKAdditions) _gkForceNextContentUpdate]", label, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKUIKitAdditions.m");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastPathComponent");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (_actualCurrentQueue == dispatch_get_main_queue())\n[%s (%s:%d)]"), v9, "-[UIViewController(GKAdditions) _gkForceNextContentUpdate]", objc_msgSend(v11, "UTF8String"), 87);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v12);
  }

  objc_setAssociatedObject(a1, CFSTR("_gkContentUpdateHandlers"), 0, (void *)0x301);
  objc_setAssociatedObject(a1, CFSTR("_gkContentRecentlyUpdated"), 0, (void *)0x301);
}

- (void)_gkSetContentsNeedUpdateWithHandler:()GKAdditions
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x24BDAC9B8];
  v5 = MEMORY[0x24BDAC9B8];
  v6 = v3;
  gk_dispatch_as_group();

}

- (void)_gkHandleURLPathComponents:()GKAdditions query:
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;

  v14 = a3;
  v6 = a4;
  objc_msgSend(a1, "childViewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(a1, "childViewControllers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(a1, "presentedViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(a1, "presentedViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      objc_msgSend(a1, "presentedViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      objc_msgSend(v10, "_gkHandleURLPathComponents:query:", v14, v6);
LABEL_8:

    }
  }

}

- (void)_gkDismissActivityViewControllerAnimated:()GKAdditions
{
  id v4;

  objc_msgSend(a1, "navigationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", a3, 0);

}

- (void)_gkPresentActivityViewController:()GKAdditions fromView:
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "popoverPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSourceView:", v6);

  objc_msgSend(a1, "navigationController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentViewController:animated:completion:", v7, 1, 0);

}

- (id)_gkPresentActivityViewControllerForActivityItems:()GKAdditions fromView:withCompletionHandler:
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, uint64_t, void *, void *);
  void *v21;
  void *v22;
  id v23;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v18 = MEMORY[0x24BDAC760];
  v19 = 3221225472;
  v20 = __113__UIViewController_GKAdditions___gkPresentActivityViewControllerForActivityItems_fromView_withCompletionHandler___block_invoke;
  v21 = &unk_24DC276F8;
  v22 = a1;
  v23 = v8;
  v9 = v8;
  v10 = a4;
  v11 = a3;
  v12 = (void *)MEMORY[0x220737704](&v18);
  v13 = objc_alloc((Class)objc_opt_class());
  v14 = (void *)objc_msgSend(v13, "initWithActivityItems:applicationActivities:", v11, 0, v18, v19, v20, v21, v22);

  objc_msgSend(v14, "setCompletionWithItemsHandler:", v12);
  v15 = *MEMORY[0x24BDF7468];
  v24[0] = *MEMORY[0x24BDF7470];
  v24[1] = v15;
  v24[2] = *MEMORY[0x24BDF7480];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setExcludedActivityTypes:", v16);

  objc_msgSend(a1, "_gkPresentActivityViewController:fromView:", v14, v10);
  return v14;
}

- (void)_gkRefreshContentsForDataType:()GKAdditions userInfo:
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(a1, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "_gkShouldRefreshContentsForDataType:userInfo:", a3, v8))
    objc_msgSend(v7, "_gkRefreshContentsForDataType:userInfo:", a3, v8);
  if (objc_msgSend(a1, "_gkShouldRefreshContentsForDataType:userInfo:", a3, v8))
    objc_msgSend(v7, "_gkRefreshContentsForDataType:userInfo:", a3, v8);

}

- (uint64_t)_gkShouldRefreshContentsForDataType:()GKAdditions userInfo:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v6 = a4;
  objc_msgSend(a1, "presentedViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "_gkShouldRefreshContentsForDataType:userInfo:", a3, v6);
  else
    v9 = 0;

  return v9;
}

- (void)_gkConfigureFocusGuidesForNavigationBar:()GKAdditions
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[8];
  id v51;
  _QWORD v52[3];

  v52[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x24BDF6A58];
    v5 = a3;
    v6 = objc_alloc_init(v4);
    v52[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPreferredFocusEnvironments:", v7);

    objc_msgSend(a1, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addLayoutGuide:", v6);

    v9 = objc_alloc_init(MEMORY[0x24BDF6A58]);
    v51 = v5;
    v24 = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v51, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPreferredFocusEnvironments:", v10);

    objc_msgSend(a1, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addLayoutGuide:", v9);

    v34 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v6, "leadingAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "view");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v46;
    objc_msgSend(v6, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "view");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v42);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v41;
    v43 = v6;
    objc_msgSend(v6, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "view");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v37;
    objc_msgSend(v6, "bottomAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "topAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v33, v12);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = v32;
    objc_msgSend(v9, "leadingAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "leadingAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v50[4] = v27;
    objc_msgSend(v9, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v23);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v50[5] = v13;
    v31 = v9;
    objc_msgSend(v9, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v50[6] = v17;
    objc_msgSend(v9, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:constant:", v20, 1.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v50[7] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activateConstraints:", v22);

  }
}

@end
