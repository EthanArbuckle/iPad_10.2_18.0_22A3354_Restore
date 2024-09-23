@implementation SUUIReportAConcernReasonViewElement

- (SUUIReportAConcernReasonViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIReportAConcernReasonViewElement *v9;
  void *v10;
  uint64_t v11;
  NSNumber *reasonID;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *name;
  objc_super v18;

  v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SUUIReportAConcernReasonViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v18, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("data-content-id"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v10, "integerValue"));
    v11 = objc_claimAutoreleasedReturnValue();
    reasonID = v9->_reasonID;
    v9->_reasonID = (NSNumber *)v11;

    objc_msgSend(v8, "getAttribute:", CFSTR("data-uppercase-name"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
      v14 = v13;
    else
      v14 = 0;
    objc_storeStrong((id *)&v9->_uppercaseName, v14);
    objc_msgSend(v8, "textContent");
    v15 = objc_claimAutoreleasedReturnValue();
    name = v9->_name;
    v9->_name = (NSString *)v15;

  }
  return v9;
}

- (NSNumber)reasonID
{
  return self->_reasonID;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)uppercaseName
{
  return self->_uppercaseName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uppercaseName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_reasonID, 0);
}

@end
