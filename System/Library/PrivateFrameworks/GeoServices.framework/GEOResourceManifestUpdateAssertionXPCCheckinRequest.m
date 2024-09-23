@implementation GEOResourceManifestUpdateAssertionXPCCheckinRequest

+ (Class)replyClass
{
  return 0;
}

- (GEOResourceManifestUpdateAssertionXPCCheckinRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("resourcemanifestupdateassertion.checkinForUpdateAssertion"), a3, a4, a5);
}

- (GEOResourceManifestUpdateAssertionXPCCheckinRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOResourceManifestUpdateAssertionXPCCheckinRequest *v7;
  const char *string;
  uint64_t v9;
  NSString *reason;
  GEOResourceManifestUpdateAssertionXPCCheckinRequest *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOResourceManifestUpdateAssertionXPCCheckinRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v13, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    string = xpc_dictionary_get_string(v6, "reason");
    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v9 = objc_claimAutoreleasedReturnValue();
      reason = v7->_reason;
      v7->_reason = (NSString *)v9;

    }
    v7->_timestamp = xpc_dictionary_get_double(v6, "timestamp");
    v11 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  NSString *reason;
  const char *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOResourceManifestUpdateAssertionXPCCheckinRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v7, sel_encodeToXPCDictionary_, v4);
  reason = self->_reason;
  if (reason)
  {
    v6 = -[NSString UTF8String](reason, "UTF8String");
    if (v6)
      xpc_dictionary_set_string(v4, "reason", v6);
  }
  xpc_dictionary_set_double(v4, "timestamp", self->_timestamp);

}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 0;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
