@implementation GEOMapSubscriptionAddRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOMapSubscriptionAddRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("subscriptions.addSubscription"), a3, a4, a5);
}

- (GEOMapSubscriptionAddRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOMapSubscriptionAddRequest *v7;
  const char *string;
  uint64_t v9;
  NSString *identifier;
  const void *data;
  void *v12;
  GEOMapRegion *v13;
  GEOMapRegion *region;
  const char *v15;
  uint64_t v16;
  NSString *displayName;
  uint64_t v18;
  NSDate *expirationDate;
  GEOMapSubscriptionAddRequest *v20;
  uint64_t v22;
  size_t length;
  objc_super v24;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)GEOMapSubscriptionAddRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v24, sel_initWithXPCDictionary_error_, v6, a4);
  if (!v7)
    goto LABEL_12;
  string = xpc_dictionary_get_string(v6, "identifier");
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v9;

  }
  v7->_dataTypes = xpc_dictionary_get_int64(v6, "dataTypes");
  v7->_policy = xpc_dictionary_get_int64(v6, "policy");
  length = 0;
  data = xpc_dictionary_get_data(v6, "region", &length);
  if (data)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[GEOMapRegion initWithData:]([GEOMapRegion alloc], "initWithData:", v12);
  }
  else
  {
    xpc_dictionary_get_value(v6, "region");
    v22 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v22;
    if (!v22 || MEMORY[0x18D765A14](v22) != MEMORY[0x1E0C812E8])
      goto LABEL_7;
    v13 = objc_alloc_init(GEOMapRegion);
  }
  region = v7->_region;
  v7->_region = v13;

LABEL_7:
  v15 = xpc_dictionary_get_string(v6, "displayName");
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    displayName = v7->_displayName;
    v7->_displayName = (NSString *)v16;

  }
  if (xpc_dictionary_get_double(v6, "expirationDate") != 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v18 = objc_claimAutoreleasedReturnValue();
    expirationDate = v7->_expirationDate;
    v7->_expirationDate = (NSDate *)v18;

  }
  v20 = v7;
LABEL_12:

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  NSString *identifier;
  const char *v6;
  GEOMapRegion *region;
  id v8;
  NSString *displayName;
  const char *v10;
  NSDate *expirationDate;
  double v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOMapSubscriptionAddRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v13, sel_encodeToXPCDictionary_, v4);
  identifier = self->_identifier;
  if (identifier)
  {
    v6 = -[NSString UTF8String](identifier, "UTF8String");
    if (v6)
      xpc_dictionary_set_string(v4, "identifier", v6);
  }
  xpc_dictionary_set_int64(v4, "dataTypes", self->_dataTypes);
  xpc_dictionary_set_int64(v4, "policy", self->_policy);
  region = self->_region;
  if (region)
  {
    -[GEOMapRegion data](region, "data");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "region", (const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));

  }
  displayName = self->_displayName;
  if (displayName)
  {
    v10 = -[NSString UTF8String](displayName, "UTF8String");
    if (v10)
      xpc_dictionary_set_string(v4, "displayName", v10);
  }
  expirationDate = self->_expirationDate;
  if (expirationDate)
  {
    -[NSDate timeIntervalSinceReferenceDate](expirationDate, "timeIntervalSinceReferenceDate");
    if (v12 != 0.0)
      xpc_dictionary_set_double(v4, "expirationDate", v12);
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

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unint64_t)dataTypes
{
  return self->_dataTypes;
}

- (void)setDataTypes:(unint64_t)a3
{
  self->_dataTypes = a3;
}

- (unint64_t)policy
{
  return self->_policy;
}

- (void)setPolicy:(unint64_t)a3
{
  self->_policy = a3;
}

- (GEOMapRegion)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
  objc_storeStrong((id *)&self->_region, a3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_displayName, a3);
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
