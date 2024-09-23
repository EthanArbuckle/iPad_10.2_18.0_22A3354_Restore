@implementation DMTEmbeddedDataResetBackedErasePrimitives

- (void)performEraseWithCompletion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  v8 = (id)objc_opt_new();
  DMTBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Preparing Device…"), &stru_24E5A0848, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE2E760]), "initWithMode:options:reason:", 4, v8, v5);
  objc_msgSend(MEMORY[0x24BE2E768], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resetWithRequest:completion:", v6, v3);

}

@end
