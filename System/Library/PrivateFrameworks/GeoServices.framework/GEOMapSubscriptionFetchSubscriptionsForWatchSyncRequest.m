@implementation GEOMapSubscriptionFetchSubscriptionsForWatchSyncRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOMapSubscriptionFetchSubscriptionsForWatchSyncRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("subscriptions.fetchSubscriptionsForSyncToWatch"), a3, a4, a5);
}

- (GEOMapSubscriptionFetchSubscriptionsForWatchSyncRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOMapSubscriptionFetchSubscriptionsForWatchSyncRequest *v7;
  const uint8_t *uuid;
  uint64_t v9;
  NSUUID *deviceIdentifier;
  GEOMapSubscriptionFetchSubscriptionsForWatchSyncRequest *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOMapSubscriptionFetchSubscriptionsForWatchSyncRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v13, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    uuid = xpc_dictionary_get_uuid(v6, "deviceIdentifier");
    if (uuid)
    {
      v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uuid);
      deviceIdentifier = v7->_deviceIdentifier;
      v7->_deviceIdentifier = (NSUUID *)v9;

    }
    v11 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  NSUUID *deviceIdentifier;
  objc_super v6;
  unsigned __int8 uuid[8];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)GEOMapSubscriptionFetchSubscriptionsForWatchSyncRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v6, sel_encodeToXPCDictionary_, v4);
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
  {
    *(_QWORD *)uuid = 0;
    v8 = 0;
    -[NSUUID getUUIDBytes:](deviceIdentifier, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(v4, "deviceIdentifier", uuid);
  }

}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- (NSUUID)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_deviceIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
