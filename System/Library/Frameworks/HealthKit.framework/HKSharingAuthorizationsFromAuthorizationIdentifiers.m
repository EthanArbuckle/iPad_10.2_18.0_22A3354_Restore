@implementation HKSharingAuthorizationsFromAuthorizationIdentifiers

HKSharingAuthorization *__HKSharingAuthorizationsFromAuthorizationIdentifiers_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HKSharingAuthorization *v3;

  v2 = a2;
  v3 = -[HKSharingAuthorization initWithAuthorizationIdentifier:]([HKSharingAuthorization alloc], "initWithAuthorizationIdentifier:", v2);

  return v3;
}

@end
