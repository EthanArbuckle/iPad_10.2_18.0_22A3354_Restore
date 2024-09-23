@implementation GEOImageServiceCalculateFreeableSizeReply

- (GEOImageServiceCalculateFreeableSizeReply)initWithXPCDictionary:(id)a3 error:(id *)a4
{
  id v6;
  GEOImageServiceCalculateFreeableSizeReply *v7;
  GEOImageServiceCalculateFreeableSizeReply *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOImageServiceCalculateFreeableSizeReply;
  v7 = -[GEOXPCReply initWithXPCDictionary:error:](&v10, sel_initWithXPCDictionary_error_, v6, a4);
  if (v7)
  {
    v7->_size = xpc_dictionary_get_int64(v6, "size");
    v8 = v7;
  }

  return v7;
}

- (void)encodeToXPCDictionary:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GEOImageServiceCalculateFreeableSizeReply;
  v4 = a3;
  -[GEOXPCReply encodeToXPCDictionary:](&v5, sel_encodeToXPCDictionary_, v4);
  xpc_dictionary_set_int64(v4, "size", self->_size);

}

- (BOOL)isValid
{
  return 1;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

@end
