@implementation LACUserInterfaceNullAdapter

- (void)processRequest:(id)a3 completion:(id)a4
{
  void *v5;
  void (**v6)(id, void *);
  void *v7;
  id v8;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = (void (**)(id, void *))a4;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ is not supported in this platform"), self);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1020, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);

}

@end
