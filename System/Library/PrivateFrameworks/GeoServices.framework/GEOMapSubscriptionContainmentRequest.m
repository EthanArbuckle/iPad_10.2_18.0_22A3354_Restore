@implementation GEOMapSubscriptionContainmentRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOMapSubscriptionContainmentRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("subscriptions.checkContainmentForRegion"), a3, a4, a5);
}

- (GEOMapSubscriptionContainmentRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOMapSubscriptionContainmentRequest *v7;
  const void *data;
  void *v9;
  GEOMapRegion *v10;
  GEOMapRegion *region;
  GEOMapSubscriptionContainmentRequest *v12;
  uint64_t v14;
  size_t length;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOMapSubscriptionContainmentRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v16, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
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
      v14 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v14;
      if (!v14 || MEMORY[0x18D765A14](v14) != MEMORY[0x1E0C812E8])
        goto LABEL_5;
      v10 = objc_alloc_init(GEOMapRegion);
    }
    region = v7->_region;
    v7->_region = v10;

LABEL_5:
    v12 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  GEOMapRegion *region;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOMapSubscriptionContainmentRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v7, sel_encodeToXPCDictionary_, v4);
  xpc_dictionary_set_int64(v4, "dataTypes", self->_dataTypes);
  region = self->_region;
  if (region)
  {
    -[GEOMapRegion data](region, "data");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "region", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));

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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
}

@end
