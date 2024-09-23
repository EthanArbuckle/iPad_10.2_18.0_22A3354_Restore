@implementation HAP2AccessoryServer

- (HAP2AccessoryServer)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)dealloc
{
  objc_super v3;

  -[NSBackgroundActivityScheduler invalidate](self->_backgroundScheduler, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HAP2AccessoryServer;
  -[HAP2AccessoryServer dealloc](&v3, sel_dealloc);
}

- (HAP2AccessoryServerDelegate)delegate
{
  HAP2PropertyLock *propertyLock;
  HAP2PropertyLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__4013;
  v12 = __Block_byref_object_dispose__4014;
  v13 = 0;
  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v4 = propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __31__HAP2AccessoryServer_delegate__block_invoke;
  v7[3] = &unk_1E894DEE8;
  v7[4] = self;
  v7[5] = &v8;
  -[HAP2PropertyLock performReadingBlock:](v4, "performReadingBlock:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (HAP2AccessoryServerDelegate *)v5;
}

- (void)setDelegate:(id)a3
{
  id v4;
  HAP2PropertyLock *propertyLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__HAP2AccessoryServer_setDelegate___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HAP2PropertyLock performWritingBlock:](propertyLock, "performWritingBlock:", v7);

}

- (unint64_t)connectionState
{
  HAP2PropertyLock *propertyLock;
  HAP2PropertyLock *v4;
  unint64_t v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v4 = propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__HAP2AccessoryServer_connectionState__block_invoke;
  v7[3] = &unk_1E894DEE8;
  v7[4] = self;
  v7[5] = &v8;
  -[HAP2PropertyLock performReadingBlock:](v4, "performReadingBlock:", v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (HAP2AccessoryServerControllerPrivate)controller
{
  void *v3;

  -[HAP2AccessoryServer operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  return self->_controller;
}

- (void)setProductData:(id)a3
{
  id v4;
  HAP2PropertyLock *propertyLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__HAP2AccessoryServer_setProductData___block_invoke;
  v7[3] = &unk_1E894E0F8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HAP2PropertyLock performWritingBlock:](propertyLock, "performWritingBlock:", v7);

}

- (NSString)productData
{
  HAP2PropertyLock *propertyLock;
  HAP2PropertyLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__4013;
  v12 = __Block_byref_object_dispose__4014;
  v13 = 0;
  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v4 = propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__HAP2AccessoryServer_productData__block_invoke;
  v7[3] = &unk_1E894DEE8;
  v7[4] = self;
  v7[5] = &v8;
  -[HAP2PropertyLock performReadingBlock:](v4, "performReadingBlock:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

- (BOOL)hasDiscoveryAdvertisement
{
  HAP2PropertyLock *propertyLock;
  HAP2PropertyLock *v4;
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v4 = propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__HAP2AccessoryServer_hasDiscoveryAdvertisement__block_invoke;
  v7[3] = &unk_1E894DEE8;
  v7[4] = self;
  v7[5] = &v8;
  -[HAP2PropertyLock performReadingBlock:](v4, "performReadingBlock:", v7);

  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)setHasDiscoveryAdvertisement:(BOOL)a3
{
  void *v5;
  HAP2PropertyLock *propertyLock;
  _QWORD v7[5];
  BOOL v8;

  -[HAP2AccessoryServer operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HAP2AccessoryServer_setHasDiscoveryAdvertisement___block_invoke;
  v7[3] = &unk_1E894D770;
  v7[4] = self;
  v8 = a3;
  -[HAP2PropertyLock performWritingBlock:](propertyLock, "performWritingBlock:", v7);
}

- (NSString)reachabilityChangedReason
{
  HAP2PropertyLock *propertyLock;
  HAP2PropertyLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  __CFString *v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__4013;
  v12 = __Block_byref_object_dispose__4014;
  v13 = CFSTR("Unknown");
  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v4 = propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__HAP2AccessoryServer_reachabilityChangedReason__block_invoke;
  v7[3] = &unk_1E894DEE8;
  v7[4] = self;
  v7[5] = &v8;
  -[HAP2PropertyLock performReadingBlock:](v4, "performReadingBlock:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

- (void)setReachabilityChangedReason:(id)a3
{
  id v4;
  void *v5;
  HAP2PropertyLock *propertyLock;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[HAP2AccessoryServer operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__HAP2AccessoryServer_setReachabilityChangedReason___block_invoke;
  v8[3] = &unk_1E894E0F8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[HAP2PropertyLock performWritingBlock:](propertyLock, "performWritingBlock:", v8);

}

- (double)sessionCheckInterval
{
  HAP2PropertyLock *propertyLock;
  HAP2PropertyLock *v4;
  double v5;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v4 = propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__HAP2AccessoryServer_sessionCheckInterval__block_invoke;
  v7[3] = &unk_1E894DEE8;
  v7[4] = self;
  v7[5] = &v8;
  -[HAP2PropertyLock performReadingBlock:](v4, "performReadingBlock:", v7);

  v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (NSString)setupID
{
  HAP2PropertyLock *propertyLock;
  HAP2PropertyLock *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__4013;
  v12 = __Block_byref_object_dispose__4014;
  v13 = 0;
  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v4 = propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __30__HAP2AccessoryServer_setupID__block_invoke;
  v7[3] = &unk_1E894DEE8;
  v7[4] = self;
  v7[5] = &v8;
  -[HAP2PropertyLock performReadingBlock:](v4, "performReadingBlock:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return (NSString *)v5;
}

- (void)setSetupID:(id)a3
{
  id v4;
  void *v5;
  HAP2PropertyLock *propertyLock;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[HAP2AccessoryServer operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  if (self)
    propertyLock = self->_propertyLock;
  else
    propertyLock = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__HAP2AccessoryServer_setSetupID___block_invoke;
  v8[3] = &unk_1E894E0F8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  -[HAP2PropertyLock performWritingBlock:](propertyLock, "performWritingBlock:", v8);

}

- (HAPDeviceID)deviceID
{
  void *v2;
  void *v3;

  -[HAP2AccessoryServer currentMetadata]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deviceID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HAPDeviceID *)v3;
}

- (BOOL)hasPairings
{
  void *v2;
  char v3;

  -[HAP2AccessoryServer currentMetadata]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasPairings");

  return v3;
}

- (HMFVersion)protocolVersion
{
  HAP2PropertyLock *v3;
  id v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  if (!-[HAP2AccessoryServer isInternallyPaired]((uint64_t)self))
    goto LABEL_4;
  if (!self)
    goto LABEL_4;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__4013;
  v12 = __Block_byref_object_dispose__4014;
  v13 = 0;
  v3 = self->_propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__HAP2AccessoryServer_pairedProtocolVersion__block_invoke;
  v7[3] = &unk_1E894DEE8;
  v7[4] = self;
  v7[5] = &v8;
  -[HAP2PropertyLock performReadingBlock:](v3, "performReadingBlock:", v7);

  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  if (!v4)
  {
LABEL_4:
    -[HAP2AccessoryServer currentMetadata]((id *)&self->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "protocolVersion");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (HMFVersion *)v4;
}

- (NSString)name
{
  HAP2PropertyLock *v3;
  id v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  if (!-[HAP2AccessoryServer isInternallyPaired]((uint64_t)self))
    goto LABEL_4;
  if (!self)
    goto LABEL_4;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__4013;
  v12 = __Block_byref_object_dispose__4014;
  v13 = 0;
  v3 = self->_propertyLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __33__HAP2AccessoryServer_pairedName__block_invoke;
  v7[3] = &unk_1E894DEE8;
  v7[4] = self;
  v7[5] = &v8;
  -[HAP2PropertyLock performReadingBlock:](v3, "performReadingBlock:", v7);

  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  if (!v4)
  {
LABEL_4:
    -[HAP2AccessoryServer currentMetadata]((id *)&self->super.super.isa);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "name");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v4;
}

- (NSString)model
{
  void *v2;
  void *v3;

  -[HAP2AccessoryServer currentMetadata]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)category
{
  void *v2;
  unint64_t v3;

  -[HAP2AccessoryServer currentMetadata]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "category");

  return v3;
}

- (unsigned)stateNumber
{
  void *v2;
  unsigned __int16 v3;

  -[HAP2AccessoryServer currentMetadata]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "stateNumber");

  return v3;
}

- (unsigned)configNumber
{
  void *v2;
  unsigned __int16 v3;

  -[HAP2AccessoryServer currentMetadata]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "configNumber");

  return v3;
}

- (NSData)setupHash
{
  void *v2;
  void *v3;

  -[HAP2AccessoryServer currentMetadata]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setupHash");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)HAP2AccessoryServer;
  -[HAP2LoggingObject description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2AccessoryServer name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2AccessoryServer deviceID](self, "deviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HAP2AccessoryServer isInternallyPaired]((uint64_t)self);
  v8 = CFSTR("Unpaired");
  if (v7)
    v8 = CFSTR("Paired");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [%@/%@] (%@)"), v4, v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (HAP2SerializedOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (HAP2AccessoryServerBrowserPrivate)browser
{
  return (HAP2AccessoryServerBrowserPrivate *)objc_loadWeakRetained((id *)&self->_browser);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_reachabilityChangedReason, 0);
  objc_storeStrong((id *)&self->_backgroundScheduler, 0);
  objc_storeStrong((id *)&self->_reachabilityProfile, 0);
  objc_storeStrong((id *)&self->_reachability, 0);
  objc_destroyWeak((id *)&self->_pairDelegate);
  objc_storeStrong((id *)&self->_internalPairingDriver, 0);
  objc_storeStrong((id *)&self->_outstandingUpdateAccessoriesRequest, 0);
  objc_storeStrong((id *)&self->_pairedProtocolVersion, 0);
  objc_storeStrong((id *)&self->_pairedName, 0);
  objc_storeStrong((id *)&self->_privateAccessories, 0);
  objc_storeStrong((id *)&self->_productData, 0);
  objc_storeStrong((id *)&self->_currentMetadata, 0);
  objc_destroyWeak((id *)&self->_browser);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_setupID, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (BOOL)isInternallyPaired
{
  _BOOL8 v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v1 = a1;
  if (a1)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x2020000000;
    v8 = 0;
    v2 = *(id *)(a1 + 168);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __41__HAP2AccessoryServer_isInternallyPaired__block_invoke;
    v4[3] = &unk_1E894DEE8;
    v4[4] = v1;
    v4[5] = &v5;
    objc_msgSend(v2, "performReadingBlock:", v4);

    v1 = *((_BYTE *)v6 + 24) != 0;
    _Block_object_dispose(&v5, 8);
  }
  return v1;
}

uint64_t __41__HAP2AccessoryServer_isInternallyPaired__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

- (id)currentMetadata
{
  id *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v1 = a1;
  if (a1)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x3032000000;
    v8 = __Block_byref_object_copy__4013;
    v9 = __Block_byref_object_dispose__4014;
    v10 = 0;
    v2 = a1[21];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __38__HAP2AccessoryServer_currentMetadata__block_invoke;
    v4[3] = &unk_1E894DEE8;
    v4[4] = v1;
    v4[5] = &v5;
    objc_msgSend(v2, "performReadingBlock:", v4);

    v1 = (id *)(id)v6[5];
    _Block_object_dispose(&v5, 8);

  }
  return v1;
}

void __38__HAP2AccessoryServer_currentMetadata__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
}

void __33__HAP2AccessoryServer_pairedName__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 88));
}

void __44__HAP2AccessoryServer_pairedProtocolVersion__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 96));
}

void __34__HAP2AccessoryServer_setSetupID___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

void __30__HAP2AccessoryServer_setupID__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
}

uint64_t __43__HAP2AccessoryServer_sessionCheckInterval__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "confirmInterval");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

void __52__HAP2AccessoryServer_setReachabilityChangedReason___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 152), *(id *)(a1 + 40));
}

void __48__HAP2AccessoryServer_reachabilityChangedReason__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 152));
}

uint64_t __52__HAP2AccessoryServer_setHasDiscoveryAdvertisement___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 9) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __48__HAP2AccessoryServer_hasDiscoveryAdvertisement__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 9);
  return result;
}

void __34__HAP2AccessoryServer_productData__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 72));
}

void __38__HAP2AccessoryServer_setProductData___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
}

uint64_t __38__HAP2AccessoryServer_connectionState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

id __35__HAP2AccessoryServer_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
}

void __31__HAP2AccessoryServer_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

+ (id)new
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99768];
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

+ (id)unpairedAccessoryServerWithMetadata:(id)a3 browser:(id)a4 controller:(id)a5 pairingDriver:(id)a6 operationQueue:(id)a7
{
  id v12;
  _QWORD *v13;
  void *v14;

  v12 = a6;
  +[HAP2AccessoryServer _accessoryServerWithMetadata:browser:controller:operationQueue:internallyPaired:]((uint64_t)a1, a3, a4, a5, a7, 0);
  v13 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13[14];
  v13[14] = v12;

  return v13;
}

+ (id)pairedAccessoryServerWithMetadata:(id)a3 browser:(id)a4 controller:(id)a5 operationQueue:(id)a6
{
  return +[HAP2AccessoryServer _accessoryServerWithMetadata:browser:controller:operationQueue:internallyPaired:]((uint64_t)a1, a3, a4, a5, a6, 1);
}

+ (HAP2AccessoryServer)_accessoryServerWithMetadata:(void *)a3 browser:(void *)a4 controller:(void *)a5 operationQueue:(BOOL)a6 internallyPaired:
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  HAP2AccessoryServer *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  HAP2AccessoryServer *v23;
  uint64_t v24;
  HAP2PropertyLock *propertyLock;
  NSArray *privateAccessories;
  NSString *reachabilityChangedReason;
  uint64_t v28;
  HAPAccessoryReachabilityProfile *reachabilityProfile;
  HAPAccessoryReachabilityClient *v30;
  void *v31;
  HAPAccessoryReachabilityProfile *v32;
  void *v33;
  HAPAccessoryReachabilityClient *v34;
  HAPAccessoryReachabilityClient *reachability;
  void *v38;
  objc_super v39;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = a2;
  objc_opt_self();
  if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EFA43D80))
    v14 = v12;
  else
    v14 = 0;
  v15 = v14;
  v38 = v11;
  if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EFA4B7A8))
    v16 = v11;
  else
    v16 = 0;
  v17 = v16;
  v18 = [HAP2AccessoryServer alloc];
  v19 = v13;
  v20 = v17;
  v21 = v15;
  v22 = v10;
  if (v18)
  {
    v39.receiver = v18;
    v39.super_class = (Class)HAP2AccessoryServer;
    v23 = (HAP2AccessoryServer *)objc_msgSendSuper2(&v39, sel_init);
    v18 = v23;
    if (v23)
    {
      objc_storeStrong((id *)&v23->_currentMetadata, a2);
      objc_storeStrong((id *)&v18->_controller, v16);
      objc_storeWeak((id *)&v18->_browser, v21);
      objc_storeStrong((id *)&v18->_operationQueue, a5);
      +[HAP2PropertyLock lockWithName:](HAP2PropertyLock, "lockWithName:", CFSTR("HAP2AccessoryServer.propertyLock"));
      v24 = objc_claimAutoreleasedReturnValue();
      propertyLock = v18->_propertyLock;
      v18->_propertyLock = (HAP2PropertyLock *)v24;

      v18->_internallyPaired = a6;
      privateAccessories = v18->_privateAccessories;
      v18->_privateAccessories = (NSArray *)MEMORY[0x1E0C9AA60];

      v18->_connectionState = 1;
      v18->_hasDiscoveryAdvertisement = 1;
      reachabilityChangedReason = v18->_reachabilityChangedReason;
      v18->_reachabilityChangedReason = (NSString *)CFSTR("Unknown");

      v18->_sessionCheckInterval = 0.0;
      v28 = objc_opt_new();
      reachabilityProfile = v18->_reachabilityProfile;
      v18->_reachabilityProfile = (HAPAccessoryReachabilityProfile *)v28;

      v30 = [HAPAccessoryReachabilityClient alloc];
      -[HAP2AccessoryServer deviceID](v18, "deviceID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v18->_reachabilityProfile;
      v33 = (void *)objc_opt_new();
      v34 = -[HAPAccessoryReachabilityClient initWithIdentifier:profile:operationQueue:](v30, "initWithIdentifier:profile:operationQueue:", v31, v32, v33);

      -[HAPAccessoryReachabilityClient setDelegate:](v34, "setDelegate:", v18);
      reachability = v18->_reachability;
      v18->_reachability = v34;

    }
  }

  objc_msgSend(v20, "setAccessoryServer:", v18);
  return v18;
}

- (uint64_t)setInternallyPaired:(uint64_t)result
{
  void *v2;
  _QWORD v3[5];
  char v4;

  if (result)
  {
    v2 = *(void **)(result + 168);
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __43__HAP2AccessoryServer_setInternallyPaired___block_invoke;
    v3[3] = &unk_1E894D770;
    v3[4] = result;
    v4 = a2;
    return objc_msgSend(v2, "performWritingBlock:", v3);
  }
  return result;
}

uint64_t __43__HAP2AccessoryServer_setInternallyPaired___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = *(_BYTE *)(result + 40);
  return result;
}

- (id)privateAccessories
{
  id *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v1 = a1;
  if (a1)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x3032000000;
    v8 = __Block_byref_object_copy__4013;
    v9 = __Block_byref_object_dispose__4014;
    v10 = 0;
    v2 = a1[21];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __41__HAP2AccessoryServer_privateAccessories__block_invoke;
    v4[3] = &unk_1E894DEE8;
    v4[4] = v1;
    v4[5] = &v5;
    objc_msgSend(v2, "performReadingBlock:", v4);

    v1 = (id *)(id)v6[5];
    _Block_object_dispose(&v5, 8);

  }
  return v1;
}

void __41__HAP2AccessoryServer_privateAccessories__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 80));
}

- (void)setPrivateAccessories:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 168);
    v6[1] = 3221225472;
    v6[2] = __45__HAP2AccessoryServer_setPrivateAccessories___block_invoke;
    v6[3] = &unk_1E894E0F8;
    v6[4] = a1;
    v5 = v3;
    v6[0] = MEMORY[0x1E0C809B0];
    v7 = v3;
    objc_msgSend(v4, "performWritingBlock:", v6);

    v3 = v5;
  }

}

void __45__HAP2AccessoryServer_setPrivateAccessories___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

}

- (void)setPairedName:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 168);
    v6[1] = 3221225472;
    v6[2] = __37__HAP2AccessoryServer_setPairedName___block_invoke;
    v6[3] = &unk_1E894E0F8;
    v6[4] = a1;
    v5 = v3;
    v6[0] = MEMORY[0x1E0C809B0];
    v7 = v3;
    objc_msgSend(v4, "performWritingBlock:", v6);

    v3 = v5;
  }

}

void __37__HAP2AccessoryServer_setPairedName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 88);
  *(_QWORD *)(v3 + 88) = v2;

}

- (void)setPairedProtocolVersion:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 168);
    v6[1] = 3221225472;
    v6[2] = __48__HAP2AccessoryServer_setPairedProtocolVersion___block_invoke;
    v6[3] = &unk_1E894E0F8;
    v6[4] = a1;
    v5 = v3;
    v6[0] = MEMORY[0x1E0C809B0];
    v7 = v3;
    objc_msgSend(v4, "performWritingBlock:", v6);

    v3 = v5;
  }

}

void __48__HAP2AccessoryServer_setPairedProtocolVersion___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), *(id *)(a1 + 40));
}

- (id)outstandingUpdateAccessoriesRequest
{
  id *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v1 = a1;
  if (a1)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x3032000000;
    v8 = __Block_byref_object_copy__4013;
    v9 = __Block_byref_object_dispose__4014;
    v10 = 0;
    v2 = a1[21];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __58__HAP2AccessoryServer_outstandingUpdateAccessoriesRequest__block_invoke;
    v4[3] = &unk_1E894DEE8;
    v4[4] = v1;
    v4[5] = &v5;
    objc_msgSend(v2, "performReadingBlock:", v4);

    v1 = (id *)(id)v6[5];
    _Block_object_dispose(&v5, 8);

  }
  return v1;
}

void __58__HAP2AccessoryServer_outstandingUpdateAccessoriesRequest__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 104));
}

- (void)setOutstandingUpdateAccessoriesRequest:(_QWORD *)a1
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(a1, "operationQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assertCurrentQueue");

    v4 = (void *)a1[21];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__HAP2AccessoryServer_setOutstandingUpdateAccessoriesRequest___block_invoke;
    v6[3] = &unk_1E894E0F8;
    v6[4] = a1;
    v7 = v5;
    objc_msgSend(v4, "performWritingBlock:", v6);

  }
}

void __62__HAP2AccessoryServer_setOutstandingUpdateAccessoriesRequest___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 40));
}

- (id)reachability
{
  id *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1, "operationQueue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "assertCurrentQueue");

    a1 = (id *)v1[16];
  }
  return a1;
}

- (id)reachabilityProfile
{
  id *v1;
  void *v2;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1, "operationQueue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "assertCurrentQueue");

    a1 = (id *)v1[17];
  }
  return a1;
}

- (void)setReachabilityProfile:(id *)a1
{
  void *v4;
  id v5;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(a1, "operationQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assertCurrentQueue");

    objc_storeStrong(a1 + 17, a2);
  }

}

- (id)internalPairingDriver
{
  id *v1;
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v1 = a1;
  if (a1)
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x3032000000;
    v8 = __Block_byref_object_copy__4013;
    v9 = __Block_byref_object_dispose__4014;
    v10 = 0;
    v2 = a1[21];
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __44__HAP2AccessoryServer_internalPairingDriver__block_invoke;
    v4[3] = &unk_1E894DEE8;
    v4[4] = v1;
    v4[5] = &v5;
    objc_msgSend(v2, "performReadingBlock:", v4);

    v1 = (id *)(id)v6[5];
    _Block_object_dispose(&v5, 8);

  }
  return v1;
}

void __44__HAP2AccessoryServer_internalPairingDriver__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 112));
}

- (void)setInternalPairingDriver:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 168);
    v6[1] = 3221225472;
    v6[2] = __48__HAP2AccessoryServer_setInternalPairingDriver___block_invoke;
    v6[3] = &unk_1E894E0F8;
    v6[4] = a1;
    v5 = v3;
    v6[0] = MEMORY[0x1E0C809B0];
    v7 = v3;
    objc_msgSend(v4, "performWritingBlock:", v6);

    v3 = v5;
  }

}

void __48__HAP2AccessoryServer_setInternalPairingDriver___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), *(id *)(a1 + 40));
}

- (id)pairDelegate
{
  id *v1;
  void *v2;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "operationQueue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "assertCurrentQueue");

    v6 = 0;
    v7 = &v6;
    v8 = 0x3032000000;
    v9 = __Block_byref_object_copy__4013;
    v10 = __Block_byref_object_dispose__4014;
    v11 = 0;
    v3 = v1[21];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __35__HAP2AccessoryServer_pairDelegate__block_invoke;
    v5[3] = &unk_1E894DEE8;
    v5[4] = v1;
    v5[5] = &v6;
    objc_msgSend(v3, "performReadingBlock:", v5);

    v1 = (id *)(id)v7[5];
    _Block_object_dispose(&v6, 8);

  }
  return v1;
}

void __35__HAP2AccessoryServer_pairDelegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (void)setPairDelegate:(_QWORD *)a1
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v5 = a2;
  if (a1)
  {
    objc_msgSend(a1, "operationQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assertCurrentQueue");

    v4 = (void *)a1[21];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__HAP2AccessoryServer_setPairDelegate___block_invoke;
    v6[3] = &unk_1E894E0F8;
    v6[4] = a1;
    v7 = v5;
    objc_msgSend(v4, "performWritingBlock:", v6);

  }
}

id __39__HAP2AccessoryServer_setPairDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 120), *(id *)(a1 + 40));
}

- (id)_delegateCancelableFor:(void *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v7[5];
  id v8;
  id location;
  _QWORD v10[4];
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  id v14;

  v3 = a2;
  if (a1)
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x3032000000;
    v13[3] = __Block_byref_object_copy__4013;
    v13[4] = __Block_byref_object_dispose__4014;
    v14 = 0;
    objc_msgSend(a1, "operationQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__HAP2AccessoryServer__delegateCancelableFor___block_invoke;
    v10[3] = &unk_1E8949FB8;
    v12 = v13;
    v11 = v3;
    objc_msgSend(v4, "addBlock:", v10);

    objc_initWeak(&location, a1);
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __46__HAP2AccessoryServer__delegateCancelableFor___block_invoke_2;
    v7[3] = &unk_1E894CFD0;
    objc_copyWeak(&v8, &location);
    v7[4] = v13;
    +[HAP2Cancelable cancelableWithBlock:](HAP2Cancelable, "cancelableWithBlock:", v7);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);

    _Block_object_dispose(v13, 8);
  }

  return a1;
}

void __46__HAP2AccessoryServer__delegateCancelableFor___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __46__HAP2AccessoryServer__delegateCancelableFor___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "operationQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__HAP2AccessoryServer__delegateCancelableFor___block_invoke_3;
    v7[3] = &unk_1E894DEE8;
    v9 = *(_QWORD *)(a1 + 32);
    v8 = v3;
    objc_msgSend(v6, "addBlock:", v7);

  }
}

uint64_t __46__HAP2AccessoryServer__delegateCancelableFor___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "cancelWithError:", *(_QWORD *)(a1 + 32));
}

- (void)_updateServerMetadata:(void *)a3 controller:
{
  void *v5;
  HAP2AccessoryServerMetadata *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  HAP2AccessoryServerMetadata *v15;
  id v16;
  HAP2AccessoryServerMetadata *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  id *v29;
  id v30;
  _QWORD v31[5];
  HAP2AccessoryServerMetadata *v32;
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[4];
  id *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v30 = a2;
  v28 = a3;
  if (a1)
  {
    v29 = a1;
    objc_msgSend(a1, "operationQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertCurrentQueue");

    v6 = [HAP2AccessoryServerMetadata alloc];
    objc_msgSend(v30, "deviceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v30, "hasPairings");
    objc_msgSend(v30, "protocolVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "model");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v30, "category");
    v13 = objc_msgSend(v30, "stateNumber");
    LOWORD(v5) = objc_msgSend(v30, "configNumber");
    objc_msgSend(v30, "setupHash");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    WORD1(v27) = (_WORD)v5;
    LOWORD(v27) = v13;
    v15 = -[HAP2AccessoryServerMetadata initWithDeviceID:hasPairings:protocolVersion:name:model:category:stateNumber:configNumber:setupHash:](v6, "initWithDeviceID:hasPairings:protocolVersion:name:model:category:stateNumber:configNumber:setupHash:", v7, v8, v9, v10, v11, v12, v27, v14);

    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__4013;
    v46 = __Block_byref_object_dispose__4014;
    v47 = 0;
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__4013;
    v40 = __Block_byref_object_dispose__4014;
    v41 = 0;
    v16 = v29[21];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __56__HAP2AccessoryServer__updateServerMetadata_controller___block_invoke;
    v31[3] = &unk_1E894BEA8;
    v34 = &v36;
    v31[4] = v29;
    v17 = v15;
    v32 = v17;
    v18 = v28;
    v33 = v18;
    v35 = &v42;
    objc_msgSend(v16, "performWritingBlock:", v31);

    v19 = (void *)v43[5];
    v43[5] = 0;

    if (v18)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v20 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v49 = v29;
        _os_log_impl(&dword_1CCE01000, v20, OS_LOG_TYPE_INFO, "%@ Resetting controller on accessory server", buf, 0xCu);
      }
    }
    objc_msgSend(v29, "controller");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleUpdatedMetadataWithOldMetadata:", v37[5]);

    objc_msgSend(v29, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = objc_msgSend((id)v37[5], "hasPairings");
    if ((_DWORD)v21 != -[HAP2AccessoryServerMetadata hasPairings](v17, "hasPairings")
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v22, "accessoryServerDidUpdateHasPairings:", v29);
    }
    objc_msgSend((id)v37[5], "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAP2AccessoryServerMetadata name](v17, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v23 == v24;

    if (!v25 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v22, "accessoryServerDidUpdateName:", v29);
    v26 = objc_msgSend((id)v37[5], "category");
    if (v26 != -[HAP2AccessoryServerMetadata category](v17, "category") && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v22, "accessoryServerDidUpdateCategory:", v29);

    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v42, 8);

  }
}

void __56__HAP2AccessoryServer__updateServerMetadata_controller___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 64));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
  if (*(_QWORD *)(a1 + 48))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 48));
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 48), "setAccessoryServer:", *(_QWORD *)(a1 + 32));
  }
}

- (void)_updateConnectionState:(void *)a3 withError:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unint64_t v10;
  const __CFString *v11;
  __CFString *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  unint64_t v20;
  uint8_t buf[4];
  id *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  __CFString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    objc_msgSend(a1, "operationQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assertCurrentQueue");

    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = a2;
    objc_msgSend(a1, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = a1[21];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __56__HAP2AccessoryServer__updateConnectionState_withError___block_invoke;
    v16[3] = &unk_1E894C548;
    v16[5] = &v17;
    v16[6] = a2;
    v16[4] = a1;
    objc_msgSend(v8, "performWritingBlock:", v16);

    if (v5 && a2 <= 5 && ((1 << a2) & 0x31) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "accessoryServerConnectionFailureReportWithError:", v5);
    if (v18[3] != a2)
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v9 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v18[3];
        if (v10 > 5)
          v11 = CFSTR("<unknown>");
        else
          v11 = off_1E8949FD8[v10];
        v12 = off_1E8949FD8[a2];
        *(_DWORD *)buf = 138412802;
        v22 = a1;
        v23 = 2112;
        v24 = v11;
        v25 = 2112;
        v26 = v12;
        v13 = v9;
        _os_log_impl(&dword_1CCE01000, v13, OS_LOG_TYPE_DEFAULT, "%@ Connection state changed: %@ -> %@", buf, 0x20u);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "accessoryServerDidUpdateConnectionState:", a1);
      if (a2 == 3 && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "accessoryServerConnectedWithSecureSession");
      objc_msgSend(a1, "browser");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
        objc_msgSend(v14, "accessoryServerDidUpdateConnectionState:", a1);

    }
    _Block_object_dispose(&v17, 8);
  }

}

_QWORD *__56__HAP2AccessoryServer__updateConnectionState_withError___block_invoke(_QWORD *result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result[4] + 24);
  if (v1 != result[6])
  {
    *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = v1;
    *(_QWORD *)(result[4] + 24) = result[6];
  }
  return result;
}

- (void)setBackgroundScheduler:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 144), a2);
}

- (void)_performBackgroundPollWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t);
  NSObject *v5;
  int v6;
  HAP2AccessoryServer *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = self;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEFAULT, "%@ Background reachability poll is running", (uint8_t *)&v6, 0xCu);
  }
  -[HAP2AccessoryServer verifyConnection](self, "verifyConnection");
  v4[2](v4, 1);

}

- (void)_setBackgroundActivityScheduler:(id)a3
{
  -[HAP2AccessoryServer setBackgroundScheduler:]((uint64_t)self, a3);
}

- (HAP2Accessory)primaryAccessory
{
  void *v2;
  void *v3;

  -[HAP2AccessoryServer privateAccessories]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HAP2Accessory *)v3;
}

- (void)clearAccessories
{
  -[HAP2AccessoryServer setPrivateAccessories:]((uint64_t)self, MEMORY[0x1E0C9AA60]);
  -[HAP2AccessoryServer setReachabilityProfile:]((id *)&self->super.super.isa, 0);
}

- (id)unpairWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  HAP2AccessoryServer *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v13 = self;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%@ Unpairing with accessory server", buf, 0xCu);
  }
  if (-[HAP2AccessoryServer isPaired](self, "isPaired"))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__HAP2AccessoryServer_Paired__unpairWithCompletion___block_invoke;
    v10[3] = &unk_1E894CF30;
    v10[4] = self;
    v11 = v4;
    -[HAP2AccessoryServer _delegateCancelableFor:](self, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = self;
      _os_log_error_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, "%@ Trying to unpair an unpaired server", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v8);

    +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)addPairing:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__HAP2AccessoryServer_Paired__addPairing_completion___block_invoke;
  v12[3] = &unk_1E894CF80;
  objc_copyWeak(&v15, &location);
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  -[HAP2AccessoryServer _delegateCancelableFor:](self, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v10;
}

- (id)removePairing:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__HAP2AccessoryServer_Paired__removePairing_completion___block_invoke;
  v12[3] = &unk_1E894CF80;
  objc_copyWeak(&v15, &location);
  v8 = v7;
  v14 = v8;
  v9 = v6;
  v13 = v9;
  -[HAP2AccessoryServer _delegateCancelableFor:](self, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v10;
}

- (id)getPairingsWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__HAP2AccessoryServer_Paired__getPairingsWithCompletion___block_invoke;
  v8[3] = &unk_1E894DBF8;
  objc_copyWeak(&v10, &location);
  v5 = v4;
  v9 = v5;
  -[HAP2AccessoryServer _delegateCancelableFor:](self, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (id)updateAccessoriesWithReason:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  HAP2AccessoryServer *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = __Block_byref_object_copy__19616;
  v17[4] = __Block_byref_object_dispose__19617;
  v18 = 0;
  -[HAP2AccessoryServer outstandingUpdateAccessoriesRequest]((id *)&self->super.super.isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v6 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v4;
      v21 = 2112;
      v22 = self;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEFAULT, "%@ Ignoring updateAccessories request with reason:%@ one already running", buf, 0x16u);
    }
    +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_initWeak((id *)buf, self);
    -[HAP2AccessoryServer operationQueue](self, "operationQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__HAP2AccessoryServer_Paired__updateAccessoriesWithReason___block_invoke;
    v13[3] = &unk_1E894CFA8;
    objc_copyWeak(&v16, (id *)buf);
    v15 = v17;
    v14 = v4;
    objc_msgSend(v8, "addBlock:", v13);

    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __59__HAP2AccessoryServer_Paired__updateAccessoriesWithReason___block_invoke_91;
    v11[3] = &unk_1E894CFD0;
    objc_copyWeak(&v12, (id *)buf);
    v11[4] = v17;
    +[HAP2Cancelable cancelableWithBlock:](HAP2Cancelable, "cancelableWithBlock:", v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v12);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  _Block_object_dispose(v17, 8);

  return v7;
}

- (BOOL)isConfirming
{
  void *v2;
  char v3;

  -[HAP2AccessoryServer reachability]((id *)&self->super.super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunning");

  return v3;
}

- (void)startConfirming
{
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  HAP2AccessoryServer *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[HAP2AccessoryServer isPaired](self, "isPaired"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__HAP2AccessoryServer_Paired__startConfirming__block_invoke;
    v6[3] = &unk_1E894DD08;
    v6[4] = self;
    v3 = (void *)MEMORY[0x1D17B7400](v6);
    -[HAP2AccessoryServer operationQueue](self, "operationQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addBlock:", v3);

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v5 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v8 = self;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEFAULT, "%@ Server no longer paired, ignoring request to start confirmations", buf, 0xCu);
    }
  }
}

- (void)stopConfirming
{
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  HAP2AccessoryServer *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (-[HAP2AccessoryServer isPaired](self, "isPaired"))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__HAP2AccessoryServer_Paired__stopConfirming__block_invoke;
    v6[3] = &unk_1E894DD08;
    v6[4] = self;
    v3 = (void *)MEMORY[0x1D17B7400](v6);
    -[HAP2AccessoryServer operationQueue](self, "operationQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addBlock:", v3);

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v5 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v8 = self;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEFAULT, "%@ Server no longer paired, ignoring request to stop confirmations", buf, 0xCu);
    }
  }
}

- (void)becomeUnpairedWithAccessoryServer:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  HAP2AccessoryServer *v13;
  id v14;
  uint8_t buf[4];
  HAP2AccessoryServer *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v16 = self;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%@ Accessory becoming unpaired", buf, 0xCu);
  }
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __65__HAP2AccessoryServer_Paired__becomeUnpairedWithAccessoryServer___block_invoke;
  v12 = &unk_1E894E0F8;
  v13 = self;
  v14 = v4;
  v6 = v4;
  v7 = (void *)MEMORY[0x1D17B7400](&v9);
  -[HAP2AccessoryServer operationQueue](self, "operationQueue", v9, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addBlock:", v7);

}

- (void)mergeWithNewlyDiscoveredPairedAccessoryServer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServer operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77__HAP2AccessoryServer_Paired__mergeWithNewlyDiscoveredPairedAccessoryServer___block_invoke;
  v7[3] = &unk_1E894DF38;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "addBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (id)readValuesForCharacteristics:(id)a3 timeout:(double)a4 completion:(id)a5
{
  return -[HAP2AccessoryServer _readValuesForCharacteristics:timeout:options:activity:completion:](self, a3, 0, 0, a5, a4);
}

- (id)writeValuesForCharacteristics:(id)a3 timeout:(double)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  HAP2AccessoryServer *v20;
  id v21;
  id v22;
  double v23;
  id v24;

  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ Write"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:", v13);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __80__HAP2AccessoryServer_Paired__writeValuesForCharacteristics_timeout_completion___block_invoke;
  v18[3] = &unk_1E894D020;
  v19 = v24;
  v20 = self;
  v14 = v9;
  v22 = v14;
  v15 = v8;
  v21 = v15;
  v23 = a4;
  -[HAP2AccessoryServer _delegateCancelableFor:](self, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  __HMFActivityScopeLeave();
  return v16;
}

- (id)enableNotificationsForCharacteristics:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__HAP2AccessoryServer_Paired__enableNotificationsForCharacteristics_completion___block_invoke;
  v12[3] = &unk_1E894D070;
  v13 = v6;
  v14 = v7;
  v12[4] = self;
  v8 = v6;
  v9 = v7;
  -[HAP2AccessoryServer _delegateCancelableFor:](self, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)disableNotificationsForCharacteristics:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __81__HAP2AccessoryServer_Paired__disableNotificationsForCharacteristics_completion___block_invoke;
  v12[3] = &unk_1E894D070;
  v13 = v6;
  v14 = v7;
  v12[4] = self;
  v8 = v6;
  v9 = v7;
  -[HAP2AccessoryServer _delegateCancelableFor:](self, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)handleEvents:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  HAP2AccessoryServer *v12;
  id v13;

  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __44__HAP2AccessoryServer_Paired__handleEvents___block_invoke;
  v11 = &unk_1E894E0F8;
  v12 = self;
  v13 = v4;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D17B7400](&v8);
  -[HAP2AccessoryServer operationQueue](self, "operationQueue", v8, v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addBlock:", v6);

}

- (void)handleUpdatedCharacteristicValues:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  HAP2AccessoryServer *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "instanceID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[HAP2AccessoryServer _findAccessoryAndCharacteristicForInstanceID:characteristic:]((id *)&self->super.super.isa, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __65__HAP2AccessoryServer_Paired__handleUpdatedCharacteristicValues___block_invoke;
      v12[3] = &unk_1E894D098;
      v13 = v7;
      objc_msgSend(v4, "enumerateObjectsUsingBlock:", v12);

    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v9 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        v10 = v9;
        objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v15 = self;
        v16 = 2112;
        v17 = v11;
        _os_log_error_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%@ Ignoring update for characteristic that we cannot find: %@", buf, 0x16u);

      }
    }

  }
}

- (void)handleReestablishedSession
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  HAP2AccessoryServer *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[HAP2AccessoryServer operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v4 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = self;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%@ We've re-established our session", (uint8_t *)&v10, 0xCu);
  }
  -[HAP2AccessoryServer _updateConnectionState:withError:]((id *)&self->super.super.isa, 3uLL, 0);
  objc_msgSend(MEMORY[0x1E0D28668], "sharedPowerLogger");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2AccessoryServer deviceID](self, "deviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HAP2AccessoryServer category](self, "category"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportConnection:linkType:accessoryCategory:", v7, 1, v8);

  -[HAP2AccessoryServer pairedDelegate](self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "accessoryServerDidUpdateAccessories:", self);

}

- (void)handleLostDiscoveryAdvertisement
{
  -[HAP2AccessoryServer handleLostDiscoveryAdvertisementWithWillSleep:](self, "handleLostDiscoveryAdvertisementWithWillSleep:", 0);
}

- (void)handleLostDiscoveryAdvertisementWithWillSleep:(BOOL)a3
{
  void *v5;
  _QWORD v6[4];
  id v7;
  BOOL v8;
  id location;

  objc_initWeak(&location, self);
  -[HAP2AccessoryServer operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __77__HAP2AccessoryServer_Paired__handleLostDiscoveryAdvertisementWithWillSleep___block_invoke;
  v6[3] = &unk_1E894D0C0;
  objc_copyWeak(&v7, &location);
  v8 = a3;
  objc_msgSend(v5, "addBlock:", v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)handleNetworkChanged
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[HAP2AccessoryServer operationQueue](self, "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__HAP2AccessoryServer_Paired__handleNetworkChanged__block_invoke;
  v4[3] = &unk_1E894E050;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "addBlock:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)closeSession
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__HAP2AccessoryServer_Paired__closeSession__block_invoke;
  v5[3] = &unk_1E894DD08;
  v5[4] = self;
  v3 = (void *)MEMORY[0x1D17B7400](v5, a2);
  -[HAP2AccessoryServer operationQueue](self, "operationQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addBlock:", v3);

}

- (void)verifyConnection
{
  void *v3;
  int v4;
  NSObject *v5;
  int v6;
  HAP2AccessoryServer *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[HAP2AccessoryServer delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "onDemandConnectionsAreEnabled");

  if (v4)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v5 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%@ Ignoring poll requests only on demand connections are allowed", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    -[HAP2AccessoryServer _pollAccessoryWithOptions:](self, 0);
  }
}

- (void)pollAccessory
{
  void *v3;
  int v4;
  NSObject *v5;
  int v6;
  HAP2AccessoryServer *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[HAP2AccessoryServer delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "onDemandConnectionsAreEnabled");

  if (v4)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v5 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%@ Ignoring poll requests only on demand connections are allowed", (uint8_t *)&v6, 0xCu);
    }
  }
  else
  {
    -[HAP2AccessoryServer _pollAccessoryWithOptions:](self, 1);
  }
}

- (void)_pollAccessoryWithOptions:(void *)a1
{
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v4 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v9 = a1;
      _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%@ Scheduling a poll", buf, 0xCu);
    }
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__HAP2AccessoryServer_Paired___pollAccessoryWithOptions___block_invoke;
    v7[3] = &unk_1E894D3B0;
    v7[4] = a1;
    v7[5] = a2;
    v5 = (void *)MEMORY[0x1D17B7400](v7);
    objc_msgSend(a1, "operationQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addBlock:", v5);

  }
}

void __57__HAP2AccessoryServer_Paired___pollAccessoryWithOptions___block_invoke(uint64_t a1)
{
  id *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _QWORD v39[5];
  _BYTE buf[24];
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id *v43;
  char *v44;
  id v45;
  _QWORD v46[4];

  v46[1] = *MEMORY[0x1E0C80C00];
  v1 = *(id **)(a1 + 32);
  if (!v1)
    return;
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "operationQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assertCurrentQueue");

  -[HAP2AccessoryServer reachabilityProfile](v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pollCharacteristic");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = MEMORY[0x1E0C809B0];
  if (v5)
    goto LABEL_3;
  objc_msgSend(v1, "primaryAccessory");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v41 = __Block_byref_object_copy__19616;
    v42 = __Block_byref_object_dispose__19617;
    v43 = 0;
    objc_msgSend(v1, "primaryAccessory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "services");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v6;
    v39[1] = 3221225472;
    v39[2] = __64__HAP2AccessoryServer_Paired___pollAccessoryOnQueueWithOptions___block_invoke;
    v39[3] = &unk_1E894D3D8;
    v39[4] = buf;
    objc_msgSend(v22, "enumerateObjectsUsingBlock:", v39);

    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__19616;
    v37 = __Block_byref_object_dispose__19617;
    v38 = 0;
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "characteristics");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v6;
    v32[1] = 3221225472;
    v32[2] = __64__HAP2AccessoryServer_Paired___pollAccessoryOnQueueWithOptions___block_invoke_2;
    v32[3] = &unk_1E894D1F0;
    v32[4] = &v33;
    objc_msgSend(v23, "enumerateObjectsUsingBlock:", v32);

    v5 = v34[5];
    _Block_object_dispose(&v33, 8);

    _Block_object_dispose(buf, 8);
    if (v5)
    {
LABEL_3:
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v7 = (void *)hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        v8 = v7;
        objc_msgSend(v5, "instanceID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v1;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v9;
        _os_log_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_INFO, "%@ polling characteristic=%@", buf, 0x16u);

      }
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@ Poll Accessory"), v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28660]), "initWithName:timeout:", CFSTR("Poll Accessory"), 60.0);
      v33 = 0;
      if (v14)
      {
        v15 = objc_alloc(MEMORY[0x1E0D28540]);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v46[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v15, "initWithIdentifier:name:parent:assertions:", v16, v13, 0, v17);
        v19 = v33;
        v33 = v18;

      }
      else
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v25 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v1;
          _os_log_error_impl(&dword_1CCE01000, v25, OS_LOG_TYPE_ERROR, "%@ Failed to create power assertion", buf, 0xCu);
        }
        v26 = objc_alloc(MEMORY[0x1E0D28540]);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v26, "initWithIdentifier:name:parent:options:", v16, v13, 0, 0);
        v17 = v33;
        v33 = v27;
      }

      v45 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)buf = v6;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __64__HAP2AccessoryServer_Paired___pollAccessoryOnQueueWithOptions___block_invoke_226;
      v41 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E894D408;
      v42 = (void (*)(uint64_t))v33;
      v43 = v1;
      v44 = sel__pollAccessoryOnQueueWithOptions_;
      v29 = -[HAP2AccessoryServer _readValuesForCharacteristics:timeout:options:activity:completion:](v1, v28, v2, v42, buf, 0.0);

      __HMFActivityScopeLeave();
      return;
    }
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v24 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v1;
      _os_log_error_impl(&dword_1CCE01000, v24, OS_LOG_TYPE_ERROR, "%@ Failed to find polling characteristic", buf, 0xCu);
    }
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v30 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v1;
      _os_log_impl(&dword_1CCE01000, v30, OS_LOG_TYPE_INFO, "%@ Polling without a primary accessory, updating accessories", buf, 0xCu);
    }
    v31 = (id)objc_msgSend(v1, "updateAccessoriesWithReason:", CFSTR("noAttributeDatabase"));
  }
}

void __64__HAP2AccessoryServer_Paired___pollAccessoryOnQueueWithOptions___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("0000003E-0000-1000-8000-0026BB765291"));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __64__HAP2AccessoryServer_Paired___pollAccessoryOnQueueWithOptions___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("00000052-0000-1000-8000-0026BB765291"));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __64__HAP2AccessoryServer_Paired___pollAccessoryOnQueueWithOptions___block_invoke_226(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "begin");
  v22 = *(id *)(a1 + 32);
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "error");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v9 = (id)hap2Log_accessory;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v15 = *(_QWORD *)(a1 + 40);
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "primaryAccessory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v24 = v15;
    v25 = 2112;
    v26 = v16;
    v27 = 2112;
    v28 = v18;
    v29 = 2112;
    v30 = v7;
    _os_log_debug_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_DEBUG, "%@ %@: completed id=%@, error=%@", buf, 0x2Au);

  }
  v10 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __64__HAP2AccessoryServer_Paired___pollAccessoryOnQueueWithOptions___block_invoke_227;
    v20[3] = &unk_1E894E0F8;
    v20[4] = *(_QWORD *)(a1 + 40);
    v21 = v7;
    v11 = (void *)MEMORY[0x1D17B7400](v20);
    objc_msgSend(*(id *)(a1 + 40), "operationQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addBlock:", v11);

  }
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __64__HAP2AccessoryServer_Paired___pollAccessoryOnQueueWithOptions___block_invoke_2_230;
  v19[3] = &unk_1E894DD08;
  v19[4] = *(_QWORD *)(a1 + 40);
  v13 = (void *)MEMORY[0x1D17B7400](v19);
  objc_msgSend(*(id *)(a1 + 40), "operationQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addBlock:", v13);

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  __HMFActivityScopeLeave();

}

- (id)_readValuesForCharacteristics:(uint64_t)a3 timeout:(void *)a4 options:(void *)a5 activity:(double)a6 completion:
{
  id v11;
  id v12;
  id v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  void *v32;
  id v33;
  id v34;
  double v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a4;
  v13 = a5;
  if (a1)
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("%@ Read"), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = 0;
    if (v12)
    {
      v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:parent:options:", v17, v12, 0);
      v19 = v37;
      v37 = v18;

    }
    else
    {
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28660]), "initWithName:timeout:", CFSTR("Read"), 60.0);
      if (v20)
      {
        v21 = objc_alloc(MEMORY[0x1E0D28540]);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v21, "initWithIdentifier:name:parent:assertions:", v22, v17, 0, v23);
        v25 = v37;
        v37 = v24;

      }
      else
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v26 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v40 = a1;
          _os_log_error_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_ERROR, "%@ Failed to create power assertion", buf, 0xCu);
        }
        v27 = objc_alloc(MEMORY[0x1E0D28540]);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)objc_msgSend(v27, "initWithIdentifier:name:parent:options:", v22, v17, 0, 0);
        v23 = v37;
        v37 = v28;
      }

      v18 = v37;
    }
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __97__HAP2AccessoryServer_Paired___readValuesForCharacteristics_timeout_options_activity_completion___block_invoke;
    v30[3] = &unk_1E894D248;
    v31 = v18;
    v32 = a1;
    v34 = v13;
    v33 = v11;
    v35 = a6;
    v36 = a3;
    -[HAP2AccessoryServer _delegateCancelableFor:](a1, v30);
    a1 = (void *)objc_claimAutoreleasedReturnValue();

    __HMFActivityScopeLeave();
  }

  return a1;
}

id __97__HAP2AccessoryServer_Paired___readValuesForCharacteristics_timeout_options_activity_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  int8x16_t v16;
  _QWORD v17[4];
  int8x16_t v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;

  objc_msgSend(*(id *)(a1 + 32), "begin");
  v37 = *(id *)(a1 + 32);
  if ((objc_msgSend(*(id *)(a1 + 40), "isPaired") & 1) != 0)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__19616;
    v32 = __Block_byref_object_dispose__19617;
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(*(id *)(a1 + 48), "count"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(a1 + 48);
    v4 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __97__HAP2AccessoryServer_Paired___readValuesForCharacteristics_timeout_options_activity_completion___block_invoke_3;
    v24[3] = &unk_1E894D220;
    v5 = v2;
    v6 = *(_QWORD *)(a1 + 40);
    v25 = v5;
    v26 = v6;
    v27 = &v28;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v24);
    if (v29[5])
    {
      objc_msgSend(*(id *)(a1 + 40), "operationQueue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v4;
      v20[1] = 3221225472;
      v20[2] = __97__HAP2AccessoryServer_Paired___readValuesForCharacteristics_timeout_options_activity_completion___block_invoke_202;
      v20[3] = &unk_1E894D188;
      v22 = *(id *)(a1 + 56);
      v23 = &v28;
      v21 = *(id *)(a1 + 32);
      objc_msgSend(v7, "addBlock:", v20);

      +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v22;
    }
    else
    {
      v17[0] = v4;
      v17[1] = 3221225472;
      v17[2] = __97__HAP2AccessoryServer_Paired___readValuesForCharacteristics_timeout_options_activity_completion___block_invoke_2_203;
      v17[3] = &unk_1E894CFF8;
      v16 = *(int8x16_t *)(a1 + 32);
      v12 = (id)v16.i64[0];
      v18 = vextq_s8(v16, v16, 8uLL);
      v19 = *(id *)(a1 + 56);
      v13 = (void *)MEMORY[0x1D17B7400](v17);
      objc_msgSend(*(id *)(a1 + 40), "controller");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "readValuesForCharacteristics:timeout:options:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), v13, *(double *)(a1 + 64));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)v18.i64[1];
    }

    _Block_object_dispose(&v28, 8);
    v11 = v33;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "operationQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __97__HAP2AccessoryServer_Paired___readValuesForCharacteristics_timeout_options_activity_completion___block_invoke_2;
    v34[3] = &unk_1E894D5E0;
    v36 = *(id *)(a1 + 56);
    v35 = *(id *)(a1 + 32);
    objc_msgSend(v10, "addBlock:", v34);

    +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v36;
  }

  __HMFActivityScopeLeave();
  return v8;
}

uint64_t __97__HAP2AccessoryServer_Paired___readValuesForCharacteristics_timeout_options_activity_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v3);

  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __97__HAP2AccessoryServer_Paired___readValuesForCharacteristics_timeout_options_activity_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6))
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 40);
      v12 = 138412546;
      v13 = v11;
      v14 = 2112;
      v15 = v6;
      _os_log_error_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_ERROR, "%@ Denying request to read the same characteristic twice: %@", (uint8_t *)&v12, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 9);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  }

}

uint64_t __97__HAP2AccessoryServer_Paired___readValuesForCharacteristics_timeout_options_activity_completion___block_invoke_202(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __97__HAP2AccessoryServer_Paired___readValuesForCharacteristics_timeout_options_activity_completion___block_invoke_2_203(uint64_t *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void **);
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __97__HAP2AccessoryServer_Paired___readValuesForCharacteristics_timeout_options_activity_completion___block_invoke_3_204;
  v15 = &unk_1E894DA30;
  v7 = (void *)a1[5];
  v16 = a1[4];
  v17 = v5;
  v18 = v6;
  v19 = v7;
  v8 = v6;
  v9 = v5;
  v10 = (void *)MEMORY[0x1D17B7400](&v12);
  objc_msgSend((id)a1[4], "operationQueue", v12, v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addBlock:", v10);

  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __97__HAP2AccessoryServer_Paired___readValuesForCharacteristics_timeout_options_activity_completion___block_invoke_3_204(void **a1)
{
  -[HAP2AccessoryServer _kickReachabilityAfterCharacteristicOperation:withResponse:ignoreCachedCharacteristics:error:](a1[4], CFSTR("Read"), a1[5], 1, a1[6]);
  return objc_msgSend(a1[7], "invalidate");
}

- (void)_kickReachabilityAfterCharacteristicOperation:(void *)a3 withResponse:(char)a4 ignoreCachedCharacteristics:(void *)a5 error:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  char v15;

  v13 = a2;
  v9 = a3;
  v10 = a5;
  if (a1)
  {
    objc_msgSend(a1, "operationQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assertCurrentQueue");

    if (!v10)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __124__HAP2AccessoryServer_Paired___kickReachabilityAfterCharacteristicOperation_withResponse_ignoreCachedCharacteristics_error___block_invoke;
      v14[3] = &unk_1E894D430;
      v15 = a4;
      v14[4] = a1;
      if (objc_msgSend(v9, "indexOfObjectPassingTest:", v14) != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (objc_msgSend(a1, "connectionState") != 3)
        {
          objc_msgSend(a1, "setReachabilityChangedReason:", v13);
          -[HAP2AccessoryServer _updateConnectionState:withError:]((id *)a1, 3uLL, 0);
        }
        -[HAP2AccessoryServer reachability]((id *)a1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "kick");

      }
    }
  }

}

BOOL __124__HAP2AccessoryServer_Paired___kickReachabilityAfterCharacteristicOperation_withResponse_ignoreCachedCharacteristics_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  _BOOL8 v8;
  void *v9;

  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(a1 + 40))
    goto LABEL_6;
  objc_msgSend(v3, "characteristic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hap2_canUseCachedValue") & 1) == 0)
  {

    goto LABEL_6;
  }
  -[HAP2AccessoryServer reachability](*(id **)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isRunning");

  if ((v7 & 1) == 0)
  {
LABEL_6:
    objc_msgSend(v4, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9 == 0;

    goto LABEL_7;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

void __64__HAP2AccessoryServer_Paired___pollAccessoryOnQueueWithOptions___block_invoke_227(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setReachabilityChangedReason:", CFSTR("Ping"));
  -[HAP2AccessoryServer _handleAccessoryOperationError:](*(void **)(a1 + 32), *(void **)(a1 + 40));
}

void __64__HAP2AccessoryServer_Paired___pollAccessoryOnQueueWithOptions___block_invoke_2_230(uint64_t a1)
{
  id v1;

  -[HAP2AccessoryServer reachability](*(id **)(a1 + 32));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "kick");

}

- (void)_handleAccessoryOperationError:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "operationQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assertCurrentQueue");

    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v5 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      v6 = v5;
      NSStringFromSelector(sel__handleAccessoryOperationError_);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = a1;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEFAULT, "%@ %@", (uint8_t *)&v12, 0x16u);

    }
    objc_msgSend(v3, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("HAPErrorDomain"));

    if (v9 && objc_msgSend(v3, "code") == 17)
    {
      v10 = 4;
LABEL_15:
      -[HAP2AccessoryServer _updateConnectionState:withError:]((id *)a1, v10, v3);
      goto LABEL_16;
    }
    v11 = objc_msgSend(a1, "connectionState");
    if (v11)
    {
      if (v11 == 5)
      {
        if (objc_msgSend(a1, "hasDiscoveryAdvertisement"))
          v10 = 5;
        else
          v10 = 0;
      }
      else
      {
        v10 = 5;
      }
      goto LABEL_15;
    }
  }
LABEL_16:

}

void __43__HAP2AccessoryServer_Paired__closeSession__block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "closeSession");

  if (objc_msgSend(*(id *)(a1 + 32), "connectionState") == 2 || objc_msgSend(*(id *)(a1 + 32), "connectionState") == 3)
  {
    v3 = *(id **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 3202);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[HAP2AccessoryServer _updateConnectionState:withError:](v3, 4uLL, v4);

  }
}

void __51__HAP2AccessoryServer_Paired__handleNetworkChanged__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  int v3;
  void *v4;
  NSObject *v5;
  unint64_t v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  id v10;
  __int16 v11;
  int v12;
  __int16 v13;
  __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "onDemandConnectionsAreEnabled");

  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v4 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = objc_msgSend(WeakRetained, "connectionState");
    if (v6 > 5)
      v7 = CFSTR("<unknown>");
    else
      v7 = off_1E8949FD8[v6];
    v8 = v7;
    v9 = 138412802;
    v10 = WeakRetained;
    v11 = 1024;
    v12 = v3;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEFAULT, "%@ event=networkchanged onDemand=%i connectionState=%@", (uint8_t *)&v9, 0x1Cu);

  }
  if ((v3 & 1) != 0 || (unint64_t)(objc_msgSend(WeakRetained, "connectionState") - 2) <= 3)
    -[HAP2AccessoryServer updateReachability](WeakRetained);

}

- (void)updateReachability
{
  void *v2;
  char v3;
  void *v4;
  NSObject *v5;
  const __CFString *v6;
  unint64_t v7;
  __CFString *v8;
  __CFString *v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return;
  objc_msgSend(a1, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "onDemandConnectionsAreEnabled");

  if ((v3 & 1) == 0)
  {
    -[HAP2AccessoryServer reachability]((id *)a1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "confirm");
LABEL_8:

    return;
  }
  if ((objc_msgSend(a1, "hasDiscoveryAdvertisement") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[HAP2AccessoryServer _updateConnectionState:withError:]((id *)a1, 0, v10);
    goto LABEL_8;
  }
  if (objc_msgSend(a1, "connectionState") == 5)
  {
    -[HAP2AccessoryServer _updateConnectionState:withError:]((id *)a1, 1uLL, 0);
  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v4 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v5 = v4;
      if (objc_msgSend(a1, "hasDiscoveryAdvertisement"))
        v6 = CFSTR("Found");
      else
        v6 = CFSTR("Lost");
      v7 = objc_msgSend(a1, "connectionState");
      if (v7 > 5)
        v8 = CFSTR("<unknown>");
      else
        v8 = off_1E8949FD8[v7];
      v9 = v8;
      *(_DWORD *)buf = 138412802;
      v12 = a1;
      v13 = 2112;
      v14 = v6;
      v15 = 2112;
      v16 = v9;
      _os_log_error_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_ERROR, "%@ Ignoring %@ Bonjour advertisement in %@", buf, 0x20u);

    }
  }
}

void __77__HAP2AccessoryServer_Paired__handleLostDiscoveryAdvertisementWithWillSleep___block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v3;
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  unint64_t v7;
  __CFString *v8;
  NSObject *v9;
  unint64_t v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  int v15;
  id v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setHasDiscoveryAdvertisement:", 0);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v4 = (void *)hap2Log_accessory;
  v5 = os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO);
  if (!v3)
  {
    if (v5)
    {
      v9 = v4;
      v10 = objc_msgSend(WeakRetained, "connectionState");
      if (v10 > 5)
        v11 = CFSTR("<unknown>");
      else
        v11 = off_1E8949FD8[v10];
      v13 = v11;
      v15 = 138412546;
      v16 = WeakRetained;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%@ Handling lost discovery advertisement in connectionState: %@", (uint8_t *)&v15, 0x16u);

    }
    v14 = objc_msgSend(WeakRetained, "connectionState");
    if ((unint64_t)(v14 - 3) < 3)
    {
      -[HAP2AccessoryServer updateReachability](WeakRetained);
      goto LABEL_19;
    }
    if (v14 != 1)
      goto LABEL_19;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithHMErrorCode:", 4);
    v6 = objc_claimAutoreleasedReturnValue();
    -[HAP2AccessoryServer _updateConnectionState:withError:]((id *)WeakRetained, 0, v6);
    goto LABEL_12;
  }
  if (v5)
  {
    v6 = v4;
    v7 = objc_msgSend(WeakRetained, "connectionState");
    if (v7 > 5)
      v8 = CFSTR("<unknown>");
    else
      v8 = off_1E8949FD8[v7];
    v12 = v8;
    v15 = 138412546;
    v16 = WeakRetained;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_INFO, "%@ Ignoring lost advertisement while going to sleep in connectionState: %@", (uint8_t *)&v15, 0x16u);

LABEL_12:
  }
LABEL_19:

}

- (id)pairedDelegate
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      objc_msgSend(v1, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EFA45290))
      {
        objc_msgSend(v1, "delegate");
        v1 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v1 = 0;
      }

    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

- (id)_findAccessoryAndCharacteristicForInstanceID:(_QWORD *)a3 characteristic:
{
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v5 = a2;
  if (a1)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__19616;
    v23 = __Block_byref_object_dispose__19617;
    v24 = 0;
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__19616;
    v17 = __Block_byref_object_dispose__19617;
    v18 = 0;
    -[HAP2AccessoryServer privateAccessories](a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __91__HAP2AccessoryServer_Paired___findAccessoryAndCharacteristicForInstanceID_characteristic___block_invoke;
    v9[3] = &unk_1E894D2C0;
    v10 = v5;
    v11 = &v19;
    v12 = &v13;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

    if (a3)
      *a3 = objc_retainAutorelease((id)v14[5]);
    v7 = (id)v20[5];

    _Block_object_dispose(&v13, 8);
    _Block_object_dispose(&v19, 8);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __65__HAP2AccessoryServer_Paired__handleUpdatedCharacteristicValues___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "characteristicValueChanged:", a2);
}

void __91__HAP2AccessoryServer_Paired___findAccessoryAndCharacteristicForInstanceID_characteristic___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a2;
  objc_msgSend(v6, "services");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__HAP2AccessoryServer_Paired___findAccessoryAndCharacteristicForInstanceID_characteristic___block_invoke_2;
  v13[3] = &unk_1E894D298;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v14 = v8;
  v16 = v9;
  v10 = v6;
  v11 = *(_QWORD *)(a1 + 48);
  v12 = v10;
  v15 = v10;
  v17 = v11;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v13);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    *a4 = 1;

}

void __91__HAP2AccessoryServer_Paired___findAccessoryAndCharacteristicForInstanceID_characteristic___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  __int128 v8;
  _QWORD v9[4];
  id v10;
  __int128 v11;
  uint64_t v12;

  objc_msgSend(a2, "characteristics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __91__HAP2AccessoryServer_Paired___findAccessoryAndCharacteristicForInstanceID_characteristic___block_invoke_3;
  v9[3] = &unk_1E894D270;
  v10 = *(id *)(a1 + 32);
  v8 = *(_OWORD *)(a1 + 40);
  v7 = (id)v8;
  v11 = v8;
  v12 = *(_QWORD *)(a1 + 56);
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    *a4 = 1;

}

void __91__HAP2AccessoryServer_Paired___findAccessoryAndCharacteristicForInstanceID_characteristic___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "instanceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
    *a4 = 1;
  }

}

void __44__HAP2AccessoryServer_Paired__handleEvents___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v1 = *(void **)(a1 + 32);
  v2 = *(id *)(a1 + 40);
  if (v1)
  {
    objc_msgSend(v1, "operationQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "assertCurrentQueue");

    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000;
    v13 = 0;
    objc_msgSend(MEMORY[0x1E0D28668], "sharedPowerLogger");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "deviceID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deviceIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v1, "category"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reportIncomingIPEvent:accessoryCategory:", v6, v7);

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__HAP2AccessoryServer_Paired___handleEvents___block_invoke;
    v9[3] = &unk_1E894D2E8;
    v9[4] = v1;
    v9[5] = &v10;
    objc_msgSend(v2, "enumerateObjectsUsingBlock:", v9);
    if (*((_BYTE *)v11 + 24))
    {
      -[HAP2AccessoryServer reachability]((id *)v1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "kick");

    }
    _Block_object_dispose(&v10, 8);
  }

}

void __45__HAP2AccessoryServer_Paired___handleEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id *v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *log;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  id v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "instanceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(id **)(a1 + 32);
  v40 = 0;
  -[HAP2AccessoryServer _findAccessoryAndCharacteristicForInstanceID:characteristic:](v5, v4, &v40);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v40;
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v10 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v42 = v11;
      v43 = 2112;
      v44 = (uint64_t)v4;
      v12 = "%@ Ignoring event for characteristic %@ that doesn't match any we know about";
LABEL_21:
      _os_log_error_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);
    }
  }
  else
  {
    objc_msgSend(v7, "metadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "format");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = HAPCharacteristicFormatFromString(v14);

    if (v15)
    {
      objc_msgSend(*(id *)(a1 + 32), "controller");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "encoding");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "encodedValueData");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = 0;
      objc_msgSend(v17, "decodeBodyData:format:error:", v18, v15, &v39);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v39;

      if (v19)
      {
        objc_msgSend(v8, "service");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v21 = (void *)hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
        {
          v32 = *(_QWORD *)(a1 + 32);
          log = v21;
          v30 = objc_msgSend(v6, "instanceID");
          objc_msgSend(v20, "type");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          +[HAPCharacteristic hap2_shortTypeFromUUID:](HAPCharacteristic, "hap2_shortTypeFromUUID:", v35);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "instanceID");
          v37 = v19;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "type");
          v36 = v20;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          +[HAPCharacteristic hap2_shortTypeFromUUID:](HAPCharacteristic, "hap2_shortTypeFromUUID:", v33);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "instanceID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "encodedContextData");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138414083;
          v42 = v32;
          v43 = 2048;
          v44 = v30;
          v45 = 2112;
          v46 = v31;
          v47 = 2112;
          v48 = v22;
          v49 = 2112;
          v50 = v23;
          v51 = 2112;
          v52 = v24;
          v53 = 2113;
          v54 = v37;
          v55 = 2112;
          v56 = v25;
          _os_log_impl(&dword_1CCE01000, log, OS_LOG_TYPE_DEFAULT, "%@ Received event for accessory %lu, service %@ [%@], characteristic %@ [%@] -> %{private}@ notificationContext %@", buf, 0x52u);

          v20 = v36;
          v19 = v37;

        }
        objc_msgSend(v8, "setValue:", v19);
        objc_msgSend(v3, "encodedContextData");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setNotificationContext:", v26);

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        objc_msgSend(v6, "characteristicValueChanged:", v8);

      }
      else
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v28 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          v29 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412802;
          v42 = v29;
          v43 = 2112;
          v44 = (uint64_t)v4;
          v45 = 2112;
          v46 = v38;
          _os_log_error_impl(&dword_1CCE01000, v28, OS_LOG_TYPE_ERROR, "%@ Ignoring event for characteristic %@ because value failed to parse: %@", buf, 0x20u);
        }
      }

      goto LABEL_27;
    }
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v10 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v27 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v42 = v27;
      v43 = 2112;
      v44 = (uint64_t)v4;
      v12 = "%@ Ignoring event for characteristic %@ that doesn't have metadata we can act on";
      goto LABEL_21;
    }
  }
LABEL_27:

}

id __81__HAP2AccessoryServer_Paired__disableNotificationsForCharacteristics_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;

  if ((objc_msgSend(*(id *)(a1 + 32), "isPaired") & 1) != 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __81__HAP2AccessoryServer_Paired__disableNotificationsForCharacteristics_completion___block_invoke_3;
    v8[3] = &unk_1E894D048;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = *(id *)(a1 + 48);
    v2 = (void *)MEMORY[0x1D17B7400](v8);
    objc_msgSend(*(id *)(a1 + 32), "controller");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "disableNotificationsForCharacteristics:options:completion:", *(_QWORD *)(a1 + 40), 0, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v9;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "operationQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __81__HAP2AccessoryServer_Paired__disableNotificationsForCharacteristics_completion___block_invoke_2;
    v10[3] = &unk_1E894D498;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v6, "addBlock:", v10);

    +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
  }

  return v4;
}

void __81__HAP2AccessoryServer_Paired__disableNotificationsForCharacteristics_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __81__HAP2AccessoryServer_Paired__disableNotificationsForCharacteristics_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __81__HAP2AccessoryServer_Paired__disableNotificationsForCharacteristics_completion___block_invoke_4;
  v11[3] = &unk_1E894E120;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  v9 = (void *)MEMORY[0x1D17B7400](v11);
  objc_msgSend(*(id *)(a1 + 32), "operationQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addBlock:", v9);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __81__HAP2AccessoryServer_Paired__disableNotificationsForCharacteristics_completion___block_invoke_4(void **a1)
{
  -[HAP2AccessoryServer _kickReachabilityAfterCharacteristicOperation:withResponse:ignoreCachedCharacteristics:error:](a1[4], CFSTR("DisableNotify"), a1[5], 0, a1[6]);
}

id __80__HAP2AccessoryServer_Paired__enableNotificationsForCharacteristics_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;

  if ((objc_msgSend(*(id *)(a1 + 32), "isPaired") & 1) != 0)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __80__HAP2AccessoryServer_Paired__enableNotificationsForCharacteristics_completion___block_invoke_3;
    v8[3] = &unk_1E894D048;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = *(id *)(a1 + 48);
    v2 = (void *)MEMORY[0x1D17B7400](v8);
    objc_msgSend(*(id *)(a1 + 32), "controller");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "enableNotificationsForCharacteristics:options:completion:", *(_QWORD *)(a1 + 40), 0, v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v9;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "operationQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __80__HAP2AccessoryServer_Paired__enableNotificationsForCharacteristics_completion___block_invoke_2;
    v10[3] = &unk_1E894D498;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v6, "addBlock:", v10);

    +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
  }

  return v4;
}

void __80__HAP2AccessoryServer_Paired__enableNotificationsForCharacteristics_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __80__HAP2AccessoryServer_Paired__enableNotificationsForCharacteristics_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__HAP2AccessoryServer_Paired__enableNotificationsForCharacteristics_completion___block_invoke_4;
  v11[3] = &unk_1E894E120;
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v7 = v6;
  v8 = v5;
  v9 = (void *)MEMORY[0x1D17B7400](v11);
  objc_msgSend(*(id *)(a1 + 32), "operationQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addBlock:", v9);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __80__HAP2AccessoryServer_Paired__enableNotificationsForCharacteristics_completion___block_invoke_4(void **a1)
{
  -[HAP2AccessoryServer _kickReachabilityAfterCharacteristicOperation:withResponse:ignoreCachedCharacteristics:error:](a1[4], CFSTR("EnableNotify"), a1[5], 0, a1[6]);
}

id __80__HAP2AccessoryServer_Paired__writeValuesForCharacteristics_timeout_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int8x16_t v9;
  _QWORD v10[4];
  int8x16_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "begin");
  v16 = *(id *)(a1 + 32);
  if ((objc_msgSend(*(id *)(a1 + 40), "isPaired") & 1) != 0)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __80__HAP2AccessoryServer_Paired__writeValuesForCharacteristics_timeout_completion___block_invoke_3;
    v10[3] = &unk_1E894CFF8;
    v9 = *(int8x16_t *)(a1 + 32);
    v2 = (id)v9.i64[0];
    v11 = vextq_s8(v9, v9, 8uLL);
    v12 = *(id *)(a1 + 56);
    v3 = (void *)MEMORY[0x1D17B7400](v10);
    objc_msgSend(*(id *)(a1 + 40), "controller");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "writeValuesForCharacteristics:timeout:options:completion:", *(_QWORD *)(a1 + 48), 0, v3, *(double *)(a1 + 64));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)v11.i64[1];
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "operationQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __80__HAP2AccessoryServer_Paired__writeValuesForCharacteristics_timeout_completion___block_invoke_2;
    v13[3] = &unk_1E894D5E0;
    v15 = *(id *)(a1 + 56);
    v14 = *(id *)(a1 + 32);
    objc_msgSend(v7, "addBlock:", v13);

    +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v15;
  }

  __HMFActivityScopeLeave();
  return v5;
}

uint64_t __80__HAP2AccessoryServer_Paired__writeValuesForCharacteristics_timeout_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v3);

  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __80__HAP2AccessoryServer_Paired__writeValuesForCharacteristics_timeout_completion___block_invoke_3(uint64_t *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(void **);
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __80__HAP2AccessoryServer_Paired__writeValuesForCharacteristics_timeout_completion___block_invoke_4;
  v15 = &unk_1E894DA30;
  v7 = (void *)a1[5];
  v16 = a1[4];
  v17 = v5;
  v18 = v6;
  v19 = v7;
  v8 = v6;
  v9 = v5;
  v10 = (void *)MEMORY[0x1D17B7400](&v12);
  objc_msgSend((id)a1[4], "operationQueue", v12, v13, v14, v15, v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addBlock:", v10);

  (*(void (**)(void))(a1[6] + 16))();
}

uint64_t __80__HAP2AccessoryServer_Paired__writeValuesForCharacteristics_timeout_completion___block_invoke_4(void **a1)
{
  -[HAP2AccessoryServer _kickReachabilityAfterCharacteristicOperation:withResponse:ignoreCachedCharacteristics:error:](a1[4], CFSTR("Write"), a1[5], 0, a1[6]);
  return objc_msgSend(a1[7], "invalidate");
}

void __77__HAP2AccessoryServer_Paired__mergeWithNewlyDiscoveredPairedAccessoryServer___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  NSObject *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_msgSend(WeakRetained, "hasDiscoveryAdvertisement");
  objc_msgSend(WeakRetained, "setHasDiscoveryAdvertisement:", 1);
  if ((v3 & 1) == 0 && objc_msgSend(WeakRetained, "connectionState") == 5)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v4 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      v17 = 138412290;
      v18 = WeakRetained;
      _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%@ New advertisement while unreachable", (uint8_t *)&v17, 0xCu);
    }
    -[HAP2AccessoryServer updateReachability](WeakRetained);
  }
  objc_msgSend(WeakRetained, "protocolVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "protocolVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToVersion:", v6);

  if ((v7 & 1) != 0)
    goto LABEL_14;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v8 = (void *)hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    objc_msgSend(WeakRetained, "protocolVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "protocolVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412802;
    v18 = WeakRetained;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%@ Accessory protocol version changed (%@ -> %@)", (uint8_t *)&v17, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "controller");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
LABEL_14:
    objc_msgSend(WeakRetained, "controller");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "controller");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "mergeWithNewController:", v14);

    if ((v15 & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v16 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        v17 = 138412290;
        v18 = WeakRetained;
        _os_log_impl(&dword_1CCE01000, v16, OS_LOG_TYPE_INFO, "%@ Controller requested that we replace our current controller", (uint8_t *)&v17, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 32), "controller");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  -[HAP2AccessoryServer _updateServerMetadata:controller:]((id *)WeakRetained, *(void **)(a1 + 32), v12);

}

void __65__HAP2AccessoryServer_Paired__becomeUnpairedWithAccessoryServer___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  void *v5;
  id v6;

  -[HAP2AccessoryServer setInternallyPaired:](*(_QWORD *)(a1 + 32), 0);
  -[HAP2AccessoryServer setPrivateAccessories:](*(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AA60]);
  -[HAP2AccessoryServer setReachabilityProfile:](*(id **)(a1 + 32), 0);
  -[HAP2AccessoryServer setPairedName:](*(_QWORD *)(a1 + 32), 0);
  -[HAP2AccessoryServer setPairedProtocolVersion:](*(_QWORD *)(a1 + 32), 0);
  objc_msgSend(*(id *)(a1 + 40), "pairingDriver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2AccessoryServer setInternalPairingDriver:](*(_QWORD *)(a1 + 32), v2);

  -[HAP2AccessoryServer _updateConnectionState:withError:](*(id **)(a1 + 32), 1uLL, 0);
  v3 = *(id **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  objc_msgSend(v4, "controller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2AccessoryServer _updateServerMetadata:controller:](v3, v4, v5);

  -[HAP2AccessoryServer _stopConfirming](*(id **)(a1 + 32));
  -[HAP2AccessoryServer pairedDelegate](*(id *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "accessoryServerDidBecomeUnpaired:", *(_QWORD *)(a1 + 32));

}

- (void)_stopConfirming
{
  void *v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  __int128 v7;
  void (*v8)(uint64_t, void *);
  void *v9;
  id *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "operationQueue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "assertCurrentQueue");

    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v3 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v7) = 138412290;
      *(_QWORD *)((char *)&v7 + 4) = a1;
      _os_log_impl(&dword_1CCE01000, v3, OS_LOG_TYPE_DEFAULT, "%@ Stopping reachability confirmations", (uint8_t *)&v7, 0xCu);
    }
    v4 = a1[18];
    objc_msgSend(v4, "invalidate");

    objc_storeStrong(a1 + 18, 0);
    objc_msgSend(a1, "operationQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assertCurrentQueue");

    -[HAP2AccessoryServer reachability](a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v7 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v7 + 1) = 3221225472;
    v8 = __54__HAP2AccessoryServer_Paired___stopReachabilityClient__block_invoke;
    v9 = &unk_1E894DD58;
    v10 = a1;
    objc_msgSend(v6, "stopWithCompletionHandler:", &v7);

  }
}

void __54__HAP2AccessoryServer_Paired___stopReachabilityClient__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  if (v2)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v4 = hap2Log_accessory;
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        v5 = 138412546;
        v6 = v2;
        v7 = 2112;
        v8 = v3;
        _os_log_error_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_ERROR, "%@ Failed to stop reachability client: %@", (uint8_t *)&v5, 0x16u);
      }
    }
    else if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      v5 = 138412290;
      v6 = v2;
      _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%@ Reachability client stopped", (uint8_t *)&v5, 0xCu);
    }
  }

}

void __45__HAP2AccessoryServer_Paired__stopConfirming__block_invoke(uint64_t a1)
{
  -[HAP2AccessoryServer _stopConfirming](*(id **)(a1 + 32));
}

void __46__HAP2AccessoryServer_Paired__startConfirming__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  id *v15;
  void *v16;
  void *v17;
  id *v18;
  id location[5];
  id from;
  __int128 buf;
  void (*v22)(uint64_t, void *);
  void *v23;
  id *v24;
  id *v25;
  id v26[2];

  v26[1] = *(id *)MEMORY[0x1E0C80C00];
  v1 = *(id **)(a1 + 32);
  if (v1)
  {
    objc_msgSend(*(id *)(a1 + 32), "operationQueue");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "assertCurrentQueue");

    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v3 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v1;
      _os_log_impl(&dword_1CCE01000, v3, OS_LOG_TYPE_DEFAULT, "%@ Starting reachability confirmations", (uint8_t *)&buf, 0xCu);
    }
    v4 = v1[18];

    if (v4)
    {
      v5 = v1[18];
      objc_msgSend(v5, "invalidate");

    }
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "deviceID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@/%@"), v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB34B0]), "initWithIdentifier:", v10);
    objc_msgSend(v11, "setRepeats:", 1);
    objc_msgSend(v11, "setInterval:", 57600.0);
    objc_msgSend(v11, "setTolerance:", 28800.0);
    objc_storeStrong(v1 + 18, v11);
    objc_msgSend(v11, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(location, v11);
    objc_initWeak(&from, v1);
    v13 = (void *)MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v22 = __57__HAP2AccessoryServer_Paired___scheduleBackgroundPolling__block_invoke;
    v23 = &unk_1E894D310;
    objc_copyWeak((id *)&v25, &from);
    v14 = v12;
    v24 = v14;
    objc_copyWeak(v26, location);
    objc_msgSend(v11, "scheduleWithBlock:", &buf);
    objc_destroyWeak(v26);

    objc_destroyWeak((id *)&v25);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);

    location[0] = v13;
    location[1] = (id)3221225472;
    location[2] = __47__HAP2AccessoryServer_Paired___startConfirming__block_invoke;
    location[3] = &unk_1E894DD58;
    location[4] = v1;
    v15 = location;
    objc_msgSend(v1, "operationQueue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "assertCurrentQueue");

    -[HAP2AccessoryServer reachability](v1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = v13;
    *((_QWORD *)&buf + 1) = 3221225472;
    v22 = __70__HAP2AccessoryServer_Paired___startReachabilityClientWithCompletion___block_invoke;
    v23 = &unk_1E894D798;
    v24 = v1;
    v18 = v15;
    v25 = v18;
    objc_msgSend(v17, "startWithCompletionHandler:", &buf);

  }
}

void __47__HAP2AccessoryServer_Paired___startConfirming__block_invoke(uint64_t a1, uint64_t a2)
{
  id v2;

  if (!a2)
  {
    -[HAP2AccessoryServer reachability](*(id **)(a1 + 32));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "confirm");

  }
}

void __70__HAP2AccessoryServer_Paired___startReachabilityClientWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v3 = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__HAP2AccessoryServer_Paired___startReachabilityClientWithCompletion___block_invoke_2;
  v8[3] = &unk_1E894D9E8;
  v4 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v4;
  v5 = v3;
  v6 = (void *)MEMORY[0x1D17B7400](v8);
  objc_msgSend(*(id *)(a1 + 32), "operationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addBlock:", v6);

}

uint64_t __70__HAP2AccessoryServer_Paired___startReachabilityClientWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t result;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = v3;
  if (v2)
  {
    if (v3)
    {
      if (objc_msgSend(v3, "code") == 4
        && (objc_msgSend(v4, "domain"),
            v5 = (void *)objc_claimAutoreleasedReturnValue(),
            v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("HAPErrorDomain")),
            v5,
            v6))
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v7 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
        {
          v11 = 138412290;
          v12 = v2;
          _os_log_debug_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%@ reachability already running", (uint8_t *)&v11, 0xCu);
        }
      }
      else
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v8 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          v11 = 138412546;
          v12 = v2;
          v13 = 2112;
          v14 = v4;
          _os_log_error_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%@ reachability start failed: %@", (uint8_t *)&v11, 0x16u);
        }
      }
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v9 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        v11 = 138412290;
        v12 = v2;
        _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%@ reachability started", (uint8_t *)&v11, 0xCu);
      }
    }
  }

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

void __57__HAP2AccessoryServer_Paired___scheduleBackgroundPolling__block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t);
  id WeakRetained;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 48));
    if (objc_msgSend(v5, "shouldDefer"))
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v6 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
      {
        v9 = 138412290;
        v10 = WeakRetained;
        _os_log_debug_impl(&dword_1CCE01000, v6, OS_LOG_TYPE_DEBUG, "%@ Background reachability poll was deferred", (uint8_t *)&v9, 0xCu);
      }
      v3[2](v3, 2);
    }
    else
    {
      objc_msgSend(WeakRetained, "_performBackgroundPollWithCompletion:", v3);
    }

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v7 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
    {
      v8 = *(void **)(a1 + 32);
      v9 = 138412290;
      v10 = v8;
      _os_log_debug_impl(&dword_1CCE01000, v7, OS_LOG_TYPE_DEBUG, "%@ Background reachability poll fired but server is gone", (uint8_t *)&v9, 0xCu);
    }
    v3[2](v3, 1);
  }

}

void __59__HAP2AccessoryServer_Paired__updateAccessoriesWithReason___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  char v19;
  char v20;
  unint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 buf;
  void (*v38)(uint64_t, void *, void *);
  void *v39;
  id v40;
  id *v41;
  id v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    -[HAP2AccessoryServer outstandingUpdateAccessoriesRequest](WeakRetained);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v4);
    }
    else
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ Update Accessories"), v7);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28660]), "initWithName:timeout:", CFSTR("Update Activities"), 60.0);
      if (v8)
      {
        v9 = objc_alloc(MEMORY[0x1E0D28540]);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend(v9, "initWithIdentifier:name:parent:assertions:", v10, v34, 0, v11);

      }
      else
      {
        if (hap2LogInitialize_onceToken != -1)
          dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
        v12 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 138412290;
          *(_QWORD *)((char *)&buf + 4) = v3;
          _os_log_error_impl(&dword_1CCE01000, v12, OS_LOG_TYPE_ERROR, "%@ Failed to create power assertion", (uint8_t *)&buf, 0xCu);
        }
        v13 = objc_alloc(MEMORY[0x1E0D28540]);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 0;
        v35 = (void *)objc_msgSend(v13, "initWithIdentifier:name:parent:options:", v10, v34, 0, 0);
      }

      v14 = *(void **)(a1 + 32);
      v15 = v35;
      v16 = v14;
      objc_msgSend(v3, "operationQueue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "assertCurrentQueue");

      v18 = objc_msgSend(v3, "connectionState");
      v19 = objc_msgSend(v3, "isPaired");
      if (v18)
        v20 = v19;
      else
        v20 = 0;
      if ((v20 & 1) != 0)
      {
        v21 = objc_msgSend(v3, "connectionState");
        if (v21 <= 4 && ((1 << v21) & 0x16) != 0)
        {
          if (hap2LogInitialize_onceToken != -1)
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
          v22 = hap2Log_accessory;
          if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v3;
            _os_log_impl(&dword_1CCE01000, v22, OS_LOG_TYPE_INFO, "%@ Connecting", (uint8_t *)&buf, 0xCu);
          }
          -[HAP2AccessoryServer _updateConnectionState:withError:](v3, 2uLL, 0);
        }
        objc_msgSend(MEMORY[0x1E0D28668], "sharedPowerLogger");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "deviceID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "deviceIDString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "category"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "reportConnection:linkType:accessoryCategory:", v25, 1, v26);

        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "controller");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v38 = __69__HAP2AccessoryServer_Paired___updateAccessoriesWithActivity_reason___block_invoke;
        v39 = &unk_1E894D110;
        v40 = v15;
        v41 = v3;
        v42 = v27;
        v43 = v16;
        v29 = v27;
        objc_msgSend(v28, "readAttributeDatabaseWithCompletion:", &buf);
        v30 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        -[HAP2AccessoryServer setOutstandingUpdateAccessoriesRequest:](v3, 0);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[HAP2AccessoryServer _handleFailedAccessoryDiscovery:](v3, v31);

        +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
        v30 = objc_claimAutoreleasedReturnValue();
      }

      v32 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v33 = *(void **)(v32 + 40);
      *(_QWORD *)(v32 + 40) = v30;

      -[HAP2AccessoryServer setOutstandingUpdateAccessoriesRequest:](v3, *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      __HMFActivityScopeLeave();

    }
  }

}

void __59__HAP2AccessoryServer_Paired__updateAccessoriesWithReason___block_invoke_91(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "operationQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__HAP2AccessoryServer_Paired__updateAccessoriesWithReason___block_invoke_2;
    v7[3] = &unk_1E894DEE8;
    v9 = *(_QWORD *)(a1 + 32);
    v8 = v3;
    objc_msgSend(v6, "addBlock:", v7);

  }
}

uint64_t __59__HAP2AccessoryServer_Paired__updateAccessoriesWithReason___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "cancelWithError:", *(_QWORD *)(a1 + 32));
}

- (void)_handleFailedAccessoryDiscovery:(void *)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "operationQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assertCurrentQueue");

    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v5 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412546;
      v8 = a1;
      v9 = 2112;
      v10 = v3;
      _os_log_error_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_ERROR, "%@ Failed to discover accessories: %@", (uint8_t *)&v7, 0x16u);
    }
    objc_msgSend(a1, "setReachabilityChangedReason:", CFSTR("AttributeDatabaseRead"));
    -[HAP2AccessoryServer _handleAccessoryOperationError:](a1, v3);
    objc_msgSend(a1, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "accessoryServer:didFailToUpdateAccessoriesWithError:", a1, v3);

  }
}

void __69__HAP2AccessoryServer_Paired___updateAccessoriesWithActivity_reason___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  id v12;
  void *v13;
  id *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  NSObject *v48;
  uint64_t v49;
  NSObject *v50;
  _QWORD *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  HAPAccessoryReachabilityProfile *v55;
  void *v56;
  void *v57;
  HAPAccessoryReachabilityProfile *v58;
  void *v59;
  _QWORD *v60;
  _QWORD *v61;
  void *v62;
  _QWORD *v63;
  _BYTE *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  NSObject *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  char isKindOfClass;
  void *v75;
  NSObject *v76;
  NSObject *v77;
  void *v78;
  id v79;
  NSObject *v80;
  uint64_t v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  _QWORD *v88;
  id v89;
  _QWORD *v90;
  void *v91;
  void *v92;
  id v93;
  _QWORD v94[5];
  id v95;
  _QWORD v96[2];
  uint64_t (*v97)(uint64_t);
  void *v98;
  id v99;
  _QWORD *v100;
  _QWORD *v101;
  _QWORD v102[4];
  id v103;
  id v104;
  _QWORD *v105;
  _QWORD *v106;
  _QWORD v107[4];
  _QWORD v108[4];
  id v109;
  _QWORD v110[3];
  char v111;
  id v112;
  _QWORD v113[6];
  uint64_t v114;
  uint64_t *v115;
  uint64_t v116;
  uint64_t (*v117)(uint64_t, uint64_t);
  void (*v118)(uint64_t);
  id v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t (*v123)(uint64_t, uint64_t);
  void (*v124)(uint64_t);
  id v125;
  _QWORD v126[4];
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t (*v131)(uint64_t, uint64_t);
  void (*v132)(uint64_t);
  id v133;
  void *v134;
  _BYTE buf[24];
  void *v136;
  void *v137;
  id v138;
  _BYTE v139[24];
  uint64_t (*v140)(uint64_t, uint64_t);
  void (*v141)(uint64_t);
  id v142;
  id v143;
  _BYTE *v144;
  uint64_t *v145;
  _QWORD v146[4];

  v146[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "begin");
  v95 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "operationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assertCurrentQueue");

  -[HAP2AccessoryServer setOutstandingUpdateAccessoriesRequest:](*(_QWORD **)(a1 + 40), 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
  v10 = v9;

  v11 = *(id *)(a1 + 32);
  v12 = (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  objc_msgSend(v6, "domain");

  objc_msgSend(v6, "code");
  -[HAP2AccessoryServer reachability](*(id **)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "kick");

  v14 = *(id **)(a1 + 40);
  if (!v6)
  {
    -[HAP2AccessoryServer _updateConnectionState:withError:](v14, 3uLL, 0);
    v15 = MEMORY[0x1E0C809B0];
    v16 = *(void **)(a1 + 40);
    v94[0] = MEMORY[0x1E0C809B0];
    v94[1] = 3221225472;
    v94[2] = __69__HAP2AccessoryServer_Paired___updateAccessoriesWithActivity_reason___block_invoke_2;
    v94[3] = &unk_1E894D0E8;
    v94[4] = v16;
    v93 = v5;
    v90 = v94;
    if (!v16)
    {
LABEL_72:

      goto LABEL_73;
    }
    objc_msgSend(v16, "operationQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "assertCurrentQueue");

    v18 = (void *)MEMORY[0x1E0CB3940];
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ HandleDiscoveredAccessories"), v20);
    v91 = (void *)objc_claimAutoreleasedReturnValue();

    v92 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28660]), "initWithName:timeout:", CFSTR("Discover Accessories"), 60.0);
    v112 = 0;
    if (v92)
    {
      v21 = objc_alloc(MEMORY[0x1E0D28540]);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = v92;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v134, 1);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v21, "initWithIdentifier:name:parent:assertions:", v22, v91, 0, v23);
      v25 = v112;
      v112 = v24;

    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v26 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v139 = 138412290;
        *(_QWORD *)&v139[4] = v16;
        _os_log_error_impl(&dword_1CCE01000, v26, OS_LOG_TYPE_ERROR, "%@ Failed to create power assertion", v139, 0xCu);
      }
      v27 = objc_alloc(MEMORY[0x1E0D28540]);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (void *)objc_msgSend(v27, "initWithIdentifier:name:parent:options:", v22, v91, 0, 0);
      v23 = v112;
      v112 = v28;
    }

    v110[0] = 0;
    v110[1] = v110;
    v110[2] = 0x2020000000;
    v111 = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v93, "count"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v108[0] = v15;
    v108[1] = 3221225472;
    v108[2] = __82__HAP2AccessoryServer_Paired___handleDiscoveredAccessories_withCompletionHandler___block_invoke;
    v108[3] = &unk_1E894D138;
    v89 = v29;
    v109 = v89;
    objc_msgSend(v93, "enumerateObjectsUsingBlock:", v108);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v93, "count"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HAP2AccessoryServer privateAccessories]((id *)v16);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v107[0] = 0;
    v107[1] = v107;
    v107[2] = 0x2020000000;
    v107[3] = 0;
    v102[0] = v15;
    v102[1] = 3221225472;
    v102[2] = __82__HAP2AccessoryServer_Paired___handleDiscoveredAccessories_withCompletionHandler___block_invoke_2;
    v102[3] = &unk_1E894D160;
    v105 = v107;
    v87 = v31;
    v103 = v87;
    v32 = v30;
    v104 = v32;
    v106 = v110;
    objc_msgSend(v89, "enumerateObjectsUsingBlock:", v102);
    v33 = (void *)objc_msgSend(v32, "copy");
    -[HAP2AccessoryServer setPrivateAccessories:]((uint64_t)v16, v33);

    v96[0] = v15;
    v96[1] = 3221225472;
    v97 = __82__HAP2AccessoryServer_Paired___handleDiscoveredAccessories_withCompletionHandler___block_invoke_3;
    v98 = &unk_1E894D188;
    v100 = v90;
    v101 = v110;
    v99 = v112;
    v88 = v96;
    objc_msgSend(v16, "operationQueue");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "assertCurrentQueue");

    -[HAP2AccessoryServer privateAccessories]((id *)v16);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "count") == 0;

    if (v36)
    {
      -[HAP2AccessoryServer setPairedName:]((uint64_t)v16, 0);
      -[HAP2AccessoryServer setPairedProtocolVersion:]((uint64_t)v16, 0);
      v97((uint64_t)v88);
LABEL_71:

      _Block_object_dispose(v107, 8);
      _Block_object_dispose(v110, 8);
      __HMFActivityScopeLeave();

      goto LABEL_72;
    }
    objc_msgSend(v16, "primaryAccessory");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = 0;
    v121 = &v120;
    v122 = 0x3032000000;
    v123 = __Block_byref_object_copy__19616;
    v124 = __Block_byref_object_dispose__19617;
    v125 = 0;
    v114 = 0;
    v115 = &v114;
    v116 = 0x3032000000;
    v117 = __Block_byref_object_copy__19616;
    v118 = __Block_byref_object_dispose__19617;
    v119 = 0;
    v85 = v37;
    objc_msgSend(v37, "services");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v113[0] = v15;
    v113[1] = 3221225472;
    v113[2] = __71__HAP2AccessoryServer_Paired___handleUpdatedAccessoriesWithCompletion___block_invoke;
    v113[3] = &unk_1E894D1C0;
    v113[4] = &v120;
    v113[5] = &v114;
    objc_msgSend(v38, "enumerateObjectsUsingBlock:", v113);

    v39 = (id)v121[5];
    objc_msgSend(v16, "operationQueue");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "assertCurrentQueue");

    *(_QWORD *)v139 = 0;
    *(_QWORD *)&v139[8] = v139;
    *(_QWORD *)&v139[16] = 0x3032000000;
    v140 = __Block_byref_object_copy__19616;
    v141 = __Block_byref_object_dispose__19617;
    v142 = 0;
    objc_msgSend(v39, "characteristics");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = v15;
    v129 = 3221225472;
    v130 = (uint64_t)__73__HAP2AccessoryServer_Paired___handleUpdatedAccessoryInformationService___block_invoke;
    v131 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E894D1F0;
    v132 = (void (*)(uint64_t))v139;
    objc_msgSend(v41, "enumerateObjectsUsingBlock:", &v128);

    v42 = *(void **)(*(_QWORD *)&v139[8] + 40);
    if (v42)
      -[HAP2AccessoryServer setPairedName:]((uint64_t)v16, v42);
    _Block_object_dispose(v139, 8);

    v43 = (id)v115[5];
    objc_msgSend(v16, "operationQueue");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "assertCurrentQueue");

    *(_QWORD *)v139 = 0;
    *(_QWORD *)&v139[8] = v139;
    *(_QWORD *)&v139[16] = 0x3032000000;
    v140 = __Block_byref_object_copy__19616;
    v141 = __Block_byref_object_dispose__19617;
    v142 = 0;
    objc_msgSend(v43, "characteristics");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = v15;
    v129 = 3221225472;
    v130 = (uint64_t)__72__HAP2AccessoryServer_Paired___handleUpdatedProtocolInformationService___block_invoke;
    v131 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E894D1F0;
    v132 = (void (*)(uint64_t))v139;
    objc_msgSend(v45, "enumerateObjectsUsingBlock:", &v128);

    if (*(_QWORD *)(*(_QWORD *)&v139[8] + 40))
    {
      v46 = objc_alloc(MEMORY[0x1E0D286E0]);
      v47 = (void *)objc_msgSend(v46, "initWithVersionString:", *(_QWORD *)(*(_QWORD *)&v139[8] + 40));
      if (v47)
      {
LABEL_25:
        -[HAP2AccessoryServer setPairedProtocolVersion:]((uint64_t)v16, v47);

        _Block_object_dispose(v139, 8);
        v51 = v88;
        objc_msgSend(v16, "operationQueue");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "assertCurrentQueue");

        objc_msgSend(v16, "operationQueue");
        v53 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v53, "assertCurrentQueue");

        objc_msgSend(v16, "primaryAccessory");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v53) = v54 == 0;

        if ((v53 & 1) == 0)
        {
          v55 = [HAPAccessoryReachabilityProfile alloc];
          objc_msgSend(v16, "primaryAccessory");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "services");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = -[HAPAccessoryReachabilityProfile initWithDiscoveredServices:](v55, "initWithDiscoveredServices:", v57);
          -[HAP2AccessoryServer setReachabilityProfile:]((id *)v16, v58);

          if (hap2LogInitialize_onceToken != -1)
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
          v59 = (void *)hap2Log_accessory;
          if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEBUG))
          {
            v82 = v59;
            -[HAP2AccessoryServer reachabilityProfile]((id *)v16);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v139 = 138412546;
            *(_QWORD *)&v139[4] = v16;
            *(_WORD *)&v139[12] = 2112;
            *(_QWORD *)&v139[14] = v83;
            _os_log_debug_impl(&dword_1CCE01000, v82, OS_LOG_TYPE_DEBUG, "%@ Updated reachability profile: %@", v139, 0x16u);

          }
        }
        v126[0] = v15;
        v126[1] = 3221225472;
        v126[2] = __66__HAP2AccessoryServer_Paired___prepareReachabilityWithCompletion___block_invoke;
        v126[3] = &unk_1E894D498;
        v60 = v51;
        v127 = v60;
        v61 = v126;
        objc_msgSend(v16, "operationQueue");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "assertCurrentQueue");

        *(_QWORD *)buf = v15;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __66__HAP2AccessoryServer_Paired___updateSleepIntervalWithCompletion___block_invoke;
        v136 = &unk_1E894D338;
        v137 = v16;
        v63 = v61;
        v138 = v63;
        v64 = buf;
        objc_msgSend(v16, "operationQueue");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "assertCurrentQueue");

        objc_msgSend(v16, "primaryAccessory");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v65) = v66 == 0;

        if ((_DWORD)v65)
        {
          if (hap2LogInitialize_onceToken != -1)
            dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
          v68 = hap2Log_accessory;
          if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v139 = 138412290;
            *(_QWORD *)&v139[4] = v16;
            _os_log_impl(&dword_1CCE01000, v68, OS_LOG_TYPE_INFO, "%@ No primary accessory yet, using default sleep interval", v139, 0xCu);
          }
          (*(void (**)(_BYTE *, void *))&buf[16])(v64, &unk_1E8989650);
        }
        else
        {
          objc_msgSend(v16, "primaryAccessory");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v67, "conformsToProtocol:", &unk_1EFA4B090))
          {
            objc_msgSend(v16, "primaryAccessory");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v86 = 0;
          }

          v128 = 0;
          v129 = (uint64_t)&v128;
          v130 = 0x3032000000;
          v131 = __Block_byref_object_copy__19616;
          v132 = __Block_byref_object_dispose__19617;
          objc_msgSend(v86, "internalSleepIntervalMs");
          v133 = (id)objc_claimAutoreleasedReturnValue();
          if (*(_QWORD *)(v129 + 40))
          {
            if (hap2LogInitialize_onceToken != -1)
              dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
            v69 = hap2Log_accessory;
            if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
            {
              v70 = *(_QWORD *)(v129 + 40);
              *(_DWORD *)v139 = 138412546;
              *(_QWORD *)&v139[4] = v16;
              *(_WORD *)&v139[12] = 2112;
              *(_QWORD *)&v139[14] = v70;
              _os_log_impl(&dword_1CCE01000, v69, OS_LOG_TYPE_INFO, "%@ Using primary accessory's sleep interval: %@", v139, 0x16u);
            }
            (*(void (**)(_BYTE *, _QWORD))&buf[16])(v64, *(_QWORD *)(v129 + 40));
          }
          else
          {
            -[HAP2AccessoryServer reachabilityProfile]((id *)v16);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "sleepIntervalCharacteristic");
            v84 = (void *)objc_claimAutoreleasedReturnValue();

            if (v84)
            {
              objc_msgSend(v84, "value");
              v72 = (void *)objc_claimAutoreleasedReturnValue();

              if (v72)
              {
                objc_msgSend(v84, "value");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();
                if ((isKindOfClass & 1) != 0)
                {
                  objc_msgSend(v84, "value");
                  v75 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v75 = 0;
                }
                objc_storeStrong((id *)(v129 + 40), v75);
                if ((isKindOfClass & 1) != 0)

                objc_msgSend(v86, "setInternalSleepIntervalMs:", *(_QWORD *)(v129 + 40));
                if (hap2LogInitialize_onceToken != -1)
                  dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
                v80 = hap2Log_accessory;
                if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
                {
                  v81 = *(_QWORD *)(v129 + 40);
                  *(_DWORD *)v139 = 138412546;
                  *(_QWORD *)&v139[4] = v16;
                  *(_WORD *)&v139[12] = 2112;
                  *(_QWORD *)&v139[14] = v81;
                  _os_log_impl(&dword_1CCE01000, v80, OS_LOG_TYPE_INFO, "%@ Using previously cached sleep interval: %@", v139, 0x16u);
                }
                (*(void (**)(_BYTE *, _QWORD))&buf[16])(v64, *(_QWORD *)(v129 + 40));
              }
              else
              {
                if (hap2LogInitialize_onceToken != -1)
                  dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
                v77 = hap2Log_accessory;
                if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v139 = 138412290;
                  *(_QWORD *)&v139[4] = v16;
                  _os_log_impl(&dword_1CCE01000, v77, OS_LOG_TYPE_INFO, "%@ Reading sleep interval from primary accessory", v139, 0xCu);
                }
                v146[0] = v84;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v146, 1);
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                *(_QWORD *)v139 = v15;
                *(_QWORD *)&v139[8] = 3221225472;
                *(_QWORD *)&v139[16] = __54__HAP2AccessoryServer_Paired___getSleepIntervalValue___block_invoke;
                v140 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E894D388;
                v141 = (void (*)(uint64_t))v16;
                v144 = v64;
                v142 = v84;
                v145 = &v128;
                v143 = v86;
                v79 = (id)objc_msgSend(v16, "readValuesForCharacteristics:timeout:completion:", v78, v139, 0.0);

              }
            }
            else
            {
              if (hap2LogInitialize_onceToken != -1)
                dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
              v76 = hap2Log_accessory;
              if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v139 = 138412290;
                *(_QWORD *)&v139[4] = v16;
                _os_log_impl(&dword_1CCE01000, v76, OS_LOG_TYPE_INFO, "%@ No sleep interval characteristic present, using default sleep interval", v139, 0xCu);
              }
              (*(void (**)(_BYTE *, void *))&buf[16])(v64, &unk_1E8989650);
            }

          }
          _Block_object_dispose(&v128, 8);

        }
        _Block_object_dispose(&v114, 8);

        _Block_object_dispose(&v120, 8);
        goto LABEL_71;
      }
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v48 = hap2Log_accessory;
      if (!os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
LABEL_22:
        v50 = hap2Log_accessory;
        if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v16;
          _os_log_impl(&dword_1CCE01000, v50, OS_LOG_TYPE_INFO, "%@ Unable to retrieve paired protocol version", buf, 0xCu);
        }
        v47 = 0;
        goto LABEL_25;
      }
      v49 = *(_QWORD *)(*(_QWORD *)&v139[8] + 40);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v16;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v49;
      _os_log_error_impl(&dword_1CCE01000, v48, OS_LOG_TYPE_ERROR, "%@ Failed to parse protocol version: %@", buf, 0x16u);
    }
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    goto LABEL_22;
  }
  -[HAP2AccessoryServer _handleFailedAccessoryDiscovery:](v14, v6);
LABEL_73:
  __HMFActivityScopeLeave();

}

void __69__HAP2AccessoryServer_Paired___updateAccessoriesWithActivity_reason___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  id *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  void *v11;
  int v12;
  id *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v3 = (void *)hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
    {
      v4 = *(id **)(a1 + 32);
      v5 = v3;
      -[HAP2AccessoryServer privateAccessories](v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");
      -[HAP2AccessoryServer privateAccessories](*(id **)(a1 + 32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");
      v10 = "ies";
      v12 = 138412802;
      v13 = v4;
      if (v9 == 1)
        v10 = "y";
      v14 = 1024;
      v15 = v7;
      v16 = 2080;
      v17 = v10;
      _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_INFO, "%@ Informing delegate of %d updated accessor%s", (uint8_t *)&v12, 0x1Cu);

    }
    -[HAP2AccessoryServer pairedDelegate](*(id *)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v11, "accessoryServerDidUpdateAccessories:", *(_QWORD *)(a1 + 32));

  }
}

void __82__HAP2AccessoryServer_Paired___handleDiscoveredAccessories_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EFA4B090))
    v3 = v4;
  else
    v3 = 0;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __82__HAP2AccessoryServer_Paired___handleDiscoveredAccessories_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  v3 = objc_msgSend(v11, "instanceID");
  while (1)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v4 >= objc_msgSend(*(id *)(a1 + 32), "count"))
      goto LABEL_8;
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "instanceID");

    if (v6 == v3)
      break;
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v7 = objc_claimAutoreleasedReturnValue();
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (!v7)
  {
LABEL_8:
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);
    v8 = 0;
    goto LABEL_9;
  }
  v8 = (void *)v7;
  objc_msgSend(v11, "services");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "updateDiscoveredServices:", v9);

  if (!v10)
    goto LABEL_10;
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
LABEL_9:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
LABEL_10:

}

uint64_t __82__HAP2AccessoryServer_Paired___handleDiscoveredAccessories_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __71__HAP2AccessoryServer_Paired___handleUpdatedAccessoriesWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  id v13;

  v13 = a2;
  objc_msgSend(v13, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("0000003E-0000-1000-8000-0026BB765291"));

  if (v8)
  {
    v9 = a1 + 32;
  }
  else
  {
    objc_msgSend(v13, "type");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("000000A2-0000-1000-8000-0026BB765291"));

    if (!v11)
      goto LABEL_6;
    v9 = a1 + 40;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)v9 + 8) + 40), a2);
LABEL_6:
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (v12)
    LOBYTE(v12) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
  *a4 = v12;

}

uint64_t __66__HAP2AccessoryServer_Paired___prepareReachabilityWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__HAP2AccessoryServer_Paired___updateSleepIntervalWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  _BOOL4 v12;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  void *v20;
  _BYTE v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assertCurrentQueue");

  +[HAPAccessoryReachabilityProfile timeIntervalFromMillisecondNumberValue:](HAPAccessoryReachabilityProfile, "timeIntervalFromMillisecondNumberValue:", v4);
  v7 = v6;

  -[HAP2AccessoryServer reachabilityProfile](*(id **)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSleepInterval:", v7);

  -[HAP2AccessoryServer reachabilityProfile](*(id **)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2AccessoryServer reachability](*(id **)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProfile:", v9);

  v11 = v7 * 1.1;
  v12 = fabs(v11) >= 2.22044605e-16 && v11 > 0.0;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v13 = hap2Log_accessory;
  v14 = os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v14)
    {
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v22 = 138412546;
      *(_QWORD *)&v22[4] = v15;
      *(_WORD *)&v22[12] = 2048;
      *(double *)&v22[14] = v11;
      v16 = "%@ Updating maximum request timeout to %f seconds";
      v17 = v13;
      v18 = 22;
LABEL_11:
      _os_log_impl(&dword_1CCE01000, v17, OS_LOG_TYPE_INFO, v16, v22, v18);
    }
  }
  else if (v14)
  {
    v19 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v22 = 138412290;
    *(_QWORD *)&v22[4] = v19;
    v16 = "%@ Using default maximum request timeout";
    v17 = v13;
    v18 = 12;
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 32), "controller", *(_OWORD *)v22, *(_QWORD *)&v22[16], v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "updateMaxRequestTimeout:", v11);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __54__HAP2AccessoryServer_Paired___getSleepIntervalValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  _BYTE *v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[24];
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "operationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assertCurrentQueue");

  if (v6)
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v8 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)v27 = 138412546;
      *(_QWORD *)&v27[4] = v16;
      *(_WORD *)&v27[12] = 2112;
      *(_QWORD *)&v27[14] = v6;
      _os_log_error_impl(&dword_1CCE01000, v8, OS_LOG_TYPE_ERROR, "%@ Failed to read sleep interval, using default sleep interval: %@", v27, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    *(_QWORD *)v27 = 0;
    *(_QWORD *)&v27[8] = v27;
    *(_QWORD *)&v27[16] = 0x3032000000;
    v28 = __Block_byref_object_copy__19616;
    v29 = __Block_byref_object_dispose__19617;
    v30 = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __54__HAP2AccessoryServer_Paired___getSleepIntervalValue___block_invoke_214;
    v19[3] = &unk_1E894D360;
    v20 = *(id *)(a1 + 40);
    v21 = v27;
    v22 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v19);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v9 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        *(_DWORD *)buf = 138412546;
        v24 = v10;
        v25 = 2112;
        v26 = v11;
        _os_log_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_INFO, "%@ Read sleep interval from primary accessory: %@", buf, 0x16u);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 2 * objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "unsignedIntegerValue"));
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;

      objc_msgSend(*(id *)(a1 + 48), "setInternalSleepIntervalMs:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v15 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        v17 = *(_QWORD *)(a1 + 32);
        v18 = *(_QWORD *)(*(_QWORD *)&v27[8] + 40);
        *(_DWORD *)buf = 138412546;
        v24 = v17;
        v25 = 2112;
        v26 = v18;
        _os_log_error_impl(&dword_1CCE01000, v15, OS_LOG_TYPE_ERROR, "%@ Failed to read sleep interval, using default sleep interval: %@", buf, 0x16u);
      }
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

    _Block_object_dispose(v27, 8);
  }

}

void __54__HAP2AccessoryServer_Paired___getSleepIntervalValue___block_invoke_214(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char isKindOfClass;
  void *v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "characteristic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  v10 = v18;
  if (v9)
  {
    objc_msgSend(v18, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v18, "error");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v12;
    }
    else
    {
      objc_msgSend(v18, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_5;
      objc_msgSend(v18, "value");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v18, "value");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v17);
      if ((isKindOfClass & 1) != 0)

    }
LABEL_5:
    *a4 = 1;
    v10 = v18;
  }

}

void __72__HAP2AccessoryServer_Paired___handleUpdatedProtocolInformationService___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("00000037-0000-1000-8000-0026BB765291"));

  v8 = v12;
  if (v7)
  {
    objc_msgSend(v12, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v12, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v11);
    if ((isKindOfClass & 1) != 0)

    *a4 = 1;
    v8 = v12;
  }

}

void __73__HAP2AccessoryServer_Paired___handleUpdatedAccessoryInformationService___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("00000023-0000-1000-8000-0026BB765291"));

  v8 = v12;
  if (v7)
  {
    objc_msgSend(v12, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v12, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v11);
    if ((isKindOfClass & 1) != 0)

    *a4 = 1;
    v8 = v12;
  }

}

id __57__HAP2AccessoryServer_Paired__getPairingsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listPairingsWithCompletion:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

HAP2CancelableObject *__56__HAP2AccessoryServer_Paired__removePairing_completion___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  HAP2CancelableObject *v4;
  void *v5;
  HAP2CancelableObject *v6;
  void *v7;
  HAP2CancelableObject *v8;
  NSObject *v9;
  void (**v10)(id, void *);
  void *v11;
  _QWORD v13[4];
  HAP2CancelableObject *v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "browser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc_init(HAP2CancelableObject);
    objc_msgSend(WeakRetained, "deviceID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__HAP2AccessoryServer_Paired__removePairing_completion___block_invoke_81;
    v13[3] = &unk_1E894CF08;
    v6 = v4;
    v14 = v6;
    v17 = a1[5];
    v15 = WeakRetained;
    v16 = a1[4];
    objc_msgSend(v3, "retrieveLocalPairingIdentityForDeviceID:completion:", v5, v13);

    v7 = v16;
    v8 = v6;

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v9 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = WeakRetained;
      _os_log_error_impl(&dword_1CCE01000, v9, OS_LOG_TYPE_ERROR, "%@ Unable to get the accessory server browser", buf, 0xCu);
    }
    v10 = (void (**)(id, void *))a1[5];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v11);

    +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
    v8 = (HAP2CancelableObject *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

void __56__HAP2AccessoryServer_Paired__removePairing_completion___block_invoke_81(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  id v22;
  char v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "cancelError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    if (v5)
    {
      objc_msgSend(v5, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[6], "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

    }
    else
    {
      if (hap2LogInitialize_onceToken != -1)
        dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
      v11 = hap2Log_accessory;
      if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
      {
        v15 = a1[5];
        *(_DWORD *)buf = 138412546;
        v25 = v15;
        v26 = 2112;
        v27 = v6;
        _os_log_error_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%@ Unable to lookup local pairing identity: %@", buf, 0x16u);
      }
      v10 = 0;
    }
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __56__HAP2AccessoryServer_Paired__removePairing_completion___block_invoke_82;
    v19 = &unk_1E894CF58;
    v12 = a1[6];
    v20 = a1[5];
    v21 = v12;
    v23 = v10;
    v22 = a1[7];
    v13 = (void *)MEMORY[0x1D17B7400](&v16);
    objc_msgSend(a1[5], "operationQueue", v16, v17, v18, v19, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addBlock:", v13);

  }
}

void __56__HAP2AccessoryServer_Paired__removePairing_completion___block_invoke_82(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "controller");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (id)objc_msgSend(v3, "removePairing:cleanupLocalData:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

id __53__HAP2AccessoryServer_Paired__addPairing_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addPairing:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

HAP2CancelableObject *__52__HAP2AccessoryServer_Paired__unpairWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  HAP2CancelableObject *v3;
  void *v4;
  HAP2CancelableObject *v5;
  id v6;
  uint64_t v7;
  id v8;
  HAP2CancelableObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[4];
  HAP2CancelableObject *v16;
  uint64_t v17;
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "browser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc_init(HAP2CancelableObject);
    objc_msgSend(*(id *)(a1 + 32), "deviceID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __52__HAP2AccessoryServer_Paired__unpairWithCompletion___block_invoke_76;
    v15[3] = &unk_1E894CF08;
    v5 = v3;
    v16 = v5;
    v6 = *(id *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 32);
    v19 = v6;
    v17 = v7;
    v18 = v2;
    objc_msgSend(v18, "retrieveLocalPairingIdentityForDeviceID:completion:", v4, v15);

    v8 = v18;
    v9 = v5;

  }
  else
  {
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v10 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v21 = v14;
      _os_log_error_impl(&dword_1CCE01000, v10, OS_LOG_TYPE_ERROR, "%@ Unable to get the accessory server browser", buf, 0xCu);
    }
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v12);

    +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
    v9 = (HAP2CancelableObject *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

void __52__HAP2AccessoryServer_Paired__unpairWithCompletion___block_invoke_76(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (*v8)(void);
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "cancelError");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void (*)(void))*((_QWORD *)a1[7] + 2);
  }
  else
  {
    if (v5)
    {
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __52__HAP2AccessoryServer_Paired__unpairWithCompletion___block_invoke_77;
      v16 = &unk_1E894D6D0;
      v17 = a1[5];
      v18 = v5;
      v19 = a1[6];
      v20 = a1[7];
      v9 = (void *)MEMORY[0x1D17B7400](&v13);
      objc_msgSend(a1[5], "operationQueue", v13, v14, v15, v16, v17);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addBlock:", v9);

      goto LABEL_6;
    }
    if (hap2LogInitialize_onceToken != -1)
      dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
    v11 = hap2Log_accessory;
    if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_ERROR))
    {
      v12 = a1[5];
      *(_DWORD *)buf = 138412546;
      v22 = v12;
      v23 = 2112;
      v24 = v6;
      _os_log_error_impl(&dword_1CCE01000, v11, OS_LOG_TYPE_ERROR, "%@ Unable to get the local pairing identity: %@", buf, 0x16u);
    }
    v8 = (void (*)(void))*((_QWORD *)a1[7] + 2);
  }
  v8();
LABEL_6:

}

void __52__HAP2AccessoryServer_Paired__unpairWithCompletion___block_invoke_77(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[5];
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "controller");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__HAP2AccessoryServer_Paired__unpairWithCompletion___block_invoke_2;
  v5[3] = &unk_1E894D810;
  v3 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v4 = (id)objc_msgSend(v2, "removePairing:cleanupLocalData:completion:", v3, 1, v5);

}

void __52__HAP2AccessoryServer_Paired__unpairWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v4 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 138412546;
    v9 = v5;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_1CCE01000, v4, OS_LOG_TYPE_INFO, "%@ Remove pairing completed with error: %@", (uint8_t *)&v8, 0x16u);
  }
  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "deviceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removePublicKeyForAccessoryWithID:completion:", v7, *(_QWORD *)(a1 + 48));

}

- (id)pairWithDelegate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  id v11;
  id v12;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D28540], "currentActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__HAP2AccessoryServer_Unpaired__pairWithDelegate___block_invoke;
  v10[3] = &unk_1E894DBD0;
  v10[4] = self;
  v11 = v4;
  v12 = v5;
  v6 = v5;
  v7 = v4;
  -[HAP2AccessoryServer _delegateCancelableFor:](self, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)identifyWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__HAP2AccessoryServer_Unpaired__identifyWithCompletion___block_invoke;
  v8[3] = &unk_1E894DBF8;
  objc_copyWeak(&v10, &location);
  v5 = v4;
  v9 = v5;
  -[HAP2AccessoryServer _delegateCancelableFor:](self, v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

  return v6;
}

- (void)becomePairedWithAccessoryServer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  HAP2AccessoryServer *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (hap2LogInitialize_onceToken != -1)
    dispatch_once(&hap2LogInitialize_onceToken, &__block_literal_global_1783);
  v5 = hap2Log_accessory;
  if (os_log_type_enabled((os_log_t)hap2Log_accessory, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = self;
    _os_log_impl(&dword_1CCE01000, v5, OS_LOG_TYPE_DEFAULT, "%@ Accessory is now paired", buf, 0xCu);
  }
  -[HAP2AccessoryServer setInternallyPaired:]((uint64_t)self, 1);
  -[HAP2AccessoryServer setInternalPairingDriver:]((uint64_t)self, 0);
  objc_initWeak((id *)buf, self);
  -[HAP2AccessoryServer operationQueue](self, "operationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__HAP2AccessoryServer_Unpaired__becomePairedWithAccessoryServer___block_invoke;
  v8[3] = &unk_1E894DF38;
  objc_copyWeak(&v10, (id *)buf);
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "addBlock:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);

}

- (void)mergeWithNewlyDiscoveredUnpairedAccessoryServer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServer operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__HAP2AccessoryServer_Unpaired__mergeWithNewlyDiscoveredUnpairedAccessoryServer___block_invoke;
  v7[3] = &unk_1E894DF38;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "addBlock:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)pairingDriver:(id)a3 didCompleteWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServer operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __68__HAP2AccessoryServer_Unpaired__pairingDriver_didCompleteWithError___block_invoke;
  v10[3] = &unk_1E894DF38;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "addBlock:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)pairingDriver:(id)a3 didRejectSetupCodeForAccessory:(id)a4 backoffInterval:(double)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17[2];
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServer operationQueue](self, "operationQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __105__HAP2AccessoryServer_Unpaired__pairingDriver_didRejectSetupCodeForAccessory_backoffInterval_completion___block_invoke;
  v15[3] = &unk_1E894DC20;
  objc_copyWeak(v17, &location);
  v17[1] = *(id *)&a5;
  v14 = v12;
  v16 = v14;
  objc_msgSend(v13, "addBlock:", v15);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

}

- (void)pairingDriver:(id)a3 didRequestLocalPairingIdentityWithCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServer operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __92__HAP2AccessoryServer_Unpaired__pairingDriver_didRequestLocalPairingIdentityWithCompletion___block_invoke;
  v10[3] = &unk_1E894E028;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "addBlock:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)pairingDriver:(id)a3 didSaveRemotePairingIdentity:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServer operationQueue](self, "operationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __87__HAP2AccessoryServer_Unpaired__pairingDriver_didSaveRemotePairingIdentity_completion___block_invoke;
  v14[3] = &unk_1E894DC48;
  objc_copyWeak(&v17, &location);
  v12 = v10;
  v16 = v12;
  v13 = v9;
  v15 = v13;
  objc_msgSend(v11, "addBlock:", v14);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)pairingDriver:(id)a3 doesRequirePermission:(unint64_t)a4 accessory:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17[2];
  id location;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServer operationQueue](self, "operationQueue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__HAP2AccessoryServer_Unpaired__pairingDriver_doesRequirePermission_accessory_completion___block_invoke;
  v15[3] = &unk_1E894DC20;
  objc_copyWeak(v17, &location);
  v17[1] = (id)a4;
  v14 = v12;
  v16 = v14;
  objc_msgSend(v13, "addBlock:", v15);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);

}

- (void)pairingDriver:(id)a3 doesRequireSetupCodeForAccessory:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServer operationQueue](self, "operationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__HAP2AccessoryServer_Unpaired__pairingDriver_doesRequireSetupCodeForAccessory_completion___block_invoke;
  v13[3] = &unk_1E894E028;
  objc_copyWeak(&v15, &location);
  v12 = v10;
  v14 = v12;
  objc_msgSend(v11, "addBlock:", v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)pairingDriver:(id)a3 authenticateSoftwareAuthUUID:(id)a4 token:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServer operationQueue](self, "operationQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __93__HAP2AccessoryServer_Unpaired__pairingDriver_authenticateSoftwareAuthUUID_token_completion___block_invoke;
  v18[3] = &unk_1E894DC70;
  objc_copyWeak(&v22, &location);
  v15 = v11;
  v19 = v15;
  v16 = v12;
  v20 = v16;
  v17 = v13;
  v21 = v17;
  objc_msgSend(v14, "addBlock:", v18);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)pairingDriver:(id)a3 confirmSoftwareAuthUUID:(id)a4 token:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServer operationQueue](self, "operationQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __88__HAP2AccessoryServer_Unpaired__pairingDriver_confirmSoftwareAuthUUID_token_completion___block_invoke;
  v18[3] = &unk_1E894DC70;
  objc_copyWeak(&v22, &location);
  v15 = v11;
  v19 = v15;
  v16 = v12;
  v20 = v16;
  v17 = v13;
  v21 = v17;
  objc_msgSend(v14, "addBlock:", v18);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)pairingDriver:(id)a3 didFinishAuthWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServer operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__HAP2AccessoryServer_Unpaired__pairingDriver_didFinishAuthWithError___block_invoke;
  v10[3] = &unk_1E894DF38;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "addBlock:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)pairingDriver:(id)a3 validatePairingCert:(id)a4 model:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServer operationQueue](self, "operationQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __84__HAP2AccessoryServer_Unpaired__pairingDriver_validatePairingCert_model_completion___block_invoke;
  v18[3] = &unk_1E894DC70;
  objc_copyWeak(&v22, &location);
  v15 = v11;
  v19 = v15;
  v16 = v12;
  v20 = v16;
  v17 = v13;
  v21 = v17;
  objc_msgSend(v14, "addBlock:", v18);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)pairingDriver:(id)a3 validateSoftwareAuthUUID:(id)a4 token:(id)a5 model:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id location;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_initWeak(&location, self);
  -[HAP2AccessoryServer operationQueue](self, "operationQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __95__HAP2AccessoryServer_Unpaired__pairingDriver_validateSoftwareAuthUUID_token_model_completion___block_invoke;
  v22[3] = &unk_1E894DC98;
  objc_copyWeak(&v27, &location);
  v18 = v13;
  v23 = v18;
  v19 = v14;
  v24 = v19;
  v20 = v15;
  v25 = v20;
  v21 = v16;
  v26 = v21;
  objc_msgSend(v17, "addBlock:", v22);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);

}

void __95__HAP2AccessoryServer_Unpaired__pairingDriver_validateSoftwareAuthUUID_token_model_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  -[HAP2AccessoryServer pairDelegate](WeakRetained);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "accessoryServer:validateSoftwareAuthUUID:token:model:completion:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __84__HAP2AccessoryServer_Unpaired__pairingDriver_validatePairingCert_model_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  -[HAP2AccessoryServer pairDelegate](WeakRetained);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "accessoryServer:validatePairingCert:model:completion:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __70__HAP2AccessoryServer_Unpaired__pairingDriver_didFinishAuthWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  -[HAP2AccessoryServer pairDelegate](WeakRetained);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "accessoryServer:didFinishAuthWithError:", WeakRetained, *(_QWORD *)(a1 + 32));

}

void __88__HAP2AccessoryServer_Unpaired__pairingDriver_confirmSoftwareAuthUUID_token_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  -[HAP2AccessoryServer pairDelegate](WeakRetained);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "accessoryServer:confirmSoftwareAuthUUID:token:completion:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __93__HAP2AccessoryServer_Unpaired__pairingDriver_authenticateSoftwareAuthUUID_token_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  -[HAP2AccessoryServer pairDelegate](WeakRetained);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "accessoryServer:authenticateSoftwareAuthUUID:token:completion:", WeakRetained, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __91__HAP2AccessoryServer_Unpaired__pairingDriver_doesRequireSetupCodeForAccessory_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  -[HAP2AccessoryServer pairDelegate](WeakRetained);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "accessoryServer:doesRequireSetupCodeWithCompletion:", WeakRetained, *(_QWORD *)(a1 + 32));

}

void __90__HAP2AccessoryServer_Unpaired__pairingDriver_doesRequirePermission_accessory_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  -[HAP2AccessoryServer pairDelegate](WeakRetained);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "accessoryServer:doesRequirePermission:completion:", WeakRetained, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

void __87__HAP2AccessoryServer_Unpaired__pairingDriver_didSaveRemotePairingIdentity_completion___block_invoke(uint64_t a1)
{
  void *v2;
  HAPDeviceID *v3;
  void *v4;
  HAPDeviceID *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "browser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = [HAPDeviceID alloc];
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[HAPDeviceID initWithDeviceIDString:](v3, "initWithDeviceIDString:", v4);

    objc_msgSend(*(id *)(a1 + 32), "publicKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "data");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v2, "savePublicKey:forAccessoryWithID:completion:", v7, v5, *(_QWORD *)(a1 + 40));
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(WeakRetained, "delegate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EFA452F0))
        {
          objc_msgSend(WeakRetained, "delegate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
    objc_msgSend(v10, "associateAccessoryWithControllerKeyUsingAccessoryPublicKey:", v7);

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 6);
    v5 = (HAPDeviceID *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, HAPDeviceID *))(v11 + 16))(v11, v5);
  }

}

void __92__HAP2AccessoryServer_Unpaired__pairingDriver_didRequestLocalPairingIdentityWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "browser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pairingRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pairingIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      (*(void (**)(_QWORD, void *, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v5, 0);
    }
    else
    {
      objc_msgSend(WeakRetained, "deviceID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "retrieveLocalPairingIdentityForDeviceID:completion:", v7, *(_QWORD *)(a1 + 32));

      v5 = 0;
    }
  }
  else
  {
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v5);
  }

}

void __105__HAP2AccessoryServer_Unpaired__pairingDriver_didRejectSetupCodeForAccessory_backoffInterval_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  -[HAP2AccessoryServer pairDelegate](WeakRetained);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "accessoryServer:didRejectSetupCodeWithBackoffInterval:completion:", WeakRetained, *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));

}

void __68__HAP2AccessoryServer_Unpaired__pairingDriver_didCompleteWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  -[HAP2AccessoryServer pairDelegate](WeakRetained);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "accessoryServer:didCompleteWithError:", WeakRetained, *(_QWORD *)(a1 + 32));
    -[HAP2AccessoryServer setPairDelegate:](WeakRetained, 0);
  }

}

void __81__HAP2AccessoryServer_Unpaired__mergeWithNewlyDiscoveredUnpairedAccessoryServer___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  -[HAP2AccessoryServer _updateServerMetadata:controller:](WeakRetained, *(void **)(a1 + 32), 0);

}

void __65__HAP2AccessoryServer_Unpaired__becomePairedWithAccessoryServer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HAP2AccessoryServer _updateServerMetadata:controller:](WeakRetained, v2, v3);

}

id __56__HAP2AccessoryServer_Unpaired__identifyWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (-[HAP2AccessoryServer isInternallyPaired]((uint64_t)WeakRetained))
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 18);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

    +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(WeakRetained, "controller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unpairedIdentifyWithCompletion:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

id __50__HAP2AccessoryServer_Unpaired__pairWithDelegate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v13;
  id v14;

  -[HAP2AccessoryServer pairDelegate](*(id **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v5 = a1 + 32;
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v5 + 8);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessoryServer:didCompleteWithError:", v3, v6);

  }
  else
  {
    v7 = -[HAP2AccessoryServer isInternallyPaired](*(_QWORD *)(a1 + 32));
    v9 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(a1 + 40);
    if (!v7)
    {
      -[HAP2AccessoryServer setPairDelegate:](*(_QWORD **)(a1 + 32), *(void **)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 48), "begin");
      v14 = *(id *)(a1 + 48);
      -[HAP2AccessoryServer internalPairingDriver](*(id **)(a1 + 32));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pairAccessory:delegate:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 32));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      __HMFActivityScopeLeave();
      return v11;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hapErrorWithCode:", 18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessoryServer:didCompleteWithError:", v9, v10);

  }
  +[HAP2Cancelable ignore](HAP2Cancelable, "ignore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  return v11;
}

@end
