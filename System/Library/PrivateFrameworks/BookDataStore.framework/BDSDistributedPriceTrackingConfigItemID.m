@implementation BDSDistributedPriceTrackingConfigItemID

- (BDSDistributedPriceTrackingConfigItemID)initWithAdamID:(id)a3 isAudiobook:(BOOL)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BDSDistributedPriceTrackingConfigItemID *v11;
  uint64_t v12;
  void *v13;
  __CFString *v14;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BDSDistributedPriceTrackingConfigItemID;
  v11 = -[BDSDistributedPriceTrackingConfigItemID init](&v16, sel_init);
  if (v11)
  {
    v12 = objc_msgSend_copy(v6, v7, v8, v9, v10);
    v13 = (void *)v12;
    if (v12)
      v14 = (__CFString *)v12;
    else
      v14 = &stru_24F091B90;
    objc_storeStrong((id *)&v11->_adamID, v14);

    v11->_isAudiobook = a4;
  }

  return v11;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v6 = (void *)MEMORY[0x24BDD17C8];
  if (objc_msgSend_isAudiobook(self, a2, v2, v3, v4))
    v11 = CFSTR("A");
  else
    v11 = CFSTR("B");
  objc_msgSend_adamID(self, v7, v8, v9, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v13, (uint64_t)CFSTR("%@.%@"), v14, v15, v11, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t isAudiobook;
  const char *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  objc_msgSend_adamID(self, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v18, v9, (uint64_t)v8, (uint64_t)CFSTR("adamID"), v10);

  isAudiobook = objc_msgSend_isAudiobook(self, v11, v12, v13, v14);
  objc_msgSend_encodeBool_forKey_(v18, v16, isAudiobook, (uint64_t)CFSTR("isAudiobook"), v17);

}

- (BDSDistributedPriceTrackingConfigItemID)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  BDSDistributedPriceTrackingConfigItemID *isAudiobook;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v6, v5, (uint64_t)CFSTR("adamID"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_decodeBoolForKey_(v4, v9, (uint64_t)CFSTR("isAudiobook"), v10, v11);

  isAudiobook = (BDSDistributedPriceTrackingConfigItemID *)objc_msgSend_initWithAdamID_isAudiobook_(self, v13, (uint64_t)v8, v12, v14);
  return isAudiobook;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (BOOL)isAudiobook
{
  return self->_isAudiobook;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adamID, 0);
}

@end
