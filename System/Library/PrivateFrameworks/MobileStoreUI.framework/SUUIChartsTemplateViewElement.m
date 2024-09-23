@implementation SUUIChartsTemplateViewElement

- (SUUIChartsTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIChartsTemplateViewElement *v9;
  uint64_t v10;
  NSString *type;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SUUIChartsTemplateViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v13, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("type"));
    v10 = objc_claimAutoreleasedReturnValue();
    type = v9->_type;
    v9->_type = (NSString *)v10;

  }
  return v9;
}

- (SUUIActivityIndicatorViewElement)activityIndicator
{
  return (SUUIActivityIndicatorViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 4);
}

- (NSArray)columns
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__SUUIChartsTemplateViewElement_columns__block_invoke;
  v6[3] = &unk_2511F46F8;
  v4 = v3;
  v7 = v4;
  -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v6);

  return (NSArray *)v4;
}

void __40__SUUIChartsTemplateViewElement_columns__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 21)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (SUUINavigationBarViewElement)navigationBarElement
{
  return (SUUINavigationBarViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 74);
}

- (NSString)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
}

@end
