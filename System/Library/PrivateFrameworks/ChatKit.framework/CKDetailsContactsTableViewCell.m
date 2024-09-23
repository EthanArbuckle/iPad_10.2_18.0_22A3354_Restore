@implementation CKDetailsContactsTableViewCell

+ (Class)cellClass
{
  void *v2;
  id v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "isAccessibilityPreferredContentSizeCategory");
  v3 = (id)objc_opt_class();

  return (Class)v3;
}

+ (id)reuseIdentifier
{
  return CFSTR("CKDetailsContactsTableViewCell_reuseIdentifier");
}

+ (double)estimatedHeight
{
  return 0.0;
}

+ (double)preferredHeight
{
  return 0.0;
}

+ (double)marginWidth
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transcriptDrawerContactImageDiameter");
  v4 = v3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "detailsContactAvatarLabelSpacing");
  v7 = v4 + v6 * 2.0;

  return v7;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  CGSize result;

  v12.receiver = self;
  v12.super_class = (Class)CKDetailsContactsTableViewCell;
  -[CKDetailsContactsTableViewCell sizeThatFits:](&v12, sel_sizeThatFits_, a3.width, a3.height);
  v4 = v3;
  v6 = v5;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "detailsContactCellMinimumHeight");
  v9 = v8;

  if (v9 >= v6)
    v10 = v9;
  else
    v10 = v6;
  v11 = v4;
  result.height = v10;
  result.width = v11;
  return result;
}

- (CKDetailsContactsTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  CKDetailsContactsTableViewCell *v4;
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
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  CKLabel *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  CKLabel *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  CKAvatarView *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  objc_super v92;

  v92.receiver = self;
  v92.super_class = (Class)CKDetailsContactsTableViewCell;
  v4 = -[CKDetailsCell initWithStyle:reuseIdentifier:](&v92, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell setMessageButton:](v4, "setMessageButton:", v5);

    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell setPhoneButton:](v4, "setPhoneButton:", v6);

    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell setFacetimeVideoButton:](v4, "setFacetimeVideoButton:", v7);

    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell setScreenSharingButton:](v4, "setScreenSharingButton:", v8);

    -[CKDetailsContactsTableViewCell messageButton](v4, "messageButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContentMode:", 1);

    -[CKDetailsContactsTableViewCell phoneButton](v4, "phoneButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentMode:", 1);

    -[CKDetailsContactsTableViewCell facetimeVideoButton](v4, "facetimeVideoButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContentMode:", 1);

    -[CKDetailsContactsTableViewCell screenSharingButton](v4, "screenSharingButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setContentMode:", 1);

    -[CKDetailsContactsTableViewCell messageButton](v4, "messageButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setContentMode:", 4);

    -[CKDetailsContactsTableViewCell phoneButton](v4, "phoneButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setContentMode:", 4);

    -[CKDetailsContactsTableViewCell facetimeVideoButton](v4, "facetimeVideoButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setContentMode:", 4);

    -[CKDetailsContactsTableViewCell screenSharingButton](v4, "screenSharingButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setContentMode:", 4);

    -[CKDetailsContactsTableViewCell messageButton](v4, "messageButton");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setImageEdgeInsets:", -2.0, -1.0, -2.5, -2.0);

    -[CKDetailsContactsTableViewCell phoneButton](v4, "phoneButton");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setImageEdgeInsets:", -2.0, -1.0, -2.5, -2.0);

    -[CKDetailsContactsTableViewCell facetimeVideoButton](v4, "facetimeVideoButton");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setImageEdgeInsets:", -2.0, -2.0, -2.0, -2.0);

    -[CKDetailsContactsTableViewCell screenSharingButton](v4, "screenSharingButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setImageEdgeInsets:", -2.0, -2.0, -2.0, -2.0);

    -[CKDetailsContactsTableViewCell _imageNamed:](v4, "_imageNamed:", CFSTR("video.fill"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell _imageNamed:](v4, "_imageNamed:", CFSTR("phone.fill"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell _imageNamed:](v4, "_imageNamed:", CFSTR("message.fill"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell _imageNamed:](v4, "_imageNamed:", CFSTR("rectangle.fill.on.rectangle.fill"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell facetimeVideoButton](v4, "facetimeVideoButton");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setImage:forState:", v25, 0);

    -[CKDetailsContactsTableViewCell phoneButton](v4, "phoneButton");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setImage:forState:", v26, 0);

    -[CKDetailsContactsTableViewCell messageButton](v4, "messageButton");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setImage:forState:", v27, 0);

    -[CKDetailsContactsTableViewCell screenSharingButton](v4, "screenSharingButton");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setImage:forState:", v28, 0);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "theme");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "contactsActionButtonColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell facetimeVideoButton](v4, "facetimeVideoButton");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setTintColor:", v35);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "theme");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "contactsActionButtonColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell phoneButton](v4, "phoneButton");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setTintColor:", v39);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "theme");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "contactsActionButtonColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell messageButton](v4, "messageButton");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setTintColor:", v43);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "theme");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "contactsActionButtonColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell screenSharingButton](v4, "screenSharingButton");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setTintColor:", v47);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "theme");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "contactsActionButtonBackgroundColor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell facetimeVideoButton](v4, "facetimeVideoButton");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setBackgroundColor:", v51);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "theme");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "contactsActionButtonBackgroundColor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell phoneButton](v4, "phoneButton");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setBackgroundColor:", v55);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "theme");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "contactsActionButtonBackgroundColor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell messageButton](v4, "messageButton");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setBackgroundColor:", v59);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "theme");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "contactsActionButtonBackgroundColor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell screenSharingButton](v4, "screenSharingButton");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setBackgroundColor:", v63);

    -[CKDetailsContactsTableViewCell facetimeVideoButton](v4, "facetimeVideoButton");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setTitle:forState:", 0, 0);

    -[CKDetailsContactsTableViewCell phoneButton](v4, "phoneButton");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setTitle:forState:", 0, 0);

    -[CKDetailsContactsTableViewCell messageButton](v4, "messageButton");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setTitle:forState:", 0, 0);

    -[CKDetailsContactsTableViewCell screenSharingButton](v4, "screenSharingButton");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "setTitle:forState:", 0, 0);

    v69 = [CKLabel alloc];
    v70 = *MEMORY[0x1E0C9D648];
    v71 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v72 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v73 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v74 = -[CKLabel initWithFrame:](v69, "initWithFrame:", *MEMORY[0x1E0C9D648], v71, v72, v73);
    -[CKDetailsContactsTableViewCell setNameLabel:](v4, "setNameLabel:", v74);

    -[CKDetailsContactsTableViewCell nameLabel](v4, "nameLabel");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "recipientNameFont");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setFont:", v77);

    -[CKDetailsContactsTableViewCell nameLabel](v4, "nameLabel");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "theme");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v80, "contactCellTextColor");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "setTextColor:", v81);

    -[CKDetailsContactsTableViewCell nameLabel](v4, "nameLabel");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setNumberOfLines:", 0);

    -[CKDetailsContactsTableViewCell nameLabel](v4, "nameLabel");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "setContentMode:", 7);

    v84 = -[CKAvatarView initWithFrame:]([CKAvatarView alloc], "initWithFrame:", v70, v71, v72, v73);
    -[CKDetailsContactsTableViewCell setContactAvatarView:](v4, "setContactAvatarView:", v84);

    -[CKDetailsContactsTableViewCell contactAvatarView](v4, "contactAvatarView");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setShowsContactOnTap:", 0);

    -[CKDetailsContactsTableViewCell contentView](v4, "contentView");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "setBackgroundColor:", 0);

    if (CKIsRunningInMacCatalyst())
    {
      v87 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA628]), "initWithTarget:action:", v4, sel_didHoverOverCell_);
      -[CKDetailsContactsTableViewCell addGestureRecognizer:](v4, "addGestureRecognizer:", v87);
    }
    else
    {
      -[CKDetailsContactsTableViewCell setAccessoryType:](v4, "setAccessoryType:", 1);
      -[CKDetailsContactsTableViewCell _tableView](v4, "_tableView");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "theme");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "detailsContactCellChevronColor");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "_setAccessoryBaseColor:", v90);

    }
  }
  return v4;
}

- (id)_ckSymbolImageNamed:(id)a3 preferredContentSizeCategory:(id)a4 preferredFontTextStyle:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (void *)MEMORY[0x1E0CEAB40];
  v8 = a5;
  v9 = a3;
  objc_msgSend(v7, "traitCollectionWithPreferredContentSizeCategory:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:compatibleWithTraitCollection:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "pointSize");
  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_imageNamed:(id)a3
{
  id v4;
  int v5;
  uint64_t *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = CKIsRunningInMacCatalyst();
    v6 = (uint64_t *)MEMORY[0x1E0CEB420];
    if (v5)
      v6 = (uint64_t *)MEMORY[0x1E0CEB428];
    v7 = *v6;
    v8 = (_QWORD *)MEMORY[0x1E0CEB558];
    if (v5)
      v8 = (_QWORD *)MEMORY[0x1E0CEB590];
    -[CKDetailsContactsTableViewCell _ckSymbolImageNamed:preferredContentSizeCategory:preferredFontTextStyle:](self, "_ckSymbolImageNamed:preferredContentSizeCategory:preferredFontTextStyle:", v4, v7, *v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _QWORD v30[4];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v29.receiver = self;
  v29.super_class = (Class)CKDetailsContactsTableViewCell;
  -[CKDetailsCell layoutSubviews](&v29, sel_layoutSubviews);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detailsContactCellButtonEdgeInsets");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[CKDetailsContactsTableViewCell facetimeVideoButton](self, "facetimeVideoButton", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v12;
  -[CKDetailsContactsTableViewCell phoneButton](self, "phoneButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v13;
  -[CKDetailsContactsTableViewCell messageButton](self, "messageButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v14;
  -[CKDetailsContactsTableViewCell screenSharingButton](self, "screenSharingButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v21, "setContentEdgeInsets:", v5, v7, v9, v11);
        objc_msgSend(v21, "layer");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKDetailsContactsTableViewCell _configureButtonLayer:](self, "_configureButtonLayer:", v22);

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    }
    while (v18);
  }

  -[CKDetailsContactsTableViewCell contact](self, "contact");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    -[CKDetailsContactsTableViewCell contactAvatarView](self, "contactAvatarView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setContact:", v23);

  }
}

- (void)setShowsLocation:(BOOL)a3
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
  id v15;

  if (self->_showsLocation != a3)
  {
    self->_showsLocation = a3;
    if (a3)
    {
      v4 = objc_alloc(MEMORY[0x1E0CEA700]);
      v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[CKDetailsContactsTableViewCell setLocationLabel:](self, "setLocationLabel:", v5);

      -[CKDetailsContactsTableViewCell locationLabel](self, "locationLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "locationSubtitleFont");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFont:", v8);

      -[CKDetailsContactsTableViewCell locationLabel](self, "locationLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "theme");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "detailsContactCellSubTitleColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTextColor:", v12);

      -[CKDetailsContactsTableViewCell locationLabel](self, "locationLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setLineBreakMode:", 5);

    }
    else
    {
      -[CKDetailsContactsTableViewCell locationLabel](self, "locationLabel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeFromSuperview");

      -[CKDetailsContactsTableViewCell setLocationLabel:](self, "setLocationLabel:", 0);
    }
    -[CKDetailsContactsTableViewCell contentView](self, "contentView");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setNeedsLayout");

  }
}

- (void)setShowsTUConversationStatus:(BOOL)a3
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
  id v14;

  if (self->_showsTUConversationStatus != a3)
  {
    self->_showsTUConversationStatus = a3;
    if (a3)
    {
      v4 = objc_alloc(MEMORY[0x1E0CEA700]);
      v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[CKDetailsContactsTableViewCell setExpanseStatusLabel:](self, "setExpanseStatusLabel:", v5);

      -[CKDetailsContactsTableViewCell expanseStatusLabel](self, "expanseStatusLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "locationSubtitleFont");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFont:", v8);

      -[CKDetailsContactsTableViewCell expanseStatusLabel](self, "expanseStatusLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "theme");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "detailsContactCellSubTitleColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTextColor:", v12);

      -[CKDetailsContactsTableViewCell _formatExpanseStatusLabel](self, "_formatExpanseStatusLabel");
    }
    else
    {
      -[CKDetailsContactsTableViewCell expanseStatusLabel](self, "expanseStatusLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeFromSuperview");

      -[CKDetailsContactsTableViewCell setExpanseStatusLabel:](self, "setExpanseStatusLabel:", 0);
    }
    -[CKDetailsContactsTableViewCell contentView](self, "contentView");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNeedsLayout");

  }
}

- (void)setShowInfoButton:(BOOL)a3
{
  if (self->_showInfoButton != a3)
  {
    self->_showInfoButton = a3;
    -[CKDetailsContactsTableViewCell _updateVisibleButtons](self, "_updateVisibleButtons");
  }
}

- (void)setShowMessageButton:(BOOL)a3
{
  if (self->_showMessageButton != a3)
  {
    self->_showMessageButton = a3;
    -[CKDetailsContactsTableViewCell _updateVisibleButtons](self, "_updateVisibleButtons");
  }
}

- (void)setShowPhoneButton:(BOOL)a3
{
  if (self->_showPhoneButton != a3)
  {
    self->_showPhoneButton = a3;
    -[CKDetailsContactsTableViewCell _updateVisibleButtons](self, "_updateVisibleButtons");
  }
}

- (void)setShowFaceTimeVideoButton:(BOOL)a3
{
  if (self->_showFaceTimeVideoButton != a3)
  {
    self->_showFaceTimeVideoButton = a3;
    -[CKDetailsContactsTableViewCell _updateVisibleButtons](self, "_updateVisibleButtons");
  }
}

- (void)setShowScreenSharingButton:(BOOL)a3
{
  if (self->_showScreenSharingButton != a3)
  {
    self->_showScreenSharingButton = a3;
    -[CKDetailsContactsTableViewCell _updateVisibleButtons](self, "_updateVisibleButtons");
  }
}

- (void)setLocationString:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[NSString isEqualToString:](self->_locationString, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_locationString, a3);
    -[CKDetailsContactsTableViewCell locationString](self, "locationString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell locationLabel](self, "locationLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);

    -[CKDetailsContactsTableViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)configureWithViewModel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsContactsTableViewCell setEntityName:](self, "setEntityName:", v4);

  LODWORD(v4) = objc_msgSend(v16, "verified");
  -[CKDetailsContactsTableViewCell nameLabel](self, "nameLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleIconImageType:", v4);

  objc_msgSend(v16, "locationString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsContactsTableViewCell setLocationString:](self, "setLocationString:", v6);

  -[CKDetailsContactsTableViewCell setShowsLocation:](self, "setShowsLocation:", objc_msgSend(v16, "showsLocation"));
  -[CKDetailsContactsTableViewCell setTuConversationStatusIsActive:](self, "setTuConversationStatusIsActive:", objc_msgSend(v16, "tuConversationStatusIsActive"));
  -[CKDetailsContactsTableViewCell setCallType:](self, "setCallType:", objc_msgSend(v16, "callType"));
  -[CKDetailsContactsTableViewCell setShowsTUConversationStatus:](self, "setShowsTUConversationStatus:", objc_msgSend(v16, "showsTUConversationStatus"));
  objc_msgSend(v16, "contact");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsContactsTableViewCell setContact:](self, "setContact:", v7);

  objc_msgSend(v16, "preferredHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsContactsTableViewCell contactAvatarView](self, "contactAvatarView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPreferredHandle:", v8);

  if (CKIsRunningInMacCatalyst())
  {
    -[CKDetailsContactsTableViewCell setShowFaceTimeVideoButton:](self, "setShowFaceTimeVideoButton:", objc_msgSend(v16, "showsFaceTimeVideoButton"));
    -[CKDetailsContactsTableViewCell setShowMessageButton:](self, "setShowMessageButton:", objc_msgSend(v16, "showsMessageButton"));
    -[CKDetailsContactsTableViewCell setShowPhoneButton:](self, "setShowPhoneButton:", objc_msgSend(v16, "showsPhoneButton"));
    v10 = objc_msgSend(v16, "showsScreenSharingButton");
  }
  else
  {
    -[CKDetailsContactsTableViewCell setShowFaceTimeVideoButton:](self, "setShowFaceTimeVideoButton:", 0);
    -[CKDetailsContactsTableViewCell setShowMessageButton:](self, "setShowMessageButton:", 0);
    -[CKDetailsContactsTableViewCell setShowPhoneButton:](self, "setShowPhoneButton:", 0);
    v10 = 0;
  }
  -[CKDetailsContactsTableViewCell setShowScreenSharingButton:](self, "setShowScreenSharingButton:", v10);
  -[CKDetailsContactsTableViewCell messageButton](self, "messageButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__handleCommunicationAction_, 64);

  -[CKDetailsContactsTableViewCell facetimeVideoButton](self, "facetimeVideoButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, sel__handleCommunicationAction_, 64);

  -[CKDetailsContactsTableViewCell phoneButton](self, "phoneButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel__handleCommunicationAction_, 64);

  if (objc_msgSend(v16, "isPendingRecipient"))
    -[CKDetailsContactsTableViewCell _showUpdatingParticipantSpinner](self, "_showUpdatingParticipantSpinner");
  else
    -[CKDetailsContactsTableViewCell _dismissUpdatingParticipantSpinner](self, "_dismissUpdatingParticipantSpinner");
  -[CKDetailsContactsTableViewCell setShowsLocation:](self, "setShowsLocation:", objc_msgSend(v16, "showsLocation"));
  -[CKDetailsContactsTableViewCell locationString](self, "locationString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKDetailsContactsTableViewCell locationLabel](self, "locationLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setText:", v14);

  -[CKDetailsContactsTableViewCell setShowsTUConversationStatus:](self, "setShowsTUConversationStatus:", objc_msgSend(v16, "showsTUConversationStatus"));
  -[CKDetailsContactsTableViewCell setTuConversationStatusIsActive:](self, "setTuConversationStatusIsActive:", objc_msgSend(v16, "tuConversationStatusIsActive"));
  -[CKDetailsContactsTableViewCell setCallType:](self, "setCallType:", objc_msgSend(v16, "callType"));
  -[CKDetailsContactsTableViewCell _formatExpanseStatusLabel](self, "_formatExpanseStatusLabel");
  if (CKIsRunningInMacCatalyst())
    -[CKDetailsContactsTableViewCell _hideAllButtons](self, "_hideAllButtons");

}

- (void)_formatExpanseStatusLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  if (-[CKDetailsContactsTableViewCell tuConversationStatusIsActive](self, "tuConversationStatusIsActive"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
    v4 = (void *)MEMORY[0x1E0CEA650];
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "locationSubtitleFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configurationWithFont:scale:", v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[CKDetailsContactsTableViewCell callType](self, "callType");
    if ((unint64_t)(v8 - 1) > 2)
      v9 = &stru_1E276D870;
    else
      v9 = off_1E2758048[v8 - 1];
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", v9, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageWithRenderingMode:", 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setImage:", v12);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", &stru_1E276D870);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appendAttributedString:", v13);

    v14 = objc_alloc(MEMORY[0x1E0CB3498]);
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("ACTIVE_FACETIME"), &stru_1E276D870, CFSTR("ChatKit"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithString:", v16);
    objc_msgSend(v10, "appendAttributedString:", v17);

    -[CKDetailsContactsTableViewCell expanseStatusLabel](self, "expanseStatusLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAttributedText:", v10);

  }
  else
  {
    CKFrameworkBundle();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("INVITED_FACETIME"), &stru_1E276D870, CFSTR("ChatKit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKDetailsContactsTableViewCell expanseStatusLabel](self, "expanseStatusLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v7);
  }

  -[CKDetailsContactsTableViewCell expanseStatusLabel](self, "expanseStatusLabel");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLineBreakMode:", 4);

}

- (void)_showUpdatingParticipantSpinner
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "showUpdatingParticipantSpinner", v6, 2u);
    }

  }
  -[CKDetailsContactsTableViewCell updatingParticipantSpinner](self, "updatingParticipantSpinner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA2C8]), "initWithActivityIndicatorStyle:", 100);
    -[CKDetailsContactsTableViewCell setUpdatingParticipantSpinner:](self, "setUpdatingParticipantSpinner:", v4);
    -[CKDetailsContactsTableViewCell contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v4);

  }
}

- (void)_dismissUpdatingParticipantSpinner
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "dismissUpdatingParticipantSpinner", v7, 2u);
    }

  }
  -[CKDetailsContactsTableViewCell updatingParticipantSpinner](self, "updatingParticipantSpinner");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKDetailsContactsTableViewCell updatingParticipantSpinner](self, "updatingParticipantSpinner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopAnimating");

    -[CKDetailsContactsTableViewCell updatingParticipantSpinner](self, "updatingParticipantSpinner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    -[CKDetailsContactsTableViewCell setUpdatingParticipantSpinner:](self, "setUpdatingParticipantSpinner:", 0);
  }
}

- (void)_handleCommunicationAction:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[CKDetailsContactsTableViewCell messageButton](self, "messageButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v9)
  {
    -[CKDetailsContactsTableViewCell delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contactsCellDidTapMessagesButton:", self);
    goto LABEL_7;
  }
  -[CKDetailsContactsTableViewCell facetimeVideoButton](self, "facetimeVideoButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v9)
  {
    -[CKDetailsContactsTableViewCell delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contactsCellDidTapFaceTimeVideoButton:", self);
    goto LABEL_7;
  }
  -[CKDetailsContactsTableViewCell phoneButton](self, "phoneButton");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6 == v9)
  {
    -[CKDetailsContactsTableViewCell delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contactsCellDidTapPhoneButton:", self);
LABEL_7:

    v7 = v9;
  }

}

- (void)_configureButtonLayer:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  id v7;

  v3 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "detailsContactCellButtonWidth");
  v5 = v4;
  if (CKMainScreenScale_once_77 != -1)
    dispatch_once(&CKMainScreenScale_once_77, &__block_literal_global_192);
  v6 = *(double *)&CKMainScreenScale_sMainScreenScale_77;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_77 == 0.0)
    v6 = 1.0;
  objc_msgSend(v3, "setCornerRadius:", round(v5 * 0.5 * v6) / v6);

}

- (void)didHoverOverCell:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = a3;
  -[CKDetailsContactsTableViewCell delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "state");

  objc_msgSend(v6, "contactsCell:didHoverWithState:", self, v5);
}

- (CKAvatarView)contactAvatarView
{
  return self->_contactAvatarView;
}

- (void)setContactAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_contactAvatarView, a3);
}

- (CKDetailsContactsTableViewCellDelegate)delegate
{
  return (CKDetailsContactsTableViewCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CKLabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UILabel)locationLabel
{
  return self->_locationLabel;
}

- (void)setLocationLabel:(id)a3
{
  objc_storeStrong((id *)&self->_locationLabel, a3);
}

- (UILabel)expanseStatusLabel
{
  return self->_expanseStatusLabel;
}

- (void)setExpanseStatusLabel:(id)a3
{
  objc_storeStrong((id *)&self->_expanseStatusLabel, a3);
}

- (NSString)entityName
{
  return self->_entityName;
}

- (void)setEntityName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

- (NSString)locationString
{
  return self->_locationString;
}

- (BOOL)tuConversationStatusIsActive
{
  return self->_tuConversationStatusIsActive;
}

- (void)setTuConversationStatusIsActive:(BOOL)a3
{
  self->_tuConversationStatusIsActive = a3;
}

- (int64_t)callType
{
  return self->_callType;
}

- (void)setCallType:(int64_t)a3
{
  self->_callType = a3;
}

- (BOOL)showsLocation
{
  return self->_showsLocation;
}

- (BOOL)showMessageButton
{
  return self->_showMessageButton;
}

- (BOOL)showPhoneButton
{
  return self->_showPhoneButton;
}

- (BOOL)showFaceTimeVideoButton
{
  return self->_showFaceTimeVideoButton;
}

- (BOOL)showInfoButton
{
  return self->_showInfoButton;
}

- (BOOL)showScreenSharingButton
{
  return self->_showScreenSharingButton;
}

- (BOOL)showsTUConversationStatus
{
  return self->_showsTUConversationStatus;
}

- (UIButton)messageButton
{
  return self->_messageButton;
}

- (void)setMessageButton:(id)a3
{
  objc_storeStrong((id *)&self->_messageButton, a3);
}

- (UIButton)phoneButton
{
  return self->_phoneButton;
}

- (void)setPhoneButton:(id)a3
{
  objc_storeStrong((id *)&self->_phoneButton, a3);
}

- (UIButton)facetimeVideoButton
{
  return self->_facetimeVideoButton;
}

- (void)setFacetimeVideoButton:(id)a3
{
  objc_storeStrong((id *)&self->_facetimeVideoButton, a3);
}

- (UIButton)screenSharingButton
{
  return self->_screenSharingButton;
}

- (void)setScreenSharingButton:(id)a3
{
  objc_storeStrong((id *)&self->_screenSharingButton, a3);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (UIActivityIndicatorView)updatingParticipantSpinner
{
  return self->_updatingParticipantSpinner;
}

- (void)setUpdatingParticipantSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_updatingParticipantSpinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatingParticipantSpinner, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_screenSharingButton, 0);
  objc_storeStrong((id *)&self->_facetimeVideoButton, 0);
  objc_storeStrong((id *)&self->_phoneButton, 0);
  objc_storeStrong((id *)&self->_messageButton, 0);
  objc_storeStrong((id *)&self->_locationString, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_expanseStatusLabel, 0);
  objc_storeStrong((id *)&self->_locationLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contactAvatarView, 0);
}

@end
