@implementation APTargetingCriteria

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APTargetingCriteria)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  APTargetingCriteria *v9;
  double v10;
  double v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t v17;
  NSString *identifier;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t v32;
  NSArray *values;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)APTargetingCriteria;
  v9 = -[APTargetingCriteria init](&v35, sel_init);
  if (v9)
  {
    v12 = objc_msgSend_classForCoder(MEMORY[0x24BDD17C8], v5, v6, v7, v8, v10, v11);
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v13, v12, (uint64_t)CFSTR("identifier"), v14, v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v17;

    v19 = (void *)MEMORY[0x24BDBCF20];
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    objc_msgSend_setWithObjects_(v19, v22, v20, v23, v24, v25, v26, v21, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v28, (uint64_t)v27, (uint64_t)CFSTR("values"), v29, v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    values = v9->_values;
    v9->_values = (NSArray *)v32;

  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  const char *v5;
  uint64_t v6;
  double v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;
  id v13;

  identifier = self->_identifier;
  v13 = a3;
  objc_msgSend_encodeObject_forKey_(v13, v5, (uint64_t)identifier, (uint64_t)CFSTR("identifier"), v6, v7, v8);
  objc_msgSend_encodeObject_forKey_(v13, v9, (uint64_t)self->_values, (uint64_t)CFSTR("values"), v10, v11, v12);

}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)values
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setValues:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
