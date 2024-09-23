@implementation MTRDescriptorClusterDeviceTypeStruct

- (MTRDescriptorClusterDeviceTypeStruct)init
{
  MTRDescriptorClusterDeviceTypeStruct *v2;
  MTRDescriptorClusterDeviceTypeStruct *v3;
  NSNumber *deviceType;
  NSNumber *revision;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRDescriptorClusterDeviceTypeStruct;
  v2 = -[MTRDescriptorClusterDeviceTypeStruct init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    deviceType = v2->_deviceType;
    v2->_deviceType = (NSNumber *)&unk_250591B18;

    revision = v3->_revision;
    v3->_revision = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDescriptorClusterDeviceTypeStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRDescriptorClusterDeviceTypeStruct);
  objc_msgSend_deviceType(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setDeviceType_(v4, v8, (uint64_t)v7);

  objc_msgSend_revision(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRevision_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: deviceType:%@; revision:%@; >"),
    v5,
    self->_deviceType,
    self->_revision);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(NSNumber *)deviceType
{
  objc_setProperty_nonatomic_copy(self, a2, deviceType, 8);
}

- (NSNumber)revision
{
  return self->_revision;
}

- (void)setRevision:(NSNumber *)revision
{
  objc_setProperty_nonatomic_copy(self, a2, revision, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_revision, 0);
  objc_storeStrong((id *)&self->_deviceType, 0);
}

@end
