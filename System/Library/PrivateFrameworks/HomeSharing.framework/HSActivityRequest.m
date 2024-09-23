@implementation HSActivityRequest

- (HSActivityRequest)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HSActivityRequest;
  return -[HSRequest initWithAction:](&v3, sel_initWithAction_, CFSTR("activity"));
}

@end
