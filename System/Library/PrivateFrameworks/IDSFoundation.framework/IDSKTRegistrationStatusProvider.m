@implementation IDSKTRegistrationStatusProvider

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSKTRegistrationStatusProvider)init
{
  IDSKTRegistrationStatusProvider *v2;
  IDSKTRegistrationStatusProvider *v3;
  NSDictionary *ktApplicationToKTRegStatus;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IDSKTRegistrationStatusProvider;
  v2 = -[IDSKTRegistrationStatusProvider init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    ktApplicationToKTRegStatus = v2->_ktApplicationToKTRegStatus;
    v2->_ktApplicationToKTRegStatus = 0;

  }
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  double v3;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_ktApplicationToKTRegStatus, v3, CFSTR("kIDSKTAppToStatusKey"));
}

- (IDSKTRegistrationStatusProvider)initWithCoder:(id)a3
{
  id v4;
  IDSKTRegistrationStatusProvider *v5;
  void *v6;
  const char *v7;
  double v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  const char *v13;
  double v14;
  uint64_t v15;
  NSDictionary *ktApplicationToKTRegStatus;
  objc_super v18;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)IDSKTRegistrationStatusProvider;
  v5 = -[IDSKTRegistrationStatusProvider init](&v18, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v7, (uint64_t)v19, v8, 3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v6, v10, (uint64_t)v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v13, (uint64_t)v12, v14, CFSTR("kIDSKTAppToStatusKey"));
    v15 = objc_claimAutoreleasedReturnValue();
    ktApplicationToKTRegStatus = v5->_ktApplicationToKTRegStatus;
    v5->_ktApplicationToKTRegStatus = (NSDictionary *)v15;

  }
  return v5;
}

- (id)statusForKTApplication:(id)a3
{
  double v3;
  IDSKTRegistrationStatus *v4;
  IDSKTRegistrationStatus *v5;

  objc_msgSend_objectForKeyedSubscript_(self->_ktApplicationToKTRegStatus, a2, (uint64_t)a3, v3);
  v4 = (IDSKTRegistrationStatus *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    v4 = objc_alloc_init(IDSKTRegistrationStatus);
  v5 = v4;

  return v5;
}

- (NSDictionary)ktApplicationToKTRegStatus
{
  return self->_ktApplicationToKTRegStatus;
}

- (void)setKtApplicationToKTRegStatus:(id)a3
{
  objc_storeStrong((id *)&self->_ktApplicationToKTRegStatus, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ktApplicationToKTRegStatus, 0);
}

@end
