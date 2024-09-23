@implementation NFPeerPaymentEnrollmentResponse

- (NFPeerPaymentEnrollmentResponse)initWithDictionary:(id)a3
{
  id v4;
  NFPeerPaymentEnrollmentResponse *v5;
  uint64_t v6;
  NSData *prePeerPaymentCertificate;
  uint64_t v8;
  NSDictionary *certificate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFPeerPaymentEnrollmentResponse;
  v5 = -[NFPeerPaymentEnrollmentResponse init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("paymentCertificate"));
    v6 = objc_claimAutoreleasedReturnValue();
    prePeerPaymentCertificate = v5->_prePeerPaymentCertificate;
    v5->_prePeerPaymentCertificate = (NSData *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("certificates"));
    v8 = objc_claimAutoreleasedReturnValue();
    certificate = v5->_certificate;
    v5->_certificate = (NSDictionary *)v8;

  }
  return v5;
}

- (NFPeerPaymentEnrollmentResponse)initWithCoder:(id)a3
{
  id v4;
  NFPeerPaymentEnrollmentResponse *v5;
  uint64_t v6;
  NSData *prePeerPaymentCertificate;
  uint64_t v8;
  NSDictionary *certificate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NFPeerPaymentEnrollmentResponse;
  v5 = -[NFPeerPaymentEnrollmentResponse init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentCertificate"));
    v6 = objc_claimAutoreleasedReturnValue();
    prePeerPaymentCertificate = v5->_prePeerPaymentCertificate;
    v5->_prePeerPaymentCertificate = (NSData *)v6;

    objc_msgSend(MEMORY[0x1E0DE78C0], "coder:decodeDictOfClass:forKey:", v4, objc_opt_class(), CFSTR("certificates"));
    v8 = objc_claimAutoreleasedReturnValue();
    certificate = v5->_certificate;
    v5->_certificate = (NSDictionary *)v8;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *prePeerPaymentCertificate;
  id v5;

  prePeerPaymentCertificate = self->_prePeerPaymentCertificate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", prePeerPaymentCertificate, CFSTR("paymentCertificate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_certificate, CFSTR("certificates"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)prePeerPaymentCertificate
{
  return self->_prePeerPaymentCertificate;
}

- (NSDictionary)certificate
{
  return self->_certificate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_prePeerPaymentCertificate, 0);
}

@end
