@implementation NUNICalliopeTextureGroup

- (NSArray)gradients
{
  return self->_gradients;
}

- (void)setGradients:(id)a3
{
  objc_storeStrong((id *)&self->_gradients, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradients, 0);
}

@end
