@implementation DAOofSettingsInfo

- (NSString)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_requestID, a3);
}

- (DAOofResponseDelegate)consumer
{
  return (DAOofResponseDelegate *)objc_loadWeakRetained((id *)&self->_consumer);
}

- (void)setConsumer:(id)a3
{
  objc_storeWeak((id *)&self->_consumer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_consumer);
  objc_storeStrong((id *)&self->_requestID, 0);
}

@end
