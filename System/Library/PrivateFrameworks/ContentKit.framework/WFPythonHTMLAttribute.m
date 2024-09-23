@implementation WFPythonHTMLAttribute

- (WFPythonHTMLAttribute)initWithName:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  WFPythonHTMLAttribute *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSString *value;
  WFPythonHTMLAttribute *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFPythonHTMLAttribute;
  v8 = -[WFPythonHTMLAttribute init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    value = v8->_value;
    v8->_value = (NSString *)v11;

    v13 = v8;
  }

  return v8;
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
  v9.super_class = (Class)WFPythonHTMLAttribute;
  -[WFPythonHTMLAttribute description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPythonHTMLAttribute name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPythonHTMLAttribute value](self, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@=%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
