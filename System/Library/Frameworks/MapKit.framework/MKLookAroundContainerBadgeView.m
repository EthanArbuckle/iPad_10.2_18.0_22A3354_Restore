@implementation MKLookAroundContainerBadgeView

- (MKLookAroundContainerBadgeView)initWithFrame:(CGRect)a3
{
  MKLookAroundContainerBadgeView *v3;
  MKLookAroundContainerBadgeView *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _MKUILabel *v16;
  uint64_t v17;
  _MKUILabel *label;
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
  MKLookAroundContainerBadgeView *v32;
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
  objc_super v48;
  _QWORD v49[6];
  _QWORD v50[3];
  _QWORD v51[5];

  v51[3] = *MEMORY[0x1E0C80C00];
  v48.receiver = self;
  v48.super_class = (Class)MKLookAroundContainerBadgeView;
  v3 = -[MKLookAroundContainerBadgeView initWithFrame:](&v48, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MKLookAroundContainerBadgeView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("LookAroundContainerBadge"));
    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("binoculars.fill"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA258], "textAttachmentWithImage:", v47);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x1E0CEA240]);
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorWithAlphaComponent:", 0.5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShadowColor:", v7);

    objc_msgSend(v5, "setShadowBlurRadius:", 4.0);
    v45 = v5;
    objc_msgSend(v5, "setShadowOffset:", 0.0, 1.0);
    objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v46);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    v10 = (void *)MEMORY[0x1E0CEA5E8];
    v11 = *MEMORY[0x1E0CEB590];
    objc_msgSend(MEMORY[0x1E0CEAB40], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0CEB420]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferredFontForTextStyle:compatibleWithTraitCollection:", v11, v12);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *MEMORY[0x1E0CEA098];
    v50[0] = *MEMORY[0x1E0CEA0F0];
    v50[1] = v13;
    v51[0] = v5;
    v51[1] = v44;
    v50[2] = *MEMORY[0x1E0CEA0A0];
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v51[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v9;
    objc_msgSend(v9, "addAttributes:range:", v15, 0, objc_msgSend(v9, "length"));

    v16 = [_MKUILabel alloc];
    v17 = -[_MKUILabel initWithFrame:](v16, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    label = v4->_label;
    v4->_label = (_MKUILabel *)v17;

    -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[_MKUILabel setAttributedText:](v4->_label, "setAttributedText:", v9);
    -[_MKUILabel setTextAlignment:](v4->_label, "setTextAlignment:", 1);
    -[MKLookAroundContainerBadgeView addSubview:](v4, "addSubview:", v4->_label);
    -[_MKUILabel systemLayoutSizeFittingSize:](v4->_label, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0CEB980], *(double *)(MEMORY[0x1E0CEB980] + 8));
    v20 = v19;
    v22 = v21;
    v36 = (void *)MEMORY[0x1E0CB3718];
    -[_MKUILabel topAnchor](v4->_label, "topAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKLookAroundContainerBadgeView topAnchor](v4, "topAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, -2.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v40;
    -[_MKUILabel bottomAnchor](v4->_label, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKLookAroundContainerBadgeView bottomAnchor](v4, "bottomAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:constant:", v38, 6.0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v37;
    -[_MKUILabel leadingAnchor](v4->_label, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKLookAroundContainerBadgeView leadingAnchor](v4, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:constant:", v34, -6.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2] = v23;
    -[_MKUILabel trailingAnchor](v4->_label, "trailingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKLookAroundContainerBadgeView trailingAnchor](v4, "trailingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:constant:", v25, 6.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v49[3] = v26;
    -[_MKUILabel widthAnchor](v4->_label, "widthAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToConstant:", v20 + 8.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v49[4] = v28;
    -[_MKUILabel heightAnchor](v4->_label, "heightAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToConstant:", v22 + 8.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v49[5] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "activateConstraints:", v31);

    v32 = v4;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
