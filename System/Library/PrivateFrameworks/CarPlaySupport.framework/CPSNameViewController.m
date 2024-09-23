@implementation CPSNameViewController

- (CPSNameViewController)initWithEntity:(id)a3
{
  CPSNameViewController *v3;
  CPSNameStackView *v4;
  CPSNameStackView *stackView;
  double v6;
  CPSNameViewController *v8;
  CPSNameViewController *v9;
  objc_super v10;
  id location[2];
  CPSNameViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v12;
  v12 = 0;
  v10.receiver = v3;
  v10.super_class = (Class)CPSNameViewController;
  v9 = -[CPSNameViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0);
  v12 = v9;
  objc_storeStrong((id *)&v12, v9);
  if (v9)
  {
    objc_storeStrong((id *)&v12->_entity, location[0]);
    v4 = objc_alloc_init(CPSNameStackView);
    stackView = v12->_stackView;
    v12->_stackView = v4;

    -[CPSNameStackView setContentCompressionResistancePriority:forAxis:](v12->_stackView, "setContentCompressionResistancePriority:forAxis:", 0);
    LODWORD(v6) = 1144750080;
    -[CPSNameStackView setContentCompressionResistancePriority:forAxis:](v12->_stackView, "setContentCompressionResistancePriority:forAxis:", 1, v6);
  }
  v8 = v12;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v8;
}

- (void)updateWithEntity:(id)a3
{
  id location[2];
  CPSNameViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CPSNameViewController setEntity:](v4, "setEntity:", location[0]);
  -[CPSNameViewController updateViews](v4, "updateViews");
  -[CPSNameViewController resetLayoutConstraints](v4, "resetLayoutConstraints");
  objc_storeStrong(location, 0);
}

- (void)viewDidLoad
{
  objc_super v2;
  SEL v3;
  CPSNameViewController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSNameViewController;
  -[CPSNameViewController viewDidLoad](&v2, sel_viewDidLoad);
  -[CPSNameViewController setupViews](v4, "setupViews");
  -[CPSNameViewController updateViews](v4, "updateViews");
}

- (void)setupViews
{
  UILabel *v2;
  UILabel *primaryLabel;
  UILabel *v4;
  UILabel *secondaryLabel;
  UILabel *v6;
  UILabel *tertiaryLabel;
  id v8;
  id v9;
  id v10;
  id v11;
  CPSNameStackView *v12;
  CPSNameStackView *v13;
  CPSNameStackView *v14;
  CPSNameStackView *v15;
  CPSNameStackView *v16;
  CPSNameStackView *v17;
  CPSNameStackView *v18;
  CPSNameStackView *v19;
  CPSNameStackView *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  uint64_t *v33;
  id v34;
  uint64_t *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  CPSNameStackView *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47[2];
  CPSNameViewController *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x24BDAC8D0];
  v48 = self;
  v47[1] = (id)a2;
  v12 = -[CPSNameViewController stackView](self, "stackView");
  -[CPSNameStackView setTranslatesAutoresizingMaskIntoConstraints:](v12, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v13 = -[CPSNameViewController stackView](v48, "stackView");
  -[CPSNameStackView setAlignment:](v13, "setAlignment:");

  v14 = -[CPSNameViewController stackView](v48, "stackView");
  -[CPSNameStackView setDistribution:](v14, "setDistribution:", 3);

  v15 = -[CPSNameViewController stackView](v48, "stackView");
  -[CPSNameStackView setAxis:](v15, "setAxis:", 1);

  v16 = -[CPSNameViewController stackView](v48, "stackView");
  -[CPSNameStackView setBaselineRelativeArrangement:](v16, "setBaselineRelativeArrangement:", 1);

  v17 = -[CPSNameViewController stackView](v48, "stackView");
  -[CPSNameStackView setSpacing:](v17, "setSpacing:", 20.0);

  v18 = -[CPSNameViewController stackView](v48, "stackView");
  v2 = (UILabel *)insertNewLabelToStackView(v18);
  primaryLabel = v48->_primaryLabel;
  v48->_primaryLabel = v2;

  v19 = -[CPSNameViewController stackView](v48, "stackView");
  v4 = (UILabel *)insertNewLabelToStackView(v19);
  secondaryLabel = v48->_secondaryLabel;
  v48->_secondaryLabel = v4;

  v20 = -[CPSNameViewController stackView](v48, "stackView");
  v6 = (UILabel *)insertNewLabelToStackView(v20);
  tertiaryLabel = v48->_tertiaryLabel;
  v48->_tertiaryLabel = v6;

  v47[0] = (id)*MEMORY[0x24BDF7850];
  v46 = (id)*MEMORY[0x24BDF77C0];
  v22 = (void *)MEMORY[0x24BDF6A70];
  v21 = v47[0];
  v24 = (id)-[CPSNameViewController traitCollection](v48, "traitCollection");
  v23 = (id)objc_msgSend(v22, "preferredFontForTextStyle:compatibleWithTraitCollection:", v21);
  v45 = (id)objc_msgSend(v23, "fontDescriptor");

  v33 = (uint64_t *)MEMORY[0x24BDF78A0];
  v55 = *MEMORY[0x24BDF78A0];
  v25 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7868]);
  v56[0] = v25;
  v44 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, &v55, 1);

  v26 = v45;
  v35 = (uint64_t *)MEMORY[0x24BDF7770];
  v53 = *MEMORY[0x24BDF7770];
  v54 = v44;
  v27 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
  v8 = (id)objc_msgSend(v26, "fontDescriptorByAddingAttributes:");
  v9 = v45;
  v45 = v8;

  v28 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v45);
  -[UILabel setFont:](v48->_primaryLabel, "setFont:");

  v30 = (void *)MEMORY[0x24BDF6A70];
  v29 = v46;
  v32 = (id)-[CPSNameViewController traitCollection](v48, "traitCollection");
  v31 = (id)objc_msgSend(v30, "preferredFontForTextStyle:compatibleWithTraitCollection:", v29);
  v43 = (id)objc_msgSend(v31, "fontDescriptor");

  v51 = *v33;
  v34 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7888]);
  v52 = v34;
  v42 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);

  v36 = v43;
  v49 = *v35;
  v50 = v42;
  v37 = (id)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
  v10 = (id)objc_msgSend(v36, "fontDescriptorByAddingAttributes:");
  v11 = v43;
  v43 = v10;

  v38 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v43, 0.0);
  -[UILabel setFont:](v48->_secondaryLabel, "setFont:");

  v39 = (id)objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v43, 0.0);
  -[UILabel setFont:](v48->_tertiaryLabel, "setFont:");

  v41 = (id)-[CPSNameViewController view](v48, "view");
  v40 = -[CPSNameViewController stackView](v48, "stackView");
  objc_msgSend(v41, "addSubview:");

  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v43, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(&v45, 0);
  objc_storeStrong(&v46, 0);
  objc_storeStrong(v47, 0);
}

- (void)updateViews
{
  UILabel *v2;
  UILabel *v3;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  UILabel *v7;
  UILabel *v8;
  UILabel *v9;
  CPEntityNameProviding *v10;
  CPEntityNameProviding *v11;
  CPEntityNameProviding *v12;
  UILabel *v13;
  id location;
  id v15;
  id v16[2];
  CPSNameViewController *v17;

  v17 = self;
  v16[1] = (id)a2;
  v10 = -[CPSNameViewController entity](self, "entity");
  v16[0] = (id)-[CPEntityNameProviding name](v10, "name");

  v11 = -[CPSNameViewController entity](v17, "entity");
  v15 = (id)-[CPEntityNameProviding subtitle](v11, "subtitle");

  v12 = -[CPSNameViewController entity](v17, "entity");
  location = (id)-[CPEntityNameProviding informativeText](v12, "informativeText");

  v13 = -[CPSNameViewController primaryLabel](v17, "primaryLabel");
  if (v13)
  {
    v8 = -[CPSNameViewController primaryLabel](v17, "primaryLabel");
    -[UILabel setText:](v8, "setText:", v16[0]);

    v9 = -[CPSNameViewController primaryLabel](v17, "primaryLabel");
    -[UILabel sizeToFit](v9, "sizeToFit");

  }
  v7 = -[CPSNameViewController secondaryLabel](v17, "secondaryLabel");

  if (v7)
  {
    v5 = -[CPSNameViewController secondaryLabel](v17, "secondaryLabel");
    -[UILabel setText:](v5, "setText:", v15);

    v6 = -[CPSNameViewController secondaryLabel](v17, "secondaryLabel");
    -[UILabel sizeToFit](v6, "sizeToFit");

  }
  v4 = -[CPSNameViewController tertiaryLabel](v17, "tertiaryLabel");

  if (v4)
  {
    v2 = -[CPSNameViewController tertiaryLabel](v17, "tertiaryLabel");
    -[UILabel setText:](v2, "setText:", location);

    v3 = -[CPSNameViewController tertiaryLabel](v17, "tertiaryLabel");
    -[UILabel sizeToFit](v3, "sizeToFit");

  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;
  id location[2];
  CPSNameViewController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSNameViewController;
  -[CPSNameViewController traitCollectionDidChange:](&v3, sel_traitCollectionDidChange_, location[0]);
  -[CPSNameViewController resetLayoutConstraints](v5, "resetLayoutConstraints");
  objc_storeStrong(location, 0);
}

- (void)resetLayoutConstraints
{
  void *v2;
  NSArray *v3;
  id v4;
  NSArray *v5;
  uint64_t v6;

  v5 = -[CPSNameViewController layoutConstraints](self, "layoutConstraints");
  v6 = -[NSArray count](v5, "count");

  if (v6)
  {
    v2 = (void *)MEMORY[0x24BDD1628];
    v3 = -[CPSNameViewController layoutConstraints](self, "layoutConstraints");
    objc_msgSend(v2, "deactivateConstraints:");

    -[CPSNameViewController setLayoutConstraints:](self, "setLayoutConstraints:", 0);
    v4 = (id)-[CPSNameViewController view](self, "view");
    objc_msgSend(v4, "setNeedsUpdateConstraints");

  }
}

- (void)updateViewConstraints
{
  NSArray *v2;
  BOOL v3;
  objc_super v4;
  SEL v5;
  CPSNameViewController *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CPSNameViewController;
  -[CPSNameViewController updateViewConstraints](&v4, sel_updateViewConstraints);
  v2 = -[CPSNameViewController layoutConstraints](v6, "layoutConstraints");
  v3 = -[NSArray count](v2, "count") != 0;

  if (!v3)
    -[CPSNameViewController setupLayoutConstraints](v6, "setupLayoutConstraints");
}

- (void)setupLayoutConstraints
{
  id v2;
  id v3;
  CPSNameStackView *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  CPSNameStackView *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  CPSNameStackView *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  CPSNameStackView *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  NSArray *v24;
  id v25;
  id v26[2];
  CPSNameViewController *v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x24BDAC8D0];
  v27 = self;
  v26[1] = (id)a2;
  v26[0] = (id)objc_opt_new();
  v21 = (id)-[CPSNameViewController view](v27, "view");
  v20 = (id)objc_msgSend(v21, "leadingAnchor");
  v19 = -[CPSNameViewController stackView](v27, "stackView");
  v18 = (id)-[CPSNameStackView leadingAnchor](v19, "leadingAnchor");
  v17 = (id)objc_msgSend(v20, "constraintEqualToAnchor:");
  v28[0] = v17;
  v16 = (id)-[CPSNameViewController view](v27, "view");
  v15 = (id)objc_msgSend(v16, "topAnchor");
  v14 = -[CPSNameViewController stackView](v27, "stackView");
  v13 = (id)-[CPSNameStackView topAnchor](v14, "topAnchor");
  v12 = (id)objc_msgSend(v15, "constraintEqualToAnchor:");
  v28[1] = v12;
  v11 = (id)-[CPSNameViewController view](v27, "view");
  v10 = (id)objc_msgSend(v11, "trailingAnchor");
  v9 = -[CPSNameViewController stackView](v27, "stackView");
  v8 = (id)-[CPSNameStackView trailingAnchor](v9, "trailingAnchor");
  v7 = (id)objc_msgSend(v10, "constraintEqualToAnchor:");
  v28[2] = v7;
  v6 = (id)-[CPSNameViewController view](v27, "view");
  v5 = (id)objc_msgSend(v6, "bottomAnchor");
  v4 = -[CPSNameViewController stackView](v27, "stackView");
  v3 = (id)-[CPSNameStackView bottomAnchor](v4, "bottomAnchor");
  v2 = (id)objc_msgSend(v5, "constraintEqualToAnchor:");
  v28[3] = v2;
  v25 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 4);

  objc_msgSend(v26[0], "addObjectsFromArray:", v25);
  v22 = (void *)objc_msgSend(v26[0], "copy");
  -[CPSNameViewController setLayoutConstraints:](v27, "setLayoutConstraints:");

  v23 = (void *)MEMORY[0x24BDD1628];
  v24 = -[CPSNameViewController layoutConstraints](v27, "layoutConstraints");
  objc_msgSend(v23, "activateConstraints:");

  objc_storeStrong(&v25, 0);
  objc_storeStrong(v26, 0);
}

- (void)viewWillLayoutSubviews
{
  double Width;
  double v3;
  double v4;
  int v5;
  double v6;
  CPSNameStackView *v7;
  CPSNameStackView *v8;
  double v9;
  CPSNameStackView *v10;
  BOOL v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  CPSNameStackView *v17;
  id obj;
  uint64_t v19;
  _QWORD __b[8];
  id v21;
  double v22;
  objc_super v23;
  SEL v24;
  CPSNameViewController *v25;
  _BYTE v26[128];
  uint64_t v27;
  CGRect v28;
  CGRect v29;

  v27 = *MEMORY[0x24BDAC8D0];
  v25 = self;
  v24 = a2;
  v23.receiver = self;
  v23.super_class = (Class)CPSNameViewController;
  -[CPSNameViewController viewWillLayoutSubviews](&v23, sel_viewWillLayoutSubviews);
  v22 = 0.0;
  memset(__b, 0, sizeof(__b));
  v17 = -[CPSNameViewController stackView](v25, "stackView");
  obj = (id)-[CPSNameStackView arrangedSubviews](v17, "arrangedSubviews");

  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16);
  if (v19)
  {
    v14 = *(_QWORD *)__b[2];
    v15 = 0;
    v16 = v19;
    while (1)
    {
      v13 = v15;
      if (*(_QWORD *)__b[2] != v14)
        objc_enumerationMutation(obj);
      v21 = *(id *)(__b[1] + 8 * v15);
      v12 = v22;
      objc_msgSend(v21, "bounds");
      Width = CGRectGetWidth(v28);
      v3 = v12;
      if (v12 < Width)
      {
        objc_msgSend(v21, "bounds", v12);
        v3 = CGRectGetWidth(v29);
        v22 = v3;
      }
      ++v15;
      if (v13 + 1 >= v16)
      {
        v15 = 0;
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v26, 16, v3);
        if (!v16)
          break;
      }
    }
  }

  v9 = v22;
  v10 = -[CPSNameViewController stackView](v25, "stackView");
  -[CPSNameStackView fittingWidth](v10, "fittingWidth");
  abs(v9 - v4);
  v11 = (double)v5 <= 20.0;

  if (!v11)
  {
    v6 = v22 + 20.0;
    v7 = -[CPSNameViewController stackView](v25, "stackView");
    -[CPSNameStackView setFittingWidth:](v7, "setFittingWidth:", v6);

    v8 = -[CPSNameViewController stackView](v25, "stackView");
    -[CPSNameStackView invalidateIntrinsicContentSize](v8, "invalidateIntrinsicContentSize");

  }
}

- (CPEntityNameProviding)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
  objc_storeStrong((id *)&self->_entity, a3);
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (UILabel)tertiaryLabel
{
  return self->_tertiaryLabel;
}

- (CPSNameStackView)stackView
{
  return self->_stackView;
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_tertiaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_entity, 0);
}

@end
