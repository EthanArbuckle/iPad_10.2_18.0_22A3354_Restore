@implementation TKPage

- (TKPage)initWithViewName:(id)a3
{
  TKPage *v3;
  uint64_t v4;
  NSString *viewName;
  uint64_t v6;
  TMLJSONObject *dataObject;
  TKPage *v9;
  id v10;
  id v11;
  objc_super v12;
  id location[2];
  TKPage *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v14;
  v14 = 0;
  v12.receiver = v3;
  v12.super_class = (Class)TKPage;
  v14 = -[TKPage init](&v12, sel_init);
  objc_storeStrong((id *)&v14, v14);
  if (v14)
  {
    v4 = objc_msgSend(location[0], "copy");
    viewName = v14->_viewName;
    v14->_viewName = (NSString *)v4;

    v10 = objc_alloc(MEMORY[0x24BEBA7A0]);
    v11 = objc_alloc_init(MEMORY[0x24BEBA7A8]);
    v6 = objc_msgSend(v10, "initWithSchema:");
    dataObject = v14->_dataObject;
    v14->_dataObject = (TMLJSONObject *)v6;

    v14->_shouldShowLoading = 1;
  }
  v9 = v14;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v14, 0);
  return v9;
}

- (void)dealloc
{
  objc_super v2;
  SEL v3;
  TKPage *v4;

  v4 = self;
  v3 = a2;
  -[TKPage dispose](self, "dispose");
  v2.receiver = v4;
  v2.super_class = (Class)TKPage;
  -[TKPage dealloc](&v2, sel_dealloc);
}

- (UIViewController)viewController
{
  id obj[2];
  TKPage *v4;
  id v5;

  v4 = self;
  obj[1] = (id)a2;
  obj[0] = objc_loadWeakRetained((id *)&self->_weakViewController);
  if (!obj[0])
  {
    obj[0] = -[TKPage createViewController](v4, "createViewController");

    objc_storeWeak((id *)&v4->_weakViewController, obj[0]);
  }
  v5 = obj[0];
  objc_storeStrong(obj, 0);
  return (UIViewController *)v5;
}

- (id)createViewController
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  int v14;
  int v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;
  id v20;
  id v21;
  int v22;
  id v23[2];
  TKPage *v24;
  id v25;

  v24 = self;
  v23[1] = (id)a2;
  v12 = +[TKApplication shared](TKApplication, "shared");
  v11 = (id)objc_msgSend(v12, "repository");
  v23[0] = (id)objc_msgSend(v11, "tmlPathForName:", v24->_viewName);

  if (objc_msgSend(v23[0], "length"))
  {
    v21 = objc_alloc_init(MEMORY[0x24BEBA790]);
    v8 = (id)objc_msgSend(MEMORY[0x24BEBA7B8], "weakReferenceWithObject:", v24);
    objc_msgSend(v21, "addObject:withIdentifier:");

    objc_msgSend(v21, "addObject:withIdentifier:", v24->_dataObject, CFSTR("data"));
    objc_msgSend(v21, "makeWeakObjectWithIdentifier:", CFSTR("owner"));
    if ((objc_msgSend(v21, "loadSourceFromPath:", v23[0]) & 1) != 0)
    {
      v20 = (id)objc_msgSend(v21, "rootObject");
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v20, "setTkPage:", v24);
        objc_storeStrong((id *)&v24->_context, v21);
        objc_initWeak(&location, v24);
        v3 = (void *)MEMORY[0x24BEBA7B0];
        v13 = MEMORY[0x24BDAC760];
        v14 = -1073741824;
        v15 = 0;
        v16 = __30__TKPage_createViewController__block_invoke;
        v17 = &unk_24E099C50;
        objc_copyWeak(&v18, &location);
        objc_msgSend(v3, "runBlock:onFinalize:", &v13, v20);
        v25 = v20;
        v22 = 1;
        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
      else
      {
        v5 = +[TKApplication shared](TKApplication, "shared");
        v4 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("View failed to load (invalid root object): %@"), v23[0]);
        v25 = (id)objc_msgSend(v5, "newErrorViewController:");

        v22 = 1;
      }
      objc_storeStrong(&v20, 0);
    }
    else
    {
      v7 = +[TKApplication shared](TKApplication, "shared");
      v6 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("View failed to load: %@"), v23[0]);
      v25 = (id)objc_msgSend(v7, "newErrorViewController:");

      v22 = 1;
    }
    objc_storeStrong(&v21, 0);
  }
  else
  {
    v10 = +[TKApplication shared](TKApplication, "shared");
    v9 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("View not found: %@"), v24->_viewName);
    v25 = (id)objc_msgSend(v10, "newErrorViewController:");

    v22 = 1;
  }
  objc_storeStrong(v23, 0);
  return v25;
}

void __30__TKPage_createViewController__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dispose");

}

- (void)dispose
{
  uint64_t v2;
  TMLJSONObject *dataObject;
  id v4;
  id v5;
  id v6[2];
  TKPage *v7;

  v7 = self;
  v6[1] = (id)a2;
  v6[0] = self->_context;
  objc_storeStrong((id *)&v7->_context, 0);
  objc_msgSend(v6[0], "dispose");
  v4 = objc_alloc(MEMORY[0x24BEBA7A0]);
  v5 = (id)-[TMLJSONObject SCHEMA](v7->_dataObject, "SCHEMA");
  v2 = objc_msgSend(v4, "initWithSchema:");
  dataObject = v7->_dataObject;
  v7->_dataObject = (TMLJSONObject *)v2;

  objc_storeStrong((id *)&v7->_dataRequest, 0);
  objc_storeStrong(v6, 0);
}

- (NSDictionary)data
{
  return (NSDictionary *)-[TMLJSONObject rawJSON](self->_dataObject, "rawJSON", a2, self);
}

- (void)setData:(id)a3
{
  id location[2];
  TKPage *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[TMLJSONObject setRawJSONSync:](v4->_dataObject, "setRawJSONSync:", location[0]);
  objc_storeStrong(location, 0);
}

- (void)load
{
  if (!self->_ready)
  {
    if (self->_dataRequest)
      -[TKPage reloadWithDelayedShowLoading:](self, "reloadWithDelayedShowLoading:", 1);
  }
}

- (void)reload
{
  -[TKPage reloadWithDelayedShowLoading:](self, "reloadWithDelayedShowLoading:", 1, a2, self);
}

- (void)loadData:(id)a3 postData:(id)a4
{
  id v4;
  id v5;
  id v7;
  BOOL v8;
  id v9;
  int v10;
  id v11;
  id location[2];
  TKPage *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v7 = (id)objc_msgSend(location[0], "absoluteString");
  v8 = objc_msgSend(v7, "length") != 0;

  if (v8)
  {
    v4 = objc_alloc(MEMORY[0x24BDD16B0]);
    v9 = (id)objc_msgSend(v4, "initWithURL:", location[0]);
    if (objc_msgSend(v11, "count"))
    {
      v5 = +[TKUtils httpDataURLEncoded:](TKUtils, "httpDataURLEncoded:", v11);
      objc_msgSend(v9, "setHTTPBody:");

    }
    -[TKPage loadRequest:](v13, "loadRequest:", v9);
    objc_storeStrong(&v9, 0);
    v10 = 0;
  }
  else
  {
    v10 = 1;
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
}

- (void)loadRequest:(id)a3
{
  id location[2];
  TKPage *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[TKPage setDataRequest:](v4, "setDataRequest:", location[0]);
  -[TKPage reloadWithDelayedShowLoading:](v4, "reloadWithDelayedShowLoading:", 1);
  objc_storeStrong(location, 0);
}

- (void)reloadWithDelayedShowLoading:(BOOL)a3
{
  NSURL *v3;
  TKNetworkTask *v4;
  TKNetworkTask *networkTask;
  id v6;
  NSURLRequest *dataRequest;
  BOOL v8;
  uint64_t v9;
  int v10;
  int v11;
  void (*v12)(id *, void *, void *, void *);
  void *v13;
  id v14[3];
  id location;
  BOOL v16;
  SEL v17;
  TKPage *v18;

  v18 = self;
  v17 = a2;
  v16 = a3;
  if (self->_networkTask)
  {
    -[TKNetworkTask cancel](v18->_networkTask, "cancel");
    objc_storeStrong((id *)&v18->_networkTask, 0);
  }
  v3 = -[NSURLRequest URL](v18->_dataRequest, "URL");
  v8 = v3 != 0;

  if (v8)
  {
    -[TKPage willChangeValueForKey:](v18, "willChangeValueForKey:");
    v18->_dataLoading = 1;
    -[TKPage didChangeValueForKey:](v18, "didChangeValueForKey:", CFSTR("dataLoading"));
    -[TKPage showLoadingViewController](v18, "showLoadingViewController");
    objc_initWeak(&location, v18);
    v6 = +[TKNetwork shared](TKNetwork, "shared");
    dataRequest = v18->_dataRequest;
    v9 = MEMORY[0x24BDAC760];
    v10 = -1073741824;
    v11 = 0;
    v12 = __39__TKPage_reloadWithDelayedShowLoading___block_invoke;
    v13 = &unk_24E099C78;
    objc_copyWeak(v14, &location);
    v4 = (TKNetworkTask *)(id)objc_msgSend(v6, "loadRequest:priority:completion:", dataRequest, 1, &v9);
    networkTask = v18->_networkTask;
    v18->_networkTask = v4;

    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
  }
}

void __39__TKPage_reloadWithDelayedShowLoading___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id WeakRetained;
  id v8;
  id v9;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v9 = 0;
  objc_storeStrong(&v9, a3);
  v8 = 0;
  objc_storeStrong(&v8, a4);
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  objc_msgSend(WeakRetained, "didFinishLoading:data:responseError:", location[0], v9, v8);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)didFinishLoading:(id)a3 data:(id)a4 responseError:(id)a5
{
  id v5;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id location[2];
  TKPage *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v12 = 0;
  objc_storeStrong(&v12, a4);
  v11 = 0;
  objc_storeStrong(&v11, a5);
  v10 = v11;
  if (location[0] && v12)
  {
    v8 = v10;
    v5 = (id)objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v12, 0, &v8);
    objc_storeStrong(&v10, v8);
    v9 = v5;
    -[TKPage dataLoaded:withError:](v14, "dataLoaded:withError:", v5, v10);
    objc_storeStrong(&v9, 0);
  }
  else
  {
    -[TKPage dataLoaded:withError:](v14, "dataLoaded:withError:", 0, v10);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)dataLoaded:(id)a3 withError:(id)a4
{
  NSObject *queue;
  TMLJSONObject *dataObject;
  id v6;
  uint64_t v8;
  int v9;
  int v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t v14;
  int v15;
  int v16;
  void (*v17)(uint64_t, char);
  void *v18;
  id v19;
  id from;
  id v21;
  id location[2];
  TKPage *v23;

  v23 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v21 = 0;
  objc_storeStrong(&v21, a4);
  objc_initWeak(&from, v23);
  if (location[0])
  {
    dataObject = v23->_dataObject;
    v6 = location[0];
    v14 = MEMORY[0x24BDAC760];
    v15 = -1073741824;
    v16 = 0;
    v17 = __31__TKPage_dataLoaded_withError___block_invoke;
    v18 = &unk_24E099CC8;
    objc_copyWeak(&v19, &from);
    -[TMLJSONObject setRawJSONAsync:completion:](dataObject, "setRawJSONAsync:completion:", v6, &v14);
    objc_destroyWeak(&v19);
  }
  else
  {
    queue = MEMORY[0x24BDAC9B8];
    v8 = MEMORY[0x24BDAC760];
    v9 = -1073741824;
    v10 = 0;
    v11 = __31__TKPage_dataLoaded_withError___block_invoke_3;
    v12 = &unk_24E099C50;
    objc_copyWeak(&v13, &from);
    dispatch_async(queue, &v8);

    objc_destroyWeak(&v13);
  }
  objc_destroyWeak(&from);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(location, 0);
}

void __31__TKPage_dataLoaded_withError___block_invoke(uint64_t a1, char a2)
{
  NSObject *queue;
  uint64_t v4;
  int v5;
  int v6;
  void (*v7)(uint64_t);
  void *v8;
  id v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v13 = a1;
  v12 = a2 & 1;
  v11 = a1;
  queue = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __31__TKPage_dataLoaded_withError___block_invoke_2;
  v8 = &unk_24E099CA0;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v10 = v12 & 1;
  dispatch_async(queue, &v4);

  objc_destroyWeak(&v9);
}

void __31__TKPage_dataLoaded_withError___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didLoadData:", *(_BYTE *)(a1 + 40) & 1);

}

void __31__TKPage_dataLoaded_withError___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "dataError");

}

- (void)dataError
{
  -[TKPage willChangeValueForKey:](self, "willChangeValueForKey:");
  self->_dataLoading = 0;
  -[TKPage didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("dataLoading"));
  -[TKPage hideLoadingViewController](self, "hideLoadingViewController");
  -[TKPage emitTMLSignal:withArguments:](self, "emitTMLSignal:withArguments:", CFSTR("dataError"), &unk_24E0A4CC0);
}

- (void)didLoadData:(BOOL)a3
{
  BOOL v3;

  v3 = a3;
  -[TKPage willChangeValueForKey:](self, "willChangeValueForKey:");
  self->_dataLoading = 0;
  -[TKPage didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("dataLoading"));
  -[TKPage hideLoadingViewController](self, "hideLoadingViewController");
  if (v3)
    -[TKPage emitTMLSignal:withArguments:](self, "emitTMLSignal:withArguments:", CFSTR("dataLoaded"), 0);
}

- (void)showLoadingViewController
{
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  int v23;
  int v24;
  void (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  char v29;
  double v30;
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  id v37;
  int v38;
  id WeakRetained;
  id v40[2];
  TKPage *v41;

  v41 = self;
  v40[1] = (id)a2;
  if (self->_shouldShowLoading)
  {
    v40[0] = objc_loadWeakRetained((id *)&v41->_loadingViewController);
    WeakRetained = objc_loadWeakRetained((id *)&v41->_weakViewController);
    if (v40[0]
      || !WeakRetained
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v38 = 1;
    }
    else
    {
      v37 = (id)objc_msgSend(WeakRetained, "view");
      v14 = +[TKApplication shared](TKApplication, "shared");
      v2 = (void *)objc_msgSend(v14, "newLoadingViewController");
      v3 = v40[0];
      v40[0] = v2;

      if (v40[0])
      {
        objc_msgSend(WeakRetained, "addChildViewController:", v40[0]);
        v36 = (id)objc_msgSend(v40[0], "view");
        objc_msgSend(v37, "bounds");
        *(double *)&v34 = v4;
        *((double *)&v34 + 1) = v5;
        *(double *)&v35 = v6;
        *((double *)&v35 + 1) = v7;
        v32 = v34;
        v33 = v35;
        objc_msgSend(v36, "setFrame:", v4, v5, v6, v7);
        objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_opt_class();
        v31 = (objc_opt_isKindOfClass() ^ 1) & 1;
        objc_msgSend(v36, "setAutoresizingMask:", 18);
        v9 = (id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
        objc_msgSend(v9, "statusBarOrientationAnimationDuration");
        v10 = v8 / 2.0;

        v30 = v10;
        v13 = (void *)MEMORY[0x24BEBDB00];
        v12 = v37;
        v11 = MEMORY[0x24BDAC760];
        v22 = MEMORY[0x24BDAC760];
        v23 = -1073741824;
        v24 = 0;
        v25 = __35__TKPage_showLoadingViewController__block_invoke;
        v26 = &unk_24E099CF0;
        v27 = v37;
        v28 = v36;
        v29 = v31 & 1;
        v15 = v11;
        v16 = -1073741824;
        v17 = 0;
        v18 = __35__TKPage_showLoadingViewController__block_invoke_2;
        v19 = &unk_24E099918;
        v20 = v40[0];
        v21 = WeakRetained;
        objc_msgSend(v13, "transitionWithView:duration:options:animations:completion:", v12, 5243008, &v22, &v15, v10);
        objc_storeWeak((id *)&v41->_loadingViewController, v40[0]);
        objc_storeStrong(&v21, 0);
        objc_storeStrong(&v20, 0);
        objc_storeStrong(&v28, 0);
        objc_storeStrong(&v27, 0);
        objc_storeStrong(&v36, 0);
        v38 = 0;
      }
      else
      {
        v38 = 1;
      }
      objc_storeStrong(&v37, 0);
    }
    objc_storeStrong(&WeakRetained, 0);
    objc_storeStrong(v40, 0);
  }
}

void __35__TKPage_showLoadingViewController__block_invoke(uint64_t a1)
{
  void *v1;
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
  id v14;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(a1 + 40));
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    v1 = (void *)MEMORY[0x24BDD1628];
    v14 = (id)objc_msgSend(*(id *)(a1 + 40), "leftAnchor");
    v13 = (id)objc_msgSend(*(id *)(a1 + 32), "leftAnchor");
    v12 = (id)objc_msgSend(v14, "constraintEqualToAnchor:");
    v16[0] = v12;
    v11 = (id)objc_msgSend(*(id *)(a1 + 40), "rightAnchor");
    v10 = (id)objc_msgSend(*(id *)(a1 + 32), "rightAnchor");
    v9 = (id)objc_msgSend(v11, "constraintEqualToAnchor:");
    v16[1] = v9;
    v8 = (id)objc_msgSend(*(id *)(a1 + 40), "topAnchor");
    v7 = (id)objc_msgSend(*(id *)(a1 + 32), "topAnchor");
    v6 = (id)objc_msgSend(v8, "constraintEqualToAnchor:");
    v16[2] = v6;
    v5 = (id)objc_msgSend(*(id *)(a1 + 40), "bottomAnchor");
    v4 = (id)objc_msgSend(*(id *)(a1 + 32), "bottomAnchor");
    v3 = (id)objc_msgSend(v5, "constraintEqualToAnchor:");
    v16[3] = v3;
    v2 = (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 4);
    objc_msgSend(v1, "activateConstraints:");

  }
}

uint64_t __35__TKPage_showLoadingViewController__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didMoveToParentViewController:", *(_QWORD *)(a1 + 40));
}

- (void)hideLoadingViewController
{
  double v2;
  id v3;
  double v4;
  uint64_t v5;
  id v6;
  void *v7;
  id WeakRetained;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  uint64_t v15;
  int v16;
  int v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20[2];
  int v21;
  id v22;
  id v23[2];
  TKPage *v24;

  v24 = self;
  v23[1] = (id)a2;
  v23[0] = objc_loadWeakRetained((id *)&self->_loadingViewController);
  WeakRetained = objc_loadWeakRetained((id *)&v24->_weakViewController);
  v22 = (id)objc_msgSend(WeakRetained, "viewIfLoaded");

  if (v23[0] && v22)
  {
    v3 = (id)objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    objc_msgSend(v3, "statusBarOrientationAnimationDuration");
    v4 = v2 / 2.0;

    v20[1] = *(id *)&v4;
    objc_msgSend(v23[0], "willMoveToParentViewController:");
    v7 = (void *)MEMORY[0x24BEBDB00];
    v6 = v22;
    v5 = MEMORY[0x24BDAC760];
    v15 = MEMORY[0x24BDAC760];
    v16 = -1073741824;
    v17 = 0;
    v18 = __35__TKPage_hideLoadingViewController__block_invoke;
    v19 = &unk_24E099940;
    v20[0] = v23[0];
    v9 = v5;
    v10 = -1073741824;
    v11 = 0;
    v12 = __35__TKPage_hideLoadingViewController__block_invoke_2;
    v13 = &unk_24E099968;
    v14 = v23[0];
    objc_msgSend(v7, "transitionWithView:duration:options:animations:completion:", v6, 5243008, &v15, &v9, v4);
    objc_storeWeak((id *)&v24->_loadingViewController, 0);
    objc_storeStrong(&v14, 0);
    objc_storeStrong(v20, 0);
    v21 = 0;
  }
  else
  {
    v21 = 1;
  }
  objc_storeStrong(&v22, 0);
  objc_storeStrong(v23, 0);
}

void __35__TKPage_hideLoadingViewController__block_invoke(uint64_t a1)
{
  id v1;

  v1 = (id)objc_msgSend(*(id *)(a1 + 32), "view");
  objc_msgSend(v1, "removeFromSuperview");

}

uint64_t __35__TKPage_hideLoadingViewController__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromParentViewController");
}

- (NSString)viewName
{
  return self->_viewName;
}

- (NSURLRequest)dataRequest
{
  return self->_dataRequest;
}

- (void)setDataRequest:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)dataLoading
{
  return self->_dataLoading;
}

- (BOOL)shouldShowLoading
{
  return self->_shouldShowLoading;
}

- (void)setShouldShowLoading:(BOOL)a3
{
  self->_shouldShowLoading = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataRequest, 0);
  objc_storeStrong((id *)&self->_viewName, 0);
  objc_storeStrong((id *)&self->_networkTask, 0);
  objc_destroyWeak((id *)&self->_loadingViewController);
  objc_destroyWeak((id *)&self->_weakViewController);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_dataObject, 0);
}

@end
