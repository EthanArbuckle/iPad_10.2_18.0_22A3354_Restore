@implementation IETestParseError

- (NSString)flowId
{
  return self->_flowId;
}

- (void)setFlowId:(id)a3
{
  objc_storeStrong((id *)&self->_flowId, a3);
}

- (NSString)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_flowId, 0);
}

@end
