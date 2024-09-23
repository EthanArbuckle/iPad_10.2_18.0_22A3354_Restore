@implementation EKPersistentChangeStoreInfo

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EKPersistentChangeStoreInfo minConsumedClientIdentifier](self, "minConsumedClientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> {minConsumedClientIdentifier \"%@\"; minConsumedSequenceNumber = %d; secondMinConsumedSequenceNumber = %d}"),
    v4,
    self,
    v5,
    -[EKPersistentChangeStoreInfo minConsumedSequenceNumber](self, "minConsumedSequenceNumber"),
    -[EKPersistentChangeStoreInfo secondMinConsumedSequenceNumber](self, "secondMinConsumedSequenceNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int)minConsumedSequenceNumber
{
  return self->_minConsumedSequenceNumber;
}

- (void)setMinConsumedSequenceNumber:(int)a3
{
  self->_minConsumedSequenceNumber = a3;
}

- (NSString)minConsumedClientIdentifier
{
  return self->_minConsumedClientIdentifier;
}

- (void)setMinConsumedClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_minConsumedClientIdentifier, a3);
}

- (int)secondMinConsumedSequenceNumber
{
  return self->_secondMinConsumedSequenceNumber;
}

- (void)setSecondMinConsumedSequenceNumber:(int)a3
{
  self->_secondMinConsumedSequenceNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minConsumedClientIdentifier, 0);
}

@end
