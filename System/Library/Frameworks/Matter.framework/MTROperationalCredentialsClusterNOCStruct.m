@implementation MTROperationalCredentialsClusterNOCStruct

- (MTROperationalCredentialsClusterNOCStruct)init
{
  const char *v2;
  uint64_t v3;
  MTROperationalCredentialsClusterNOCStruct *v4;
  uint64_t v5;
  NSData *noc;
  NSData *icac;
  NSNumber *fabricIndex;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MTROperationalCredentialsClusterNOCStruct;
  v4 = -[MTROperationalCredentialsClusterNOCStruct init](&v10, sel_init);
  if (v4)
  {
    objc_msgSend_data(MEMORY[0x24BDBCE50], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    noc = v4->_noc;
    v4->_noc = (NSData *)v5;

    icac = v4->_icac;
    v4->_icac = 0;

    fabricIndex = v4->_fabricIndex;
    v4->_fabricIndex = (NSNumber *)&unk_250591B18;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTROperationalCredentialsClusterNOCStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;

  v4 = objc_alloc_init(MTROperationalCredentialsClusterNOCStruct);
  objc_msgSend_noc(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNoc_(v4, v8, (uint64_t)v7);

  objc_msgSend_icac(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setIcac_(v4, v12, (uint64_t)v11);

  objc_msgSend_fabricIndex(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setFabricIndex_(v4, v16, (uint64_t)v15);

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
  const char *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_noc, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_base64EncodedStringWithOptions_(self->_icac, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v10, (uint64_t)CFSTR("<%@: noc:%@; icac:%@; fabricIndex:%@; >"),
    v5,
    v7,
    v9,
    self->_fabricIndex);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSData)noc
{
  return self->_noc;
}

- (void)setNoc:(NSData *)noc
{
  objc_setProperty_nonatomic_copy(self, a2, noc, 8);
}

- (NSData)icac
{
  return self->_icac;
}

- (void)setIcac:(NSData *)icac
{
  objc_setProperty_nonatomic_copy(self, a2, icac, 16);
}

- (NSNumber)fabricIndex
{
  return self->_fabricIndex;
}

- (void)setFabricIndex:(NSNumber *)fabricIndex
{
  objc_setProperty_nonatomic_copy(self, a2, fabricIndex, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fabricIndex, 0);
  objc_storeStrong((id *)&self->_icac, 0);
  objc_storeStrong((id *)&self->_noc, 0);
}

@end
