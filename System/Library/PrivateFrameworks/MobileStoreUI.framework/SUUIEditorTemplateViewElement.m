@implementation SUUIEditorTemplateViewElement

- (SUUIEditorTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIEditorTemplateViewElement *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSNumber *contentId;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SUUIEditorTemplateViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v16, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("contentId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = objc_msgSend(v10, "longLongValue");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      contentId = v9->_contentId;
      v9->_contentId = (NSNumber *)v13;

    }
  }

  return v9;
}

- (NSNumber)contentId
{
  return self->_contentId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentId, 0);
}

@end
