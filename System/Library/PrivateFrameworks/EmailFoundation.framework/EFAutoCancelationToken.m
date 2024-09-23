@implementation EFAutoCancelationToken

- (void)dealloc
{
  objc_super v3;

  -[EFCancelationToken cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)EFAutoCancelationToken;
  -[EFAutoCancelationToken dealloc](&v3, sel_dealloc);
}

@end
