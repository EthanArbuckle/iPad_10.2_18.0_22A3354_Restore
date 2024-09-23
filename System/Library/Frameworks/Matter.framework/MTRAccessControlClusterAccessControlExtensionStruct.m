@implementation MTRAccessControlClusterAccessControlExtensionStruct

- (MTRAccessControlClusterAccessControlExtensionStruct)init
{
  const char *v2;
  uint64_t v3;
  MTRAccessControlClusterAccessControlExtensionStruct *v4;
  uint64_t v5;
  NSData *data;
  NSNumber *fabricIndex;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRAccessControlClusterAccessControlExtensionStruct;
  v4 = -[MTRAccessControlClusterAccessControlExtensionStruct init](&v9, sel_init);
  if (v4)
  {
    objc_msgSend_data(MEMORY[0x24BDBCE50], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    data = v4->_data;
    v4->_data = (NSData *)v5;

    fabricIndex = v4->_fabricIndex;
    v4->_fabricIndex = (NSNumber *)&unk_250591B18;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRAccessControlClusterAccessControlExtensionStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRAccessControlClusterAccessControlExtensionStruct);
  objc_msgSend_data(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setData_(v4, v8, (uint64_t)v7);

  objc_msgSend_fabricIndex(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFabricIndex_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_data, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("<%@: data:%@; fabricIndex:%@; >"), v5, v7, self->_fabricIndex);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(NSData *)data
{
  objc_setProperty_nonatomic_copy(self, a2, data, 8);
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(NSNumber *)fabricIndex
{
  objc_setProperty_nonatomic_copy(self, a2, fabricIndex, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end
