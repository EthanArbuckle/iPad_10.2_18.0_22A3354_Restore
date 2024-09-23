@implementation DSObfuscationWindow

+ (id)showDSObfuscationWindowForApplicationWindow:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  DSObfuscationWindow *v8;
  void *v9;
  DSObfuscationWindow *v10;

  v3 = (objc_class *)MEMORY[0x24BEBDB08];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  v8 = [DSObfuscationWindow alloc];
  objc_msgSend(v4, "windowScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[DSObfuscationWindow initWithWindowScene:](v8, "initWithWindowScene:", v9);
  -[DSObfuscationWindow setRootViewController:](v10, "setRootViewController:", v5);
  -[DSObfuscationWindow setWindowLevel:](v10, "setWindowLevel:", *MEMORY[0x24BEBE9F8] + -1.0);
  -[DSObfuscationWindow makeKeyAndVisible](v10, "makeKeyAndVisible");

  return v10;
}

@end
