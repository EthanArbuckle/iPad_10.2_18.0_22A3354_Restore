@implementation MTRFixedLabelClusterLabelStruct

- (MTRFixedLabelClusterLabelStruct)init
{
  MTRFixedLabelClusterLabelStruct *v2;
  MTRFixedLabelClusterLabelStruct *v3;
  NSString *label;
  NSString *value;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRFixedLabelClusterLabelStruct;
  v2 = -[MTRFixedLabelClusterLabelStruct init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    label = v2->_label;
    v2->_label = (NSString *)&stru_2505249E8;

    value = v3->_value;
    v3->_value = (NSString *)&stru_2505249E8;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRFixedLabelClusterLabelStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRFixedLabelClusterLabelStruct);
  objc_msgSend_label(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLabel_(v4, v8, (uint64_t)v7);

  objc_msgSend_value(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: label:%@; value:%@; >"), v5, self->_label, self->_value);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(NSString *)label
{
  objc_setProperty_nonatomic_copy(self, a2, label, 8);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(NSString *)value
{
  objc_setProperty_nonatomic_copy(self, a2, value, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
