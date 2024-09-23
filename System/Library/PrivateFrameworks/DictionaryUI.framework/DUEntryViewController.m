@implementation DUEntryViewController

+ (id)entryViewControllerWithDefinitionValue:(id)a3
{
  id v3;
  DUEntryViewController *v4;

  v3 = a3;
  v4 = -[DUEntryViewController initWithDefinitionValue:]([DUEntryViewController alloc], "initWithDefinitionValue:", v3);

  return v4;
}

- (DUEntryViewController)initWithDefinitionValue:(id)a3
{
  id v4;
  DUEntryViewController *v5;
  DUEntryViewController *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DUEntryViewController;
  v5 = -[DUEntryViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    -[DUEntryViewController setDefinitionValue:](v5, "setDefinitionValue:", v4);
    objc_msgSend(v4, "term");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DUEntryViewController setTitle:](v6, "setTitle:", v7);

  }
  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)DUEntryViewController;
  -[DUEntryViewController viewDidLoad](&v13, sel_viewDidLoad);
  -[DUEntryViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutoresizingMask:", 18);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA9B8]), "initWithSource:forMainFrameOnly:", CFSTR("a { pointer-events:none !important; }"),
                 0);
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "_addUserStyleSheet:", v4);
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setUserContentController:", v5);
  v7 = objc_alloc(MEMORY[0x24BDFA918]);
  objc_msgSend(v3, "bounds");
  v8 = (void *)objc_msgSend(v7, "initWithFrame:configuration:", v6);
  objc_msgSend(v8, "setOpaque:", 0);
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v9);

  objc_msgSend(v8, "setAutoresizingMask:", 18);
  -[DUEntryViewController definitionValue](self, "definitionValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "longDefinition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v8, "loadHTMLString:baseURL:", v11, 0);

  objc_msgSend(v3, "addSubview:", v8);
}

- (DUDefinitionValue)definitionValue
{
  return (DUDefinitionValue *)objc_getProperty(self, a2, 968, 1);
}

- (void)setDefinitionValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 968);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_definitionValue, 0);
}

@end
