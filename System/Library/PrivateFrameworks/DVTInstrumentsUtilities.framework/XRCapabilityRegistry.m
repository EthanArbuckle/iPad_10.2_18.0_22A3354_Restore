@implementation XRCapabilityRegistry

+ (void)initialize
{
  uint64_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_opt_new();
    v3 = (void *)qword_25583C6D8;
    qword_25583C6D8 = v2;

  }
}

+ (id)applicationCapabilities
{
  return (id)qword_25583C6D8;
}

- (XRCapabilityRegistry)initWithRanges:(id)a3 unimplementedRecoveries:(id)a4 abandonedRecoveries:(id)a5
{
  id v9;
  id v10;
  id v11;
  XRCapabilityRegistry *v12;
  XRCapabilityRegistry *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)XRCapabilityRegistry;
  v12 = -[XRCapabilityRegistry init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_capabilityRanges, a3);
    objc_storeStrong((id *)&v13->_unimplementedRecoveries, a4);
    objc_storeStrong((id *)&v13->_abandonedRecoveries, a5);
  }

  return v13;
}

- (XRCapabilityRegistry)init
{
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  XRCapabilityRegistry *v7;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v7 = (XRCapabilityRegistry *)objc_msgSend_initWithRanges_unimplementedRecoveries_abandonedRecoveries_(self, v6, (uint64_t)v3, (uint64_t)v4, (uint64_t)v5);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  XRCapabilityRegistry *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;

  v4 = [XRCapabilityRegistry alloc];
  v9 = (void *)objc_msgSend_mutableCopy(self->_capabilityRanges, v5, v6, v7, v8);
  v14 = (void *)objc_msgSend_mutableCopy(self->_unimplementedRecoveries, v10, v11, v12, v13);
  v19 = (void *)objc_msgSend_mutableCopy(self->_abandonedRecoveries, v15, v16, v17, v18);
  v21 = (void *)objc_msgSend_initWithRanges_unimplementedRecoveries_abandonedRecoveries_(v4, v20, (uint64_t)v9, (uint64_t)v14, (uint64_t)v19);

  return v21;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)((uint64_t (*)(XRCapabilityRegistry *, char *, _NSZone *))MEMORY[0x24BEDD108])(self, sel_copyWithZone_, a3);
}

- (void)registerCapability:(id)a3 versions:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;

  length = a4.length;
  location = a4.location;
  v7 = (void *)MEMORY[0x24BDD1968];
  v8 = a3;
  objc_msgSend_valueWithRange_(v7, v9, location, length, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_capabilityRanges, v11, (uint64_t)v13, (uint64_t)v8, v12);

}

- (void)setAbandonedRecoverySuggestion:(id)a3 forCapability:(id)a4
{
  uint64_t v4;

  objc_msgSend_setObject_forKeyedSubscript_(self->_abandonedRecoveries, a2, (uint64_t)a3, (uint64_t)a4, v4);
}

- (void)setUnimplementedRecoverySuggestion:(id)a3 forCapability:(id)a4
{
  uint64_t v4;

  objc_msgSend_setObject_forKeyedSubscript_(self->_unimplementedRecoveries, a2, (uint64_t)a3, (uint64_t)a4, v4);
}

- (id)unimplementedRecoveryForCapability:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_objectForKeyedSubscript_(self->_unimplementedRecoveries, a2, (uint64_t)a3, v3, v4);
}

- (id)abandonedRecoveryForCapability:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_objectForKeyedSubscript_(self->_abandonedRecoveries, a2, (uint64_t)a3, v3, v4);
}

- (unint64_t)supportForCapability:(id)a3 versions:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSRange v15;
  uint64_t v16;
  unint64_t v18;
  NSRange v20;
  NSRange v21;

  length = a4.length;
  location = a4.location;
  objc_msgSend_objectForKeyedSubscript_(self->_capabilityRanges, a2, (uint64_t)a3, a4.location, a4.length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  if (v6)
  {
    v12 = objc_msgSend_rangeValue(v6, v7, v8, v9, v10);
    v14 = v13;
    v20.location = location;
    v20.length = length;
    v21.location = v12;
    v21.length = v14;
    v15 = NSIntersectionRange(v20, v21);
    v16 = 1;
    if (location + length <= v12 + v14)
      v16 = 2;
    if (v15.location == location && v15.length == length)
      v18 = 0;
    else
      v18 = v16;
  }
  else
  {
    v18 = 1;
  }

  return v18;
}

- (_NSRange)supportedVersionsForCapability:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  _NSRange result;

  objc_msgSend_objectForKeyedSubscript_(self->_capabilityRanges, a2, (uint64_t)a3, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  if (v5)
  {
    v11 = objc_msgSend_rangeValue(v5, v6, v7, v8, v9);
    v13 = v12;
  }
  else
  {
    v13 = 0;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v14 = v11;
  v15 = v13;
  result.length = v15;
  result.location = v14;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abandonedRecoveries, 0);
  objc_storeStrong((id *)&self->_unimplementedRecoveries, 0);
  objc_storeStrong((id *)&self->_capabilityRanges, 0);
}

@end
