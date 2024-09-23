@implementation CPLProxyLibraryManagerOutstandingInvocation

- (id)description
{
  const char *v2;
  const char *v3;
  const char *v4;

  v2 = "";
  if (self->_didStart)
    v3 = " didStart";
  else
    v3 = "";
  v4 = " didProgress";
  if (self->_progress <= 0.0)
    v4 = "";
  if (self->_didFinish)
    v2 = " didFinish";
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[outsanding%s%s%s]"), v3, v4, v2);
}

- (BOOL)isInMemoryRequest
{
  return self->_inMemoryRequest;
}

- (void)setInMemoryRequest:(BOOL)a3
{
  self->_inMemoryRequest = a3;
}

- (BOOL)didStart
{
  return self->_didStart;
}

- (void)setDidStart:(BOOL)a3
{
  self->_didStart = a3;
}

- (float)progress
{
  return self->_progress;
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
}

- (BOOL)didFinish
{
  return self->_didFinish;
}

- (void)setDidFinish:(BOOL)a3
{
  self->_didFinish = a3;
}

- (NSError)finalError
{
  return self->_finalError;
}

- (void)setFinalError:(id)a3
{
  objc_storeStrong((id *)&self->_finalError, a3);
}

- (CPLResource)finalResource
{
  return self->_finalResource;
}

- (void)setFinalResource:(id)a3
{
  objc_storeStrong((id *)&self->_finalResource, a3);
}

- (NSData)finalData
{
  return self->_finalData;
}

- (void)setFinalData:(id)a3
{
  objc_storeStrong((id *)&self->_finalData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalData, 0);
  objc_storeStrong((id *)&self->_finalResource, 0);
  objc_storeStrong((id *)&self->_finalError, 0);
}

@end
