@implementation CNContactPhotoView

- (void)didUpdateContentForAvatarView:(id)a3
{
  void *v3;
  id v4;

  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "launchCheckinRegistrar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "checkInLaunchTasks:", 4);

}

- (void)setPresenterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presenterDelegate, a3);
}

- (void)updateViewsAndNotifyDelegate:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[2];

  v3 = a3;
  v15[1] = *MEMORY[0x1E0C80C00];
  if (self->_pendingEditContact)
  {
    v15[0] = self->_pendingEditContact;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = (void *)v5;
    goto LABEL_6;
  }
  -[CNContactPhotoView contacts](self, "contacts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CNContactPhotoView contacts](self, "contacts");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v7 = (void *)MEMORY[0x1E0C9AA60];
LABEL_6:
  -[CNContactPhotoView setProhibitsPersonaFetch:](self, "setProhibitsPersonaFetch:", 0);
  -[CNContactPhotoView avatarView](self, "avatarView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contacts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToArray:", v7);

  -[CNContactPhotoView avatarView](self, "avatarView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v11, "contactDidChange");
  }
  else
  {
    objc_msgSend(v11, "setContacts:", v7);

    v13 = objc_msgSend(v7, "_cn_any:", &__block_literal_global_118);
    -[CNContactPhotoView avatarView](self, "avatarView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setShouldFetchSharedMeContactPhoto:", v13);
  }

  -[CNContactPhotoView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  -[CNContactPhotoView updateEditPhotoButton](self, "updateEditPhotoButton");
  if (v3)
  {
    -[CNContactPhotoView delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "photoViewDidUpdate:", self);

  }
}

- (CNAvatarView)avatarView
{
  return self->_avatarView;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (CNContactPhotoViewDelegate)delegate
{
  return (CNContactPhotoViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)updateEditPhotoButton
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v20[2];
  _QWORD v21[2];
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (-[CNContactPhotoView isEditing](self, "isEditing")
    && -[CNContactPhotoView showEditingLabel](self, "showEditingLabel"))
  {
    -[CNContactPhotoView editPhotoButton](self, "editPhotoButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", 0);

    if (-[CNContactPhotoView _isUsingSilhouette](self, "_isUsingSilhouette"))
      -[CNContactPhotoView tintColor](self, "tintColor");
    else
      +[CNUIColorRepository contactCardPhotoEditButtonColor](CNUIColorRepository, "contactCardPhotoEditButtonColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPhotoView editPhotoButton](self, "editPhotoButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTintColor:", v4);

    -[CNContactPhotoView labelAlpha](self, "labelAlpha");
    v7 = v6;
    -[CNContactPhotoView editPhotoButton](self, "editPhotoButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", v7);

    LODWORD(v8) = -[CNContactPhotoView _isUsingCuratedPhoto](self, "_isUsingCuratedPhoto");
    CNContactsUIBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((_DWORD)v8)
      v11 = CFSTR("PHOTO_EDIT_LABEL");
    else
      v11 = CFSTR("PHOTO_ADD_LABEL");
    objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1E20507A8, CFSTR("Localized"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("\n"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14 > 2)
    {
      v15 = objc_alloc_init(MEMORY[0x1E0DC1288]);
      objc_msgSend(v15, "setAlignment:", 1);
      objc_msgSend(v15, "setMaximumLineHeight:", 14.0);
      objc_msgSend(v15, "setMinimumLineHeight:", 14.0);
      v17 = *MEMORY[0x1E0DC1108];
      v20[0] = *MEMORY[0x1E0DC1178];
      v20[1] = v17;
      v21[0] = v15;
      v21[1] = &unk_1E20D2CF8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v12, v16);
      -[UIButton setAttributedTitle:forState:](self->_editPhotoButton, "setAttributedTitle:forState:", v18, 0);

    }
    else
    {
      v22 = *MEMORY[0x1E0DC1108];
      v23[0] = &unk_1E20D2CF8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v12, v15);
      -[UIButton setAttributedTitle:forState:](self->_editPhotoButton, "setAttributedTitle:forState:", v16, 0);
    }

  }
  else
  {
    -[CNContactPhotoView editPhotoButton](self, "editPhotoButton");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHidden:", 1);

  }
}

- (UIButton)editPhotoButton
{
  return self->_editPhotoButton;
}

- (void)setProhibitsPersonaFetch:(BOOL)a3
{
  self->_prohibitsPersonaFetch = a3;
}

- (BOOL)isEditing
{
  return self->_editing;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)updateFontSizes
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIButton titleLabel](self->_editPhotoButton, "titleLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v3);

  -[UIButton sizeToFit](self->_editPhotoButton, "sizeToFit");
  -[CNContactPhotoView setNeedsLayout](self, "setNeedsLayout");
}

+ (id)descriptorForRequiredKeysWithThreeDTouchEnabled:(BOOL)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  +[CNAvatarView descriptorForRequiredKeysWithThreeDTouchEnabled:](CNAvatarView, "descriptorForRequiredKeysWithThreeDTouchEnabled:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNVisualIdentityPickerViewController descriptorForRequiredKeys](CNPhotoPickerViewController, "descriptorForRequiredKeys", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C96860];
  v11[1] = v4;
  v11[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactPhotoView descriptorForRequiredKeysWithThreeDTouchEnabled:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptorWithKeyDescriptors:description:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __51__CNContactPhotoView_updateViewsAndNotifyDelegate___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13D40];
  v3 = a2;
  objc_msgSend(v2, "unifiedMeContactMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isMeContact:", v3);

  return v5;
}

- (void)setContacts:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if ((-[NSArray count](self->_contacts, "count") || objc_msgSend(v10, "count"))
    && (objc_msgSend(v10, "_cn_isIdenticalToArray:", self->_contacts) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contacts, a3);
    -[CNContactPhotoView dropInteraction](self, "dropInteraction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (objc_msgSend(v10, "count") == 1)
      {
        -[CNContactPhotoView delegate](self, "delegate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "contactViewCache");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        -[CNContactPhotoView contact](self, "contact");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "policyForContact:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        -[CNContactPhotoView setAcceptsImageDrop:](self, "setAcceptsImageDrop:", objc_msgSend(v9, "isReadonly") ^ 1);
      }
      else
      {
        -[CNContactPhotoView setAcceptsImageDrop:](self, "setAcceptsImageDrop:", 0);
      }
    }
    -[CNContactPhotoView resetPhoto](self, "resetPhoto");
  }

}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (void)setAcceptsImageDrop:(BOOL)a3
{
  self->_acceptsImageDrop = a3;
}

- (id)contact
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[CNContactPhotoView contacts](self, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    -[CNContactPhotoView contacts](self, "contacts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CNContactPhotoView)initWithFrame:(CGRect)a3 shouldAllowTakePhotoAction:(BOOL)a4 threeDTouchEnabled:(BOOL)a5 contactStore:(id)a6 allowsImageDrops:(BOOL)a7 imageRenderer:(id)a8
{
  return -[CNContactPhotoView initWithFrame:shouldAllowTakePhotoAction:threeDTouchEnabled:contactStore:allowsImageDrops:imageRenderer:allowStaleRendering:](self, "initWithFrame:shouldAllowTakePhotoAction:threeDTouchEnabled:contactStore:allowsImageDrops:imageRenderer:allowStaleRendering:", a4, a5, a6, a7, a8, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)resetPhoto
{
  -[CNContactPhotoView setPendingEditContact:](self, "setPendingEditContact:", 0);
  -[CNContactPhotoView setModified:](self, "setModified:", 0);
  -[CNContactPhotoView setCurrentLikeness:](self, "setCurrentLikeness:", 0);
  -[CNContactPhotoView setOriginalLikeness:](self, "setOriginalLikeness:", 0);
  -[CNContactPhotoView reloadData](self, "reloadData");
}

- (void)setPendingEditContact:(id)a3
{
  objc_storeStrong((id *)&self->_pendingEditContact, a3);
}

- (void)setOriginalLikeness:(id)a3
{
  objc_storeStrong((id *)&self->_originalLikeness, a3);
}

- (void)setModified:(BOOL)a3
{
  self->_modified = a3;
}

- (void)setCurrentLikeness:(id)a3
{
  objc_storeStrong((id *)&self->_currentLikeness, a3);
}

- (void)reloadData
{
  -[CNContactPhotoView updateViewsAndNotifyDelegate:](self, "updateViewsAndNotifyDelegate:", 1);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, a3);
}

- (void)setLongPressGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, a3);
}

+ (CGSize)defaultSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 60.0;
  v3 = 60.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CNContactPhotoView)initWithFrame:(CGRect)a3 shouldAllowTakePhotoAction:(BOOL)a4 threeDTouchEnabled:(BOOL)a5 contactStore:(id)a6 allowsImageDrops:(BOOL)a7 imageRenderer:(id)a8 allowStaleRendering:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL4 v11;
  _BOOL8 v12;
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  CNContactPhotoView *v21;
  double v22;
  double v23;
  CNAvatarView *v24;
  CNAvatarView *avatarView;
  uint64_t v26;
  UIButton *editPhotoButton;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  UIButton *v34;
  void *v35;
  void *v36;
  void *v37;
  CNAvatarView *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  CNAvatarView *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  UIDropInteraction *dropInteraction;
  _BOOL4 v62;
  BOOL v63;
  objc_super v64;
  _QWORD v65[2];
  _QWORD v66[3];
  CGRect v67;

  v9 = a9;
  v11 = a7;
  v12 = a5;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v66[2] = *MEMORY[0x1E0C80C00];
  v19 = a6;
  v20 = a8;
  v64.receiver = self;
  v64.super_class = (Class)CNContactPhotoView;
  v21 = -[CNContactPhotoView initWithFrame:](&v64, sel_initWithFrame_, x, y, width, height);
  if (v21)
  {
    v67.origin.x = x;
    v67.origin.y = y;
    v67.size.width = width;
    v67.size.height = height;
    v62 = v11;
    v63 = a4;
    if (CGRectIsEmpty(v67))
    {
      objc_msgSend((id)objc_opt_class(), "defaultSize");
      width = v22;
      height = v23;
      x = 0.0;
      y = 0.0;
    }
    v24 = -[CNAvatarView initWithImageRenderer:threeDTouchEnabled:contactStore:]([CNAvatarView alloc], "initWithImageRenderer:threeDTouchEnabled:contactStore:", v20, v12, v19);
    avatarView = v21->_avatarView;
    v21->_avatarView = v24;

    -[CNAvatarView setFrame:](v21->_avatarView, "setFrame:", x, y, width, height);
    -[CNAvatarView setAutoUpdateContact:](v21->_avatarView, "setAutoUpdateContact:", 0);
    -[CNAvatarView setAllowStaleRendering:](v21->_avatarView, "setAllowStaleRendering:", v9);
    -[CNAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v21->_avatarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNAvatarView setDelegate:](v21->_avatarView, "setDelegate:", v21);
    -[CNContactPhotoView addSubview:](v21, "addSubview:", v21->_avatarView);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v26 = objc_claimAutoreleasedReturnValue();
    editPhotoButton = v21->_editPhotoButton;
    v21->_editPhotoButton = (UIButton *)v26;

    +[CNUIColorRepository contactCardPhotoEditButtonColor](CNUIColorRepository, "contactCardPhotoEditButtonColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTintColor:](v21->_editPhotoButton, "setTintColor:", v28);

    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v21->_editPhotoButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton addTarget:action:forControlEvents:](v21->_editPhotoButton, "addTarget:action:forControlEvents:", v21, sel__presentPhotoPicker, 64);
    -[UIButton titleLabel](v21->_editPhotoButton, "titleLabel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTextAlignment:", 1);

    -[UIButton setContentVerticalAlignment:](v21->_editPhotoButton, "setContentVerticalAlignment:", 0);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "fontWithSize:", 12.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton titleLabel](v21->_editPhotoButton, "titleLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setFont:", v31);

    -[UIButton titleLabel](v21->_editPhotoButton, "titleLabel");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setNumberOfLines:", 3);

    v34 = v21->_editPhotoButton;
    CNContactsUIBundle();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("PHOTO_EDIT_LABEL"), &stru_1E20507A8, CFSTR("Localized"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v34, "setTitle:forState:", v36, 0);

    -[UIButton setHidden:](v21->_editPhotoButton, "setHidden:", 1);
    -[CNContactPhotoView addSubview:](v21, "addSubview:", v21->_editPhotoButton);
    v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v21, sel_avatarTapped_);
    -[CNContactPhotoView setTapGestureRecognizer:](v21, "setTapGestureRecognizer:", v37);

    v38 = v21->_avatarView;
    -[CNContactPhotoView tapGestureRecognizer](v21, "tapGestureRecognizer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNAvatarView addGestureRecognizer:](v38, "addGestureRecognizer:", v39);

    v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v21, sel_longPressGesture_);
    -[CNContactPhotoView addGestureRecognizer:](v21, "addGestureRecognizer:", v40);
    -[CNContactPhotoView setLongPressGestureRecognizer:](v21, "setLongPressGestureRecognizer:", v40);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addObserver:selector:name:object:", v21, sel_menuWillHide_, *MEMORY[0x1E0DC5048], 0);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = CFSTR("avatar");
    v43 = v21->_avatarView;
    v65[1] = CFSTR("editButton");
    v66[0] = v43;
    v66[1] = v21->_editPhotoButton;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21->_avatarView, 9, 0, v21, 9, 1.0, 0.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObject:", v45);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[avatar]|"), 0, 0, v44);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObjectsFromArray:", v46);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:[avatar]|"), 0, 0, v44);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObjectsFromArray:", v47);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[avatar]"), 0, 0, v44);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObjectsFromArray:", v48);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v21->_avatarView, 8, 0, v21->_avatarView, 7, 1.0, 0.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObject:", v49);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[editButton]|"), 0, 0, v44);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObjectsFromArray:", v50);

    -[CNContactPhotoView editPhotoButton](v21, "editPhotoButton");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPhotoView bottomAnchor](v21, "bottomAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObject:", v54);

    -[CNContactPhotoView editPhotoButton](v21, "editPhotoButton");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "heightAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactPhotoView heightAnchor](v21, "heightAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintGreaterThanOrEqualToAnchor:multiplier:", v57, 0.35);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "addObject:", v58);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v42);
    -[CNContactPhotoView resetPhoto](v21, "resetPhoto");
    -[CNContactPhotoView updateFontSizes](v21, "updateFontSizes");
    if (v62)
    {
      v59 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3780]), "initWithDelegate:", v21);
      dropInteraction = v21->_dropInteraction;
      v21->_dropInteraction = (UIDropInteraction *)v59;

      -[CNContactPhotoView addInteraction:](v21, "addInteraction:", v21->_dropInteraction);
    }
    v21->_shouldAllowTakePhotoAction = v63;

  }
  return v21;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_storeWeak((id *)&self->_delegate, 0);
  objc_storeWeak((id *)&self->_presenterDelegate, 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNContactPhotoView;
  -[CNContactPhotoView dealloc](&v4, sel_dealloc);
}

- (void)setLabelAlpha:(double)a3
{
  void *v5;
  char v6;
  id v7;

  if (self->_labelAlpha != a3)
  {
    self->_labelAlpha = a3;
    -[CNContactPhotoView editPhotoButton](self, "editPhotoButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isHidden");

    if ((v6 & 1) == 0)
    {
      -[CNContactPhotoView editPhotoButton](self, "editPhotoButton");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAlpha:", a3);

    }
  }
}

- (BOOL)isMeContact
{
  return 0;
}

- (CNMutableContact)mutableContact
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[CNContactPhotoView contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[CNContactPhotoView contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (CNMutableContact *)v5;
}

- (CNMutableContact)pendingEditContact
{
  CNMutableContact *v3;
  CNMutableContact *pendingEditContact;

  if (-[CNContactPhotoView isEditing](self, "isEditing") && !self->_pendingEditContact)
  {
    v3 = -[CNContactPhotoView newPendingContactPreservingChangesFrom:](self, "newPendingContactPreservingChangesFrom:", 0);
    pendingEditContact = self->_pendingEditContact;
    self->_pendingEditContact = v3;

  }
  return self->_pendingEditContact;
}

- (id)newPendingContactPreservingChangesFrom:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNContactPhotoView mutableContact](self, "mutableContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (v4)
    -[CNContactPhotoView saveChangesFromPendingContact:toContact:](self, "saveChangesFromPendingContact:toContact:", v4, v6);

  return v6;
}

- (id)currentImageData
{
  CNMutableContact *pendingEditContact;
  CNMutableContact *v3;
  CNMutableContact *v4;
  void *v5;

  pendingEditContact = self->_pendingEditContact;
  if (pendingEditContact)
  {
    v3 = pendingEditContact;
  }
  else
  {
    -[CNContactPhotoView contact](self, "contact");
    v3 = (CNMutableContact *)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  -[CNMutableContact imageData](v3, "imageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)saveChangesFromPendingContact:(id)a3 toContact:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[CNContactPhotoView mutableContact](self, "mutableContact");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[CNContactPhotoView mutableContact](self, "mutableContact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isKeyAvailable:", *MEMORY[0x1E0C96708]) & 1) == 0)
    {

LABEL_9:
      goto LABEL_10;
    }
    -[CNContactPhotoView mutableContact](self, "mutableContact");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isKeyAvailable:", *MEMORY[0x1E0C96688]);

    if (v6 && v12)
    {
      objc_msgSend(v6, "imageData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setImageData:", v13);

      objc_msgSend(v6, "imageType");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setImageType:", v14);

      objc_msgSend(v6, "imageHash");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setImageHash:", v15);

      objc_msgSend(v6, "fullscreenImageData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFullscreenImageData:", v16);

      objc_msgSend(v6, "thumbnailImageData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setThumbnailImageData:", v17);

      objc_msgSend(v6, "cropRect");
      objc_msgSend(v7, "setCropRect:");
      objc_msgSend(v6, "preferredLikenessSource");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPreferredLikenessSource:", v18);

      CNUILogContactCard();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "imageData");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v36, "length");
        objc_msgSend(v7, "fullscreenImageData");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "length");
        objc_msgSend(v7, "thumbnailImageData");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "length");
        objc_msgSend(v7, "cropRect");
        v25 = v24;
        objc_msgSend(v7, "cropRect");
        v27 = v26;
        objc_msgSend(v7, "cropRect");
        v29 = v28;
        objc_msgSend(v7, "cropRect");
        v31 = v30;
        objc_msgSend(v7, "imageType");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "imageHash");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "_cn_hexString");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134220034;
        v38 = v35;
        v39 = 2048;
        v40 = v21;
        v41 = 2048;
        v42 = v23;
        v43 = 2048;
        v44 = v25;
        v45 = 2048;
        v46 = v27;
        v47 = 2048;
        v48 = v29;
        v49 = 2048;
        v50 = v31;
        v51 = 2114;
        v52 = v32;
        v53 = 2114;
        v54 = v34;
        _os_log_impl(&dword_18AC56000, v19, OS_LOG_TYPE_DEFAULT, "[Likeness Update] Saving contact image - bytes: imageData %ld, fullscreen %ld, thumbnail %ld, cropRect {%.2f, %.2f, %.2f, %.2f}, imageType %{public}@ imageHash %{public}@", buf, 0x5Cu);

      }
      objc_msgSend(v6, "memojiMetadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMemojiMetadata:", v9);
      goto LABEL_9;
    }
  }
LABEL_10:

}

- (void)saveEdits
{
  void *v3;
  id v4;

  -[CNContactPhotoView pendingEditContact](self, "pendingEditContact");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactPhotoView mutableContact](self, "mutableContact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPhotoView saveChangesFromPendingContact:toContact:](self, "saveChangesFromPendingContact:toContact:", v4, v3);

}

- (BOOL)hasPhoto
{
  CNMutableContact *pendingEditContact;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  pendingEditContact = self->_pendingEditContact;
  if (!pendingEditContact)
  {
    -[CNContactPhotoView contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "thumbnailImageData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v6 = 1;
    }
    else
    {
      -[CNContactPhotoView contact](self, "contact");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isKeyAvailable:", *MEMORY[0x1E0C96708]))
      {
        -[CNContactPhotoView contact](self, "contact");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "imageData");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v10 != 0;

      }
      else
      {
        v6 = 0;
      }

      v7 = 0;
    }
    goto LABEL_13;
  }
  -[CNMutableContact thumbnailImageData](pendingEditContact, "thumbnailImageData");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (!-[CNMutableContact isKeyAvailable:](self->_pendingEditContact, "isKeyAvailable:", *MEMORY[0x1E0C96708]))
    {
      v5 = 0;
      v6 = 0;
      goto LABEL_14;
    }
    -[CNMutableContact imageData](self->_pendingEditContact, "imageData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    v6 = v7 != 0;
LABEL_13:

    goto LABEL_14;
  }
  v5 = (void *)v4;
  v6 = 1;
LABEL_14:

  return v6;
}

- (void)setEditing:(BOOL)a3
{
  -[CNContactPhotoView setEditing:preservingChanges:](self, "setEditing:preservingChanges:", a3, 0);
}

- (void)setEditing:(BOOL)a3 preservingChanges:(BOOL)a4
{
  if (self->_editing != a3)
  {
    self->_editing = a3;
    if (a4)
      -[CNContactPhotoView reloadData](self, "reloadData");
    else
      -[CNContactPhotoView resetPhoto](self, "resetPhoto");
  }
}

- (void)setHighlightedFrame:(BOOL)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CGFloat v10;
  void *v11;
  void *v12;
  id v13;
  CGRect v14;

  if (a3)
  {
    -[CNContactPhotoView tintColor](self, "tintColor");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v5 = objc_msgSend(v4, "CGColor");
    -[CNContactPhotoView avatarView](self, "avatarView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBorderColor:", v5);

    -[CNContactPhotoView avatarView](self, "avatarView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBorderWidth:", 1.0);

    -[CNContactPhotoView avatarView](self, "avatarView");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "frame");
    v10 = CGRectGetWidth(v14) * 0.5;
    -[CNContactPhotoView avatarView](self, "avatarView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCornerRadius:", v10);

  }
  else
  {
    -[CNContactPhotoView avatarView](self, "avatarView");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBorderWidth:", 0.0);
  }

}

- (void)disablePhotoTapGesture
{
  id v2;

  -[CNContactPhotoView tapGestureRecognizer](self, "tapGestureRecognizer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEnabled:", 0);

}

- (void)avatarTapped:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[CNContactPhotoView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[CNContactPhotoView delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didTapPhotoViewWhileEditing:", -[CNContactPhotoView isEditing](self, "isEditing"));
  }
  else
  {
    if (-[CNContactPhotoView isEditing](self, "isEditing"))
    {
      -[CNContactPhotoView _presentPhotoPicker](self, "_presentPhotoPicker");
      return;
    }
    objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hideMenu");
  }

}

- (void)longPressGesture:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "state") == 1)
  {
    if (-[CNContactPhotoView becomeFirstResponder](self, "becomeFirstResponder"))
    {
      objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[CNContactPhotoView bounds](self, "bounds");
      objc_msgSend(v4, "showMenuFromView:rect:", self);
      -[CNContactPhotoView setHighlightedFrame:](self, "setHighlightedFrame:", 1);

    }
  }
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a4;
  if (sel_copy_ == a3)
  {
    v9 = -[CNContactPhotoView hasPhoto](self, "hasPhoto");
  }
  else if (sel_paste_ == a3 && -[CNContactPhotoView isEditing](self, "isEditing"))
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "supportedPasteboardTypes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsPasteboardTypes:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)canBecomeFirstResponder
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;

  if (-[CNContactPhotoView hasPhoto](self, "hasPhoto"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v3 = -[CNContactPhotoView isEditing](self, "isEditing");
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "supportedPasteboardTypes");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "containsPasteboardTypes:", v5);

      LOBYTE(v3) = v6;
    }
  }
  return v3;
}

- (void)menuWillHide:(id)a3
{
  if (-[CNContactPhotoView isFirstResponder](self, "isFirstResponder", a3))
    -[CNContactPhotoView setHighlightedFrame:](self, "setHighlightedFrame:", 0);
}

- (void)copy:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[CNContactPhotoView currentImageData](self, "currentImageData", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    getkUTTypeJPEG();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v5;
    v9 = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setItems:", v7);

  }
}

- (void)paste:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend((id)objc_opt_class(), "supportedPasteboardTypes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v22 != v8)
        objc_enumerationMutation(v5);
      v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v9);
      objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dataForPasteboardType:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CNContactPhotoView.m"), 515, CFSTR("We are supposed to have an image in the pasteboard when we get here."));
    v12 = 0;
  }

  v13 = *MEMORY[0x1E0C9D648];
  v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  -[CNContactPhotoView pendingEditContact](self, "pendingEditContact");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setCropRect:", v13, v14, v15, v16);

  -[CNContactPhotoView pendingEditContact](self, "pendingEditContact");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setThumbnailImageData:", 0);

  -[CNContactPhotoView pendingEditContact](self, "pendingEditContact");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFullscreenImageData:", 0);

  -[CNContactPhotoView pendingEditContact](self, "pendingEditContact");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setImageData:", v12);

  -[CNContactPhotoView setModified:](self, "setModified:", 1);
  -[CNContactPhotoView reloadData](self, "reloadData");

}

- (void)updatePhoto
{
  void *v3;
  id v4;

  if (-[CNContactPhotoView isEditing](self, "isEditing") && self->_pendingEditContact)
  {
    -[CNContactPhotoView pendingEditContact](self, "pendingEditContact");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[CNContactPhotoView newPendingContactPreservingChangesFrom:](self, "newPendingContactPreservingChangesFrom:", v3);
    -[CNContactPhotoView setPendingEditContact:](self, "setPendingEditContact:", v4);

  }
  -[CNContactPhotoView reloadData](self, "reloadData");
}

- (void)updatePendingContactWithEditedPropertyItem:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "property");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C966D0]))
  {

  }
  else
  {
    objc_msgSend(v16, "property");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C966C0]);

    if (!v6)
      goto LABEL_8;
  }
  v7 = (void *)MEMORY[0x1E0C97218];
  -[CNContactPhotoView pendingEditContact](self, "pendingEditContact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "abbreviatedStringFromContact:trimmingWhitespace:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "editingStringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPhotoView pendingEditContact](self, "pendingEditContact");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "property");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v10, v12);

  v13 = (void *)MEMORY[0x1E0C97218];
  -[CNContactPhotoView pendingEditContact](self, "pendingEditContact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringFromContact:style:", v14, 1002);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[CNContactPhotoView hasPhoto](self, "hasPhoto") && (objc_msgSend(v15, "isEqualToString:", v9) & 1) == 0)
    -[CNContactPhotoView updateViewsAndNotifyDelegate:](self, "updateViewsAndNotifyDelegate:", 0);

LABEL_8:
}

- (BOOL)_isUsingCuratedPhoto
{
  void *v3;
  void *v4;
  char v5;

  if (self->_pendingEditContact)
    -[CNContactPhotoView pendingEditContact](self, "pendingEditContact");
  else
    -[CNContactPhotoView contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredLikenessSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactPhotoView hasPhoto](self, "hasPhoto"))
  {
    if (v4)
      v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C96760]);
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_isUsingSilhouette
{
  void *v3;
  char v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (self->_pendingEditContact)
    -[CNContactPhotoView pendingEditContact](self, "pendingEditContact");
  else
    -[CNContactPhotoView contact](self, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CNContactPhotoView hasPhoto](self, "hasPhoto"))
  {
    v4 = 0;
  }
  else
  {
    v5 = *MEMORY[0x1E0D13848];
    objc_msgSend(v3, "givenName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((*(unsigned int (**)(uint64_t, void *))(v5 + 16))(v5, v6))
    {
      objc_msgSend(v3, "familyName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (*(uint64_t (**)(uint64_t, void *))(v5 + 16))(v5, v7);

    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (void)_presentPhotoPicker
{
  -[CNContactPhotoView presentPhotoPickerWithImageData:](self, "presentPhotoPickerWithImageData:", 0);
}

- (void)presentPhotoPickerWithImageData:(id)a3
{
  CNPhotoPickerViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CNPhotoPickerViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = [CNPhotoPickerViewController alloc];
  -[CNContactPhotoView pendingEditContact](self, "pendingEditContact");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNContactStyle currentStyle](CNContactStyle, "currentStyle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPhotoPickerConfiguration contactsConfiguration](CNPhotoPickerConfiguration, "contactsConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationBySettingAllowsPhotoCapture:", -[CNContactPhotoView shouldAllowTakePhotoAction](self, "shouldAllowTakePhotoAction"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CNPhotoPickerViewController initWithContact:style:configuration:](v4, "initWithContact:style:configuration:", v5, v6, v8);

  -[CNPhotoPickerViewController setDelegate:](v9, "setDelegate:", self);
  -[CNVisualIdentityPickerViewController setPresenterDelegate:](v9, "setPresenterDelegate:", self);
  +[CNVisualIdentityPickerViewController defaultContentSize](CNPhotoPickerViewController, "defaultContentSize");
  -[CNPhotoPickerViewController setPreferredContentSize:](v9, "setPreferredContentSize:");
  if (v14)
    -[CNVisualIdentityPickerViewController setProposedImageData:](v9, "setProposedImageData:", v14);
  -[CNContactPhotoView setPhotoPicker:](self, "setPhotoPicker:", v9);
  -[CNContactPhotoView window](self, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endEditing:", 1);

  -[CNContactPhotoView photoPicker](self, "photoPicker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNPhotoPickerViewController navigationControllerForPicker:](CNPhotoPickerViewController, "navigationControllerForPicker:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactPhotoView presenterDelegate](self, "presenterDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sender:presentViewController:", self, v12);

}

- (void)sender:(id)a3 presentViewController:(id)a4
{
  id v6;
  CNContactPhotoView *v7;
  void *v8;
  CNContactPhotoView *v9;
  id v10;

  v6 = a4;
  v7 = (CNContactPhotoView *)a3;
  -[CNContactPhotoView presenterDelegate](self, "presenterDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  if (v7)
    v9 = v7;
  else
    v9 = self;
  objc_msgSend(v8, "sender:presentViewController:", v9, v6);

}

- (void)sender:(id)a3 dismissViewController:(id)a4
{
  -[CNContactPhotoView sender:dismissViewController:completionHandler:](self, "sender:dismissViewController:completionHandler:", a3, a4, 0);
}

- (void)sender:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[CNContactPhotoView presenterDelegate](self, "presenterDelegate");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sender:dismissViewController:completionHandler:", v10, v9, v8);

}

- (BOOL)isPresentingModalViewController
{
  void *v2;
  char v3;

  -[CNContactPhotoView presenterDelegate](self, "presenterDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPresentingModalViewController");

  return v3;
}

- (void)photoPickerDidCancel:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CNContactPhotoView presenterDelegate](self, "presenterDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sender:dismissViewController:", 0, v4);

  -[CNContactPhotoView setPhotoPicker:](self, "setPhotoPicker:", 0);
}

- (void)photoPicker:(id)a3 didUpdatePhotoForContact:(id)a4 withContactImage:(id)a5
{
  void *v7;
  id v8;

  v8 = a3;
  if (a4)
    -[CNContactPhotoView updatePendingContactWithEditedContact:](self, "updatePendingContactWithEditedContact:", a4);
  -[CNContactPhotoView presenterDelegate](self, "presenterDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sender:dismissViewController:", 0, v8);

  -[CNContactPhotoView setPhotoPicker:](self, "setPhotoPicker:", 0);
}

- (void)updatePendingContactWithEditedContact:(id)a3
{
  id v4;
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
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

  v4 = a3;
  objc_msgSend(v4, "wallpaper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPhotoView pendingEditContact](self, "pendingEditContact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWallpaper:", v5);

  objc_msgSend(v4, "watchWallpaperImageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPhotoView pendingEditContact](self, "pendingEditContact");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWatchWallpaperImageData:", v7);

  objc_msgSend(v4, "imageData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPhotoView pendingEditContact](self, "pendingEditContact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImageData:", v9);

  objc_msgSend(v4, "imageType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPhotoView pendingEditContact](self, "pendingEditContact");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setImageType:", v11);

  objc_msgSend(v4, "imageHash");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPhotoView pendingEditContact](self, "pendingEditContact");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setImageHash:", v13);

  objc_msgSend(v4, "cropRect");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[CNContactPhotoView pendingEditContact](self, "pendingEditContact");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCropRect:", v16, v18, v20, v22);

  objc_msgSend(v4, "thumbnailImageData");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPhotoView pendingEditContact](self, "pendingEditContact");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setThumbnailImageData:", v24);

  objc_msgSend(v4, "fullscreenImageData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPhotoView pendingEditContact](self, "pendingEditContact");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFullscreenImageData:", v26);

  objc_msgSend(v4, "preferredLikenessSource");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPhotoView pendingEditContact](self, "pendingEditContact");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setPreferredLikenessSource:", v28);

  objc_msgSend(v4, "memojiMetadata");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactPhotoView pendingEditContact](self, "pendingEditContact");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setMemojiMetadata:", v30);

  -[CNContactPhotoView pendingEditContact](self, "pendingEditContact");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setSharedPhotoDisplayPreference:", 2);

  -[CNContactPhotoView setModified:](self, "setModified:", 1);
  -[CNContactPhotoView reloadData](self, "reloadData");
}

- (void)visualIdentityPicker:(id)a3 presentationControllerWillDismiss:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[CNContactPhotoView presenterDelegate](self, "presenterDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[CNContactPhotoView presenterDelegate](self, "presenterDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewController:presentationControllerWillDismiss:", v10, v6);

  }
}

- (id)previewPath
{
  void *v2;
  void *v3;

  NSTemporaryDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("ABContactPhotoView_FullscreenPhoto.jpg"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_zoomContactPhoto
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  CGFloat v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  CGRect v22;

  -[CNContactPhotoView avatarView](self, "avatarView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageForTransitioningToFullScreen");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v18;
  if (!v18)
  {
    -[CNContactPhotoView contact](self, "contact");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isKeyAvailable:", *MEMORY[0x1E0C966C8]);

    if (!v10)
      goto LABEL_6;
    v11 = (void *)MEMORY[0x1E0DC3870];
    -[CNContactPhotoView contact](self, "contact");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fullscreenImageData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithData:", v13);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v20;
    if (!v20)
    {
LABEL_6:
      -[CNContactPhotoView contact](self, "contact");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isKeyAvailable:", *MEMORY[0x1E0C96708]);

      if (!v15)
        goto LABEL_9;
      -[CNContactPhotoView contact](self, "contact");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "imageData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17
        || (objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v17),
            v21 = (id)objc_claimAutoreleasedReturnValue(),
            v17,
            (v4 = v21) == 0))
      {
LABEL_9:
        v19 = 0;
        goto LABEL_10;
      }
    }
  }
  v19 = v4;
  objc_msgSend(v4, "size");
  v6 = v5;
  -[CNContactPhotoView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v8 = CGRectGetWidth(v22) * 0.75;

  if (v6 < v8)
  {
LABEL_10:
    -[CNContactPhotoView _bounceSmallPhoto](self, "_bounceSmallPhoto");
    goto LABEL_11;
  }
  -[CNContactPhotoView _presentFullScreenPhoto:](self, "_presentFullScreenPhoto:", v19);
LABEL_11:

}

- (void)_presentFullScreenPhoto:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;

  UIImageJPEGRepresentation((UIImage *)a3, 0.0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactPhotoView previewPath](self, "previewPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "writeToFile:atomically:", v4, 0);

  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)getQLPreviewControllerClass[0]()), "initWithNibName:bundle:", 0, 0);
    objc_msgSend(v6, "setDelegate:", self);
    objc_msgSend(v6, "setDataSource:", self);
    objc_msgSend(v6, "setModalPresentationStyle:", 0);
    -[CNContactPhotoView presenterDelegate](self, "presenterDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sender:presentViewController:", self, v6);

  }
}

- (void)_bounceSmallPhoto
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  _QWORD v17[9];
  _QWORD v18[9];
  CGRect v19;
  CGRect v20;

  if (!-[CNContactPhotoView isAnimatingBounce](self, "isAnimatingBounce"))
  {
    -[CNContactPhotoView avatarView](self, "avatarView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    -[CNContactPhotoView avatarView](self, "avatarView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    v20 = CGRectInset(v19, -5.0, -5.0);
    x = v20.origin.x;
    y = v20.origin.y;
    width = v20.size.width;
    height = v20.size.height;

    -[CNContactPhotoView setIsAnimatingBounce:](self, "setIsAnimatingBounce:", 1);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __39__CNContactPhotoView__bounceSmallPhoto__block_invoke;
    v18[3] = &unk_1E204D9C0;
    v18[4] = self;
    *(CGFloat *)&v18[5] = x;
    *(CGFloat *)&v18[6] = y;
    *(CGFloat *)&v18[7] = width;
    *(CGFloat *)&v18[8] = height;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __39__CNContactPhotoView__bounceSmallPhoto__block_invoke_2;
    v17[3] = &unk_1E2049360;
    v17[4] = self;
    v17[5] = v5;
    v17[6] = v7;
    v17[7] = v9;
    v17[8] = v11;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v18, v17, 0.15);
  }
}

- (id)presentingViewControllerForAvatarView:(id)a3
{
  void *v4;
  void *v5;

  -[CNContactPhotoView delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForPhotoView:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)willBeginPreviewInteractionForAvatarView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[CNContactPhotoView longPressGestureRecognizer](self, "longPressGestureRecognizer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);

  -[CNContactPhotoView longPressGestureRecognizer](self, "longPressGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 1);

  -[CNContactPhotoView window](self, "window");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endEditing:", 1);

}

- (id)previewController:(id)a3 transitionImageForPreviewItem:(id)a4 contentRect:(CGRect *)a5
{
  void *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CGSize v24;

  if (a5)
  {
    -[CNContactPhotoView avatarView](self, "avatarView", a3, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    a5->origin.x = v8;
    a5->origin.y = v9;
    a5->size.width = v10;
    a5->size.height = v11;

  }
  -[CNContactPhotoView avatarView](self, "avatarView", a3, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "backgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPhotoView avatarView](self, "avatarView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v14);

  -[CNContactPhotoView avatarView](self, "avatarView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v24.width = v17;
  v24.height = v18;
  UIGraphicsBeginImageContext(v24);

  -[CNContactPhotoView avatarView](self, "avatarView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "renderInContext:", UIGraphicsGetCurrentContext());

  UIGraphicsGetImageFromCurrentImageContext();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  -[CNContactPhotoView avatarView](self, "avatarView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBackgroundColor:", v13);

  return v21;
}

- (CGRect)previewController:(id)a3 frameForPreviewItem:(id)a4 inSourceView:(id *)a5
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  if (a5)
    *a5 = objc_retainAutorelease(self);
  -[CNContactPhotoView avatarView](self, "avatarView", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPhotoView avatarView](self, "avatarView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v6, "convertRect:toView:", self);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (void)previewControllerDidDismiss:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CNContactPhotoView previewPath](self, "previewPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeItemAtPath:error:", v4, 0);

}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  return 1;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  CNContactPhotoPreviewItem *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = objc_alloc_init(CNContactPhotoPreviewItem);
  v6 = (void *)MEMORY[0x1E0C97218];
  -[CNContactPhotoView contact](self, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromContact:style:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPhotoPreviewItem setPreviewItemTitle:](v5, "setPreviewItemTitle:", v8);

  v9 = (void *)MEMORY[0x1E0C99E98];
  v10 = (void *)MEMORY[0x1E0CB3940];
  -[CNContactPhotoView previewPath](self, "previewPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("file://%@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLWithString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactPhotoPreviewItem setPreviewItemURL:](v5, "setPreviewItemURL:", v13);

  return v5;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  void (__cdecl *v4)();
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  v4 = (void (__cdecl *)())getkUTTypePNG;
  v5 = a4;
  v4();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  getkUTTypeJPEG();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x1E0CA5BB0];
  v12[1] = v7;
  v12[2] = v8;
  v9 = *MEMORY[0x1E0CA5B90];
  v12[3] = *MEMORY[0x1E0CA5AE0];
  v12[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "hasItemsConformingToTypeIdentifiers:", v10);

  return (char)v4;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v5;
  void *v6;
  _BOOL4 v7;
  uint64_t v8;
  void *v9;

  v5 = a4;
  if (-[CNContactPhotoView acceptsImageDrop](self, "acceptsImageDrop"))
  {
    objc_msgSend(v5, "items");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count") == 1;

    v8 = 2 * v7;
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", v8);

  return v9;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[5];

  v5 = a4;
  objc_msgSend(v5, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    objc_msgSend(v5, "items");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *MEMORY[0x1E0CA5B90];
    objc_msgSend(v9, "itemProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __50__CNContactPhotoView_dropInteraction_performDrop___block_invoke;
    v13[3] = &unk_1E204EAA8;
    v13[4] = self;
    v12 = (id)objc_msgSend(v11, "loadDataRepresentationForTypeIdentifier:completionHandler:", v10, v13);

  }
}

- (double)labelAlpha
{
  return self->_labelAlpha;
}

- (BOOL)showEditingLabel
{
  return self->_showEditingLabel;
}

- (void)setShowEditingLabel:(BOOL)a3
{
  self->_showEditingLabel = a3;
}

- (BOOL)modified
{
  return self->_modified;
}

- (BOOL)shouldAllowTakePhotoAction
{
  return self->_shouldAllowTakePhotoAction;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (CNPresenterDelegate)presenterDelegate
{
  return (CNPresenterDelegate *)objc_loadWeakRetained((id *)&self->_presenterDelegate);
}

- (PRLikeness)originalLikeness
{
  return self->_originalLikeness;
}

- (PRLikeness)currentLikeness
{
  return self->_currentLikeness;
}

- (BOOL)prohibitsPersonaFetch
{
  return self->_prohibitsPersonaFetch;
}

- (void)setEditPhotoButton:(id)a3
{
  objc_storeStrong((id *)&self->_editPhotoButton, a3);
}

- (BOOL)isAnimatingBounce
{
  return self->_isAnimatingBounce;
}

- (void)setIsAnimatingBounce:(BOOL)a3
{
  self->_isAnimatingBounce = a3;
}

- (NSArray)variableConstraints
{
  return self->_variableConstraints;
}

- (void)setVariableConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_variableConstraints, a3);
}

- (UILongPressGestureRecognizer)longPressGestureRecognizer
{
  return self->_longPressGestureRecognizer;
}

- (void)setDropInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_dropInteraction, a3);
}

- (BOOL)acceptsImageDrop
{
  return self->_acceptsImageDrop;
}

- (CNPhotoPickerViewController)photoPicker
{
  return self->_photoPicker;
}

- (void)setPhotoPicker:(id)a3
{
  objc_storeStrong((id *)&self->_photoPicker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoPicker, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_storeStrong((id *)&self->_longPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_variableConstraints, 0);
  objc_storeStrong((id *)&self->_editPhotoButton, 0);
  objc_storeStrong((id *)&self->_currentLikeness, 0);
  objc_storeStrong((id *)&self->_originalLikeness, 0);
  objc_storeStrong((id *)&self->_pendingEditContact, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presenterDelegate);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
}

void __50__CNContactPhotoView_dropInteraction_performDrop___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD block[5];
  id v13;

  v5 = a2;
  v6 = v5;
  if (a3)
  {
    objc_msgSend(a3, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNContactPhotoView.m", 959, 3, CFSTR("Unable to copy data for avatar photo drop operation: %@"), v8, v9, v10, v11, (uint64_t)v7);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__CNContactPhotoView_dropInteraction_performDrop___block_invoke_2;
    block[3] = &unk_1E2050400;
    block[4] = *(_QWORD *)(a1 + 32);
    v13 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __50__CNContactPhotoView_dropInteraction_performDrop___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoView:didAcceptDropOfImageData:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __39__CNContactPhotoView__bounceSmallPhoto__block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "avatarView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);

}

uint64_t __39__CNContactPhotoView__bounceSmallPhoto__block_invoke_2(uint64_t a1)
{
  __int128 v1;
  _QWORD v3[5];
  _QWORD v4[4];
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__CNContactPhotoView__bounceSmallPhoto__block_invoke_3;
  v4[3] = &unk_1E204D9C0;
  v5 = *(_QWORD *)(a1 + 32);
  v1 = *(_OWORD *)(a1 + 56);
  v6 = *(_OWORD *)(a1 + 40);
  v7 = v1;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __39__CNContactPhotoView__bounceSmallPhoto__block_invoke_4;
  v3[3] = &unk_1E204F320;
  v3[4] = v5;
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v4, v3, 0.15);
}

void __39__CNContactPhotoView__bounceSmallPhoto__block_invoke_3(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "avatarView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);

}

uint64_t __39__CNContactPhotoView__bounceSmallPhoto__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsAnimatingBounce:", 0);
}

+ (id)descriptorForRequiredKeys
{
  return (id)objc_msgSend(a1, "descriptorForRequiredKeysWithThreeDTouchEnabled:", 1);
}

+ (id)supportedPasteboardTypes
{
  if (supportedPasteboardTypes_cn_once_token_5[0] != -1)
    dispatch_once(supportedPasteboardTypes_cn_once_token_5, &__block_literal_global_12196);
  return (id)supportedPasteboardTypes_cn_once_object_5;
}

void __46__CNContactPhotoView_supportedPasteboardTypes__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  getkUTTypePNG();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  getkUTTypeJPEG();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)supportedPasteboardTypes_cn_once_object_5;
  supportedPasteboardTypes_cn_once_object_5 = v2;

}

@end
