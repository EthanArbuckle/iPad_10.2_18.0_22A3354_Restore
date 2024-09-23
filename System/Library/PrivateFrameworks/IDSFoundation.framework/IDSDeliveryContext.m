@implementation IDSDeliveryContext

+ (int64_t)_endpointStateForServerDeliveryStatus:(id)a3
{
  double v3;

  if (!a3)
    return 2;
  if (objc_msgSend_isEqualToNumber_(a3, a2, (uint64_t)&unk_1E3C86898, v3))
    return 3;
  return 0;
}

- (IDSDeliveryContext)initWithServerResponseDictionary:(id)a3
{
  id v4;
  const char *v5;
  IDSDeliveryContext *v6;
  double v7;
  uint64_t v8;
  NSNumber *responseCommand;
  const char *v10;
  double v11;
  uint64_t v12;
  NSNumber *responseTimeStamp;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  double v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  uint64_t v25;
  IDSPushToken *responseToken;
  void *v27;
  void *v28;
  const char *v29;
  double v30;
  void *v31;
  const char *v32;
  double v33;
  uint64_t v34;
  const char *v35;
  double v36;
  uint64_t v37;
  NSNumber *endpointState;
  const char *v39;
  double v40;
  uint64_t v41;
  NSNumber *failureReason;
  objc_super v44;

  v4 = a3;
  v44.receiver = self;
  v44.super_class = (Class)IDSDeliveryContext;
  v6 = -[IDSDeliveryContext init](&v44, sel_init);
  if (v6)
  {
    objc_msgSend__numberForKey_(v4, v5, (uint64_t)CFSTR("c"), v7);
    v8 = objc_claimAutoreleasedReturnValue();
    responseCommand = v6->_responseCommand;
    v6->_responseCommand = (NSNumber *)v8;

    objc_msgSend__numberForKey_(v4, v10, (uint64_t)CFSTR("e"), v11);
    v12 = objc_claimAutoreleasedReturnValue();
    responseTimeStamp = v6->_responseTimeStamp;
    v6->_responseTimeStamp = (NSNumber *)v12;

    objc_msgSend__numberForKey_(v4, v14, (uint64_t)CFSTR("s"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_responseCode = objc_msgSend_integerValue(v16, v17, v18, v19);

    objc_msgSend__dataForKey_(v4, v20, (uint64_t)CFSTR("t"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_pushTokenWithData_(IDSPushToken, v23, (uint64_t)v22, v24);
    v25 = objc_claimAutoreleasedReturnValue();
    responseToken = v6->_responseToken;
    v6->_responseToken = (IDSPushToken *)v25;

    v27 = (void *)MEMORY[0x1E0CB37E8];
    v28 = (void *)objc_opt_class();
    objc_msgSend__numberForKey_(v4, v29, (uint64_t)CFSTR("O"), v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend__endpointStateForServerDeliveryStatus_(v28, v32, (uint64_t)v31, v33);
    objc_msgSend_numberWithInteger_(v27, v35, v34, v36);
    v37 = objc_claimAutoreleasedReturnValue();
    endpointState = v6->_endpointState;
    v6->_endpointState = (NSNumber *)v37;

    objc_msgSend__numberForKey_(v4, v39, (uint64_t)CFSTR("fR"), v40);
    v41 = objc_claimAutoreleasedReturnValue();
    failureReason = v6->_failureReason;
    v6->_failureReason = (NSNumber *)v41;

  }
  return v6;
}

- (IDSDeliveryContext)initWithError:(id)a3
{
  id v5;
  IDSDeliveryContext *v6;
  IDSDeliveryContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IDSDeliveryContext;
  v6 = -[IDSDeliveryContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_responseError, a3);

  return v7;
}

- (IDSDeliveryContext)initWithResponseCode:(int64_t)a3 error:(id)a4 lastCall:(BOOL)a5
{
  id v9;
  IDSDeliveryContext *v10;
  IDSDeliveryContext *v11;
  NSNumber *endpointState;
  objc_super v14;

  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)IDSDeliveryContext;
  v10 = -[IDSDeliveryContext init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_idsResponseCode = a3;
    objc_storeStrong((id *)&v10->_responseError, a4);
    v11->_lastCall = a5;
    endpointState = v11->_endpointState;
    v11->_endpointState = (NSNumber *)&unk_1E3C868B0;

  }
  return v11;
}

- (IDSDeliveryContext)initWithResponseCode:(int64_t)a3 deviceID:(id)a4
{
  id v7;
  IDSDeliveryContext *v8;
  IDSDeliveryContext *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)IDSDeliveryContext;
  v8 = -[IDSDeliveryContext init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_idsResponseCode = a3;
    objc_storeStrong((id *)&v8->_deviceID, a4);
  }

  return v9;
}

- (IDSDeliveryContext)initWithResponseCode:(int64_t)a3 deviceID:(id)a4 currentAverageRTT:(id)a5 isDeviceBlackedOut:(id)a6 localMessageState:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  IDSDeliveryContext *v17;
  IDSDeliveryContext *v18;
  NSNumber *endpointState;
  objc_super v21;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)IDSDeliveryContext;
  v17 = -[IDSDeliveryContext init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_idsResponseCode = a3;
    objc_storeStrong((id *)&v17->_deviceID, a4);
    objc_storeStrong((id *)&v18->_currentAverageRTT, a5);
    objc_storeStrong((id *)&v18->_isDeviceBlackedOut, a6);
    objc_storeStrong((id *)&v18->_localMessageState, a7);
    endpointState = v18->_endpointState;
    v18->_endpointState = (NSNumber *)&unk_1E3C868B0;

  }
  return v18;
}

- (NSNumber)responseCommand
{
  return self->_responseCommand;
}

- (void)setResponseCommand:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)responseTimeStamp
{
  return self->_responseTimeStamp;
}

- (void)setResponseTimeStamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)responseCode
{
  return self->_responseCode;
}

- (void)setResponseCode:(int64_t)a3
{
  self->_responseCode = a3;
}

- (NSError)responseError
{
  return self->_responseError;
}

- (void)setResponseError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (IDSPushToken)responseToken
{
  return self->_responseToken;
}

- (void)setResponseToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSError)deliveryError
{
  return self->_deliveryError;
}

- (void)setDeliveryError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)failureReason
{
  return self->_failureReason;
}

- (void)setFailureReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSArray)displayURIs
{
  return self->_displayURIs;
}

- (void)setDisplayURIs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)idsResponseCode
{
  return self->_idsResponseCode;
}

- (void)setIdsResponseCode:(int64_t)a3
{
  self->_idsResponseCode = a3;
}

- (BOOL)lastCall
{
  return self->_lastCall;
}

- (void)setLastCall:(BOOL)a3
{
  self->_lastCall = a3;
}

- (BOOL)lastCourierAck
{
  return self->_lastCourierAck;
}

- (void)setLastCourierAck:(BOOL)a3
{
  self->_lastCourierAck = a3;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (void)setDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSNumber)currentAverageRTT
{
  return self->_currentAverageRTT;
}

- (void)setCurrentAverageRTT:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)isDeviceBlackedOut
{
  return self->_isDeviceBlackedOut;
}

- (void)setIsDeviceBlackedOut:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSNumber)localMessageState
{
  return self->_localMessageState;
}

- (void)setLocalMessageState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSNumber)endpointState
{
  return self->_endpointState;
}

- (void)setEndpointState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)wpConnectionErrorDomain
{
  return self->_wpConnectionErrorDomain;
}

- (void)setWpConnectionErrorDomain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSNumber)wpConnectionErrorCode
{
  return self->_wpConnectionErrorCode;
}

- (void)setWpConnectionErrorCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSDictionary)wpConnectionErrorUserInfo
{
  return self->_wpConnectionErrorUserInfo;
}

- (void)setWpConnectionErrorUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failureReason, 0);
  objc_storeStrong((id *)&self->_endpointState, 0);
  objc_storeStrong((id *)&self->_wpConnectionErrorUserInfo, 0);
  objc_storeStrong((id *)&self->_wpConnectionErrorCode, 0);
  objc_storeStrong((id *)&self->_wpConnectionErrorDomain, 0);
  objc_storeStrong((id *)&self->_localMessageState, 0);
  objc_storeStrong((id *)&self->_isDeviceBlackedOut, 0);
  objc_storeStrong((id *)&self->_currentAverageRTT, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_deliveryError, 0);
  objc_storeStrong((id *)&self->_displayURIs, 0);
  objc_storeStrong((id *)&self->_responseToken, 0);
  objc_storeStrong((id *)&self->_responseError, 0);
  objc_storeStrong((id *)&self->_responseTimeStamp, 0);
  objc_storeStrong((id *)&self->_responseCommand, 0);
}

@end
