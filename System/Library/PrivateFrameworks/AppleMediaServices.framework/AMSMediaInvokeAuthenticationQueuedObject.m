@implementation AMSMediaInvokeAuthenticationQueuedObject

- (NSURLResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (AMSURLTaskInfo)taskInfo
{
  return self->_taskInfo;
}

- (void)setTaskInfo:(id)a3
{
  objc_storeStrong((id *)&self->_taskInfo, a3);
}

- (AMSMutablePromise)pendingPromise
{
  return self->_pendingPromise;
}

- (void)setPendingPromise:(id)a3
{
  objc_storeStrong((id *)&self->_pendingPromise, a3);
}

- (BOOL)ignoringResult
{
  return self->_ignoringResult;
}

- (void)setIgnoringResult:(BOOL)a3
{
  self->_ignoringResult = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingPromise, 0);
  objc_storeStrong((id *)&self->_taskInfo, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

@end
