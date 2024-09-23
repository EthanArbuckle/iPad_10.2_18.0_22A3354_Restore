@implementation ULEvent

- (ULEvent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ULEvent;
  return -[ULEvent init](&v3, sel_init);
}

- (NSString)name
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
