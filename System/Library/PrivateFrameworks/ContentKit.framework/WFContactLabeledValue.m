@implementation WFContactLabeledValue

- (WFContactLabeledValue)initWithLabel:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  NSString *v8;
  NSString *label;
  WFContactLabeledValue *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (v7
    && (v12.receiver = self,
        v12.super_class = (Class)WFContactLabeledValue,
        (self = -[WFContactLabeledValue init](&v12, sel_init)) != 0))
  {
    v8 = (NSString *)objc_msgSend(v6, "copy");
    label = self->_label;
    self->_label = v8;

    objc_storeStrong(&self->_value, a4);
    self = self;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)WFContactLabeledValue;
  -[WFContactLabeledValue description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContactLabeledValue label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFContactLabeledValue value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: label=%@, value=%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)label
{
  return self->_label;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

+ (WFContactLabeledValue)labeledValueWithLabel:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLabel:value:", v7, v6);

  return (WFContactLabeledValue *)v8;
}

+ (id)localizedStringForLabel:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v4 = (void *)getCNLabeledValueClass_softClass;
  v12 = getCNLabeledValueClass_softClass;
  if (!getCNLabeledValueClass_softClass)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getCNLabeledValueClass_block_invoke;
    v8[3] = &unk_24C4E3118;
    v8[4] = &v9;
    __getCNLabeledValueClass_block_invoke((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v9, 8);
  objc_msgSend(v5, "localizedStringForLabel:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
