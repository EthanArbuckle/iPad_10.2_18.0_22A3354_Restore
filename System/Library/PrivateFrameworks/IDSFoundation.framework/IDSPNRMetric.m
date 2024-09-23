@implementation IDSPNRMetric

- (IDSPNRMetric)initWithPNRReason:(int64_t)a3 mechanism:(int64_t)a4
{
  IDSPNRMetric *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IDSPNRMetric;
  result = -[IDSPNRMetric init](&v7, sel_init);
  if (result)
  {
    result->_pnrReason = a3;
    result->_mechanism = a4;
  }
  return result;
}

- (NSString)name
{
  return (NSString *)CFSTR("pnr");
}

- (NSDictionary)dictionaryRepresentation
{
  uint64_t v2;
  double v3;
  void *v5;
  uint64_t v6;
  const char *v7;
  double v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  const char *v15;
  double v16;
  void *v17;
  const char *v18;
  double v19;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v22[0] = CFSTR("reason");
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = objc_msgSend_pnrReason(self, a2, v2, v3);
  objc_msgSend_numberWithInteger_(v5, v7, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = CFSTR("mechanism");
  v23[0] = v9;
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v14 = objc_msgSend_mechanism(self, v11, v12, v13);
  objc_msgSend_numberWithInteger_(v10, v15, v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v17;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v18, (uint64_t)v23, v19, v22, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v20;
}

- (int64_t)pnrReason
{
  return self->_pnrReason;
}

- (void)setPnrReason:(int64_t)a3
{
  self->_pnrReason = a3;
}

- (int64_t)mechanism
{
  return self->_mechanism;
}

- (void)setMechanism:(int64_t)a3
{
  self->_mechanism = a3;
}

@end
