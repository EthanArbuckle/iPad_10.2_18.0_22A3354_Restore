@implementation _CLMicroLocationClusterIdAndClusterData

- (_CLMicroLocationClusterIdAndClusterData)initWithClusterIdentifier:(id)a3 meanBleRssi:(double)a4 meanUwbRange:(double)a5
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  _CLMicroLocationClusterIdAndClusterData *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_CLMicroLocationClusterIdAndClusterData;
  v11 = -[_CLMicroLocationClusterIdAndClusterData init](&v13, sel_init);
  if (v11)
  {
    v11->_clusterIdentifier = (NSString *)objc_msgSend_copy(a3, v8, v9, v10);
    v11->_meanBLEReceivedSignalStrength = a4;
    v11->_meanUWBRange = a5;
  }
  return v11;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_CLMicroLocationClusterIdAndClusterData;
  -[_CLMicroLocationClusterIdAndClusterData dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  double v26;

  v5 = (void *)objc_opt_class();
  v8 = (void *)objc_msgSend_allocWithZone_(v5, v6, (uint64_t)a3, v7);
  v12 = (void *)objc_msgSend_clusterIdentifier(self, v9, v10, v11);
  v15 = (id)objc_msgSend_copyWithZone_(v12, v13, (uint64_t)a3, v14);
  objc_msgSend_meanBLEReceivedSignalStrength(self, v16, v17, v18);
  v20 = v19;
  objc_msgSend_meanUWBRange(self, v21, v22, v23);
  return (id)objc_msgSend_initWithClusterIdentifier_meanBleRssi_meanUwbRange_(v8, v24, (uint64_t)v15, v25, v20, v26);
}

- (_CLMicroLocationClusterIdAndClusterData)initWithCoder:(id)a3
{
  _CLMicroLocationClusterIdAndClusterData *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  double v9;
  const char *v10;
  uint64_t v11;
  double v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_CLMicroLocationClusterIdAndClusterData;
  v4 = -[_CLMicroLocationClusterIdAndClusterData init](&v14, sel_init);
  if (v4)
  {
    v5 = objc_opt_class();
    v4->_clusterIdentifier = (NSString *)(id)objc_msgSend_decodeObjectOfClass_forKey_(a3, v6, v5, (uint64_t)CFSTR("clusterId"));
    objc_msgSend_decodeDoubleForKey_(a3, v7, (uint64_t)CFSTR("meanUwbRange"), v8);
    v4->_meanUWBRange = v9;
    objc_msgSend_decodeDoubleForKey_(a3, v10, (uint64_t)CFSTR("meanBleRssi"), v11);
    v4->_meanBLEReceivedSignalStrength = v12;
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;

  objc_msgSend_encodeObject_forKey_(a3, a2, (uint64_t)self->_clusterIdentifier, (uint64_t)CFSTR("clusterId"));
  objc_msgSend_encodeDouble_forKey_(a3, v5, (uint64_t)CFSTR("meanUwbRange"), v6, self->_meanUWBRange);
  objc_msgSend_encodeDouble_forKey_(a3, v7, (uint64_t)CFSTR("meanBleRssi"), v8, self->_meanBLEReceivedSignalStrength);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_msgSend_clusterIdentifier(self, a2, v2, v3);
  objc_msgSend_meanUWBRange(self, v7, v8, v9);
  v11 = v10;
  objc_msgSend_meanBLEReceivedSignalStrength(self, v12, v13, v14);
  return (id)objc_msgSend_stringWithFormat_(v5, v15, (uint64_t)CFSTR("clusterIdentifier: %@, meanUwbRange: %.3f(m), meanBleRssi: %.3f(dbm)"), v16, v6, v11, v17);
}

- (NSString)clusterIdentifier
{
  return self->_clusterIdentifier;
}

- (double)meanBLEReceivedSignalStrength
{
  return self->_meanBLEReceivedSignalStrength;
}

- (double)meanUWBRange
{
  return self->_meanUWBRange;
}

@end
