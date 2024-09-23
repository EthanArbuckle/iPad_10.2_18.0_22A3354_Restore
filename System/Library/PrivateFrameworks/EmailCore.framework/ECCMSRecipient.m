@implementation ECCMSRecipient

- (ECCMSRecipient)initWithAddress:(id)a3 certificate:(__SecCertificate *)a4 capabilities:(id)a5
{
  id v8;
  id v9;
  ECCMSRecipient *v10;
  uint64_t v11;
  NSString *address;
  uint64_t v13;
  NSArray *capabilities;
  objc_super v16;

  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ECCMSRecipient;
  v10 = -[ECCMSRecipient init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    address = v10->_address;
    v10->_address = (NSString *)v11;

    v10->_certificate = a4;
    CFRetain(a4);
    v13 = objc_msgSend(v9, "copy");
    capabilities = v10->_capabilities;
    v10->_capabilities = (NSArray *)v13;

  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_certificate);
  v3.receiver = self;
  v3.super_class = (Class)ECCMSRecipient;
  -[ECCMSRecipient dealloc](&v3, sel_dealloc);
}

- (NSString)address
{
  return self->_address;
}

- (__SecCertificate)certificate
{
  return self->_certificate;
}

- (NSArray)capabilities
{
  return self->_capabilities;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilities, 0);
  objc_storeStrong((id *)&self->_address, 0);
}

@end
