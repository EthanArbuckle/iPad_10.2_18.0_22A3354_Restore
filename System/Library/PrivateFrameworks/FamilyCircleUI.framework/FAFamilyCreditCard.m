@implementation FAFamilyCreditCard

- (NSString)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)providerDescription
{
  return self->_providerDescription;
}

- (void)setProviderDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)usageNotice
{
  return self->_usageNotice;
}

- (void)setUsageNotice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSURL)imageURL
{
  return self->_imageURL;
}

- (void)setImageURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageURL, 0);
  objc_storeStrong((id *)&self->_usageNotice, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_providerDescription, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_details, 0);
}

@end
