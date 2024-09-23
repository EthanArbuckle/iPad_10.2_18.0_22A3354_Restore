@implementation CRKPersonaMatchEnforcingClassKitFacade

- (void)dealloc
{
  objc_super v3;

  -[CRKPersonaMatchEnforcingClassKitFacade stopObserving](self, "stopObserving");
  v3.receiver = self;
  v3.super_class = (Class)CRKPersonaMatchEnforcingClassKitFacade;
  -[CRKPersonaMatchEnforcingClassKitFacade dealloc](&v3, sel_dealloc);
}

- (CRKPersonaMatchEnforcingClassKitFacade)initWithClassKitFacade:(id)a3
{
  id v4;
  CRKPersonaMatchEnforcingClassKitFacade *v5;
  CRKClassKitCurrentUserProvider *v6;
  CRKClassKitCurrentUserProvider *currentUserProvider;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKPersonaMatchEnforcingClassKitFacade;
  v5 = -[CRKClassKitFacadeDecoratorBase initWithClassKitFacade:](&v9, sel_initWithClassKitFacade_, v4);
  if (v5)
  {
    v6 = -[CRKClassKitCurrentUserProvider initWithClassKitFacade:]([CRKClassKitCurrentUserProvider alloc], "initWithClassKitFacade:", v4);
    currentUserProvider = v5->_currentUserProvider;
    v5->_currentUserProvider = v6;

    -[CRKPersonaMatchEnforcingClassKitFacade startObserving](v5, "startObserving");
    -[CRKPersonaMatchEnforcingClassKitFacade updateAccountState](v5, "updateAccountState");
  }

  return v5;
}

- (void)startObserving
{
  void *v3;
  id v4;

  -[CRKPersonaMatchEnforcingClassKitFacade currentUserProvider](self, "currentUserProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", self, CFSTR("currentUser"), 0, CFSTR("CRKPersonaMatchEnforcingClassKitFacadeObservationContext"));

  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("accountState"), 0, CFSTR("CRKPersonaMatchEnforcingClassKitFacadeObservationContext"));

}

- (void)stopObserving
{
  void *v3;
  id v4;

  -[CRKPersonaMatchEnforcingClassKitFacade currentUserProvider](self, "currentUserProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("currentUser"), CFSTR("CRKPersonaMatchEnforcingClassKitFacadeObservationContext"));

  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("accountState"), CFSTR("CRKPersonaMatchEnforcingClassKitFacadeObservationContext"));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  if (a6 == CFSTR("CRKPersonaMatchEnforcingClassKitFacadeObservationContext"))
  {
    -[CRKPersonaMatchEnforcingClassKitFacade updateAccountState](self, "updateAccountState", a3, a4, a5);
  }
  else
  {
    v9 = v6;
    v10 = v7;
    v8.receiver = self;
    v8.super_class = (Class)CRKPersonaMatchEnforcingClassKitFacade;
    -[CRKPersonaMatchEnforcingClassKitFacade observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)updateAccountState
{
  int64_t v3;

  v3 = -[CRKPersonaMatchEnforcingClassKitFacade nextAccountState](self, "nextAccountState");
  if (-[CRKPersonaMatchEnforcingClassKitFacade modifiedAccountState](self, "modifiedAccountState") != v3)
    -[CRKPersonaMatchEnforcingClassKitFacade setModifiedAccountState:](self, "setModifiedAccountState:", v3);
}

- (int64_t)nextAccountState
{
  void *v3;
  int64_t v4;

  -[CRKClassKitFacadeDecoratorBase underlyingClassKitFacade](self, "underlyingClassKitFacade");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accountState");

  if (v4 == 2 && !-[CRKPersonaMatchEnforcingClassKitFacade isPersonaEligible](self, "isPersonaEligible"))
    return 0;
  return v4;
}

- (BOOL)isPersonaEligible
{
  void *v2;
  void *v3;
  BOOL v4;
  void *v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[CRKPersonaMatchEnforcingClassKitFacade currentUserProvider](self, "currentUserProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && objc_msgSend(v3, "requiresPersonaMatch") && (objc_msgSend(v3, "hasMatchingPersona") & 1) == 0)
  {
    if (_CRKLogASM_onceToken_29 != -1)
      dispatch_once(&_CRKLogASM_onceToken_29, &__block_literal_global_98);
    v6 = (void *)_CRKLogASM_logObj_29;
    if (os_log_type_enabled((os_log_t)_CRKLogASM_logObj_29, OS_LOG_TYPE_INFO))
    {
      v7 = v6;
      v8 = 138543362;
      v9 = objc_opt_class();
      _os_log_impl(&dword_218C99000, v7, OS_LOG_TYPE_INFO, "%{public}@: persona is ineligible because it doesn't match the ClassKit persona and a match is required", (uint8_t *)&v8, 0xCu);

    }
    v4 = 0;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (id)keyPathsForValuesAffectingAccountState
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("modifiedAccountState"));
}

- (CRKClassKitCurrentUserProvider)currentUserProvider
{
  return self->_currentUserProvider;
}

- (int64_t)modifiedAccountState
{
  return self->_modifiedAccountState;
}

- (void)setModifiedAccountState:(int64_t)a3
{
  self->_modifiedAccountState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentUserProvider, 0);
}

@end
