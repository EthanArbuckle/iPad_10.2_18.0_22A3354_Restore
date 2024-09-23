@implementation SUUICommentTemplateViewElement

- (SUUICommentTemplateViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUICommentTemplateViewElement *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v8 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SUUICommentTemplateViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v23, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("postPlaceholderText"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_storeStrong((id *)&v9->_postPlaceholderText, v10);
    objc_msgSend(v8, "getAttribute:", CFSTR("postButtonText"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      objc_storeStrong((id *)&v9->_postButtonText, v11);
    objc_msgSend(v8, "getAttribute:", CFSTR("scrollNewCommentToView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "lowercaseString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_scrollNewCommentToView = objc_msgSend(v14, "isEqualToString:", CFSTR("true"));

    }
    objc_msgSend(v8, "getAttribute:", CFSTR("showKeyboard"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "lowercaseString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_showKeyboard = objc_msgSend(v17, "isEqualToString:", CFSTR("true"));

    }
    objc_msgSend(v8, "getAttribute:", CFSTR("asText"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_storeStrong((id *)&v9->_asText, v18);
    objc_msgSend(v8, "getAttribute:", CFSTR("asFormat"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      objc_storeStrong((id *)&v9->_asFormat, v19);
    objc_msgSend(v8, "getAttribute:", CFSTR("commentAsText"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      objc_storeStrong((id *)&v9->_commentAsText, v20);
    objc_msgSend(v8, "getAttribute:", CFSTR("myselfText"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      objc_storeStrong((id *)&v9->_myselfText, v21);

  }
  return v9;
}

- (NSString)asText
{
  return self->_asText;
}

- (NSString)asFormat
{
  return self->_asFormat;
}

- (NSString)commentAsText
{
  return self->_commentAsText;
}

- (NSString)myselfText
{
  return self->_myselfText;
}

- (NSString)postButtonText
{
  return self->_postButtonText;
}

- (NSString)postPlaceholderText
{
  return self->_postPlaceholderText;
}

- (BOOL)scrollNewCommentToView
{
  return self->_scrollNewCommentToView;
}

- (BOOL)showKeyboard
{
  return self->_showKeyboard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postPlaceholderText, 0);
  objc_storeStrong((id *)&self->_postButtonText, 0);
  objc_storeStrong((id *)&self->_myselfText, 0);
  objc_storeStrong((id *)&self->_commentAsText, 0);
  objc_storeStrong((id *)&self->_asFormat, 0);
  objc_storeStrong((id *)&self->_asText, 0);
}

@end
