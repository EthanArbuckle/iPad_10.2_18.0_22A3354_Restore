@implementation SUUIApplicationLicensePage

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setLicenseAgreementHTML:", self->_licenseAgreementHTML);
  objc_msgSend(v4, "setTitle:", self->_title);
  return v4;
}

- (NSString)licenseAgreementHTML
{
  return self->_licenseAgreementHTML;
}

- (void)setLicenseAgreementHTML:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_licenseAgreementHTML, 0);
}

@end
