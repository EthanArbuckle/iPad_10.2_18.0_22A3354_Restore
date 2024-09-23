@implementation SUUIURLViewElement

- (SUUIURLViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIURLViewElement *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSURL *url;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SUUIURLViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v16, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "textContent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v12);
      url = v9->_url;
      v9->_url = (NSURL *)v13;

      v10 = (void *)v12;
    }

  }
  return v9;
}

- (NSURL)URL
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
