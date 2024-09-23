@implementation CKNicknamePreviewView

- (CKNicknamePreviewView)initWithContact:(id)a3 avatarRecord:(id)a4
{
  CKNicknamePreviewView *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CKOnboardingBalloonView *v23;
  CKOnboardingBalloonView *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  id v50;
  id v51;
  id v52;
  CATransform3D v53;
  CATransform3D v54;
  objc_super v55;
  __int128 buf;
  char v57;
  __int128 v58;
  _BYTE v59[23];
  uint64_t v60;
  uint64_t v61;
  int v62;
  int v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v52 = a3;
  v50 = a4;
  v55.receiver = self;
  v55.super_class = (Class)CKNicknamePreviewView;
  v6 = -[CKNicknamePreviewView init](&v55, sel_init);
  if (v6)
  {
    if (_ContactsUIForwardDeclareInit_onceToken_0 != -1)
      dispatch_once(&_ContactsUIForwardDeclareInit_onceToken_0, &__block_literal_global_197);
    v7 = (void *)objc_msgSend(objc_alloc((Class)_CKCNSharingProfileAvatarItemProvider), "initWithContact:avatarRecord:logger:", v52, v50, 0);
    -[CKNicknamePreviewView setAvatarItemProvider:](v6, "setAvatarItemProvider:", v7);

    -[CKNicknamePreviewView avatarItemProvider](v6, "avatarItemProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setShouldIncludeSilhouette:", 1);

    -[CKNicknamePreviewView setContact:](v6, "setContact:", v52);
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    for (i = 0; i != 4; ++i)
    {
      -[CKNicknamePreviewView imageForAvatarType:](v6, "imageForAvatarType:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[CKNicknamePreviewView senderStringForAvatarType:](v6, "senderStringForAvatarType:", i);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_alloc_init(MEMORY[0x1E0CEA658]);
        objc_msgSend(v14, "layer");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setCornerRadius:", 22.0);

        objc_msgSend(v14, "layer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setMasksToBounds:", 1);

        objc_msgSend(v14, "setImage:", v12);
        objc_msgSend(v9, "addObject:", v14);
        -[CKNicknamePreviewView addSubview:](v6, "addSubview:", v14);
        CATransform3DMakeRotation(&v54, -1.57079633, 0.0, 1.0, 0.0);
        objc_msgSend(v14, "layer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v54;
        objc_msgSend(v17, "setTransform:", &v53);

        objc_msgSend(v10, "addObject:", v13);
      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 134217984;
          *(_QWORD *)((char *)&buf + 4) = i;
          _os_log_impl(&dword_18DFCD000, v18, OS_LOG_TYPE_INFO, "Didn't get an avatar image for type %li", (uint8_t *)&buf, 0xCu);
        }

      }
    }
    v19 = (void *)objc_msgSend(v9, "copy");
    -[CKNicknamePreviewView setAvatarViews:](v6, "setAvatarViews:", v19);

    v20 = (void *)objc_msgSend(v10, "copy");
    -[CKNicknamePreviewView setSenderStrings:](v6, "setSenderStrings:", v20);

    v51 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    -[CKNicknamePreviewView senderStrings](v6, "senderStrings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setAttributedText:", v22);

    -[CKNicknamePreviewView addSubview:](v6, "addSubview:", v51);
    -[CKNicknamePreviewView setSenderLabel:](v6, "setSenderLabel:", v51);
    v23 = [CKOnboardingBalloonView alloc];
    v24 = -[CKTextBalloonView initWithFrame:](v23, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CKNicknamePreviewView addSubview:](v6, "addSubview:", v24);
    -[CKColoredBalloonView setColor:](v24, "setColor:", 0xFFFFFFFFLL);
    -[CKNicknamePreviewView balloonView](v6, "balloonView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKNicknamePreviewView traitCollection](v6, "traitCollection");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "updateBalloonForTraitCollection:", v26);

    -[CKBalloonView setOrientation:](v24, "setOrientation:", 0);
    -[CKColoredBalloonView setHasTail:](v24, "setHasTail:", 1);
    -[CKBalloonView setBalloonCorners:](v24, "setBalloonCorners:", -1);
    -[CKColoredBalloonView setCanUseOpaqueMask:](v24, "setCanUseOpaqueMask:", 0);
    -[CKNicknamePreviewView traitCollection](v6, "traitCollection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "userInterfaceStyle");

    -[CKNicknamePreviewView traitCollection](v6, "traitCollection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = CKBackgroundLevelForTraitCollection(v29);

    LOWORD(buf) = 256;
    *(_QWORD *)((char *)&buf + 2) = 0;
    *((_QWORD *)&buf + 1) = 0;
    v57 = -1;
    v58 = 0u;
    memset(v59, 0, sizeof(v59));
    v60 = v28;
    v61 = v30;
    v62 = 256;
    v63 = 0;
    -[CKColoredBalloonView setBalloonDescriptor:](v24, "setBalloonDescriptor:", &buf);
    v31 = objc_alloc(MEMORY[0x1E0CB3778]);
    CKFrameworkBundle();
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_NAME_AND_PHOTO_SHARING_HI_ITS_ME"), &stru_1E276D870, CFSTR("ChatKit"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v31, "initWithString:", v33);

    objc_msgSend(MEMORY[0x1E0DC1350], "__ck_shortPreferredFontForTextStyle:size:", *MEMORY[0x1E0CEB538], 19.0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "length");
    objc_msgSend(v34, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v35, 0, v36);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.57);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v34, "length");
    objc_msgSend(v34, "addAttribute:value:range:", *MEMORY[0x1E0DC1150], v37, 0, v38);

    -[CKTextBalloonView setAttributedText:](v24, "setAttributedText:", v34);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "balloonMaskAlignmentRectInsetsWithTailShape:", 1);
    v41 = v40;
    v43 = v42;

    -[CKNicknamePreviewView traitCollection](v6, "traitCollection");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "displayScale");
    LOWORD(buf) = 256;
    *(_QWORD *)((char *)&buf + 2) = 0;
    *((_QWORD *)&buf + 1) = 0;
    v57 = -1;
    v58 = 0u;
    memset(v59, 0, sizeof(v59));
    v60 = v28;
    v61 = v30;
    v62 = 256;
    v63 = 0;
    CKResizableBalloonMaskWithMinHeight((uint64_t)&buf, v43 + v41 + 19.0, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    LOWORD(buf) = 256;
    *(_QWORD *)((char *)&buf + 2) = 0;
    *((_QWORD *)&buf + 1) = 0;
    v57 = -1;
    v58 = 0u;
    memset(v59, 0, sizeof(v59));
    v60 = v28;
    v61 = v30;
    v62 = 256;
    v63 = 0;
    CKResolvedColorForBalloonDescriptor((uint64_t)&buf);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKNicknamePreviewView balloonImageFromMask:withColor:](v6, "balloonImageFromMask:withColor:", v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKOnboardingBalloonView setLargeBalloonImage:](v24, "setLargeBalloonImage:", v48);
    -[CKBalloonView setNeedsPrepareForDisplay](v24, "setNeedsPrepareForDisplay");
    -[CKBalloonView prepareForDisplayIfNeeded](v24, "prepareForDisplayIfNeeded");
    -[CKNicknamePreviewView setBalloonView:](v6, "setBalloonView:", v24);

  }
  return v6;
}

- (id)balloonImageFromMask:(id)a3 withColor:(id)a4
{
  id v5;
  id v6;
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
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v35;
  double v36;
  CGSize v37;
  CGRect v38;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "capInsets");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "alignmentRectInsets");
  v35 = v16;
  v36 = v15;
  v18 = v17;
  v20 = v19;
  objc_msgSend(v6, "size");
  v22 = v21;
  v24 = v23;
  objc_msgSend(v6, "scale");
  v26 = v25;
  v37.width = v22;
  v37.height = v24;
  UIGraphicsBeginImageContextWithOptions(v37, 0, v26);
  objc_msgSend(v6, "size");
  v28 = v27;
  objc_msgSend(v6, "size");
  v30 = v29;
  objc_msgSend(v5, "set");

  v38.origin.x = 0.0;
  v38.origin.y = 0.0;
  v38.size.width = v28;
  v38.size.height = v30;
  UIRectFill(v38);
  objc_msgSend(v6, "drawInRect:blendMode:alpha:", 22, 0.0, 0.0, v28, v30, 1.0);

  UIGraphicsGetImageFromCurrentImageContext();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v31, "resizableImageWithCapInsets:", v8, v10, v12, v14);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "imageWithAlignmentRectInsets:", v36, v35, v18, v20);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

- (id)balloonText
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v3 = objc_alloc(MEMORY[0x1E0CB3778]);
  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("WHATS_NEW_NAME_AND_PHOTO_SHARING_HI_ITS_ME"), &stru_1E276D870, CFSTR("ChatKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithString:", v5);

  v7 = objc_msgSend(v6, "length");
  v8 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "__ck_shortPreferredFontForTextStyle:size:", *MEMORY[0x1E0CEB538], 19.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAttribute:value:range:", v8, v9, 0, v7);

  v10 = *MEMORY[0x1E0DC1140];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "theme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNicknamePreviewView balloonView](self, "balloonView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "balloonTextColorForColorType:", objc_msgSend(v13, "color"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAttribute:value:range:", v10, v14, 0, v7);

  v15 = *MEMORY[0x1E0DC1150];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.57);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAttribute:value:range:", v15, v16, 0, objc_msgSend(v6, "length"));

  return v6;
}

- (void)updateBalloonTraitCollection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CKNicknamePreviewView balloonView](self, "balloonView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNicknamePreviewView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateBalloonForTraitCollection:", v4);

  -[CKNicknamePreviewView balloonView](self, "balloonView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNicknamePreviewView balloonText](self, "balloonText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v6);

  -[CKNicknamePreviewView balloonView](self, "balloonView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsPrepareForDisplay");

  -[CKNicknamePreviewView balloonView](self, "balloonView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prepareForDisplayIfNeeded");

}

- (void)beginAnimation
{
  id v3;

  -[CKNicknamePreviewView avatarViews](self, "avatarViews");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CKNicknamePreviewView avatarDidFinishTransitionToAvatarAtIndex:](self, "avatarDidFinishTransitionToAvatarAtIndex:", objc_msgSend(v3, "count") - 1);

}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double Height;
  void *v12;
  double v13;
  double v14;
  __int128 v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  void *v26;
  double v27;
  CGFloat v28;
  double Width;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double MidY;
  double v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint64_t v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v55 = *MEMORY[0x1E0C80C00];
  -[CKNicknamePreviewView senderLabel](self, "senderLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sizeToFit");

  -[CKNicknamePreviewView senderLabel](self, "senderLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v56.origin.y = 0.0;
  v56.origin.x = v6;
  v56.size.width = v8;
  v56.size.height = v10;
  Height = CGRectGetHeight(v56);
  -[CKNicknamePreviewView senderLabel](self, "senderLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_lastLineBaseline");
  v14 = v13;

  v15 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
  v52 = *MEMORY[0x1E0CEB4B0];
  v53 = v15;
  -[CKNicknamePreviewView balloonView](self, "balloonView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sizeThatFits:textAlignmentInsets:", &v52, 320.0, 1.79769313e308);
  v18 = v17;
  v20 = v19;

  -[CKNicknamePreviewView balloonView](self, "balloonView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTextAlignmentInsets:", v52, v53);

  v22 = *MEMORY[0x1E0C9D648];
  v57.origin.y = 0.0;
  v57.origin.x = v6;
  v57.size.width = v8;
  v57.size.height = v10;
  v23 = v14 - Height + CGRectGetMaxY(v57) + 5.0;
  v24 = v22 + 56.0;
  -[CKNicknamePreviewView balloonView](self, "balloonView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:", v22 + 56.0, v23, v18, v20);

  -[CKNicknamePreviewView balloonView](self, "balloonView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "alignmentRectInsets");
  v28 = v22 + 56.0 + v27;

  -[CKNicknamePreviewView frame](self, "frame");
  Width = CGRectGetWidth(v58);
  v59.origin.y = 0.0;
  v59.origin.x = v28;
  v59.size.width = v8;
  v59.size.height = v10;
  v30 = Width - CGRectGetMinX(v59);
  -[CKNicknamePreviewView senderLabel](self, "senderLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFrame:", v28, 0.0, v30, v10);

  -[CKNicknamePreviewView avatarViews](self, "avatarViews");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "firstObject");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "frame");
  v35 = v34;
  v37 = v36;
  v39 = v38;

  v60.origin.x = v24;
  v60.origin.y = v23;
  v60.size.width = v18;
  v60.size.height = v20;
  MidY = CGRectGetMidY(v60);
  v61.origin.x = 0.0;
  v61.origin.y = v35;
  v61.size.width = v37;
  v61.size.height = v39;
  v41 = CGRectGetHeight(v61);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  -[CKNicknamePreviewView avatarViews](self, "avatarViews", 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
  if (v43)
  {
    v44 = v43;
    v45 = MidY + v41 * -0.5;
    v46 = *(_QWORD *)v49;
    do
    {
      v47 = 0;
      do
      {
        if (*(_QWORD *)v49 != v46)
          objc_enumerationMutation(v42);
        objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * v47++), "setFrame:", 0.0, v45, 44.0, 44.0);
      }
      while (v44 != v47);
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v48, v54, 16);
    }
    while (v44);
  }

  -[CKNicknamePreviewView setShouldStopAnimation:](self, "setShouldStopAnimation:", 0);
}

- (void)avatarDidFinishTransitionToAvatarAtIndex:(unint64_t)a3
{
  BOOL v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  dispatch_time_t v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id location;
  _QWORD v27[6];

  -[CKNicknamePreviewView avatarViews](self, "avatarViews");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count") <= a3)
  {

  }
  else
  {
    v5 = -[CKNicknamePreviewView shouldStopAnimation](self, "shouldStopAnimation");

    if (!v5)
    {
      -[CKNicknamePreviewView avatarViews](self, "avatarViews");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (a3 + 1) % objc_msgSend(v6, "count");

      -[CKNicknamePreviewView avatarViews](self, "avatarViews");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = MEMORY[0x1E0C809B0];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __66__CKNicknamePreviewView_avatarDidFinishTransitionToAvatarAtIndex___block_invoke;
      v27[3] = &unk_1E274C9C0;
      v27[4] = self;
      v27[5] = v7;
      -[CKNicknamePreviewView runFlipAnimationOnAvatarView:completion:](self, "runFlipAnimationOnAvatarView:completion:", v9, v27);
      v11 = a3 + 2;
      -[CKNicknamePreviewView senderStrings](self, "senderStrings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v11 % objc_msgSend(v12, "count");

      -[CKNicknamePreviewView senderStrings](self, "senderStrings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v7);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKNicknamePreviewView senderStrings](self, "senderStrings");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "string");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "string");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqualToString:", v19);

      if ((v20 & 1) == 0)
      {
        location = 0;
        objc_initWeak(&location, self);
        v21 = dispatch_time(0, 1700000000);
        block[0] = v10;
        block[1] = 3221225472;
        block[2] = __66__CKNicknamePreviewView_avatarDidFinishTransitionToAvatarAtIndex___block_invoke_2;
        block[3] = &unk_1E274C7A8;
        block[4] = self;
        objc_copyWeak(&v25, &location);
        v24 = v17;
        dispatch_after(v21, MEMORY[0x1E0C80D38], block);

        objc_destroyWeak(&v25);
        objc_destroyWeak(&location);
      }

    }
  }
}

uint64_t __66__CKNicknamePreviewView_avatarDidFinishTransitionToAvatarAtIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "avatarDidFinishTransitionToAvatarAtIndex:", *(_QWORD *)(a1 + 40));
}

void __66__CKNicknamePreviewView_avatarDidFinishTransitionToAvatarAtIndex___block_invoke_2(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__CKNicknamePreviewView_avatarDidFinishTransitionToAvatarAtIndex___block_invoke_3;
  v3[3] = &unk_1E274D5D0;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "setSenderLabelVisible:completion:", 0, v3);

  objc_destroyWeak(&v5);
}

void __66__CKNicknamePreviewView_avatarDidFinishTransitionToAvatarAtIndex___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "senderLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAttributedText:", v1);

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "setSenderLabelVisible:completion:", 1, 0);

}

- (void)setSenderLabelVisible:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  float v14;
  void *v15;
  void *v16;
  double v17;
  void *v18;
  id v19;

  v4 = a3;
  v6 = (void *)MEMORY[0x1E0CD28B0];
  v7 = a4;
  objc_msgSend(v6, "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v7);

  objc_msgSend(MEMORY[0x1E0CD2710], "animation");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setKeyPath:", CFSTR("opacity"));
  objc_msgSend(v19, "setDuration:", 0.1);
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[CKNicknamePreviewView senderLabel](self, "senderLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "opacity");
  objc_msgSend(v8, "numberWithFloat:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFromValue:", v11);

  if (v4)
    v12 = 1.0;
  else
    v12 = 0.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setToValue:", v13);

  -[CKNicknamePreviewView senderLabel](self, "senderLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12;
  *(float *)&v17 = v14;
  objc_msgSend(v16, "setOpacity:", v17);

  -[CKNicknamePreviewView senderLabel](self, "senderLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addAnimation:forKey:", v19, CFSTR("fadeAnimation"));

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)runFlipAnimationOnAvatarView:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (void *)MEMORY[0x1E0CD28B0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setCompletionBlock:", v7);

  -[CKNicknamePreviewView flipAnimation](self, "flipAnimation");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAnimation:forKey:", v10, CFSTR("flipAnimation"));
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");

}

- (id)flipAnimation
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD2798], "animationWithKeyPath:", CFSTR("transform.rotation.y"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setValues:", &unk_1E286F958);
  objc_msgSend(v2, "setKeyTimes:", &unk_1E286F970);
  LODWORD(v3) = 0.25;
  LODWORD(v4) = 0.25;
  LODWORD(v5) = 0;
  LODWORD(v6) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058], v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  LODWORD(v9) = 1011129254;
  LODWORD(v10) = 1.0;
  LODWORD(v11) = 0.75;
  LODWORD(v12) = 0.75;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v10, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimingFunctions:", v14);

  objc_msgSend(v2, "setDuration:", 1.9);
  return v2;
}

- (id)imageForAvatarType:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void (**v6)(double, double);
  void *v7;

  switch(a3)
  {
    case 0:
      -[CKNicknamePreviewView avatarItemProvider](self, "avatarItemProvider");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "silhouetteItem");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1:
      -[CKNicknamePreviewView avatarItemProvider](self, "avatarItemProvider");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "animojiItem");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
      -[CKNicknamePreviewView avatarItemProvider](self, "avatarItemProvider");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "photoItem");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3:
      -[CKNicknamePreviewView avatarItemProvider](self, "avatarItemProvider");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "monogramItem");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v5 = (void *)v4;

      if (!v5)
        goto LABEL_8;
      objc_msgSend(v5, "imageProvider");
      v6 = (void (**)(double, double))objc_claimAutoreleasedReturnValue();
      v6[2](44.0, 44.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
LABEL_8:
      v7 = 0;
      break;
  }
  return v7;
}

- (id)senderStringForAvatarType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  _QWORD *v18;
  void *v19;
  id v20;
  void *v21;
  int v23;
  int64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D35918], "iMessageService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IMPreferredAccountForService();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if ((unint64_t)(a3 - 1) >= 3)
  {
    if (a3)
      v11 = 0;
    else
      v11 = v7;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C97218];
    -[CKNicknamePreviewView contact](self, "contact");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromContact:style:", v10, 0);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  if (-[__CFString length](v11, "length"))
  {
    if (v11)
      goto LABEL_15;
  }
  else
  {
    v12 = v8;

    v11 = v12;
    if (v12)
      goto LABEL_15;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v23 = 134218498;
      v24 = a3;
      v25 = 2112;
      v26 = v6;
      v27 = 2112;
      v28 = v8;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "senderStringForAvatarType %li is nil. Account: %@, Display name: %@", (uint8_t *)&v23, 0x20u);
    }

  }
  v11 = &stru_1E276D870;
LABEL_15:
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "senderTranscriptTextAttributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  v17 = CKIsRunningInMacCatalyst();
  v18 = (_QWORD *)MEMORY[0x1E0CEB558];
  if (v17)
    v18 = (_QWORD *)MEMORY[0x1E0CEB540];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0DC1138]);

  v20 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v20, "setLineBreakMode:", 4);
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0DC1178]);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v11, v16);

  return v21;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v4;
  CGFloat MaxX;
  void *v6;
  CGFloat MaxY;
  double v8;
  double v9;
  CGSize result;
  CGRect v11;
  CGRect v12;

  -[CKNicknamePreviewView balloonView](self, "balloonView", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  MaxX = CGRectGetMaxX(v11);

  -[CKNicknamePreviewView balloonView](self, "balloonView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  MaxY = CGRectGetMaxY(v12);

  v8 = MaxX;
  v9 = MaxY;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CNSharingProfileAvatarItemProviderConfiguration)avatarItemProviderConfiguration
{
  void *v2;
  void *v3;

  -[CKNicknamePreviewView avatarItemProvider](self, "avatarItemProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CNSharingProfileAvatarItemProviderConfiguration *)v3;
}

- (BOOL)shouldStopAnimation
{
  return self->_shouldStopAnimation;
}

- (void)setShouldStopAnimation:(BOOL)a3
{
  self->_shouldStopAnimation = a3;
}

- (UILabel)senderLabel
{
  return self->_senderLabel;
}

- (void)setSenderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_senderLabel, a3);
}

- (NSArray)avatarViews
{
  return self->_avatarViews;
}

- (void)setAvatarViews:(id)a3
{
  objc_storeStrong((id *)&self->_avatarViews, a3);
}

- (CKTextBalloonView)balloonView
{
  return self->_balloonView;
}

- (void)setBalloonView:(id)a3
{
  objc_storeStrong((id *)&self->_balloonView, a3);
}

- (NSArray)senderStrings
{
  return self->_senderStrings;
}

- (void)setSenderStrings:(id)a3
{
  objc_storeStrong((id *)&self->_senderStrings, a3);
}

- (CKCNSharingProfileAvatarItemProvider)avatarItemProvider
{
  return self->_avatarItemProvider;
}

- (void)setAvatarItemProvider:(id)a3
{
  objc_storeStrong((id *)&self->_avatarItemProvider, a3);
}

- (CNContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_avatarItemProvider, 0);
  objc_storeStrong((id *)&self->_senderStrings, 0);
  objc_storeStrong((id *)&self->_balloonView, 0);
  objc_storeStrong((id *)&self->_avatarViews, 0);
  objc_storeStrong((id *)&self->_senderLabel, 0);
}

@end
