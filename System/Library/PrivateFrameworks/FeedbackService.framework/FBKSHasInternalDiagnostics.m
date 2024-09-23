@implementation FBKSHasInternalDiagnostics

void __FBKSHasInternalDiagnostics_block_invoke()
{
  id v0;

  +[FBKSStrings FeedbackServiceBundleIdentifier](_TtC15FeedbackService11FBKSStrings, "FeedbackServiceBundleIdentifier");
  v0 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v0, "UTF8String");
  FBKSHasInternalDiagnostics__isInternal = os_variant_has_internal_diagnostics();

}

@end
