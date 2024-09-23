@implementation CNPosterEditOptionsViewController

- (CNPosterEditOptionsViewController)initWithContact:(id)a3 mode:(int64_t)a4
{
  id v7;
  CNPosterEditOptionsViewController *v8;
  _TtC10ContactsUI31CNPosterEditorViewConfiguration *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _TtC10ContactsUI31CNPosterEditorViewConfiguration *configuration;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  CNContact *contactForSharedProfile;
  CNPosterEditOptionsViewController *v20;
  objc_super v22;

  v7 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CNPosterEditOptionsViewController;
  v8 = -[CNPosterEditOptionsViewController init](&v22, sel_init);
  if (v8)
  {
    v9 = [_TtC10ContactsUI31CNPosterEditorViewConfiguration alloc];
    if (a4)
    {
      objc_msgSend(v7, "wallpaper");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "posterArchiveData");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "posterName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[CNPosterEditorViewConfiguration initWithPosterArchiveData:displayName:](v9, "initWithPosterArchiveData:displayName:", v11, v12);
      configuration = v8->_configuration;
      v8->_configuration = (_TtC10ContactsUI31CNPosterEditorViewConfiguration *)v13;

    }
    else
    {
      objc_msgSend(v7, "imageData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "posterName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[CNPosterEditorViewConfiguration initWithImageData:displayName:](v9, "initWithImageData:displayName:", v10, v11);
      v12 = v8->_configuration;
      v8->_configuration = (_TtC10ContactsUI31CNPosterEditorViewConfiguration *)v15;
    }

    objc_storeStrong((id *)&v8->_contact, a3);
    objc_msgSend(MEMORY[0x1E0D13A38], "currentEnvironment");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "nicknameProvider");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "nicknameAsContactForContact:", v7);
    v18 = objc_claimAutoreleasedReturnValue();
    contactForSharedProfile = v8->_contactForSharedProfile;
    v8->_contactForSharedProfile = (CNContact *)v18;

    v8->_mode = a4;
    v20 = v8;
  }

  return v8;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  _TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper *v5;
  void *v6;
  void *v7;
  void *v8;
  _TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper *v9;
  _TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper *v10;
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
  _TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper *v44;
  objc_super v45;
  _QWORD v46[5];

  v46[4] = *MEMORY[0x1E0C80C00];
  v45.receiver = self;
  v45.super_class = (Class)CNPosterEditOptionsViewController;
  -[CNPosterEditOptionsViewController viewDidLoad](&v45, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterEditOptionsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = [_TtC10ContactsUI49CNAvatarPosterPairCollectionViewControllerWrapper alloc];
  -[CNPosterEditOptionsViewController configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterEditOptionsViewController contact](self, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterEditOptionsViewController contactForSharedProfile](self, "contactForSharedProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNAvatarPosterPairCollectionViewControllerWrapper initWithConfiguration:contact:contactForSharedProfile:mode:delegate:](v5, "initWithConfiguration:contact:contactForSharedProfile:mode:delegate:", v6, v7, v8, -[CNPosterEditOptionsViewController mode](self, "mode"), self);

  v10 = v9;
  -[CNAvatarPosterPairCollectionViewControllerWrapper viewController](v9, "viewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[CNAvatarPosterPairCollectionViewControllerWrapper viewController](v10, "viewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "willMoveToParentViewController:", self);

  v44 = v10;
  -[CNAvatarPosterPairCollectionViewControllerWrapper viewController](v10, "viewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterEditOptionsViewController addChildViewController:](self, "addChildViewController:", v14);

  -[CNPosterEditOptionsViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v12);

  -[CNAvatarPosterPairCollectionViewControllerWrapper viewController](v10, "viewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "didMoveToParentViewController:", self);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_posterEditOptionsDidCancel);
  -[CNPosterEditOptionsViewController navigationItem](self, "navigationItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLeftBarButtonItem:", v17);

  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_posterEditOptionsDidTapDone);
  -[CNPosterEditOptionsViewController navigationItem](self, "navigationItem");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setRightBarButtonItem:", v19);

  -[CNPosterEditOptionsViewController navigationItem](self, "navigationItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rightBarButtonItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setEnabled:", 0);

  -[CNPosterEditOptionsViewController navigationItem](self, "navigationItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "_setBackgroundHidden:", 1);

  v35 = (void *)MEMORY[0x1E0CB3718];
  v24 = v12;
  objc_msgSend(v12, "leadingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterEditOptionsViewController view](self, "view");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "leadingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v40;
  objc_msgSend(v12, "trailingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterEditOptionsViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "trailingAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v36);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v46[1] = v25;
  v37 = v12;
  objc_msgSend(v12, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterEditOptionsViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "topAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v46[2] = v29;
  objc_msgSend(v24, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterEditOptionsViewController view](self, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v46[3] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "activateConstraints:", v34);

}

- (void)avatarPosterPairCollectionDidLoadCurrentPairWithAvatar:(id)a3 poster:(id)a4 backedByRecents:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a5;
  v8 = a4;
  -[CNPosterEditOptionsViewController finalizedCurrentAvatar:backedByRecents:](self, "finalizedCurrentAvatar:backedByRecents:", a3, v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPosterEditOptionsViewController finalizedCurrentPoster:](self, "finalizedCurrentPoster:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNPosterEditOptionsViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "posterEditOptionsViewController:didLoadCurrentAvatar:poster:backedByRecents:", self, v11, v9, v5);

}

- (void)avatarPosterPairCollectionDidDeleteCurrentPosterPair
{
  id v3;

  -[CNPosterEditOptionsViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "posterEditOptionsViewControllerDidDeleteCurrentPosterPair:", self);

}

- (void)avatarPosterPairCollectionDidDeletePosterPair
{
  id v3;

  -[CNPosterEditOptionsViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "posterEditOptionsViewControllerDidDeleteExistingPosterPair:", self);

}

- (void)avatarPosterPairCollectionDidSelectEditAvatar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CNPosterEditOptionsViewController pendingPoster](self, "pendingPoster");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAvatarPosterCarouselEditingContext contextWithExistingPoster:existingAvatar:](CNAvatarPosterCarouselEditingContext, "contextWithExistingPoster:existingAvatar:", v5, v4);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[CNPosterEditOptionsViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "posterEditOptionsViewController:didSelectEditAvatarWithContext:", self, v7);

}

- (void)avatarPosterPairCollectionDidEditPoster:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CNPosterEditOptionsViewController pendingPoster](self, "pendingPoster");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterEditOptionsViewController pendingAvatar](self, "pendingAvatar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNAvatarPosterCarouselEditingContext contextWithExistingPoster:existingAvatar:](CNAvatarPosterCarouselEditingContext, "contextWithExistingPoster:existingAvatar:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    +[CNAvatarPosterCarouselPendingPosterEdit pendingEditFromPosterConfiguration:](CNAvatarPosterCarouselPendingPosterEdit, "pendingEditFromPosterConfiguration:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPendingPosterEdit:", v7);

  }
  -[CNPosterEditOptionsViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "posterEditOptionsViewController:didEditPosterWithContext:", self, v6);

}

- (void)avatarPosterPairCollectionDidSelectCreateNew
{
  id v3;

  -[CNPosterEditOptionsViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "posterEditOptionsViewControllerDidSelectCreateNew:", self);

}

- (void)avatarPosterPairCollectionDidSelectAvatar:(id)a3 poster:(id)a4 selectionDidChange:(BOOL)a5 isShared:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v6 = a6;
  v7 = a5;
  v10 = a4;
  -[CNPosterEditOptionsViewController setPendingAvatar:](self, "setPendingAvatar:", a3);
  -[CNPosterEditOptionsViewController setPendingPoster:](self, "setPendingPoster:", v10);

  -[CNPosterEditOptionsViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "rightBarButtonItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setEnabled:", v7);

  if (v6)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("SNAP_PHOTO_BANNER_SUBTITLE_%@"), &stru_1E20507A8, CFSTR("Localized"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPosterEditOptionsViewController contact](self, "contact");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "posterName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "capitalizedString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPosterEditOptionsViewController navigationItem](self, "navigationItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setTitle:", v18);

  }
  else
  {
    -[CNPosterEditOptionsViewController navigationItem](self, "navigationItem");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTitle:", 0);
  }

}

- (void)posterEditOptionsDidCancel
{
  id v3;

  -[CNPosterEditOptionsViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "posterEditOptionsViewControllerDidCancel:", self);

}

- (void)posterEditOptionsDidTapDone
{
  void *v3;
  void *v4;
  id v5;

  -[CNPosterEditOptionsViewController finalizedPendingPoster](self, "finalizedPendingPoster");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNPosterEditOptionsViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterEditOptionsViewController pendingAvatar](self, "pendingAvatar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "posterEditOptionsViewController:didSelectAvatar:poster:", self, v4, v5);

}

- (id)finalizedPendingPoster
{
  void *v3;
  void *v4;

  -[CNPosterEditOptionsViewController pendingPoster](self, "pendingPoster");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterEditOptionsViewController finalizedPoster:](self, "finalizedPoster:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)finalizedCurrentAvatar:(id)a3 backedByRecents:(BOOL)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a3;
  v6 = v5;
  if (a4)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(v5, "imageData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "copyWithNewImageData:", v8);

  }
  return v7;
}

- (id)finalizedPoster:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;

  v4 = a3;
  if (!v4)
    goto LABEL_3;
  +[CNWallpaperConfigurationGenerator shared](_TtC10ContactsUI33CNWallpaperConfigurationGenerator, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "posterData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPosterEditOptionsViewController contact](self, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isCleanStatePosterData:contact:", v6, v7);

  if ((v8 & 1) == 0)
    v9 = v4;
  else
LABEL_3:
    v9 = 0;

  return v9;
}

- (_TtC10ContactsUI31CNPosterEditorViewConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (CNPosterEditOptionsViewControllerDelegate)delegate
{
  return (CNPosterEditOptionsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (CNContact)contactForSharedProfile
{
  return self->_contactForSharedProfile;
}

- (void)setContactForSharedProfile:(id)a3
{
  objc_storeStrong((id *)&self->_contactForSharedProfile, a3);
}

- (CNContactImage)pendingAvatar
{
  return self->_pendingAvatar;
}

- (void)setPendingAvatar:(id)a3
{
  objc_storeStrong((id *)&self->_pendingAvatar, a3);
}

- (CNContactPoster)pendingPoster
{
  return self->_pendingPoster;
}

- (void)setPendingPoster:(id)a3
{
  objc_storeStrong((id *)&self->_pendingPoster, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingPoster, 0);
  objc_storeStrong((id *)&self->_pendingAvatar, 0);
  objc_storeStrong((id *)&self->_contactForSharedProfile, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
