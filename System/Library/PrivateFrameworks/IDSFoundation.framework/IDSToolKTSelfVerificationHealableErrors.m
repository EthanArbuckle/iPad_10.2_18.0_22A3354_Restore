@implementation IDSToolKTSelfVerificationHealableErrors

- (void)encodeWithCoder:(id)a3
{
  NSArray *accountHealableErrors;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  const char *v9;
  double v10;
  id v11;

  accountHealableErrors = self->_accountHealableErrors;
  v11 = a3;
  objc_msgSend_encodeObject_forKey_(v11, v5, (uint64_t)accountHealableErrors, v6, CFSTR("account-healable-errors"));
  objc_msgSend_encodeObject_forKey_(v11, v7, (uint64_t)self->_deviceIdToHealableErrors, v8, CFSTR("device-id-to-healable-errors"));
  objc_msgSend_encodeInteger_forKey_(v11, v9, self->_healableState, v10, CFSTR("healable-state"));

}

- (IDSToolKTSelfVerificationHealableErrors)initWithCoder:(id)a3
{
  id v4;
  IDSToolKTSelfVerificationHealableErrors *v5;
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  const char *v24;
  double v25;
  objc_super v27;
  _QWORD v28[4];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)IDSToolKTSelfVerificationHealableErrors;
  v5 = -[IDSToolKTSelfVerificationHealableErrors init](&v27, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v29, v8, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v6, v10, (uint64_t)v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_accountHealableErrors = (NSArray *)(id)objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, v14, CFSTR("account-healable-errors"));

    v15 = (void *)MEMORY[0x1E0C99E60];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    v28[2] = objc_opt_class();
    v28[3] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v16, (uint64_t)v28, v17, 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v15, v19, (uint64_t)v18, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_deviceIdToHealableErrors = (NSDictionary *)(id)objc_msgSend_decodeObjectOfClasses_forKey_(v4, v22, (uint64_t)v21, v23, CFSTR("device-id-to-healable-errors"));

    v5->_healableState = objc_msgSend_decodeIntegerForKey_(v4, v24, (uint64_t)CFSTR("healable-state"), v25);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)accountHealableErrors
{
  return self->_accountHealableErrors;
}

- (void)setAccountHealableErrors:(id)a3
{
  self->_accountHealableErrors = (NSArray *)a3;
}

- (NSDictionary)deviceIdToHealableErrors
{
  return self->_deviceIdToHealableErrors;
}

- (void)setDeviceIdToHealableErrors:(id)a3
{
  self->_deviceIdToHealableErrors = (NSDictionary *)a3;
}

- (unint64_t)healableState
{
  return self->_healableState;
}

- (void)setHealableState:(unint64_t)a3
{
  self->_healableState = a3;
}

@end
