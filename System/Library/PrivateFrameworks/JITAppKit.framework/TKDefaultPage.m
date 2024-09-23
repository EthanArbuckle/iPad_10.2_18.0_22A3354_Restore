@implementation TKDefaultPage

- (TKDefaultPage)initWithDataRequest:(id)a3
{
  TKDefaultPage *v3;
  TKDefaultPage *v5;
  objc_super v6;
  id location[2];
  TKDefaultPage *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)TKDefaultPage;
  v8 = -[TKPage initWithViewName:](&v6, sel_initWithViewName_, CFSTR("_"));
  objc_storeStrong((id *)&v8, v8);
  if (v8)
    -[TKPage setDataRequest:](v8, "setDataRequest:", location[0]);
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (id)createViewController
{
  id v3;
  id v4[2];
  TKDefaultPage *v5;

  v5 = self;
  v4[1] = (id)a2;
  v4[0] = objc_alloc_init(TKContainerViewController);
  objc_msgSend(v4[0], "setTkPage:", v5);
  v3 = v4[0];
  objc_storeStrong(v4, 0);
  return v3;
}

- (void)dataLoaded:(id)a3 withError:(id)a4
{
  NSObject *queue;
  uint64_t v6;
  int v7;
  int v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  TKDefaultPage *v11;
  id v12;
  id v13;
  id v14;
  id location[2];
  TKDefaultPage *v16;

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
  v9 = __38__TKDefaultPage_dataLoaded_withError___block_invoke;
  v10 = &unk_24E0998F0;
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

uint64_t __38__TKDefaultPage_dataLoaded_withError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "loadChildPage:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a1, a1);
}

- (void)loadChildPage:(id)a3 withError:(id)a4
{
  NSURLRequest *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  UIViewController *v9;
  char v10;
  UIViewController *v12;
  TKPage *v13;
  id v14;
  int v15;
  id v16;
  id v17;
  id location[2];
  TKDefaultPage *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16 = -[TKPage viewController](v19, "viewController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = (id)objc_msgSend(location[0], "objectForKeyedSubscript:", CFSTR("view"));
    if (objc_msgSend(v14, "length"))
    {
      v13 = -[TKPage initWithViewName:]([TKPage alloc], "initWithViewName:", v14);
      v4 = -[TKPage dataRequest](v19, "dataRequest");
      -[TKPage setDataRequest:](v13, "setDataRequest:");

      -[TKPage setData:](v13, "setData:", location[0]);
      v12 = -[TKPage viewController](v13, "viewController");
      objc_msgSend(v16, "setChildViewController:", v12);
      -[TKPage didLoadData:](v19, "didLoadData:", 1);
      -[TKPage didLoadData:](v13, "didLoadData:", 1);
      objc_storeStrong((id *)&v12, 0);
      objc_storeStrong((id *)&v13, 0);
      v15 = 0;
    }
    else
    {
      v9 = -[TKPage viewController](v19, "viewController");
      v8 = +[TKApplicationViewController applicationViewController:](TKApplicationViewController, "applicationViewController:");
      v10 = objc_msgSend(v8, "handleApplicationControllerError");

      if ((v10 & 1) == 0)
      {
        v7 = +[TKApplication shared](TKApplication, "shared");
        v6 = (id)objc_msgSend(v17, "localizedDescription");
        v5 = (id)objc_msgSend(v7, "newErrorViewController:");
        objc_msgSend(v16, "setChildViewController:");

      }
      -[TKPage dataError](v19, "dataError");
      v15 = 1;
    }
    objc_storeStrong(&v14, 0);
  }
  else
  {
    v15 = 1;
  }
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

@end
