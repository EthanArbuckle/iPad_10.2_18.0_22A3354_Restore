@implementation GEOComposedStringFormatStyle

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_token, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  *(_DWORD *)(v4 + 8) = self->_type;
  return (id)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedStringFormatStyle)initWithCoder:(id)a3
{
  id v4;
  GEOComposedStringFormatStyle *v5;
  uint64_t v6;
  NSString *token;
  GEOComposedStringFormatStyle *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOComposedStringFormatStyle;
  v5 = -[GEOComposedStringFormatStyle init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_token"));
    v6 = objc_claimAutoreleasedReturnValue();
    token = v5->_token;
    v5->_token = (NSString *)v6;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_type"));
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *token;
  id v5;

  token = self->_token;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", token, CFSTR("_token"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("_type"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
}

@end
