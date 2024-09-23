@implementation NEIKEv2Identifier

- (id)copyShortDescription
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_msgSend((id)objc_opt_class(), "copyTypeDescription");
  if (-[NEIKEv2Identifier identifierType](self, "identifierType") == 13)
  {
    v4 = v3;
  }
  else
  {
    -[NEIKEv2Identifier stringValue](self, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[NEIKEv2Identifier identifierData](self, "identifierData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "base64EncodedStringWithOptions:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:%@"), v3, v5);

  }
  return v4;
}

- (unint64_t)identifierType
{
  return 0;
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = *(_QWORD *)&a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  v8 = (void *)objc_msgSend((id)objc_opt_class(), "copyTypeDescription");
  objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v8, CFSTR("Payload Type"), v5, a4);

  if (-[NEIKEv2Identifier identifierType](self, "identifierType") != 13)
  {
    -[NEIKEv2Identifier stringValue](self, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      -[NEIKEv2Identifier identifierData](self, "identifierData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "base64EncodedStringWithOptions:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v7, "appendPrettyObject:withName:andIndent:options:", v9, CFSTR("Value"), v5, a4);

  }
  return v7;
}

- (id)description
{
  return -[NEIKEv2Identifier descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)objc_opt_class();
  v6 = -[NEIKEv2Identifier identifierType](self, "identifierType");
  -[NEIKEv2Identifier identifierData](self, "identifierData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  v9 = (void *)objc_msgSend(v5, "createIdentifierWithType:data:zone:", v6, v8, a3);

  return v9;
}

- (NSString)stringValue
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[NEIKEv2Identifier identifierData](self, "identifierData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithData:encoding:", v4, 4);

  return (NSString *)v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[NEIKEv2Identifier identifierData](self, "identifierData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[NEIKEv2Identifier identifierType](self, "identifierType") + v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = -[NEIKEv2Identifier identifierType](self, "identifierType");
    if (v6 == objc_msgSend(v5, "identifierType"))
    {
      -[NEIKEv2Identifier identifierData](self, "identifierData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifierData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSData)identifierData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifierData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifierData, 0);
}

+ (id)copyTypeDescription
{
  return CFSTR("Invalid");
}

+ (id)createIdentifierWithType:(unint64_t)a3 data:(id)a4 zone:(_NSZone *)a5
{
  id v7;
  void *v8;
  char *v9;
  void *v10;
  uint64_t v11;
  NEIKEv2FQDNIdentifier *v12;
  NSObject *v13;
  NEIKEv2AddressIdentifier *v14;
  NSObject *v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  NEIKEv2ASN1DNIdentifier *v19;
  NEIKEv2UserFQDNIdentifier *v20;
  void *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = v7;
  switch(a3)
  {
    case 1uLL:
      if (objc_msgSend(v7, "length", 0, 0) == 4)
      {
        LOWORD(v23) = 528;
        v9 = (char *)&v23 + 4;
        v10 = v8;
        v11 = 4;
        goto LABEL_11;
      }
      ne_log_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_20;
      goto LABEL_27;
    case 2uLL:
      v12 = +[NEIKEv2FQDNIdentifier allocWithZone:](NEIKEv2FQDNIdentifier, "allocWithZone:", a5);
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
      v14 = -[NEIKEv2FQDNIdentifier initWithFQDN:](v12, "initWithFQDN:", v13);
      goto LABEL_12;
    case 3uLL:
      v20 = +[NEIKEv2UserFQDNIdentifier allocWithZone:](NEIKEv2UserFQDNIdentifier, "allocWithZone:", a5);
      v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v8, 4);
      v14 = -[NEIKEv2UserFQDNIdentifier initWithUserFQDN:](v20, "initWithUserFQDN:", v13);
      goto LABEL_12;
    case 5uLL:
      LODWORD(v25) = 0;
      if (objc_msgSend(v7, "length", 0, 0, 0, v25) == 16)
      {
        LOWORD(v23) = 7708;
        v9 = (char *)&v24;
        v10 = v8;
        v11 = 16;
LABEL_11:
        objc_msgSend(v10, "getBytes:length:", v9, v11, v23);
        objc_msgSend(MEMORY[0x1E0CCEC58], "endpointWithAddress:", &v23);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = -[NEIKEv2AddressIdentifier initWithAddress:](+[NEIKEv2AddressIdentifier allocWithZone:](NEIKEv2AddressIdentifier, "allocWithZone:", a5), "initWithAddress:", v13);
LABEL_12:
        v21 = v14;
      }
      else
      {
        ne_log_obj();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
LABEL_27:
          *(_DWORD *)buf = 67109120;
          v27 = objc_msgSend(v8, "length");
          _os_log_error_impl(&dword_19BD16000, v13, OS_LOG_TYPE_ERROR, "Invalid address length %u", buf, 8u);
        }
LABEL_20:
        v21 = 0;
      }

      goto LABEL_24;
    case 9uLL:
      v19 = -[NEIKEv2ASN1DNIdentifier initWithData:](+[NEIKEv2ASN1DNIdentifier allocWithZone:](NEIKEv2ASN1DNIdentifier, "allocWithZone:", a5), "initWithData:", v7);
      goto LABEL_23;
    case 0xBuLL:
      v19 = -[NEIKEv2KeyIDIdentifier initWithKeyID:](+[NEIKEv2KeyIDIdentifier allocWithZone:](NEIKEv2KeyIDIdentifier, "allocWithZone:", a5), "initWithKeyID:", v7);
      goto LABEL_23;
    case 0xDuLL:
      if (objc_msgSend(v7, "length"))
      {
        ne_log_obj();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          LOWORD(v23) = 0;
          v16 = "NULL identifier should not contain data";
          v17 = v15;
          v18 = 2;
LABEL_26:
          _os_log_error_impl(&dword_19BD16000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v23, v18);
        }
LABEL_16:

        v21 = 0;
      }
      else
      {
        v19 = -[NEIKEv2NULLIdentifier init](+[NEIKEv2NULLIdentifier allocWithZone:](NEIKEv2NULLIdentifier, "allocWithZone:", a5), "init");
LABEL_23:
        v21 = v19;
      }
LABEL_24:

      return v21;
    default:
      ne_log_obj();
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        goto LABEL_16;
      LODWORD(v23) = 67109120;
      HIDWORD(v23) = a3;
      v16 = "Unknown identifier type %u";
      v17 = v15;
      v18 = 8;
      goto LABEL_26;
  }
}

+ (id)createIdentifierWithType:(unint64_t)a3 data:(id)a4
{
  return (id)objc_msgSend(a1, "createIdentifierWithType:data:zone:", a3, a4, 0);
}

@end
