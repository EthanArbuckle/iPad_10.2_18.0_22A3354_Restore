@implementation IKLoadRecord

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (ISURLOperation)opertaion
{
  return self->_opertaion;
}

- (void)setOpertaion:(id)a3
{
  objc_storeStrong((id *)&self->_opertaion, a3);
}

- (BOOL)loadCompleted
{
  return self->_loadCompleted;
}

- (void)setLoadCompleted:(BOOL)a3
{
  self->_loadCompleted = a3;
}

- (NSString)scriptStr
{
  return self->_scriptStr;
}

- (void)setScriptStr:(id)a3
{
  objc_storeStrong((id *)&self->_scriptStr, a3);
}

- (NSUUID)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_requestID, a3);
}

- (NSURLSessionDataTask)dataTask
{
  return self->_dataTask;
}

- (void)setDataTask:(id)a3
{
  objc_storeStrong((id *)&self->_dataTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataTask, 0);
  objc_storeStrong((id *)&self->_requestID, 0);
  objc_storeStrong((id *)&self->_scriptStr, 0);
  objc_storeStrong((id *)&self->_opertaion, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
