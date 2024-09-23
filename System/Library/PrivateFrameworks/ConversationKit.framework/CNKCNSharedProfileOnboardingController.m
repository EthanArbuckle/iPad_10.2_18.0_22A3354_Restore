@implementation CNKCNSharedProfileOnboardingController

- (void)presentOnboardingControllerOnLaunchIfNeededFrom:(id)a3 withContactStore:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (objc_class *)MEMORY[0x1E0C97528];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithContactStore:", v7);

  -[CNKCNSharedProfileOnboardingController setOnboardingController:](self, "setOnboardingController:", v9);
  -[CNKCNSharedProfileOnboardingController onboardingController](self, "onboardingController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentOnboardingFlowIfNeededForMode:fromViewController:", 1, v8);

}

- (void)setOnboardingController:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingController, a3);
}

- (CNSharedProfileOnboardingController)onboardingController
{
  return self->_onboardingController;
}

- (void)presentOnboardingControllerFrom:(id)a3 withContactStore:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v6 = (objc_class *)MEMORY[0x1E0C97528];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithContactStore:", v7);

  -[CNKCNSharedProfileOnboardingController setOnboardingController:](self, "setOnboardingController:", v9);
  -[CNKCNSharedProfileOnboardingController onboardingController](self, "onboardingController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startOnboardingOrEditForMode:fromViewController:", 1, v8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingController, 0);
}

@end
