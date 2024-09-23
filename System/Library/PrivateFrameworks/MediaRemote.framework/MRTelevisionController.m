@implementation MRTelevisionController

- (MRTelevisionController)init
{
  MRTelevisionController *v2;
  MRTelevisionController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MRTelevisionController;
  v2 = -[MRExternalDeviceController initWithBonjourServiceType:](&v5, sel_initWithBonjourServiceType_, CFSTR("_mediaremotetv._tcp."));
  v3 = v2;
  if (v2)
    -[MRExternalDeviceController setDelegate:](v2, "setDelegate:", v2);
  return v3;
}

+ (Class)externalDeviceClass
{
  return (Class)objc_opt_class();
}

- (void)externalDeviceController:(id)a3 didDiscoverDevice:(id)a4
{
  id v6;
  id v7;
  _MRTelevisionControllerBlockCallback *discoveryCallback;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRTelevisionController.m"), 71, CFSTR("Got a non-television device from a television bonjour service."));

  }
  v7 = v6;
  discoveryCallback = self->_discoveryCallback;
  if (discoveryCallback)
  {
    -[_MRTelevisionControllerBlockCallback queue](discoveryCallback, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __69__MRTelevisionController_externalDeviceController_didDiscoverDevice___block_invoke;
    v11[3] = &unk_1E30C5F40;
    v11[4] = self;
    v12 = v7;
    dispatch_async(v9, v11);

  }
}

void __69__MRTelevisionController_externalDeviceController_didDiscoverDevice___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "callbackBlock");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (void)externalDeviceController:(id)a3 didRemoveDevice:(id)a4
{
  id v6;
  id v7;
  _MRTelevisionControllerBlockCallback *removalCallback;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MRTelevisionController.m"), 83, CFSTR("Got a non-television device from a television bonjour service."));

  }
  v7 = v6;
  removalCallback = self->_removalCallback;
  if (removalCallback)
  {
    -[_MRTelevisionControllerBlockCallback queue](removalCallback, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__MRTelevisionController_externalDeviceController_didRemoveDevice___block_invoke;
    v11[3] = &unk_1E30C5F40;
    v11[4] = self;
    v12 = v7;
    dispatch_async(v9, v11);

  }
}

void __67__MRTelevisionController_externalDeviceController_didRemoveDevice___block_invoke(uint64_t a1)
{
  void (**v2)(id, _QWORD);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "callbackBlock");
  v2 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(a1 + 40));

}

- (_MRTelevisionControllerBlockCallback)discoveryCallback
{
  return self->_discoveryCallback;
}

- (void)setDiscoveryCallback:(id)a3
{
  objc_storeStrong((id *)&self->_discoveryCallback, a3);
}

- (_MRTelevisionControllerBlockCallback)removalCallback
{
  return self->_removalCallback;
}

- (void)setRemovalCallback:(id)a3
{
  objc_storeStrong((id *)&self->_removalCallback, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removalCallback, 0);
  objc_storeStrong((id *)&self->_discoveryCallback, 0);
}

@end
