@implementation NEIKEv2VendorData

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[NEIKEv2VendorData vendorData](self, "vendorData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setVendorData:", v6);

  return v4;
}

- (NSData)vendorData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setVendorData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vendorData, 0);
}

@end
