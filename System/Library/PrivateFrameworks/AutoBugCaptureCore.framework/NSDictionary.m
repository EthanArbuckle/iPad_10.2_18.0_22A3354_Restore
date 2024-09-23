@implementation NSDictionary

void __55__NSDictionary_DiagnosticCase__logSignatureDescription__block_invoke()
{
  id v0;

  +[SystemProperties sharedInstance](SystemProperties, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  logSignatureDescription_isInternal = objc_msgSend(v0, "internalBuild");

}

@end
