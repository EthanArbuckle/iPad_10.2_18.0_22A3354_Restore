@implementation HMFNetAddressInternal

- (id)dataUsingEncoding:(unint64_t)a3
{
  return 0;
}

- (unint64_t)addressFamily
{
  return self->_addressFamily;
}

- (NSString)addressString
{
  return self->_addressString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressString, 0);
}

@end
