@implementation MTRChannelClusterChannelInfoStruct

- (MTRChannelClusterChannelInfoStruct)init
{
  MTRChannelClusterChannelInfoStruct *v2;
  MTRChannelClusterChannelInfoStruct *v3;
  NSNumber *majorNumber;
  NSNumber *minorNumber;
  NSString *name;
  NSString *callSign;
  NSString *affiliateCallSign;
  NSString *identifier;
  NSNumber *type;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTRChannelClusterChannelInfoStruct;
  v2 = -[MTRChannelClusterChannelInfoStruct init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    majorNumber = v2->_majorNumber;
    v2->_majorNumber = (NSNumber *)&unk_250591B18;

    minorNumber = v3->_minorNumber;
    v3->_minorNumber = (NSNumber *)&unk_250591B18;

    name = v3->_name;
    v3->_name = 0;

    callSign = v3->_callSign;
    v3->_callSign = 0;

    affiliateCallSign = v3->_affiliateCallSign;
    v3->_affiliateCallSign = 0;

    identifier = v3->_identifier;
    v3->_identifier = 0;

    type = v3->_type;
    v3->_type = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRChannelClusterChannelInfoStruct *v4;
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

  v4 = objc_alloc_init(MTRChannelClusterChannelInfoStruct);
  objc_msgSend_majorNumber(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMajorNumber_(v4, v8, (uint64_t)v7);

  objc_msgSend_minorNumber(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMinorNumber_(v4, v12, (uint64_t)v11);

  objc_msgSend_name(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v4, v16, (uint64_t)v15);

  objc_msgSend_callSign(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCallSign_(v4, v20, (uint64_t)v19);

  objc_msgSend_affiliateCallSign(self, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAffiliateCallSign_(v4, v24, (uint64_t)v23);

  objc_msgSend_identifier(self, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIdentifier_(v4, v28, (uint64_t)v27);

  objc_msgSend_type(self, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setType_(v4, v32, (uint64_t)v31);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: majorNumber:%@; minorNumber:%@; name:%@; callSign:%@; affiliateCallSign:%@; identifier:%@; type:%@; >"),
    v5,
    self->_majorNumber,
    self->_minorNumber,
    self->_name,
    self->_callSign,
    self->_affiliateCallSign,
    self->_identifier,
    self->_type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)majorNumber
{
  return self->_majorNumber;
}

- (void)setMajorNumber:(NSNumber *)majorNumber
{
  objc_setProperty_nonatomic_copy(self, a2, majorNumber, 8);
}

- (NSNumber)minorNumber
{
  return self->_minorNumber;
}

- (void)setMinorNumber:(NSNumber *)minorNumber
{
  objc_setProperty_nonatomic_copy(self, a2, minorNumber, 16);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(NSString *)name
{
  objc_setProperty_nonatomic_copy(self, a2, name, 24);
}

- (NSString)callSign
{
  return self->_callSign;
}

- (void)setCallSign:(NSString *)callSign
{
  objc_setProperty_nonatomic_copy(self, a2, callSign, 32);
}

- (NSString)affiliateCallSign
{
  return self->_affiliateCallSign;
}

- (void)setAffiliateCallSign:(NSString *)affiliateCallSign
{
  objc_setProperty_nonatomic_copy(self, a2, affiliateCallSign, 40);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_affiliateCallSign, 0);
  objc_storeStrong((id *)&self->_callSign, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_minorNumber, 0);
  objc_storeStrong((id *)&self->_majorNumber, 0);
}

@end
