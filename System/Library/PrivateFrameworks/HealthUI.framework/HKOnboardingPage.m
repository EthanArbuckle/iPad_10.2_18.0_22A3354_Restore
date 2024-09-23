@implementation HKOnboardingPage

- (HKOnboardingPage)initWithViewControllerClass:(Class)a3 sequencePage:(int64_t)a4
{
  HKOnboardingPage *v6;
  HKOnboardingPage *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKOnboardingPage;
  v6 = -[HKOnboardingPage init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_viewControllerClass, a3);
    v7->_sequencePage = a4;
  }
  return v7;
}

- (int64_t)sequencePage
{
  return self->_sequencePage;
}

- (BOOL)lastPage
{
  return self->_lastPage;
}

- (void)setLastPage:(BOOL)a3
{
  self->_lastPage = a3;
}

- (Class)viewControllerClass
{
  return self->_viewControllerClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerClass, 0);
}

@end
