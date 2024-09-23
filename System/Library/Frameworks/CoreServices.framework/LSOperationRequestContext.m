@implementation LSOperationRequestContext

- (NSNumber)targetUserID
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTargetUserID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetUserID, 0);
}

@end
