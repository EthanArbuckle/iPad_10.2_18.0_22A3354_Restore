@implementation SUUIReportAConcernTemplateViewElement

- (SUUIReportAConcernTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIReportAConcernTemplateViewElement *v9;
  void *v10;
  uint64_t v11;
  NSURL *reportConcernURL;
  void *v13;
  uint64_t v14;
  NSString *reportConcernExplanation;
  objc_super v17;

  v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUUIReportAConcernTemplateViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v17, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("src"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    reportConcernURL = v9->_reportConcernURL;
    v9->_reportConcernURL = (NSURL *)v11;

    objc_msgSend(v8, "getAttribute:", CFSTR("data-content-id"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_itemIdentifier = objc_msgSend(v13, "longLongValue");

    objc_msgSend(v8, "getAttribute:", CFSTR("data-explanation"));
    v14 = objc_claimAutoreleasedReturnValue();
    reportConcernExplanation = v9->_reportConcernExplanation;
    v9->_reportConcernExplanation = (NSString *)v14;

  }
  return v9;
}

- (NSArray)reasonElements
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__SUUIReportAConcernTemplateViewElement_reasonElements__block_invoke;
  v7[3] = &unk_2511F46F8;
  v8 = v3;
  v4 = v3;
  -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSArray *)v5;
}

void __55__SUUIReportAConcernTemplateViewElement_reasonElements__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (NSURL)reportConcernURL
{
  return self->_reportConcernURL;
}

- (int64_t)itemIdentifier
{
  return self->_itemIdentifier;
}

- (NSString)reportConcernExplanation
{
  return self->_reportConcernExplanation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportConcernExplanation, 0);
  objc_storeStrong((id *)&self->_reportConcernURL, 0);
}

@end
