@implementation EKPersistentChangeStoreRowInfo

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EKPersistentChangeStoreRowInfo clientIdentifier](self, "clientIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> {clientIdentifier \"%@\"; consumedSequenceNumber = %d}"),
    v4,
    self,
    v5,
    -[EKPersistentChangeStoreRowInfo consumedSequenceNumber](self, "consumedSequenceNumber"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (int)consumedSequenceNumber
{
  return self->_consumedSequenceNumber;
}

- (void)setConsumedSequenceNumber:(int)a3
{
  self->_consumedSequenceNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end
