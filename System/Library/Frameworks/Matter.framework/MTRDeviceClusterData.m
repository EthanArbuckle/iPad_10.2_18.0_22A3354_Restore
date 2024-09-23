@implementation MTRDeviceClusterData

- (void)storeValue:(id)a3 forAttribute:(id)a4
{
  objc_msgSend_setObject_forKeyedSubscript_(self->_attributes, a2, (uint64_t)a3, a4);
}

- (void)removeValueForAttribute:(id)a3
{
  objc_msgSend_removeObjectForKey_(self->_attributes, a2, (uint64_t)a3);
}

- (NSDictionary)attributes
{
  return (NSDictionary *)self->_attributes;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  uint64_t v2;
  void *v3;
  NSNumber *dataVersion;
  uint64_t v5;
  const char *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  dataVersion = self->_dataVersion;
  v5 = objc_msgSend_count(self->_attributes, a2, v2);
  return (id)objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<MTRDeviceClusterData: dataVersion %@ attributes count %lu>"), dataVersion, v5);
}

- (MTRDeviceClusterData)init
{
  return (MTRDeviceClusterData *)objc_msgSend_initWithDataVersion_attributes_(self, a2, 0, 0);
}

- (MTRDeviceClusterData)initWithDataVersion:(id)a3 attributes:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  MTRDeviceClusterData *v10;
  uint64_t v11;
  NSNumber *dataVersion;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  NSMutableDictionary *attributes;
  const char *v20;
  MTRDeviceClusterData *v21;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)MTRDeviceClusterData;
  v10 = -[MTRDeviceClusterData init](&v23, sel_init);
  if (v10)
  {
    v11 = objc_msgSend_copy(v6, v8, v9);
    dataVersion = v10->_dataVersion;
    v10->_dataVersion = (NSNumber *)v11;

    v13 = (void *)MEMORY[0x24BDBCED8];
    v16 = objc_msgSend_count(v7, v14, v15);
    objc_msgSend_dictionaryWithCapacity_(v13, v17, v16);
    v18 = objc_claimAutoreleasedReturnValue();
    attributes = v10->_attributes;
    v10->_attributes = (NSMutableDictionary *)v18;

    objc_msgSend_addEntriesFromDictionary_(v10->_attributes, v20, (uint64_t)v7);
    v21 = v10;
  }

  return v10;
}

- (MTRDeviceClusterData)initWithCoder:(id)a3
{
  id v4;
  MTRDeviceClusterData *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSNumber *dataVersion;
  const char *v10;
  unsigned __int8 v11;
  uint64_t v12;
  NSMutableDictionary *attributes;
  MTRDeviceClusterData *v14;
  NSObject *v15;
  NSNumber *v16;
  NSObject *v17;
  NSMutableDictionary *v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)MTRDeviceClusterData;
  v5 = -[MTRDeviceClusterData init](&v27, sel_init);
  if (!v5)
    goto LABEL_16;
  v6 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v4, v7, v6, CFSTR("dataVersion"));
  v8 = objc_claimAutoreleasedReturnValue();
  dataVersion = v5->_dataVersion;
  v5->_dataVersion = (NSNumber *)v8;

  if (v5->_dataVersion)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      sub_234117B80(0, "NotSpecified");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = v5->_dataVersion;
        *(_DWORD *)buf = 138412290;
        v29 = v16;
        _os_log_impl(&dword_233BF3000, v15, OS_LOG_TYPE_ERROR, "MTRDeviceClusterData got %@ for data version, not NSNumber.", buf, 0xCu);
      }

      if (!sub_234114844(1u))
        goto LABEL_16;
LABEL_15:
      sub_2341147D0(0, 1);
LABEL_16:
      v14 = 0;
      goto LABEL_17;
    }
  }
  v11 = atomic_load((unsigned __int8 *)&qword_256159280);
  if ((v11 & 1) == 0 && __cxa_guard_acquire(&qword_256159280))
  {
    v20 = (void *)MEMORY[0x24BDBCF20];
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    objc_msgSend_setWithObjects_(v20, v26, v21, v22, v23, v24, v25, 0);
    qword_256159278 = objc_claimAutoreleasedReturnValue();
    __cxa_guard_release(&qword_256159280);
  }
  objc_msgSend_decodeObjectOfClasses_forKey_(v4, v10, qword_256159278, CFSTR("attributes"));
  v12 = objc_claimAutoreleasedReturnValue();
  attributes = v5->_attributes;
  v5->_attributes = (NSMutableDictionary *)v12;

  if (v5->_attributes)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      sub_234117B80(0, "NotSpecified");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = v5->_attributes;
        *(_DWORD *)buf = 138412290;
        v29 = v18;
        _os_log_impl(&dword_233BF3000, v17, OS_LOG_TYPE_ERROR, "MTRDeviceClusterData got %@ for attributes, not NSDictionary.", buf, 0xCu);
      }

      if (!sub_234114844(1u))
        goto LABEL_16;
      goto LABEL_15;
    }
  }
  v14 = v5;
LABEL_17:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  id v12;

  v12 = a3;
  objc_msgSend_dataVersion(self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v12, v7, (uint64_t)v6, CFSTR("dataVersion"));

  objc_msgSend_attributes(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v12, v11, (uint64_t)v10, CFSTR("attributes"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDeviceClusterData *v4;
  const char *v5;

  v4 = [MTRDeviceClusterData alloc];
  return (id)objc_msgSend_initWithDataVersion_attributes_(v4, v5, (uint64_t)self->_dataVersion, self->_attributes);
}

- (BOOL)isEqualToClusterData:(id)a3
{
  id v4;
  NSNumber *dataVersion;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  NSMutableDictionary *attributes;
  void *v12;
  char v13;

  v4 = a3;
  dataVersion = self->_dataVersion;
  objc_msgSend_dataVersion(v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (sub_233BF4AA0(dataVersion, v8))
  {
    attributes = self->_attributes;
    objc_msgSend_attributes(v4, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = sub_233BF4AA0(attributes, v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  const char *v6;
  char isEqualToClusterData;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
    isEqualToClusterData = objc_msgSend_isEqualToClusterData_(self, v6, (uint64_t)v4);
  else
    isEqualToClusterData = 0;

  return isEqualToClusterData;
}

- (NSNumber)dataVersion
{
  return self->_dataVersion;
}

- (void)setDataVersion:(id)a3
{
  objc_storeStrong((id *)&self->_dataVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataVersion, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
