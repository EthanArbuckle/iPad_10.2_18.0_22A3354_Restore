@implementation MTRCertificateInfo

- (MTRCertificateInfo)initWithTLVBytes:(MTRCertificateTLVBytes)bytes
{
  NSData *v4;
  const char *v5;
  uint64_t v6;
  MTRCertificateInfo *v7;
  MTRCertificateInfo *v8;
  NSData *v9;
  NSData *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[3];
  objc_super v19;
  uint64_t v20[2];

  v4 = bytes;
  v19.receiver = self;
  v19.super_class = (Class)MTRCertificateInfo;
  v7 = -[MTRCertificateInfo init](&v19, sel_init);
  if (!v7)
    goto LABEL_5;
  v8 = (MTRCertificateInfo *)objc_msgSend_copy(v4, v5, v6);
  v9 = v7->_bytes;
  v7->_bytes = (NSData *)v8;

  if (v8)
  {
    v10 = objc_retainAutorelease(v7->_bytes);
    v13 = objc_msgSend_bytes(v10, v11, v12);
    v16 = objc_msgSend_length(v10, v14, v15);
    sub_233BF7114(v20, v13, v16);

    sub_2341DB9DC(v20[0], v20[1], (uint64_t)&v7->_data, 0, v18);
    if (LODWORD(v18[0]))
    {
      v8 = 0;
      goto LABEL_6;
    }
LABEL_5:
    v8 = v7;
  }
LABEL_6:

  return v8;
}

- (MTRDistinguishedNameInfo)issuer
{
  MTRDistinguishedNameInfo *v3;
  const char *v4;

  v3 = [MTRDistinguishedNameInfo alloc];
  return (MTRDistinguishedNameInfo *)(id)objc_msgSend_initWithDN_(v3, v4, (uint64_t)&self->_data.mIssuerDN);
}

- (MTRDistinguishedNameInfo)subject
{
  MTRDistinguishedNameInfo *v3;
  const char *v4;

  v3 = [MTRDistinguishedNameInfo alloc];
  return (MTRDistinguishedNameInfo *)(id)objc_msgSend_initWithDN_(v3, v4, (uint64_t)&self->_data.mSubjectDN);
}

- (NSDate)notBefore
{
  uint64_t v2;
  unint64_t v3;

  LODWORD(v3) = self->_data.mNotBeforeTime;
  return (NSDate *)objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x24BDBCE60], a2, v2, (double)v3 + 946684800.0);
}

- (NSDate)notAfter
{
  uint64_t v2;
  unsigned int mNotAfterTime;

  mNotAfterTime = self->_data.mNotAfterTime;
  if (mNotAfterTime)
    objc_msgSend_dateWithTimeIntervalSince1970_(MEMORY[0x24BDBCE60], a2, v2, (double)mNotAfterTime + 946684800.0);
  else
    objc_msgSend_distantFuture(MEMORY[0x24BDBCE60], a2, v2);
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  MTRCertificateInfo *v4;
  uint64_t v5;
  const char *v6;
  char isEqual;

  v4 = (MTRCertificateInfo *)a3;
  if (self == v4)
  {
    isEqual = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
      isEqual = objc_msgSend_isEqual_(self->_bytes, v6, (uint64_t)v4->_bytes);
    else
      isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  return ((uint64_t (*)(NSData *, char *))MEMORY[0x24BEDD108])(self->_bytes, sel_hash);
}

- (void).cxx_destruct
{
  nullsub_13(&self->_data, a2);
  objc_storeStrong((id *)&self->_bytes, 0);
}

- (id).cxx_construct
{
  sub_2341D5848(&self->_data, a2);
  return self;
}

@end
