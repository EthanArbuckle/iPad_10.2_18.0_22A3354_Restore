@implementation IDSSendParameters

- (IDSSendParameters)init
{
  double v2;

  return (IDSSendParameters *)objc_msgSend_initWithDictionary_(self, a2, 0, v2);
}

- (IDSSendParameters)initWithDictionary:(id)a3
{
  id v4;
  IDSSendParameters *v5;
  const char *v6;
  uint64_t v7;
  double v8;
  IDSSendParameters *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *params;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IDSSendParameters;
  v5 = -[IDSSendParameters init](&v15, sel_init);
  v9 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v10 = (void *)objc_msgSend_mutableCopy(v4, v6, v7, v8);
    v11 = v10;
    if (v10)
      v12 = v10;
    else
      v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    params = v9->_params;
    v9->_params = v12;

  }
  return v9;
}

- (IDSSendParameters)initWithCoder:(id)a3
{
  double v3;
  void *v5;
  const char *v6;
  double v7;
  IDSSendParameters *v8;

  objc_msgSend_decodeObjectForKey_(a3, a2, (uint64_t)CFSTR("params"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (IDSSendParameters *)objc_msgSend_initWithDictionary_(self, v6, (uint64_t)v5, v7);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  const char *v6;
  double v7;
  void *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v5 = objc_alloc((Class)objc_opt_class());
  v8 = (void *)objc_msgSend_initWithDictionary_(v5, v6, (uint64_t)self->_params, v7);
  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)objectForKey:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  const char *v6;
  double v7;
  void *v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend_objectForKey_(self->_params, v6, (uint64_t)v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  double v7;
  NSMutableDictionary *params;
  char *v9;

  v9 = (char *)a3;
  v6 = a4;
  os_unfair_lock_lock(&self->_lock);
  params = self->_params;
  if (v9)
    objc_msgSend_setObject_forKey_(params, v9, (uint64_t)v9, v7, v6);
  else
    objc_msgSend_removeObjectForKey_(params, 0, (uint64_t)v6, v7);

  os_unfair_lock_unlock(&self->_lock);
}

- (void)encodeWithCoder:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  const char *v6;
  double v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend_encodeObject_forKey_(v5, v6, (uint64_t)self->_params, v7, CFSTR("params"));

  os_unfair_lock_unlock(p_lock);
}

- (NSDictionary)dictionaryRepresentation
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = objc_retainAutorelease(self->_params);
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (void)setData:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersDataKey"));
}

- (NSData)data
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersDataKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (void)setMessage:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersMessageKey"));
}

- (NSDictionary)message
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersMessageKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (void)setProtobuf:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersProtobufKey"));
}

- (NSDictionary)protobuf
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersProtobufKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (void)setResourcePath:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersResourcePathKey"));
}

- (NSString)resourcePath
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersResourcePathKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setResourceMetadata:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersResourceMetadataKey"));
}

- (NSDictionary)resourceMetadata
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersResourceMetadataKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (void)setFromID:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersFromIDKey"));
}

- (NSString)fromID
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersFromIDKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setFromShortHandle:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersFromShortHandleKey"));
}

- (NSString)fromShortHandle
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersFromShortHandleKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setDestinations:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersDestinationsKey"));
}

- (IDSDestination)destinations
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersDestinationsKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (IDSDestination *)v4;
}

- (void)setFinalDestinationURIs:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersFinalDestinationURIsKey"));
}

- (NSArray)finalDestinationURIs
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersFinalDestinationURIsKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setAccountUUID:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersAccountUUIDKey"));
}

- (NSString)accountUUID
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersAccountUUIDKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setDataToEncrypt:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersDataToEncryptKey"));
}

- (NSData)dataToEncrypt
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersDataToEncryptKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (void)setEncryptionAttributes:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersEncryptionAttributesKey"));
}

- (NSDictionary)encryptionAttributes
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersEncryptionAttributesKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (void)setCommand:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersCommandKey"));
}

- (NSNumber)command
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersCommandKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)setCommandContext:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersCommandContextKey"));
}

- (NSNumber)commandContext
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersCommandContextKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)setIdentifier:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersIdentifierKey"));
}

- (NSString)identifier
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersIdentifierKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setDeliveryStatusContext:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersDeliveryStatusContextKey"));
}

- (NSDictionary)deliveryStatusContext
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersDeliveryStatusContextKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (void)setMessageUUID:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersMessageUUIDKey"));
}

- (NSData)messageUUID
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersMessageUUIDKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (void)setAlternateCallbackID:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersAlternateCallbackIDKey"));
}

- (NSString)alternateCallbackID
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersAlternateCallbackIDKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setBulkedPayload:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersBulkedPayloadKey"));
}

- (NSArray)bulkedPayload
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersBulkedPayloadKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setPeerResponseIdentifier:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersPeerResponseIdentifierKey"));
}

- (NSString)peerResponseIdentifier
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersPeerResponseIdentifierKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setRequireAllRegistrationProperties:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersRequireAllRegistrationPropertiesKey"));
}

- (NSArray)requireAllRegistrationProperties
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersRequireAllRegistrationPropertiesKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setRequireLackOfRegistrationProperties:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersRequireLackOfRegistrationPropertiesKey"));
}

- (NSArray)requireLackOfRegistrationProperties
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersRequireLackOfRegistrationPropertiesKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setInterestingRegistrationProperties:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersInterestingRegistrationPropertiesKey"));
}

- (NSArray)interestingRegistrationProperties
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersInterestingRegistrationPropertiesKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setQueueOneIdentifier:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersQueueOneIdentifierKey"));
}

- (NSString)queueOneIdentifier
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersQueueOneIdentifierKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setDuetIdentifiersOverride:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersDuetIdentifiersOverrideKey"));
}

- (NSArray)duetIdentifiersOverride
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersDuetIdentifiersOverrideKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (void)setAccessToken:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersAccessTokenKey"));
}

- (NSData)accessToken
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersAccessTokenKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (void)setSubService:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersSubServiceKey"));
}

- (NSString)subService
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersSubServiceKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setSubServiceAccountUUID:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersSubServiceAccountUUIDKey"));
}

- (NSString)subServiceAccountUUID
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersSubServiceAccountUUIDKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setMainAccountUUID:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersMainAccountUUIDKey"));
}

- (NSString)mainAccountUUID
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersMainAccountUUIDKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setOriginalfromID:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersOriginalfromIDKey"));
}

- (NSString)originalfromID
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersOriginalfromIDKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setLocalDestinationDeviceUUID:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersLocalDestinationDeviceUUIDKey"));
}

- (NSString)localDestinationDeviceUUID
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersLocalDestinationDeviceUUIDKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setDestinationCorrelationIdentifier:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersDestinationCorrelationIdentifierKey"));
}

- (NSString)destinationCorrelationIdentifier
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersDestinationCorrelationIdentifierKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setMessageType:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersMessageTypeKey"));
}

- (NSNumber)messageType
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersMessageTypeKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)setSessionID:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersSessionIDKey"));
}

- (NSString)sessionID
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersSessionIDKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setGroupData:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersGroupDataKey"));
}

- (NSData)groupData
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersGroupDataKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (void)setMetricReportIdentifier:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersMetricReportIdentifierKey"));
}

- (NSString)metricReportIdentifier
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersMetricReportIdentifierKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setDropMessageIndicatorCommand:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersDropMessageIndicatorCommandKey"));
}

- (NSNumber)dropMessageIndicatorCommand
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersDropMessageIndicatorCommandKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)setOriginalTimestamp:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersOriginalTimestampKey"));
}

- (NSNumber)originalTimestamp
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersOriginalTimestampKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)setPushPriority:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersPushPriorityKey"));
}

- (NSNumber)pushPriority
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersPushPriorityKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)setPrioritizedTokenList:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersPrioritizedTokenListKey"));
}

- (IDSPrioritizedTokenList)prioritizedTokenList
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersPrioritizedTokenListKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (IDSPrioritizedTokenList *)v4;
}

- (void)setDeliveryMinimumTimeDelay:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersDeliveryMinimumTimeDelayKey"));
}

- (NSNumber)deliveryMinimumTimeDelay
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersDeliveryMinimumTimeDelayKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)setDeliveryMinimumTime:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersDeliveryMinimumTimeKey"));
}

- (NSNumber)deliveryMinimumTime
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersDeliveryMinimumTimeKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)setSendMode:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersSendModeKey"));
}

- (NSNumber)sendMode
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersSendModeKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)setIsInitiator:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersIsInitiatorKey"));
}

- (NSNumber)isInitiator
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersIsInitiatorKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)setKeyTransparencyURIVerificationMap:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersKeyTransparencyURIVerificationMapKey"));
}

- (NSDictionary)keyTransparencyURIVerificationMap
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersKeyTransparencyURIVerificationMapKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (void)setQuickRelayUserType:(id)a3
{
  double v3;

  objc_msgSend_setObject_forKey_(self, a2, (uint64_t)a3, v3, CFSTR("IDSSendParametersQuickRelayUserTypeKey"));
}

- (NSNumber)quickRelayUserType
{
  double v2;
  void *v3;
  void *v4;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersQuickRelayUserTypeKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

- (void)setExpectsPeerResponse:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersExpectsPeerResponseKey"));

}

- (BOOL)expectsPeerResponse
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersExpectsPeerResponseKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setCompressed:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersCompressedKey"));

}

- (BOOL)compressed
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersCompressedKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setUseDictAsTopLevel:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersUseDictAsTopLevelKey"));

}

- (BOOL)useDictAsTopLevel
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersUseDictAsTopLevelKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setWantsAppAck:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersWantsAppAckKey"));

}

- (BOOL)wantsAppAck
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersWantsAppAckKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setEncryptPayload:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersEncryptPayloadKey"));

}

- (BOOL)encryptPayload
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersEncryptPayloadKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setCompressPayload:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersCompressPayloadKey"));

}

- (BOOL)compressPayload
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersCompressPayloadKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setWantsResponse:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersWantsResponseKey"));

}

- (BOOL)wantsResponse
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersWantsResponseKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setWantsProgress:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersWantsProgressKey"));

}

- (BOOL)wantsProgress
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersWantsProgressKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setWantsDeliveryStatus:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersWantsDeliveryStatusKey"));

}

- (BOOL)wantsDeliveryStatus
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersWantsDeliveryStatusKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setWantsCertifiedDelivery:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersWantsCertifiedDeliveryKey"));

}

- (BOOL)wantsCertifiedDelivery
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersWantsCertifiedDeliveryKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setPriority:(int64_t)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3 && sel_integerValue == sel_BOOLValue)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersPriorityKey"));

}

- (int64_t)priority
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  int64_t v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersPriorityKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_integerValue(v3, v4, v5, v6);

  return v7;
}

- (void)setLocalDelivery:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersLocalDeliveryKey"));

}

- (BOOL)localDelivery
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersLocalDeliveryKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setRequireBluetooth:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersRequireBluetoothKey"));

}

- (BOOL)requireBluetooth
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersRequireBluetoothKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setRequireLocalWiFi:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersRequireLocalWiFiKey"));

}

- (BOOL)requireLocalWiFi
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersRequireLocalWiFiKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setTimeout:(double)a3
{
  uint64_t v3;
  char *v6;
  double v7;
  const char *v8;
  char *v10;

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], a2, v3, a3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (a3 == 0.0 && sel_doubleValue == sel_BOOLValue)
  {

    v8 = 0;
  }
  v10 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersTimeoutKey"));

}

- (double)timeout
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersTimeoutKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_doubleValue(v3, v4, v5, v6);
  v8 = v7;

  return v8;
}

- (void)setBypassDuet:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersBypassDuetKey"));

}

- (BOOL)bypassDuet
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersBypassDuetKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setFakeMessage:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersFakeMessageKey"));

}

- (BOOL)fakeMessage
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersFakeMessageKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setBypassStorage:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersBypassStorageKey"));

}

- (BOOL)bypassStorage
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersBypassStorageKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setActivityContinuation:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersActivityContinuationKey"));

}

- (BOOL)activityContinuation
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersActivityContinuationKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setNonWaking:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersNonWakingKey"));

}

- (BOOL)nonWaking
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersNonWakingKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setNonCloudWaking:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersNonCloudWakingKey"));

}

- (BOOL)nonCloudWaking
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersNonCloudWakingKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setDaemonDeathResend:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersDaemonDeathResendKey"));

}

- (BOOL)daemonDeathResend
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersDaemonDeathResendKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setBypassSizeCheck:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersBypassSizeCheckKey"));

}

- (BOOL)bypassSizeCheck
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersBypassSizeCheckKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setFireAndForget:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersFireAndForgetKey"));

}

- (BOOL)fireAndForget
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersFireAndForgetKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setIsProxiedOutgoingMessage:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersIsProxiedOutgoingMessageKey"));

}

- (BOOL)isProxiedOutgoingMessage
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersIsProxiedOutgoingMessageKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setEnforceRemoteTimeouts:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersEnforceRemoteTimeoutsKey"));

}

- (BOOL)enforceRemoteTimeouts
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersEnforceRemoteTimeoutsKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setHomeKitPayload:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersHomeKitPayloadKey"));

}

- (BOOL)homeKitPayload
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersHomeKitPayloadKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setDisableAliasValidation:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersDisableAliasValidationKey"));

}

- (BOOL)disableAliasValidation
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersDisableAliasValidationKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setForceEncryptionOff:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersForceEncryptionOffKey"));

}

- (BOOL)forceEncryptionOff
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersForceEncryptionOffKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setAllowCloudDelivery:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersAllowCloudDeliveryKey"));

}

- (BOOL)allowCloudDelivery
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersAllowCloudDeliveryKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setAlwaysSkipSelf:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersAlwaysSkipSelfKey"));

}

- (BOOL)alwaysSkipSelf
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersAlwaysSkipSelfKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setForceQuery:(int64_t)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3 && sel_integerValue == sel_BOOLValue)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersForceQueryKey"));

}

- (int64_t)forceQuery
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  int64_t v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersForceQueryKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_integerValue(v3, v4, v5, v6);

  return v7;
}

- (void)setAlwaysIncludeSelf:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersAlwaysIncludeSelfKey"));

}

- (BOOL)alwaysIncludeSelf
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersAlwaysIncludeSelfKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setDisallowRefresh:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersDisallowRefreshKey"));

}

- (BOOL)disallowRefresh
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersDisallowRefreshKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setLiveMessageDelivery:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersLiveMessageDeliveryKey"));

}

- (BOOL)liveMessageDelivery
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersLiveMessageDeliveryKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setIsUPlusOne:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersIsUPlusOneKey"));

}

- (BOOL)isUPlusOne
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersIsUPlusOneKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setSessionForceInternetInvitation:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersSessionForceInternetInvitationKey"));

}

- (BOOL)sessionForceInternetInvitation
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersSessionForceInternetInvitationKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setWantsFirewallDonation:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersWantsFirewallDonationKey"));

}

- (BOOL)wantsFirewallDonation
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersWantsFirewallDonationKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)setIgnoreMaxRetryCount:(BOOL)a3
{
  double v3;
  char *v6;
  double v7;
  const char *v8;
  char *v9;

  objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, a3, v3);
  v6 = (char *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!a3)
  {

    v8 = 0;
  }
  v9 = (char *)v8;
  objc_msgSend_setObject_forKey_(self, v8, (uint64_t)v8, v7, CFSTR("IDSSendParametersIgnoreMaxRetryCountKey"));

}

- (BOOL)ignoreMaxRetryCount
{
  double v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  char v7;

  objc_msgSend_objectForKey_(self, a2, (uint64_t)CFSTR("IDSSendParametersIgnoreMaxRetryCountKey"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (NSDate)expirationDate
{
  uint64_t v2;
  double v3;
  const char *v4;
  uint64_t v5;
  double v6;
  void *v7;

  objc_msgSend_timeout(self, a2, v2, v3);
  if (v6 <= 2.22044605e-16)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x1E0C99D68], v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v7;
}

- (NSMutableDictionary)params
{
  return self->_params;
}

- (void)setParams:(id)a3
{
  objc_storeStrong((id *)&self->_params, a3);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
}

@end
