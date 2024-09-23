@implementation IDSCTPNRResponseData

- (IDSCTPNRResponseData)initWithCTResponse:(id)a3 phoneBookNumber:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  IDSCTPNRResponseData *v9;
  double v10;
  uint64_t v11;
  NSString *phoneNumber;
  const char *v13;
  double v14;
  uint64_t v15;
  NSData *signature;
  const char *v17;
  double v18;
  uint64_t v19;
  NSString *status;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)IDSCTPNRResponseData;
  v9 = -[IDSCTPNRResponseData init](&v22, sel_init);
  if (v9)
  {
    objc_msgSend_objectForKeyedSubscript_(v6, v8, *MEMORY[0x1E0CA7498], v10);
    v11 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v9->_phoneNumber;
    v9->_phoneNumber = (NSString *)v11;

    objc_storeStrong((id *)&v9->_phoneBookNumber, a4);
    objc_msgSend_objectForKeyedSubscript_(v6, v13, *MEMORY[0x1E0CA74B0], v14);
    v15 = objc_claimAutoreleasedReturnValue();
    signature = v9->_signature;
    v9->_signature = (NSData *)v15;

    objc_msgSend_objectForKeyedSubscript_(v6, v17, *MEMORY[0x1E0CA74A0], v18);
    v19 = objc_claimAutoreleasedReturnValue();
    status = v9->_status;
    v9->_status = (NSString *)v19;

    v9->_success = CFEqual((CFTypeRef)*MEMORY[0x1E0CA74A8], v9->_status) != 0;
  }

  return v9;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (NSString)phoneBookNumber
{
  return self->_phoneBookNumber;
}

- (void)setPhoneBookNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneBookNumber, a3);
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
}

- (BOOL)success
{
  return self->_success;
}

- (void)setSuccess:(BOOL)a3
{
  self->_success = a3;
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_phoneBookNumber, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
}

@end
