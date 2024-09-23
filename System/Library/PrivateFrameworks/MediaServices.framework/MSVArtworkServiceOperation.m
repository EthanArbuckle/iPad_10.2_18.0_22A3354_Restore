@implementation MSVArtworkServiceOperation

- (MSVArtworkServiceOperation)initWithArtworkRequest:(id)a3
{
  id v5;
  MSVArtworkServiceOperation *v6;
  MSVArtworkServiceOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MSVArtworkServiceOperation;
  v6 = -[MSVArtworkServiceOperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_request, a3);

  return v7;
}

- (NSError)operationError
{
  return self->_operationError;
}

- (void)setOperationError:(id)a3
{
  objc_storeStrong((id *)&self->_operationError, a3);
}

- (NSString)debugMessage
{
  return self->_debugMessage;
}

- (void)setDebugMessage:(id)a3
{
  NSString *v4;
  NSString *debugMessage;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  debugMessage = self->_debugMessage;
  self->_debugMessage = v4;

}

- (MSVArtworkServiceRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_debugMessage, 0);
  objc_storeStrong((id *)&self->_operationError, 0);
}

@end
