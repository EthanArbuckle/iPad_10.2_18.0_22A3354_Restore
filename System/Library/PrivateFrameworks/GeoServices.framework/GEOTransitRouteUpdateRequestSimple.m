@implementation GEOTransitRouteUpdateRequestSimple

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOTransitRouteUpdateRequestSimple)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("TransitUpdate.startTransitRouteUpdateRequest"), a3, a4, a5);
}

- (GEOTransitRouteUpdateRequestSimple)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOTransitRouteUpdateRequestSimple *v7;
  const void *data;
  void *v9;
  GEOTransitRouteUpdateRequest *v10;
  GEOTransitRouteUpdateRequest *request;
  GEOTransitRouteUpdateRequestSimple *v12;
  uint64_t v14;
  size_t length;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GEOTransitRouteUpdateRequestSimple;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v16, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    length = 0;
    data = xpc_dictionary_get_data(v6, "transitUpdateRequestData", &length);
    if (data)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[GEOTransitRouteUpdateRequest initWithData:]([GEOTransitRouteUpdateRequest alloc], "initWithData:", v9);
    }
    else
    {
      xpc_dictionary_get_value(v6, "transitUpdateRequestData");
      v14 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v14;
      if (!v14 || MEMORY[0x18D765A14](v14) != MEMORY[0x1E0C812E8])
        goto LABEL_5;
      v10 = objc_alloc_init(GEOTransitRouteUpdateRequest);
    }
    request = v7->_request;
    v7->_request = v10;

LABEL_5:
    v12 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  GEOTransitRouteUpdateRequest *request;
  id v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GEOTransitRouteUpdateRequestSimple;
  -[GEOXPCRequest encodeToXPCDictionary:](&v7, sel_encodeToXPCDictionary_, v4);
  request = self->_request;
  if (request)
  {
    -[GEOTransitRouteUpdateRequest data](request, "data");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_data(v4, "transitUpdateRequestData", (const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));

  }
}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  -[GEOTransitRouteUpdateRequestSimple request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (unint64_t)reply
{
  return 1;
}

- (GEOTransitRouteUpdateRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
}

@end
