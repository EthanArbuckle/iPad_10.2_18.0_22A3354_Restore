@implementation GEOPlaceCalculateFreeableSpaceReply

- (GEOPlaceCalculateFreeableSpaceReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOPlaceCalculateFreeableSpaceReply *v7;
  GEOPlaceCalculateFreeableSpaceReply *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOPlaceCalculateFreeableSpaceReply;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v10, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    v7->_freeableBytes = xpc_dictionary_get_int64(v6, "sz");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOPlaceCalculateFreeableSpaceReply;
  v4 = a3;
  -[GEOXPCReply encodeToXPCDictionary:](&v5, sel_encodeToXPCDictionary_, v4);
  xpc_dictionary_set_int64(v4, "sz", self->_freeableBytes);

}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)freeableBytes
{
  return self->_freeableBytes;
}

- (void)setFreeableBytes:(unint64_t)a3
{
  self->_freeableBytes = a3;
}

@end
