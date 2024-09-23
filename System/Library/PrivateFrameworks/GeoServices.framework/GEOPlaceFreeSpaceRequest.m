@implementation GEOPlaceFreeSpaceRequest

+ (Class)replyClass
{
  return (Class)objc_opt_class();
}

- (GEOPlaceFreeSpaceRequest)initWithTraits:(id)a3 auditToken:(id)a4 throttleToken:(id)a5
{
  return -[GEOXPCRequest initWithMessage:traits:auditToken:throttleToken:](self, "initWithMessage:traits:auditToken:throttleToken:", CFSTR("placedata.shrinkBySize"), a3, a4, a5);
}

- (GEOPlaceFreeSpaceRequest)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOPlaceFreeSpaceRequest *v7;
  GEOPlaceFreeSpaceRequest *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOPlaceFreeSpaceRequest;
  v7 = -[GEOXPCRequest initWithXPCDictionary:error:](&v10, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    v7->_freeBytes = xpc_dictionary_get_int64(v6, "sz");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOPlaceFreeSpaceRequest;
  v4 = a3;
  -[GEOXPCRequest encodeToXPCDictionary:](&v5, sel_encodeToXPCDictionary_, v4);
  xpc_dictionary_set_int64(v4, "sz", self->_freeBytes);

}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)reply
{
  return 1;
}

- (unint64_t)freeBytes
{
  return self->_freeBytes;
}

- (void)setFreeBytes:(unint64_t)a3
{
  self->_freeBytes = a3;
}

@end
