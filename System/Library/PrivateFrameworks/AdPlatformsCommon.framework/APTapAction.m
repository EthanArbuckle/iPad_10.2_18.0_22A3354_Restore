@implementation APTapAction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APTapAction)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  APTapAction *v8;
  double v9;
  double v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  NSURL *actionURL;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  double v33;
  double v34;
  uint64_t v35;
  NSNumber *adamIdentifier;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  double v53;
  double v54;
  uint64_t v55;
  NSDictionary *iTunesMetadata;
  objc_super v58;

  v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)APTapAction;
  v8 = -[APTapAction init](&v58, sel_init);
  if (v8)
  {
    v8->_actionType = (int)objc_msgSend_decodeIntForKey_(v4, v5, (uint64_t)CFSTR("actionType"), v6, v7, v9, v10);
    v17 = objc_msgSend_classForCoder(MEMORY[0x24BDBCF48], v11, v12, v13, v14, v15, v16);
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v18, v17, (uint64_t)CFSTR("actionURL"), v19, v20, v21);
    v22 = objc_claimAutoreleasedReturnValue();
    actionURL = v8->_actionURL;
    v8->_actionURL = (NSURL *)v22;

    objc_msgSend_decodeDoubleForKey_(v4, v24, (uint64_t)CFSTR("confirmedClickInterval"), v25, v26, v27, v28);
    v8->_confirmedClickInterval = v29;
    v30 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v31, v30, (uint64_t)CFSTR("kAdamIdentifier"), v32, v33, v34);
    v35 = objc_claimAutoreleasedReturnValue();
    adamIdentifier = v8->_adamIdentifier;
    v8->_adamIdentifier = (NSNumber *)v35;

    v8->_templateType = (int)objc_msgSend_decodeIntForKey_(v4, v37, (uint64_t)CFSTR("kTemplateTypeKey"), v38, v39, v40, v41);
    v42 = (void *)MEMORY[0x24BDBCF20];
    v43 = objc_opt_class();
    v44 = objc_opt_class();
    objc_msgSend_setWithObjects_(v42, v45, v43, v46, v47, v48, v49, v44, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v51, (uint64_t)v50, (uint64_t)CFSTR("kiTunesMetadata"), v52, v53, v54);
    v55 = objc_claimAutoreleasedReturnValue();
    iTunesMetadata = v8->_iTunesMetadata;
    v8->_iTunesMetadata = (NSDictionary *)v55;

  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t actionType_low;
  const char *v5;
  uint64_t v6;
  double v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  const char *v17;
  uint64_t v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  double v23;
  double v24;
  const char *v25;
  uint64_t v26;
  double v27;
  double v28;
  id v29;

  actionType_low = LODWORD(self->_actionType);
  v29 = a3;
  objc_msgSend_encodeInt_forKey_(v29, v5, actionType_low, (uint64_t)CFSTR("actionType"), v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v29, v9, (uint64_t)self->_actionURL, (uint64_t)CFSTR("actionURL"), v10, v11, v12);
  objc_msgSend_encodeDouble_forKey_(v29, v13, (uint64_t)CFSTR("confirmedClickInterval"), v14, v15, self->_confirmedClickInterval, v16);
  objc_msgSend_encodeObject_forKey_(v29, v17, (uint64_t)self->_adamIdentifier, (uint64_t)CFSTR("kAdamIdentifier"), v18, v19, v20);
  objc_msgSend_encodeInt_forKey_(v29, v21, LODWORD(self->_templateType), (uint64_t)CFSTR("kTemplateTypeKey"), v22, v23, v24);
  objc_msgSend_encodeObject_forKey_(v29, v25, (uint64_t)self->_iTunesMetadata, (uint64_t)CFSTR("kiTunesMetadata"), v26, v27, v28);

}

- (int64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(int64_t)a3
{
  self->_actionType = a3;
}

- (NSURL)actionURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setActionURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (double)confirmedClickInterval
{
  return self->_confirmedClickInterval;
}

- (void)setConfirmedClickInterval:(double)a3
{
  self->_confirmedClickInterval = a3;
}

- (NSNumber)adamIdentifier
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAdamIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (int64_t)templateType
{
  return self->_templateType;
}

- (void)setTemplateType:(int64_t)a3
{
  self->_templateType = a3;
}

- (NSDictionary)iTunesMetadata
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setITunesMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesMetadata, 0);
  objc_storeStrong((id *)&self->_adamIdentifier, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
}

@end
