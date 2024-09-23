@implementation UIAlertAction(SafariServicesExtras)

+ (id)sf_actionWithContentViewController:()SafariServicesExtras style:handler:shouldDismissHandler:
{
  id v10;
  void *v11;

  v10 = a6;
  objc_msgSend(a1, "_actionWithContentViewController:style:handler:", a3, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "setShouldDismissHandler:", v10);

  return v11;
}

@end
