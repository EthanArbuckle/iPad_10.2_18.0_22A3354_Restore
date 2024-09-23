@implementation SWCollaborationView

- (SWCollaborationView)initWithButtonView:(id)a3
{
  id v5;
  SWCollaborationView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  objc_super v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SWCollaborationView;
  v6 = -[SWCollaborationView initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v6)
  {
    objc_msgSend(v5, "setOuterButton:", v6);
    objc_storeStrong((id *)&v6->_typeErasedButtonView, a3);
    -[SWCollaborationView addSubview:](v6, "addSubview:", v6->_typeErasedButtonView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v6->_typeErasedButtonView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v17 = (void *)MEMORY[0x1E0CB3718];
    -[UIView leadingAnchor](v6->_typeErasedButtonView, "leadingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWCollaborationView leadingAnchor](v6, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v20);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v19;
    -[UIView trailingAnchor](v6->_typeErasedButtonView, "trailingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWCollaborationView trailingAnchor](v6, "trailingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v8;
    -[UIView topAnchor](v6->_typeErasedButtonView, "topAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWCollaborationView topAnchor](v6, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v22 = v5;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[2] = v11;
    -[UIView bottomAnchor](v6->_typeErasedButtonView, "bottomAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SWCollaborationView bottomAnchor](v6, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v24[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activateConstraints:", v15);

    v5 = v22;
  }

  return v6;
}

- (BOOL)_shouldOverrideSymbolConfigForVisionFreeform
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return 0;
}

- (BOOL)_shouldOverrideSymbolConfigForIWork
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    v5 = objc_msgSend(v4, "containsObject:", v3);
  else
    v5 = 0;

  return v5;
}

- (SWCollaborationView)initWithItemProvider:(NSItemProvider *)itemProvider
{
  NSItemProvider *v4;
  _SWCollaborationButtonViewImpl *v5;
  SWCollaborationView *v6;

  v4 = itemProvider;
  v5 = -[_SWCollaborationButtonViewImpl initWithItemProvider:]([_SWCollaborationButtonViewImpl alloc], "initWithItemProvider:", v4);

  v6 = -[SWCollaborationView initWithButtonView:](self, "initWithButtonView:", v5);
  return v6;
}

- (void)setDelegate:(id)delegate
{
  id v4;
  id v5;

  v4 = delegate;
  sub_18EAD58D8(self, "buttonView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

}

- (void)dismissPopover:(void *)completion
{
  void *v4;
  id v5;

  v4 = completion;
  sub_18EAD58D8(self, "buttonView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissPopoverAnimated:completion:", 1, v4);

}

- (void)setContentView:(UIView *)detailViewListContentView
{
  UIView *v4;
  id v5;

  v4 = detailViewListContentView;
  sub_18EAD58D8(self, "buttonView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDetailViewListContent:", v4);

}

- (void)dismissPopoverAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  sub_18EAD58D8(self, "buttonView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissPopoverAnimated:completion:", v4, v6);

}

- (void)setActiveParticipantCount:(NSUInteger)activeParticipantCount
{
  id v4;

  sub_18EAD58D8(self, "buttonView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActiveParticipantCount:", activeParticipantCount);

}

- (void)setManageButtonTitle:(NSString *)manageButtonTitle
{
  NSString *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *v8;

  v8 = manageButtonTitle;
  if (!v8 || (v4 = v8, !-[NSString length](v8, "length")))
  {
    SWFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Manage Share"), &stru_1E2875070, CFSTR("SharedWithYou"));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
  sub_18EAD58D8(self, "buttonView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setManageButtonTitle:", v4);

  v7 = self->_manageButtonTitle;
  self->_manageButtonTitle = v4;

}

- (void)setShowManageButton:(BOOL)showManageButton
{
  _BOOL8 v3;
  id v4;

  v3 = showManageButton;
  sub_18EAD58D8(self, "buttonView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowManageButton:", v3);

}

- (void)setHeaderTitle:(NSString *)headerTitle
{
  NSString *v4;
  id v5;

  v4 = headerTitle;
  sub_18EAD58D8(self, "buttonView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHeaderTitle:", v4);

}

- (void)setHeaderSubtitle:(NSString *)headerSubtitle
{
  NSString *v4;
  id v5;

  v4 = headerSubtitle;
  sub_18EAD58D8(self, "buttonView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHeaderSubtitle:", v4);

}

- (void)setHeaderImage:(UIImage *)headerImage
{
  UIImage *v4;
  id v5;

  v4 = headerImage;
  sub_18EAD58D8(self, "buttonView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHeaderImage:", v4);

}

- (void)updatePlaceholderGlyphScale:(int64_t)a3 weight:(int64_t)a4 pointSize:(double)a5
{
  id v8;

  sub_18EAD58D8(self, "buttonView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updatePlaceHolderSymbolScale:weight:pointSize:", a3, a4, a5);

}

- (UIView)typeErasedButtonView
{
  return self->_typeErasedButtonView;
}

- (void)setTypeErasedButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_typeErasedButtonView, a3);
}

- (id)cloudSharingDelegate
{
  return objc_loadWeakRetained((id *)&self->_cloudSharingDelegate);
}

- (void)setCloudSharingDelegate:(id)cloudSharingDelegate
{
  objc_storeWeak((id *)&self->_cloudSharingDelegate, cloudSharingDelegate);
}

- (NSUInteger)activeParticipantCount
{
  return self->_activeParticipantCount;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSString)headerSubtitle
{
  return self->_headerSubtitle;
}

- (UIImage)headerImage
{
  return self->_headerImage;
}

- (id)cloudSharingControllerDelegate
{
  return objc_loadWeakRetained((id *)&self->_cloudSharingControllerDelegate);
}

- (void)setCloudSharingControllerDelegate:(id)cloudSharingControllerDelegate
{
  objc_storeWeak((id *)&self->_cloudSharingControllerDelegate, cloudSharingControllerDelegate);
}

- (NSString)manageButtonTitle
{
  return self->_manageButtonTitle;
}

- (_SWCollaborationButtonViewImpl)buttonView
{
  return self->_buttonView;
}

- (void)setButtonView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonView, 0);
  objc_storeStrong((id *)&self->_manageButtonTitle, 0);
  objc_destroyWeak((id *)&self->_cloudSharingControllerDelegate);
  objc_storeStrong((id *)&self->_headerImage, 0);
  objc_storeStrong((id *)&self->_headerSubtitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_cloudSharingDelegate);
  objc_storeStrong((id *)&self->_typeErasedButtonView, 0);
}

@end
