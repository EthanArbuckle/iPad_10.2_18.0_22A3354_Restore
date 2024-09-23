@implementation AMSAbsintheSignature

- (NSString)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
}

- (NSString)servKey
{
  return self->_servKey;
}

- (void)setServKey:(id)a3
{
  objc_storeStrong((id *)&self->_servKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_servKey, 0);
  objc_storeStrong((id *)&self->_signature, 0);
}

@end
