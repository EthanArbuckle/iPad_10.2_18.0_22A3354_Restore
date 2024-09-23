@implementation EFDeallocInvocationToken

- (void)dealloc
{
  objc_super v3;

  -[EFInvocationToken invoke](self, "invoke");
  v3.receiver = self;
  v3.super_class = (Class)EFDeallocInvocationToken;
  -[EFDeallocInvocationToken dealloc](&v3, sel_dealloc);
}

@end
