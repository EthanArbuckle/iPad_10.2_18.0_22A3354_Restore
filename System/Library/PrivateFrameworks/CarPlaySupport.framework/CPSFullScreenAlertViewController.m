@implementation CPSFullScreenAlertViewController

- (CPSFullScreenAlertViewController)initWithAlert:(id)a3 alertDelegate:(id)a4 templateEnvironment:(id)a5
{
  CPSFullScreenAlertViewController *v5;
  CPSFullScreenAlertViewController *v7;
  CPSFullScreenAlertViewController *v10;
  objc_super v11;
  id v12;
  id v13;
  id location[2];
  CPSFullScreenAlertViewController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v12 = 0;
  objc_storeStrong(&v12, a5);
  v5 = v15;
  v15 = 0;
  v11.receiver = v5;
  v11.super_class = (Class)CPSFullScreenAlertViewController;
  v10 = -[CPSBaseTemplateViewController initWithTemplate:templateDelegate:templateEnvironment:](&v11, sel_initWithTemplate_templateDelegate_templateEnvironment_, location[0], v13, v12);
  v15 = v10;
  objc_storeStrong((id *)&v15, v10);
  if (v10)
    objc_storeStrong((id *)&v15->_alertButtons, MEMORY[0x24BDBD1A8]);
  v7 = v15;
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v7;
}

- (CPAlertTemplate)alert
{
  void *v3;
  CPTemplate *v4;
  id v5;

  v3 = (void *)objc_opt_class();
  v4 = -[CPSBaseTemplateViewController associatedTemplate](self, "associatedTemplate");
  v5 = CPSSafeCast_22(v3, v4);

  return (CPAlertTemplate *)v5;
}

- (void)_viewDidLoad
{
  CPSAbridgableLabel *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  NSArray *v10;
  CPAlertTemplate *v11;
  NSArray *v12;
  CPAlertTemplate *v13;
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
  id v25;
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
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59[2];
  int v60;
  int v61;
  void (*v62)(id *, void *, void *, void *);
  void *v63;
  CPSFullScreenAlertViewController *v64;
  id v65;
  id v66;
  id v67[2];
  id v68;
  objc_super v69;
  SEL v70;
  CPSFullScreenAlertViewController *v71;
  _QWORD v72[10];

  v72[9] = *MEMORY[0x24BDAC8D0];
  v71 = self;
  v70 = a2;
  v69.receiver = self;
  v69.super_class = (Class)CPSFullScreenAlertViewController;
  -[CPSBaseTemplateViewController _viewDidLoad](&v69, sel__viewDidLoad);
  v68 = (id)-[CPSFullScreenAlertViewController view](v71, "view");
  v3 = v68;
  v4 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
  objc_msgSend(v3, "setBackgroundColor:");

  v67[1] = (id)1;
  v2 = [CPSAbridgableLabel alloc];
  v67[0] = -[CPSAbridgableLabel initWithFrame:](v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v67[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = v67[0];
  v6 = -[CPSFullScreenAlertViewController _titleFont](v71, "_titleFont");
  objc_msgSend(v5, "setFont:");

  objc_msgSend(v67[0], "setTextAlignment:", 1);
  v7 = v67[0];
  v8 = (id)objc_msgSend(MEMORY[0x24BDF6950], "labelColor");
  objc_msgSend(v7, "setTextColor:");

  objc_msgSend(v67[0], "setNumberOfLines:", 4);
  v9 = v67[0];
  v11 = -[CPSFullScreenAlertViewController alert](v71, "alert");
  v10 = -[CPAlertTemplate titleVariants](v11, "titleVariants");
  objc_msgSend(v9, "setTextVariants:");

  objc_msgSend(v68, "addSubview:", v67[0]);
  v66 = objc_alloc_init(MEMORY[0x24BDF6DD0]);
  objc_msgSend(v66, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v66, "setDistribution:", 1);
  objc_msgSend(v66, "setAxis:", 0);
  objc_msgSend(v66, "setSpacing:", 20.0);
  objc_msgSend(v68, "addSubview:", v66);
  v13 = -[CPSFullScreenAlertViewController alert](v71, "alert");
  v12 = -[CPAlertTemplate actions](v13, "actions");
  v59[1] = (id)MEMORY[0x24BDAC760];
  v60 = -1073741824;
  v61 = 0;
  v62 = __48__CPSFullScreenAlertViewController__viewDidLoad__block_invoke;
  v63 = &unk_24E26FD40;
  v64 = v71;
  v65 = v66;
  -[NSArray enumerateObjectsUsingBlock:](v12, "enumerateObjectsUsingBlock:");

  v59[0] = objc_alloc_init(MEMORY[0x24BDF6B78]);
  v14 = (id)-[CPSFullScreenAlertViewController view](v71, "view");
  objc_msgSend(v14, "addLayoutGuide:", v59[0]);

  v57 = (id)objc_msgSend(v59[0], "heightAnchor");
  v56 = (id)-[CPSFullScreenAlertViewController view](v71, "view");
  v55 = (id)objc_msgSend(v56, "safeAreaLayoutGuide");
  v54 = (id)objc_msgSend(v55, "heightAnchor");
  v53 = (id)objc_msgSend(v57, "constraintEqualToAnchor:multiplier:", 0.15);
  v72[0] = v53;
  v52 = (id)objc_msgSend(v59[0], "topAnchor");
  v51 = (id)-[CPSFullScreenAlertViewController view](v71, "view");
  v50 = (id)objc_msgSend(v51, "safeAreaLayoutGuide");
  v49 = (id)objc_msgSend(v50, "topAnchor");
  v48 = (id)objc_msgSend(v52, "constraintEqualToAnchor:");
  v72[1] = v48;
  v47 = (id)objc_msgSend(v67[0], "topAnchor");
  v46 = (id)objc_msgSend(v59[0], "bottomAnchor");
  v45 = (id)objc_msgSend(v47, "constraintEqualToAnchor:");
  v72[2] = v45;
  v44 = (id)objc_msgSend(v67[0], "leftAnchor");
  v43 = (id)-[CPSFullScreenAlertViewController view](v71, "view");
  v42 = (id)objc_msgSend(v43, "safeAreaLayoutGuide");
  v41 = (id)objc_msgSend(v42, "leftAnchor");
  v40 = (id)objc_msgSend(v44, "constraintEqualToAnchor:constant:", 12.0);
  v72[3] = v40;
  v39 = (id)objc_msgSend(v67[0], "rightAnchor");
  v38 = (id)-[CPSFullScreenAlertViewController view](v71, "view");
  v37 = (id)objc_msgSend(v38, "safeAreaLayoutGuide");
  v36 = (id)objc_msgSend(v37, "rightAnchor");
  v35 = (id)objc_msgSend(v39, "constraintEqualToAnchor:constant:", -12.0);
  v72[4] = v35;
  v34 = (id)objc_msgSend(v66, "bottomAnchor");
  v33 = (id)-[CPSFullScreenAlertViewController view](v71, "view");
  v32 = (id)objc_msgSend(v33, "safeAreaLayoutGuide");
  v31 = (id)objc_msgSend(v32, "bottomAnchor");
  v30 = (id)objc_msgSend(v34, "constraintEqualToAnchor:constant:", -24.0);
  v72[5] = v30;
  v29 = (id)objc_msgSend(v66, "centerXAnchor");
  v28 = (id)-[CPSFullScreenAlertViewController view](v71, "view");
  v27 = (id)objc_msgSend(v28, "safeAreaLayoutGuide");
  v26 = (id)objc_msgSend(v27, "centerXAnchor");
  v25 = (id)objc_msgSend(v29, "constraintEqualToAnchor:");
  v72[6] = v25;
  v24 = (id)objc_msgSend(v66, "leftAnchor");
  v23 = (id)-[CPSFullScreenAlertViewController view](v71, "view");
  v22 = (id)objc_msgSend(v23, "safeAreaLayoutGuide");
  v21 = (id)objc_msgSend(v22, "leftAnchor");
  v20 = (id)objc_msgSend(v24, "constraintGreaterThanOrEqualToAnchor:constant:", 12.0);
  v72[7] = v20;
  v19 = (id)objc_msgSend(v66, "rightAnchor");
  v18 = (id)-[CPSFullScreenAlertViewController view](v71, "view");
  v17 = (id)objc_msgSend(v18, "safeAreaLayoutGuide");
  v16 = (id)objc_msgSend(v17, "rightAnchor");
  v15 = (id)objc_msgSend(v19, "constraintLessThanOrEqualToAnchor:constant:", -12.0);
  v72[8] = v15;
  v58 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 9);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v58);
  objc_storeStrong(&v58, 0);
  objc_storeStrong(v59, 0);
  objc_storeStrong(&v65, 0);
  objc_storeStrong((id *)&v64, 0);
  objc_storeStrong(&v66, 0);
  objc_storeStrong(v67, 0);
  objc_storeStrong(&v68, 0);
}

void __48__CPSFullScreenAlertViewController__viewDidLoad__block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v4;
  void **v5;
  void *v6;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v16;
  id v17[4];
  id location[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x24BDAC8D0];
  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v17[3] = a3;
  v17[2] = a4;
  v17[1] = a1;
  v17[0] = +[CPSAlertButton buttonWithCPAlertAction:](CPSAlertButton, "buttonWithCPAlertAction:", location[0]);
  objc_msgSend(v17[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v17[0], "setDelegate:", a1[4]);
  v9 = v17[0];
  v14 = (id)objc_msgSend(v17[0], "widthAnchor");
  v13 = (id)objc_msgSend(v14, "constraintEqualToConstant:", 241.0);
  v19[0] = v13;
  v12 = (id)objc_msgSend(v17[0], "heightAnchor");
  v11 = (id)objc_msgSend(v12, "constraintEqualToConstant:", 40.0);
  v19[1] = v11;
  v10 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 2);
  objc_msgSend(v9, "addConstraints:");

  objc_msgSend(a1[5], "addArrangedSubview:", v17[0]);
  v16 = (id)objc_msgSend(a1[4], "alertButtons");
  v4 = (id)objc_msgSend(v16, "arrayByAddingObject:", v17[0]);
  v5 = (void **)((char *)a1[4] + 1024);
  v6 = *v5;
  *v5 = v4;

  objc_storeStrong(v17, 0);
  objc_storeStrong(location, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  CPSFullScreenAlertViewController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)CPSFullScreenAlertViewController;
  -[CPSBaseTemplateViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  v3 = (id)-[CPSFullScreenAlertViewController navigationController](v7, "navigationController");
  objc_msgSend(v3, "setNavigationBarHidden:", 1);

}

- (void)viewWillDisappear:(BOOL)a3
{
  id v3;
  objc_super v4;
  BOOL v5;
  SEL v6;
  CPSFullScreenAlertViewController *v7;

  v7 = self;
  v6 = a2;
  v5 = a3;
  v4.receiver = self;
  v4.super_class = (Class)CPSFullScreenAlertViewController;
  -[CPSBaseTemplateViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  v3 = (id)-[CPSFullScreenAlertViewController navigationController](v7, "navigationController");
  objc_msgSend(v3, "setNavigationBarHidden:", 0);

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
  v7 = (id)-[CPSFullScreenAlertViewController traitCollection](self, "traitCollection");
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

- (void)didSelectButton:(id)a3
{
  void *v3;
  CPTemplateDelegate *v4;
  CPTemplateDelegate *v5;
  char v6;
  id v7;
  id v8;
  id location[2];
  CPSFullScreenAlertViewController *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = (void *)objc_opt_class();
  v8 = CPSSafeCast_22(v3, location[0]);
  v7 = (id)objc_msgSend(v8, "identifier");
  v5 = -[CPSBaseTemplateViewController templateDelegate](v10, "templateDelegate");
  v6 = -[CPTemplateDelegate conformsToProtocol:](v5, "conformsToProtocol:", &unk_25544C5F8);

  if ((v6 & 1) != 0)
  {
    v4 = -[CPSBaseTemplateViewController templateDelegate](v10, "templateDelegate");
    -[CPTemplateDelegate handleAlertActionForIdentifier:](v4, "handleAlertActionForIdentifier:", v7);

  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (id)preferredFocusEnvironments
{
  return -[CPSFullScreenAlertViewController alertButtons](self, "alertButtons", a2, self);
}

- (NSArray)alertButtons
{
  return self->_alertButtons;
}

- (void)setAlertButtons:(id)a3
{
  objc_storeStrong((id *)&self->_alertButtons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertButtons, 0);
}

@end
