@implementation UIAlertController(SafariServicesExtras)

+ (id)alertControllerWithTitle:()SafariServicesExtras message:imageNamed:preferredStyle:
{
  void *v9;
  id v10;
  void *v11;

  v9 = (void *)MEMORY[0x1E0DC3450];
  v10 = a5;
  objc_msgSend(v9, "alertControllerWithTitle:message:preferredStyle:", a3, a4, a6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImageIfNecessaryWithName:", v10);

  return v11;
}

@end
