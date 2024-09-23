@implementation _SWCollaborationDetailViewController

- (_SWCollaborationDetailViewController)initWithCoder:(id)a3
{

  return 0;
}

- (void)setItemProvider:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_SWCollaborationDetailViewController viewModel](self, "viewModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItemProvider:", v4);

}

- (NSItemProvider)itemProvider
{
  void *v2;
  void *v3;

  -[_SWCollaborationDetailViewController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "itemProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSItemProvider *)v3;
}

- (void)setCloudSharingControllerDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_SWCollaborationDetailViewController viewModel](self, "viewModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCloudSharingControllerDelegate:", v4);

}

- (UICloudSharingControllerDelegate)cloudSharingControllerDelegate
{
  void *v2;
  void *v3;

  -[_SWCollaborationDetailViewController viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudSharingControllerDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UICloudSharingControllerDelegate *)v3;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  objc_msgSend(a3, "preferredContentSize");
  -[_SWCollaborationDetailViewController setPreferredContentSize:](self, "setPreferredContentSize:");
}

- (void)setManageButtonTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    -[_SWCollaborationDetailViewController viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "manageButtonTitle");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v8;
    if (v6 != v8)
    {
      -[_SWCollaborationDetailViewController viewModel](self, "viewModel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setManageButtonTitle:", v8);

      v4 = v8;
    }
  }

}

- (void)setShowManageButton:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_SWCollaborationDetailViewController viewModel](self, "viewModel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowManageButton:", v3);

}

- (_SWCollaborationDetailViewController)initWithItemProvider:(id)a3
{
  _SWCollaborationDetailViewController *v3;

  if (a3)
  {
    self = -[_SWCollaborationDetailViewController initWithItemProvider_impl:](self, "initWithItemProvider_impl:");
    v3 = self;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (UIViewController)typeErasedHostingController
{
  return self->_typeErasedHostingController;
}

- (void)setTypeErasedHostingController:(id)a3
{
  objc_storeStrong((id *)&self->_typeErasedHostingController, a3);
}

- (NSObject)typeErasedViewModel
{
  return self->_typeErasedViewModel;
}

- (void)setTypeErasedViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_typeErasedViewModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeErasedViewModel, 0);
  objc_storeStrong((id *)&self->_itemProvider, 0);
  objc_storeStrong((id *)&self->_typeErasedHostingController, 0);
}

- (_SWCollaborationDetailViewController)initWithItemProvider_impl:(id)a3
{
  return (_SWCollaborationDetailViewController *)_SWCollaborationDetailViewController.init(itemProvider:)(a3);
}

- (SWCollaborationDetailViewModel)viewModel
{
  _SWCollaborationDetailViewController *v2;
  SWCollaborationDetailViewModel *result;

  v2 = self;
  result = -[_SWCollaborationDetailViewController typeErasedViewModel](v2, sel_typeErasedViewModel);
  if (result)
  {

    type metadata accessor for CollaborationDetailViewModel(0);
    return (SWCollaborationDetailViewModel *)(id)swift_dynamicCastClassUnconditional();
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setViewModel:(id)a3
{
  -[_SWCollaborationDetailViewController setTypeErasedViewModel:](self, sel_setTypeErasedViewModel_, a3);
}

- (void)setListContentView:(id)a3
{
  id v4;
  _SWCollaborationDetailViewController *v5;
  SWCollaborationDetailViewModel *v6;
  id v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  char v16;
  uint64_t v17;

  v4 = a3;
  v5 = self;
  v6 = -[_SWCollaborationDetailViewController viewModel](v5, sel_viewModel);
  v7 = v4;
  sub_18EAE6DFC();
  v8 = v13;
  v9 = v14;
  type metadata accessor for CollaborationDetailViewModel(0);
  sub_18EAE12D0();
  v10 = sub_18EAE6A9C();
  v12 = v11;
  v13 = v10;
  v14 = (uint64_t)v11;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  sub_18EAE3898((uint64_t)&v13);

  swift_release();
}

- (SWHighlight)collaborationHighlight
{
  _SWCollaborationDetailViewController *v2;
  SWCollaborationDetailViewModel *v3;
  id v5;

  v2 = self;
  v3 = -[_SWCollaborationDetailViewController viewModel](v2, sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A60();

  swift_release();
  swift_release();
  return (SWHighlight *)v5;
}

- (void)setCollaborationHighlight:(id)a3
{
  id v4;
  _SWCollaborationDetailViewController *v5;
  SWCollaborationDetailViewModel *v6;

  v4 = a3;
  v5 = self;
  v6 = -[_SWCollaborationDetailViewController viewModel](v5, sel_viewModel);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18EAE6A6C();

}

- (_SWCollaborationDetailViewController)initWithHighlight:(id)a3 listContent:(id)a4
{
  id v6;
  _SWCollaborationDetailViewController *v7;

  swift_getObjectType();
  v6 = a3;
  v7 = (_SWCollaborationDetailViewController *)sub_18EAE3014(a3, a4);
  swift_deallocPartialClassInstance();
  return v7;
}

- (_SWCollaborationDetailViewController)initWithHighlight:(id)a3
{
  id v4;

  v4 = a3;
  return (_SWCollaborationDetailViewController *)_SWCollaborationDetailViewController.init(highlight:)(a3);
}

@end
