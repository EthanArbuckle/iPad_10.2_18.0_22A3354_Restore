@implementation GEOOfflineServiceSuggestedStateChanged

+ (id)messageName
{
  return CFSTR("OfflineSuggestionChanged");
}

- (GEOOfflineServiceSuggestedStateChanged)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOOfflineServiceSuggestedStateChanged *v7;
  GEOOfflineServiceSuggestedStateChanged *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOOfflineServiceSuggestedStateChanged;
  v7 = -[GEOXPCMessage initWithXPCDictionary:error:](&v10, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    v7->_currentState = xpc_dictionary_get_int64(v6, "currentState");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOOfflineServiceSuggestedStateChanged;
  v4 = a3;
  -[GEOXPCMessage encodeToXPCDictionary:](&v5, sel_encodeToXPCDictionary_, v4);
  xpc_dictionary_set_int64(v4, "currentState", self->_currentState);

}

- (BOOL)isValid
{
  return -[GEOOfflineServiceSuggestedStateChanged currentState](self, "currentState") != 0;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_currentState = a3;
}

@end
