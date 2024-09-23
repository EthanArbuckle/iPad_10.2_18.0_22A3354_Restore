@implementation CVABackgroundRequestImplBase

- (CVAMattingRequest)mattingRequest
{
  return (CVAMattingRequest *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMattingRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mattingRequest, 0);
}

@end
