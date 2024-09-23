@implementation CNKCrossFadeAnimatorFactory

- (id)makeAnimator
{
  CNKCrossFadeAnimatorFactory *v2;
  id v3;

  v2 = self;
  v3 = CNKCrossFadeAnimatorFactory.makeAnimator()();

  return v3;
}

- (CNKCrossFadeAnimatorFactory)init
{
  return (CNKCrossFadeAnimatorFactory *)CNKCrossFadeAnimatorFactory.init()();
}

@end
