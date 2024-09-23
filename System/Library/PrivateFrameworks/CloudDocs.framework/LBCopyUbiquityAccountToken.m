@implementation LBCopyUbiquityAccountToken

id __LBCopyUbiquityAccountToken_block_invoke_2()
{
  return +[BRDaemonConnection mobileDocumentsURL](BRDaemonConnection, "mobileDocumentsURL");
}

void __LBCopyUbiquityAccountToken_block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  NSObject *queue;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_autorelease_frequency(v0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  queue = dispatch_queue_create("com.apple.clouddocs.roots-cache-queue", v1);

  dispatch_async(queue, &__block_literal_global_13_0);
}

@end
