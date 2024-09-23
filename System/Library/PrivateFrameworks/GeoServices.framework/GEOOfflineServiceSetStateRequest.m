@implementation GEOOfflineServiceSetStateRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOOfflineServiceSetStateRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("offlinestate.setState"), a3, a4, a5);
}

- (GEOOfflineServiceSetStateRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOOfflineServiceSetStateRequest *v7;
  GEOOfflineServiceSetStateRequest *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOOfflineServiceSetStateRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v10, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    v7->_state.raw = xpc_dictionary_get_int64(v6, "state");
    v7->_savedState.raw = xpc_dictionary_get_int64(v6, "savedState");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOOfflineServiceSetStateRequest;
  v4 = a3;
  -[GEOXPCRequest encodeToXPCDictionary:](&v5, sel_encodeToXPCDictionary_, v4);
  xpc_dictionary_set_int64(v4, "state", self->_state.raw);
  xpc_dictionary_set_int64(v4, "savedState", self->_savedState.raw);

}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- ($BD055F43A5DF7FBAA8066526AB28D3ED)state
{
  return ($BD055F43A5DF7FBAA8066526AB28D3ED)self->_state.raw;
}

- (void)setState:(id)a3
{
  self->_state.raw = a3.var0;
}

- ($BD055F43A5DF7FBAA8066526AB28D3ED)savedState
{
  return ($BD055F43A5DF7FBAA8066526AB28D3ED)self->_savedState.raw;
}

- (void)setSavedState:(id)a3
{
  self->_savedState.raw = a3.var0;
}

@end
