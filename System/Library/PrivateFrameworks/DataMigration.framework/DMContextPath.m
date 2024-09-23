@implementation DMContextPath

void __DMContextPath_block_invoke()
{
  id v0;

  +[DMEnvironment sharedInstance](DMEnvironment, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "contextPath");
  DMContextPath_retval = objc_claimAutoreleasedReturnValue();

}

@end
