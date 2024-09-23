@implementation CPSGridTemplateViewController

- (CPSGridTemplateViewController)initWithGridTemplate:(id)a3 interfaceDelegate:(id)a4 templateEnvironment:(id)a5
{
  CPSGridTemplateViewController *v5;
  CPSGridTemplateViewController *v7;
  NSString *v8;
  CPGridTemplate *v9;
  CPSGridTemplateViewController *v12;
  objc_super v13;
  id v14;
  id v15;
  id location[2];
  CPSGridTemplateViewController *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = 0;
  objc_storeStrong(&v15, a4);
  v14 = 0;
  objc_storeStrong(&v14, a5);
  v5 = v17;
  v17 = 0;
  v13.receiver = v5;
  v13.super_class = (Class)CPSGridTemplateViewController;
  v12 = -[CPSBaseTemplateViewController initWithTemplate:templateDelegate:templateEnvironment:](&v13, sel_initWithTemplate_templateDelegate_templateEnvironment_, location[0], v15, v14);
  v17 = v12;
  objc_storeStrong((id *)&v17, v12);
  if (v12)
  {
    v9 = -[CPSGridTemplateViewController gridTemplate](v17, "gridTemplate");
    v8 = -[CPGridTemplate title](v9, "title");
    -[CPSGridTemplateViewController setTitle:](v17, "setTitle:");

  }
  v7 = v17;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v7;
}

- (CPGridTemplate)gridTemplate
{
  void *v3;
  CPTemplate *v4;
  id v5;

  v3 = (void *)objc_opt_class();
  v4 = -[CPSBaseTemplateViewController associatedTemplate](self, "associatedTemplate");
  v5 = CPSSafeCast_13(v3, v4);

  return (CPGridTemplate *)v5;
}

- (BOOL)_wantsNowPlayingButton
{
  return 1;
}

- (void)_viewDidLoad
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  CPSGridTemplateViewController *v8;
  NSArray *v9;
  CPGridTemplate *v10;
  CPSGridTemplateCollectionView *v11;
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
  id v25;
  id v26;
  id v27;
  id v28[5];
  CPSGridTemplateCollectionView *v29;
  id v30;
  id v31;
  objc_super v32;
  SEL v33;
  CPSGridTemplateViewController *v34;
  _QWORD v35[5];

  v35[4] = *MEMORY[0x24BDAC8D0];
  v34 = self;
  v33 = a2;
  v32.receiver = self;
  v32.super_class = (Class)CPSGridTemplateViewController;
  -[CPSBaseTemplateViewController _viewDidLoad](&v32, sel__viewDidLoad);
  v31 = (id)-[CPSGridTemplateViewController view](v34, "view");
  v7 = (id)-[CPSGridTemplateViewController view](v34, "view");
  v6 = (id)objc_msgSend(MEMORY[0x24BDF6950], "tableBackgroundColor");
  objc_msgSend(v7, "setBackgroundColor:");

  v8 = v34;
  v10 = -[CPSGridTemplateViewController gridTemplate](v34, "gridTemplate");
  v9 = -[CPGridTemplate gridButtons](v10, "gridButtons");
  v30 = -[CPSGridTemplateViewController _prepareCPSGridButtonsForButtons:](v8, "_prepareCPSGridButtonsForButtons:");

  v11 = [CPSGridTemplateCollectionView alloc];
  objc_msgSend(v31, "frame");
  v28[1] = v2;
  v28[2] = v3;
  v28[3] = v4;
  v28[4] = v5;
  v29 = -[CPSGridTemplateCollectionView initWithFrame:gridButtons:](v11, "initWithFrame:gridButtons:", v30, *(double *)&v2, *(double *)&v3, *(double *)&v4, *(double *)&v5);
  -[CPSGridTemplateCollectionView setTranslatesAutoresizingMaskIntoConstraints:](v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v31, "addSubview:", v29);
  -[CPSGridTemplateViewController setGridView:](v34, "setGridView:", v29);
  v27 = (id)objc_msgSend(v31, "safeAreaLayoutGuide");
  v26 = (id)objc_msgSend(v27, "topAnchor");
  v25 = (id)-[CPSGridTemplateCollectionView topAnchor](v29, "topAnchor");
  v24 = (id)objc_msgSend(v26, "constraintEqualToAnchor:");
  v35[0] = v24;
  v23 = (id)objc_msgSend(v31, "safeAreaLayoutGuide");
  v22 = (id)objc_msgSend(v23, "bottomAnchor");
  v21 = (id)-[CPSGridTemplateCollectionView bottomAnchor](v29, "bottomAnchor");
  v20 = (id)objc_msgSend(v22, "constraintEqualToAnchor:");
  v35[1] = v20;
  v19 = (id)objc_msgSend(v31, "safeAreaLayoutGuide");
  v18 = (id)objc_msgSend(v19, "leadingAnchor");
  v17 = (id)-[CPSGridTemplateCollectionView leadingAnchor](v29, "leadingAnchor");
  v16 = (id)objc_msgSend(v18, "constraintEqualToAnchor:");
  v35[2] = v16;
  v15 = (id)objc_msgSend(v31, "safeAreaLayoutGuide");
  v14 = (id)objc_msgSend(v15, "trailingAnchor");
  v13 = (id)-[CPSGridTemplateCollectionView trailingAnchor](v29, "trailingAnchor");
  v12 = (id)objc_msgSend(v14, "constraintEqualToAnchor:");
  v35[3] = v12;
  v28[0] = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 4);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v28[0]);
  objc_storeStrong(v28, 0);
  objc_storeStrong((id *)&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
}

- (id)_buttonForIdentifier:(id)a3
{
  id v4;
  NSArray *v5;
  CPSGridTemplateCollectionView *v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(_QWORD *, void *, uint64_t, _BYTE *);
  void *v11;
  id v12[4];
  uint64_t v13;
  uint64_t *v14;
  int v15;
  int v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  id location[2];
  CPSGridTemplateViewController *v21;

  v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  v14 = &v13;
  v15 = 838860800;
  v16 = 48;
  v17 = __Block_byref_object_copy__3;
  v18 = __Block_byref_object_dispose__3;
  v19 = 0;
  v6 = -[CPSGridTemplateViewController gridView](v21, "gridView");
  v5 = -[CPSGridTemplateCollectionView gridButtons](v6, "gridButtons");
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __54__CPSGridTemplateViewController__buttonForIdentifier___block_invoke;
  v11 = &unk_24E2706C8;
  v12[0] = location[0];
  v12[1] = &v13;
  -[NSArray enumerateObjectsUsingBlock:](v5, "enumerateObjectsUsingBlock:", &v7);

  v4 = (id)v14[5];
  objc_storeStrong(v12, 0);
  _Block_object_dispose(&v13, 8);
  objc_storeStrong(&v19, 0);
  objc_storeStrong(location, 0);
  return v4;
}

void __54__CPSGridTemplateViewController__buttonForIdentifier___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  char v7;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v6 = (id)objc_msgSend(location[0], "identifier");
  v7 = objc_msgSend(v6, "isEqual:", a1[4]);

  if ((v7 & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), location[0]);
    *a4 = 1;
  }
  objc_storeStrong(location, 0);
}

- (id)_prepareCPSGridButtonsForButtons:(id)a3
{
  NSArray *v4;
  CPGridTemplate *v5;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  void (*v10)(id *, void *, void *, void *);
  void *v11;
  CPSGridTemplateViewController *v12;
  id v13;
  id v14;
  id location[2];
  CPSGridTemplateViewController *v16;

  v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = (id)objc_opt_new();
  v5 = -[CPSGridTemplateViewController gridTemplate](v16, "gridTemplate");
  v4 = -[CPGridTemplate gridButtons](v5, "gridButtons");
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __66__CPSGridTemplateViewController__prepareCPSGridButtonsForButtons___block_invoke;
  v11 = &unk_24E2706F0;
  v12 = v16;
  v13 = v14;
  -[NSArray enumerateObjectsUsingBlock:](v4, "enumerateObjectsUsingBlock:");

  v6 = v14;
  objc_storeStrong(&v13, 0);
  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v6;
}

void __66__CPSGridTemplateViewController__prepareCPSGridButtonsForButtons___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v4;
  id v5;
  id v9[4];
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9[3] = a3;
  v9[2] = a4;
  v9[1] = a1;
  if ((unint64_t)a3 < *MEMORY[0x24BDB7948])
  {
    v4 = location[0];
    v5 = (id)objc_msgSend(a1[4], "templateDelegate");
    v9[0] = +[CPSGridButton buttonWithGridButton:templateDelegate:](CPSGridButton, "buttonWithGridButton:templateDelegate:", v4);

    objc_msgSend(v9[0], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9[0], "setDelegate:", a1[4]);
    objc_msgSend(a1[5], "addObject:", v9[0]);
    objc_storeStrong(v9, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)setControl:(id)a3 enabled:(BOOL)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t);
  void *v10;
  CPSGridTemplateViewController *v11;
  id v12;
  BOOL v13;
  objc_super v14;
  BOOL v15;
  id location[2];
  CPSGridTemplateViewController *v17;

  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v15 = a4;
  v14.receiver = v17;
  v14.super_class = (Class)CPSGridTemplateViewController;
  -[CPSBaseTemplateViewController setControl:enabled:](&v14, sel_setControl_enabled_, location[0], a4);
  queue = MEMORY[0x24BDAC9B8];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __52__CPSGridTemplateViewController_setControl_enabled___block_invoke;
  v10 = &unk_24E270068;
  v11 = v17;
  v12 = location[0];
  v13 = v15;
  dispatch_async(queue, &v6);

  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(location, 0);
}

void __52__CPSGridTemplateViewController_setControl_enabled___block_invoke(uint64_t a1)
{
  id v2[3];

  v2[2] = (id)a1;
  v2[1] = (id)a1;
  v2[0] = (id)objc_msgSend(*(id *)(a1 + 32), "_buttonForIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v2[0], "setEnabled:", *(_BYTE *)(a1 + 48) & 1);
  objc_storeStrong(v2, 0);
}

- (void)reloadTemplate:(id)a3
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  CPSGridTemplateViewController *v10;
  id location[2];
  CPSGridTemplateViewController *v12;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __48__CPSGridTemplateViewController_reloadTemplate___block_invoke;
  v8 = &unk_24E26EF28;
  v9 = location[0];
  v10 = v12;
  dispatch_async(queue, &v4);

  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

void __48__CPSGridTemplateViewController_reloadTemplate___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id location[3];
  uint8_t v9[24];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  location[2] = (id)a1;
  location[1] = (id)a1;
  location[0] = CarPlaySupportGeneralLogging();
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    __os_log_helper_16_2_1_8_64((uint64_t)v9, *(_QWORD *)(a1 + 32));
    _os_log_impl(&dword_21E389000, (os_log_t)location[0], OS_LOG_TYPE_DEFAULT, "Received update for grid template %@", v9, 0xCu);
  }
  objc_storeStrong(location, 0);
  objc_msgSend(*(id *)(a1 + 40), "_updateTemplate:", *(_QWORD *)(a1 + 32));
  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "title");
  objc_msgSend(*(id *)(a1 + 40), "setTitle:");

  v2 = *(void **)(a1 + 40);
  v6 = (id)objc_msgSend(v2, "gridTemplate");
  v5 = (id)objc_msgSend(v6, "gridButtons");
  v4 = (id)objc_msgSend(v2, "_prepareCPSGridButtonsForButtons:");
  v3 = (id)objc_msgSend(*(id *)(a1 + 40), "gridView");
  objc_msgSend(v3, "setGridButtons:", v4);

}

- (void)didSelectButton:(id)a3
{
  CPTemplateDelegate *v3;
  CPTemplateDelegate *v4;
  char v5;
  os_log_t oslog;
  id v7;
  id location[2];
  CPSGridTemplateViewController *v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = (id)objc_msgSend(location[0], "identifier");
  oslog = (os_log_t)CarPlaySupportGeneralLogging();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
  {
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v10, (uint64_t)v9, (uint64_t)v7);
    _os_log_debug_impl(&dword_21E389000, oslog, OS_LOG_TYPE_DEBUG, "%@: button selected with UUID: %@", v10, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v4 = -[CPSBaseTemplateViewController templateDelegate](v9, "templateDelegate");
  v5 = -[CPTemplateDelegate conformsToProtocol:](v4, "conformsToProtocol:", &unk_25544C5F8);

  if ((v5 & 1) != 0)
  {
    v3 = -[CPSBaseTemplateViewController templateDelegate](v9, "templateDelegate");
    -[CPTemplateDelegate handleActionForControlIdentifier:](v3, "handleActionForControlIdentifier:", v7);

  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (CPSGridTemplateCollectionView)gridView
{
  return (CPSGridTemplateCollectionView *)objc_loadWeakRetained((id *)&self->_gridView);
}

- (void)setGridView:(id)a3
{
  objc_storeWeak((id *)&self->_gridView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_gridView);
}

@end
