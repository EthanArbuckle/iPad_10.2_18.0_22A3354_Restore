@implementation _LSOpenCopierContext

- (int)callbackType
{
  return self->_callbackType;
}

- (void)setCallbackType:(int)a3
{
  self->_callbackType = a3;
}

- (NSURL)destURL
{
  return self->_destURL;
}

- (void)setDestURL:(id)a3
{
  objc_storeStrong((id *)&self->_destURL, a3);
}

- (NSError)error
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
  objc_storeStrong((id *)&self->_destURL, 0);
}

@end
