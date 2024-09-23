@implementation CPSInformationTemplateButtonsViewController

- (CPSInformationTemplateButtonsViewController)initWithButtons:(id)a3 buttonDelegate:(id)a4
{
  CPSInformationTemplateButtonsViewController *v4;
  uint64_t v5;
  NSArray *buttons;
  CPSInformationTemplateButtonsViewController *v8;
  objc_super v10;
  id v11;
  id location[2];
  CPSInformationTemplateButtonsViewController *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v4 = v13;
  v13 = 0;
  v10.receiver = v4;
  v10.super_class = (Class)CPSInformationTemplateButtonsViewController;
  v13 = -[CPSInformationTemplateButtonsViewController initWithNibName:bundle:](&v10, sel_initWithNibName_bundle_, 0);
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    v5 = objc_msgSend(location[0], "copy");
    buttons = v13->_buttons;
    v13->_buttons = (NSArray *)v5;

    objc_storeWeak((id *)&v13->_buttonDelegate, v11);
    v13->_preferredButtonIndex = 0x7FFFFFFFFFFFFFFFLL;
  }
  v8 = v13;
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v13, 0);
  return v8;
}

- (void)setButtons:(id)a3
{
  uint64_t v3;
  NSArray *buttons;
  id location[2];
  CPSInformationTemplateButtonsViewController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = objc_msgSend(location[0], "copy");
  buttons = v6->_buttons;
  v6->_buttons = (NSArray *)v3;

  -[CPSInformationTemplateButtonsViewController _updateButtons](v6, "_updateButtons");
  -[CPSInformationTemplateButtonsViewController _updateHeight](v6, "_updateHeight");
  objc_storeStrong(location, 0);
}

- (void)setButtonIdentifier:(id)a3 enabled:(BOOL)a4
{
  NSArray *v5;
  UIStackView *v6;
  id v7;
  BOOL v8;
  BOOL v9;
  id location[2];
  CPSInformationTemplateButtonsViewController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = a4;
  v6 = -[CPSInformationTemplateButtonsViewController buttonStackView](v11, "buttonStackView");
  v5 = -[UIStackView arrangedSubviews](v6, "arrangedSubviews");
  v7 = location[0];
  v8 = v9;
  -[NSArray enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:");

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

void __75__CPSInformationTemplateButtonsViewController_setButtonIdentifier_enabled___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v4;
  id v8;
  char v9;
  id v10[2];
  _BYTE *v11;
  uint64_t v12;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v12 = a3;
  v11 = a4;
  v10[1] = (id)a1;
  v4 = (void *)objc_opt_class();
  v10[0] = CPSSafeCast_18(v4, location[0]);
  v8 = (id)objc_msgSend(v10[0], "identifier");
  v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 32));

  if ((v9 & 1) != 0)
  {
    objc_msgSend(v10[0], "setEnabled:", *(_BYTE *)(a1 + 40) & 1);
    *v11 = 1;
  }
  objc_storeStrong(v10, 0);
  objc_storeStrong(location, 0);
}

- (void)viewDidLoad
{
  id v2;
  id v3;
  UIStackView *v4;
  void *v5;
  id v6;
  NSLayoutConstraint *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
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
  objc_super v25;
  SEL v26;
  CPSInformationTemplateButtonsViewController *v27;
  _QWORD v28[7];

  v28[6] = *MEMORY[0x24BDAC8D0];
  v27 = self;
  v26 = a2;
  v25.receiver = self;
  v25.super_class = (Class)CPSInformationTemplateButtonsViewController;
  -[CPSInformationTemplateButtonsViewController viewDidLoad](&v25, sel_viewDidLoad);
  v24 = (id)-[CPSInformationTemplateButtonsViewController view](v27, "view");
  v23 = objc_alloc_init(MEMORY[0x24BDF6DD0]);
  objc_msgSend(v23, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v23, "setAxis:", 0);
  objc_msgSend(v23, "setSpacing:", 12.0);
  objc_msgSend(v23, "setDistribution:", 1);
  objc_msgSend(v24, "addSubview:", v23);
  -[CPSInformationTemplateButtonsViewController setButtonStackView:](v27, "setButtonStackView:", v23);
  v4 = -[CPSInformationTemplateButtonsViewController buttonStackView](v27, "buttonStackView");
  v3 = (id)-[UIStackView heightAnchor](v4, "heightAnchor");
  v2 = (id)objc_msgSend(v3, "constraintEqualToConstant:", 32.0);
  -[CPSInformationTemplateButtonsViewController setHeightConstraint:](v27, "setHeightConstraint:");

  v5 = (void *)MEMORY[0x24BDD1628];
  v22 = (id)objc_msgSend(v24, "leftAnchor");
  v21 = (id)objc_msgSend(v23, "leftAnchor");
  v20 = (id)objc_msgSend(v22, "constraintLessThanOrEqualToAnchor:");
  v28[0] = v20;
  v19 = (id)objc_msgSend(v24, "rightAnchor");
  v18 = (id)objc_msgSend(v23, "rightAnchor");
  v17 = (id)objc_msgSend(v19, "constraintGreaterThanOrEqualToAnchor:");
  v28[1] = v17;
  v16 = (id)objc_msgSend(v24, "topAnchor");
  v15 = (id)objc_msgSend(v23, "topAnchor");
  v14 = (id)objc_msgSend(v16, "constraintEqualToAnchor:");
  v28[2] = v14;
  v13 = (id)objc_msgSend(v23, "centerXAnchor");
  v12 = (id)objc_msgSend(v24, "centerXAnchor");
  v11 = (id)objc_msgSend(v13, "constraintEqualToAnchor:");
  v28[3] = v11;
  v10 = (id)objc_msgSend(v24, "bottomAnchor");
  v9 = (id)objc_msgSend(v23, "bottomAnchor");
  v8 = (id)objc_msgSend(v10, "constraintEqualToAnchor:");
  v28[4] = v8;
  v7 = -[CPSInformationTemplateButtonsViewController heightConstraint](v27, "heightConstraint");
  v28[5] = v7;
  v6 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 6);
  objc_msgSend(v5, "activateConstraints:");

  -[CPSInformationTemplateButtonsViewController _updateButtons](v27, "_updateButtons");
  -[CPSInformationTemplateButtonsViewController _updateHeight](v27, "_updateHeight");
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&v24, 0);
}

- (void)_updateHeight
{
  uint64_t v2;
  double v3;
  double v4;
  NSLayoutConstraint *v5;
  NSArray *v6;

  v6 = -[CPSInformationTemplateButtonsViewController buttons](self, "buttons");
  v2 = -[NSArray count](v6, "count");
  v3 = 32.0;
  if (!v2)
    v3 = 0.0;
  v4 = v3;
  v5 = -[CPSInformationTemplateButtonsViewController heightConstraint](self, "heightConstraint");
  -[NSLayoutConstraint setConstant:](v5, "setConstant:", v4);

}

- (void)_updateButtons
{
  unint64_t v2;
  NSArray *v3;
  unint64_t v4;
  NSArray *v5;
  uint64_t v6;
  NSArray *v7;
  UIStackView *v8;
  void *v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  void (*v15)(id *, void *, void *, void *);
  void *v16;
  CPSInformationTemplateButtonsViewController *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21[2];
  CPSInformationTemplateButtonsViewController *v22;

  v22 = self;
  v21[1] = (id)a2;
  v8 = -[CPSInformationTemplateButtonsViewController buttonStackView](self, "buttonStackView");
  v7 = -[UIStackView arrangedSubviews](v8, "arrangedSubviews");
  v21[0] = (id)-[NSArray copy](v7, "copy");

  v20 = (id)objc_msgSend(MEMORY[0x24BDF6A68], "focusSystemForEnvironment:", v22);
  v9 = (void *)objc_opt_class();
  v10 = (id)objc_msgSend(v20, "focusedItem");
  v19 = CPSSafeCast_18(v9, v10);

  v18 = 0;
  if (v19)
    v6 = objc_msgSend(v21[0], "indexOfObject:", v19);
  else
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  v18 = v6;
  objc_msgSend(v21[0], "enumerateObjectsUsingBlock:", &__block_literal_global_14);
  v5 = -[CPSInformationTemplateButtonsViewController buttons](v22, "buttons");
  v12 = MEMORY[0x24BDAC760];
  v13 = -1073741824;
  v14 = 0;
  v15 = __61__CPSInformationTemplateButtonsViewController__updateButtons__block_invoke_2;
  v16 = &unk_24E270EC8;
  v17 = v22;
  -[NSArray enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", &v12);

  if (v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = v18;
    v3 = -[CPSInformationTemplateButtonsViewController buttons](v22, "buttons");
    v4 = -[NSArray count](v3, "count") - 1;

    if (v11 >= v4)
      v2 = v4;
    else
      v2 = v11;
    -[CPSInformationTemplateButtonsViewController setPreferredButtonIndex:](v22, "setPreferredButtonIndex:", v2);
    -[CPSInformationTemplateButtonsViewController setNeedsFocusUpdate](v22, "setNeedsFocusUpdate");
  }
  objc_storeStrong((id *)&v17, 0);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(v21, 0);
}

void __61__CPSInformationTemplateButtonsViewController__updateButtons__block_invoke(void *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  objc_msgSend(location[0], "removeFromSuperview");
  objc_storeStrong(location, 0);
}

void __61__CPSInformationTemplateButtonsViewController__updateButtons__block_invoke_2(id *a1, void *a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v12;
  id v13[4];
  id location[2];
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v13[3] = a3;
  v13[2] = a4;
  v13[1] = a1;
  v13[0] = +[CPSStyledTextButton buttonWithTextButton:](CPSStyledTextButton, "buttonWithTextButton:", location[0]);
  v6 = (id)objc_msgSend(a1[4], "buttonDelegate");
  objc_msgSend(v13[0], "setDelegate:");

  v7 = (void *)MEMORY[0x24BDD1628];
  v10 = (id)objc_msgSend(v13[0], "widthAnchor");
  v9 = (id)objc_msgSend(v10, "constraintEqualToConstant:", 182.0);
  v15[0] = v9;
  v8 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  objc_msgSend(v7, "activateConstraints:");

  v12 = (id)objc_msgSend(a1[4], "buttonStackView");
  objc_msgSend(v12, "addArrangedSubview:", v13[0]);

  objc_storeStrong(v13, 0);
  objc_storeStrong(location, 0);
}

- (id)preferredFocusEnvironments
{
  UIStackView *v3;
  id v4;
  NSArray *v5;
  UIStackView *v6;
  unint64_t v7;
  BOOL v8;
  char v9;
  NSArray *v10;
  char v11;
  UIStackView *v12;
  id v14;
  NSArray *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v11 = 0;
  v9 = 0;
  v8 = 0;
  if (-[CPSInformationTemplateButtonsViewController preferredButtonIndex](self, "preferredButtonIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = -[CPSInformationTemplateButtonsViewController preferredButtonIndex](self, "preferredButtonIndex");
    v12 = -[CPSInformationTemplateButtonsViewController buttonStackView](self, "buttonStackView");
    v11 = 1;
    v10 = -[UIStackView arrangedSubviews](v12, "arrangedSubviews");
    v9 = 1;
    v8 = v7 < -[NSArray count](v10, "count");
  }
  if ((v9 & 1) != 0)

  if ((v11 & 1) != 0)
  if (v8)
  {
    v6 = -[CPSInformationTemplateButtonsViewController buttonStackView](self, "buttonStackView");
    v5 = -[UIStackView arrangedSubviews](v6, "arrangedSubviews");
    v4 = -[NSArray objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", -[CPSInformationTemplateButtonsViewController preferredButtonIndex](self, "preferredButtonIndex"));
    v16[0] = v4;
    v14 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);

    return v14;
  }
  else
  {
    v3 = -[CPSInformationTemplateButtonsViewController buttonStackView](self, "buttonStackView");
    v15 = -[UIStackView arrangedSubviews](v3, "arrangedSubviews");

    return v15;
  }
}

- (NSArray)buttons
{
  return self->_buttons;
}

- (UIStackView)buttonStackView
{
  return self->_buttonStackView;
}

- (void)setButtonStackView:(id)a3
{
  objc_storeStrong((id *)&self->_buttonStackView, a3);
}

- (CPSButtonDelegate)buttonDelegate
{
  return (CPSButtonDelegate *)objc_loadWeakRetained((id *)&self->_buttonDelegate);
}

- (void)setButtonDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_buttonDelegate, a3);
}

- (unint64_t)preferredButtonIndex
{
  return self->_preferredButtonIndex;
}

- (void)setPreferredButtonIndex:(unint64_t)a3
{
  self->_preferredButtonIndex = a3;
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_destroyWeak((id *)&self->_buttonDelegate);
  objc_storeStrong((id *)&self->_buttonStackView, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
}

@end
