@implementation IEResponse

- (NSString)response_id
{
  return self->_response_id;
}

- (void)setResponse_id:(id)a3
{
  objc_storeStrong((id *)&self->_response_id, a3);
}

- (NSString)inputGroupId
{
  return self->_inputGroupId;
}

- (void)setInputGroupId:(id)a3
{
  objc_storeStrong((id *)&self->_inputGroupId, a3);
}

- (BOOL)sensitiveData
{
  return self->_sensitiveData;
}

- (void)setSensitiveData:(BOOL)a3
{
  self->_sensitiveData = a3;
}

- (NSString)dialogPhase
{
  return self->_dialogPhase;
}

- (void)setDialogPhase:(id)a3
{
  objc_storeStrong((id *)&self->_dialogPhase, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogPhase, 0);
  objc_storeStrong((id *)&self->_inputGroupId, 0);
  objc_storeStrong((id *)&self->_response_id, 0);
}

@end
