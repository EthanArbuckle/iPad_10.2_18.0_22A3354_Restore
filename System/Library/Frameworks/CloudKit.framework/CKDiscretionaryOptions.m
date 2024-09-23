@implementation CKDiscretionaryOptions

- (NSString)secondarySourceApplicationBundleId
{
  return self->_secondarySourceApplicationBundleId;
}

- (BOOL)requiresNetworkAccess
{
  return self->_requiresNetworkAccess;
}

- (unint64_t)discretionaryNetworkBehavior
{
  return self->_discretionaryNetworkBehavior;
}

- (NSString)applicationBundleIdentifierOverride
{
  return self->_applicationBundleIdentifierOverride;
}

- (BOOL)allowsExpensiveNetworkAccess
{
  return self->_allowsExpensiveNetworkAccess;
}

- (BOOL)allowsCellularAccess
{
  return self->_allowsCellularAccess;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CKDiscretionaryOptions)initWithCoder:(id)a3
{
  id v4;
  CKDiscretionaryOptions *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSString *applicationBundleIdentifierOverride;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  NSString *secondarySourceApplicationBundleId;
  const char *v15;
  uint64_t v16;
  double v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CKDiscretionaryOptions;
  v5 = -[CKDiscretionaryOptions init](&v27, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v8, v7, (uint64_t)CFSTR("sourceApplicationBundleId"));
    v9 = objc_claimAutoreleasedReturnValue();
    applicationBundleIdentifierOverride = v5->_applicationBundleIdentifierOverride;
    v5->_applicationBundleIdentifierOverride = (NSString *)v9;

    v11 = objc_opt_class();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, (uint64_t)CFSTR("secondarySourceApplicationBundleId"));
    v13 = objc_claimAutoreleasedReturnValue();
    secondarySourceApplicationBundleId = v5->_secondarySourceApplicationBundleId;
    v5->_secondarySourceApplicationBundleId = (NSString *)v13;

    objc_msgSend_decodeDoubleForKey_(v4, v15, (uint64_t)CFSTR("timeoutIntervalForResource"), v16);
    v5->_timeoutIntervalForResource = v17;
    v5->_allowsCellularAccess = objc_msgSend_decodeBoolForKey_(v4, v18, (uint64_t)CFSTR("allowsCellularAccess"), v19);
    v5->_allowsExpensiveNetworkAccess = objc_msgSend_decodeBoolForKey_(v4, v20, (uint64_t)CFSTR("allowsExpensiveNetworkAccess"), v21);
    v5->_discretionaryNetworkBehavior = objc_msgSend_decodeInt64ForKey_(v4, v22, (uint64_t)CFSTR("discretionaryNetworkBehavior"), v23);
    v5->_requiresNetworkAccess = objc_msgSend_decodeBoolForKey_(v4, v24, (uint64_t)CFSTR("requiresNetworkAccess"), v25);
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  const char *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  id v13;

  v13 = a3;
  v4 = (void *)MEMORY[0x18D76DE4C]();
  objc_msgSend_encodeObject_forKey_(v13, v5, (uint64_t)self->_applicationBundleIdentifierOverride, (uint64_t)CFSTR("sourceApplicationBundleId"));
  objc_msgSend_encodeObject_forKey_(v13, v6, (uint64_t)self->_secondarySourceApplicationBundleId, (uint64_t)CFSTR("secondarySourceApplicationBundleId"));
  objc_msgSend_encodeDouble_forKey_(v13, v7, (uint64_t)CFSTR("timeoutIntervalForResource"), v8, self->_timeoutIntervalForResource);
  objc_msgSend_encodeBool_forKey_(v13, v9, self->_allowsCellularAccess, (uint64_t)CFSTR("allowsCellularAccess"));
  objc_msgSend_encodeBool_forKey_(v13, v10, self->_allowsExpensiveNetworkAccess, (uint64_t)CFSTR("allowsExpensiveNetworkAccess"));
  objc_msgSend_encodeInt64_forKey_(v13, v11, self->_discretionaryNetworkBehavior, (uint64_t)CFSTR("discretionaryNetworkBehavior"));
  objc_msgSend_encodeBool_forKey_(v13, v12, self->_requiresNetworkAccess, (uint64_t)CFSTR("requiresNetworkAccess"));
  objc_autoreleasePoolPop(v4);

}

- (void)setApplicationBundleIdentifierOverride:(id)a3
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverride, a3);
}

- (void)setSecondarySourceApplicationBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_secondarySourceApplicationBundleId, a3);
}

- (double)timeoutIntervalForResource
{
  return self->_timeoutIntervalForResource;
}

- (void)setTimeoutIntervalForResource:(double)a3
{
  self->_timeoutIntervalForResource = a3;
}

- (void)setAllowsCellularAccess:(BOOL)a3
{
  self->_allowsCellularAccess = a3;
}

- (void)setAllowsExpensiveNetworkAccess:(BOOL)a3
{
  self->_allowsExpensiveNetworkAccess = a3;
}

- (void)setDiscretionaryNetworkBehavior:(unint64_t)a3
{
  self->_discretionaryNetworkBehavior = a3;
}

- (void)setRequiresNetworkAccess:(BOOL)a3
{
  self->_requiresNetworkAccess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondarySourceApplicationBundleId, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifierOverride, 0);
}

@end
