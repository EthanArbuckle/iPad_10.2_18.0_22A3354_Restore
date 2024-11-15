@implementation CNSharedProfileUpdateMenuElement

+ (id)elementWithTitle:(id)a3 subtitle:(id)a4 avatarImage:(id)a5 selected:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  objc_super v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  BOOL v22;

  v10 = a3;
  v11 = a4;
  v18[1] = 3221225472;
  v18[2] = __83__CNSharedProfileUpdateMenuElement_elementWithTitle_subtitle_avatarImage_selected___block_invoke;
  v18[3] = &unk_1E2049270;
  v19 = a5;
  v20 = v10;
  v21 = v11;
  v22 = a6;
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___CNSharedProfileUpdateMenuElement;
  v18[0] = MEMORY[0x1E0C809B0];
  v12 = v11;
  v13 = v10;
  v14 = v19;
  objc_msgSendSuper2(&v17, sel_elementWithViewProvider_, v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __83__CNSharedProfileUpdateMenuElement_elementWithTitle_subtitle_avatarImage_selected___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
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
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
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
  _QWORD v56[11];

  v56[9] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  objc_msgSend(v8, "setText:", *(_QWORD *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v8;
  objc_msgSend(v8, "setFont:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v4, v5, v6, v7);
  objc_msgSend(v10, "setText:", *(_QWORD *)(a1 + 48));
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B08]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v11);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v12);

  v54 = v10;
  objc_msgSend(v10, "setNumberOfLines:", 2);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithFrame:", v4, v5, v6, v7);
  objc_msgSend(v13, "setAxis:", 1);
  objc_msgSend(v13, "setAlignment:", 1);
  objc_msgSend(v13, "addArrangedSubview:", v8);
  v51 = v13;
  objc_msgSend(v13, "addArrangedSubview:", v10);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CA8]), "initWithFrame:", v4, v5, v6, v7);
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v14, "setAxis:", 0);
  objc_msgSend(v14, "setAlignment:", 3);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithFrame:", v4, v5, v6, v7);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4AD0], 1);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v53);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "imageWithTintColor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "imageWithRenderingMode:", 1);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setImage:", v52);
  v19 = 1.0;
  if (!*(_BYTE *)(a1 + 56))
    v19 = 0.0;
  objc_msgSend(v15, "setAlpha:", v19);
  objc_msgSend(v15, "setContentMode:", 1);
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v14, "addArrangedSubview:", v15);
  v38 = v15;
  objc_msgSend(v14, "setCustomSpacing:afterView:", v15, 6.0);
  objc_msgSend(v14, "addArrangedSubview:", v13);
  v50 = v2;
  objc_msgSend(v14, "addArrangedSubview:", v2);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v4, v5, v6, v7);
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v20, "addSubview:", v14);
  objc_msgSend(v2, "widthAnchor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "constraintEqualToConstant:", 28.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v48;
  objc_msgSend(v2, "heightAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widthAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v45;
  objc_msgSend(v2, "centerYAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centerYAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v42;
  objc_msgSend(v14, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:constant:", v40, -16.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v56[3] = v39;
  objc_msgSend(v14, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "topAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:constant:", v36, 12.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v56[4] = v35;
  objc_msgSend(v14, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, -12.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v56[5] = v31;
  objc_msgSend(v14, "centerYAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v56[6] = v22;
  objc_msgSend(v14, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "leadingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, 12.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v56[7] = v25;
  objc_msgSend(v15, "centerYAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "centerYAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v56[8] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 9);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v32);
  return v20;
}

@end
