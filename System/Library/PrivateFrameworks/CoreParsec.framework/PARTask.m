@implementation PARTask

- (void)resume
{
  id v3;

  -[PARTask session](self, "session");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadTask:", self);

}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (PARSession)session
{
  return (PARSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setSession:(id)a3
{
  objc_storeWeak((id *)&self->_session, a3);
}

- (unint64_t)queryId
{
  return self->_queryId;
}

- (void)setQueryId:(unint64_t)a3
{
  self->_queryId = a3;
}

- (PARRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
