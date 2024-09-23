@implementation CHSURLSessionToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHSURLSessionToken)initWithCoder:(id)a3
{
  CHSURLSessionToken *v4;

  v4 = objc_alloc_init(CHSURLSessionToken);

  return v4;
}

- (BOOL)isValid
{
  return 1;
}

@end
