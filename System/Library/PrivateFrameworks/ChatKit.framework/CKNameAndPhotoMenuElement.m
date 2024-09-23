@implementation CKNameAndPhotoMenuElement

+ (id)menuElementWithNickname:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;
  _QWORD v8[4];
  id v9;

  v8[1] = 3221225472;
  v8[2] = __53__CKNameAndPhotoMenuElement_menuElementWithNickname___block_invoke;
  v8[3] = &unk_1E274BD98;
  v9 = a3;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___CKNameAndPhotoMenuElement;
  v8[0] = MEMORY[0x1E0C809B0];
  v4 = v9;
  objc_msgSendSuper2(&v7, sel_elementWithViewProvider_, v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __53__CKNameAndPhotoMenuElement_menuElementWithNickname___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  CKAvatarView *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CKAvatarView *v17;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C97360]);
  objc_msgSend(*(id *)(a1 + 32), "firstName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGivenName:", v3);

  objc_msgSend(*(id *)(a1 + 32), "lastName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFamilyName:", v4);

  v5 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(*(id *)(a1 + 32), "avatar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageFilePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithContentsOfFile:", v7);
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v2, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v8;
  v37 = v2;
  if (v8)
  {
    v10 = (CKAvatarView *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v8);
    -[CKAvatarView setContentMode:](v10, "setContentMode:", 1);
    -[CKAvatarView layer](v10, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCornerRadius:", 25.0);

    -[CKAvatarView layer](v10, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setMasksToBounds:", 1);

    v13 = *MEMORY[0x1E0C9D648];
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    v17 = [CKAvatarView alloc];
    v13 = *MEMORY[0x1E0C9D648];
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v16 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = -[CKAvatarView initWithFrame:](v17, "initWithFrame:", *MEMORY[0x1E0C9D648], v14, v15, v16);
    -[CKAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[CNAvatarView setContact:](v10, "setContact:", v2);
  }
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v13, v14, v15, v16);
  objc_msgSend(v18, "setText:", v9);
  objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:weight:", *MEMORY[0x1E0CEB540], *MEMORY[0x1E0DC1420]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFont:", v19);

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA700]), "initWithFrame:", v13, v14, v15, v16);
  CKFrameworkBundle();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("NAME_AND_PHOTO_MENU"), &stru_1E276D870, CFSTR("ChatKit"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setText:", v22);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFont:", v23);

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTextColor:", v24);

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA9E0]), "initWithFrame:", v13, v14, v15, v16);
  objc_msgSend(v25, "setAxis:", 1);
  objc_msgSend(v25, "setAlignment:", 1);
  v35 = v18;
  objc_msgSend(v25, "addArrangedSubview:", v18);
  objc_msgSend(v25, "setCustomSpacing:afterView:", v18, 2.0);
  objc_msgSend(v25, "addArrangedSubview:", v20);
  objc_msgSend(v25, "setCustomSpacing:afterView:", v20, 12.0);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA9E0]), "initWithFrame:", v13, v14, v15, v16);
  objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v26, "setAxis:", 0);
  objc_msgSend(v26, "setAlignment:", 3);
  objc_msgSend(v26, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v26, "setDirectionalLayoutMargins:", 12.0, 12.0, 12.0, 12.0);
  objc_msgSend(v26, "addArrangedSubview:", v10);
  objc_msgSend(v26, "setCustomSpacing:afterView:", v10, 9.0);
  objc_msgSend(v26, "addArrangedSubview:", v25);
  v27 = (void *)MEMORY[0x1E0CB3718];
  -[CKAvatarView widthAnchor](v10, "widthAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToConstant:", 50.0);
  v34 = (void *)v9;
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v29;
  -[CKAvatarView heightAnchor](v10, "heightAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToConstant:", 50.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activateConstraints:", v32);

  return v26;
}

@end
