@implementation IDSCTSIM

- (IDSCTSIM)initWithContext:(id)a3
{
  id v5;
  IDSCTSIM *v6;
  IDSCTSIM *v7;
  NSString *mobileCountryCode;
  NSString *mobileNetworkCode;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IDSCTSIM;
  v6 = -[IDSCTSIM init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_context, a3);
    mobileCountryCode = v7->_mobileCountryCode;
    v7->_mobileCountryCode = 0;

    mobileNetworkCode = v7->_mobileNetworkCode;
    v7->_mobileNetworkCode = 0;

  }
  return v7;
}

- (NSString)label
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  objc_msgSend_context(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_label(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)phoneNumber
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  objc_msgSend_context(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_phoneNumber(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)SIMIdentifier
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;

  objc_msgSend_context(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_labelID(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (unint64_t)slot
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;

  objc_msgSend_context(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_slotID(v4, v5, v6, v7);

  if (v8)
    return v8 == 2;
  else
    return 2;
}

- (BOOL)isDefaultVoiceSIM
{
  uint64_t v2;
  double v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  BOOL v9;

  objc_msgSend_context(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_userDefaultVoice(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 != 0;

  return v9;
}

- (NSString)mobileCountryCode
{
  NSString *mobileCountryCode;
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  NSString *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  double v18;
  BOOL v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSString *v27;
  id v29;

  mobileCountryCode = self->_mobileCountryCode;
  if (!mobileCountryCode)
  {
    v4 = objc_alloc(MEMORY[0x1E0CA6E38]);
    v7 = (void *)objc_msgSend_initWithQueue_(v4, v5, 0, v6);
    objc_msgSend_context(self, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v14 = (NSString *)objc_msgSend_copyMobileSubscriberCountryCode_error_(v7, v12, (uint64_t)v11, v13, &v29);
    v15 = v29;

    if (v14)
      v19 = v15 == 0;
    else
      v19 = 0;
    if (!v19)
    {
      objc_msgSend_sms(MEMORY[0x1E0D36AA8], v16, v17, v18);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_19BAF94F8((uint64_t)v15, v20, v21, v22, v23, v24, v25, v26);

    }
    v27 = self->_mobileCountryCode;
    self->_mobileCountryCode = v14;

    mobileCountryCode = self->_mobileCountryCode;
  }
  return mobileCountryCode;
}

- (NSString)mobileNetworkCode
{
  NSString *mobileNetworkCode;
  id v4;
  const char *v5;
  double v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  NSString *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  double v18;
  BOOL v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSString *v27;
  id v29;

  mobileNetworkCode = self->_mobileNetworkCode;
  if (!mobileNetworkCode)
  {
    v4 = objc_alloc(MEMORY[0x1E0CA6E38]);
    v7 = (void *)objc_msgSend_initWithQueue_(v4, v5, 0, v6);
    objc_msgSend_context(self, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    v14 = (NSString *)objc_msgSend_copyMobileSubscriberNetworkCode_error_(v7, v12, (uint64_t)v11, v13, &v29);
    v15 = v29;

    if (v14)
      v19 = v15 == 0;
    else
      v19 = 0;
    if (!v19)
    {
      objc_msgSend_sms(MEMORY[0x1E0D36AA8], v16, v17, v18);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_19BAF955C((uint64_t)v15, v20, v21, v22, v23, v24, v25, v26);

    }
    v27 = self->_mobileNetworkCode;
    self->_mobileNetworkCode = v14;

    mobileNetworkCode = self->_mobileNetworkCode;
  }
  return mobileNetworkCode;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  NSString *mobileCountryCode;
  NSString *mobileNetworkCode;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  mobileCountryCode = self->_mobileCountryCode;
  mobileNetworkCode = self->_mobileNetworkCode;
  objc_msgSend_context(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v11, (uint64_t)CFSTR("<%@:%p mcc: %@, mnc: %@, context: %@"), v12, v4, self, mobileCountryCode, mobileNetworkCode, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_mobileNetworkCode, 0);
  objc_storeStrong((id *)&self->_mobileCountryCode, 0);
}

@end
