@implementation CPSEntityViewController

- (CPSEntityViewController)initWithEntityTemplate:(id)a3 templateDelegate:(id)a4 templateEnvironment:(id)a5
{
  CPSEntityViewController *v5;
  CPEntity *v6;
  CPEntity *entity;
  NSMapTable *v8;
  NSMapTable *buttonMap;
  CPSEntityResourceProvider *v10;
  uint64_t v11;
  CPSEntityResourceProvider *resourceProvider;
  CPSContactEntityViewController *v13;
  uint64_t v14;
  CPSBaseEntityContentViewController *contentViewController;
  CPSPointsOfInterestEntityViewController *v16;
  uint64_t v17;
  CPSBaseEntityContentViewController *v18;
  CPSEntityViewController *v20;
  CPSEntityViewController *v23;
  objc_super v24;
  id v25;
  id v26;
  id location[2];
  CPSEntityViewController *v28;

  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v26 = 0;
  objc_storeStrong(&v26, a4);
  v25 = 0;
  objc_storeStrong(&v25, a5);
  v5 = v28;
  v28 = 0;
  v24.receiver = v5;
  v24.super_class = (Class)CPSEntityViewController;
  v23 = -[CPSBaseTemplateViewController initWithTemplate:templateDelegate:templateEnvironment:](&v24, sel_initWithTemplate_templateDelegate_templateEnvironment_, location[0], v26, v25);
  v28 = v23;
  objc_storeStrong((id *)&v28, v23);
  if (v23)
  {
    v6 = (CPEntity *)(id)objc_msgSend(location[0], "entity");
    entity = v28->_entity;
    v28->_entity = v6;

    v8 = (NSMapTable *)(id)objc_msgSend(MEMORY[0x24BDD1650], "mapTableWithKeyOptions:valueOptions:", 517);
    buttonMap = v28->_buttonMap;
    v28->_buttonMap = v8;

    v10 = [CPSEntityResourceProvider alloc];
    v11 = -[CPSEntityResourceProvider initWithTemplateEnvironment:entityTemplate:templateDelegate:actionDelegate:](v10, "initWithTemplateEnvironment:entityTemplate:templateDelegate:actionDelegate:", v25, location[0], v26, v28);
    resourceProvider = v28->_resourceProvider;
    v28->_resourceProvider = (CPSEntityResourceProvider *)v11;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = [CPSContactEntityViewController alloc];
      v14 = -[CPSContactEntityViewController initWithEntity:resourceProvider:](v13, "initWithEntity:resourceProvider:", v28->_entity, v28->_resourceProvider);
      contentViewController = v28->_contentViewController;
      v28->_contentViewController = (CPSBaseEntityContentViewController *)v14;

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v16 = [CPSPointsOfInterestEntityViewController alloc];
        v17 = -[CPSPointsOfInterestEntityViewController initWithEntity:resourceProvider:](v16, "initWithEntity:resourceProvider:", v28->_entity, v28->_resourceProvider);
        v18 = v28->_contentViewController;
        v28->_contentViewController = (CPSBaseEntityContentViewController *)v17;

      }
    }
  }
  v20 = v28;
  objc_storeStrong(&v25, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v28, 0);
  return v20;
}

- (id)entityTemplate
{
  void *v3;
  CPTemplate *v4;
  id v5;

  v3 = (void *)objc_opt_class();
  v4 = -[CPSBaseTemplateViewController associatedTemplate](self, "associatedTemplate");
  v5 = CPSSafeCast_16(v3, v4);

  return v5;
}

- (id)entityTemplateDelegate
{
  CPTemplateDelegate *v3;
  id v4;

  v3 = -[CPSBaseTemplateViewController templateDelegate](self, "templateDelegate");
  v4 = CPSSafeProtocolCast_2(&unk_255452368, v3);

  return v4;
}

- (void)_viewDidLoad
{
  objc_super v2;
  SEL v3;
  CPSEntityViewController *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)CPSEntityViewController;
  -[CPSBaseTemplateViewController _viewDidLoad](&v2, sel__viewDidLoad);
  -[CPSEntityViewController setupViewControllers](v4, "setupViewControllers");
}

- (void)setupViewControllers
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  CPSBaseEntityContentViewController *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  CPSBaseEntityContentViewController *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  CPSBaseEntityContentViewController *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  CPSBaseEntityContentViewController *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  CPSBaseEntityContentViewController *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  CPSBaseEntityContentViewController *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  CPSBaseEntityContentViewController *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  CPSBaseEntityContentViewController *v57;
  id v58;
  id v59;
  id v60;
  CPSBaseEntityContentViewController *v61;
  CPSBaseEntityContentViewController *v62;
  CPSBaseEntityContentViewController *v63;
  id v64;
  CPSBaseEntityContentViewController *v65;
  id v66;
  CPSBaseEntityContentViewController *v67;
  CPSBaseEntityContentViewController *v68;
  _BYTE v69[12];
  SEL v70;
  CPSEntityViewController *v71;
  _QWORD v72[4];
  _QWORD v73[5];

  v73[4] = *MEMORY[0x24BDAC8D0];
  v71 = self;
  v70 = a2;
  v59 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
  v58 = (id)-[CPSEntityViewController view](v71, "view");
  objc_msgSend(v58, "setBackgroundColor:", v59);

  v61 = -[CPSEntityViewController contentViewController](v71, "contentViewController");
  v60 = (id)-[CPSBaseEntityContentViewController view](v61, "view");
  objc_msgSend(v60, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v62 = -[CPSEntityViewController contentViewController](v71, "contentViewController");
  -[CPSBaseEntityContentViewController willMoveToParentViewController:](v62, "willMoveToParentViewController:", v71);

  v63 = -[CPSEntityViewController contentViewController](v71, "contentViewController");
  -[CPSEntityViewController addChildViewController:](v71, "addChildViewController:");

  v66 = (id)-[CPSEntityViewController view](v71, "view");
  v65 = -[CPSEntityViewController contentViewController](v71, "contentViewController");
  v64 = (id)-[CPSBaseEntityContentViewController view](v65, "view");
  objc_msgSend(v66, "addSubview:");

  v67 = -[CPSEntityViewController contentViewController](v71, "contentViewController");
  -[CPSBaseEntityContentViewController didMoveToParentViewController:](v67, "didMoveToParentViewController:", v71);

  *(_DWORD *)&v69[8] = 0;
  v68 = -[CPSEntityViewController contentViewController](v71, "contentViewController");
  *(_QWORD *)v69 = -[CPSBaseEntityContentViewController shouldAppearInUnsafeArea](v68, "shouldAppearInUnsafeArea");

  if ((v69[0] & 1) != 0)
  {
    v57 = -[CPSEntityViewController contentViewController](v71, "contentViewController");
    v56 = (id)-[CPSBaseEntityContentViewController view](v57, "view");
    v55 = (id)objc_msgSend(v56, "topAnchor");
    v54 = (id)-[CPSEntityViewController view](v71, "view");
    v53 = (id)objc_msgSend(v54, "topAnchor");
    v52 = (id)objc_msgSend(v55, "constraintEqualToAnchor:");
    v73[0] = v52;
    v51 = -[CPSEntityViewController contentViewController](v71, "contentViewController");
    v50 = (id)-[CPSBaseEntityContentViewController view](v51, "view");
    v49 = (id)objc_msgSend(v50, "bottomAnchor");
    v48 = (id)-[CPSEntityViewController view](v71, "view");
    v47 = (id)objc_msgSend(v48, "bottomAnchor");
    v46 = (id)objc_msgSend(v49, "constraintEqualToAnchor:");
    v73[1] = v46;
    v45 = -[CPSEntityViewController contentViewController](v71, "contentViewController");
    v44 = (id)-[CPSBaseEntityContentViewController view](v45, "view");
    v43 = (id)objc_msgSend(v44, "leftAnchor");
    v42 = (id)-[CPSEntityViewController view](v71, "view");
    v41 = (id)objc_msgSend(v42, "leftAnchor");
    v40 = (id)objc_msgSend(v43, "constraintEqualToAnchor:");
    v73[2] = v40;
    v39 = -[CPSEntityViewController contentViewController](v71, "contentViewController");
    v38 = (id)-[CPSBaseEntityContentViewController view](v39, "view");
    v37 = (id)objc_msgSend(v38, "rightAnchor");
    v36 = (id)-[CPSEntityViewController view](v71, "view");
    v35 = (id)objc_msgSend(v36, "rightAnchor");
    v34 = (id)objc_msgSend(v37, "constraintEqualToAnchor:");
    v73[3] = v34;
    v2 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v73, 4);
    v3 = *(void **)&v69[4];
    *(_QWORD *)&v69[4] = v2;

  }
  else
  {
    v33 = -[CPSEntityViewController contentViewController](v71, "contentViewController");
    v32 = (id)-[CPSBaseEntityContentViewController view](v33, "view");
    v31 = (id)objc_msgSend(v32, "topAnchor");
    v30 = (id)-[CPSEntityViewController view](v71, "view");
    v29 = (id)objc_msgSend(v30, "safeAreaLayoutGuide");
    v28 = (id)objc_msgSend(v29, "topAnchor");
    v27 = (id)objc_msgSend(v31, "constraintEqualToAnchor:");
    v72[0] = v27;
    v26 = -[CPSEntityViewController contentViewController](v71, "contentViewController");
    v25 = (id)-[CPSBaseEntityContentViewController view](v26, "view");
    v24 = (id)objc_msgSend(v25, "bottomAnchor");
    v23 = (id)-[CPSEntityViewController view](v71, "view");
    v22 = (id)objc_msgSend(v23, "safeAreaLayoutGuide");
    v21 = (id)objc_msgSend(v22, "bottomAnchor");
    v20 = (id)objc_msgSend(v24, "constraintEqualToAnchor:");
    v72[1] = v20;
    v19 = -[CPSEntityViewController contentViewController](v71, "contentViewController");
    v18 = (id)-[CPSBaseEntityContentViewController view](v19, "view");
    v17 = (id)objc_msgSend(v18, "leftAnchor");
    v16 = (id)-[CPSEntityViewController view](v71, "view");
    v15 = (id)objc_msgSend(v16, "safeAreaLayoutGuide");
    v14 = (id)objc_msgSend(v15, "leftAnchor");
    v13 = (id)objc_msgSend(v17, "constraintEqualToAnchor:");
    v72[2] = v13;
    v12 = -[CPSEntityViewController contentViewController](v71, "contentViewController");
    v11 = (id)-[CPSBaseEntityContentViewController view](v12, "view");
    v10 = (id)objc_msgSend(v11, "rightAnchor");
    v9 = (id)-[CPSEntityViewController view](v71, "view");
    v8 = (id)objc_msgSend(v9, "safeAreaLayoutGuide");
    v7 = (id)objc_msgSend(v8, "rightAnchor");
    v6 = (id)objc_msgSend(v10, "constraintEqualToAnchor:");
    v72[3] = v6;
    v4 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v72, 4);
    v5 = *(void **)&v69[4];
    *(_QWORD *)&v69[4] = v4;

  }
  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", *(_QWORD *)&v69[4]);
  objc_storeStrong((id *)&v69[4], 0);
}

- (void)trailingBarButtonPressed:(id)a3
{
  CPTemplateDelegate *v3;
  CPTemplateDelegate *v4;
  char v5;
  NSMapTable *v6;
  os_log_t oslog;
  id v8;
  id v9;
  id location[2];
  CPSEntityViewController *v11;
  uint8_t v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = -[CPSEntityViewController buttonMap](v11, "buttonMap");
  v9 = -[NSMapTable objectForKey:](v6, "objectForKey:", location[0]);

  v8 = (id)objc_msgSend(v9, "identifier");
  oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v12, (uint64_t)v11, (uint64_t)v8);
    _os_log_debug_impl(&dword_21E389000, oslog, OS_LOG_TYPE_DEBUG, "%@: entity button selected with UUID: %@", v12, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v4 = -[CPSBaseTemplateViewController templateDelegate](v11, "templateDelegate");
  v5 = -[CPTemplateDelegate conformsToProtocol:](v4, "conformsToProtocol:", &unk_25544C5F8);

  if ((v5 & 1) != 0)
  {
    v3 = -[CPSBaseTemplateViewController templateDelegate](v11, "templateDelegate");
    -[CPTemplateDelegate handleActionForControlIdentifier:](v3, "handleActionForControlIdentifier:", v8);

  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)entityContentViewController:(id)a3 didPressButton:(id)a4 forEntity:(id)a5
{
  CPTemplateDelegate *v6;
  CPTemplateDelegate *v7;
  char v8;
  void *v9;
  id v10;
  id v11;
  NSString *v12;
  CPSTemplateEnvironment *v13;
  CPSTemplateViewControllerDelegate *v14;
  char isKindOfClass;
  id v18;
  CPEntity *v19;
  id v20;
  char v21;
  CPEntity *v22;
  char v23;
  id v24;
  os_log_type_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id location[2];
  CPSEntityViewController *v31;
  char v32;
  uint8_t v33[24];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v29 = 0;
  objc_storeStrong(&v29, a4);
  v28 = 0;
  objc_storeStrong(&v28, a5);
  v27 = (id)objc_msgSend(v29, "identifier");
  v26 = CarPlaySupportGeneralLogging();
  v25 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v33, (uint64_t)v31, (uint64_t)v27);
    _os_log_debug_impl(&dword_21E389000, (os_log_t)v26, v25, "%@: entity button selected with UUID: %@", v33, 0x16u);
  }
  objc_storeStrong(&v26, 0);
  objc_opt_class();
  v23 = 0;
  v21 = 0;
  isKindOfClass = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = (id)objc_msgSend(v29, "entityButton");
    v23 = 1;
    objc_opt_class();
    isKindOfClass = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v22 = -[CPSEntityViewController entity](v31, "entity");
      v21 = 1;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  if ((v21 & 1) != 0)

  if ((v23 & 1) != 0)
  if ((isKindOfClass & 1) != 0)
  {
    v20 = (id)objc_msgSend(v29, "entityButton");
    v19 = -[CPSEntityViewController entity](v31, "entity");
    v9 = (void *)MEMORY[0x24BE90820];
    v13 = -[CPSBaseTemplateViewController templateEnvironment](v31, "templateEnvironment");
    v12 = -[CPSTemplateEnvironment bundleIdentifier](v13, "bundleIdentifier");
    v11 = (id)-[CPEntity name](v19, "name");
    v10 = (id)objc_msgSend(v20, "phoneOrEmail");
    v18 = (id)objc_msgSend(v9, "messageComposeNewThreadDirectActionWithAppBundleId:fullName:phoneOrEmailAddress:", v12, v11);

    v14 = -[CPSBaseTemplateViewController viewControllerDelegate](v31, "viewControllerDelegate");
    -[CPSTemplateViewControllerDelegate templateViewController:shouldActivateSiriWithDirectActionContext:](v14, "templateViewController:shouldActivateSiriWithDirectActionContext:", v31, v18);

    v32 = 1;
    objc_storeStrong(&v18, 0);
    objc_storeStrong((id *)&v19, 0);
    objc_storeStrong(&v20, 0);
  }
  else
  {
    v7 = -[CPSBaseTemplateViewController templateDelegate](v31, "templateDelegate");
    v8 = -[CPTemplateDelegate conformsToProtocol:](v7, "conformsToProtocol:", &unk_25544C5F8);

    if ((v8 & 1) != 0)
    {
      v6 = -[CPSBaseTemplateViewController templateDelegate](v31, "templateDelegate");
      -[CPTemplateDelegate handleActionForControlIdentifier:](v6, "handleActionForControlIdentifier:", v27);

    }
    v32 = 1;
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
  return v32 & 1;
}

- (BOOL)entityContentViewController:(id)a3 regionDidChange:(id *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v9;
  id v10;
  char v11;
  id location[2];
  CPSEntityViewController *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v14 = v4;
  v15 = v5;
  v16 = v6;
  v17 = v7;
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = -[CPSEntityViewController entityTemplateDelegate](v13, "entityTemplateDelegate");
  v11 = objc_msgSend(v10, "conformsToProtocol:", &unk_255452368);

  if ((v11 & 1) != 0)
  {
    v9 = -[CPSEntityViewController entityTemplateDelegate](v13, "entityTemplateDelegate");
    objc_msgSend(v9, "handleMapRegionDidChange:", v14, v15, v16, v17);

  }
  objc_storeStrong(location, 0);
  return 1;
}

- (BOOL)entityContentViewController:(id)a3 didSelectPointOfInterestWithIdentifier:(id)a4
{
  id v5;
  id v7;
  char v8;
  id v9;
  id location[2];
  CPSEntityViewController *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v7 = -[CPSEntityViewController entityTemplateDelegate](v11, "entityTemplateDelegate");
  v8 = objc_msgSend(v7, "conformsToProtocol:", &unk_255452368);

  if ((v8 & 1) != 0)
  {
    v5 = -[CPSEntityViewController entityTemplateDelegate](v11, "entityTemplateDelegate");
    objc_msgSend(v5, "handleDidSelectPointOfInterestWithIdentifier:", v9);

  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return 1;
}

- (BOOL)entityContentViewController:(id)a3 didPressButton:(id)a4 forPOI:(id)a5
{
  CPTemplateDelegate *v6;
  CPTemplateDelegate *v7;
  char v8;
  os_log_t oslog;
  id v12;
  id v13;
  id v14;
  id location[2];
  CPSEntityViewController *v16;
  uint8_t v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  v13 = 0;
  objc_storeStrong(&v13, a5);
  v12 = (id)objc_msgSend(v14, "identifier");
  oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v17, (uint64_t)v16, (uint64_t)v12);
    _os_log_debug_impl(&dword_21E389000, oslog, OS_LOG_TYPE_DEBUG, "%@: POI button selected with UUID: %@", v17, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v7 = -[CPSBaseTemplateViewController templateDelegate](v16, "templateDelegate");
  v8 = -[CPTemplateDelegate conformsToProtocol:](v7, "conformsToProtocol:", &unk_25544C5F8);

  if ((v8 & 1) != 0)
  {
    v6 = -[CPSBaseTemplateViewController templateDelegate](v16, "templateDelegate");
    -[CPTemplateDelegate handleActionForControlIdentifier:](v6, "handleActionForControlIdentifier:", v12);

  }
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return 1;
}

- (void)updateEntityTemplate:(id)a3 withProxyDelegate:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CPSEntityViewController *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  CPSEntityViewController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = 0;
  objc_storeStrong(&v14, a4);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __66__CPSEntityViewController_updateEntityTemplate_withProxyDelegate___block_invoke;
  v10 = &unk_24E270310;
  v11 = v16;
  v12 = location[0];
  v13 = v14;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

void __66__CPSEntityViewController_updateEntityTemplate_withProxyDelegate___block_invoke(uint64_t a1)
{
  id v1;
  id v3;
  id v4;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "resourceProvider");
  objc_msgSend(v1, "updateEntityTemplate:withProxyDelegate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 32), "setAssociatedTemplate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setTemplateDelegate:", *(_QWORD *)(a1 + 48));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "contentViewController");
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "entity");
  objc_msgSend(v4, "updateWithEntity:");

}

- (CPEntity)entity
{
  return self->_entity;
}

- (CPSBaseEntityContentViewController)contentViewController
{
  return self->_contentViewController;
}

- (NSMapTable)buttonMap
{
  return self->_buttonMap;
}

- (void)setButtonMap:(id)a3
{
  objc_storeStrong((id *)&self->_buttonMap, a3);
}

- (CPSEntityResourceProvider)resourceProvider
{
  return self->_resourceProvider;
}

- (void)setResourceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_resourceProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceProvider, 0);
  objc_storeStrong((id *)&self->_buttonMap, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_entity, 0);
}

@end
