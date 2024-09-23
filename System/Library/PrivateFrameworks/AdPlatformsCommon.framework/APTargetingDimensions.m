@implementation APTargetingDimensions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APTargetingDimensions)initWithCoder:(id)a3
{
  id v4;
  APTargetingDimensions *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t v19;
  NSArray *inclusionCriteria;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  double v32;
  double v33;
  uint64_t v34;
  NSArray *exclusionCriteria;
  objc_super v37;

  v4 = a3;
  v37.receiver = self;
  v37.super_class = (Class)APTargetingDimensions;
  v5 = -[APTargetingDimensions init](&v37, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend_setWithObjects_(v6, v9, v7, v10, v11, v12, v13, v8, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v15, (uint64_t)v14, (uint64_t)CFSTR("inclusionCriteria"), v16, v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    inclusionCriteria = v5->_inclusionCriteria;
    v5->_inclusionCriteria = (NSArray *)v19;

    v21 = (void *)MEMORY[0x24BDBCF20];
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    objc_msgSend_setWithObjects_(v21, v24, v22, v25, v26, v27, v28, v23, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v30, (uint64_t)v29, (uint64_t)CFSTR("exclusionCriteria"), v31, v32, v33);
    v34 = objc_claimAutoreleasedReturnValue();
    exclusionCriteria = v5->_exclusionCriteria;
    v5->_exclusionCriteria = (NSArray *)v34;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *inclusionCriteria;
  const char *v5;
  uint64_t v6;
  double v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  id v13;

  inclusionCriteria = self->_inclusionCriteria;
  v13 = a3;
  objc_msgSend_encodeObject_forKey_(v13, v5, (uint64_t)inclusionCriteria, (uint64_t)CFSTR("inclusionCriteria"), v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v13, v9, (uint64_t)self->_exclusionCriteria, (uint64_t)CFSTR("exclusionCriteria"), v10, v11, v12);

}

- (NSArray)inclusionCriteria
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInclusionCriteria:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)exclusionCriteria
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setExclusionCriteria:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclusionCriteria, 0);
  objc_storeStrong((id *)&self->_inclusionCriteria, 0);
}

@end
