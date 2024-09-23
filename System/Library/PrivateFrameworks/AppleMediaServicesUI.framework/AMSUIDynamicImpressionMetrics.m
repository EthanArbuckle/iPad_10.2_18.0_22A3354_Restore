@implementation AMSUIDynamicImpressionMetrics

- (AMSUIDynamicImpressionMetrics)initWithIdentifier:(id)a3 fields:(id)a4 custom:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_class *v12;
  AMSUIDynamicImpressionMetrics *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v11 = (void *)getAMSUIDDynamicImpressionMetricsClass_softClass;
  v19 = getAMSUIDDynamicImpressionMetricsClass_softClass;
  if (!getAMSUIDDynamicImpressionMetricsClass_softClass)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __getAMSUIDDynamicImpressionMetricsClass_block_invoke;
    v15[3] = &unk_24CB4F3E8;
    v15[4] = &v16;
    __getAMSUIDDynamicImpressionMetricsClass_block_invoke((uint64_t)v15);
    v11 = (void *)v17[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v16, 8);
  v13 = (AMSUIDynamicImpressionMetrics *)objc_msgSend([v12 alloc], "initWithIdentifier:fields:custom:", v8, v9, v10);

  return v13;
}

- (NSDictionary)custom
{
  return self->_custom;
}

- (void)setCustom:(id)a3
{
  objc_storeStrong((id *)&self->_custom, a3);
}

- (NSDictionary)fields
{
  return self->_fields;
}

- (void)setFields:(id)a3
{
  objc_storeStrong((id *)&self->_fields, a3);
}

- (AMSUIDynamicImpressionMetricsIdentifier)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_fields, 0);
  objc_storeStrong((id *)&self->_custom, 0);
}

@end
