@implementation GKMatchBackgroundAssertionManager

+ (GKMatchBackgroundAssertionManager)shared
{
  return (GKMatchBackgroundAssertionManager *)static MatchBackgroundAssertionManager.shared.getter();
}

- (RBSAssertion)activeAssertion
{
  return (RBSAssertion *)MatchBackgroundAssertionManager.activeAssertion.getter();
}

- (void)setActiveAssertion:(id)a3
{
  id v5;
  GKMatchBackgroundAssertionManager *v6;

  v5 = a3;
  v6 = self;
  MatchBackgroundAssertionManager.activeAssertion.setter(a3);

}

- (GKMatchBackgroundAssertionManager)init
{
  return (GKMatchBackgroundAssertionManager *)sub_1BCEE0ACC();
}

- (void)dealloc
{
  GKMatchBackgroundAssertionManager *v2;

  v2 = self;
  MatchBackgroundAssertionManager.__deallocating_deinit();
}

- (void).cxx_destruct
{

}

- (void)acquire
{
  GKMatchBackgroundAssertionManager *v2;

  v2 = self;
  MatchBackgroundAssertionManager.acquire()();

}

- (void)assertionWillInvalidate:(id)a3
{
  id v4;
  GKMatchBackgroundAssertionManager *v5;

  v4 = a3;
  v5 = self;
  MatchBackgroundAssertionManager.assertionWillInvalidate(_:)(v4);

}

- (void)invalidate
{
  GKMatchBackgroundAssertionManager *v2;

  v2 = self;
  MatchBackgroundAssertionManager.invalidate()();

}

@end
