@implementation CPSPointsOfInterestEntityViewController

- (CPSPointsOfInterestEntityViewController)initWithEntity:(id)a3 resourceProvider:(id)a4
{
  CPSPointsOfInterestEntityViewController *v4;
  CPSPointsOfInterestMapViewController *v5;
  uint64_t v6;
  CPSPointsOfInterestMapViewController *mapViewController;
  CPSPointsOfInterestEntityViewController *v9;
  CPSPointsOfInterestEntityViewController *v11;
  objc_super v12;
  id v13;
  id location[2];
  CPSPointsOfInterestEntityViewController *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  v4 = v15;
  v15 = 0;
  v12.receiver = v4;
  v12.super_class = (Class)CPSPointsOfInterestEntityViewController;
  v11 = -[CPSBaseEntityContentViewController initWithEntity:resourceProvider:](&v12, sel_initWithEntity_resourceProvider_, location[0], v13);
  v15 = v11;
  objc_storeStrong((id *)&v15, v11);
  if (v11)
  {
    v5 = [CPSPointsOfInterestMapViewController alloc];
    v6 = -[CPSPointsOfInterestMapViewController initWithEntity:resourceProvider:](v5, "initWithEntity:resourceProvider:", location[0], v13);
    mapViewController = v15->_mapViewController;
    v15->_mapViewController = (CPSPointsOfInterestMapViewController *)v6;

  }
  v9 = v15;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v9;
}

- (void)didUpdateEntity:(id)a3
{
  objc_super v3;
  id location[2];
  CPSPointsOfInterestEntityViewController *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)CPSPointsOfInterestEntityViewController;
  -[CPSBaseEntityContentViewController didUpdateEntity:](&v3, sel_didUpdateEntity_, location[0]);
  -[CPSBaseEntityContentViewController updateWithEntity:](v5->_mapViewController, "updateWithEntity:", location[0]);
  objc_storeStrong(location, 0);
}

- (BOOL)shouldAppearInUnsafeArea
{
  return 1;
}

- (void)viewDidLoad
{
  objc_super v2;
  SEL v3;
  CPSPointsOfInterestEntityViewController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSPointsOfInterestEntityViewController;
  -[CPSPointsOfInterestEntityViewController viewDidLoad](&v2, sel_viewDidLoad);
  -[CPSPointsOfInterestEntityViewController setupViewControllers](v4, "setupViewControllers");
}

- (void)setupViewControllers
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  CPSPointsOfInterestMapViewController *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  CPSPointsOfInterestMapViewController *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  CPSPointsOfInterestMapViewController *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  CPSPointsOfInterestMapViewController *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  id v34;
  CPSPointsOfInterestMapViewController *v35;
  id obj;
  uint64_t v37;
  id v38;
  id v39;
  _QWORD __b[8];
  id v41;
  id v42[2];
  CPSPointsOfInterestEntityViewController *v43;
  _QWORD v44[4];
  _BYTE v45[128];
  _QWORD v46[2];

  v46[1] = *MEMORY[0x24BDAC8D0];
  v43 = self;
  v42[1] = (id)a2;
  v34 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
  v33 = (id)-[CPSPointsOfInterestEntityViewController view](v43, "view");
  objc_msgSend(v33, "setBackgroundColor:", v34);

  v35 = -[CPSPointsOfInterestEntityViewController mapViewController](v43, "mapViewController");
  v46[0] = v35;
  v42[0] = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 1);

  memset(__b, 0, sizeof(__b));
  obj = v42[0];
  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v45, 16);
  if (v37)
  {
    v30 = *(_QWORD *)__b[2];
    v31 = 0;
    v32 = v37;
    while (1)
    {
      v29 = v31;
      if (*(_QWORD *)__b[2] != v30)
        objc_enumerationMutation(obj);
      v41 = *(id *)(__b[1] + 8 * v31);
      objc_msgSend(v41, "willMoveToParentViewController:", v43);
      -[CPSPointsOfInterestEntityViewController addChildViewController:](v43, "addChildViewController:", v41);
      v26 = (id)objc_msgSend(v41, "view");
      objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

      v28 = (id)-[CPSPointsOfInterestEntityViewController view](v43, "view");
      v27 = (id)objc_msgSend(v41, "view");
      objc_msgSend(v28, "addSubview:");

      objc_msgSend(v41, "didMoveToParentViewController:", v43);
      ++v31;
      if (v29 + 1 >= v32)
      {
        v31 = 0;
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v45, 16);
        if (!v32)
          break;
      }
    }
  }

  v39 = (id)objc_opt_new();
  v25 = -[CPSPointsOfInterestEntityViewController mapViewController](v43, "mapViewController");
  v24 = (id)-[CPSPointsOfInterestMapViewController view](v25, "view");
  v23 = (id)objc_msgSend(v24, "topAnchor");
  v22 = (id)-[CPSPointsOfInterestEntityViewController view](v43, "view");
  v21 = (id)objc_msgSend(v22, "topAnchor");
  v20 = (id)objc_msgSend(v23, "constraintEqualToAnchor:");
  v44[0] = v20;
  v19 = -[CPSPointsOfInterestEntityViewController mapViewController](v43, "mapViewController");
  v18 = (id)-[CPSPointsOfInterestMapViewController view](v19, "view");
  v17 = (id)objc_msgSend(v18, "bottomAnchor");
  v16 = (id)-[CPSPointsOfInterestEntityViewController view](v43, "view");
  v15 = (id)objc_msgSend(v16, "bottomAnchor");
  v14 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
  v44[1] = v14;
  v13 = -[CPSPointsOfInterestEntityViewController mapViewController](v43, "mapViewController");
  v12 = (id)-[CPSPointsOfInterestMapViewController view](v13, "view");
  v11 = (id)objc_msgSend(v12, "leadingAnchor");
  v10 = (id)-[CPSPointsOfInterestEntityViewController view](v43, "view");
  v9 = (id)objc_msgSend(v10, "leadingAnchor");
  v8 = (id)objc_msgSend(v11, "constraintEqualToAnchor:");
  v44[2] = v8;
  v7 = -[CPSPointsOfInterestEntityViewController mapViewController](v43, "mapViewController");
  v6 = (id)-[CPSPointsOfInterestMapViewController view](v7, "view");
  v5 = (id)objc_msgSend(v6, "trailingAnchor");
  v4 = (id)-[CPSPointsOfInterestEntityViewController view](v43, "view");
  v3 = (id)objc_msgSend(v4, "trailingAnchor");
  v2 = (id)objc_msgSend(v5, "constraintEqualToAnchor:");
  v44[3] = v2;
  v38 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v44, 4);

  objc_msgSend(v39, "addObjectsFromArray:", v38);
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v39);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(&v39, 0);
  objc_storeStrong(v42, 0);
}

- (CPSPointsOfInterestMapViewController)mapViewController
{
  return self->_mapViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapViewController, 0);
}

@end
