@implementation MTREnergyPreferenceClusterBalanceStruct

- (MTREnergyPreferenceClusterBalanceStruct)init
{
  MTREnergyPreferenceClusterBalanceStruct *v2;
  MTREnergyPreferenceClusterBalanceStruct *v3;
  NSNumber *step;
  NSString *label;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTREnergyPreferenceClusterBalanceStruct;
  v2 = -[MTREnergyPreferenceClusterBalanceStruct init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    step = v2->_step;
    v2->_step = (NSNumber *)&unk_250591B18;

    label = v3->_label;
    v3->_label = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTREnergyPreferenceClusterBalanceStruct *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTREnergyPreferenceClusterBalanceStruct);
  objc_msgSend_step(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStep_(v4, v8, (uint64_t)v7);

  objc_msgSend_label(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setLabel_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: step:%@; label:%@; >"), v5, self->_step, self->_label);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)step
{
  return self->_step;
}

- (void)setStep:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_step, 0);
}

@end
