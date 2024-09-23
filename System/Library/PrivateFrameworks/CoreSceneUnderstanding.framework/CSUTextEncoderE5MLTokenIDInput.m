@implementation CSUTextEncoderE5MLTokenIDInput

- (NSNumber)tokenID
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void)setTokenID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenID, 0);
}

@end
