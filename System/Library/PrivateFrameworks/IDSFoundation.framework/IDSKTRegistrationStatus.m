@implementation IDSKTRegistrationStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  IDSKTRegistrationData *unregisteredKTData;
  const char *v5;
  double v6;
  const char *v7;
  double v8;
  id v9;

  unregisteredKTData = self->_unregisteredKTData;
  v9 = a3;
  objc_msgSend_encodeObject_forKey_(v9, v5, (uint64_t)unregisteredKTData, v6, CFSTR("kUnregisteredKTData"));
  objc_msgSend_encodeObject_forKey_(v9, v7, (uint64_t)self->_registeredKTData, v8, CFSTR("kRegisteredKTData"));

}

- (IDSKTRegistrationStatus)initWithCoder:(id)a3
{
  id v4;
  IDSKTRegistrationStatus *v5;
  uint64_t v6;
  const char *v7;
  double v8;
  uint64_t v9;
  IDSKTRegistrationData *unregisteredKTData;
  uint64_t v11;
  const char *v12;
  double v13;
  uint64_t v14;
  IDSKTRegistrationData *registeredKTData;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IDSKTRegistrationStatus;
  v5 = -[IDSKTRegistrationStatus init](&v17, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, v8, CFSTR("kUnregisteredKTData"));
    v9 = objc_claimAutoreleasedReturnValue();
    unregisteredKTData = v5->_unregisteredKTData;
    v5->_unregisteredKTData = (IDSKTRegistrationData *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, v13, CFSTR("kRegisteredKTData"));
    v14 = objc_claimAutoreleasedReturnValue();
    registeredKTData = v5->_registeredKTData;
    v5->_registeredKTData = (IDSKTRegistrationData *)v14;

  }
  return v5;
}

- (IDSKTRegistrationData)unregisteredKTData
{
  return self->_unregisteredKTData;
}

- (void)setUnregisteredKTData:(id)a3
{
  objc_storeStrong((id *)&self->_unregisteredKTData, a3);
}

- (IDSKTRegistrationData)registeredKTData
{
  return self->_registeredKTData;
}

- (void)setRegisteredKTData:(id)a3
{
  objc_storeStrong((id *)&self->_registeredKTData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registeredKTData, 0);
  objc_storeStrong((id *)&self->_unregisteredKTData, 0);
}

@end
