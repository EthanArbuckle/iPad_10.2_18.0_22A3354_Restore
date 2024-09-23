@implementation _FEFocusMovementRequest

- (_FEFocusMovementRequest)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMovementRequest.m"), 18, CFSTR("-init is not a valid initializer for this class."));

  return 0;
}

- (_FEFocusMovementRequest)initWithFocusSystem:(id)a3
{
  id v5;
  _FEFocusMovementRequest *v6;
  _FEFocusMovementRequest *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMovementRequest.m"), 24, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("focusSystem"));

  }
  v10.receiver = self;
  v10.super_class = (Class)_FEFocusMovementRequest;
  v6 = -[_FEFocusMovementRequest init](&v10, sel_init);
  v7 = v6;
  if (v6)
    objc_storeWeak((id *)&v6->_focusSystem, v5);

  return v7;
}

- (id)_requestByRedirectingRequestToFocusSystem:(id)a3
{
  id v4;
  _FEFocusMovementRequest *v5;

  v4 = a3;
  v5 = -[_FEFocusMovementRequest initWithFocusSystem:]([_FEFocusMovementRequest alloc], "initWithFocusSystem:", v4);

  objc_storeStrong((id *)&v5->_movementInfo, self->_movementInfo);
  return v5;
}

- (_FEFocusItemInfo)focusedItemInfo
{
  _FEFocusItemInfo *focusedItemInfo;
  void *v4;
  void *v5;
  _FEFocusItemInfo *v6;
  _FEFocusItemInfo *v7;

  focusedItemInfo = self->_focusedItemInfo;
  if (!focusedItemInfo)
  {
    -[_FEFocusMovementRequest focusSystem](self, "focusSystem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "focusedItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[_FEFocusItemInfo infoWithItem:](_FEFocusItemInfo, "infoWithItem:", v5);
    v6 = (_FEFocusItemInfo *)objc_claimAutoreleasedReturnValue();
    v7 = self->_focusedItemInfo;
    self->_focusedItemInfo = v6;

    focusedItemInfo = self->_focusedItemInfo;
  }
  return focusedItemInfo;
}

- (_FEFocusMovementInfo)movementInfo
{
  _FEFocusMovementInfo *movementInfo;
  _FEFocusMovementInfo *v4;
  _FEFocusMovementInfo *v5;

  movementInfo = self->_movementInfo;
  if (!movementInfo)
  {
    +[_FEFocusMovementInfo _movementWithHeading:isInitial:](_FEFocusMovementInfo, "_movementWithHeading:isInitial:", 0, 1);
    v4 = (_FEFocusMovementInfo *)objc_claimAutoreleasedReturnValue();
    v5 = self->_movementInfo;
    self->_movementInfo = v4;

    movementInfo = self->_movementInfo;
  }
  return movementInfo;
}

- (_FEFocusSearchInfo)searchInfo
{
  _FEFocusSearchInfo *searchInfo;
  _FEFocusSearchInfo *v4;
  _FEFocusSearchInfo *v5;

  searchInfo = self->_searchInfo;
  if (!searchInfo)
  {
    +[_FEFocusSearchInfo defaultInfo](_FEFocusSearchInfo, "defaultInfo");
    v4 = (_FEFocusSearchInfo *)objc_claimAutoreleasedReturnValue();
    v5 = self->_searchInfo;
    self->_searchInfo = v4;

    searchInfo = self->_searchInfo;
  }
  return searchInfo;
}

- (_FEFocusMovementRequest)fallbackRequest
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  objc_msgSend(WeakRetained, "_hostFocusSystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_FEFocusMovementRequest _requestByRedirectingRequestToFocusSystem:](self, "_requestByRedirectingRequestToFocusSystem:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (_FEFocusMovementRequest *)v5;
}

- (BOOL)isMovementRequest
{
  return 1;
}

- (BOOL)shouldScrollIfNecessary
{
  return 1;
}

- (BOOL)shouldPlayFocusSound
{
  return 1;
}

- (BOOL)requiresNextFocusedItem
{
  return 1;
}

- (BOOL)requiresEnvironmentValidation
{
  return 1;
}

- (BOOL)allowsFocusingCurrentItem
{
  return 0;
}

- (BOOL)allowsDeferral
{
  return 0;
}

- (BOOL)allowsOverridingPreferedFocusEnvironments
{
  return 0;
}

- (_FEFocusSystem)focusSystem
{
  return (_FEFocusSystem *)objc_loadWeakRetained((id *)&self->_focusSystem);
}

- (BOOL)shouldPerformHapticFeedback
{
  return self->_shouldPerformHapticFeedback;
}

- (void)setShouldPerformHapticFeedback:(BOOL)a3
{
  self->_shouldPerformHapticFeedback = a3;
}

- (_FEFocusInputDeviceInfo)inputDeviceInfo
{
  return self->_inputDeviceInfo;
}

- (void)setInputDeviceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_inputDeviceInfo, a3);
}

- (void)setFocusedItemInfo:(id)a3
{
  objc_storeStrong((id *)&self->_focusedItemInfo, a3);
}

- (void)setMovementInfo:(id)a3
{
  objc_storeStrong((id *)&self->_movementInfo, a3);
}

- (void)setSearchInfo:(id)a3
{
  objc_storeStrong((id *)&self->_searchInfo, a3);
}

- (BOOL)overridesDeferredFocusUpdate
{
  return self->_overridesDeferredFocusUpdate;
}

- (void)setOverridesDeferredFocusUpdate:(BOOL)a3
{
  self->_overridesDeferredFocusUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchInfo, 0);
  objc_storeStrong((id *)&self->_movementInfo, 0);
  objc_storeStrong((id *)&self->_focusedItemInfo, 0);
  objc_storeStrong((id *)&self->_inputDeviceInfo, 0);
  objc_destroyWeak((id *)&self->_focusSystem);
}

@end
