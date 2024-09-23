@implementation ANSenderContext

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ANSenderContext isValidDevice](self, "isValidDevice"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ANSenderContext senderCorrelationIdentifier](self, "senderCorrelationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Valid Device = %@, Sender Corr. ID = %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)senderCorrelationIdentifier
{
  return self->_senderCorrelationIdentifier;
}

- (void)setSenderCorrelationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_senderCorrelationIdentifier, a3);
}

- (BOOL)isValidDevice
{
  return self->_isValidDevice;
}

- (void)setIsValidDevice:(BOOL)a3
{
  self->_isValidDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderCorrelationIdentifier, 0);
}

@end
