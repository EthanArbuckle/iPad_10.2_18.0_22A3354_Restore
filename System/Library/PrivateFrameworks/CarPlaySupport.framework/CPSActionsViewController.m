@implementation CPSActionsViewController

- (CPSActionsViewController)initWithEntity:(id)a3 layoutDelete:(id)a4
{
  CPSActionsViewController *v4;
  CPSActionsViewController *v6;
  CPSActionsViewController *v8;
  objc_super v9;
  id v10;
  id location[2];
  CPSActionsViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v4 = v12;
  v12 = 0;
  v9.receiver = v4;
  v9.super_class = (Class)CPSActionsViewController;
  v8 = -[CPSActionsViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0);
  v12 = v8;
  objc_storeStrong((id *)&v12, v8);
  if (v8)
  {
    objc_storeStrong((id *)&v12->_entity, location[0]);
    -[CPSActionsViewController setLayoutDelegate:](v12, "setLayoutDelegate:", v10);
  }
  v6 = v12;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v12, 0);
  return v6;
}

- (void)setLayoutDelegate:(id)a3
{
  id WeakRetained;
  BOOL v4;
  id location[2];
  CPSActionsViewController *v6;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  WeakRetained = objc_loadWeakRetained((id *)&v6->_layoutDelegate);
  v4 = WeakRetained == location[0];

  if (!v4)
  {
    objc_storeWeak((id *)&v6->_layoutDelegate, location[0]);
    *(_BYTE *)&v6->_layoutflags = *(_BYTE *)&v6->_layoutflags & 0xFE | objc_opt_respondsToSelector() & 1;
    *(_BYTE *)&v6->_layoutflags = *(_BYTE *)&v6->_layoutflags & 0xFD | (2 * (objc_opt_respondsToSelector() & 1));
    *(_BYTE *)&v6->_layoutflags = *(_BYTE *)&v6->_layoutflags & 0xFB | (4 * (objc_opt_respondsToSelector() & 1));
    *(_BYTE *)&v6->_layoutflags = *(_BYTE *)&v6->_layoutflags & 0xF7 | (8 * (objc_opt_respondsToSelector() & 1));
    *(_BYTE *)&v6->_layoutflags = *(_BYTE *)&v6->_layoutflags & 0xEF | (16 * (objc_opt_respondsToSelector() & 1));
    *(_BYTE *)&v6->_layoutflags = *(_BYTE *)&v6->_layoutflags & 0xDF | (32 * (objc_opt_respondsToSelector() & 1));
    *(_BYTE *)&v6->_layoutflags = *(_BYTE *)&v6->_layoutflags & 0xBF | ((objc_opt_respondsToSelector() & 1) << 6);
  }
  objc_storeStrong(location, 0);
}

- (void)updateWithEntity:(id)a3
{
  id location[2];
  CPSActionsViewController *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[CPSActionsViewController setEntity:](v4, "setEntity:", location[0]);
  -[CPSActionsViewController updateViews](v4, "updateViews");
  objc_storeStrong(location, 0);
}

- (void)viewDidLoad
{
  objc_super v2;
  SEL v3;
  CPSActionsViewController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSActionsViewController;
  -[CPSActionsViewController viewDidLoad](&v2, sel_viewDidLoad);
  -[CPSActionsViewController setupViews](v4, "setupViews");
  -[CPSActionsViewController updateViews](v4, "updateViews");
}

- (void)setupViews
{
  id v2;
  UIStackView *v3;
  UIStackView *v4;
  UIStackView *v5;
  UIStackView *v6;
  UIStackView *v7;
  id v8;
  id v9;
  UIFocusGuide *v10;
  id v11;
  UIStackView *v12;
  UIFocusGuide *v13;
  UIFocusGuide *v14;
  id v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDF6DD0]);
  -[CPSActionsViewController setStackView:](self, "setStackView:");

  v3 = -[CPSActionsViewController stackView](self, "stackView");
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = -[CPSActionsViewController stackView](self, "stackView");
  -[UIStackView setAlignment:](v4, "setAlignment:");

  v5 = -[CPSActionsViewController stackView](self, "stackView");
  -[UIStackView setAxis:](v5, "setAxis:", 0);

  v6 = -[CPSActionsViewController stackView](self, "stackView");
  -[UIStackView setDistribution:](v6, "setDistribution:", 3);

  v8 = (id)-[CPSActionsViewController view](self, "view");
  v7 = -[CPSActionsViewController stackView](self, "stackView");
  objc_msgSend(v8, "addSubview:");

  v9 = objc_alloc_init(MEMORY[0x24BDF6A58]);
  -[CPSActionsViewController setFocusGuide:](self, "setFocusGuide:");

  v12 = -[CPSActionsViewController stackView](self, "stackView");
  v17[0] = v12;
  v11 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v10 = -[CPSActionsViewController focusGuide](self, "focusGuide");
  -[UIFocusGuide setPreferredFocusEnvironments:](v10, "setPreferredFocusEnvironments:", v11);

  v13 = -[CPSActionsViewController focusGuide](self, "focusGuide");
  -[UIFocusGuide setEnabled:](v13, "setEnabled:", 1);

  v15 = (id)-[CPSActionsViewController view](self, "view");
  v14 = -[CPSActionsViewController focusGuide](self, "focusGuide");
  objc_msgSend(v15, "addLayoutGuide:");

}

- (void)updateViews
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  id obj;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  BOOL v28;
  id v29;
  id v30;
  CPSEntityButton *v31;
  _QWORD v32[8];
  id v33;
  _QWORD __b[8];
  id v35;
  uint64_t v36;
  int v37;
  int v38;
  void (*v39)(id *, void *, uint64_t);
  void *v40;
  id v41;
  uint64_t v42;
  int v43;
  int v44;
  void (*v45)(id *, void *, void *, void *);
  void *v46;
  id v47;
  id v48[2];
  id v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v49 = self;
  v48[1] = (id)a2;
  v48[0] = (id)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v24 = (id)objc_msgSend(v49, "stackView");
  v23 = (id)objc_msgSend(v24, "arrangedSubviews");
  v42 = MEMORY[0x24BDAC760];
  v43 = -1073741824;
  v44 = 0;
  v45 = __39__CPSActionsViewController_updateViews__block_invoke;
  v46 = &unk_24E26F190;
  v47 = v48[0];
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", &v42);

  v25 = objc_msgSend(v48[0], "count");
  v27 = (id)objc_msgSend(v49, "entity");
  v26 = (id)objc_msgSend(v27, "actionButtons");
  v28 = v25 != objc_msgSend(v26, "count");

  if (v28)
  {
    memset(__b, 0, sizeof(__b));
    v19 = (id)objc_msgSend(v49, "stackView");
    obj = (id)objc_msgSend(v19, "arrangedSubviews");

    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v51, 16);
    if (v21)
    {
      v16 = *(_QWORD *)__b[2];
      v17 = 0;
      v18 = v21;
      while (1)
      {
        v15 = v17;
        if (*(_QWORD *)__b[2] != v16)
          objc_enumerationMutation(obj);
        v35 = *(id *)(__b[1] + 8 * v17);
        v14 = (id)objc_msgSend(v49, "stackView");
        objc_msgSend(v14, "removeArrangedSubview:", v35);

        objc_msgSend(v35, "removeFromSuperview");
        ++v17;
        if (v15 + 1 >= v18)
        {
          v17 = 0;
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v51, 16);
          if (!v18)
            break;
        }
      }
    }

    memset(v32, 0, sizeof(v32));
    v11 = (id)objc_msgSend(v49, "entity");
    v12 = (id)objc_msgSend(v11, "actionButtons");

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", v32, v50, 16);
    if (v13)
    {
      v8 = *(_QWORD *)v32[2];
      v9 = 0;
      v10 = v13;
      while (1)
      {
        v7 = v9;
        if (*(_QWORD *)v32[2] != v8)
          objc_enumerationMutation(v12);
        v33 = *(id *)(v32[1] + 8 * v9);
        v31 = +[CPSEntityButton buttonWithEntityButton:](CPSEntityButton, "buttonWithEntityButton:", v33);
        v6 = (id)objc_msgSend(v33, "identifier");
        -[CPSButton setIdentifier:](v31, "setIdentifier:");

        if ((*((_BYTE *)v49 + 968) & 0x40) != 0)
        {
          v5 = (id)objc_msgSend(v49, "layoutDelegate");
          objc_msgSend(v5, "configureButton:", v31);

        }
        -[CPSButton setDelegate:](v31, "setDelegate:", v49);
        -[CPSActionButton setLayoutDelegate:](v31, "setLayoutDelegate:", v49);
        v4 = (id)objc_msgSend(v49, "stackView");
        objc_msgSend(v4, "addArrangedSubview:", v31);

        objc_storeStrong((id *)&v31, 0);
        ++v9;
        if (v7 + 1 >= v10)
        {
          v9 = 0;
          v10 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", v32, v50, 16);
          if (!v10)
            break;
        }
      }
    }

    v30 = objc_alloc_init(MEMORY[0x24BDF6F90]);
    objc_msgSend(v30, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v29 = objc_alloc_init(MEMORY[0x24BDF6F90]);
    objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v2 = (id)objc_msgSend(v49, "stackView");
    objc_msgSend(v2, "insertArrangedSubview:atIndex:", v30, 0);

    v3 = (id)objc_msgSend(v49, "stackView");
    objc_msgSend(v3, "addArrangedSubview:", v29);

    objc_storeStrong(&v29, 0);
    objc_storeStrong(&v30, 0);
  }
  else
  {
    v22 = v48[0];
    v36 = MEMORY[0x24BDAC760];
    v37 = -1073741824;
    v38 = 0;
    v39 = __39__CPSActionsViewController_updateViews__block_invoke_2;
    v40 = &unk_24E26FE28;
    v41 = v49;
    objc_msgSend(v22, "enumerateObjectsUsingBlock:", &v36);
    objc_storeStrong(&v41, 0);
  }
  objc_storeStrong(&v47, 0);
  objc_storeStrong(v48, 0);
}

void __39__CPSActionsViewController_updateViews__block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  void *v4;
  id v8[4];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v8[3] = a3;
  v8[2] = a4;
  v8[1] = a1;
  v4 = (void *)objc_opt_class();
  v8[0] = CPSSafeCast_5(v4, location[0]);
  if (v8[0])
    objc_msgSend(a1[4], "addObject:", v8[0]);
  objc_storeStrong(v8, 0);
  objc_storeStrong(location, 0);
}

void __39__CPSActionsViewController_updateViews__block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  id v7;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7 = (id)objc_msgSend(a1[4], "entity");
  v6 = (id)objc_msgSend(v7, "actionButtons");
  v5 = (id)objc_msgSend(v6, "objectAtIndex:", a3);
  objc_msgSend(location[0], "setEntityButton:");

  objc_storeStrong(location, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v3;
  id location[2];
  CPSActionsViewController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSActionsViewController;
  -[CPSActionsViewController traitCollectionDidChange:](&v3, sel_traitCollectionDidChange_, location[0]);
  -[CPSActionsViewController resetLayoutConstraints](v5, "resetLayoutConstraints");
  objc_storeStrong(location, 0);
}

- (void)resetLayoutConstraints
{
  void *v2;
  NSArray *v3;
  id v4;
  NSArray *v5;
  uint64_t v6;

  v5 = -[CPSActionsViewController layoutConstraints](self, "layoutConstraints");
  v6 = -[NSArray count](v5, "count");

  if (v6)
  {
    v2 = (void *)MEMORY[0x24BDD1628];
    v3 = -[CPSActionsViewController layoutConstraints](self, "layoutConstraints");
    objc_msgSend(v2, "deactivateConstraints:");

    -[CPSActionsViewController setLayoutConstraints:](self, "setLayoutConstraints:", 0);
    v4 = (id)-[CPSActionsViewController view](self, "view");
    objc_msgSend(v4, "setNeedsUpdateConstraints");

  }
}

- (void)updateViewConstraints
{
  NSArray *v2;
  BOOL v3;
  objc_super v4;
  SEL v5;
  CPSActionsViewController *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)CPSActionsViewController;
  -[CPSActionsViewController updateViewConstraints](&v4, sel_updateViewConstraints);
  v2 = -[CPSActionsViewController layoutConstraints](v6, "layoutConstraints");
  v3 = -[NSArray count](v2, "count") != 0;

  if (!v3)
    -[CPSActionsViewController setupLayoutConstraints](v6, "setupLayoutConstraints");
}

- (void)setupLayoutConstraints
{
  id v2;
  id v3;
  double v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  UIFocusGuide *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  UIFocusGuide *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  UIFocusGuide *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  UIFocusGuide *v28;
  id v29;
  void *v30;
  NSArray *v31;
  id v32;
  CPEntityActionsProviding *v33;
  uint64_t v34;
  id v35;
  id v36;
  UIStackView *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  UIStackView *v42;
  id v43;
  id v44;
  UIStackView *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  UIStackView *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  UIStackView *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  UIStackView *v60;
  id v61;
  id v62;
  id v63;
  id v64;
  UIStackView *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  UIStackView *v70;
  id v71;
  id v72;
  int v73;
  double v74;
  char v75;
  CPSActionButtonLayoutDelegate *v76;
  id v77;
  id v78[2];
  CPSActionsViewController *v79;
  _QWORD v80[4];
  _QWORD v81[4];
  _QWORD v82[5];

  v82[4] = *MEMORY[0x24BDAC8D0];
  v79 = self;
  v78[1] = (id)a2;
  v78[0] = (id)objc_opt_new();
  v77 = 0;
  v75 = 0;
  if ((*(_BYTE *)&v79->_layoutflags & 0x20) != 0)
  {
    v76 = -[CPSActionsViewController layoutDelegate](v79, "layoutDelegate");
    v75 = 1;
    v73 = -[CPSActionButtonLayoutDelegate buttonsShouldFill](v76, "buttonsShouldFill") & 1;
  }
  else
  {
    v73 = 0;
  }
  if ((v75 & 1) != 0)

  if (v73)
  {
    v72 = (id)-[CPSActionsViewController view](v79, "view");
    v71 = (id)objc_msgSend(v72, "topAnchor");
    v70 = -[CPSActionsViewController stackView](v79, "stackView");
    v69 = (id)-[UIStackView topAnchor](v70, "topAnchor");
    v68 = (id)objc_msgSend(v71, "constraintEqualToAnchor:");
    v82[0] = v68;
    v67 = (id)-[CPSActionsViewController view](v79, "view");
    v66 = (id)objc_msgSend(v67, "trailingAnchor");
    v65 = -[CPSActionsViewController stackView](v79, "stackView");
    v64 = (id)-[UIStackView trailingAnchor](v65, "trailingAnchor");
    v63 = (id)objc_msgSend(v66, "constraintEqualToAnchor:");
    v82[1] = v63;
    v62 = (id)-[CPSActionsViewController view](v79, "view");
    v61 = (id)objc_msgSend(v62, "leadingAnchor");
    v60 = -[CPSActionsViewController stackView](v79, "stackView");
    v59 = (id)-[UIStackView leadingAnchor](v60, "leadingAnchor");
    v58 = (id)objc_msgSend(v61, "constraintEqualToAnchor:");
    v82[2] = v58;
    v57 = (id)-[CPSActionsViewController view](v79, "view");
    v56 = (id)objc_msgSend(v57, "bottomAnchor");
    v55 = -[CPSActionsViewController stackView](v79, "stackView");
    v54 = (id)-[UIStackView bottomAnchor](v55, "bottomAnchor");
    v53 = (id)objc_msgSend(v56, "constraintEqualToAnchor:");
    v82[3] = v53;
    v2 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v82, 4);
    v3 = v77;
    v77 = v2;

  }
  else
  {
    v33 = -[CPSActionsViewController entity](v79, "entity");
    v32 = (id)-[CPEntityActionsProviding actionButtons](v33, "actionButtons");
    v34 = objc_msgSend(v32, "count");

    -[CPSActionsViewController buttonSize](v79, "buttonSize");
    v74 = 8.0 * (double)(v34 - 1) + v4 * (double)v34;
    v52 = (id)-[CPSActionsViewController view](v79, "view");
    v51 = (id)objc_msgSend(v52, "topAnchor");
    v50 = -[CPSActionsViewController stackView](v79, "stackView");
    v49 = (id)-[UIStackView topAnchor](v50, "topAnchor");
    v48 = (id)objc_msgSend(v51, "constraintEqualToAnchor:");
    v81[0] = v48;
    v47 = (id)-[CPSActionsViewController view](v79, "view");
    v46 = (id)objc_msgSend(v47, "centerXAnchor");
    v45 = -[CPSActionsViewController stackView](v79, "stackView");
    v44 = (id)-[UIStackView centerXAnchor](v45, "centerXAnchor");
    v43 = (id)objc_msgSend(v46, "constraintEqualToAnchor:");
    v81[1] = v43;
    v42 = -[CPSActionsViewController stackView](v79, "stackView");
    v41 = (id)-[UIStackView widthAnchor](v42, "widthAnchor");
    v40 = (id)objc_msgSend(v41, "constraintEqualToConstant:", v74);
    v81[2] = v40;
    v39 = (id)-[CPSActionsViewController view](v79, "view");
    v38 = (id)objc_msgSend(v39, "bottomAnchor");
    v37 = -[CPSActionsViewController stackView](v79, "stackView");
    v36 = (id)-[UIStackView bottomAnchor](v37, "bottomAnchor");
    v35 = (id)objc_msgSend(v38, "constraintEqualToAnchor:");
    v81[3] = v35;
    v5 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v81, 4);
    v6 = v77;
    v77 = v5;

  }
  objc_msgSend(v78[0], "addObjectsFromArray:", v77);
  v7 = v78[0];
  v28 = -[CPSActionsViewController focusGuide](v79, "focusGuide");
  v27 = (id)-[UIFocusGuide topAnchor](v28, "topAnchor");
  v26 = (id)-[CPSActionsViewController view](v79, "view");
  v25 = (id)objc_msgSend(v26, "topAnchor");
  v24 = (id)objc_msgSend(v27, "constraintEqualToAnchor:");
  v80[0] = v24;
  v23 = -[CPSActionsViewController focusGuide](v79, "focusGuide");
  v22 = (id)-[UIFocusGuide leadingAnchor](v23, "leadingAnchor");
  v21 = (id)-[CPSActionsViewController view](v79, "view");
  v20 = (id)objc_msgSend(v21, "leadingAnchor");
  v19 = (id)objc_msgSend(v22, "constraintEqualToAnchor:");
  v80[1] = v19;
  v18 = -[CPSActionsViewController focusGuide](v79, "focusGuide");
  v17 = (id)-[UIFocusGuide trailingAnchor](v18, "trailingAnchor");
  v16 = (id)-[CPSActionsViewController view](v79, "view");
  v15 = (id)objc_msgSend(v16, "trailingAnchor");
  v14 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
  v80[2] = v14;
  v13 = -[CPSActionsViewController focusGuide](v79, "focusGuide");
  v12 = (id)-[UIFocusGuide bottomAnchor](v13, "bottomAnchor");
  v11 = (id)-[CPSActionsViewController view](v79, "view");
  v10 = (id)objc_msgSend(v11, "bottomAnchor");
  v9 = (id)objc_msgSend(v12, "constraintEqualToAnchor:");
  v80[3] = v9;
  v8 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v80, 4);
  objc_msgSend(v7, "addObjectsFromArray:");

  v29 = (id)objc_msgSend(v78[0], "copy");
  -[CPSActionsViewController setLayoutConstraints:](v79, "setLayoutConstraints:");

  v30 = (void *)MEMORY[0x24BDD1628];
  v31 = -[CPSActionsViewController layoutConstraints](v79, "layoutConstraints");
  objc_msgSend(v30, "activateConstraints:");

  objc_storeStrong(&v77, 0);
  objc_storeStrong(v78, 0);
}

- (void)didSelectButton:(id)a3
{
  CPSEntityContentViewControllerDelegate *v3;
  CPSEntityContentViewControllerDelegate *v4;
  char v5;
  char v6;
  CPSEntityContentViewControllerDelegate *v7;
  id location[2];
  CPSActionsViewController *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = -[CPSActionsViewController eventDelegate](v9, "eventDelegate");
  v6 = 0;
  v5 = 0;
  if (v4)
  {
    v7 = -[CPSActionsViewController eventDelegate](v9, "eventDelegate");
    v6 = 1;
    v5 = objc_opt_respondsToSelector();
  }
  if ((v6 & 1) != 0)

  if ((v5 & 1) != 0)
  {
    v3 = -[CPSActionsViewController eventDelegate](v9, "eventDelegate");
    -[CPSEntityContentViewControllerDelegate viewController:didPressButton:](v3, "viewController:didPressButton:", v9, location[0]);

  }
  objc_storeStrong(location, 0);
}

- (CGSize)buttonSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  id WeakRetained;
  char v10;
  double v12;
  double v13;
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_layoutDelegate);
    objc_msgSend(v8, "buttonSize");
    v12 = v2;
    v13 = v3;

  }
  else
  {
    CGSizeMake_3();
    v12 = v4;
    v13 = v5;
  }
  v6 = v12;
  v7 = v13;
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)buttonGlyphSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  id WeakRetained;
  char v10;
  double v12;
  double v13;
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_layoutDelegate);
    objc_msgSend(v8, "buttonSize");
    v12 = v2;
    v13 = v3;

  }
  else
  {
    CGSizeMake_3();
    v12 = v4;
    v13 = v5;
  }
  v6 = v12;
  v7 = v13;
  result.height = v7;
  result.width = v6;
  return result;
}

- (double)buttonRadius
{
  double v2;
  id v4;
  id WeakRetained;
  char v6;
  double v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
    return 8.0;
  v4 = objc_loadWeakRetained((id *)&self->_layoutDelegate);
  objc_msgSend(v4, "buttonRadius");
  v8 = v2;

  return v8;
}

- (CPSEntityContentViewControllerDelegate)eventDelegate
{
  return (CPSEntityContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_eventDelegate);
}

- (void)setEventDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_eventDelegate, a3);
}

- (CPEntityActionsProviding)entity
{
  return self->_entity;
}

- (void)setEntity:(id)a3
{
  objc_storeStrong((id *)&self->_entity, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UIFocusGuide)focusGuide
{
  return self->_focusGuide;
}

- (void)setFocusGuide:(id)a3
{
  objc_storeStrong((id *)&self->_focusGuide, a3);
}

- (NSArray)layoutConstraints
{
  return self->_layoutConstraints;
}

- (void)setLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_layoutConstraints, a3);
}

- (CPSActionButtonLayoutDelegate)layoutDelegate
{
  return (CPSActionButtonLayoutDelegate *)objc_loadWeakRetained((id *)&self->_layoutDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layoutDelegate);
  objc_storeStrong((id *)&self->_layoutConstraints, 0);
  objc_storeStrong((id *)&self->_focusGuide, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_entity, 0);
  objc_destroyWeak((id *)&self->_eventDelegate);
}

@end
