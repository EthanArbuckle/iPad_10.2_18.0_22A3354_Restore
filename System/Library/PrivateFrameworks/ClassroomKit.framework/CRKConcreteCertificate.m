@implementation CRKConcreteCertificate

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_underlyingCertificate);
  v3.receiver = self;
  v3.super_class = (Class)CRKConcreteCertificate;
  -[CRKConcreteCertificate dealloc](&v3, sel_dealloc);
}

- (CRKConcreteCertificate)initWithCertificate:(__SecCertificate *)a3
{
  CRKConcreteCertificate *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRKConcreteCertificate;
  v4 = -[CRKConcreteCertificate init](&v6, sel_init);
  if (v4)
  {
    CFRetain(a3);
    v4->_underlyingCertificate = a3;
  }
  return v4;
}

+ (id)certificateWithData:(id)a3
{
  SecCertificateRef v4;
  SecCertificateRef v5;
  void *v6;

  v4 = SecCertificateCreateWithData((CFAllocatorRef)*MEMORY[0x24BDBD240], (CFDataRef)a3);
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCertificate:", v4);
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSArray)commonNames
{
  void *v2;
  void *v3;
  NSArray *v4;

  -[CRKConcreteCertificate underlyingCertificate](objc_retainAutorelease(self), "underlyingCertificate");
  v2 = (void *)SecCertificateCopyCommonNames();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1A8];
  v4 = v2;

  return v4;
}

- (NSString)fingerprint
{
  void *v2;
  void *v3;

  -[CRKConcreteCertificate underlyingCertificate](objc_retainAutorelease(self), "underlyingCertificate");
  SecCertificateGetSHA1Digest();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "crk_hexString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDateInterval)validityDateInterval
{
  const __CFAllocator *v2;
  CRKConcreteCertificate *v3;
  CFAbsoluteTime v4;
  CFDateRef v5;
  CFAbsoluteTime v6;
  CFDateRef v7;
  CFDateRef v8;
  BOOL v9;
  void *v10;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = objc_retainAutorelease(self);
  -[CRKConcreteCertificate underlyingCertificate](v3, "underlyingCertificate");
  SecCertificateNotValidBefore();
  v5 = CFDateCreate(v2, v4);
  -[CRKConcreteCertificate underlyingCertificate](objc_retainAutorelease(v3), "underlyingCertificate");
  SecCertificateNotValidAfter();
  v7 = CFDateCreate(v2, v6);
  v8 = v7;
  if (v5)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
    v10 = 0;
  else
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v5, v7);

  return (NSDateInterval *)v10;
}

- (NSData)dataRepresentation
{
  return (NSData *)SecCertificateCopyData(-[CRKConcreteCertificate underlyingCertificate](objc_retainAutorelease(self), "underlyingCertificate"));
}

- (BOOL)isTemporallyValid
{
  void *v2;
  char v3;

  -[CRKConcreteCertificate validityDateInterval](self, "validityDateInterval");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "crk_containsCurrentDate");

  return v3;
}

- (BOOL)isCertificateAuthority
{
  -[CRKConcreteCertificate underlyingCertificate](objc_retainAutorelease(self), "underlyingCertificate");
  return SecCertificateIsCA();
}

- (unsigned)hashingAlgorithm
{
  -[CRKConcreteCertificate underlyingCertificate](objc_retainAutorelease(self), "underlyingCertificate");
  return SecCertificateGetSignatureHashAlgorithm();
}

- (int64_t)keySizeInBits
{
  __SecKey *v2;
  __SecKey *v3;
  size_t BlockSize;
  NSObject *v6;

  v2 = SecCertificateCopyKey(-[CRKConcreteCertificate underlyingCertificate](objc_retainAutorelease(self), "underlyingCertificate"));
  if (v2)
  {
    v3 = v2;
    BlockSize = SecKeyGetBlockSize(v2);
    CFRelease(v3);
    return 8 * BlockSize;
  }
  else
  {
    if (_CRKLogGeneral_onceToken_43 != -1)
      dispatch_once(&_CRKLogGeneral_onceToken_43, &__block_literal_global_118);
    v6 = _CRKLogGeneral_logObj_43;
    if (os_log_type_enabled((os_log_t)_CRKLogGeneral_logObj_43, OS_LOG_TYPE_ERROR))
      -[CRKConcreteCertificate keySizeInBits].cold.1(v6);
    return 0;
  }
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  CRKConcreteCertificate *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v5 = objc_retainAutorelease(self);
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %p { underlyingCertificate = %@ }>"), v4, v5, -[CRKConcreteCertificate underlyingCertificate](v5, "underlyingCertificate"));
}

- (__SecCertificate)underlyingCertificate
{
  return self->_underlyingCertificate;
}

- (void)keySizeInBits
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_218C99000, log, OS_LOG_TYPE_ERROR, "Failed to copy public key from certificate when determining key size", v1, 2u);
}

@end
