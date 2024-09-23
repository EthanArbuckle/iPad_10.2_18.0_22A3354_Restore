@implementation ULServiceInteractionResponse

- (ULServiceDescriptor)serviceDescriptor
{
  return self->_serviceDescriptor;
}

- (void)setServiceDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDescriptor, a3);
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
  objc_storeStrong((id *)&self->_serviceDescriptor, 0);
}

@end
