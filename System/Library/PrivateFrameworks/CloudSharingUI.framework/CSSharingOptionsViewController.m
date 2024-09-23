@implementation CSSharingOptionsViewController

- (CSSharingOptionsViewController)initWithCollaborationSharingOptions:(id)a3 layoutMargins:(NSDirectionalEdgeInsets)a4 userDidChangeOption:(id)a5 contentSizeDidChange:(id)a6
{
  double trailing;
  double bottom;
  double leading;
  double top;
  id v13;
  id v14;
  id v15;
  CSSharingOptionsViewController *v16;
  void *v17;
  objc_super v19;

  trailing = a4.trailing;
  bottom = a4.bottom;
  leading = a4.leading;
  top = a4.top;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CSSharingOptionsViewController;
  v16 = -[CSSharingOptionsViewController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, 0, 0);
  if (v16)
  {
    +[SharingOptionsViewFactory createCollaborationShareOptionsView:layoutMargins:userDidChangeOption:contentSizeDidChange:](_TtC14CloudSharingUI25SharingOptionsViewFactory, "createCollaborationShareOptionsView:layoutMargins:userDidChangeOption:contentSizeDidChange:", v13, v14, v15, top, leading, bottom, trailing);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSharingOptionsViewController _commonInitWithControllerAndUpdates:](v16, v17);

  }
  return v16;
}

- (void)_commonInitWithControllerAndUpdates:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  _QWORD v33[6];

  v33[4] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v3 = a2;
    objc_msgSend(v3, "sourceAppBundleIDDidChangeBlock");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)a1[121];
    a1[121] = v4;

    objc_msgSend(v3, "viewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "beginAppearanceTransition:animated:", 1, 0);
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", 0);

    objc_msgSend(v6, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(a1, "addChildViewController:", v6);
    objc_msgSend(a1, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

    v23 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(a1, "view");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "widthAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "widthAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v28;
    objc_msgSend(a1, "view");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "heightAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "heightAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v22;
    objc_msgSend(a1, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "leftAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "leftAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v12;
    objc_msgSend(a1, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "topAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "activateConstraints:", v18);

    objc_msgSend(v6, "didMoveToParentViewController:", a1);
    objc_msgSend(v6, "endAppearanceTransition");

  }
}

- (CSSharingOptionsViewController)initWithCollaborationSharingOptionsView:(id)a3 userDidChangeOption:(id)a4
{
  id v6;
  id v7;
  CSSharingOptionsViewController *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CSSharingOptionsViewController;
  v8 = -[CSSharingOptionsViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  if (v8)
  {
    +[SharingOptionsViewFactory createCollaborationShareOptionsView:layoutMargins:userDidChangeOption:contentSizeDidChange:](_TtC14CloudSharingUI25SharingOptionsViewFactory, "createCollaborationShareOptionsView:layoutMargins:userDidChangeOption:contentSizeDidChange:", v6, v7, &__block_literal_global, 0.0, 0.0, 0.0, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSharingOptionsViewController _commonInitWithControllerAndUpdates:](v8, v9);

  }
  return v8;
}

- (CSSharingOptionsViewController)initWithSharingOptionsView:(id)a3 userDidChangeOption:(id)a4
{
  id v6;
  id v7;
  CSSharingOptionsViewController *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CSSharingOptionsViewController;
  v8 = -[CSSharingOptionsViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  if (v8)
  {
    +[SharingOptionsViewFactory createSharingOptionsView:userDidChangeOption:](_TtC14CloudSharingUI25SharingOptionsViewFactory, "createSharingOptionsView:userDidChangeOption:", v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSharingOptionsViewController _commonInitWithControllerAndUpdates:](v8, v9);

  }
  return v8;
}

- (void)setHostBundleID:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_hostBundleID, a3);
  v5 = a3;
  (*((void (**)(void))self->_sourceAppBundleIDDidChangeBlock + 2))();

}

- (NSString)hostBundleID
{
  return self->_hostBundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostBundleID, 0);
  objc_storeStrong(&self->_sourceAppBundleIDDidChangeBlock, 0);
}

@end
