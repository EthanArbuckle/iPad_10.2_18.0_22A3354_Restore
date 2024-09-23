@implementation BSBrandMessagingDetails

- (NSString)localizedResponseTime
{
  if (self)
    self = (BSBrandMessagingDetails *)self->_shim;
  return -[BSBrandMessagingDetails localizedResponseTime](self, "localizedResponseTime");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shim, 0);
}

@end
