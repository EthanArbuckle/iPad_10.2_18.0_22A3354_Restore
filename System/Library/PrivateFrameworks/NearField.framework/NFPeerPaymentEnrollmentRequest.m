@implementation NFPeerPaymentEnrollmentRequest

- (NFPeerPaymentEnrollmentRequest)initWithDictionary:(id)a3
{
  id v4;
  NFPeerPaymentEnrollmentRequest *v5;
  uint64_t v6;
  NSData *alternateDSID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFPeerPaymentEnrollmentRequest;
  v5 = -[NFPeerPaymentEnrollmentRequest init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alternateDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    alternateDSID = v5->_alternateDSID;
    v5->_alternateDSID = (NSData *)v6;

  }
  return v5;
}

- (NFPeerPaymentEnrollmentRequest)initWithCoder:(id)a3
{
  id v4;
  NFPeerPaymentEnrollmentRequest *v5;
  uint64_t v6;
  NSData *alternateDSID;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFPeerPaymentEnrollmentRequest;
  v5 = -[NFPeerPaymentEnrollmentRequest init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("alternateDSID"));
    v6 = objc_claimAutoreleasedReturnValue();
    alternateDSID = v5->_alternateDSID;
    v5->_alternateDSID = (NSData *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_alternateDSID, CFSTR("alternateDSID"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)alternateDSID
{
  return self->_alternateDSID;
}

- (void)setAlternateDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alternateDSID, 0);
}

@end
