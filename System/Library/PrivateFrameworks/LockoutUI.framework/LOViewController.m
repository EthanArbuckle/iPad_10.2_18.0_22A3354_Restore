@implementation LOViewController

+ (id)lockoutViewControllerWithBundleIdentifier:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x24BE84830];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:", v4);

  return v5;
}

- (LOViewController)initWithBundleIdentifier:(id)a3
{
  id v4;
  LOViewController *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "lockoutViewControllerWithBundleIdentifier:", v4);
  v5 = (LOViewController *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)messageForApplicationName:(id)a3 style:(unint64_t)a4
{
  uint64_t v4;

  if (a4 == 1)
    v4 = 1;
  else
    v4 = 2 * (a4 != 0);
  return (id)objc_msgSend(MEMORY[0x24BE84830], "messageForApplicationName:style:", a3, v4);
}

+ (id)messageForBundleIdentifier:(id)a3 style:(unint64_t)a4
{
  uint64_t v4;

  if (a4 == 1)
    v4 = 1;
  else
    v4 = 2 * (a4 != 0);
  return (id)objc_msgSend(MEMORY[0x24BE84830], "messageForBundleIdentifier:style:", a3, v4);
}

+ (id)messageForWebsiteURL:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE84830], "messageForWebsiteURL:", a3);
}

@end
