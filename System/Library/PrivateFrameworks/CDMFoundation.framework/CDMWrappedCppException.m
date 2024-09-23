@implementation CDMWrappedCppException

+ (id)exceptionFromCppExceptionWithMessage:(id)a3
{
  void *v3;
  CDMWrappedCppException *v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Hit C++ exception: %@"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CDMWrappedCppException initWithName:reason:userInfo:]([CDMWrappedCppException alloc], "initWithName:reason:userInfo:", CFSTR("CDMWrappedCppException"), v3, 0);

  return v4;
}

+ (id)exceptionFromUnknownCppException
{
  return -[CDMWrappedCppException initWithName:reason:userInfo:]([CDMWrappedCppException alloc], "initWithName:reason:userInfo:", CFSTR("CDMWrappedCppException"), CFSTR("Hit unknown C++ exception"), 0);
}

@end
