@implementation IDSMessagingCapabilities

- (IDSMessagingCapabilities)initWithRequiredCapabilities:(id)a3 requiredMissingCapabilities:(id)a4
{
  id v7;
  id v8;
  IDSMessagingCapabilities *v9;
  IDSMessagingCapabilities *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IDSMessagingCapabilities;
  v9 = -[IDSMessagingCapabilities init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_requiredCapabilities, a3);
    objc_storeStrong((id *)&v10->_requiredMissingCapabilities, a4);
  }

  return v10;
}

- (id)description
{
  uint64_t v2;
  double v3;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;

  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_requiredCapabilities(self, a2, v2, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_requiredMissingCapabilities(self, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v5, v11, (uint64_t)CFSTR("%p: Required capabilities: %@, Required missing capabilities: %@"), v12, self, v6, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSMessagingCapabilities)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  double v9;
  void *v10;
  const char *v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  double v18;
  void *v19;
  const char *v20;
  double v21;
  void *v22;
  const char *v23;
  double v24;
  IDSMessagingCapabilities *v25;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend_setWithObjects_(v4, v8, v6, v9, v7, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v5, v11, (uint64_t)v10, v12, CFSTR("requiredCaps"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0C99E60];
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  objc_msgSend_setWithObjects_(v14, v17, v15, v18, v16, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v5, v20, (uint64_t)v19, v21, CFSTR("requiredMissingCaps"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (IDSMessagingCapabilities *)objc_msgSend_initWithRequiredCapabilities_requiredMissingCapabilities_(self, v23, (uint64_t)v13, v24, v22);
  return v25;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  void *v8;
  const char *v9;
  double v10;
  const char *v11;
  uint64_t v12;
  double v13;
  const char *v14;
  double v15;
  id v16;

  v4 = a3;
  objc_msgSend_requiredCapabilities(self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v9, (uint64_t)v8, v10, CFSTR("requiredCaps"));

  objc_msgSend_requiredMissingCapabilities(self, v11, v12, v13);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v14, (uint64_t)v16, v15, CFSTR("requiredMissingCaps"));

}

- (NSSet)requiredCapabilities
{
  return self->_requiredCapabilities;
}

- (void)setRequiredCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_requiredCapabilities, a3);
}

- (NSSet)requiredMissingCapabilities
{
  return self->_requiredMissingCapabilities;
}

- (void)setRequiredMissingCapabilities:(id)a3
{
  objc_storeStrong((id *)&self->_requiredMissingCapabilities, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requiredMissingCapabilities, 0);
  objc_storeStrong((id *)&self->_requiredCapabilities, 0);
}

@end
