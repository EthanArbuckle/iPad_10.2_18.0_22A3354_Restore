@implementation MTRGeneralDiagnosticsClusterNetworkInterface

- (MTRGeneralDiagnosticsClusterNetworkInterface)init
{
  MTRGeneralDiagnosticsClusterNetworkInterface *v2;
  MTRGeneralDiagnosticsClusterNetworkInterface *v3;
  NSString *name;
  NSNumber *isOperational;
  NSNumber *offPremiseServicesReachableIPv4;
  NSNumber *offPremiseServicesReachableIPv6;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  NSData *hardwareAddress;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  NSArray *iPv4Addresses;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *iPv6Addresses;
  NSNumber *type;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)MTRGeneralDiagnosticsClusterNetworkInterface;
  v2 = -[MTRGeneralDiagnosticsClusterNetworkInterface init](&v22, sel_init);
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)&stru_2505249E8;

    isOperational = v3->_isOperational;
    v3->_isOperational = (NSNumber *)&unk_250591B18;

    offPremiseServicesReachableIPv4 = v3->_offPremiseServicesReachableIPv4;
    v3->_offPremiseServicesReachableIPv4 = 0;

    offPremiseServicesReachableIPv6 = v3->_offPremiseServicesReachableIPv6;
    v3->_offPremiseServicesReachableIPv6 = 0;

    objc_msgSend_data(MEMORY[0x24BDBCE50], v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    hardwareAddress = v3->_hardwareAddress;
    v3->_hardwareAddress = (NSData *)v10;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v12, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    iPv4Addresses = v3->_iPv4Addresses;
    v3->_iPv4Addresses = (NSArray *)v14;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    iPv6Addresses = v3->_iPv6Addresses;
    v3->_iPv6Addresses = (NSArray *)v18;

    type = v3->_type;
    v3->_type = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRGeneralDiagnosticsClusterNetworkInterface *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  const char *v33;
  uint64_t v34;
  void *v35;
  const char *v36;

  v4 = objc_alloc_init(MTRGeneralDiagnosticsClusterNetworkInterface);
  objc_msgSend_name(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v4, v8, (uint64_t)v7);

  objc_msgSend_isOperational(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIsOperational_(v4, v12, (uint64_t)v11);

  objc_msgSend_offPremiseServicesReachableIPv4(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOffPremiseServicesReachableIPv4_(v4, v16, (uint64_t)v15);

  objc_msgSend_offPremiseServicesReachableIPv6(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOffPremiseServicesReachableIPv6_(v4, v20, (uint64_t)v19);

  objc_msgSend_hardwareAddress(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setHardwareAddress_(v4, v24, (uint64_t)v23);

  objc_msgSend_iPv4Addresses(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIPv4Addresses_(v4, v28, (uint64_t)v27);

  objc_msgSend_iPv6Addresses(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIPv6Addresses_(v4, v32, (uint64_t)v31);

  objc_msgSend_type(self, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setType_(v4, v36, (uint64_t)v35);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSString *name;
  NSNumber *isOperational;
  NSNumber *offPremiseServicesReachableIPv4;
  NSNumber *offPremiseServicesReachableIPv6;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  name = self->_name;
  isOperational = self->_isOperational;
  offPremiseServicesReachableIPv4 = self->_offPremiseServicesReachableIPv4;
  offPremiseServicesReachableIPv6 = self->_offPremiseServicesReachableIPv6;
  objc_msgSend_base64EncodedStringWithOptions_(self->_hardwareAddress, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v12, (uint64_t)CFSTR("<%@: name:%@; isOperational:%@; offPremiseServicesReachableIPv4:%@; offPremiseServicesReachableIPv6:%@; hardwareAddress:%@; iPv4Addresses:%@; iPv6Addresses:%@; type:%@; >"),
    v5,
    name,
    isOperational,
    offPremiseServicesReachableIPv4,
    offPremiseServicesReachableIPv6,
    v11,
    self->_iPv4Addresses,
    self->_iPv6Addresses,
    self->_type);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 8);
}

- (NSNumber)isOperational
{
  return self->_isOperational;
}

- (void)setIsOperational:(NSNumber *)isOperational
{
  objc_setProperty_nonatomic_copy(self, a2, isOperational, 16);
}

- (NSNumber)offPremiseServicesReachableIPv4
{
  return self->_offPremiseServicesReachableIPv4;
}

- (void)setOffPremiseServicesReachableIPv4:(NSNumber *)offPremiseServicesReachableIPv4
{
  objc_setProperty_nonatomic_copy(self, a2, offPremiseServicesReachableIPv4, 24);
}

- (NSNumber)offPremiseServicesReachableIPv6
{
  return self->_offPremiseServicesReachableIPv6;
}

- (void)setOffPremiseServicesReachableIPv6:(NSNumber *)offPremiseServicesReachableIPv6
{
  objc_setProperty_nonatomic_copy(self, a2, offPremiseServicesReachableIPv6, 32);
}

- (NSData)hardwareAddress
{
  return self->_hardwareAddress;
}

- (void)setHardwareAddress:(NSData *)hardwareAddress
{
  objc_setProperty_nonatomic_copy(self, a2, hardwareAddress, 40);
}

- (NSArray)iPv4Addresses
{
  return self->_iPv4Addresses;
}

- (void)setIPv4Addresses:(NSArray *)iPv4Addresses
{
  objc_setProperty_nonatomic_copy(self, a2, iPv4Addresses, 48);
}

- (NSArray)iPv6Addresses
{
  return self->_iPv6Addresses;
}

- (void)setIPv6Addresses:(NSArray *)iPv6Addresses
{
  objc_setProperty_nonatomic_copy(self, a2, iPv6Addresses, 56);
}

- (NSNumber)type
{
  return self->_type;
}

- (void)setType:(NSNumber *)type
{
  objc_setProperty_nonatomic_copy(self, a2, type, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_iPv6Addresses, 0);
  objc_storeStrong((id *)&self->_iPv4Addresses, 0);
  objc_storeStrong((id *)&self->_hardwareAddress, 0);
  objc_storeStrong((id *)&self->_offPremiseServicesReachableIPv6, 0);
  objc_storeStrong((id *)&self->_offPremiseServicesReachableIPv4, 0);
  objc_storeStrong((id *)&self->_isOperational, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
