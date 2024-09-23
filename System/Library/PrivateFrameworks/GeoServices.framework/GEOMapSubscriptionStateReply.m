@implementation GEOMapSubscriptionStateReply

- (GEOMapSubscriptionStateReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOMapSubscriptionStateReply *v7;
  void *v8;
  GEOMapDataSubscriptionState *v9;
  GEOMapSubscriptionStateReply *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEOMapSubscriptionStateReply;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v12, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    xpc_dictionary_get_dictionary(v6, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = -[GEOMapDataSubscriptionState initWithXPCDictionary:error:]([GEOMapDataSubscriptionState alloc], "initWithXPCDictionary:error:", v8, a4);
      if (v9)
        objc_storeStrong((id *)&v7->_state, v9);

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
  v6.super_class = (Class)GEOMapSubscriptionStateReply;
  -[GEOXPCReply encodeToXPCDictionary:](&v6, sel_encodeToXPCDictionary_, v4);
  if (self->_state)
  {
    empty = xpc_dictionary_create_empty();
    -[GEOMapDataSubscriptionState encodeToXPCDictionary:](self->_state, "encodeToXPCDictionary:", empty);
    xpc_dictionary_set_value(v4, "state", empty);

  }
}

- (BOOL)isValid
{
  return 1;
}

- (GEOMapDataSubscriptionState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
}

@end
