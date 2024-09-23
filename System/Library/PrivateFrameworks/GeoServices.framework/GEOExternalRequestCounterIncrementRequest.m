@implementation GEOExternalRequestCounterIncrementRequest

+ (Class)replyClass
{
  return 0;
}

- (GEOExternalRequestCounterIncrementRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("requestCounter.externalIncrement"), a3, a4, a5);
}

- (GEOExternalRequestCounterIncrementRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOExternalRequestCounterIncrementRequest *v7;
  void *v8;
  GEOExternalRequestCounterInfo *v9;
  GEOExternalRequestCounterIncrementRequest *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOExternalRequestCounterIncrementRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v12, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    xpc_dictionary_get_dictionary(v6, "info");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[GEOExternalRequestCounterInfo initWithXPCDictionary:error:]([GEOExternalRequestCounterInfo alloc], "initWithXPCDictionary:error:", v8, a4);
      if (v9)
        objc_storeStrong((id *)&v7->_info, v9);

    }
    v10 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  xpc_object_t empty;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)GEOExternalRequestCounterIncrementRequest;
  -[GEOXPCRequest encodeToXPCDictionary:](&v6, sel_encodeToXPCDictionary_, v4);
  if (self->_info)
  {
    empty = xpc_dictionary_create_empty();
    -[GEOExternalRequestCounterInfo encodeToXPCDictionary:](self->_info, "encodeToXPCDictionary:", empty);
    xpc_dictionary_set_value(v4, "info", empty);

  }
}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 0;
}

- (GEOExternalRequestCounterInfo)info
{
  return self->_info;
}

- (void)setInfo:(id)a3
{
  objc_storeStrong((id *)&self->_info, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);
}

@end
