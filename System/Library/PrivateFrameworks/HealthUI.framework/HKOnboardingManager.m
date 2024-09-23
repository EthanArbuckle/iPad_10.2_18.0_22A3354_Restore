@implementation HKOnboardingManager

- (HKOnboardingManager)initWithOnboardingType:(int64_t)a3 isFirstTimeOnboarding:(BOOL)a4 healthStore:(id)a5 dateCache:(id)a6
{
  _BOOL8 v7;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  HKOnboardingManager *v14;

  v7 = a4;
  v10 = (objc_class *)MEMORY[0x1E0DC3A40];
  v11 = a6;
  v12 = a5;
  v13 = objc_alloc_init(v10);
  v14 = -[HKOnboardingManager initWithOnboardingType:isFirstTimeOnboarding:healthStore:dateCache:navigationController:](self, "initWithOnboardingType:isFirstTimeOnboarding:healthStore:dateCache:navigationController:", a3, v7, v12, v11, v13);

  return v14;
}

- (HKOnboardingManager)initWithOnboardingType:(int64_t)a3 isFirstTimeOnboarding:(BOOL)a4 healthStore:(id)a5 dateCache:(id)a6 navigationController:(id)a7
{
  id v13;
  id v14;
  id v15;
  HKOnboardingManager *v16;
  HKOnboardingManager *v17;
  NSMutableDictionary *v18;
  NSMutableDictionary *userInfo;
  objc_super v21;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)HKOnboardingManager;
  v16 = -[HKOnboardingManager init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_onboardingType = a3;
    v16->_firstTimeOnboarding = a4;
    objc_storeStrong((id *)&v16->_healthStore, a5);
    objc_storeStrong((id *)&v17->_dateCache, a6);
    v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    userInfo = v17->_userInfo;
    v17->_userInfo = v18;

    objc_storeStrong((id *)&v17->_navigationController, a7);
    -[UINavigationController setDelegate:](v17->_navigationController, "setDelegate:", v17);
    v17->_currentStepIndex = 0;
    v17->_currentPageIndex = 0;
    v17->_presentedPagesCount = 0;
  }

  return v17;
}

- (NSArray)steps
{
  void *v3;
  void *v4;
  NSArray *v5;
  NSArray *steps;

  if (!self->_steps)
  {
    -[HKOnboardingManager dataSource](self, "dataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[HKOnboardingManager dataSource](self, "dataSource");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "availableOnboardingStepsForOnboardingManager:", self);
      v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
      steps = self->_steps;
      self->_steps = v5;

    }
    else
    {
      v4 = self->_steps;
      self->_steps = (NSArray *)MEMORY[0x1E0C9AA60];
    }

  }
  return self->_steps;
}

- (void)setCurrentStepIndex:(int64_t)a3
{
  HKOnboardingSequence *currentSequence;

  if (self->_currentStepIndex != a3)
  {
    currentSequence = self->_currentSequence;
    self->_currentSequence = 0;
    self->_currentStepIndex = a3;

    self->_currentPageIndex = 0;
  }
}

- (HKOnboardingSequence)currentSequence
{
  HKOnboardingSequence *currentSequence;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  HKOnboardingSequence *v10;
  HKOnboardingSequence *v11;
  void *v12;

  currentSequence = self->_currentSequence;
  if (!currentSequence)
  {
    -[HKOnboardingManager dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[HKOnboardingManager steps](self, "steps");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", -[HKOnboardingManager currentStepIndex](self, "currentStepIndex"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "integerValue");

      -[HKOnboardingManager dataSource](self, "dataSource");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "onboardingManager:sequenceForStep:onboardingType:", self, v8, -[HKOnboardingManager onboardingType](self, "onboardingType"));
      v10 = (HKOnboardingSequence *)objc_claimAutoreleasedReturnValue();
      v11 = self->_currentSequence;
      self->_currentSequence = v10;

    }
    else
    {
      v9 = self->_currentSequence;
      self->_currentSequence = 0;
    }

    currentSequence = self->_currentSequence;
    if (!currentSequence)
    {
      _HKInitializeLogging();
      v12 = (void *)*MEMORY[0x1E0CB52C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52C0], OS_LOG_TYPE_ERROR))
        -[HKOnboardingManager currentSequence].cold.1(self, v12, a2);
      currentSequence = self->_currentSequence;
    }
  }
  return currentSequence;
}

- (id)onboardingNavigationController
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  -[HKOnboardingManager currentSequence](self, "currentSequence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[HKOnboardingManager setUserInfo:](self, "setUserInfo:", v6);

    -[HKOnboardingManager delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    if ((v8 & 1) != 0)
    {
      -[HKOnboardingManager delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "didBeginOnboardingForOnboardingManager:", self);

    }
    -[HKOnboardingManager pushPageAnimated:](self, "pushPageAnimated:", 0);
    -[HKOnboardingManager navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)dismissOnboarding
{
  void *v3;
  void *v4;
  char v5;
  id v6;

  -[HKOnboardingManager setCurrentStepIndex:](self, "setCurrentStepIndex:", 0);
  -[HKOnboardingManager navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  -[HKOnboardingManager delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[HKOnboardingManager delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didCompleteOnboardingForOnboardingManager:", self);

  }
}

- (int64_t)upgradingFromAlgorithmVersionForOnboardingType:(int64_t)a3
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  int64_t v7;

  if (a3 == 1)
  {
    v3 = (void *)self;
    objc_msgSend((id)self, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      objc_msgSend(v3, "dataSource");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "upgradingFromAlgorithmVersionForOnboardingManager:", v3);

      return v7;
    }
    return *MEMORY[0x1E0CB70B0];
  }
  if (!a3)
    return *MEMORY[0x1E0CB70B0];
  return self;
}

- (id)viewControllerForPage:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[HKOnboardingManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0
    || (-[HKOnboardingManager dataSource](self, "dataSource"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "onboardingManager:customViewControllerForPage:", self, v4),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    v8 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v4, "viewControllerClass")), "initForOnboarding:upgradingFromAlgorithmVersion:", 1, -[HKOnboardingManager upgradingFromAlgorithmVersionForOnboardingType:](self, "upgradingFromAlgorithmVersionForOnboardingType:", -[HKOnboardingManager onboardingType](self, "onboardingType")));
  }
  objc_msgSend(v8, "setDelegate:", self);

  return v8;
}

- (void)stepForward
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  uint64_t v9;

  v3 = -[HKOnboardingManager currentPageIndex](self, "currentPageIndex");
  -[HKOnboardingManager currentSequence](self, "currentSequence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") - 1;

  if (v3 == v6)
  {
    v7 = -[HKOnboardingManager currentStepIndex](self, "currentStepIndex");
    -[HKOnboardingManager steps](self, "steps");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") - 1;

    if (v7 == v9)
      -[HKOnboardingManager dismissOnboarding](self, "dismissOnboarding");
    else
      -[HKOnboardingManager stepToNextState](self, "stepToNextState");
  }
  else
  {
    -[HKOnboardingManager stepToNextPage](self, "stepToNextPage");
  }
  -[HKOnboardingManager pushPageAnimated:](self, "pushPageAnimated:", 1);
}

- (void)stepToNextState
{
  unint64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[HKOnboardingManager currentStepIndex](self, "currentStepIndex");
  -[HKOnboardingManager steps](self, "steps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") - 1;

  if (v3 < v5)
    -[HKOnboardingManager setCurrentStepIndex:](self, "setCurrentStepIndex:", -[HKOnboardingManager currentStepIndex](self, "currentStepIndex") + 1);
}

- (void)stepToNextPage
{
  unint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = -[HKOnboardingManager currentPageIndex](self, "currentPageIndex");
  -[HKOnboardingManager currentSequence](self, "currentSequence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") - 1;

  if (v3 < v6)
    -[HKOnboardingManager setCurrentPageIndex:](self, "setCurrentPageIndex:", -[HKOnboardingManager currentPageIndex](self, "currentPageIndex") + 1);
}

- (void)pushPageAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[HKOnboardingManager currentSequence](self, "currentSequence");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pages");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "objectAtIndexedSubscript:", -[HKOnboardingManager currentPageIndex](self, "currentPageIndex"));
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[HKOnboardingManager delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[HKOnboardingManager delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "onboardingManager:willMoveToPage:", self, v11);

  }
  -[HKOnboardingManager viewControllerForPage:](self, "viewControllerForPage:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingManager navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pushViewController:animated:", v9, v3);

}

- (void)onboardingCancelled
{
  void *v3;
  char v4;
  id v5;

  -[HKOnboardingManager delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[HKOnboardingManager delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "didCancelOnboardingForOnboardingManager:", self);

  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = -[HKOnboardingManager presentedPagesCount](self, "presentedPagesCount");

  if (v7 < v8)
    -[HKOnboardingManager _didStepBackward](self, "_didStepBackward");
  objc_msgSend(v10, "viewControllers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOnboardingManager setPresentedPagesCount:](self, "setPresentedPagesCount:", objc_msgSend(v9, "count"));

}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  return 2;
}

- (void)_didStepBackward
{
  void *v3;
  id v4;

  if (-[HKOnboardingManager currentPageIndex](self, "currentPageIndex"))
  {
    -[HKOnboardingManager setCurrentPageIndex:](self, "setCurrentPageIndex:", -[HKOnboardingManager currentPageIndex](self, "currentPageIndex") - 1);
  }
  else if (-[HKOnboardingManager currentStepIndex](self, "currentStepIndex"))
  {
    -[HKOnboardingManager setCurrentStepIndex:](self, "setCurrentStepIndex:", -[HKOnboardingManager currentStepIndex](self, "currentStepIndex") - 1);
    -[HKOnboardingManager currentSequence](self, "currentSequence");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pages");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOnboardingManager setCurrentPageIndex:](self, "setCurrentPageIndex:", objc_msgSend(v3, "count") - 1);

  }
  else
  {
    -[HKOnboardingManager dismissOnboarding](self, "dismissOnboarding");
  }
}

- (int64_t)onboardingType
{
  return self->_onboardingType;
}

- (void)setOnboardingType:(int64_t)a3
{
  self->_onboardingType = a3;
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (BOOL)firstTimeOnboarding
{
  return self->_firstTimeOnboarding;
}

- (HKOnboardingManagerDataSource)dataSource
{
  return (HKOnboardingManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HKOnboardingManagerDelegate)delegate
{
  return (HKOnboardingManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (void)setDateCache:(id)a3
{
  objc_storeStrong((id *)&self->_dateCache, a3);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (void)setSteps:(id)a3
{
  objc_storeStrong((id *)&self->_steps, a3);
}

- (void)setCurrentSequence:(id)a3
{
  objc_storeStrong((id *)&self->_currentSequence, a3);
}

- (int64_t)currentStepIndex
{
  return self->_currentStepIndex;
}

- (unint64_t)currentPageIndex
{
  return self->_currentPageIndex;
}

- (void)setCurrentPageIndex:(unint64_t)a3
{
  self->_currentPageIndex = a3;
}

- (unint64_t)presentedPagesCount
{
  return self->_presentedPagesCount;
}

- (void)setPresentedPagesCount:(unint64_t)a3
{
  self->_presentedPagesCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSequence, 0);
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

- (void)currentSequence
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  NSStringFromSelector(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138544130;
  v8 = a1;
  v9 = 2114;
  v10 = v6;
  v11 = 1024;
  v12 = objc_msgSend(a1, "currentStepIndex");
  v13 = 1024;
  v14 = objc_msgSend(a1, "onboardingType");
  _os_log_error_impl(&dword_1D7813000, v5, OS_LOG_TYPE_ERROR, "[%{public}@ %{public}@] Current sequence is nil for step index: %d, onboarding type: %d.", (uint8_t *)&v7, 0x22u);

}

@end
