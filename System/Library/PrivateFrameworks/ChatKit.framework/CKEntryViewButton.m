@implementation CKEntryViewButton

+ (id)entryViewButtonOfType:(int64_t)a3 wantsVibrancy:(BOOL)a4
{
  _BOOL8 v4;
  CKEntryViewButton *v6;
  CKEntryViewButton *v7;
  void *v8;
  int v9;

  v4 = a4;
  v6 = [CKEntryViewButton alloc];
  v7 = -[CKEntryViewButton initWithFrame:wantsVibrancy:](v6, "initWithFrame:wantsVibrancy:", v4, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CKEntryViewButton setEntryViewButtonType:](v7, "setEntryViewButtonType:", a3);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isRichAudioMessagesEnabled");

  if (a3 == 5 && v9)
    -[CKEntryViewButton setCkTintColor:](v7, "setCkTintColor:", 3);
  return v7;
}

+ (id)entryViewButtonOfType:(int64_t)a3
{
  CKEntryViewButton *v4;
  void *v5;
  uint64_t v6;
  CKEntryViewButton *v7;

  v4 = [CKEntryViewButton alloc];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "entryViewButtonWantsVibrancy");
  v7 = -[CKEntryViewButton initWithFrame:wantsVibrancy:](v4, "initWithFrame:wantsVibrancy:", v6, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  -[CKEntryViewButton setEntryViewButtonType:](v7, "setEntryViewButtonType:", a3);
  return v7;
}

+ (id)imageNameForEntryViewButtonType:(int64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = 0;
  switch(a3)
  {
    case 0:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entryViewPhotoButtonName");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entryViewArrowButtonName");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entryViewAppButtonName");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entryViewPlusButtonName");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entryViewSendButtonName");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 5:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entryViewAudioButtonName");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 8:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entryViewDictationButtonName");
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v3 = (void *)v5;

      break;
    default:
      return v3;
  }
  return v3;
}

+ (void)prewarmEntryViewButtons
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;

  objc_msgSend((id)objc_opt_class(), "imageNameForEntryViewButtonType:", 5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAudioMessagesEntryViewRecordingEnabled");

  if (v5)
    v6 = 3;
  else
    v6 = 0xFFFFFFFFLL;
  v7 = (id)objc_msgSend(a1, "entryViewButtonImageWithName:tintColor:shouldSuppressHairline:", v3, v6, 1);
  objc_msgSend((id)objc_opt_class(), "imageNameForEntryViewButtonType:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (id)objc_msgSend(a1, "entryViewButtonImageWithName:tintColor:shouldSuppressHairline:", v8, 0xFFFFFFFFLL, 1);
  objc_msgSend((id)objc_opt_class(), "imageNameForEntryViewButtonType:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(a1, "entryViewButtonImageWithName:tintColor:shouldSuppressHairline:", v10, 0xFFFFFFFFLL, 1);
  objc_msgSend((id)objc_opt_class(), "imageNameForEntryViewButtonType:", 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (id)objc_msgSend(a1, "entryViewButtonImageWithName:tintColor:shouldSuppressHairline:", v12, 0xFFFFFFFFLL, 1);
  objc_msgSend((id)objc_opt_class(), "imageNameForEntryViewButtonType:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (id)objc_msgSend(a1, "entryViewButtonImageWithName:tintColor:shouldSuppressHairline:", v14, 1, 1);
  objc_msgSend((id)objc_opt_class(), "imageNameForEntryViewButtonType:", 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (id)objc_msgSend(a1, "entryViewButtonImageWithName:tintColor:shouldSuppressHairline:", v16, 0, 1);
  if (CKIsRunningInMacCatalyst())
  {
    objc_msgSend((id)objc_opt_class(), "imageNameForEntryViewButtonType:", 6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (id)objc_msgSend(a1, "entryViewButtonImageWithName:tintColor:shouldSuppressHairline:", v18, 0xFFFFFFFFLL, 0);
    objc_msgSend((id)objc_opt_class(), "imageNameForEntryViewButtonType:", 7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (id)objc_msgSend(a1, "entryViewButtonImageWithName:tintColor:shouldSuppressHairline:", v16, 3, 0);
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "entryViewDictationButtonName");
  v23 = (id)objc_claimAutoreleasedReturnValue();

  v22 = (id)objc_msgSend(a1, "entryViewButtonImageWithName:tintColor:shouldSuppressHairline:", v23, 0xFFFFFFFFLL, 0);
}

+ (id)entryViewButtonImageForType:(int64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "imageNameForEntryViewButtonType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entryViewButtonImageWithName:tintColor:shouldSuppressHairline:", v4, 0xFFFFFFFFLL, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)entryViewButtonImageForType:(int64_t)a3 color:(char)a4
{
  uint64_t v4;
  void *v6;
  void *v7;

  v4 = a4;
  objc_msgSend((id)objc_opt_class(), "imageNameForEntryViewButtonType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "entryViewButtonImageWithName:tintColor:shouldSuppressHairline:", v6, v4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CKEntryViewButton)initWithFrame:(CGRect)a3 wantsVibrancy:(BOOL)a4
{
  _BOOL8 v4;
  CKEntryViewButton *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  CKEntryViewBlurrableButtonContainer *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CKEntryViewButton;
  v5 = -[CKEntryViewButton initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", 0);
    -[CKEntryViewButton addSubview:](v5, "addSubview:", v6);
    -[CKEntryViewButton setVibrancyView:](v5, "setVibrancyView:", v6);
    -[CKEntryViewButton setWantsVibrancy:](v5, "setWantsVibrancy:", v4);
    v7 = -[CKEntryViewButton _preferredEntryViewButtonType](v5, "_preferredEntryViewButtonType");
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v7)
      objc_msgSend(v8, "setAdjustsImageWhenDisabled:", 0);
    objc_msgSend(v9, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContentMode:", 1);

    v11 = objc_alloc_init(CKEntryViewBlurrableButtonContainer);
    -[CKEntryViewBlurrableButtonContainer addSubview:](v11, "addSubview:", v9);
    objc_msgSend(v6, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v11);

    -[CKEntryViewButton setButton:](v5, "setButton:", v9);
    -[CKEntryViewButton setBlurrableButtonContainer:](v5, "setBlurrableButtonContainer:", v11);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA860]), "initWithDelegate:", v5);
    -[CKEntryViewButton addInteraction:](v5, "addInteraction:", v13);

  }
  return v5;
}

- (int64_t)_preferredEntryViewButtonType
{
  return CKIsRunningInMacCatalyst() == 0;
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
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CKEntryViewButton;
  -[CKEntryViewButton layoutSubviews](&v28, sel_layoutSubviews);
  -[CKEntryViewButton bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKEntryViewButton vibrancyView](self, "vibrancyView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  if (self->_needsOversizedBlurContainer)
  {
    -[CKEntryViewButton blurrableButtonContainer](self, "blurrableButtonContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v4 + -30.0;
    v15 = v6 + -30.0;
    v16 = v8 + 60.0;
    v17 = v10 + 60.0;
  }
  else
  {
    -[CKEntryViewButton blurrableButtonContainer](self, "blurrableButtonContainer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = v4;
    v15 = v6;
    v16 = v8;
    v17 = v10;
  }
  objc_msgSend(v12, "setFrame:", v14, v15, v16, v17);

  -[CKEntryViewButton blurrableButtonContainer](self, "blurrableButtonContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEntryViewButton convertRect:toView:](self, "convertRect:toView:", v18, v4, v6, v8, v10);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  -[CKEntryViewButton button](self, "button");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFrame:", v20, v22, v24, v26);

}

+ (id)entryViewButtonImageWithName:(id)a3 tintColor:(char)a4 shouldSuppressHairline:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  id v8;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  uint64_t v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  int v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  char v60;
  char v61;
  void *v62;
  int v63;
  unsigned __int8 v64;
  uint64_t v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  double v72;
  void *v73;
  int v74;
  void *v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  uint64_t v80;
  double v81;
  double v82;
  int v83;
  void *v84;
  double v85;
  void *v86;
  double v87;
  double v88;
  int v89;
  void *v90;
  int v91;
  double v92;
  CGFloat v93;
  void *v94;
  void *v95;
  int v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v103;
  id v104;
  void *v105;
  _BOOL4 v106;
  unsigned int v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  CGSize v115;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (entryViewButtonImageWithName_tintColor_shouldSuppressHairline__onceToken != -1)
    dispatch_once(&entryViewButtonImageWithName_tintColor_shouldSuppressHairline__onceToken, &__block_literal_global_129);
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "theme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if ((_DWORD)v6 == -1)
    objc_msgSend(v10, "entryFieldButtonColor");
  else
    objc_msgSend(v10, "sendButtonColorForColorType:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v12, "description");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@-%@"), v8, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)entryViewButtonImageWithName_tintColor_shouldSuppressHairline__sDictionary, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    goto LABEL_88;
  v104 = a1;
  v107 = v6;
  +[CKEntryViewButton imageNameForEntryViewButtonType:](CKEntryViewButton, "imageNameForEntryViewButtonType:", 7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKEntryViewButton imageNameForEntryViewButtonType:](CKEntryViewButton, "imageNameForEntryViewButtonType:", 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKEntryViewButton imageNameForEntryViewButtonType:](CKEntryViewButton, "imageNameForEntryViewButtonType:", 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKEntryViewButton imageNameForEntryViewButtonType:](CKEntryViewButton, "imageNameForEntryViewButtonType:", 5);
  v20 = objc_claimAutoreleasedReturnValue();
  +[CKEntryViewButton imageNameForEntryViewButtonType:](CKEntryViewButton, "imageNameForEntryViewButtonType:", 4);
  v21 = objc_claimAutoreleasedReturnValue();
  +[CKEntryViewButton imageNameForEntryViewButtonType:](CKEntryViewButton, "imageNameForEntryViewButtonType:", 8);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = (void *)v20;
  v106 = v5;
  v113 = (void *)v21;
  if (objc_msgSend(v8, "isEqualToString:", v20)
    || objc_msgSend(v8, "isEqualToString:", v21))
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", v8);
    v22 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v8, "isEqualToString:", v112))
      objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", v8);
    else
      objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", v8);
    v22 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v22;
  +[CKEntryViewButton imageNameForEntryViewButtonType:](CKEntryViewButton, "imageNameForEntryViewButtonType:", 1);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKEntryViewButton imageNameForEntryViewButtonType:](CKEntryViewButton, "imageNameForEntryViewButtonType:", 0);
  v24 = objc_claimAutoreleasedReturnValue();
  +[CKEntryViewButton imageNameForEntryViewButtonType:](CKEntryViewButton, "imageNameForEntryViewButtonType:", 3);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v108 = (void *)v24;
  if (objc_msgSend(v8, "isEqualToString:", v24))
  {
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 6, 3, 32.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "imageWithSymbolConfiguration:", v25);
    v26 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v26;
  }
  v111 = v19;
  if (objc_msgSend(v8, "isEqualToString:", v110))
  {
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 3, 3, 32.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithHierarchicalColor:", v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "configurationByApplyingConfiguration:", v28);
    v29 = v17;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "imageWithSymbolConfiguration:", v30);
    v31 = objc_claimAutoreleasedReturnValue();

    v17 = v29;
    v19 = v111;

    v23 = (void *)v31;
  }
  if (objc_msgSend(v8, "isEqualToString:", v109))
  {
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 6, 3, 20.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "imageWithSymbolConfiguration:", v32);
    v33 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v33;
  }
  if (objc_msgSend(v8, "isEqualToString:", v17))
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("stop.circle"));
    v34 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v34;
  }
  if (objc_msgSend(v8, "isEqualToString:", v18))
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("xmark.circle.fill"));
    v35 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v35;
  }
  if (objc_msgSend(v8, "isEqualToString:", v19) && CKIsRunningInMacCatalyst())
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", v8);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 4, 3, 16.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "imageWithSymbolConfiguration:", v37);
    v38 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v38;
  }
  if (objc_msgSend(v8, "isEqualToString:", v19))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "entryViewAppButtonImagePointSize");
    v41 = v40;

    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 4, 3, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "imageWithSymbolConfiguration:", v42);
    v43 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v43;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(v44, "isAudioMessagesEntryViewRecordingEnabled");

  if ((v45 & 1) == 0
    && objc_msgSend(v8, "isEqualToString:", v114)
    && CKIsRunningInMacCatalyst())
  {
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 6, 3, 16.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", v8);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "imageWithSymbolConfiguration:", v46);
    v48 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v48;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "isAudioMessagesEntryViewRecordingEnabled");

  if (v50 && objc_msgSend(v8, "isEqualToString:", v112))
  {
    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:weight:scale:", 5, -1, 15.5);
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "entryViewDictationButtonColor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithHierarchicalColor:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "configurationByApplyingConfiguration:", v53);
    v54 = v18;
    v55 = v12;
    v56 = v15;
    v57 = v17;
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "imageWithSymbolConfiguration:", v58);
    v59 = objc_claimAutoreleasedReturnValue();

    v17 = v57;
    v15 = v56;
    v12 = v55;
    v18 = v54;

    v23 = (void *)v59;
    v19 = v111;
  }
  if (!v23)
  {
    _IMWarn();
    v16 = 0;
    goto LABEL_87;
  }
  v60 = objc_msgSend(v8, "isEqualToString:", v19);
  if (v107 == 1)
    v61 = v60;
  else
    v61 = 0;
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "isAudioMessagesEntryViewRecordingEnabled");

  v64 = v63 | v61;
  if (v63 && (v61 & 1) == 0)
    v64 = objc_msgSend(v8, "isEqualToString:", v114);
  if (((CKIsRunningInMacCatalyst() == 0) & v64) != 0)
    v65 = 1;
  else
    v65 = 2;
  objc_msgSend(v23, "imageWithRenderingMode:", v65);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "size");
  v67 = v66;
  v69 = v68;
  if ((objc_msgSend(v8, "isEqualToString:", v113) & 1) != 0 || objc_msgSend(v8, "isEqualToString:", v114))
  {
    v70 = v111;
    if (!CKIsRunningInMacCatalyst())
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "sendButtonSize");
      v67 = v72;

      v69 = v67;
    }
  }
  else
  {
    v70 = v111;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_msgSend(v73, "isAudioMessagesEntryViewRecordingEnabled");

  if (v74)
  {
    if (objc_msgSend(v8, "isEqualToString:", v112))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "dictationButtonSize");
      v67 = v76;
      v69 = v77;

      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "entryViewDictationButtonColor");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "imageWithTintColor:", v79);
      v80 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v80;
      v70 = v111;
LABEL_56:

      goto LABEL_57;
    }
    if (objc_msgSend(v8, "isEqualToString:", v114))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v78, "audioButtonSize");
      v67 = v81;
      v69 = v82;
      goto LABEL_56;
    }
  }
LABEL_57:
  v83 = objc_msgSend(v8, "isEqualToString:", v113);
  if (CKIsRunningInMacCatalyst() && (objc_msgSend(v8, "isEqualToString:", v17) | v83) == 1)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v84, "stopButtonSize");
    v67 = v85;

    v69 = v67;
  }
  if (CKIsRunningInMacCatalyst() && objc_msgSend(v8, "isEqualToString:", v18))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "cancelButtonSize");
    v67 = v87;
    v69 = v88;

  }
  if (CKIsRunningInMacCatalyst())
  {
    if ((objc_msgSend(v8, "isEqualToString:", v70) & 1) != 0 || (objc_msgSend(v8, "isEqualToString:", v114) & 1) != 0)
      v89 = 0;
    else
      v89 = objc_msgSend(v8, "isEqualToString:", v110) ^ 1;
  }
  else
  {
    v89 = 1;
  }
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend(v90, "isAudioMessagesEntryViewRecordingEnabled");

  if (v91)
  {
    if ((objc_msgSend(v8, "isEqualToString:", v114) & 1) != 0
      || (objc_msgSend(v8, "isEqualToString:", v112) & 1) != 0
      || ((v89 ^ 1) & 1) != 0)
    {
      goto LABEL_82;
    }
LABEL_76:
    objc_msgSend(v23, "scale");
    v93 = v92;
    v115.width = v67;
    v115.height = v69;
    UIGraphicsBeginImageContextWithOptions(v115, 0, v93);
    objc_msgSend(v12, "set");
    objc_msgSend(v16, "drawInRect:", 0.0, 0.0, v67, v69);
    objc_msgSend(v104, "overlayImageForImageNamed:tintColor:", v8, v107);
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    if (v94)
    {
      v105 = v17;
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      v96 = objc_msgSend(v95, "isScheduledMessagesCoreEnabled");

      if (v96)
      {
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "theme");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "sendButtonArrowColorForColorType:", v107);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "set");

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "set");
      }

      objc_msgSend(v94, "drawInRect:", 0.0, 0.0, v67, v69);
      v17 = v105;
    }
    UIGraphicsGetImageFromCurrentImageContext();
    v100 = objc_claimAutoreleasedReturnValue();

    UIGraphicsEndImageContext();
    v16 = (void *)v100;
    goto LABEL_82;
  }
  if (v89)
    goto LABEL_76;
LABEL_82:
  v19 = v111;
  if (!CKIsRunningInMacCatalyst() && v106)
    objc_msgSend(v16, "_suppressesAccessibilityHairlineThickening");
  if (v16)
    objc_msgSend((id)entryViewButtonImageWithName_tintColor_shouldSuppressHairline__sDictionary, "setObject:forKey:", v16, v15);
LABEL_87:

  if (!v23)
  {
    v101 = 0;
    goto LABEL_89;
  }
LABEL_88:
  objc_msgSend(v16, "imageWithRenderingMode:", 1);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_89:

  return v101;
}

void __83__CKEntryViewButton_entryViewButtonImageWithName_tintColor_shouldSuppressHairline___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)entryViewButtonImageWithName_tintColor_shouldSuppressHairline__sDictionary;
  entryViewButtonImageWithName_tintColor_shouldSuppressHairline__sDictionary = (uint64_t)v0;

}

+ (id)overlayImageForImageNamed:(id)a3 tintColor:(char)a4
{
  unsigned int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a4;
  v5 = a3;
  v6 = 0;
  if (v4 <= 0xF && ((1 << v4) & 0x8003) != 0)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "entryViewSendButtonName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v5, "isEqualToString:", v8);

    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "ckImageNamed:", CFSTR("SendButtonPunchout"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  objc_msgSend(v6, "imageWithRenderingMode:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setCkTintColor:(char)a3
{
  if (self->_ckTintColor != a3)
  {
    self->_ckTintColor = a3;
    -[CKEntryViewButton setDefaultImage](self, "setDefaultImage");
  }
}

- (void)setWantsVibrancy:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  if (self->_wantsVibrancy != a3)
  {
    v3 = a3;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "entryViewButtonWantsVibrancy");

    if (v6)
    {
      self->_wantsVibrancy = v3;
      if (v3)
      {
        objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", 1100);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEABA8], "_effectForBlurEffect:vibrancyStyle:");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKEntryViewButton vibrancyView](self, "vibrancyView");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setEffect:", v7);

      }
      else
      {
        -[CKEntryViewButton vibrancyView](self, "vibrancyView");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setEffect:", 0);
      }

    }
  }
}

- (void)configureForAnimatableBlur
{
  self->_needsOversizedBlurContainer = 1;
  -[CKEntryViewButton setNeedsLayout](self, "setNeedsLayout");
}

- (void)setBlurRadius:(double)a3
{
  id v4;

  -[CKEntryViewButton blurrableButtonContainer](self, "blurrableButtonContainer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBlurRadius:", a3);

}

- (double)blurRadius
{
  void *v2;
  double v3;
  double v4;

  -[CKEntryViewButton blurrableButtonContainer](self, "blurrableButtonContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "blurRadius");
  v4 = v3;

  return v4;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CKEntryViewButton button](self, "button");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (BOOL)isEnabled
{
  void *v2;
  char v3;

  -[CKEntryViewButton button](self, "button");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (void)setDefaultImage
{
  -[CKEntryViewButton setTintedImageForButtonType:tintColor:](self, "setTintedImageForButtonType:tintColor:", -[CKEntryViewButton entryViewButtonType](self, "entryViewButtonType"), self->_ckTintColor);
}

- (void)setTintedImageForButtonType:(int64_t)a3 tintColor:(char)a4
{
  uint64_t v4;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v4 = a4;
  +[CKEntryViewButton imageNameForEntryViewButtonType:](CKEntryViewButton, "imageNameForEntryViewButtonType:");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[CKEntryViewButton setupCompositeFilterForButton](self, "setupCompositeFilterForButton");
  objc_msgSend((id)objc_opt_class(), "entryViewButtonImageWithName:tintColor:shouldSuppressHairline:", v12, v4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKEntryViewButton button](self, "button");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:forState:", v7, 0);

  if (a3 == 4)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;
  -[CKEntryViewButton button](self, "button");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:forState:", v10, 4);

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKEntryViewButton;
  -[CKEntryViewButton traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[CKEntryViewButton setupCompositeFilterForButton](self, "setupCompositeFilterForButton");
}

- (void)setupCompositeFilterForButton
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAudioMessagesEntryViewRecordingEnabled");

  if (v4 && -[CKEntryViewButton entryViewButtonType](self, "entryViewButtonType") == 8)
  {
    v14 = (id)*MEMORY[0x1E0CD2E98];
    -[CKEntryViewButton traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceStyle");

    if (v6 == 2)
    {
      v7 = (id)*MEMORY[0x1E0CD2EA0];

      v14 = v7;
    }
    -[CKEntryViewButton button](self, "button");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCompositingFilter:", v10);

    -[CKEntryViewButton button](self, "button");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAllowsGroupBlending:", 0);

  }
}

- (id)pointerInteraction:(id)a3 regionForLocation:(CGPoint)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4 modifiers:(int64_t)a5
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:", self);
  objc_msgSend(MEMORY[0x1E0CEA868], "effectWithPreview:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (char)ckTintColor
{
  return self->_ckTintColor;
}

- (BOOL)wantsVibrancy
{
  return self->_wantsVibrancy;
}

- (int64_t)entryViewButtonType
{
  return self->_entryViewButtonType;
}

- (void)setEntryViewButtonType:(int64_t)a3
{
  self->_entryViewButtonType = a3;
}

- (CKEntryViewBlurrableButtonContainer)blurrableButtonContainer
{
  return self->_blurrableButtonContainer;
}

- (void)setBlurrableButtonContainer:(id)a3
{
  objc_storeStrong((id *)&self->_blurrableButtonContainer, a3);
}

- (UIVisualEffectView)vibrancyView
{
  return self->_vibrancyView;
}

- (void)setVibrancyView:(id)a3
{
  objc_storeStrong((id *)&self->_vibrancyView, a3);
}

- (BOOL)needsOversizedBlurContainer
{
  return self->_needsOversizedBlurContainer;
}

- (void)setNeedsOversizedBlurContainer:(BOOL)a3
{
  self->_needsOversizedBlurContainer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vibrancyView, 0);
  objc_storeStrong((id *)&self->_blurrableButtonContainer, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
