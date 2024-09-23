@implementation DoStaticInit

void ___DoStaticInit_block_invoke()
{
  void *v0;

  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  sMaxAvailableMemoryForResourceValidation = objc_msgSend(v0, "estimatedAvailableMemoryForValidation");

  sAvailableMemoryForResourceValidation = sMaxAvailableMemoryForResourceValidation;
}

@end
