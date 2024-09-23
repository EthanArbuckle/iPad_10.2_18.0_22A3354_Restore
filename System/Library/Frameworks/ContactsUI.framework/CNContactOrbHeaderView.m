@implementation CNContactOrbHeaderView

+ (id)descriptorForRequiredKeysForContactFormatter:(id)a3 includingAvatarViewDescriptors:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(a1, "descriptorForRequiredKeysIncludingAvatarViewDescriptors:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayWithObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  v9 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactOrbHeaderView descriptorForRequiredKeysForContactFormatter:includingAvatarViewDescriptors:]");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "descriptorWithKeyDescriptors:description:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)descriptorForRequiredKeysIncludingAvatarViewDescriptors:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[22];

  v3 = a3;
  v23[21] = *MEMORY[0x1E0C80C00];
  +[CNMonogrammer descriptorForRequiredKeysIncludingImage:](CNMonogrammer, "descriptorForRequiredKeysIncludingImage:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 1, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C96790];
  v23[1] = v5;
  v23[2] = v6;
  v7 = *MEMORY[0x1E0C96780];
  v23[3] = *MEMORY[0x1E0C966D0];
  v23[4] = v7;
  v8 = *MEMORY[0x1E0C96820];
  v23[5] = *MEMORY[0x1E0C966C0];
  v23[6] = v8;
  v9 = *MEMORY[0x1E0C967A0];
  v23[7] = *MEMORY[0x1E0C96798];
  v23[8] = v9;
  v10 = *MEMORY[0x1E0C967E0];
  v23[9] = *MEMORY[0x1E0C967D8];
  v23[10] = v10;
  v11 = *MEMORY[0x1E0C96828];
  v23[11] = *MEMORY[0x1E0C967D0];
  v23[12] = v11;
  v12 = *MEMORY[0x1E0C967B8];
  v23[13] = *MEMORY[0x1E0C96830];
  v23[14] = v12;
  v13 = *MEMORY[0x1E0C96898];
  v23[15] = *MEMORY[0x1E0C967E8];
  v23[16] = v13;
  v14 = *MEMORY[0x1E0C96758];
  v23[17] = *MEMORY[0x1E0C96698];
  v23[18] = v14;
  v15 = *MEMORY[0x1E0C96890];
  v23[19] = *MEMORY[0x1E0C96700];
  v23[20] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 21);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    +[CNAvatarView descriptorForRequiredKeysWithThreeDTouchEnabled:](CNAvatarView, "descriptorForRequiredKeysWithThreeDTouchEnabled:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "arrayByAddingObject:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v18;
  }
  v19 = (void *)MEMORY[0x1E0C97200];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[CNContactOrbHeaderView descriptorForRequiredKeysIncludingAvatarViewDescriptors:]");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "descriptorWithKeyDescriptors:description:", v16, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (CNContactOrbHeaderView)initWithContact:(id)a3 frame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  char *v10;
  CNContactPhotoView *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  uint64_t v37;
  void *v38;
  double v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  objc_super v48;
  id v49;
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[3];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v53[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v48.receiver = self;
  v48.super_class = (Class)CNContactOrbHeaderView;
  v10 = -[CNContactOrbHeaderView initWithFrame:](&v48, sel_initWithFrame_, x, y, width, height);
  *(_OWORD *)(v10 + 520) = xmmword_18AF8B850;
  *(_OWORD *)(v10 + 536) = xmmword_18AF8B860;
  v11 = [CNContactPhotoView alloc];
  +[CNUIContactsEnvironment currentEnvironment](CNUIContactsEnvironment, "currentEnvironment");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cachingLikenessRenderer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CNContactPhotoView initWithFrame:shouldAllowTakePhotoAction:threeDTouchEnabled:contactStore:allowsImageDrops:imageRenderer:](v11, "initWithFrame:shouldAllowTakePhotoAction:threeDTouchEnabled:contactStore:allowsImageDrops:imageRenderer:", 0, 0, 0, 0, v13, x, y, width, height);
  v15 = (void *)*((_QWORD *)v10 + 56);
  *((_QWORD *)v10 + 56) = v14;

  objc_msgSend(*((id *)v10 + 56), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v10, "addSubview:", *((_QWORD *)v10 + 56));
  v16 = *MEMORY[0x1E0DC4AD0];
  v17 = *MEMORY[0x1E0DC1140];
  v52[0] = CFSTR("ABTextStyleAttributeName");
  v52[1] = v17;
  v53[0] = v16;
  +[CNUIColorRepository contactStyleDefaultTextColor](CNUIColorRepository, "contactStyleDefaultTextColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 2);
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)*((_QWORD *)v10 + 59);
  *((_QWORD *)v10 + 59) = v19;

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v10, sel_handleNameLabelLongPress_);
  v22 = objc_alloc(MEMORY[0x1E0DC3990]);
  v23 = *MEMORY[0x1E0C9D648];
  v24 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v25 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v26 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v27 = objc_msgSend(v22, "initWithFrame:", *MEMORY[0x1E0C9D648], v24, v25, v26);
  v28 = (void *)*((_QWORD *)v10 + 61);
  *((_QWORD *)v10 + 61) = v27;

  objc_msgSend(*((id *)v10 + 61), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*((id *)v10 + 61), "setTextAlignment:", 4);
  objc_msgSend(*((id *)v10 + 61), "setNumberOfLines:", 2);
  objc_msgSend(*((id *)v10 + 61), "setUserInteractionEnabled:", 1);
  objc_msgSend(v10, "tintColor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)v10 + 61), "setHighlightedTextColor:", v29);

  LODWORD(v30) = 1148829696;
  objc_msgSend(*((id *)v10 + 61), "setContentHuggingPriority:forAxis:", 1, v30);
  LODWORD(v31) = 1148829696;
  objc_msgSend(*((id *)v10 + 61), "setContentCompressionResistancePriority:forAxis:", 1, v31);
  objc_msgSend(*((id *)v10 + 61), "addGestureRecognizer:", v21);
  objc_msgSend(*((id *)v10 + 61), "_cnui_applyContactStyle");
  objc_msgSend(*((id *)v10 + 61), "setAb_textAttributes:", *((_QWORD *)v10 + 59));
  objc_msgSend(v10, "addSubview:", *((_QWORD *)v10 + 61));
  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", v10, sel_handleNameLabelLongPress_);
  v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v23, v24, v25, v26);
  v34 = (void *)*((_QWORD *)v10 + 62);
  *((_QWORD *)v10 + 62) = v33;

  objc_msgSend(*((id *)v10 + 62), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*((id *)v10 + 62), "setTextAlignment:", 4);
  objc_msgSend(*((id *)v10 + 62), "setNumberOfLines:", 0);
  objc_msgSend(*((id *)v10 + 62), "setUserInteractionEnabled:", 1);
  objc_msgSend(v10, "tintColor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*((id *)v10 + 62), "setHighlightedTextColor:", v35);

  LODWORD(v36) = 1148829696;
  objc_msgSend(*((id *)v10 + 62), "setContentCompressionResistancePriority:forAxis:", 1, v36);
  objc_msgSend(*((id *)v10 + 62), "addGestureRecognizer:", v32);
  objc_msgSend(*((id *)v10 + 62), "_cnui_applyContactStyle");
  objc_msgSend(v10, "addSubview:", *((_QWORD *)v10 + 62));
  v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v23, v24, v25, v26);
  v38 = (void *)*((_QWORD *)v10 + 63);
  *((_QWORD *)v10 + 63) = v37;

  objc_msgSend(*((id *)v10 + 63), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(*((id *)v10 + 63), "setTextAlignment:", 4);
  objc_msgSend(*((id *)v10 + 63), "setText:", CFSTR("X"));
  objc_msgSend(*((id *)v10 + 63), "setHidden:", 1);
  LODWORD(v39) = 1148829696;
  objc_msgSend(*((id *)v10 + 63), "setContentHuggingPriority:forAxis:", 1, v39);
  objc_msgSend(v10, "addSubview:", *((_QWORD *)v10 + 63));
  v40 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v23, v24, v25, v26);
  v41 = (void *)*((_QWORD *)v10 + 64);
  *((_QWORD *)v10 + 64) = v40;

  objc_msgSend(*((id *)v10 + 64), "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v10, "addSubview:", *((_QWORD *)v10 + 64));
  v42 = *MEMORY[0x1E0DC4B10];
  v50[1] = v17;
  v51[0] = v42;
  v50[0] = CFSTR("ABTextStyleAttributeName");
  +[CNUIColorRepository contactStyleDefaultTextColor](CNUIColorRepository, "contactStyleDefaultTextColor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v43;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTaglineTextAttributes:", v44);

  objc_msgSend(v10, "updateFontSizes");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "addObserver:selector:name:object:", v10, sel_menuWillHide_, *MEMORY[0x1E0DC5048], 0);

  objc_msgSend(v10, "setNeedsUpdateConstraints");
  if (v9)
  {
    v49 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateWithContacts:", v46);

  }
  else
  {
    objc_msgSend(v10, "updateWithContacts:", MEMORY[0x1E0C9AA60]);
  }

  return (CNContactOrbHeaderView *)v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CNContactOrbHeaderView;
  -[CNContactOrbHeaderView dealloc](&v4, sel_dealloc);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CNContactOrbHeaderView reloadData](self, "reloadData");
  v14.receiver = self;
  v14.super_class = (Class)CNContactOrbHeaderView;
  *(float *)&v10 = a4;
  *(float *)&v11 = a5;
  -[CNContactOrbHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v14, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v10, v11);
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  UILabel *nameLabel;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  id *p_taglineLabel;
  void *v39;
  void *v40;
  id v41;
  double v42;
  UILabel *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  UILabel *fakeTaglineAlignmentLabel;
  double v58;
  uint64_t v59;
  CNContactOrbHeaderView *v60;
  uint64_t v61;
  double v62;
  UILabel *v63;
  double v64;
  void *v65;
  void *v66;
  char v67;
  void *v68;
  UILabel *v69;
  void *v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  double v77;
  void *v78;
  BOOL v79;
  UILabel **p_fakeTaglineAlignmentLabel;
  void *v81;
  void *v82;
  UIView *markerView;
  void *v84;
  void *v85;
  void *v86;
  double v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  double v92;
  void *v93;
  void *v94;
  objc_super v95;
  _QWORD v96[2];
  _QWORD v97[2];
  _QWORD v98[3];
  _QWORD v99[3];
  const __CFString *v100;
  void *v101;
  _QWORD v102[3];
  _QWORD v103[3];
  _QWORD v104[2];
  _QWORD v105[4];

  v105[2] = *MEMORY[0x1E0C80C00];
  -[CNContactOrbHeaderView reloadData](self, "reloadData");
  v95.receiver = self;
  v95.super_class = (Class)CNContactOrbHeaderView;
  -[CNContactOrbHeaderView updateConstraints](&v95, sel_updateConstraints);
  -[CNContactOrbHeaderView headerConstraints](self, "headerConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[CNContactOrbHeaderView headerConstraints](self, "headerConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

    -[CNContactOrbHeaderView headerConstraints](self, "headerConstraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllObjects");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNContactOrbHeaderView setHeaderConstraints:](self, "setHeaderConstraints:", v6);
  }

  nameLabel = self->_nameLabel;
  v104[0] = CFSTR("name");
  v104[1] = CFSTR("photo");
  v105[0] = nameLabel;
  -[CNContactOrbHeaderView photoView](self, "photoView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v105[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, v104, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactOrbHeaderView photoView](self, "photoView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isHidden");

  v13 = (void *)MEMORY[0x1E0CB3718];
  if ((v12 & 1) != 0)
  {
    v96[0] = CFSTR("leftMargin");
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[CNContactOrbHeaderView contentMargins](self, "contentMargins");
    objc_msgSend(v14, "numberWithDouble:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v96[1] = CFSTR("rightMargin");
    v97[0] = v16;
    v17 = (void *)MEMORY[0x1E0CB37E8];
    -[CNContactOrbHeaderView contentMargins](self, "contentMargins");
    objc_msgSend(v17, "numberWithDouble:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v97[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, v96, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(leftMargin)-[name]-(rightMargin)-|"), 0, v20, v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v21);
  }
  else
  {
    v102[0] = CFSTR("topMargin");
    v22 = (void *)MEMORY[0x1E0CB37E8];
    -[CNContactOrbHeaderView contentMargins](self, "contentMargins");
    objc_msgSend(v22, "numberWithDouble:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v103[0] = v23;
    v102[1] = CFSTR("bottomMargin");
    v24 = (void *)MEMORY[0x1E0CB37E8];
    -[CNContactOrbHeaderView contentMargins](self, "contentMargins");
    objc_msgSend(v24, "numberWithDouble:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v102[2] = CFSTR("photoSize");
    v103[1] = v26;
    v103[2] = &unk_1E20D2C78;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v103, v102, 3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = CFSTR("photo");
    -[CNContactOrbHeaderView photoView](self, "photoView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v101 = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v101, &v100, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=topMargin)-[photo(photoSize)]-(>=bottomMargin)-|"), 0, v27, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v30);

    v31 = (void *)MEMORY[0x1E0CB3718];
    v98[0] = CFSTR("leftMargin");
    v32 = (void *)MEMORY[0x1E0CB37E8];
    -[CNContactOrbHeaderView contentMargins](self, "contentMargins");
    objc_msgSend(v32, "numberWithDouble:", v33);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v99[0] = v16;
    v98[1] = CFSTR("photoLabelSpacing");
    v34 = (void *)MEMORY[0x1E0CB37E8];
    -[CNContactOrbHeaderView photoLabelSpacing](self, "photoLabelSpacing");
    objc_msgSend(v34, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v99[1] = v19;
    v98[2] = CFSTR("rightMargin");
    v35 = (void *)MEMORY[0x1E0CB37E8];
    -[CNContactOrbHeaderView contentMargins](self, "contentMargins");
    objc_msgSend(v35, "numberWithDouble:", v36);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v99[2] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-(leftMargin)-[photo]-(photoLabelSpacing)-[name]-(rightMargin)-|"), 0, v21, v9);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v37);

  }
  p_taglineLabel = (id *)&self->_taglineLabel;
  -[UILabel text](self->_taglineLabel, "text");
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = (void *)MEMORY[0x1E0CB3718];
  if (v39)
  {
    v41 = *p_taglineLabel;
    -[CNContactOrbHeaderView contentMargins](self, "contentMargins");
    objc_msgSend(v40, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 4, 1, v41, 4, 1.0, v42);
    v43 = (UILabel *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v43);
    objc_msgSend(*p_taglineLabel, "font");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "_scaledValueForValue:", 20.0);
    v46 = v45;

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *p_taglineLabel, 12, 0, self->_nameLabel, 11, 1.0, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v47);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *p_taglineLabel, 5, 0, self->_nameLabel, 5, 1.0, 0.0);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v48);

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *p_taglineLabel, 6, 0, self->_nameLabel, 6, 1.0, 0.0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v49);

    -[CNContactOrbHeaderView photoView](self, "photoView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "isHidden");

    -[UILabel font](self->_nameLabel, "font");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if ((v51 & 1) != 0)
    {
      objc_msgSend(v52, "_scaledValueForValue:", 40.0);
      v55 = v54;

      v56 = (void *)MEMORY[0x1E0CB3718];
      fakeTaglineAlignmentLabel = self->_nameLabel;
      v58 = 1.0;
      v59 = 12;
      v60 = self;
      v61 = 3;
      v62 = v55;
    }
    else
    {
      objc_msgSend(v52, "_scaledValueForValue:", 24.0);
      v74 = v73;

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_nameLabel, 12, 1, self, 3, 1.0, v74);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v75);

      objc_msgSend(v10, "lastObject");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v77) = 1148829696;
      objc_msgSend(v76, "setPriority:", v77);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_markerView, 3, 0, self->_nameLabel, 3, 1.0, 0.0);
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v78);

      v79 = -[CNContactOrbHeaderView centersPhotoAndLabels](self, "centersPhotoAndLabels");
      p_fakeTaglineAlignmentLabel = &self->_taglineLabel;
      if (!v79)
        p_fakeTaglineAlignmentLabel = &self->_fakeTaglineAlignmentLabel;
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_markerView, 4, 0, *p_fakeTaglineAlignmentLabel, 4, 1.0, 0.0);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v81);

      v82 = (void *)MEMORY[0x1E0CB3718];
      markerView = self->_markerView;
      -[CNContactOrbHeaderView photoView](self, "photoView");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", markerView, 10, 0, v84, 10, 1.0, 0.0);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v85);

      objc_msgSend(v10, "lastObject");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v87) = 1148813312;
      objc_msgSend(v86, "setPriority:", v87);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_fakeTaglineAlignmentLabel, 5, 0, *p_taglineLabel, 5, 1.0, 0.0);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v88);

      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_fakeTaglineAlignmentLabel, 6, 0, *p_taglineLabel, 6, 1.0, 0.0);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v89);

      v56 = (void *)MEMORY[0x1E0CB3718];
      fakeTaglineAlignmentLabel = self->_fakeTaglineAlignmentLabel;
      v60 = (CNContactOrbHeaderView *)*p_taglineLabel;
      v58 = 1.0;
      v62 = 0.0;
      v59 = 3;
      v61 = 3;
    }
  }
  else
  {
    v63 = self->_nameLabel;
    -[CNContactOrbHeaderView contentMargins](self, "contentMargins");
    objc_msgSend(v40, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, 4, 1, v63, 4, 1.0, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v65);

    -[CNContactOrbHeaderView photoView](self, "photoView");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v66, "isHidden");

    v68 = (void *)MEMORY[0x1E0CB3718];
    v69 = self->_nameLabel;
    if ((v67 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_nameLabel, 12, 0, self, 3, 1.0, 40.0);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v70);

      v71 = (void *)MEMORY[0x1E0CB3718];
      -[CNContactOrbHeaderView nameLabel](self, "nameLabel");
      v43 = (UILabel *)objc_claimAutoreleasedReturnValue();
      -[CNContactOrbHeaderView contentMargins](self, "contentMargins");
      v62 = v72;
    }
    else
    {
      -[CNContactOrbHeaderView photoView](self, "photoView");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v69, 10, 0, v90, 10, 1.0, 0.0);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v91);

      v71 = (void *)MEMORY[0x1E0CB3718];
      -[CNContactOrbHeaderView photoView](self, "photoView");
      v43 = (UILabel *)objc_claimAutoreleasedReturnValue();
      -[CNContactOrbHeaderView contentMargins](self, "contentMargins");
      v62 = -v92;
    }
    v58 = 1.0;
    v56 = v71;
    fakeTaglineAlignmentLabel = v43;
    v59 = 4;
    v60 = self;
    v61 = 4;
  }
  objc_msgSend(v56, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", fakeTaglineAlignmentLabel, v59, 0, v60, v61, v58, v62);
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v93);

  -[CNContactOrbHeaderView headerConstraints](self, "headerConstraints");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "addObjectsFromArray:", v10);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v10);
}

- (void)updateWithContacts:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray **p_contacts;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((-[NSArray isEqual:](self->_contacts, "isEqual:", v5) & 1) == 0)
  {
    p_contacts = &self->_contacts;
    v15 = a3;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
          objc_msgSend((id)objc_opt_class(), "descriptorForRequiredKeysIncludingAvatarViewDescriptors:", 1, p_contacts, v15, (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v12;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "assertKeysAreAvailable:", v13);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v8);
    }

    objc_storeStrong((id *)p_contacts, v15);
    -[CNContactPhotoView setContacts:](self->_photoView, "setContacts:", v6);
    -[CNContactOrbHeaderView setHidden:](self, "setHidden:", objc_msgSend(v6, "count") == 0);
  }
  -[CNContactOrbHeaderView reloadData](self, "reloadData", p_contacts, v15);

}

- (void)updateFontSizes
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v14 = *MEMORY[0x1E0DC1138];
  v3 = v14;
  v4 = (void *)MEMORY[0x1E0DC1350];
  -[CNContactOrbHeaderView nameTextAttributes](self, "nameTextAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("ABTextStyleAttributeName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ab_preferredRowFontForTextStyle:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("nameTextAttributes"), v8);

  v9 = *MEMORY[0x1E0DC4B10];
  v12[1] = v3;
  v13[0] = v9;
  v12[0] = CFSTR("ABTextStyleAttributeName");
  objc_msgSend(MEMORY[0x1E0DC1350], "ab_preferredFontForTextStyle:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject cn_updateDictionaryForKey:withChanges:](self, "cn_updateDictionaryForKey:withChanges:", CFSTR("taglineTextAttributes"), v11);

}

- (void)setContentMargins:(UIEdgeInsets)a3
{
  if (self->_contentMargins.left != a3.left
    || self->_contentMargins.top != a3.top
    || self->_contentMargins.right != a3.right
    || self->_contentMargins.bottom != a3.bottom)
  {
    self->_contentMargins = a3;
    -[CNContactOrbHeaderView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)reloadData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  -[CNContactPhotoView resetPhoto](self->_photoView, "resetPhoto");
  -[CNContactOrbHeaderView contacts](self, "contacts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactOrbHeaderView _headerStringForContacts:](self, "_headerStringForContacts:", v3);
  v17 = (id)objc_claimAutoreleasedReturnValue();

  -[CNContactOrbHeaderView contacts](self, "contacts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNContactOrbHeaderView _taglineStringForContacts:](self, "_taglineStringForContacts:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CNContactOrbHeaderView message](self, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", v6))
  {
    v7 = objc_msgSend(v17, "length");

    if (v7)
      goto LABEL_5;
    v6 = v17;
    v17 = v5;
    v5 = 0;
  }

LABEL_5:
  if (!objc_msgSend(v5, "length"))
  {

    v5 = 0;
  }
  -[UILabel text](self->_nameLabel, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    if (!v8)
      goto LABEL_17;
  }
  else if (v8)
  {

    goto LABEL_17;
  }
  -[UILabel text](self->_taglineLabel, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v10 = v9 == 0;
  else
    v10 = v9 != 0;
  if (v17)
  {

    if (!v10)
      goto LABEL_18;
    goto LABEL_17;
  }
  if (v10)
LABEL_17:
    -[CNContactOrbHeaderView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
LABEL_18:
  -[UILabel setAb_text:](self->_nameLabel, "setAb_text:", v17);
  -[UILabel setAb_text:](self->_taglineLabel, "setAb_text:", v5);
  -[CNContactOrbHeaderView photoView](self, "photoView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isHidden");
  -[CNContactOrbHeaderView contacts](self, "contacts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v13, "count") > 1)
  {
    objc_msgSend(v11, "setHidden:", 0);
  }
  else
  {
    -[CNContactOrbHeaderView contacts](self, "contacts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "imageDataAvailable") & 1) != 0)
      v16 = 0;
    else
      v16 = -[CNContactOrbHeaderView alwaysShowsMonogram](self, "alwaysShowsMonogram") ^ 1;
    objc_msgSend(v11, "setHidden:", v16);

  }
  if (v12 != objc_msgSend(v11, "isHidden"))
    -[CNContactOrbHeaderView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");

}

- (double)photoLabelSpacing
{
  return 16.0;
}

- (void)setMessage:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_message != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_message, a3);
    -[CNContactOrbHeaderView reloadData](self, "reloadData");
    v5 = v6;
  }

}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNContactOrbHeaderView;
  -[CNContactOrbHeaderView tintColorDidChange](&v5, sel_tintColorDidChange);
  -[CNContactOrbHeaderView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setHighlightedTextColor:](self->_nameLabel, "setHighlightedTextColor:", v3);

  -[CNContactOrbHeaderView tintColor](self, "tintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setHighlightedTextColor:](self->_taglineLabel, "setHighlightedTextColor:", v4);

}

- (void)setTaglineTextAttributes:(id)a3
{
  NSDictionary *v5;

  v5 = (NSDictionary *)a3;
  if (self->_taglineTextAttributes != v5)
  {
    objc_storeStrong((id *)&self->_taglineTextAttributes, a3);
    -[UILabel setAb_textAttributes:](self->_taglineLabel, "setAb_textAttributes:", v5);
    -[UILabel setAb_textAttributes:](self->_fakeTaglineAlignmentLabel, "setAb_textAttributes:", v5);
  }

}

- (void)setNameTextAttributes:(id)a3
{
  NSDictionary *v5;

  v5 = (NSDictionary *)a3;
  if (self->_nameTextAttributes != v5)
  {
    objc_storeStrong((id *)&self->_nameTextAttributes, a3);
    -[UILabel setAb_textAttributes:](self->_nameLabel, "setAb_textAttributes:", v5);
  }

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)copy:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[UILabel text](self->_nameLabel, "text", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v4, "mutableCopy");

  -[UILabel text](self->_taglineLabel, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UILabel text](self->_taglineLabel, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR("\n%@"), v6);

  }
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setString:", v8);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  return sel_copy_ == a3;
}

- (id)_headerStringForContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  if (objc_msgSend(v4, "count") == 1)
  {
    -[CNContactOrbHeaderView contactFormatter](self, "contactFormatter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromContact:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  if (!objc_msgSend(v7, "length"))
  {
    -[CNContactOrbHeaderView alternateName](self, "alternateName");
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }

  return v7;
}

- (id)_taglineStringForContacts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;

  v4 = a3;
  if (objc_msgSend(v4, "count") != 1)
  {
    v8 = objc_msgSend(v4, "count");

    +[CNNumberFormatting localizedStringWithInteger:](CNNumberFormatting, "localizedStringWithInteger:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB3940];
    CNContactsUIBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CARD_NAME_GROUP_MEMBERS_COUNT-%@"), &stru_1E20507A8, CFSTR("Localized"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v11, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "contactType") == 1)
  {
    objc_msgSend(v5, "organizationName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_12;
    objc_msgSend(v5, "personName");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  objc_msgSend(v5, "personName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v12, "length"))
  {

    goto LABEL_19;
  }
  -[CNContactOrbHeaderView alternateName](self, "alternateName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
LABEL_19:
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v5, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      objc_msgSend(v6, "appendString:", v10);
    objc_msgSend(v5, "nickname");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "length");

    if (v21)
    {
      if (objc_msgSend(v6, "length"))
        objc_msgSend(v6, "appendString:", CFSTR("\n"));
      CNContactsUIBundle();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CARD_NAME_NICKNAME_FORMAT-%@"), &stru_1E20507A8, CFSTR("Localized"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "nickname");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", v23, v24);

    }
    objc_msgSend(v5, "previousFamilyName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "length");

    if (v26)
    {
      if (objc_msgSend(v6, "length"))
        objc_msgSend(v6, "appendString:", CFSTR("\n"));
      objc_msgSend(v5, "previousFamilyName");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendString:", v27);

    }
    objc_msgSend(v5, "jobTitle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "length");

    if (v29)
    {
      if (objc_msgSend(v6, "length"))
        objc_msgSend(v6, "appendString:", CFSTR("\n"));
      objc_msgSend(v5, "jobTitle");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendString:", v30);

    }
    objc_msgSend(v5, "departmentName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "length");

    if (v32)
    {
      objc_msgSend(v5, "jobTitle");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "length");

      if (v34)
      {
        CNContactsUIBundle();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("CARD_NAME_JOB_TITLE_DEPARMENT_SEPARATOR"), &stru_1E20507A8, CFSTR("Localized"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "appendString:", v36);
      }
      else if (objc_msgSend(v6, "length"))
      {
        objc_msgSend(v6, "appendString:", CFSTR("\n"));
      }
      objc_msgSend(v5, "departmentName");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendString:", v37);

    }
    objc_msgSend(v5, "organizationName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_msgSend(v38, "length");

    if (!v39)
      goto LABEL_7;
    if (objc_msgSend(v6, "length"))
      objc_msgSend(v6, "appendString:", CFSTR("\n"));
    objc_msgSend(v5, "organizationName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendString:", v11);
LABEL_6:

LABEL_7:
    goto LABEL_12;
  }
  -[CNContactOrbHeaderView alternateName](self, "alternateName");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_11:
  v6 = (void *)v7;
LABEL_12:

  -[CNContactOrbHeaderView message](self, "message");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "length");

  if (v15)
  {
    if (objc_msgSend(v6, "length"))
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      -[CNContactOrbHeaderView message](self, "message");
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("%@\n%@"), v6, v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v17;
    }
    else
    {
      -[CNContactOrbHeaderView message](self, "message");
      v18 = objc_claimAutoreleasedReturnValue();
    }

    v6 = (void *)v18;
  }
  return v6;
}

- (void)handleNameLabelLongPress:(id)a3
{
  UILabel *nameLabel;
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
  void *v17;
  double v18;
  id v19;

  if (-[CNContactOrbHeaderView becomeFirstResponder](self, "becomeFirstResponder", a3))
  {
    objc_msgSend(MEMORY[0x1E0DC39D8], "sharedMenuController");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    nameLabel = self->_nameLabel;
    -[UILabel bounds](nameLabel, "bounds");
    -[UILabel textRectForBounds:limitedToNumberOfLines:](nameLabel, "textRectForBounds:limitedToNumberOfLines:", -[UILabel numberOfLines](self->_nameLabel, "numberOfLines"), v5, v6, v7, v8);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[UILabel text](self->_taglineLabel, "text");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      -[UILabel bounds](self->_taglineLabel, "bounds");
      v16 = v16 + v18;
    }
    objc_msgSend(v19, "setTargetRect:inView:", self->_nameLabel, v10, v12, v14, v16);
    objc_msgSend(v19, "setMenuVisible:animated:", 1, 1);
    -[UILabel setHighlighted:](self->_nameLabel, "setHighlighted:", 1);
    -[UILabel setHighlighted:](self->_taglineLabel, "setHighlighted:", 1);

  }
}

- (void)menuWillHide:(id)a3
{
  -[UILabel setHighlighted:](self->_nameLabel, "setHighlighted:", 0);
  -[UILabel setHighlighted:](self->_taglineLabel, "setHighlighted:", 0);
}

- (UIEdgeInsets)contentMargins
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentMargins.top;
  left = self->_contentMargins.left;
  bottom = self->_contentMargins.bottom;
  right = self->_contentMargins.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CNContactFormatter)contactFormatter
{
  return self->_contactFormatter;
}

- (void)setContactFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_contactFormatter, a3);
}

- (NSString)alternateName
{
  return self->_alternateName;
}

- (void)setAlternateName:(id)a3
{
  objc_storeStrong((id *)&self->_alternateName, a3);
}

- (NSString)message
{
  return self->_message;
}

- (BOOL)centersPhotoAndLabels
{
  return self->_centersPhotoAndLabels;
}

- (void)setCentersPhotoAndLabels:(BOOL)a3
{
  self->_centersPhotoAndLabels = a3;
}

- (CNContactPhotoView)photoView
{
  return self->_photoView;
}

- (BOOL)alwaysShowsMonogram
{
  return self->_alwaysShowsMonogram;
}

- (void)setAlwaysShowsMonogram:(BOOL)a3
{
  self->_alwaysShowsMonogram = a3;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (NSMutableArray)headerConstraints
{
  return self->_headerConstraints;
}

- (void)setHeaderConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_headerConstraints, a3);
}

- (NSDictionary)nameTextAttributes
{
  return self->_nameTextAttributes;
}

- (NSDictionary)taglineTextAttributes
{
  return self->_taglineTextAttributes;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UILabel)taglineLabel
{
  return self->_taglineLabel;
}

- (void)setTaglineLabel:(id)a3
{
  objc_storeStrong((id *)&self->_taglineLabel, a3);
}

- (UILabel)fakeTaglineAlignmentLabel
{
  return self->_fakeTaglineAlignmentLabel;
}

- (void)setFakeTaglineAlignmentLabel:(id)a3
{
  objc_storeStrong((id *)&self->_fakeTaglineAlignmentLabel, a3);
}

- (UIView)markerView
{
  return self->_markerView;
}

- (void)setMarkerView:(id)a3
{
  objc_storeStrong((id *)&self->_markerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_markerView, 0);
  objc_storeStrong((id *)&self->_fakeTaglineAlignmentLabel, 0);
  objc_storeStrong((id *)&self->_taglineLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_storeStrong((id *)&self->_taglineTextAttributes, 0);
  objc_storeStrong((id *)&self->_nameTextAttributes, 0);
  objc_storeStrong((id *)&self->_headerConstraints, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_photoView, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_alternateName, 0);
  objc_storeStrong((id *)&self->_contactFormatter, 0);
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

@end
