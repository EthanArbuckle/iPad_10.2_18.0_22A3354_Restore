@implementation DAAccountExternalIdentificationInfo

- (DAAccountExternalIdentificationInfo)initWithHost:(id)a3 port:(int64_t)a4 useSSL:(BOOL)a5 ownerAddresses:(id)a6 preferredOwnerAddress:(id)a7
{
  id v12;
  id v13;
  id v14;
  DAAccountExternalIdentificationInfo *v15;
  uint64_t v16;
  NSString *host;
  uint64_t v18;
  NSArray *ownerAddresses;
  uint64_t v20;
  NSString *preferredOwnerAddress;
  objc_super v23;

  v12 = a3;
  v13 = a6;
  v14 = a7;
  v23.receiver = self;
  v23.super_class = (Class)DAAccountExternalIdentificationInfo;
  v15 = -[DAAccountExternalIdentificationInfo init](&v23, sel_init);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    host = v15->_host;
    v15->_host = (NSString *)v16;

    v15->_port = a4;
    v15->_useSSL = a5;
    v18 = objc_msgSend(v13, "copy");
    ownerAddresses = v15->_ownerAddresses;
    v15->_ownerAddresses = (NSArray *)v18;

    v20 = objc_msgSend(v14, "copy");
    preferredOwnerAddress = v15->_preferredOwnerAddress;
    v15->_preferredOwnerAddress = (NSString *)v20;

  }
  return v15;
}

- (NSString)host
{
  return self->_host;
}

- (int64_t)port
{
  return self->_port;
}

- (BOOL)useSSL
{
  return self->_useSSL;
}

- (NSArray)ownerAddresses
{
  return self->_ownerAddresses;
}

- (NSString)preferredOwnerAddress
{
  return self->_preferredOwnerAddress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredOwnerAddress, 0);
  objc_storeStrong((id *)&self->_ownerAddresses, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end
