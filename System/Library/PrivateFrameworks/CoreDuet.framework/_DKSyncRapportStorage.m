@implementation _DKSyncRapportStorage

- (_DKSyncRapportStorage)init
{
  _DKSyncRapportStorage *v2;
  uint64_t v3;
  _DKSyncRapportCommonStorage *commonStorage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DKSyncRapportStorage;
  v2 = -[_DKSyncRapportStorage init](&v6, sel_init);
  if (v2)
  {
    +[_DKSyncRapportCommonStorage sharedInstance](_DKSyncRapportCommonStorage, "sharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    commonStorage = v2->_commonStorage;
    v2->_commonStorage = (_DKSyncRapportCommonStorage *)v3;

  }
  return v2;
}

- (BOOL)isAvailable
{
  return -[_DKSyncRapportCommonStorage isAvailable](self->_commonStorage, "isAvailable");
}

- (void)registerRequestIDsWithClient:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Should not be called"), 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v4);
}

- (void)cancelOutstandingOperations
{
  -[_DKSyncRapportCommonStorage cancelOutstandingOperations](self->_commonStorage, "cancelOutstandingOperations");
}

- (id)name
{
  return -[_DKSyncRapportCommonStorage name](self->_commonStorage, "name");
}

- (void)start
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_1(&dword_18DDBE000, a2, v4, "%{public}@: Unable to register request ids with Rapport", v5);

  OUTLINED_FUNCTION_1();
}

- (void)fetchSourceDeviceIDFromPeer:(id)a3 highPriority:(BOOL)a4 completion:(id)a5
{
  -[_DKSyncRapportCommonStorage fetchSourceDeviceIDFromPeer:highPriority:completion:](self->_commonStorage, "fetchSourceDeviceIDFromPeer:highPriority:completion:", a3, a4, a5);
}

- (int64_t)transportType
{
  return -[_DKSyncRapportCommonStorage transportType](self->_commonStorage, "transportType");
}

- (id)myDeviceID
{
  return -[_DKSyncRapportCommonStorage myDeviceID](self->_commonStorage, "myDeviceID");
}

- (void)setDeviceID:(id)a3
{
  -[_DKSyncRapportCommonStorage setDeviceID:](self->_commonStorage, "setDeviceID:", a3);
}

- (id)client
{
  return -[_DKSyncRapportCommonStorage client](self->_commonStorage, "client");
}

- (BOOL)isTransportActiveForPeer:(id)a3
{
  return -[_DKSyncRapportCommonStorage isTransportActiveForPeer:](self->_commonStorage, "isTransportActiveForPeer:", a3);
}

- (void)handleAvailabilityFailureWithPeer:(id)a3 completion:(id)a4
{
  -[_DKSyncRapportCommonStorage handleAvailabilityFailureWithPeer:completion:](self->_commonStorage, "handleAvailabilityFailureWithPeer:completion:", a3, a4);
}

- (id)transformResponseError:(id)a3
{
  return -[_DKSyncRapportCommonStorage transformResponseError:](self->_commonStorage, "transformResponseError:", a3);
}

- (id)transformCaughtObject:(id)a3 existingError:(id)a4
{
  return -[_DKSyncRapportCommonStorage transformCaughtObject:existingError:](self->_commonStorage, "transformCaughtObject:existingError:", a3, a4);
}

- (void)handshakeWithDuetSyncPeer:(id)a3 orError:(id)a4
{
  -[_DKSyncRapportCommonStorage handshakeWithDuetSyncPeer:orError:](self->_commonStorage, "handshakeWithDuetSyncPeer:orError:", a3, 0);
}

- (void)sendRequestID:(id)a3 request:(id)a4 peer:(id)a5 highPriority:(BOOL)a6 options:(id)a7 responseHandler:(id)a8
{
  -[_DKSyncRapportCommonStorage sendRequestID:request:peer:highPriority:options:responseHandler:](self->_commonStorage, "sendRequestID:request:peer:highPriority:options:responseHandler:", a3, a4, a5, a6, a7, a8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commonStorage, 0);
}

@end
