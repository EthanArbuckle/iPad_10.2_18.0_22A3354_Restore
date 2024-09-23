@implementation CTAsciiAddress

+ (id)asciiAddressWithString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithAddress:", v4);

  return v5;
}

- (CTAsciiAddress)initWithAddress:(id)a3
{
  id v4;
  CTAsciiAddress *v5;
  uint64_t v6;
  NSString *address;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTAsciiAddress;
  v5 = -[CTAsciiAddress init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    address = v5->_address;
    v5->_address = (NSString *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CTAsciiAddress initWithAddress:](+[CTAsciiAddress allocWithZone:](CTAsciiAddress, "allocWithZone:", a3), "initWithAddress:", self->_address);
}

- (id)encodedString
{
  return self->_address;
}

- (id)canonicalFormat
{
  return self->_address;
}

- (NSString)address
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
}

@end
