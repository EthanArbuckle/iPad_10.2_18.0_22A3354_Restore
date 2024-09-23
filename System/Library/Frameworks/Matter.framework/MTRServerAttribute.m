@implementation MTRServerAttribute

- (id)initReadonlyAttributeWithID:(id)a3 initialValue:(id)a4 requiredPrivilege:(unsigned __int8)a5
{
  return sub_233C0FDF4((os_unfair_lock_s *)self, a3, a4, a5, 0);
}

- (BOOL)setValue:(id)a3
{
  return sub_233C102D4((os_unfair_lock_s *)self, a3, 1);
}

+ (id)newFeatureMapAttributeWithInitialValue:(id)a3
{
  id v3;
  MTRServerAttribute *v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *inited;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = [MTRServerAttribute alloc];
  v10[0] = CFSTR("type");
  v10[1] = CFSTR("value");
  v11[0] = CFSTR("UnsignedInteger");
  v11[1] = v3;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v5, (uint64_t)v11, v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  inited = (void *)objc_msgSend_initReadonlyAttributeWithID_initialValue_requiredPrivilege_(v4, v7, (uint64_t)&unk_250591A28, v6, 1);

  return inited;
}

- (NSDictionary)value
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)objc_msgSend_copy(self->_value, v4, v5);
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v6;
}

- (BOOL)associateWithController:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  id WeakRetained;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_deviceController);
  if (WeakRetained)
  {
    sub_234117B80(0, "NotSpecified");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_uniqueIdentifier(v4, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_uniqueIdentifier(WeakRetained, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v10;
      v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_233BF3000, v7, OS_LOG_TYPE_ERROR, "Cannot associate MTRServerAttribute with controller %@; already associated with controller %@",
        buf,
        0x16u);

    }
    if (sub_234114844(1u))
    {
      objc_msgSend_uniqueIdentifier(v4, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_uniqueIdentifier(WeakRetained, v17, v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      sub_2341147D0(0, 1);

LABEL_10:
    }
  }
  else
  {
    objc_storeWeak((id *)&self->_deviceController, v4);
    sub_234117B80(0, "NotSpecified");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      sub_233C10AE4((os_unfair_lock *)self);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v20;
      _os_log_impl(&dword_233BF3000, v19, OS_LOG_TYPE_DEFAULT, "Associated %@ with controller", buf, 0xCu);

    }
    if (sub_234114844(2u))
    {
      sub_233C10AE4((os_unfair_lock *)self);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      sub_2341147D0(0, 2);
      goto LABEL_10;
    }
  }

  os_unfair_lock_unlock(p_lock);
  return WeakRetained == 0;
}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_storeWeak((id *)&self->_deviceController, 0);
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)addToCluster:(const ConcreteClusterPath *)a3
{
  os_unfair_lock_s *p_lock;
  unsigned int mClusterId;
  NSObject *v7;
  unsigned int mClusterId_high;
  int v9;
  unsigned int v10;
  int v11;
  uint8_t buf[4];
  unsigned int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  mClusterId = self->_parentCluster.mClusterId;
  if (mClusterId == -1)
  {
    self->_parentCluster = *a3;
  }
  else
  {
    sub_234117B80(0, "NotSpecified");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      mClusterId_high = HIWORD(a3->mClusterId);
      v9 = (unsigned __int16)a3->mClusterId;
      v10 = HIWORD(self->_parentCluster.mClusterId);
      v11 = (unsigned __int16)self->_parentCluster.mClusterId;
      *(_DWORD *)buf = 67109888;
      v14 = mClusterId_high;
      v15 = 1024;
      v16 = v9;
      v17 = 1024;
      v18 = v10;
      v19 = 1024;
      v20 = v11;
      _os_log_impl(&dword_233BF3000, v7, OS_LOG_TYPE_ERROR, "Cannot add attribute to cluster 0x%04X_%04X; already added to cluster 0x%04X_%04X",
        buf,
        0x1Au);
    }

    if (sub_234114844(1u))
      sub_2341147D0(0, 1);
  }
  os_unfair_lock_unlock(p_lock);
  return mClusterId == -1;
}

- (void)updateParentCluster:(const ConcreteClusterPath *)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_parentCluster = *a3;
  os_unfair_lock_unlock(p_lock);
}

- (const)parentCluster
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  os_unfair_lock_unlock(p_lock);
  return &self->_parentCluster;
}

- (id)description
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  sub_233C10AE4((os_unfair_lock *)self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (NSNumber)attributeID
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (unsigned)requiredReadPrivilege
{
  return self->_requiredReadPrivilege;
}

- (BOOL)isWritable
{
  return self->_writable;
}

- (id)serializedValue
{
  return self->_serializedValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_serializedValue, 0);
  objc_storeStrong((id *)&self->_attributeID, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_destroyWeak((id *)&self->_deviceController);
}

- (id).cxx_construct
{
  *((_WORD *)self + 16) = 0;
  *((_DWORD *)self + 9) = 0;
  return self;
}

@end
