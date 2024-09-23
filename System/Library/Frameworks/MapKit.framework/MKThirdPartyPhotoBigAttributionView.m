@implementation MKThirdPartyPhotoBigAttributionView

- (MKThirdPartyPhotoBigAttributionView)initWithContext:(int64_t)a3
{
  MKThirdPartyPhotoBigAttributionView *v3;
  id v4;
  uint64_t v5;
  UIView *labelsView;
  void *v7;
  _MKUILabel *v8;
  _MKUILabel *v9;
  void *v10;
  _MKUILabel *firstLineLabel;
  _MKUILabel *v12;
  _MKUILabel *v13;
  _MKUILabel *v14;
  void *v15;
  _MKUILabel *secondLineLabel;
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
  _MKUILabel *v52;
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
  objc_super v68;
  _QWORD v69[16];

  v69[14] = *MEMORY[0x1E0C80C00];
  v68.receiver = self;
  v68.super_class = (Class)MKThirdPartyPhotoBigAttributionView;
  v3 = -[MKPhotoBigAttributionView initWithContext:](&v68, sel_initWithContext_, a3);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    labelsView = v3->_labelsView;
    v3->_labelsView = (UIView *)v5;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v3->_labelsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MKPhotoBigAttributionView contentView](v3, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v3->_labelsView);

    v8 = [_MKUILabel alloc];
    -[MKThirdPartyPhotoBigAttributionView bounds](v3, "bounds");
    v9 = -[_MKUILabel initWithFrame:](v8, "initWithFrame:");
    -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

    -[_MKUILabel setTextAlignment:](v9, "setTextAlignment:", 1);
    -[_MKUILabel setNumberOfLines:](v9, "setNumberOfLines:", 2);
    firstLineLabel = v3->_firstLineLabel;
    v3->_firstLineLabel = v9;
    v12 = v9;

    v13 = [_MKUILabel alloc];
    -[MKThirdPartyPhotoBigAttributionView bounds](v3, "bounds");
    v14 = -[_MKUILabel initWithFrame:](v13, "initWithFrame:");
    -[_MKUILabel setTranslatesAutoresizingMaskIntoConstraints:](v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel setBackgroundColor:](v14, "setBackgroundColor:", v15);

    -[_MKUILabel setTextAlignment:](v14, "setTextAlignment:", 1);
    -[_MKUILabel setNumberOfLines:](v14, "setNumberOfLines:", 2);
    secondLineLabel = v3->_secondLineLabel;
    v3->_secondLineLabel = v14;
    v52 = v14;

    -[UIView addSubview:](v3->_labelsView, "addSubview:", v3->_firstLineLabel);
    -[UIView addSubview:](v3->_labelsView, "addSubview:", v3->_secondLineLabel);
    -[MKPhotoBigAttributionView contentView](v3, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)MEMORY[0x1E0CB3718];
    -[UIView topAnchor](v3->_labelsView, "topAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "constraintGreaterThanOrEqualToAnchor:", v66);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v65;
    -[UIView bottomAnchor](v3->_labelsView, "bottomAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bottomAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintLessThanOrEqualToAnchor:", v63);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v69[1] = v62;
    -[UIView leadingAnchor](v3->_labelsView, "leadingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "constraintEqualToAnchor:", v60);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v69[2] = v59;
    -[UIView trailingAnchor](v3->_labelsView, "trailingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "trailingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "constraintEqualToAnchor:", v57);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v69[3] = v56;
    -[UIView centerYAnchor](v3->_labelsView, "centerYAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "centerYAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", v54);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v69[4] = v53;
    -[_MKUILabel topAnchor](v3->_firstLineLabel, "topAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v3->_labelsView, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "constraintEqualToAnchor:", v50);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v69[5] = v49;
    -[_MKUILabel leadingAnchor](v3->_firstLineLabel, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v3->_labelsView, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v69[6] = v45;
    -[_MKUILabel trailingAnchor](v3->_firstLineLabel, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v3->_labelsView, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v43);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v69[7] = v42;
    -[_MKUILabel topAnchor](v3->_secondLineLabel, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKUILabel bottomAnchor](v3->_firstLineLabel, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:constant:", v39, 2.0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v69[8] = v38;
    -[_MKUILabel bottomAnchor](v3->_secondLineLabel, "bottomAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v3->_labelsView, "bottomAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "constraintEqualToAnchor:", v36);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v69[9] = v35;
    -[_MKUILabel leadingAnchor](v3->_secondLineLabel, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v3->_labelsView, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v69[10] = v32;
    -[_MKUILabel trailingAnchor](v3->_secondLineLabel, "trailingAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v3->_labelsView, "trailingAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "constraintEqualToAnchor:", v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v69[11] = v29;
    -[MKPhotoBigAttributionView spinner](v3, "spinner");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "centerXAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v17;
    v41 = v17;
    objc_msgSend(v17, "centerXAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v69[12] = v22;
    -[MKPhotoBigAttributionView spinner](v3, "spinner");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "centerYAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "centerYAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v69[13] = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 14);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "activateConstraints:", v27);

  }
  return v3;
}

- (void)updateInfoAttributionString
{
  int64_t v3;
  id v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v3 = -[MKPhotoBigAttributionView type](self, "type");
  v4 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v3)
    v5 = CFSTR("More photos");
  else
    v5 = CFSTR("Add a photo");
  _MKLocalizedStringFromThisBundle(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CEA098];
  v31[0] = *MEMORY[0x1E0CEA098];
  -[MKThirdPartyPhotoBigAttributionView firstLineLabelFont](self, "firstLineLabelFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v8;
  v9 = *MEMORY[0x1E0CEA0A0];
  v31[1] = *MEMORY[0x1E0CEA0A0];
  objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v4, "initWithString:attributes:", v6, v11);

  v13 = (void *)objc_msgSend(v12, "copy");
  -[_MKUILabel setAttributedText:](self->_firstLineLabel, "setAttributedText:", v13);

  -[MKPhotoBigAttributionView mapItem](self, "mapItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_mapkit_preferredFirstPhotoVendor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "providerName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "length"))
  {
    v17 = objc_alloc(MEMORY[0x1E0CB3498]);
    v18 = (void *)MEMORY[0x1E0CB3940];
    _MKLocalizedStringFromThisBundle(CFSTR("PlaceCardPhotosBigAttribution"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "providerName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v17, "initWithString:", v21);

    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttributedString:", v22);
    v24 = objc_msgSend(v22, "length");
    v29[0] = v7;
    -[MKThirdPartyPhotoBigAttributionView secondLineLabelFont](self, "secondLineLabelFont");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v9;
    v30[0] = v25;
    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addAttributes:range:", v27, 0, v24);

    v28 = (void *)objc_msgSend(v23, "copy");
    -[_MKUILabel setAttributedText:](self->_secondLineLabel, "setAttributedText:", v28);

  }
}

- (id)firstLineLabelFont
{
  void *v2;
  double v3;

  v2 = -[MKPhotoBigAttributionView context](self, "context");
  if (!v2)
  {
    v3 = 15.0;
    goto LABEL_5;
  }
  if (v2 == (void *)1)
  {
    v3 = 20.0;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", v3, *MEMORY[0x1E0CEB5F8]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)secondLineLabelFont
{
  void *v2;
  double v3;

  v2 = -[MKPhotoBigAttributionView context](self, "context");
  if (!v2)
  {
    v3 = 13.0;
    goto LABEL_5;
  }
  if (v2 == (void *)1)
  {
    v3 = 17.0;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", v3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)willStartAnimatingActivityIndicatorView
{
  -[UIView setAlpha:](self->_labelsView, "setAlpha:", 0.0);
}

- (void)didEndAnimatingActivityIndicatorView
{
  -[UIView setAlpha:](self->_labelsView, "setAlpha:", 1.0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelsView, 0);
  objc_storeStrong((id *)&self->_secondLineLabel, 0);
  objc_storeStrong((id *)&self->_firstLineLabel, 0);
}

@end
