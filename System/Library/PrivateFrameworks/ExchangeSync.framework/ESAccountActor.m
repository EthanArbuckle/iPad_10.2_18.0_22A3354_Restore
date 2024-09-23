@implementation ESAccountActor

- (ESAccountActor)initWithDAAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ESAccountActor *v8;

  v4 = a3;
  +[ESAccountLoader sharedInstance](ESAccountLoader, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  sharedDAAccountStore();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x24BDB4030]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadFrameworkForACAccountType:", v7);

  v8 = (ESAccountActor *)objc_msgSend(objc_alloc(NSClassFromString(CFSTR("ASConcreteAccountActor"))), "initWithDAAccount:", v4);
  return v8;
}

@end
