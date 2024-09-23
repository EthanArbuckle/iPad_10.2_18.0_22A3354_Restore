@implementation INExtensionContext

- (void)encodeWithCoder:(id)a3
{
  NSString *recordRoute;
  id v5;

  recordRoute = self->_recordRoute;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", recordRoute, CFSTR("_recordRoute"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordDeviceUID, CFSTR("_recordDeviceUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordDeviceIdentifier, CFSTR("_recordDeviceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_airPlayRouteIdentifiers, CFSTR("_airPlayRouteIdentifiers"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_audioSessionID, CFSTR("_audioSessionID"));

}

- (INExtensionContext)initWithCoder:(id)a3
{
  id v4;
  INExtensionContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)INExtensionContext;
  v5 = -[INExtensionContext init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_recordRoute"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[INExtensionContext _setRecordRoute:](v5, "_setRecordRoute:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_recordDeviceUID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[INExtensionContext _setRecordDeviceUID:](v5, "_setRecordDeviceUID:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_recordDeviceIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[INExtensionContext _setRecordDeviceIdentifier:](v5, "_setRecordDeviceIdentifier:", v8);

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("_airPlayRouteIdentifiers"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[INExtensionContext _setAirPlayRouteIdentifiers:](v5, "_setAirPlayRouteIdentifiers:", v12);

    -[INExtensionContext _setAudioSessionID:](v5, "_setAudioSessionID:", objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_audioSessionID")));
  }

  return v5;
}

- (NSString)_recordRoute
{
  return self->_recordRoute;
}

- (void)_setRecordRoute:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSUUID)_recordDeviceUID
{
  return self->_recordDeviceUID;
}

- (void)_setRecordDeviceUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)_recordDeviceIdentifier
{
  return self->_recordDeviceIdentifier;
}

- (void)_setRecordDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)_airPlayRouteIdentifiers
{
  return self->_airPlayRouteIdentifiers;
}

- (void)_setAirPlayRouteIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unsigned)_audioSessionID
{
  return self->_audioSessionID;
}

- (void)_setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airPlayRouteIdentifiers, 0);
  objc_storeStrong((id *)&self->_recordDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_recordDeviceUID, 0);
  objc_storeStrong((id *)&self->_recordRoute, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

uint64_t __54___INExtensionContext_handleIntent_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3, a5);
  return result;
}

uint64_t __47___INExtensionContext_handleIntent_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __64___INExtensionContext_confirmationResponseForIntent_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __84___INExtensionContext_cancelTransactionDueToTimeoutWithIntentIdentifier_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelTransactionDueToTimeoutWithIntentIdentifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __74___INExtensionContext_completeTransactionWithIntentIdentifier_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeTransactionWithIntentIdentifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __71___INExtensionContext_beginTransactionWithIntentIdentifier_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginTransactionWithIntentIdentifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

@end
