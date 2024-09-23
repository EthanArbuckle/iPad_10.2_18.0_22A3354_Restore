@implementation CKTipKitOnboardingCollectionViewCell

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("CKTipKitOnboardingCollectionViewCellIdentifier");
}

- (CKTipKitOnboardingCollectionViewCell)initWithFrame:(CGRect)a3
{
  CKTipKitOnboardingCollectionViewCell *v3;
  CKTipKitOnboardingCollectionViewCell *v4;
  NSArray *layerNames;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKTipKitOnboardingCollectionViewCell;
  v3 = -[CKTipKitOnboardingCollectionViewCell initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    layerNames = v3->_layerNames;
    v3->_layerNames = (NSArray *)&unk_1E286F7F0;

  }
  return v4;
}

- (void)dealloc
{
  UIView *tipUIView;
  objc_super v4;

  -[CKTipKitOnboardingCollectionViewCell stopAnimations](self, "stopAnimations");
  -[UIView removeFromSuperview](self->_tipUIView, "removeFromSuperview");
  tipUIView = self->_tipUIView;
  self->_tipUIView = 0;

  v4.receiver = self;
  v4.super_class = (Class)CKTipKitOnboardingCollectionViewCell;
  -[CKTipKitOnboardingCollectionViewCell dealloc](&v4, sel_dealloc);
}

- (UIView)micaView
{
  UIView *micaView;
  UIView *v4;
  UIView *v5;

  micaView = self->_micaView;
  if (!micaView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
    v5 = self->_micaView;
    self->_micaView = v4;

    -[UIView setAutoresizingMask:](self->_micaView, "setAutoresizingMask:", 18);
    micaView = self->_micaView;
  }
  return micaView;
}

- (NSMutableArray)avatarViews
{
  NSMutableArray *avatarViews;
  NSMutableArray *v4;
  NSMutableArray *v5;

  avatarViews = self->_avatarViews;
  if (!avatarViews)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_layerNames, "count"));
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_avatarViews;
    self->_avatarViews = v4;

    avatarViews = self->_avatarViews;
  }
  return avatarViews;
}

- (CAStateController)stateController
{
  CAStateController *stateController;
  CAStateController *v4;
  CAStateController *v5;
  double v6;

  stateController = self->_stateController;
  if (!stateController)
  {
    v4 = (CAStateController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2868]), "initWithLayer:", self->_packageLayer);
    v5 = self->_stateController;
    self->_stateController = v4;

    LODWORD(v6) = 1.0;
    -[CAStateController setInitialStatesOfLayer:transitionSpeed:](self->_stateController, "setInitialStatesOfLayer:transitionSpeed:", self->_packageLayer, v6);
    stateController = self->_stateController;
  }
  return stateController;
}

- (CAPackage)package
{
  CAPackage *package;
  void *v4;
  void *v5;
  CAPackage *v6;
  CAPackage *v7;

  package = self->_package;
  if (!package)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("PinningTipAnimation"), CFSTR("ca"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD27F8], "packageWithContentsOfURL:type:options:error:", v5, *MEMORY[0x1E0CD3078], 0, 0);
    v6 = (CAPackage *)objc_claimAutoreleasedReturnValue();
    v7 = self->_package;
    self->_package = v6;

    package = self->_package;
  }
  return package;
}

- (void)prepareForReuse
{
  objc_super v3;

  -[CKTipKitOnboardingCollectionViewCell stopAnimations](self, "stopAnimations");
  v3.receiver = self;
  v3.super_class = (Class)CKTipKitOnboardingCollectionViewCell;
  -[CKTipKitOnboardingCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (void)startAnimations
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[CKTipKitOnboardingCollectionViewCell packageLayer](self, "packageLayer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CKTipKitOnboardingCollectionViewCell stepThroughOnboardingTipAnimationForLayer:](self, "stepThroughOnboardingTipAnimationForLayer:", v3);

}

- (void)stopAnimations
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[CKTipKitOnboardingCollectionViewCell stateController](self, "stateController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelTimers");

}

- (void)resetViews
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  CAStateController *stateController;
  NSMutableArray *avatarViews;
  UIView *micaView;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_micaView)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = self->_avatarViews;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7++), "removeFromSuperview", (_QWORD)v12);
        }
        while (v5 != v7);
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

    -[CKTipKitOnboardingCollectionViewCell packageLayer](self, "packageLayer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeFromSuperlayer");

    -[UIView removeFromSuperview](self->_micaView, "removeFromSuperview");
    stateController = self->_stateController;
    self->_stateController = 0;

    avatarViews = self->_avatarViews;
    self->_avatarViews = 0;

    micaView = self->_micaView;
    self->_micaView = 0;

  }
}

- (void)setTipUIView:(id)a3 withRecommendedPinningConversations:(id)a4
{
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[CKTipKitOnboardingCollectionViewCell tipUIView](self, "tipUIView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v8)
  {
    -[CKTipKitOnboardingCollectionViewCell resetViews](self, "resetViews");
    -[CKTipKitOnboardingCollectionViewCell setTipUIView:](self, "setTipUIView:", v8);
    -[CKTipKitOnboardingCollectionViewCell setRecommendedPinningConversations:](self, "setRecommendedPinningConversations:", v6);
    -[CKTipKitOnboardingCollectionViewCell stopAnimations](self, "stopAnimations");
    -[CKTipKitOnboardingCollectionViewCell updateTipAnimationIfNeeded](self, "updateTipAnimationIfNeeded");
  }

}

- (void)updateTipAnimationIfNeeded
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  double v7;
  double v8;
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
  double v22;
  double v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t v28;
  CKTipKitOnboardingCollectionViewCell *v29;
  void *v30;
  unint64_t v31;
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
  double v44;
  double v45;
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
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  _QWORD v82[5];
  id v83;
  _QWORD v84[4];
  _QWORD v85[4];
  _QWORD v86[6];

  v86[4] = *MEMORY[0x1E0C80C00];
  -[CKTipKitOnboardingCollectionViewCell recommendedPinningConversations](self, "recommendedPinningConversations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tipCellCornerRadius");
    v8 = v7;
    objc_msgSend(v5, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCornerRadius:", v8);

    objc_msgSend(MEMORY[0x1E0CEA478], "secondarySystemBackgroundColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v10);

    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CKTipKitOnboardingCollectionViewCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v5);
    v62 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v5, "topAnchor");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v78, "constraintEqualToAnchor:", v77);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = v74;
    objc_msgSend(v5, "bottomAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bottomAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v68);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v86[1] = v65;
    objc_msgSend(v5, "leadingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "tipCellLeadingInset");
    objc_msgSend(v12, "constraintEqualToAnchor:constant:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v86[2] = v15;
    v81 = v5;
    objc_msgSend(v5, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v11;
    objc_msgSend(v11, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "tipCellTrailingInset");
    objc_msgSend(v16, "constraintEqualToAnchor:constant:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v86[3] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "activateConstraints:", v20);

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "tipCellMicaAnimationSize");
    v23 = v22;

    v24 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
    objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v24, "setBounds:", 0.0, 0.0, v23, v23);
    objc_msgSend(v24, "setClipsToBounds:", 0);
    -[CKTipKitOnboardingCollectionViewCell micaView](self, "micaView");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bounds");
    objc_msgSend(v25, "setFrame:");

    -[CKTipKitOnboardingCollectionViewCell micaView](self, "micaView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addSubview:", v26);

    -[CKTipKitOnboardingCollectionViewCell recommendedPinningConversations](self, "recommendedPinningConversations");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");
    v29 = self;
    -[CKTipKitOnboardingCollectionViewCell layerNames](self, "layerNames");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "count");

    if (v28 >= v31)
    {
      -[CKTipKitOnboardingCollectionViewCell package](self, "package");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "rootLayer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKTipKitOnboardingCollectionViewCell setPackageLayer:](self, "setPackageLayer:", v33);

      -[CKTipKitOnboardingCollectionViewCell packageLayer](self, "packageLayer");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setGeometryFlipped:", 1);

      -[CKTipKitOnboardingCollectionViewCell packageLayer](self, "packageLayer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setPosition:", v23 * 0.5, v23 * 0.5);

      -[CKTipKitOnboardingCollectionViewCell micaView](self, "micaView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "layer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKTipKitOnboardingCollectionViewCell packageLayer](self, "packageLayer");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "addSublayer:", v38);

      -[CKTipKitOnboardingCollectionViewCell recommendedPinningConversations](self, "recommendedPinningConversations");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKTipKitOnboardingCollectionViewCell layerNames](self, "layerNames");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "subarrayWithRange:", 0, objc_msgSend(v40, "count"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      -[CKTipKitOnboardingCollectionViewCell layerNames](self, "layerNames");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v82[0] = MEMORY[0x1E0C809B0];
      v82[1] = 3221225472;
      v82[2] = __66__CKTipKitOnboardingCollectionViewCell_updateTipAnimationIfNeeded__block_invoke;
      v82[3] = &unk_1E2755FA8;
      v82[4] = self;
      v83 = v41;
      v79 = v41;
      objc_msgSend(v42, "enumerateObjectsUsingBlock:", v82);

      objc_msgSend(v81, "addSubview:", self->_tipUIView);
      objc_msgSend(v81, "addSubview:", v24);
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "tipCellMicaAnimationPadding");
      v45 = v44;

      v63 = (void *)MEMORY[0x1E0CB3718];
      objc_msgSend(v24, "leadingAnchor");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "leadingAnchor");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "constraintEqualToAnchor:constant:", v72, v45);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v85[0] = v69;
      objc_msgSend(v24, "topAnchor");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "topAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "constraintEqualToAnchor:constant:", v46, v45);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v85[1] = v47;
      objc_msgSend(v24, "widthAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "constraintEqualToConstant:", v23);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v85[2] = v49;
      objc_msgSend(v24, "heightAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "constraintEqualToConstant:", v23);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v85[3] = v51;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 4);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "activateConstraints:", v52);

      v64 = (void *)MEMORY[0x1E0CB3718];
      -[UIView topAnchor](v29->_tipUIView, "topAnchor");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "topAnchor");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "constraintEqualToAnchor:", v73);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v84[0] = v70;
      -[UIView bottomAnchor](v29->_tipUIView, "bottomAnchor");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "bottomAnchor");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "constraintEqualToAnchor:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v84[1] = v54;
      -[UIView leadingAnchor](v29->_tipUIView, "leadingAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "trailingAnchor");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "constraintEqualToAnchor:", v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v84[2] = v57;
      -[UIView trailingAnchor](v29->_tipUIView, "trailingAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "trailingAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "constraintEqualToAnchor:", v59);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v84[3] = v60;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 4);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "activateConstraints:", v61);

    }
  }
}

void __66__CKTipKitOnboardingCollectionViewCell_updateTipAnimationIfNeeded__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  CKAvatarView *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "package");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "publishedObjectWithName:", v6);
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(MEMORY[0x1E0C97468], "maxContactAvatars");
  objc_msgSend(v8, "conversationVisualIdentityWithKeys:requestedNumberOfContactsToFetch:", MEMORY[0x1E0C9AA60], v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(CKAvatarView);
  v12 = -[CNAvatarView updateViewWithGroupIdentity:](v11, "updateViewWithGroupIdentity:", v10);
  -[CNAvatarView setAsynchronousRendering:](v11, "setAsynchronousRendering:", 1);
  -[CKAvatarView setUserInteractionEnabled:](v11, "setUserInteractionEnabled:", 0);
  -[CNAvatarView setShowsContactOnTap:](v11, "setShowsContactOnTap:", 0);
  -[CNAvatarView setDelegate:](v11, "setDelegate:", *(_QWORD *)(a1 + 32));
  -[CKAvatarView sizeToFit](v11, "sizeToFit");
  objc_msgSend(v15, "bounds");
  -[CKAvatarView setFrame:](v11, "setFrame:");
  objc_msgSend(*(id *)(a1 + 32), "avatarViews");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v11);

  objc_msgSend(*(id *)(a1 + 32), "micaView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addSubview:", v11);

}

- (void)setTipUIView:(id)a3
{
  UIView *v5;
  UIView **p_tipUIView;
  UIView *v7;

  v5 = (UIView *)a3;
  p_tipUIView = &self->_tipUIView;
  if (*p_tipUIView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](*p_tipUIView, "removeFromSuperview");
    objc_storeStrong((id *)p_tipUIView, a3);
    v5 = v7;
  }

}

- (void)stepThroughOnboardingTipAnimationForLayer:(id)a3
{
  id v4;
  double v5;
  float v6;
  int64_t v7;
  void *v8;
  void *v9;
  double v10;
  id v11;

  v4 = a3;
  if (-[CKTipKitOnboardingCollectionViewCell state](self, "state") == 4)
  {
    v5 = 0.0;
    v6 = 0.0;
    v7 = 1;
  }
  else
  {
    v7 = -[CKTipKitOnboardingCollectionViewCell state](self, "state") + 1;
    v5 = 2.5;
    v6 = 1.0;
  }
  -[CKTipKitOnboardingCollectionViewCell setState:](self, "setState:", v7);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("State %ld"), -[CKTipKitOnboardingCollectionViewCell state](self, "state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stateWithName:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[CKTipKitOnboardingCollectionViewCell stateController](self, "stateController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = v6;
  objc_msgSend(v9, "setState:ofLayer:transitionSpeed:", v11, v4, v10);

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[CKTipKitOnboardingCollectionViewCell performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_stepThroughOnboardingTipAnimationForLayer_, v4, v5);

}

- (id)presentingViewControllerForAvatarView:(id)a3
{
  return 0;
}

- (void)didUpdateContentForAvatarView:(id)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[CKTipKitOnboardingCollectionViewCell avatarViews](self, "avatarViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfObject:", v13);

  -[CKTipKitOnboardingCollectionViewCell layerNames](self, "layerNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 > v5)
  {
    -[CKTipKitOnboardingCollectionViewCell package](self, "package");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTipKitOnboardingCollectionViewCell layerNames](self, "layerNames");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "publishedObjectWithName:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSublayer:", v12);

  }
}

- (UIView)tipUIView
{
  return self->_tipUIView;
}

- (NSArray)recommendedPinningConversations
{
  return self->_recommendedPinningConversations;
}

- (void)setRecommendedPinningConversations:(id)a3
{
  objc_storeStrong((id *)&self->_recommendedPinningConversations, a3);
}

- (void)setPackage:(id)a3
{
  objc_storeStrong((id *)&self->_package, a3);
}

- (CALayer)packageLayer
{
  return self->_packageLayer;
}

- (void)setPackageLayer:(id)a3
{
  objc_storeStrong((id *)&self->_packageLayer, a3);
}

- (void)setStateController:(id)a3
{
  objc_storeStrong((id *)&self->_stateController, a3);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void)setMicaView:(id)a3
{
  objc_storeStrong((id *)&self->_micaView, a3);
}

- (NSArray)layerNames
{
  return self->_layerNames;
}

- (void)setLayerNames:(id)a3
{
  objc_storeStrong((id *)&self->_layerNames, a3);
}

- (void)setAvatarViews:(id)a3
{
  objc_storeStrong((id *)&self->_avatarViews, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avatarViews, 0);
  objc_storeStrong((id *)&self->_layerNames, 0);
  objc_storeStrong((id *)&self->_micaView, 0);
  objc_storeStrong((id *)&self->_stateController, 0);
  objc_storeStrong((id *)&self->_packageLayer, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_recommendedPinningConversations, 0);
  objc_storeStrong((id *)&self->_tipUIView, 0);
}

@end
