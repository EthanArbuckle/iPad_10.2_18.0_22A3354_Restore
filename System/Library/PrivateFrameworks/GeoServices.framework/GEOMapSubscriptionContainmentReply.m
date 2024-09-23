@implementation GEOMapSubscriptionContainmentReply

- (GEOMapSubscriptionContainmentReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOMapSubscriptionContainmentReply *v7;
  GEOMapSubscriptionContainmentReply *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapSubscriptionContainmentReply;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v10, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    v7->_sufficientlyContained = xpc_dictionary_get_BOOL(v6, "sufficientlyContained");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOMapSubscriptionContainmentReply;
  v4 = a3;
  -[GEOXPCReply encodeToXPCDictionary:](&v5, sel_encodeToXPCDictionary_, v4);
  xpc_dictionary_set_BOOL(v4, "sufficientlyContained", self->_sufficientlyContained);

}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)sufficientlyContained
{
  return self->_sufficientlyContained;
}

- (void)setSufficientlyContained:(BOOL)a3
{
  self->_sufficientlyContained = a3;
}

@end
