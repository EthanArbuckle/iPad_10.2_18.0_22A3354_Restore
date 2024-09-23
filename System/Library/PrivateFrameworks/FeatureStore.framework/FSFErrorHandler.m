@implementation FSFErrorHandler

+ (void)assertThatUserIsSupported
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!+[FSFUtils isSupportedUser](FSFUtils, "isSupportedUser"))
  {
    v2 = (void *)MEMORY[0x24BDBCE88];
    v3 = *MEMORY[0x24BDBCAB0];
    v4 = (void *)MEMORY[0x24BDD17C8];
    NSUserName();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v7);
  }
}

@end
