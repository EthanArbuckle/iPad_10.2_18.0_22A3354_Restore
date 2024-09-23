@implementation _SFURLTextPreviewView

- (_SFURLTextPreviewView)initWithURL:(id)a3
{
  id v4;
  _SFURLTextPreviewView *v5;
  UILabel *v6;
  UILabel *domainLabel;
  void *v8;
  void *v9;
  UILabel *v10;
  UILabel *urlLabel;
  void *v12;
  void *v13;
  uint64_t v14;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _SFURLTextPreviewView *v30;
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
  id v47;
  objc_super v48;
  _QWORD v49[9];

  v49[7] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v48.receiver = self;
  v48.super_class = (Class)_SFURLTextPreviewView;
  v5 = -[_SFURLTextPreviewView init](&v48, sel_init);
  if (v5)
  {
    v47 = v4;
    v6 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    domainLabel = v5->_domainLabel;
    v5->_domainLabel = v6;

    -[UILabel setClipsToBounds:](v5->_domainLabel, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v5->_domainLabel, "setBackgroundColor:", v8);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_domainLabel, "setTextColor:", v9);

    -[UILabel setOpaque:](v5->_domainLabel, "setOpaque:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_domainLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v5->_domainLabel, "setNumberOfLines:", 1);
    -[UILabel setLineBreakMode:](v5->_domainLabel, "setLineBreakMode:", 4);
    -[_SFURLTextPreviewView addSubview:](v5, "addSubview:", v5->_domainLabel);
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    urlLabel = v5->_urlLabel;
    v5->_urlLabel = v10;

    -[UILabel setClipsToBounds:](v5->_urlLabel, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v5->_urlLabel, "setBackgroundColor:", v12);

    -[UILabel setOpaque:](v5->_urlLabel, "setOpaque:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_urlLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setNumberOfLines:](v5->_urlLabel, "setNumberOfLines:", 3);
    -[UILabel setLineBreakMode:](v5->_urlLabel, "setLineBreakMode:", 4);
    v13 = (void *)MEMORY[0x1E0DC37E8];
    v14 = *MEMORY[0x1E0DC4B10];
    objc_msgSend(MEMORY[0x1E0DC37F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0DC4B10]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fontDescriptorWithSymbolicTraits:", 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fontWithDescriptor:size:", v16, 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_domainLabel, "setFont:", v17);

    objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5->_urlLabel, "setFont:", v18);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_urlLabel, "setTextColor:", v19);

    -[_SFURLTextPreviewView addSubview:](v5, "addSubview:", v5->_urlLabel);
    -[_SFURLTextPreviewView layoutMarginsGuide](v5, "layoutMarginsGuide");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1E0CB3718];
    -[UILabel leadingAnchor](v5->_domainLabel, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFURLTextPreviewView leadingAnchor](v5, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v44;
    -[UILabel trailingAnchor](v5->_domainLabel, "trailingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFURLTextPreviewView trailingAnchor](v5, "trailingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v42);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v49[1] = v41;
    -[UILabel leadingAnchor](v5->_urlLabel, "leadingAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFURLTextPreviewView leadingAnchor](v5, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "constraintEqualToAnchor:", v39);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v49[2] = v37;
    -[UILabel trailingAnchor](v5->_urlLabel, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFURLTextPreviewView trailingAnchor](v5, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v34);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v49[3] = v33;
    v38 = v20;
    objc_msgSend(v20, "bottomAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v5->_urlLabel, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintGreaterThanOrEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v49[4] = v22;
    -[UILabel topAnchor](v5->_domainLabel, "topAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "topAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v49[5] = v25;
    -[UILabel topAnchor](v5->_urlLabel, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v5->_domainLabel, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v27, 1.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v49[6] = v28;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 7);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "activateConstraints:", v29);

    v4 = v47;
    -[_SFURLTextPreviewView setURL:](v5, "setURL:", v47);
    v30 = v5;

  }
  return v5;
}

- (void)setURL:(id)a3
{
  id v5;
  void *v6;
  void *v7;

  objc_storeStrong((id *)&self->_URL, a3);
  v5 = a3;
  objc_msgSend(v5, "_lp_simplifiedDisplayString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_domainLabel, "setText:", v6);

  objc_msgSend(v5, "_lp_userVisibleString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](self->_urlLabel, "setText:", v7);

  -[_SFURLTextPreviewView setNeedsLayout](self, "setNeedsLayout");
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_urlLabel, 0);
  objc_storeStrong((id *)&self->_domainLabel, 0);
}

@end
