@implementation GEOLocationShiftingEnabledResponse

- (BOOL)isValid
{
  return 1;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOLocationShiftingEnabledResponse;
  v4 = a3;
  -[GEOXPCReply encodeToXPCDictionary:](&v5, sel_encodeToXPCDictionary_, v4);
  xpc_dictionary_set_BOOL(v4, "enabled", self->_enabled);

}

- (BOOL)enabled
{
  return self->_enabled;
}

- (GEOLocationShiftingEnabledResponse)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOLocationShiftingEnabledResponse *v7;
  GEOLocationShiftingEnabledResponse *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOLocationShiftingEnabledResponse;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v10, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    v7->_enabled = xpc_dictionary_get_BOOL(v6, "enabled");
    v8 = v7;
  }

  return v7;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end
