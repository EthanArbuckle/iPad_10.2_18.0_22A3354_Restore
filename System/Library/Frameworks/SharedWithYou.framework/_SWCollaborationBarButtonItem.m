@implementation _SWCollaborationBarButtonItem

- (NSItemProvider)itemProvider
{
  void *v2;
  void *v3;
  void *v4;

  -[_SWCollaborationBarButtonItem collaborationButtonView](self, "collaborationButtonView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSItemProvider *)v4;
}

- (void)setItemProvider:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_SWCollaborationBarButtonItem collaborationButtonView](self, "collaborationButtonView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buttonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setItemProvider:", v4);

}

- (UICloudSharingControllerDelegate)cloudSharingControllerDelegate
{
  void *v2;
  void *v3;
  void *v4;

  -[_SWCollaborationBarButtonItem collaborationButtonView](self, "collaborationButtonView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cloudSharingControllerDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UICloudSharingControllerDelegate *)v4;
}

- (void)setCloudSharingControllerDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_SWCollaborationBarButtonItem collaborationButtonView](self, "collaborationButtonView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buttonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCloudSharingControllerDelegate:", v4);

}

- (unint64_t)activeParticipantCount
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[_SWCollaborationBarButtonItem collaborationButtonView](self, "collaborationButtonView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "activeParticipantCount");

  return v4;
}

- (void)setActiveParticipantCount:(unint64_t)a3
{
  void *v4;
  id v5;

  -[_SWCollaborationBarButtonItem collaborationButtonView](self, "collaborationButtonView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buttonView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActiveParticipantCount:", a3);

}

- (BOOL)isContentShared
{
  void *v2;
  void *v3;
  char v4;

  -[_SWCollaborationBarButtonItem collaborationButtonView](self, "collaborationButtonView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isContentShared");

  return v4;
}

- (void)setIsContentShared:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[_SWCollaborationBarButtonItem collaborationButtonView](self, "collaborationButtonView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buttonView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsContentShared:", v3);

}

- (_SWCollaborationBarButtonItem)initWithCollaborationButtonView:(id)a3
{
  id v4;
  _SWCollaborationBarButtonItem *v5;
  _SWCollaborationBarButtonItem *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_SWCollaborationBarButtonItem;
  v5 = -[UIBarItem init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_SWCollaborationBarButtonItem setCollaborationButtonView:](v5, "setCollaborationButtonView:", v4);
    -[_SWCollaborationBarButtonItem setCustomView:](v6, "setCustomView:", v4);
    objc_initWeak(&location, v6);
    v7 = (void *)MEMORY[0x1E0DC36F8];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __65___SWCollaborationBarButtonItem_initWithCollaborationButtonView___block_invoke;
    v10[3] = &unk_1E2873BB0;
    v11 = v4;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v7, "elementWithUncachedProvider:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SWCollaborationBarButtonItem _dci_setMenuRepresentation:](v6, "_dci_setMenuRepresentation:", v8);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return v6;
}

- (_SWCollaborationBarButtonItem)initWithItemProvider:(id)a3
{
  id v4;
  _SWCollaborationButtonView *v5;
  _SWCollaborationBarButtonItem *v6;

  v4 = a3;
  v5 = -[SWCollaborationView initWithItemProvider:]([_SWCollaborationButtonView alloc], "initWithItemProvider:", v4);

  v6 = -[_SWCollaborationBarButtonItem initWithCollaborationButtonView:](self, "initWithCollaborationButtonView:", v5);
  return v6;
}

- (_SWCollaborationBarButtonItem)initWithCoder:(id)a3
{

  return 0;
}

- (void)dismissPopoverAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v6 = a4;
  -[_SWCollaborationBarButtonItem collaborationButtonView](self, "collaborationButtonView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "buttonView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissPopoverAnimated:completion:", v4, v6);

}

- (void)setDetailViewListContent:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_SWCollaborationBarButtonItem collaborationButtonView](self, "collaborationButtonView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buttonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetailViewListContent:", v4);

}

- (void)setManageButtonTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_SWCollaborationBarButtonItem collaborationButtonView](self, "collaborationButtonView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "buttonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setManageButtonTitle:", v4);

}

- (void)setShowManageButton:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[_SWCollaborationBarButtonItem collaborationButtonView](self, "collaborationButtonView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buttonView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowManageButton:", v3);

}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (_SWCollaborationButtonView)collaborationButtonView
{
  return self->_collaborationButtonView;
}

- (void)setCollaborationButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationButtonView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationButtonView, 0);
}

- (SWHighlight)highlight
{
  _SWCollaborationBarButtonItem *v2;
  _SWCollaborationButtonView *v3;
  _SWCollaborationButtonViewImpl *v4;
  id v5;

  v2 = self;
  v3 = -[_SWCollaborationBarButtonItem collaborationButtonView](v2, sel_collaborationButtonView);
  v4 = sub_18EAD58D8(v3, sel_buttonView);

  v5 = objc_msgSend(*(id *)((char *)&v4->super.super.super.isa + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_collaborationHighlight);
  return (SWHighlight *)v5;
}

- (void)setHighlight:(id)a3
{
  _SWCollaborationBarButtonItem *v4;
  _SWCollaborationButtonView *v5;
  _SWCollaborationButtonViewImpl *v6;
  id v7;

  v7 = a3;
  v4 = self;
  v5 = -[_SWCollaborationBarButtonItem collaborationButtonView](v4, sel_collaborationButtonView);
  v6 = sub_18EAD58D8(v5, sel_buttonView);

  objc_msgSend(*(id *)((char *)&v6->super.super.super.isa + OBJC_IVAR____SWCollaborationButtonViewImpl_detailViewController), sel_setCollaborationHighlight_, v7);
}

- (_SWCollaborationBarButtonItem)initWithHighlight:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  char *v9;
  id v10;
  _SWCollaborationBarButtonItem *v11;

  v5 = objc_allocWithZone((Class)_SWCollaborationDetailViewController);
  v6 = a3;
  v7 = objc_msgSend(v5, sel_initWithHighlight_, v6);
  v8 = objc_allocWithZone((Class)type metadata accessor for _SWCollaborationButtonViewImpl());
  v9 = sub_18EAD3484(v7);
  v10 = objc_msgSend(objc_allocWithZone((Class)_SWCollaborationButtonView), sel_initWithTypeErasedButtonView_, v9);
  v11 = -[_SWCollaborationBarButtonItem initWithCollaborationButtonView:](self, sel_initWithCollaborationButtonView_, v10);

  return v11;
}

- (_SWCollaborationBarButtonItem)initWithHighlight:(id)a3 detailViewListContent:(id)a4
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  char *v12;
  id v13;
  _SWCollaborationBarButtonItem *v14;

  v7 = objc_allocWithZone((Class)_SWCollaborationDetailViewController);
  v8 = a3;
  v9 = a4;
  v10 = objc_msgSend(v7, sel_initWithHighlight_listContent_, v8, v9);
  v11 = objc_allocWithZone((Class)type metadata accessor for _SWCollaborationButtonViewImpl());
  v12 = sub_18EAD3484(v10);
  v13 = objc_msgSend(objc_allocWithZone((Class)_SWCollaborationButtonView), sel_initWithTypeErasedButtonView_, v12);
  v14 = -[_SWCollaborationBarButtonItem initWithCollaborationButtonView:](self, sel_initWithCollaborationButtonView_, v13);

  return v14;
}

@end
