@implementation MPLibraryAddStatusObserver

- (int64_t)currentStatus
{
  return self->_currentStatus;
}

- (void)configureWithModelObject:(id)a3
{
  id v4;

  v4 = a3;
  -[MPLibraryAddStatusObserver setConfiguration:identifyingModelObject:](self, "setConfiguration:identifyingModelObject:", objc_msgSend(v4, "libraryAddStatusObserverConfiguration") & 0xFFFFFFFFFFLL, v4);

}

- (void)setConfiguration:(MPLibraryAddStatusObserverConfiguration)a3 identifyingModelObject:(id)a4
{
  uint64_t v5;
  MPModelObject *v7;
  unint64_t v8;
  MPModelObject *identifyingModelObject;
  BOOL *p_needsStatusUpdate;
  MPModelObject *v11;

  v5 = *(_QWORD *)&a3.isValidContentType;
  v7 = (MPModelObject *)a4;
  v8 = ((*(unsigned int *)&self->_configuration.isValidContentType | ((unint64_t)self->_configuration.isLibraryAddEligible << 32)) ^ v5) & 0x101010101;
  if (v8)
  {
    *(_DWORD *)&self->_configuration.isValidContentType = v5;
    self->_configuration.isLibraryAddEligible = BYTE4(v5);
  }
  identifyingModelObject = self->_identifyingModelObject;
  v11 = v7;
  if (identifyingModelObject == v7 || -[MPModelObject isEqual:](identifyingModelObject, "isEqual:", v7))
  {
    p_needsStatusUpdate = &self->_needsStatusUpdate;
    if (!self->_needsStatusUpdate)
    {
      if (!v8)
        goto LABEL_11;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  objc_storeStrong((id *)&self->_identifyingModelObject, a4);
  p_needsStatusUpdate = &self->_needsStatusUpdate;
  if (self->_needsStatusUpdate)
LABEL_9:
    *p_needsStatusUpdate = 0;
LABEL_10:
  -[MPLibraryAddStatusObserver _updateCurrentStatus](self, "_updateCurrentStatus");
LABEL_11:

}

- (void)_updateCurrentStatus
{
  int64_t v3;
  int64_t v4;
  void (**statusBlock)(id, _QWORD);

  v3 = -[MPLibraryAddStatusObserver _calculateCurrentStatus](self, "_calculateCurrentStatus");
  if (self->_currentStatus != v3)
  {
    v4 = v3;
    self->_currentStatus = v3;
    statusBlock = (void (**)(id, _QWORD))self->_statusBlock;
    if (statusBlock)
      statusBlock[2](statusBlock, v4);
  }
}

- (MPLibraryAddStatusObserver)init
{
  void *v3;
  MPLibraryAddStatusObserver *v4;

  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MPLibraryAddStatusObserver initWithUserIdentity:](self, "initWithUserIdentity:", v3);

  return v4;
}

- (MPLibraryAddStatusObserver)initWithUserIdentity:(id)a3
{
  id v4;
  MPLibraryAddStatusObserver *v5;
  uint64_t v6;
  ICUserIdentity *userIdentity;
  uint64_t v8;
  MPCloudController *cloudController;
  uint64_t v10;
  MPCloudServiceStatusController *cloudServiceStatusController;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MPLibraryAddStatusObserver;
  v5 = -[MPLibraryAddStatusObserver init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    userIdentity = v5->_userIdentity;
    v5->_userIdentity = (ICUserIdentity *)v6;

    +[MPCloudController controllerWithUserIdentity:](MPCloudController, "controllerWithUserIdentity:", v5->_userIdentity);
    v8 = objc_claimAutoreleasedReturnValue();
    cloudController = v5->_cloudController;
    v5->_cloudController = (MPCloudController *)v8;

    +[MPCloudServiceStatusController cloudServiceStatusControllerWithUserIdentity:](MPCloudServiceStatusController, "cloudServiceStatusControllerWithUserIdentity:", v5->_userIdentity);
    v10 = objc_claimAutoreleasedReturnValue();
    cloudServiceStatusController = v5->_cloudServiceStatusController;
    v5->_cloudServiceStatusController = (MPCloudServiceStatusController *)v10;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MPRestrictionsMonitor sharedRestrictionsMonitor](MPRestrictionsMonitor, "sharedRestrictionsMonitor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v5, sel__allowsExplicitContentDidChangeNotification_, CFSTR("MPRestrictionsMonitorAllowsExplicitContentDidChangeNotification"), v13);

    objc_msgSend(v12, "addObserver:selector:name:object:", v5, sel__cloudLibraryEnabledDidChangeNotification_, CFSTR("MPCloudServiceStatusControllerCloudLibraryEnabledDidChangeNotification"), v5->_cloudServiceStatusController);
    objc_msgSend(v12, "addObserver:selector:name:object:", v5, sel__subscriptionStatusDidChangeNotification_, CFSTR("MPCloudServiceStatusControllerSubscriptionStatusDidChangeNotification"), v5->_cloudServiceStatusController);
    objc_msgSend(v12, "addObserver:selector:name:object:", v5, sel__updateInProgressDidChangeNotification_, CFSTR("MPCloudControllerIsUpdateInProgressDidChangeNotification"), v5->_cloudController);
    +[MPModelLibraryTransientStateController sharedDeviceLibraryController](MPModelLibraryTransientStateController, "sharedDeviceLibraryController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v5, sel__transientStateDidChangeNotification_, CFSTR("MPModelLibraryTransientStateControllerDidChangeNotification"), v14);

  }
  return v5;
}

- (int64_t)_calculateCurrentStatus
{
  void *v3;
  int64_t v4;
  void *v5;
  char v6;
  MPCloudController *v7;
  MPCloudServiceStatusController *v8;
  void *v9;
  __int16 v10;

  if (!self->_identifyingModelObject)
    goto LABEL_35;
  +[MPModelLibraryTransientStateController sharedDeviceLibraryController](MPModelLibraryTransientStateController, "sharedDeviceLibraryController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "transientAddStateForModelObject:", self->_identifyingModelObject);

  if (v4 == 1)
    return v4;
  if (!v4)
  {
LABEL_35:
    if (self->_configuration.isLibraryAdded)
      return 1;
  }
  if (!self->_configuration.isValidContentType)
    return 8;
  if (!self->_configuration.isLibraryAddEligible)
    return 7;
  +[MPRestrictionsMonitor sharedRestrictionsMonitor](MPRestrictionsMonitor, "sharedRestrictionsMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowsExplicitContent");

  if ((v6 & 1) == 0 && !self->_configuration.hasCleanContent && self->_configuration.hasExplicitContent)
    return 4;
  v7 = self->_cloudController;
  if (-[MPCloudController isUpdateInProgress](v7, "isUpdateInProgress")
    && -[MPCloudController isInitialImport](v7, "isInitialImport"))
  {
    v4 = 6;
  }
  else
  {
    v8 = self->_cloudServiceStatusController;
    -[MPCloudServiceStatusController musicSubscriptionStatus](v8, "musicSubscriptionStatus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "capabilities");

    if ((v10 & 0x101) != 0)
    {
      if ((v10 & 0x101) == 1)
      {
        v4 = 9;
      }
      else if (-[MPCloudServiceStatusController isCloudLibraryEnabled](v8, "isCloudLibraryEnabled"))
      {
        if ((v6 & 1) == 0 && self->_configuration.hasExplicitContent && self->_configuration.hasCleanContent)
        {
          v4 = 3;
        }
        else if ((v10 & 0x200) != 0)
        {
          v4 = 2;
        }
        else
        {
          v4 = 10;
        }
      }
      else
      {
        v4 = 5;
      }
    }
    else
    {
      v4 = 10;
    }

  }
  return v4;
}

- (void)setStatusBlock:(id)a3
{
  void *v4;
  id statusBlock;

  if (self->_statusBlock != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    statusBlock = self->_statusBlock;
    self->_statusBlock = v4;

    self->_needsStatusUpdate = 1;
  }
}

uint64_t __71__MPLibraryAddStatusObserver__subscriptionStatusDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCurrentStatus");
}

- (void)_subscriptionStatusDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__MPLibraryAddStatusObserver__subscriptionStatusDidChangeNotification___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MPLibraryAddStatusObserver;
  -[MPLibraryAddStatusObserver dealloc](&v2, sel_dealloc);
}

- (void)_allowsExplicitContentDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__MPLibraryAddStatusObserver__allowsExplicitContentDidChangeNotification___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_cloudLibraryEnabledDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__MPLibraryAddStatusObserver__cloudLibraryEnabledDidChangeNotification___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_transientStateDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__MPLibraryAddStatusObserver__transientStateDidChangeNotification___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)_updateInProgressDidChangeNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__MPLibraryAddStatusObserver__updateInProgressDidChangeNotification___block_invoke;
  block[3] = &unk_1E3163508;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (id)statusBlock
{
  return self->_statusBlock;
}

- (MPLibraryAddStatusObserverConfiguration)configuration
{
  return (MPLibraryAddStatusObserverConfiguration)(*(unsigned int *)&self->_configuration.isValidContentType | ((unint64_t)self->_configuration.isLibraryAddEligible << 32));
}

- (MPModelObject)identifyingModelObject
{
  return self->_identifyingModelObject;
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_identifyingModelObject, 0);
  objc_storeStrong(&self->_statusBlock, 0);
  objc_storeStrong((id *)&self->_cloudServiceStatusController, 0);
  objc_storeStrong((id *)&self->_cloudController, 0);
}

uint64_t __69__MPLibraryAddStatusObserver__updateInProgressDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCurrentStatus");
}

uint64_t __67__MPLibraryAddStatusObserver__transientStateDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCurrentStatus");
}

uint64_t __72__MPLibraryAddStatusObserver__cloudLibraryEnabledDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCurrentStatus");
}

uint64_t __74__MPLibraryAddStatusObserver__allowsExplicitContentDidChangeNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCurrentStatus");
}

@end
