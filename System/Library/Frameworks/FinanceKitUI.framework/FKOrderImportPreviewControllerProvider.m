@implementation FKOrderImportPreviewControllerProvider

+ (id)makeViewControllerWithOrderURL:(id)a3 completion:(id)a4 error:(id *)a5
{
  return +[OrderImportControllerProvider makeViewControllerWithBundleURL:competion:error:](_TtC12FinanceKitUI29OrderImportControllerProvider, "makeViewControllerWithBundleURL:competion:error:", a3, a4, a5);
}

+ (id)makeViewControllerWithOrderData:(id)a3 completion:(id)a4 error:(id *)a5
{
  return +[OrderImportControllerProvider makeViewControllerWithOrderData:competion:error:](_TtC12FinanceKitUI29OrderImportControllerProvider, "makeViewControllerWithOrderData:competion:error:", a3, a4, a5);
}

+ (BOOL)canProvidePreviewControllerForMessages
{
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  return v3 != 1 && v3 != 6;
}

@end
