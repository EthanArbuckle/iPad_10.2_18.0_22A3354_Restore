@implementation CCUIPPTRootTest

+ (id)testWithName:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithName:beginSignpost:endSignpost:", v4, 0, 0);

  return v5;
}

@end
