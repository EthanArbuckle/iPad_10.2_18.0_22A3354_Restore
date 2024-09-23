@implementation HSGetAuthorizedAccountsInfoRequest

- (HSGetAuthorizedAccountsInfoRequest)init
{
  HSGetAuthorizedAccountsInfoRequest *v2;
  HSGetAuthorizedAccountsInfoRequest *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HSGetAuthorizedAccountsInfoRequest;
  v2 = -[HSRequest initWithAction:](&v5, sel_initWithAction_, CFSTR("get-authorized-accounts-info"));
  v3 = v2;
  if (v2)
    -[HSRequest setMethod:](v2, "setMethod:", 1);
  return v3;
}

@end
