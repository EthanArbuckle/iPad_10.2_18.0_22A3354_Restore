@implementation QLTBitmapImage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)imageWithFormat:(id)a3 data:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setFormat:", v6);

  objc_msgSend(v7, "setData:", v5);
  return v7;
}

- (QLTBitmapImage)initWithCoder:(id)a3
{
  id v3;
  QLTBitmapImage *v4;
  uint64_t v5;
  NSData *data;
  uint64_t v7;
  QLTBitmapFormat *format;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)QLTBitmapImage;
  v3 = a3;
  v4 = -[QLTBitmapImage init](&v10, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("d"), v10.receiver, v10.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  data = v4->_data;
  v4->_data = (NSData *)v5;

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("f"));
  v7 = objc_claimAutoreleasedReturnValue();

  format = v4->_format;
  v4->_format = (QLTBitmapFormat *)v7;

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *data;
  id v5;

  data = self->_data;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", data, CFSTR("d"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_format, CFSTR("f"));

}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (QLTBitmapFormat)format
{
  return self->_format;
}

- (void)setFormat:(id)a3
{
  objc_storeStrong((id *)&self->_format, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_format, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
