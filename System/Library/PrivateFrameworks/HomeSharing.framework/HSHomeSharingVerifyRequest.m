@implementation HSHomeSharingVerifyRequest

- (HSHomeSharingVerifyRequest)init
{
  HSHomeSharingVerifyRequest *v2;
  HSHomeSharingVerifyRequest *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HSHomeSharingVerifyRequest;
  v2 = -[HSRequest initWithAction:](&v5, sel_initWithAction_, CFSTR("home-share-verify"));
  v3 = v2;
  if (v2)
    -[HSRequest setValue:forArgument:](v2, "setValue:forArgument:", CFSTR("0"), CFSTR("hspid"));
  return v3;
}

@end
