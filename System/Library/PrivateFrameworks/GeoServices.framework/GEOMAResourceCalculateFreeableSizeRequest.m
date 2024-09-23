@implementation GEOMAResourceCalculateFreeableSizeRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOMAResourceCalculateFreeableSizeRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("MAResources.calculateFreeable"), a3, a4, a5);
}

- (GEOMAResourceCalculateFreeableSizeRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOMAResourceCalculateFreeableSizeRequest *v7;
  GEOMAResourceCalculateFreeableSizeRequest *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMAResourceCalculateFreeableSizeRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v10, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    v7->_urgency = xpc_dictionary_get_int64(v6, "urgency");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOMAResourceCalculateFreeableSizeRequest;
  v4 = a3;
  -[GEOXPCRequest encodeToXPCDictionary:](&v5, sel_encodeToXPCDictionary_, v4);
  xpc_dictionary_set_int64(v4, "urgency", self->_urgency);

}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- (int)urgency
{
  return self->_urgency;
}

- (void)setUrgency:(int)a3
{
  self->_urgency = a3;
}

@end
