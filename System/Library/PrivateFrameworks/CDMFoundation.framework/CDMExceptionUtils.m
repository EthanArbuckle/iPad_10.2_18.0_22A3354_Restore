@implementation CDMExceptionUtils

+ (void)runWrappingCppExceptions:(id)a3
{
  void (**v3)(void);

  v3 = (void (**)(void))a3;
  v3[2]();

}

@end
