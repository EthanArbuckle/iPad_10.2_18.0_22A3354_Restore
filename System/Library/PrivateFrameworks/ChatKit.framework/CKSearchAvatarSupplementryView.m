@implementation CKSearchAvatarSupplementryView

+ (id)supplementaryViewType
{
  return CFSTR("SearchAvatarSupplementryType");
}

+ (id)reuseIdentifier
{
  return CFSTR("SearchAvatarView");
}

+ (double)desiredZPosition
{
  return 0.0;
}

+ (double)desiredZPositionForMode:(unint64_t)a3
{
  BOOL v4;
  double result;

  if (CKIsRunningInMacCatalyst())
    v4 = a3 >= 3;
  else
    v4 = 0;
  result = 1.0;
  if (!v4)
    return 0.0;
  return result;
}

- (void)setContact:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[CKSearchAvatarSupplementryView contact](self, "contact");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_contact, a3);
    if (v5)
    {
      v10[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = (void *)MEMORY[0x1E0C9AA60];
    }
    -[CKSearchAvatarSupplementryView avatarView](self, "avatarView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContacts:", v8);

    -[CKSearchAvatarSupplementryView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setParentContentType:(unint64_t)a3
{
  if (self->_parentContentType != a3)
    self->_parentContentType = a3;
  -[CKSearchAvatarSupplementryView _updateVisibilityIfNeeded](self, "_updateVisibilityIfNeeded");
}

- (CKSearchAvatarSupplementryView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CKSearchAvatarSupplementryView *v7;
  CKAvatarView *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  id v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v22.receiver = self;
  v22.super_class = (Class)CKSearchAvatarSupplementryView;
  v7 = -[CKSearchAvatarSupplementryView initWithFrame:](&v22, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[CKAvatarView initWithFrame:]([CKAvatarView alloc], "initWithFrame:", x, y, width, height);
    -[CNAvatarView setAsynchronousRendering:](v8, "setAsynchronousRendering:", 1);
    -[CKAvatarView setUserInteractionEnabled:](v8, "setUserInteractionEnabled:", 0);
    -[CNAvatarView setShowsContactOnTap:](v8, "setShowsContactOnTap:", 0);
    -[CNAvatarView setBypassActionValidation:](v8, "setBypassActionValidation:", 1);
    -[CKSearchAvatarSupplementryView setAvatarView:](v7, "setAvatarView:", v8);
    -[CKSearchAvatarSupplementryView addSubview:](v7, "addSubview:", v8);
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSearchAvatarSupplementryView setBackgroundColor:](v7, "setBackgroundColor:", v9);

    -[CKSearchAvatarSupplementryView layer](v7, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "searchResultAvatarSize");
    objc_msgSend(v10, "setCornerRadius:", v12 * 0.5);

    -[CKSearchAvatarSupplementryView layer](v7, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v13, "setShadowColor:", objc_msgSend(v14, "CGColor"));

    -[CKSearchAvatarSupplementryView layer](v7, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = 1051931443;
    objc_msgSend(v15, "setShadowOpacity:", v16);

    -[CKSearchAvatarSupplementryView layer](v7, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (CKPixelWidth_once_10 != -1)
      dispatch_once(&CKPixelWidth_once_10, &__block_literal_global_143);
    objc_msgSend(v17, "setShadowOffset:", 0.0, *(double *)&CKPixelWidth_sPixel_10);

    -[CKSearchAvatarSupplementryView layer](v7, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (CKPixelWidth_once_10 != -1)
      dispatch_once(&CKPixelWidth_once_10, &__block_literal_global_143);
    objc_msgSend(v18, "setShadowRadius:", *(double *)&CKPixelWidth_sPixel_10 * 4.0);

    -[CKSearchAvatarSupplementryView layer](v7, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setShadowPathIsBounds:", 1);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v7, sel__parentPreviewDidChange_, CFSTR("CKSearchThumbnailDidChange"), 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v7, sel__parentPreviewDidChange_, CFSTR("CKSearchLPLinkMetadataDidChange"), 0);

  }
  return v7;
}

- (void)_parentPreviewDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  v9 = a3;
  if (-[CKSearchAvatarSupplementryView parentContentType](self, "parentContentType") != 3
    && -[CKSearchAvatarSupplementryView parentContentType](self, "parentContentType") != 1)
  {
    objc_msgSend(v9, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKSearchAvatarSupplementryView associatedResult](self, "associatedResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "isEqualToString:", v7);

    if (v8)
      -[CKSearchAvatarSupplementryView _updateVisibilityIfNeeded](self, "_updateVisibilityIfNeeded");

  }
}

- (void)_updateVisibilityIfNeeded
{
  unint64_t v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  id v8;

  if (-[CKSearchAvatarSupplementryView parentContentType](self, "parentContentType") != 3)
  {
    if (-[CKSearchAvatarSupplementryView parentContentType](self, "parentContentType") == 1)
    {
      -[CKSearchAvatarSupplementryView setHidden:](self, "setHidden:", 0);
      return;
    }
    +[CKSearchThumbnailPreviewGenerator sharedInstance](CKSearchThumbnailPreviewGenerator, "sharedInstance");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v3 = -[CKSearchAvatarSupplementryView parentContentType](self, "parentContentType");
    if (v3 == 2)
    {
      -[CKSearchAvatarSupplementryView associatedResult](self, "associatedResult");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v8, "hasCachedLinkMetadataForQueryResult:", v4);
    }
    else
    {
      if (v3 == 1)
      {
        -[CKSearchAvatarSupplementryView associatedResult](self, "associatedResult");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKSearchAvatarSupplementryView traitCollection](self, "traitCollection");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v8, "hasCachedMapPreviewForQueryResult:traitCollection:", v4, v7);

        goto LABEL_11;
      }
      if (v3)
      {
        v6 = 1;
        goto LABEL_13;
      }
      -[CKSearchAvatarSupplementryView associatedResult](self, "associatedResult");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v8, "hasCachedPreviewForQueryResult:", v4);
    }
    v6 = v5;
LABEL_11:

LABEL_13:
    -[CKSearchAvatarSupplementryView setHidden:](self, "setHidden:", v6 ^ 1u);

  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
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
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)CKSearchAvatarSupplementryView;
  -[CKSearchAvatarSupplementryView layoutSubviews](&v26, sel_layoutSubviews);
  -[CKSearchAvatarSupplementryView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (CKPixelWidth_once_10 != -1)
    dispatch_once(&CKPixelWidth_once_10, &__block_literal_global_143);
  v11 = *(double *)&CKPixelWidth_sPixel_10;
  v12 = *(double *)&CKPixelWidth_sPixel_10;
  v13 = *(double *)&CKPixelWidth_sPixel_10;
  v14 = *(double *)&CKPixelWidth_sPixel_10;
  if (CKMainScreenScale_once_57 != -1)
    dispatch_once(&CKMainScreenScale_once_57, &__block_literal_global_122_0);
  v15 = *(double *)&CKMainScreenScale_sMainScreenScale_57;
  if (*(double *)&CKMainScreenScale_sMainScreenScale_57 == 0.0)
    v15 = 1.0;
  v16 = (v8 - (v12 + v14)) * v15;
  v17 = (v10 - (v11 + v13)) * v15;
  v18 = v4 * v15 + floor((v8 * v15 - v16) * 0.5);
  v19 = v6 * v15 + floor((v10 * v15 - v17) * 0.5);
  v20 = 1.0 / v15;
  v21 = v20 * v18;
  v22 = v20 * v19;
  v23 = v16 * v20;
  v24 = v17 * v20;
  -[CKSearchAvatarSupplementryView avatarView](self, "avatarView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v21, v22, v23, v24);

  -[CKSearchAvatarSupplementryView _updateVisibilityIfNeeded](self, "_updateVisibilityIfNeeded");
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKSearchAvatarSupplementryView;
  -[CKSearchAvatarSupplementryView prepareForReuse](&v3, sel_prepareForReuse);
  -[CKSearchAvatarSupplementryView setAssociatedResult:](self, "setAssociatedResult:", 0);
}

- (UIEdgeInsets)marginInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->marginInsets.top;
  left = self->marginInsets.left;
  bottom = self->marginInsets.bottom;
  right = self->marginInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setMarginInsets:(UIEdgeInsets)a3
{
  self->marginInsets = a3;
}

- (unint64_t)parentContentType
{
  return self->_parentContentType;
}

- (CKSpotlightQueryResult)associatedResult
{
  return self->_associatedResult;
}

- (void)setAssociatedResult:(id)a3
{
  objc_storeStrong((id *)&self->_associatedResult, a3);
}

- (CNContact)contact
{
  return self->_contact;
}

- (CKAvatarView)avatarView
{
  return self->_avatarView;
}

- (void)setAvatarView:(id)a3
{
  objc_storeStrong((id *)&self->_avatarView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_associatedResult, 0);
}

@end
