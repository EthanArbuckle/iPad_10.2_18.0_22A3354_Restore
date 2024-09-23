@implementation MSCMSIdentifier

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issuerNameData, 0);
  objc_storeStrong((id *)&self->_serialNumberData, 0);
  objc_storeStrong((id *)&self->_skidData, 0);
}

- (int)type
{
  return self->_type;
}

+ (id)decodeIdentifier:(heim_base_data *)a3 error:(id *)a4
{
  void *v6;
  int v7;
  __CFString *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;

  if (a4 && *a4)
    v6 = (void *)objc_msgSend(*a4, "copy");
  else
    v6 = 0;
  v7 = decode_CMSIdentifier();
  if (v7)
  {
    v8 = MSErrorASN1Domain[0];
    v10 = v7;
    v9 = CFSTR("unable to decode CMS Identifier");
  }
  else
  {
    v8 = MSErrorASN1Domain[0];
    if (a3->var0)
    {
      v9 = CFSTR("unable to decode CMS Identifier");
      v10 = 1859794442;
    }
    else
    {
      v9 = CFSTR("invalid CMS Identifier choice");
      v10 = 0;
    }
  }
  +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v8, v10, v6, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && v11)
    *a4 = objc_retainAutorelease(v11);
  free_CMSIdentifier();

  return 0;
}

- (MSCMSIdentifier)initWithIssuerName:(id)a3 serialNumber:(id)a4 negativeNumber:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  MSCMSIdentifier *v10;
  MSCMSIdentifier *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  objc_super v17;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MSCMSIdentifier;
  v10 = -[MSCMSIdentifier init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    -[MSCMSIdentifier setType:](v10, "setType:", 1);
    -[MSCMSIdentifier setIssuerNameData:](v11, "setIssuerNameData:", v8);
    -[MSCMSIdentifier setSerialNumberData:](v11, "setSerialNumberData:", v9);
    -[MSCMSIdentifier setIssuerAndSerialNumber:](v11, "setIssuerAndSerialNumber:", &_iAndSN);
    -[MSCMSIdentifier issuerNameData](v11, "issuerNameData");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    qword_1ED58C638 = objc_msgSend(v12, "bytes");

    -[MSCMSIdentifier issuerNameData](v11, "issuerNameData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _iAndSN = objc_msgSend(v13, "length");

    -[MSCMSIdentifier serialNumberData](v11, "serialNumberData");
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    qword_1ED58C648 = objc_msgSend(v14, "bytes");

    -[MSCMSIdentifier serialNumberData](v11, "serialNumberData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    qword_1ED58C640 = objc_msgSend(v15, "length");

    dword_1ED58C650 = v5;
  }

  return v11;
}

- (NSData)serialNumberData
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (NSData)issuerNameData
{
  return (NSData *)objc_getProperty(self, a2, 48, 1);
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (void)setSerialNumberData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setIssuerNameData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setIssuerAndSerialNumber:(IssuerAndSerialNumber *)a3
{
  self->_issuerAndSerialNumber = a3;
}

- (IssuerAndSerialNumber)issuerAndSerialNumber
{
  return self->_issuerAndSerialNumber;
}

- (MSCMSIdentifier)initWithSkid:(id)a3
{
  id v4;
  MSCMSIdentifier *v5;
  MSCMSIdentifier *v6;
  void *v7;
  id v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MSCMSIdentifier;
  v5 = -[MSCMSIdentifier init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    -[MSCMSIdentifier setType:](v5, "setType:", 2);
    -[MSCMSIdentifier setSkidData:](v6, "setSkidData:", v4);
    -[MSCMSIdentifier setSubjectKeyId:](v6, "setSubjectKeyId:", &_skid);
    -[MSCMSIdentifier skidData](v6, "skidData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _skid = objc_msgSend(v7, "length");

    -[MSCMSIdentifier skidData](v6, "skidData");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    qword_1ED58C628 = objc_msgSend(v8, "bytes");

  }
  return v6;
}

- (MSCMSIdentifier)initWithIssuerName:(id)a3 serialNumber:(id)a4
{
  return -[MSCMSIdentifier initWithIssuerName:serialNumber:negativeNumber:](self, "initWithIssuerName:serialNumber:negativeNumber:", a3, a4, 0);
}

- (id)encodeMessageSecurityObject:(id *)a3
{
  int v5;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  int v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  const __CFString *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  MSCMSIdentifier *v20;
  SEL v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  -[MSCMSIdentifier type](self, "type");
  v5 = -[MSCMSIdentifier type](self, "type");
  if (v5 != 2)
  {
    if (v5 == 1)
    {
      if (-[MSCMSIdentifier issuerAndSerialNumber](self, "issuerAndSerialNumber"))
      {
        -[MSCMSIdentifier issuerAndSerialNumber](self, "issuerAndSerialNumber");
        -[MSCMSIdentifier issuerAndSerialNumber](self, "issuerAndSerialNumber");
        -[MSCMSIdentifier issuerAndSerialNumber](self, "issuerAndSerialNumber");
        -[MSCMSIdentifier issuerAndSerialNumber](self, "issuerAndSerialNumber");
        -[MSCMSIdentifier issuerAndSerialNumber](self, "issuerAndSerialNumber");
        goto LABEL_7;
      }
      v15 = MSErrorCMSDomain[0];
      v14 = CFSTR("CMSIdentifier has inconsistent type and stored values: expected issuerAndSerialNumber");
    }
    else
    {
      v12 = MSErrorCMSDomain[0];
      v13 = -[MSCMSIdentifier type](self, "type");
      v14 = CFSTR("CMSIdentifer has unknown type: %d");
      v22 = v13;
      v15 = v12;
    }
LABEL_11:
    +[MSError MSErrorWithDomain:code:underlyingError:description:](MSError, "MSErrorWithDomain:code:underlyingError:description:", v15, -50, 0, v14, v22);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (!-[MSCMSIdentifier subjectKeyId](self, "subjectKeyId"))
  {
    v15 = MSErrorCMSDomain[0];
    v14 = CFSTR("CMSIdentifier has inconsistent type and stored values: expected subjectKeyId");
    goto LABEL_11;
  }
  -[MSCMSIdentifier subjectKeyId](self, "subjectKeyId");
  -[MSCMSIdentifier subjectKeyId](self, "subjectKeyId");
LABEL_7:
  v6 = length_CMSIdentifier();
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v11 = 12;
    goto LABEL_13;
  }
  v8 = objc_retainAutorelease(v7);
  objc_msgSend(v8, "mutableBytes");
  v9 = encode_CMSIdentifier();
  if (v9)
  {
    v10 = v9;

    v11 = v10;
LABEL_13:
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0CB2D50];
    v24[0] = CFSTR("Failed encoding type CMSIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.HeimASN1"), v11, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
    v8 = 0;
    if (a3)
      goto LABEL_15;
    goto LABEL_17;
  }
  if (!v6)
  {
    v16 = 0;
    if (a3)
    {
LABEL_15:
      if (v16)
        *a3 = objc_retainAutorelease(v16);
    }
LABEL_17:

    return v8;
  }
  v20 = (MSCMSIdentifier *)asn1_abort();
  return -[MSCMSIdentifier subjectKeyId](v20, v21);
}

- (heim_base_data)subjectKeyId
{
  return self->_subjectKeyId;
}

- (void)setSubjectKeyId:(heim_base_data *)a3
{
  self->_subjectKeyId = a3;
}

- (NSData)skidData
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSkidData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

@end
