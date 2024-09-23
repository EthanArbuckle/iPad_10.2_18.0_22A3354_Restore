@implementation GEOConfigGetAllValueInStoreRequest

- (void)setKeyOptions:(unint64_t)a3
{
  self->_keyOptions = a3;
}

- (unint64_t)reply
{
  return 1;
}

- (BOOL)isValid
{
  return -[GEOConfigGetAllValueInStoreRequest keyOptions](self, "keyOptions") != 0;
}

- (unint64_t)keyOptions
{
  return self->_keyOptions;
}

- (GEOConfigGetAllValueInStoreRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("defaults.getAllValuesInStore"), a3, a4, a5);
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOConfigGetAllValueInStoreRequest;
  v4 = a3;
  -[GEOXPCRequest encodeToXPCDictionary:](&v5, sel_encodeToXPCDictionary_, v4);
  xpc_dictionary_set_int64(v4, "keyOptions", self->_keyOptions);

}

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOConfigGetAllValueInStoreRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOConfigGetAllValueInStoreRequest *v7;
  GEOConfigGetAllValueInStoreRequest *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOConfigGetAllValueInStoreRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v10, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    v7->_keyOptions = xpc_dictionary_get_int64(v6, "keyOptions");
    v8 = v7;
  }

  return v7;
}

@end
