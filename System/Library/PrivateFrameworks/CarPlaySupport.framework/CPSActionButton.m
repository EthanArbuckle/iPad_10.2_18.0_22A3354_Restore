@implementation CPSActionButton

- (CPSActionButton)initWithFrame:(CGRect)a3
{
  CPSActionButton *v4;
  objc_super v5;
  SEL v6;
  CPSActionButton *v7;
  CGRect v8;

  v8 = a3;
  v6 = a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)CPSActionButton;
  v7 = -[CPSButton initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v7, v7);
  if (v7)
  {
    -[CPSActionButton setupViews](v7, "setupViews");
    -[CPSActionButton setupLayoutConstraints](v7, "setupLayoutConstraints");
  }
  v4 = v7;
  objc_storeStrong((id *)&v7, 0);
  return v4;
}

- (void)layoutSubviews
{
  objc_super v2;
  SEL v3;
  CPSActionButton *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSActionButton;
  -[CPSActionButton layoutSubviews](&v2, sel_layoutSubviews);
  -[CPSActionButton updateViews](v4, "updateViews");
}

- (void)setButtonImage:(id)a3
{
  int v3;
  char v4;
  NSData *v5;
  char v6;
  NSData *v7;
  id location[2];
  UIImage **v9;

  v9 = (UIImage **)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = 0;
  v4 = 0;
  LOBYTE(v3) = 0;
  if (v9[101] != location[0])
  {
    v7 = UIImagePNGRepresentation(v9[101]);
    v6 = 1;
    v5 = UIImagePNGRepresentation((UIImage *)location[0]);
    v4 = 1;
    v3 = -[NSData isEqual:](v7, "isEqual:") ^ 1;
  }
  if ((v4 & 1) != 0)

  if ((v6 & 1) != 0)
  if ((v3 & 1) != 0)
  {
    objc_storeStrong((id *)v9 + 101, location[0]);
    objc_msgSend(v9, "resetLayoutConstraints");
    objc_msgSend(v9, "updateViews");
  }
  objc_storeStrong(location, 0);
}

- (void)setButtonText:(id)a3
{
  id location[2];
  CPSActionButton *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (!-[NSString isEqualToString:](v4->_buttonText, "isEqualToString:", location[0]))
  {
    objc_storeStrong((id *)&v4->_buttonText, location[0]);
    -[CPSActionButton resetLayoutConstraints](v4, "resetLayoutConstraints");
    -[CPSActionButton updateViews](v4, "updateViews");
  }
  objc_storeStrong(location, 0);
}

- (void)setupViews
{
  id v2;
  UIImageView *v3;
  UIImageView *v4;
  id v5;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  UILabel *v9;
  id v10;
  UILabel *v11;
  UILabel *v12;
  UIImageView *v13;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", 0);
  -[CPSActionButton setButtonImageView:](self, "setButtonImageView:");

  v3 = -[CPSActionButton buttonImageView](self, "buttonImageView");
  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = -[CPSActionButton buttonImageView](self, "buttonImageView");
  -[UIImageView setIsAccessibilityElement:](v4, "setIsAccessibilityElement:", 0);

  v5 = objc_alloc_init(MEMORY[0x24BDF6B68]);
  -[CPSActionButton setButtonLabel:](self, "setButtonLabel:");

  v6 = -[CPSActionButton buttonLabel](self, "buttonLabel");
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v7 = -[CPSActionButton buttonLabel](self, "buttonLabel");
  -[UILabel setNumberOfLines:](v7, "setNumberOfLines:", 1);

  v8 = -[CPSActionButton buttonLabel](self, "buttonLabel");
  -[UILabel setAdjustsFontForContentSizeCategory:](v8, "setAdjustsFontForContentSizeCategory:", 1);

  v10 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemSecondaryColor");
  v9 = -[CPSActionButton buttonLabel](self, "buttonLabel");
  -[UILabel setTextColor:](v9, "setTextColor:", v10);

  v11 = -[CPSActionButton buttonLabel](self, "buttonLabel");
  -[UILabel setIsAccessibilityElement:](v11, "setIsAccessibilityElement:", 0);

  -[CPSActionButton _updateLayout](self, "_updateLayout");
  v12 = -[CPSActionButton buttonLabel](self, "buttonLabel");
  -[CPSActionButton addSubview:](self, "addSubview:");

  v13 = -[CPSActionButton buttonImageView](self, "buttonImageView");
  -[CPSActionButton addSubview:](self, "addSubview:");

}

- (void)updateViews
{
  UILabel *v2;
  NSString *v3;
  UIImageView *v4;
  UIImage *v5;

  v3 = -[CPSActionButton buttonText](self, "buttonText");
  v2 = -[CPSActionButton buttonLabel](self, "buttonLabel");
  -[UILabel setText:](v2, "setText:", v3);

  v5 = -[CPSActionButton buttonImage](self, "buttonImage");
  v4 = -[CPSActionButton buttonImageView](self, "buttonImageView");
  -[UIImageView setImage:](v4, "setImage:", v5);

  -[CPSActionButton stateUpdated](self, "stateUpdated");
}

- (void)setLayoutDelegate:(id)a3
{
  id WeakRetained;
  BOOL v4;
  id location[2];
  CPSActionButton *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  WeakRetained = objc_loadWeakRetained((id *)&v6->_layoutDelegate);
  v4 = WeakRetained == location[0];

  if (!v4)
  {
    objc_storeWeak((id *)&v6->_layoutDelegate, location[0]);
    -[CPSActionButton resetLayoutConstraints](v6, "resetLayoutConstraints");
    -[CPSActionButton _updateLayout](v6, "_updateLayout");
  }
  objc_storeStrong(location, 0);
}

- (void)_updateLayout
{
  id v2;
  id v3;
  double v4;
  CPSActionButtonLayoutDelegate *v5;
  UILabel *v6;
  CPSActionButtonLayoutDelegate *v7;
  char v8;
  CPSActionButtonLayoutDelegate *v9;
  CPSActionButtonLayoutDelegate *v10;
  char v11;
  double v12;
  id location[2];
  CPSActionButton *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = +[CPSEntityStyles actionButtonFont](CPSEntityStyles, "actionButtonFont");
  v10 = -[CPSActionButton layoutDelegate](v14, "layoutDelegate");
  v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    v9 = -[CPSActionButton layoutDelegate](v14, "layoutDelegate");
    v2 = (id)-[CPSActionButtonLayoutDelegate font](v9, "font");
    v3 = location[0];
    location[0] = v2;

  }
  v6 = -[CPSActionButton buttonLabel](v14, "buttonLabel");
  -[UILabel setFont:](v6, "setFont:", location[0]);

  v12 = 8.0;
  v7 = -[CPSActionButton layoutDelegate](v14, "layoutDelegate");
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    v5 = -[CPSActionButton layoutDelegate](v14, "layoutDelegate");
    -[CPSActionButtonLayoutDelegate buttonRadius](v5, "buttonRadius");
    v12 = v4;

  }
  -[CPSActionButton _setContinuousCornerRadius:](v14, "_setContinuousCornerRadius:", v12);
  objc_storeStrong(location, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;
  id location[2];
  CPSActionButton *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSActionButton;
  -[CPUIButton traitCollectionDidChange:](&v3, sel_traitCollectionDidChange_, location[0]);
  -[CPSActionButton resetLayoutConstraints](v5, "resetLayoutConstraints");
  -[CPSActionButton stateUpdated](v5, "stateUpdated");
  objc_storeStrong(location, 0);
}

- (void)resetLayoutConstraints
{
  void *v2;
  NSArray *v3;
  NSArray *v4;
  uint64_t v5;

  v4 = -[CPSActionButton layoutConstraints](self, "layoutConstraints");
  v5 = -[NSArray count](v4, "count");

  if (v5)
  {
    v2 = (void *)MEMORY[0x24BDD1628];
    v3 = -[CPSActionButton layoutConstraints](self, "layoutConstraints");
    objc_msgSend(v2, "deactivateConstraints:");

    -[CPSActionButton setLayoutConstraints:](self, "setLayoutConstraints:", 0);
    -[CPSActionButton setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)updateConstraints
{
  NSArray *v2;
  BOOL v3;
  objc_super v4;
  SEL v5;
  CPSActionButton *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CPSActionButton;
  -[CPSActionButton updateConstraints](&v4, sel_updateConstraints);
  v2 = -[CPSActionButton layoutConstraints](v6, "layoutConstraints");
  v3 = -[NSArray count](v2, "count") != 0;

  if (!v3)
    -[CPSActionButton setupLayoutConstraints](v6, "setupLayoutConstraints");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CPSActionButtonLayoutDelegate *v6;
  double v7;
  double v8;
  CGSize result;

  v6 = -[CPSActionButton layoutDelegate](self, "layoutDelegate");
  -[CPSActionButtonLayoutDelegate buttonSize](v6, "buttonSize");
  v7 = v2;
  v8 = v3;

  v4 = v7;
  v5 = v8;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setupLayoutConstraints
{
  double v2;
  double v3;
  id v4;
  id v5;
  id v6;
  id v7;
  double v8;
  double v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSArray *v14;
  id v15;
  CPSActionButtonLayoutDelegate *v16;
  id v17;
  id v18;
  CPSActionButtonLayoutDelegate *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  UILabel *v24;
  id v25;
  id v26;
  id v27;
  UILabel *v28;
  id v29;
  id v30;
  id v31;
  UIImageView *v32;
  id v33;
  id v34;
  id v35;
  UIImageView *v36;
  UIImageView *v37;
  UIImage *v38;
  BOOL v39;
  id v40;
  id v41;
  UIImageView *v42;
  id v43;
  id v44;
  UIImageView *v45;
  id v46;
  id v47;
  UIImageView *v48;
  id v49;
  id v50;
  id v51;
  UIImageView *v52;
  id v53;
  id v54;
  id v55;
  UILabel *v56;
  id v57;
  id v58;
  id v59;
  UILabel *v60;
  id v61;
  UIImageView *v62;
  UIImage *v63;
  BOOL v64;
  CPSActionButtonLayoutDelegate *v65;
  char v66;
  NSString *v67;
  char v68;
  UILabel *v69;
  char v70;
  NSString *v71;
  char v72;
  UILabel *v73;
  char v74;
  UIImage *v75;
  char v76;
  UIImageView *v77;
  char v78;
  CPSActionButtonLayoutDelegate *v79;
  double v80;
  double v81;
  id v82;
  id v83[2];
  CPSActionButton *v84;
  _QWORD v85[4];
  _QWORD v86[2];
  _QWORD v87[7];

  v87[6] = *MEMORY[0x24BDAC8D0];
  v84 = self;
  v83[1] = (id)a2;
  v83[0] = (id)objc_opt_new();
  v82 = 0;
  v65 = -[CPSActionButton layoutDelegate](v84, "layoutDelegate");
  v78 = 0;
  v76 = 0;
  v74 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v79 = -[CPSActionButton layoutDelegate](v84, "layoutDelegate");
    v78 = 1;
    -[CPSActionButtonLayoutDelegate buttonGlyphSize](v79, "buttonGlyphSize");
  }
  else
  {
    v77 = -[CPSActionButton buttonImageView](v84, "buttonImageView");
    v76 = 1;
    v75 = -[UIImageView image](v77, "image");
    v74 = 1;
    -[UIImage size](v75, "size");
  }
  v80 = v2;
  v81 = v3;
  if ((v74 & 1) != 0)

  if ((v76 & 1) != 0)
  if ((v78 & 1) != 0)

  v62 = -[CPSActionButton buttonImageView](v84, "buttonImageView");
  v63 = -[UIImageView image](v62, "image");
  v72 = 0;
  v70 = 0;
  v64 = 0;
  if (v63)
  {
    v73 = -[CPSActionButton buttonLabel](v84, "buttonLabel");
    v72 = 1;
    v71 = -[UILabel text](v73, "text");
    v70 = 1;
    v64 = -[NSString length](v71, "length") != 0;
  }
  if ((v70 & 1) != 0)

  if ((v72 & 1) != 0)
  if (v64)
  {
    v61 = (id)-[CPSActionButton centerXAnchor](v84, "centerXAnchor");
    v60 = -[CPSActionButton buttonLabel](v84, "buttonLabel");
    v59 = (id)-[UILabel centerXAnchor](v60, "centerXAnchor");
    v58 = (id)objc_msgSend(v61, "constraintEqualToAnchor:");
    v87[0] = v58;
    v57 = (id)-[CPSActionButton bottomAnchor](v84, "bottomAnchor");
    v56 = -[CPSActionButton buttonLabel](v84, "buttonLabel");
    v55 = (id)-[UILabel bottomAnchor](v56, "bottomAnchor");
    v54 = (id)objc_msgSend(v57, "constraintEqualToAnchor:");
    v87[1] = v54;
    v53 = (id)-[CPSActionButton centerXAnchor](v84, "centerXAnchor");
    v52 = -[CPSActionButton buttonImageView](v84, "buttonImageView");
    v51 = (id)-[UIImageView centerXAnchor](v52, "centerXAnchor");
    v50 = (id)objc_msgSend(v53, "constraintEqualToAnchor:");
    v87[2] = v50;
    v49 = (id)-[CPSActionButton topAnchor](v84, "topAnchor");
    v48 = -[CPSActionButton buttonImageView](v84, "buttonImageView");
    v47 = (id)-[UIImageView topAnchor](v48, "topAnchor");
    v46 = (id)objc_msgSend(v49, "constraintEqualToAnchor:");
    v87[3] = v46;
    v45 = -[CPSActionButton buttonImageView](v84, "buttonImageView");
    v44 = (id)-[UIImageView widthAnchor](v45, "widthAnchor");
    v43 = (id)objc_msgSend(v44, "constraintEqualToConstant:", v80);
    v87[4] = v43;
    v42 = -[CPSActionButton buttonImageView](v84, "buttonImageView");
    v41 = (id)-[UIImageView heightAnchor](v42, "heightAnchor");
    v40 = (id)objc_msgSend(v41, "constraintEqualToConstant:", v81);
    v87[5] = v40;
    v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v87, 6);
    v5 = v82;
    v82 = v4;

  }
  else
  {
    v37 = -[CPSActionButton buttonImageView](v84, "buttonImageView");
    v38 = -[UIImageView image](v37, "image");
    v68 = 0;
    v66 = 0;
    v39 = 0;
    if (v38)
    {
      v69 = -[CPSActionButton buttonLabel](v84, "buttonLabel");
      v68 = 1;
      v67 = -[UILabel text](v69, "text");
      v66 = 1;
      v39 = -[NSString length](v67, "length") == 0;
    }
    if ((v66 & 1) != 0)

    if ((v68 & 1) != 0)
    if (v39)
    {
      v36 = -[CPSActionButton buttonImageView](v84, "buttonImageView");
      v35 = (id)-[UIImageView centerXAnchor](v36, "centerXAnchor");
      v34 = (id)-[CPSActionButton centerXAnchor](v84, "centerXAnchor");
      v33 = (id)objc_msgSend(v35, "constraintEqualToAnchor:");
      v86[0] = v33;
      v32 = -[CPSActionButton buttonImageView](v84, "buttonImageView");
      v31 = (id)-[UIImageView centerYAnchor](v32, "centerYAnchor");
      v30 = (id)-[CPSActionButton centerYAnchor](v84, "centerYAnchor");
      v29 = (id)objc_msgSend(v31, "constraintEqualToAnchor:");
      v86[1] = v29;
      v6 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v86, 2);
      v7 = v82;
      v82 = v6;

    }
    else
    {
      v28 = -[CPSActionButton buttonLabel](v84, "buttonLabel");
      v27 = (id)-[UILabel centerXAnchor](v28, "centerXAnchor");
      v26 = (id)-[CPSActionButton centerXAnchor](v84, "centerXAnchor");
      v25 = (id)objc_msgSend(v27, "constraintEqualToAnchor:");
      v85[0] = v25;
      v24 = -[CPSActionButton buttonLabel](v84, "buttonLabel");
      v23 = (id)-[UILabel centerYAnchor](v24, "centerYAnchor");
      v22 = (id)-[CPSActionButton centerYAnchor](v84, "centerYAnchor");
      v21 = (id)objc_msgSend(v23, "constraintEqualToAnchor:");
      v85[1] = v21;
      v20 = (id)-[CPSActionButton widthAnchor](v84, "widthAnchor");
      v19 = -[CPSActionButton layoutDelegate](v84, "layoutDelegate");
      -[CPSActionButtonLayoutDelegate buttonSize](v19, "buttonSize");
      v18 = (id)objc_msgSend(v20, "constraintEqualToConstant:", v8);
      v85[2] = v18;
      v17 = (id)-[CPSActionButton heightAnchor](v84, "heightAnchor");
      v16 = -[CPSActionButton layoutDelegate](v84, "layoutDelegate");
      -[CPSActionButtonLayoutDelegate buttonSize](v16, "buttonSize");
      v15 = (id)objc_msgSend(v17, "constraintEqualToConstant:", v9);
      v85[3] = v15;
      v10 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v85, 4);
      v11 = v82;
      v82 = v10;

    }
  }
  objc_msgSend(v83[0], "addObjectsFromArray:", v82);
  v12 = (id)objc_msgSend(v83[0], "copy");
  -[CPSActionButton setLayoutConstraints:](v84, "setLayoutConstraints:");

  v13 = (void *)MEMORY[0x24BDD1628];
  v14 = -[CPSActionButton layoutConstraints](v84, "layoutConstraints");
  objc_msgSend(v13, "activateConstraints:");

  objc_storeStrong(&v82, 0);
  objc_storeStrong(v83, 0);
}

- (void)setEnabled:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  CPSActionButton *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)CPSActionButton;
  -[CPUIButton setEnabled:](&v3, sel_setEnabled_, a3);
}

- (void)setSelected:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  CPSActionButton *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)CPSActionButton;
  -[CPSActionButton setSelected:](&v3, sel_setSelected_, a3);
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  CPSActionButton *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)CPSActionButton;
  -[CPSActionButton setHighlighted:](&v3, sel_setHighlighted_, a3);
  -[CPSActionButton stateUpdated](v6, "stateUpdated");
}

- (void)stateUpdated
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  CPSActionButtonLayoutDelegate *v14;
  uint64_t v15;
  id v16;
  id v17;
  UIImageView *v18;
  CPSActionButtonLayoutDelegate *v19;
  char v20;
  CPSActionButtonLayoutDelegate *v21;
  uint64_t v22;
  id v23;
  id v24;
  UILabel *v25;
  CPSActionButtonLayoutDelegate *v26;
  char v27;
  id v28;
  NSMutableDictionary *v29;
  id v30;
  id v31;
  NSMutableDictionary *v32;
  id v33;
  char v34;
  id v35;
  char v36;
  id v37;
  char v38;
  id v39;
  char v40;
  id v41;
  char v42;
  id v43;
  id v44;
  char v45;
  id v46;
  id v47;
  char v48;
  id v49;
  id v50;
  char v51;
  id v52;
  id v53;
  char v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id location;
  id v60[2];
  CPSActionButton *v61;

  v61 = self;
  v60[1] = (id)a2;
  v60[0] = (id)objc_msgSend(MEMORY[0x24BDF6F30], "_currentTraitCollection");
  v35 = (id)-[CPSActionButton traitCollection](v61, "traitCollection");
  objc_msgSend(MEMORY[0x24BDF6F30], "_setCurrentTraitCollection:");

  location = 0;
  v58 = 0;
  v57 = 0;
  v56 = 0;
  v55 = 0;
  v54 = 0;
  v36 = 0;
  if ((-[CPSActionButton isEnabled](v61, "isEnabled") & 1) != 0)
  {
    v34 = 1;
    if ((-[CPSActionButton isSelected](v61, "isSelected") & 1) == 0)
    {
      v34 = 1;
      if ((-[CPSActionButton isFocused](v61, "isFocused") & 1) == 0)
        v34 = -[CPSActionButton isHighlighted](v61, "isHighlighted");
    }
    v36 = v34;
  }
  v54 = v36 & 1;
  if ((v36 & 1) != 0)
  {
    v32 = -[CPSActionButton tintColors](v61, "tintColors");
    v33 = (id)-[NSMutableDictionary objectForKeyedSubscript:](v32, "objectForKeyedSubscript:", &unk_24E29A658);
    v51 = 0;
    if (v33)
    {
      v2 = v33;
    }
    else
    {
      v52 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
      v51 = 1;
      v2 = v52;
    }
    v53 = v2;
    if ((v51 & 1) != 0)

    v31 = (id)-[CPSActionButton titleColorForState:](v61, "titleColorForState:", 4);
    v48 = 0;
    if (v31)
    {
      v3 = v31;
    }
    else
    {
      v49 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusLabelColor");
      v48 = 1;
      v3 = v49;
    }
    v50 = v3;
    if ((v48 & 1) != 0)

    objc_storeStrong(&location, v53);
    objc_storeStrong(&v58, v53);
    objc_storeStrong(&v57, v50);
    v4 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemFocusColor");
    v5 = v56;
    v56 = v4;

    objc_storeStrong(&v55, v56);
    objc_storeStrong(&v50, 0);
    objc_storeStrong(&v53, 0);
  }
  else if ((-[CPSActionButton isEnabled](v61, "isEnabled") & 1) != 0)
  {
    v29 = -[CPSActionButton tintColors](v61, "tintColors");
    v30 = (id)-[NSMutableDictionary objectForKeyedSubscript:](v29, "objectForKeyedSubscript:", &unk_24E29A670);
    v45 = 0;
    if (v30)
    {
      v6 = v30;
    }
    else
    {
      v46 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemPrimaryColor");
      v45 = 1;
      v6 = v46;
    }
    v47 = v6;
    if ((v45 & 1) != 0)

    v28 = (id)-[CPSActionButton titleColorForState:](v61, "titleColorForState:", 0);
    v42 = 0;
    if (v28)
    {
      v7 = v28;
    }
    else
    {
      v43 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
      v42 = 1;
      v7 = v43;
    }
    v44 = v7;
    if ((v42 & 1) != 0)

    objc_storeStrong(&location, v47);
    objc_storeStrong(&v58, v47);
    objc_storeStrong(&v57, v44);
    objc_storeStrong(&v56, 0);
    objc_storeStrong(&v44, 0);
    objc_storeStrong(&v47, 0);
  }
  else
  {
    v8 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemTertiaryColor");
    v9 = location;
    location = v8;

    v40 = 0;
    v38 = 0;
    if (-[CPSActionButton disabledButtonFocused](v61, "disabledButtonFocused"))
    {
      v41 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemTertiaryColor");
      v40 = 1;
      objc_storeStrong(&v58, v41);
    }
    else
    {
      v39 = (id)objc_msgSend(MEMORY[0x24BDF6950], "_carSystemQuaternaryColor");
      v38 = 1;
      objc_storeStrong(&v58, v39);
    }
    if ((v38 & 1) != 0)

    if ((v40 & 1) != 0)
    v10 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
    v11 = v57;
    v57 = v10;

    objc_storeStrong(&v56, 0);
  }
  v22 = objc_msgSend(objc_retainAutorelease(location), "CGColor");
  v23 = (id)-[CPSActionButton layer](v61, "layer");
  objc_msgSend(v23, "setBorderColor:", v22);

  -[CPSActionButton setTintColor:](v61, "setTintColor:", v58);
  v24 = v57;
  v25 = -[CPSActionButton buttonLabel](v61, "buttonLabel");
  -[UILabel setTextColor:](v25, "setTextColor:", v24);

  v26 = -[CPSActionButton layoutDelegate](v61, "layoutDelegate");
  v27 = objc_opt_respondsToSelector();

  if ((v27 & 1) != 0)
  {
    v21 = -[CPSActionButton layoutDelegate](v61, "layoutDelegate");
    v12 = (id)-[CPSActionButtonLayoutDelegate buttonImageTintColor](v21, "buttonImageTintColor");
    v13 = v55;
    v55 = v12;

  }
  v17 = v55;
  v18 = -[CPSActionButton buttonImageView](v61, "buttonImageView");
  -[UIImageView setTintColor:](v18, "setTintColor:", v17);

  v19 = -[CPSActionButton layoutDelegate](v61, "layoutDelegate");
  v20 = objc_opt_respondsToSelector();

  if ((v20 & 1) != 0)
  {
    v14 = -[CPSActionButton layoutDelegate](v61, "layoutDelegate");
    v37 = (id)-[CPSActionButtonLayoutDelegate buttonBackgroundColor](v14, "buttonBackgroundColor");

    v15 = objc_msgSend(objc_retainAutorelease(v37), "CGColor");
    v16 = (id)-[CPSActionButton layer](v61, "layer");
    objc_msgSend(v16, "setBackgroundColor:", v15);

    objc_storeStrong(&v37, 0);
  }
  objc_msgSend(MEMORY[0x24BDF6F30], "_setCurrentTraitCollection:", v60[0]);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(&v56, 0);
  objc_storeStrong(&v57, 0);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v60, 0);
}

- (BOOL)canBecomeFocused
{
  return -[CPSActionButton isEnabled](self, "isEnabled", a2, self) & 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v5;
  id location[2];
  CPSActionButton *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = 0;
  objc_storeStrong(&v5, a4);
  -[CPSActionButton stateUpdated](v7, "stateUpdated");
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)setTintColor:(id)a3 forState:(unint64_t)a4
{
  NSMutableDictionary *v4;
  uint64_t v5;
  id v6;
  NSMutableDictionary *v7;
  id v8;
  BOOL v10;
  id location[2];
  CPSActionButton *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSActionButton tintColors](v12, "tintColors");
  v10 = v4 != 0;

  if (!v10)
  {
    v8 = (id)objc_opt_new();
    -[CPSActionButton setTintColors:](v12, "setTintColors:");

  }
  v7 = -[CPSActionButton tintColors](v12, "tintColors", location[0]);
  v6 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v5);

  objc_storeStrong(location, 0);
}

- (CPSActionButtonLayoutDelegate)layoutDelegate
{
  return (CPSActionButtonLayoutDelegate *)objc_loadWeakRetained((id *)&self->_layoutDelegate);
}

- (UIImage)buttonImage
{
  return self->_buttonImage;
}

- (NSString)buttonText
{
  return self->_buttonText;
}

- (BOOL)disabledButtonFocused
{
  return self->_disabledButtonFocused;
}

- (void)setDisabledButtonFocused:(BOOL)a3
{
  self->_disabledButtonFocused = a3;
}

- (NSDictionary)buttonAttributes
{
  return self->_buttonAttributes;
}

- (void)setButtonAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_buttonAttributes, a3);
}

- (UILabel)buttonLabel
{
  return self->_buttonLabel;
}

- (void)setButtonLabel:(id)a3
{
  objc_storeStrong((id *)&self->_buttonLabel, a3);
}

- (UIImageView)buttonImageView
{
  return self->_buttonImageView;
}

- (void)setButtonImageView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonImageView, a3);
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConstraints, a3);
}

- (NSMutableDictionary)tintColors
{
  return self->_tintColors;
}

- (void)setTintColors:(id)a3
{
  objc_storeStrong((id *)&self->_tintColors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColors, 0);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_buttonImageView, 0);
  objc_storeStrong((id *)&self->_buttonLabel, 0);
  objc_storeStrong((id *)&self->_buttonAttributes, 0);
  objc_storeStrong((id *)&self->_buttonText, 0);
  objc_storeStrong((id *)&self->_buttonImage, 0);
  objc_destroyWeak((id *)&self->_layoutDelegate);
}

@end
