@implementation GEOMapSubscriptionSizeEstimationReply

- (GEOMapSubscriptionSizeEstimationReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOMapSubscriptionSizeEstimationReply *v7;
  GEOMapSubscriptionSizeEstimationReply *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOMapSubscriptionSizeEstimationReply;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v10, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    v7->_sizeInBytes = xpc_dictionary_get_int64(v6, "sizeInBytes");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOMapSubscriptionSizeEstimationReply;
  v4 = a3;
  -[GEOXPCReply encodeToXPCDictionary:](&v5, sel_encodeToXPCDictionary_, v4);
  xpc_dictionary_set_int64(v4, "sizeInBytes", self->_sizeInBytes);

}

- (BOOL)isValid
{
  return 1;
}

- (int64_t)sizeInBytes
{
  return self->_sizeInBytes;
}

- (void)setSizeInBytes:(int64_t)a3
{
  self->_sizeInBytes = a3;
}

@end
