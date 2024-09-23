@implementation AESnapshotViewController

- (AESnapshotViewController)initWithViewController:(id)a3
{
  id v4;
  AESnapshotViewController *v5;
  void *v6;
  uint64_t v7;
  UIView *snapshotView;
  AESnapshotViewController *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AESnapshotViewController;
  v5 = -[AESnapshotViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    objc_msgSend(v4, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "snapshotViewAfterScreenUpdates:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    snapshotView = v5->__snapshotView;
    v5->__snapshotView = (UIView *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)loadView
{
  id v3;

  -[AESnapshotViewController _snapshotView](self, "_snapshotView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[AESnapshotViewController setView:](self, "setView:", v3);

}

- (UIView)_snapshotView
{
  return self->__snapshotView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__snapshotView, 0);
}

@end
