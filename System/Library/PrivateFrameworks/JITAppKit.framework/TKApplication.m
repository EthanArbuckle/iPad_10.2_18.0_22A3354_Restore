@implementation TKApplication

+ (id)shared
{
  uint64_t obj;
  int v4;
  int v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  id v8;
  SEL v9;
  id v10;
  id location;
  dispatch_once_t *v12;

  v10 = a1;
  v9 = a2;
  obj = MEMORY[0x24BDAC760];
  v4 = -1073741824;
  v5 = 0;
  v6 = __23__TKApplication_shared__block_invoke;
  v7 = &__block_descriptor_40_e5_v8__0l;
  v8 = a1;
  v12 = (dispatch_once_t *)&shared_onceToken_0;
  location = 0;
  objc_storeStrong(&location, &obj);
  if (*v12 != -1)
    dispatch_once(v12, location);
  objc_storeStrong(&location, 0);
  return (id)shared_shared;
}

uint64_t __23__TKApplication_shared__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  objc_super v4;
  uint64_t v5;
  uint64_t v6;

  v6 = a1;
  v5 = a1;
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)&OBJC_METACLASS___TKApplication;
  v1 = objc_msgSend(objc_msgSendSuper2(&v4, sel_allocWithZone_, 0), "init");
  v2 = (void *)shared_shared;
  shared_shared = v1;

  +[TKDefaultImageServices setup](TKDefaultImageServices, "setup");
  return objc_msgSend(MEMORY[0x24BEBA798], "setExceptionHandlerBlock:", &__block_literal_global_5);
}

void __23__TKApplication_shared__block_invoke_2(void *a1, void *a2)
{
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  NSLog(CFSTR("JITAppKit exception: %@"), location[0]);
  objc_storeStrong(location, 0);
}

+ (id)allocWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(a1, "shared");
}

- (id)copyWithZone:(_NSZone *)a3
{
  return self;
}

- (void)loadBundle:(id)a3 completion:(id)a4
{
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  TKApplication *v11;
  id v12;
  id v13;
  id location[2];
  TKApplication *v15;

  v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v13 = 0;
  objc_storeStrong(&v13, a4);
  -[TKApplication willChangeValueForKey:](v15, "willChangeValueForKey:");
  v15->_ready = 0;
  objc_storeStrong((id *)&v15->_repository, 0);
  -[TKApplication didChangeValueForKey:](v15, "didChangeValueForKey:", CFSTR("ready"));
  v5 = location[0];
  v6 = MEMORY[0x24BDAC760];
  v7 = -1073741824;
  v8 = 0;
  v9 = __39__TKApplication_loadBundle_completion___block_invoke;
  v10 = &unk_24E099D98;
  v11 = v15;
  v12 = v13;
  +[TKRepository loadWithURL:completion:](TKRepository, "loadWithURL:completion:", v5);
  objc_storeStrong(&v12, 0);
  objc_storeStrong((id *)&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

void __39__TKApplication_loadBundle_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id location[2];

  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v5 = 0;
  objc_storeStrong(&v5, a3);
  if (location[0])
    objc_msgSend(*(id *)(a1 + 32), "didLoadRepository:", location[0]);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
}

- (void)clearBundleCache
{
  +[TKRepository reset](TKRepository, "reset", a2, self);
}

- (void)didLoadRepository:(id)a3
{
  id location[2];
  TKApplication *v4;

  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  -[TKApplication willChangeValueForKey:](v4, "willChangeValueForKey:");
  objc_storeStrong((id *)&v4->_repository, location[0]);
  v4->_ready = 1;
  -[TKApplication didChangeValueForKey:](v4, "didChangeValueForKey:", CFSTR("ready"));
  objc_storeStrong(location, 0);
}

- (NSURL)bundleURL
{
  return -[TKRepository URL](self->_repository, "URL", a2, self);
}

- (NSString)bundleVersion
{
  return -[TKRepository version](self->_repository, "version", a2, self);
}

- (id)loadPageWithDataRequest:(id)a3
{
  TKDefaultPage *v3;
  UIViewController *v5;
  UIViewController *v6;
  TKDefaultPage *v7;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [TKDefaultPage alloc];
  v7 = -[TKDefaultPage initWithDataRequest:](v3, "initWithDataRequest:", location[0]);
  v6 = -[TKPage viewController](v7, "viewController");
  -[TKPage load](v7, "load");
  v5 = v6;
  objc_storeStrong((id *)&v6, 0);
  objc_storeStrong((id *)&v7, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)loadPage:(id)a3
{
  TKPage *v3;
  UIViewController *v5;
  UIViewController *v6;
  TKPage *v7;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = [TKPage alloc];
  v7 = -[TKPage initWithViewName:](v3, "initWithViewName:", location[0]);
  v6 = -[TKPage viewController](v7, "viewController");
  -[TKPage load](v7, "load");
  v5 = v6;
  objc_storeStrong((id *)&v6, 0);
  objc_storeStrong((id *)&v7, 0);
  objc_storeStrong(location, 0);
  return v5;
}

- (id)loadPage:(id)a3 withData:(id)a4
{
  TKPage *v4;
  UIViewController *v7;
  UIViewController *v8;
  TKPage *v9;
  id v10;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v4 = [TKPage alloc];
  v9 = -[TKPage initWithViewName:](v4, "initWithViewName:", location[0]);
  -[TKPage setData:](v9, "setData:", v10);
  v8 = -[TKPage viewController](v9, "viewController");
  -[TKPage load](v9, "load");
  v7 = v8;
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)loadPage:(id)a3 withDataRequest:(id)a4
{
  TKPage *v4;
  UIViewController *v7;
  UIViewController *v8;
  TKPage *v9;
  id v10;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v4 = [TKPage alloc];
  v9 = -[TKPage initWithViewName:](v4, "initWithViewName:", location[0]);
  -[TKPage setDataRequest:](v9, "setDataRequest:", v10);
  v8 = -[TKPage viewController](v9, "viewController");
  -[TKPage load](v9, "load");
  v7 = v8;
  objc_storeStrong((id *)&v8, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)loadView:(id)a3
{
  id v3;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id location[3];
  id v12;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8 = +[TKApplication shared](TKApplication, "shared");
  v7 = (id)objc_msgSend(v8, "repository");
  v10 = (id)objc_msgSend(v7, "tmlPathForName:", location[0]);

  if (objc_msgSend(v10, "length"))
  {
    v12 = (id)objc_msgSend(MEMORY[0x24BEBDB00], "tmlLoadViewFromPath:", v10);
  }
  else
  {
    v3 = objc_alloc(MEMORY[0x24BEBD708]);
    v9 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v9, "setNumberOfLines:", 0);
    v5 = (id)objc_msgSend(MEMORY[0x24BEBD5E0], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    objc_msgSend(v9, "setFont:");

    objc_msgSend(v9, "setTextAlignment:", 1);
    v6 = (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("View not found: %@"), location[0]);
    objc_msgSend(v9, "setText:");

    v12 = v9;
    objc_storeStrong(&v9, 0);
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v12;
}

- (id)loadObject:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = +[TKApplication shared](TKApplication, "shared");
  v4 = (id)objc_msgSend(v5, "repository");
  v7 = (id)objc_msgSend(v4, "tmlPathForName:", location[0]);

  v6 = (id)objc_msgSend(MEMORY[0x24BEDCDF0], "tmlLoadObjectFromPath:", v7);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return v6;
}

- (Class)loadClass:(id)a3
{
  id v4;
  id v5;
  id v6;
  id location[3];
  id v8;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = +[TKApplication shared](TKApplication, "shared");
  v4 = (id)objc_msgSend(v5, "repository");
  v6 = (id)objc_msgSend(v4, "tmlPathForName:", location[0]);

  if (objc_msgSend(v6, "length"))
    v8 = (id)objc_msgSend(MEMORY[0x24BEBA790], "createClassFromPath:", v6);
  else
    v8 = 0;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return (Class)v8;
}

- (id)newLoadingViewController
{
  id location[3];
  void *v4;

  location[2] = self;
  location[1] = (id)a2;
  location[0] = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = (void *)objc_msgSend(location[0], "newLoadingViewController");
  else
    v4 = 0;
  objc_storeStrong(location, 0);
  return v4;
}

- (id)newErrorViewController:(id)a3
{
  id WeakRetained;
  id location[2];
  TKApplication *v6;
  id v7;

  v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  WeakRetained = objc_loadWeakRetained((id *)&v6->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = (id)objc_msgSend(WeakRetained, "newErrorViewController:", location[0]);
  else
    v7 = +[TKErrorViewController viewControllerForMessage:](TKErrorViewController, "viewControllerForMessage:", location[0]);
  objc_storeStrong(&WeakRetained, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)absoluteURL:(id)a3
{
  id v3;
  id v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id location[2];
  TKApplication *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = (id)objc_msgSend(location[0], "scheme");
  v11 = 0;
  if (!objc_msgSend(v10, "length"))
    v11 = v13->_baseURL != 0;

  if (v11)
  {
    v7 = (void *)MEMORY[0x24BDBCF48];
    v9 = (id)objc_msgSend(location[0], "absoluteString");
    v8 = (id)objc_msgSend(v7, "URLWithString:relativeToURL:");
    v3 = (id)objc_msgSend(v8, "absoluteURL");
    v4 = location[0];
    location[0] = v3;

  }
  v6 = location[0];
  objc_storeStrong(location, 0);
  return v6;
}

- (id)tmlPathForName:(id)a3
{
  id v4;
  id v5;
  id v6;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = +[TKApplication shared](TKApplication, "shared");
  v4 = (id)objc_msgSend(v5, "repository");
  v6 = (id)objc_msgSend(v4, "tmlPathForName:", location[0]);

  objc_storeStrong(location, 0);
  return v6;
}

- (BOOL)ready
{
  return self->_ready;
}

- (TKRepository)repository
{
  return self->_repository;
}

- (TKApplicationDelegate)delegate
{
  return (TKApplicationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bundleURL, 0);
  objc_storeStrong((id *)&self->_repository, 0);
}

@end
