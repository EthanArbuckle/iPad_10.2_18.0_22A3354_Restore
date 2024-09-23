@implementation VNFingerprintHash

- (NSData)BOOLeanBytesData
{
  NSData *BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS;
  NSData *v4;
  _BYTE *v5;
  uint64_t v6;
  id v7;
  BOOL *v8;
  int v9;
  BOOL v10;
  id v11;
  id v12;
  NSData *v13;
  NSData *v14;
  NSData *v15;

  BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS = self->_BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS;
  if (BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS)
    goto LABEL_14;
  v4 = objc_retainAutorelease(self->_hashData_DO_NOT_DIRECTLY_ACCESS);
  v5 = -[NSData bytes](v4, "bytes");
  if (v5)
  {
    v6 = 8 * -[NSData length](v4, "length");
    v7 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v6));
    v8 = (BOOL *)objc_msgSend(v7, "mutableBytes");
    if (v8)
    {
      if (v6)
      {
        LOBYTE(v9) = 0x80;
        do
        {
          v10 = (v9 & *v5) != 0;
          v9 = v9 >> 1;
          *v8++ = v10;
          if (!v9)
          {
            ++v5;
            LOBYTE(v9) = 0x80;
          }
          --v6;
        }
        while (v6);
      }
      v5 = v7;
    }
    else
    {
      +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      v5 = 0;
    }

  }
  else
  {
    +[VNError errorForInvalidArgumentWithLocalizedDescription:](VNError, "errorForInvalidArgumentWithLocalizedDescription:", CFSTR("bit data must not be nil"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  v13 = (NSData *)objc_msgSend(v5, "copy");
  v14 = self->_BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS;
  self->_BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS = v13;

  BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS = self->_BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS;
  if (BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS)
  {
LABEL_14:
    v15 = BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v15 = (NSData *)objc_claimAutoreleasedReturnValue();
  }
  return v15;
}

- (NSData)hashData
{
  NSData *hashData_DO_NOT_DIRECTLY_ACCESS;
  NSData *v4;
  unint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  unsigned __int8 *v10;
  _BYTE *v11;
  unsigned int v12;
  char v14;
  NSData *v15;
  NSData *v16;
  NSData *v17;

  hashData_DO_NOT_DIRECTLY_ACCESS = self->_hashData_DO_NOT_DIRECTLY_ACCESS;
  if (hashData_DO_NOT_DIRECTLY_ACCESS)
    goto LABEL_17;
  v4 = self->_BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS;
  v5 = -[NSData length](v4, "length");
  if ((v5 & 7) != 0)
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Cannot encode BOOLean byte data of length %lu because it is not a multiple of 8."), v5);
    +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:
    v8 = v7;
    v9 = 0;
    goto LABEL_16;
  }
  v10 = -[NSData bytes](objc_retainAutorelease(v4), "bytes");
  v6 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v5 >> 3));
  v11 = (_BYTE *)objc_msgSend(v6, "mutableBytes");
  if (!v11)
  {
    +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_4;
  }
  if (v5)
  {
    v12 = 128;
    do
    {
      if (*v10++)
        v14 = *v11 | v12;
      else
        v14 = *v11 & ~(_BYTE)v12;
      *v11 = v14;
      if (v12 >= 2)
      {
        v12 >>= 1;
      }
      else
      {
        ++v11;
        v12 = 128;
      }
      --v5;
    }
    while (v5);
  }
  v9 = (void *)objc_msgSend(v6, "copy");
LABEL_16:

  v15 = (NSData *)objc_msgSend(v9, "copy");
  v16 = self->_hashData_DO_NOT_DIRECTLY_ACCESS;
  self->_hashData_DO_NOT_DIRECTLY_ACCESS = v15;

  hashData_DO_NOT_DIRECTLY_ACCESS = self->_hashData_DO_NOT_DIRECTLY_ACCESS;
  if (!hashData_DO_NOT_DIRECTLY_ACCESS)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v17 = (NSData *)objc_claimAutoreleasedReturnValue();
    return v17;
  }
LABEL_17:
  v17 = hashData_DO_NOT_DIRECTLY_ACCESS;
  return v17;
}

- (NSString)hashString
{
  void *v2;
  uint64_t v3;
  id v4;
  unsigned __int8 *v5;
  void *i;
  unsigned int v7;

  -[VNFingerprintHash hashData](self, "hashData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");
  v4 = objc_retainAutorelease(v2);
  v5 = (unsigned __int8 *)objc_msgSend(v4, "bytes");
  for (i = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 2 * v3); v3; --v3)
  {
    v7 = *v5++;
    objc_msgSend(i, "appendFormat:", CFSTR("%02X"), v7);
  }

  return (NSString *)i;
}

- (VNFingerprintHash)initWithBooleanBytes:(const char *)a3 length:(unint64_t)a4
{
  void *v5;
  VNFingerprintHash *v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3, a4);
  v6 = -[VNFingerprintHash initWithBooleanBytesData:](self, "initWithBooleanBytesData:", v5);

  return v6;
}

- (VNFingerprintHash)initWithBooleanBytesData:(id)a3
{
  id v4;
  VNFingerprintHash *v5;
  uint64_t v6;
  NSData *BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNFingerprintHash;
  v5 = -[VNFingerprintHash init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS = v5->_BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS;
    v5->_BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS = (NSData *)v6;

  }
  return v5;
}

- (VNFingerprintHash)initWithHashData:(id)a3
{
  id v4;
  VNFingerprintHash *v5;
  uint64_t v6;
  NSData *hashData_DO_NOT_DIRECTLY_ACCESS;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VNFingerprintHash;
  v5 = -[VNFingerprintHash init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    hashData_DO_NOT_DIRECTLY_ACCESS = v5->_hashData_DO_NOT_DIRECTLY_ACCESS;
    v5->_hashData_DO_NOT_DIRECTLY_ACCESS = (NSData *)v6;

  }
  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[VNFingerprintHash hashData](self, "hashData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  VNFingerprintHash *v4;
  VNFingerprintHash *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (VNFingerprintHash *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VNFingerprintHash hashData](self, "hashData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VNFingerprintHash hashData](v5, "hashData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VNFingerprintHash hashData](self, "hashData");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bits"));

}

- (VNFingerprintHash)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  VNFingerprintHash *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bits"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[VNFingerprintHash initWithHashData:](self, "initWithHashData:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashData_DO_NOT_DIRECTLY_ACCESS, 0);
  objc_storeStrong((id *)&self->_BOOLeanBytesData_DO_NOT_DIRECTLY_ACCESS, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
