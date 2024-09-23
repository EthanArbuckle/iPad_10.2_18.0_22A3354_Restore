@implementation MTROTASoftwareUpdateRequestorClusterVersionAppliedEvent

- (MTROTASoftwareUpdateRequestorClusterVersionAppliedEvent)init
{
  MTROTASoftwareUpdateRequestorClusterVersionAppliedEvent *v2;
  MTROTASoftwareUpdateRequestorClusterVersionAppliedEvent *v3;
  NSNumber *softwareVersion;
  NSNumber *productID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTROTASoftwareUpdateRequestorClusterVersionAppliedEvent;
  v2 = -[MTROTASoftwareUpdateRequestorClusterVersionAppliedEvent init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    softwareVersion = v2->_softwareVersion;
    v2->_softwareVersion = (NSNumber *)&unk_250591B18;

    productID = v3->_productID;
    v3->_productID = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTROTASoftwareUpdateRequestorClusterVersionAppliedEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTROTASoftwareUpdateRequestorClusterVersionAppliedEvent);
  objc_msgSend_softwareVersion(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSoftwareVersion_(v4, v8, (uint64_t)v7);

  objc_msgSend_productID(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProductID_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: softwareVersion:%@; productID:%@; >"),
    v5,
    self->_softwareVersion,
    self->_productID);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)softwareVersion
{
  return self->_softwareVersion;
}

- (void)setSoftwareVersion:(NSNumber *)softwareVersion
{
  objc_setProperty_nonatomic_copy(self, a2, softwareVersion, 8);
}

- (NSNumber)productID
{
  return self->_productID;
}

- (void)setProductID:(NSNumber *)productID
{
  objc_setProperty_nonatomic_copy(self, a2, productID, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productID, 0);
  objc_storeStrong((id *)&self->_softwareVersion, 0);
}

@end
