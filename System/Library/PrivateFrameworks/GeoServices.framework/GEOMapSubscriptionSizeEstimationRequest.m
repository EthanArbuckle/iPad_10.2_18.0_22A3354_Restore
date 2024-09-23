@implementation GEOMapSubscriptionSizeEstimationRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOMapSubscriptionSizeEstimationRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("subscriptions.determineEstimatedSize"), a3, a4, a5);
}

- (GEOMapSubscriptionSizeEstimationRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOMapSubscriptionSizeEstimationRequest *v7;
  const void *data;
  void *v9;
  GEOMapRegion *v10;
  GEOMapRegion *region;
  const uint8_t *uuid;
  uint64_t v13;
  NSUUID *requestUUID;
  GEOMapSubscriptionSizeEstimationRequest *v15;
  uint64_t v17;
  size_t length;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GEOMapSubscriptionSizeEstimationRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v19, sel_initWithXPCDictionary_error_, v6, a4);
  if (!v7)
    goto LABEL_8;
  v7->_dataTypes = xpc_dictionary_get_int64(v6, "dataTypes");
  length = 0;
  data = xpc_dictionary_get_data(v6, "region", &length);
  if (data)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[GEOMapRegion initWithData:]([GEOMapRegion alloc], "initWithData:", v9);
  }
  else
  {
    xpc_dictionary_get_value(v6, "region");
    v17 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v17;
    if (!v17 || MEMORY[0x18D765A14](v17) != MEMORY[0x1E0C812E8])
      goto LABEL_5;
    v10 = objc_alloc_init(GEOMapRegion);
  }
  region = v7->_region;
  v7->_region = v10;

LABEL_5:
  uuid = xpc_dictionary_get_uuid(v6, "requestUUID");
  if (uuid)
  {
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", uuid);
    requestUUID = v7->_requestUUID;
    v7->_requestUUID = (NSUUID *)v13;

  }
  v15 = v7;
LABEL_8:

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  GEOMapRegion *region;
  id v6;
  NSUUID *requestUUID;
  objc_super v8;
  unsigned __int8 uuid[8];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GEOMapSubscriptionSizeEstimationRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v8, sel_encodeToXPCDictionary_, v4);
  xpc_dictionary_set_int64(v4, "dataTypes", self->_dataTypes);
  region = self->_region;
  if (region)
  {
    -[GEOMapRegion data](region, "data");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "region", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));

  }
  requestUUID = self->_requestUUID;
  if (requestUUID)
  {
    *(_QWORD *)uuid = 0;
    v10 = 0;
    -[NSUUID getUUIDBytes:](requestUUID, "getUUIDBytes:", uuid);
    xpc_dictionary_set_uuid(v4, "requestUUID", uuid);
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

- (unint64_t)dataTypes
{
  return self->_dataTypes;
}

- (void)setDataTypes:(unint64_t)a3
{
  self->_dataTypes = a3;
}

- (GEOMapRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_storeStrong((id *)&self->_region, a3);
}

- (NSUUID)requestUUID
{
  return self->_requestUUID;
}

- (void)setRequestUUID:(id)a3
{
  objc_storeStrong((id *)&self->_requestUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_region, 0);
}

@end
