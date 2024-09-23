@implementation CPSPausedCardView

- (CPSPausedCardView)initWithReason:(unint64_t)a3 title:(id)a4 backgroundColor:(id)a5
{
  CPSPausedCardView *v5;
  CPSPausedCardView *v7;
  CPSPausedCardView *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v40;
  char v41;
  id v42;
  id v43;
  objc_super v44;
  id v45;
  id location;
  unint64_t v47;
  SEL v48;
  CPSPausedCardView *v49;
  _QWORD v50[3];
  _QWORD v51[5];

  v51[4] = *MEMORY[0x24BDAC8D0];
  v49 = self;
  v48 = a2;
  v47 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v45 = 0;
  objc_storeStrong(&v45, a5);
  v5 = v49;
  v49 = 0;
  v44.receiver = v5;
  v44.super_class = (Class)CPSPausedCardView;
  v49 = -[CPSPausedCardView init](&v44, sel_init);
  objc_storeStrong((id *)&v49, v49);
  if (v49)
  {
    v43 = (id)objc_msgSend((id)objc_opt_class(), "createPlatterView");
    objc_msgSend(v43, "setBackgroundColor:", v45);
    objc_storeStrong((id *)&v49->_cardPlatterView, v43);
    -[CPSPausedCardView addSubview:](v49, "addSubview:", v43);
    v25 = (void *)MEMORY[0x24BDD1628];
    v38 = (id)objc_msgSend(v43, "leadingAnchor");
    v37 = (id)-[CPSPausedCardView leadingAnchor](v49, "leadingAnchor");
    v36 = (id)objc_msgSend(v38, "constraintEqualToAnchor:");
    v51[0] = v36;
    v35 = (id)objc_msgSend(v43, "topAnchor");
    v34 = (id)-[CPSPausedCardView topAnchor](v49, "topAnchor");
    v33 = (id)objc_msgSend(v35, "constraintEqualToAnchor:");
    v51[1] = v33;
    v32 = (id)objc_msgSend(v43, "trailingAnchor");
    v31 = (id)-[CPSPausedCardView trailingAnchor](v49, "trailingAnchor");
    v30 = (id)objc_msgSend(v32, "constraintEqualToAnchor:");
    v51[2] = v30;
    v29 = (id)objc_msgSend(v43, "bottomAnchor");
    v28 = (id)-[CPSPausedCardView bottomAnchor](v49, "bottomAnchor");
    v27 = (id)objc_msgSend(v29, "constraintEqualToAnchor:");
    v51[3] = v27;
    v26 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v51, 4);
    objc_msgSend(v25, "activateConstraints:");

    v42 = 0;
    v41 = 0;
    if (v47 - 1 <= 4)
      __asm { BR              X8 }
    if (!objc_msgSend(location, "length"))
      objc_storeStrong(&location, v42);
    -[CPSPausedCardView setTranslatesAutoresizingMaskIntoConstraints:](v49, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v40 = objc_alloc_init(MEMORY[0x24BDF6B68]);
    objc_msgSend(v40, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    objc_msgSend(v40, "setTextColor:");

    objc_msgSend(v40, "setTextAlignment:", 1);
    v13 = (id)objc_msgSend((id)objc_opt_class(), "titleFont");
    objc_msgSend(v40, "setFont:");

    objc_msgSend(v40, "setText:", location);
    objc_msgSend(v40, "setNumberOfLines:", 2);
    objc_msgSend(v40, "setMinimumScaleFactor:", 0.7);
    objc_msgSend(v40, "setAdjustsFontSizeToFitWidth:", 1);
    objc_storeStrong((id *)&v49->_title, v40);
    objc_msgSend(v43, "addSubview:", v40);
    v14 = (void *)MEMORY[0x24BDD1628];
    v24 = (id)objc_msgSend(v40, "leadingAnchor");
    v23 = (id)-[CPSPausedCardView leadingAnchor](v49, "leadingAnchor");
    v22 = (id)objc_msgSend(v24, "constraintEqualToAnchor:constant:", 9.0);
    v50[0] = v22;
    v21 = (id)objc_msgSend(v40, "trailingAnchor");
    v20 = (id)-[CPSPausedCardView trailingAnchor](v49, "trailingAnchor");
    v19 = (id)objc_msgSend(v21, "constraintEqualToAnchor:constant:", -9.0);
    v50[1] = v19;
    v18 = (id)objc_msgSend(v40, "topAnchor");
    v17 = (id)-[CPSPausedCardView topAnchor](v49, "topAnchor");
    v16 = (id)objc_msgSend(v18, "constraintEqualToAnchor:constant:", 10.0);
    v50[2] = v16;
    v15 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 3);
    objc_msgSend(v14, "activateConstraints:");

    v8 = v49;
    v11 = (id)objc_msgSend(v40, "bottomAnchor");
    v10 = (id)-[CPSPausedCardView bottomAnchor](v49, "bottomAnchor");
    v9 = (id)objc_msgSend(v11, "constraintEqualToAnchor:constant:", -10.0);
    -[CPSPausedCardView addConstraint:](v8, "addConstraint:");

    objc_storeStrong(&v40, 0);
    objc_storeStrong(&v42, 0);
    objc_storeStrong(&v43, 0);
  }
  v7 = v49;
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v49, 0);
  return v7;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  id v5;
  UIFont *v6;
  UILabel *v7;
  NSString *v8;
  UILabel *v9;
  double v10;
  CGSize result;
  CGRect v13;
  CGRect v14;

  -[CPSPausedCardView bounds](self, "bounds");
  v10 = CGRectGetWidth(v13) - 18.0;
  v9 = -[CPSPausedCardView title](self, "title");
  v8 = -[UILabel text](v9, "text");
  v7 = -[CPSPausedCardView title](self, "title");
  v6 = -[UILabel font](v7, "font");
  v5 = (id)-[CPSPausedCardView traitCollection](self, "traitCollection");
  objc_msgSend(v5, "displayScale");
  CPSSizeForText(v8, v6, 0, v10, v2);

  -[CPSPausedCardView bounds](self, "bounds");
  CGRectGetWidth(v14);
  CGSizeMake();
  result.height = v4;
  result.width = v3;
  return result;
}

+ (id)titleFont
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "systemFontOfSize:weight:", 16.0, *MEMORY[0x24BDF7888], a2, a1);
}

+ (id)createPlatterView
{
  return objc_alloc_init(CPSCardPlatterView);
}

- (CPSCardPlatterView)cardPlatterView
{
  return self->_cardPlatterView;
}

- (void)setCardPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_cardPlatterView, a3);
}

- (UILabel)title
{
  return self->_title;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_cardPlatterView, 0);
}

@end
