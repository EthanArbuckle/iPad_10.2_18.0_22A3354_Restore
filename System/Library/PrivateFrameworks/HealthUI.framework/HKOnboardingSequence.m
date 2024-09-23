@implementation HKOnboardingSequence

- (HKOnboardingSequence)initWithPages:(id)a3
{
  id v5;
  HKOnboardingSequence *v6;
  HKOnboardingSequence *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKOnboardingSequence;
  v6 = -[HKOnboardingSequence init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_pages, a3);
    -[NSArray lastObject](v7->_pages, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLastPage:", 1);

  }
  return v7;
}

- (NSArray)pages
{
  return self->_pages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pages, 0);
}

@end
