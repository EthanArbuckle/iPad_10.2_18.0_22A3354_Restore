@implementation SampleClassObjC

- (id)getHelloWorld
{
  SampleClassObjC *v2;
  NSString v3;

  v2 = self;
  v3 = SampleClassObjC.getHelloWorld()();

  return v3;
}

@end
