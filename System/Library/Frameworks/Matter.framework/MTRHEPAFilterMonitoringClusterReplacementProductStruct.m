@implementation MTRHEPAFilterMonitoringClusterReplacementProductStruct

- (MTRHEPAFilterMonitoringClusterReplacementProductStruct)init
{
  MTRHEPAFilterMonitoringClusterReplacementProductStruct *v2;
  MTRHEPAFilterMonitoringClusterReplacementProductStruct *v3;
  NSNumber *productIdentifierType;
  NSString *productIdentifierValue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRHEPAFilterMonitoringClusterReplacementProductStruct;
  v2 = -[MTRHEPAFilterMonitoringClusterReplacementProductStruct init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    productIdentifierType = v2->_productIdentifierType;
    v2->_productIdentifierType = (NSNumber *)&unk_250591B18;

    productIdentifierValue = v3->_productIdentifierValue;
    v3->_productIdentifierValue = (NSString *)&stru_2505249E8;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRHEPAFilterMonitoringClusterReplacementProductStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRHEPAFilterMonitoringClusterReplacementProductStruct);
  objc_msgSend_productIdentifierType(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProductIdentifierType_(v4, v8, (uint64_t)v7);

  objc_msgSend_productIdentifierValue(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setProductIdentifierValue_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: productIdentifierType:%@; productIdentifierValue:%@; >"),
    v5,
    self->_productIdentifierType,
    self->_productIdentifierValue);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)productIdentifierType
{
  return self->_productIdentifierType;
}

- (void)setProductIdentifierType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)productIdentifierValue
{
  return self->_productIdentifierValue;
}

- (void)setProductIdentifierValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productIdentifierValue, 0);
  objc_storeStrong((id *)&self->_productIdentifierType, 0);
}

@end
