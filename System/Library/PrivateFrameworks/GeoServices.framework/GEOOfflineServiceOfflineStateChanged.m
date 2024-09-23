@implementation GEOOfflineServiceOfflineStateChanged

+ (id)messageName
{
  return CFSTR("OfflineStateChanged");
}

- (GEOOfflineServiceOfflineStateChanged)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOOfflineServiceOfflineStateChanged *v7;
  GEOOfflineServiceOfflineStateChanged *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOOfflineServiceOfflineStateChanged;
  v7 = -[GEOXPCMessage initWithXPCDictionary:error:](&v10, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    v7->_savedState.raw = xpc_dictionary_get_int64(v6, "savedState");
    v7->_currentState.raw = xpc_dictionary_get_int64(v6, "currentState");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOOfflineServiceOfflineStateChanged;
  v4 = a3;
  -[GEOXPCMessage encodeToXPCDictionary:](&v5, sel_encodeToXPCDictionary_, v4);
  xpc_dictionary_set_int64(v4, "savedState", self->_savedState.raw);
  xpc_dictionary_set_int64(v4, "currentState", self->_currentState.raw);

}

- (BOOL)isValid
{
  return 1;
}

- ($BD055F43A5DF7FBAA8066526AB28D3ED)savedState
{
  return ($BD055F43A5DF7FBAA8066526AB28D3ED)self->_savedState.raw;
}

- (void)setSavedState:(id)a3
{
  self->_savedState.raw = a3.var0;
}

- ($BD055F43A5DF7FBAA8066526AB28D3ED)currentState
{
  return ($BD055F43A5DF7FBAA8066526AB28D3ED)self->_currentState.raw;
}

- (void)setCurrentState:(id)a3
{
  self->_currentState.raw = a3.var0;
}

@end
