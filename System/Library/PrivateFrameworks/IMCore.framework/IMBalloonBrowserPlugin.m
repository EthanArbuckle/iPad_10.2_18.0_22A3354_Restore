@implementation IMBalloonBrowserPlugin

- (IMBalloonBrowserPlugin)initWithIdentifier:(id)a3 browserDisplayName:(id)a4 browserImageName:(id)a5 browserClass:(Class)a6 presentationContext:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  IMBalloonBrowserPlugin *v15;
  IMBalloonBrowserPlugin *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v22.receiver = self;
  v22.super_class = (Class)IMBalloonBrowserPlugin;
  v15 = -[IMBalloonPlugin initWithBundle:](&v22, sel_initWithBundle_, 0);
  v16 = v15;
  if (v15)
  {
    -[IMBalloonPlugin app](v15, "app");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setIdentifier:", v12);

    -[IMBalloonPlugin app](v16, "app");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBrowserDisplayName:", v13);

    -[IMBalloonPlugin setBrowserImageName:](v16, "setBrowserImageName:", v14);
    -[IMBalloonPlugin app](v16, "app");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setBrowserClass:", a6);

    -[IMBalloonPlugin app](v16, "app");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPresentationContexts:", a7);

  }
  return v16;
}

- (IMBalloonBrowserPlugin)initWithIdentifier:(id)a3 browserDisplayName:(id)a4 browserImageName:(id)a5
{
  return (IMBalloonBrowserPlugin *)MEMORY[0x1E0DE7D20](self, sel_initWithIdentifier_browserDisplayName_browserImageName_browserClass_presentationContext_);
}

- (IMBalloonBrowserPlugin)initWithIdentifier:(id)a3 browserDisplayName:(id)a4 browserImagePath:(id)a5
{
  id v8;
  id v9;
  id v10;
  IMBalloonBrowserPlugin *v11;
  IMBalloonBrowserPlugin *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)IMBalloonBrowserPlugin;
  v11 = -[IMBalloonPlugin initWithBundle:](&v16, sel_initWithBundle_, 0);
  v12 = v11;
  if (v11)
  {
    -[IMBalloonPlugin app](v11, "app");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setIdentifier:", v8);

    -[IMBalloonPlugin app](v12, "app");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBrowserDisplayName:", v9);

    -[IMBalloonPlugin setBrowserImagePath:](v12, "setBrowserImagePath:", v10);
  }

  return v12;
}

- (id)version
{
  return CFSTR("IMBalloonPluginVersionUndefined");
}

- (BOOL)isBetaPlugin
{
  return 0;
}

@end
