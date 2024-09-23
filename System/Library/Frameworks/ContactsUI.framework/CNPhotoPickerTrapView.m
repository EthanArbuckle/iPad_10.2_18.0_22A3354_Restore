@implementation CNPhotoPickerTrapView

- (CNPhotoPickerTrapView)initWithFrame:(CGRect)a3
{
  CNPhotoPickerTrapView *v3;
  void *v4;
  id v5;
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
  objc_super v41;
  _QWORD v42[4];
  uint64_t v43;
  void *v44;
  uint64_t v45;
  _QWORD v46[3];

  v46[1] = *MEMORY[0x1E0C80C00];
  v41.receiver = self;
  v41.super_class = (Class)CNPhotoPickerTrapView;
  v3 = -[CNPhotoPickerTrapView initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerTrapView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v5 = objc_alloc(MEMORY[0x1E0DC3990]);
    v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[CNPhotoPickerTrapView setLabel:](v3, "setLabel:", v6);

    -[CNPhotoPickerTrapView label](v3, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerTrapView label](v3, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTextColor:", v8);

    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4AB8]);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = *MEMORY[0x1E0DC13C0];
    v43 = *MEMORY[0x1E0DC13E8];
    v44 = &unk_1E20D2E20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v46[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "fontDescriptorByAddingAttributes:", v11);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v39, 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerTrapView label](v3, "label");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFont:", v12);

    -[CNPhotoPickerTrapView label](v3, "label");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNumberOfLines:", 0);

    -[CNPhotoPickerTrapView label](v3, "label");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTextAlignment:", 1);

    -[CNPhotoPickerTrapView label](v3, "label");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerTrapView addSubview:](v3, "addSubview:", v16);

    -[CNPhotoPickerTrapView label](v3, "label");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "widthAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerTrapView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "widthAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintLessThanOrEqualToAnchor:multiplier:constant:", v35, 1.0, -20.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v34;
    -[CNPhotoPickerTrapView label](v3, "label");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "heightAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerTrapView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "heightAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintLessThanOrEqualToAnchor:multiplier:constant:", v30, 1.0, -20.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v42[1] = v29;
    -[CNPhotoPickerTrapView label](v3, "label");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "centerXAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerTrapView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "centerXAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v42[2] = v19;
    -[CNPhotoPickerTrapView label](v3, "label");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "centerYAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNPhotoPickerTrapView safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "centerYAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v42[3] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v25);
  }
  return v3;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSArray)constraints
{
  return (NSArray *)objc_getProperty(self, a2, 424, 1);
}

- (void)setConstraints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 424);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
