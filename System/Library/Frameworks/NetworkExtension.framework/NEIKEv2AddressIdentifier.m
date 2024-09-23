@implementation NEIKEv2AddressIdentifier

- (NEIKEv2AddressIdentifier)initWithAddress:(id)a3
{
  id v4;
  NEIKEv2AddressIdentifier *v5;
  const char *v6;
  NEIKEv2AddressIdentifier *v7;
  void *v8;
  NSObject *v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[NEIKEv2AddressIdentifier initWithAddress:]";
      _os_log_fault_impl(&dword_19BD16000, v10, OS_LOG_TYPE_FAULT, "%s called with null address", buf, 0xCu);
    }

    goto LABEL_10;
  }
  v11.receiver = self;
  v11.super_class = (Class)NEIKEv2AddressIdentifier;
  v5 = -[NEIKEv2AddressIdentifier init](&v11, sel_init);
  if (!v5)
  {
    ne_log_obj();
    self = (NEIKEv2AddressIdentifier *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super.super, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19BD16000, &self->super.super, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
LABEL_10:
    v7 = 0;
    goto LABEL_4;
  }
  v7 = v5;
  objc_setProperty_atomic(v5, v6, v4, 16);
  objc_msgSend(v4, "hostname");
  self = (NEIKEv2AddressIdentifier *)objc_claimAutoreleasedReturnValue();
  -[NEIKEv2AddressIdentifier dataUsingEncoding:](self, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NEIKEv2Identifier setIdentifierData:](v7, "setIdentifierData:", v8);

LABEL_4:
  return v7;
}

- (unint64_t)identifierType
{
  void *v3;
  uint64_t v4;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[NEIKEv2AddressIdentifier address](self, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "addressFamily");

  if (v4 == 2)
    return 1;
  -[NEIKEv2AddressIdentifier address](self, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "addressFamily");

  if (v7 == 30)
    return 5;
  ne_log_obj();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    -[NEIKEv2AddressIdentifier address](self, "address");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = 67109120;
    v10[1] = objc_msgSend(v9, "addressFamily");
    _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "Unknown address family %u", (uint8_t *)v10, 8u);

  }
  return 0;
}

- (id)identifierData
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v17;
  _DWORD v18[2];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[NEIKEv2AddressIdentifier address](self, "address");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "addressFamily");

  -[NEIKEv2AddressIdentifier address](self, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == 2)
  {
    v7 = objc_msgSend(v5, "address");

    v8 = objc_alloc(MEMORY[0x1E0C99D50]);
    v9 = v7 + 4;
    v10 = 4;
LABEL_5:
    v14 = (void *)objc_msgSend(v8, "initWithBytes:length:", v9, v10);
    return v14;
  }
  v11 = objc_msgSend(v5, "addressFamily");

  if (v11 == 30)
  {
    -[NEIKEv2AddressIdentifier address](self, "address");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "address");

    v8 = objc_alloc(MEMORY[0x1E0C99D50]);
    v9 = v13 + 8;
    v10 = 16;
    goto LABEL_5;
  }
  ne_log_obj();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    -[NEIKEv2AddressIdentifier address](self, "address");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = 67109120;
    v18[1] = objc_msgSend(v17, "addressFamily");
    _os_log_error_impl(&dword_19BD16000, v15, OS_LOG_TYPE_ERROR, "Unknown address family %u", (uint8_t *)v18, 8u);

  }
  v14 = 0;
  return v14;
}

- (id)stringValue
{
  void *v2;
  void *v3;

  -[NEIKEv2AddressIdentifier address](self, "address");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hostname");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NWAddressEndpoint)address
{
  return (NWAddressEndpoint *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_address, 0);
}

+ (id)copyTypeDescription
{
  return CFSTR("Address");
}

@end
