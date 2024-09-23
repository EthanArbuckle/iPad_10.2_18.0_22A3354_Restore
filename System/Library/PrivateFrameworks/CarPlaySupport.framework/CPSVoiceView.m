@implementation CPSVoiceView

- (CPSVoiceView)initWithFrame:(CGRect)a3
{
  CPSAbridgableLabel *v3;
  uint64_t v4;
  CPSAbridgableLabel *titleLabel;
  uint64_t v6;
  UIImageView *imageView;
  CPSVoiceView *v9;
  id v10;
  CPSAbridgableLabel *v11;
  id v12;
  CPSAbridgableLabel *v13;
  id v14;
  CPSAbridgableLabel *v15;
  CPSAbridgableLabel *v16;
  CPSAbridgableLabel *v17;
  CPSAbridgableLabel *v18;
  id v19;
  CPSVoiceView *v20;
  CPSAbridgableLabel *v21;
  double *v22;
  UIImageView *v23;
  id v24;
  UIImageView *v25;
  UIImageView *v26;
  CPSVoiceView *v27;
  UIImageView *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  UIImageView *v34;
  id v35;
  id v36;
  id v37;
  UIImageView *v38;
  id v39;
  id v40;
  UIImageView *v41;
  id v42;
  id v43;
  UIImageView *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  CPSAbridgableLabel *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  CPSAbridgableLabel *v61;
  id v62;
  id v63;
  id v64;
  CPSAbridgableLabel *v65;
  id v66;
  id v67;
  id v68;
  CPSAbridgableLabel *v69;
  CPSVoiceView *v70;
  id v71;
  objc_super v72;
  SEL v73;
  CPSVoiceView *v74;
  CGRect v75;
  _QWORD v76[12];

  v76[11] = *MEMORY[0x24BDAC8D0];
  v75 = a3;
  v73 = a2;
  v74 = 0;
  v72.receiver = self;
  v72.super_class = (Class)CPSVoiceView;
  v70 = -[CPSVoiceView initWithFrame:](&v72, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v74 = v70;
  objc_storeStrong((id *)&v74, v70);
  if (v70)
  {
    -[CPSVoiceView setTranslatesAutoresizingMaskIntoConstraints:](v74, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
    -[CPSVoiceView setBackgroundColor:](v74, "setBackgroundColor:");

    v3 = [CPSAbridgableLabel alloc];
    v22 = (double *)MEMORY[0x24BDBF090];
    v4 = -[CPSAbridgableLabel initWithFrame:](v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    titleLabel = v74->_titleLabel;
    v74->_titleLabel = (CPSAbridgableLabel *)v4;

    v12 = -[CPSVoiceView _titleFont](v74, "_titleFont");
    v11 = -[CPSVoiceView titleLabel](v74, "titleLabel");
    -[CPSAbridgableLabel setFont:](v11, "setFont:", v12);

    v14 = (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v13 = -[CPSVoiceView titleLabel](v74, "titleLabel");
    -[CPSAbridgableLabel setBackgroundColor:](v13, "setBackgroundColor:", v14);

    v15 = -[CPSVoiceView titleLabel](v74, "titleLabel");
    -[CPSAbridgableLabel setTranslatesAutoresizingMaskIntoConstraints:](v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v16 = -[CPSVoiceView titleLabel](v74, "titleLabel");
    -[CPSAbridgableLabel setTextAlignment:](v16, "setTextAlignment:");

    v17 = -[CPSVoiceView titleLabel](v74, "titleLabel");
    -[CPSAbridgableLabel setNumberOfLines:](v17, "setNumberOfLines:", 2);

    v19 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v18 = -[CPSVoiceView titleLabel](v74, "titleLabel");
    -[CPSAbridgableLabel setTextColor:](v18, "setTextColor:", v19);

    v20 = v74;
    v21 = -[CPSVoiceView titleLabel](v74, "titleLabel");
    -[CPSVoiceView addSubview:](v20, "addSubview:");

    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithFrame:", *v22, v22[1], v22[2], v22[3]);
    imageView = v74->_imageView;
    v74->_imageView = (UIImageView *)v6;

    v24 = (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v23 = -[CPSVoiceView imageView](v74, "imageView");
    -[UIImageView setBackgroundColor:](v23, "setBackgroundColor:", v24);

    v25 = -[CPSVoiceView imageView](v74, "imageView");
    -[UIImageView setContentMode:](v25, "setContentMode:", 1);

    v26 = -[CPSVoiceView imageView](v74, "imageView");
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v27 = v74;
    v28 = -[CPSVoiceView imageView](v74, "imageView");
    -[CPSVoiceView addSubview:](v27, "addSubview:");

    v71 = objc_alloc_init(MEMORY[0x24BDF6B78]);
    -[CPSVoiceView addLayoutGuide:](v74, "addLayoutGuide:", v71);
    v29 = (void *)MEMORY[0x24BDD1628];
    v69 = -[CPSVoiceView titleLabel](v74, "titleLabel");
    v68 = (id)-[CPSAbridgableLabel topAnchor](v69, "topAnchor");
    v67 = (id)-[CPSVoiceView topAnchor](v74, "topAnchor");
    v66 = (id)objc_msgSend(v68, "constraintEqualToAnchor:constant:", 10.0);
    v76[0] = v66;
    v65 = -[CPSVoiceView titleLabel](v74, "titleLabel");
    v64 = (id)-[CPSAbridgableLabel leadingAnchor](v65, "leadingAnchor");
    v63 = (id)-[CPSVoiceView leadingAnchor](v74, "leadingAnchor");
    v62 = (id)objc_msgSend(v64, "constraintEqualToAnchor:constant:", 12.0);
    v76[1] = v62;
    v61 = -[CPSVoiceView titleLabel](v74, "titleLabel");
    v60 = (id)-[CPSAbridgableLabel trailingAnchor](v61, "trailingAnchor");
    v59 = (id)-[CPSVoiceView trailingAnchor](v74, "trailingAnchor");
    v58 = (id)objc_msgSend(v60, "constraintEqualToAnchor:constant:", -12.0);
    v76[2] = v58;
    v57 = (id)objc_msgSend(v71, "leadingAnchor");
    v56 = (id)-[CPSVoiceView leadingAnchor](v74, "leadingAnchor");
    v55 = (id)objc_msgSend(v57, "constraintEqualToAnchor:");
    v76[3] = v55;
    v54 = (id)objc_msgSend(v71, "trailingAnchor");
    v53 = (id)-[CPSVoiceView trailingAnchor](v74, "trailingAnchor");
    v52 = (id)objc_msgSend(v54, "constraintEqualToAnchor:");
    v76[4] = v52;
    v51 = (id)objc_msgSend(v71, "topAnchor");
    v50 = -[CPSVoiceView titleLabel](v74, "titleLabel");
    v49 = (id)-[CPSAbridgableLabel bottomAnchor](v50, "bottomAnchor");
    v48 = (id)objc_msgSend(v51, "constraintEqualToAnchor:");
    v76[5] = v48;
    v47 = (id)objc_msgSend(v71, "bottomAnchor");
    v46 = (id)-[CPSVoiceView bottomAnchor](v74, "bottomAnchor");
    v45 = (id)objc_msgSend(v47, "constraintEqualToAnchor:");
    v76[6] = v45;
    v44 = -[CPSVoiceView imageView](v74, "imageView");
    v43 = (id)-[UIImageView widthAnchor](v44, "widthAnchor");
    v42 = (id)objc_msgSend(v43, "constraintLessThanOrEqualToConstant:");
    v76[7] = v42;
    v41 = -[CPSVoiceView imageView](v74, "imageView");
    v40 = (id)-[UIImageView heightAnchor](v41, "heightAnchor");
    v39 = (id)objc_msgSend(v40, "constraintLessThanOrEqualToConstant:", 150.0);
    v76[8] = v39;
    v38 = -[CPSVoiceView imageView](v74, "imageView");
    v37 = (id)-[UIImageView centerXAnchor](v38, "centerXAnchor");
    v36 = (id)objc_msgSend(v71, "centerXAnchor");
    v35 = (id)objc_msgSend(v37, "constraintEqualToAnchor:");
    v76[9] = v35;
    v34 = -[CPSVoiceView imageView](v74, "imageView");
    v33 = (id)-[UIImageView centerYAnchor](v34, "centerYAnchor");
    v32 = (id)objc_msgSend(v71, "centerYAnchor");
    v31 = (id)objc_msgSend(v33, "constraintEqualToAnchor:");
    v76[10] = v31;
    v30 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v76, 11);
    objc_msgSend(v29, "activateConstraints:");

    objc_storeStrong(&v71, 0);
  }
  v9 = v74;
  objc_storeStrong((id *)&v74, 0);
  return v9;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v3;
  CPSAbridgableLabel *v4;
  objc_super v5;
  id location[2];
  CPSVoiceView *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)CPSVoiceView;
  -[CPSVoiceView traitCollectionDidChange:](&v5, sel_traitCollectionDidChange_, location[0]);
  v4 = -[CPSVoiceView titleLabel](v7, "titleLabel");
  v3 = -[CPSVoiceView _titleFont](v7, "_titleFont");
  -[CPSAbridgableLabel setFont:](v4, "setFont:");

  objc_storeStrong(location, 0);
}

- (id)_titleFont
{
  id v2;
  id v3;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13[3];
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v13[2] = self;
  v13[1] = (id)a2;
  v6 = (void *)MEMORY[0x24BDF6A78];
  v5 = *MEMORY[0x24BDF7850];
  v7 = (id)-[CPSVoiceView traitCollection](self, "traitCollection");
  v13[0] = (id)objc_msgSend(v6, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v5);

  v16 = *MEMORY[0x24BDF78A0];
  v8 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7868]);
  v17[0] = v8;
  v12 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16);

  v9 = v13[0];
  v14 = *MEMORY[0x24BDF7770];
  v15 = v12;
  v10 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
  v2 = (id)objc_msgSend(v9, "fontDescriptorByAddingAttributes:");
  v3 = v13[0];
  v13[0] = v2;

  v11 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v13[0], 0.0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(v13, 0);
  return v11;
}

- (CPSAbridgableLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
