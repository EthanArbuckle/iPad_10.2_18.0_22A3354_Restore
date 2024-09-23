@implementation SUUIShareSheetActivityViewElement

- (SUUIShareSheetActivityViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIShareSheetActivityViewElement *v9;
  uint64_t v10;
  NSString *activityType;
  void *v12;
  uint64_t v13;
  NSURL *contentSourceURL;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SUUIShareSheetActivityViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v16, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("type"));
    v10 = objc_claimAutoreleasedReturnValue();
    activityType = v9->_activityType;
    v9->_activityType = (NSString *)v10;

    objc_msgSend(v8, "getAttribute:", CFSTR("src"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "length"))
    {
      v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v12);
      contentSourceURL = v9->_contentSourceURL;
      v9->_contentSourceURL = (NSURL *)v13;

    }
  }

  return v9;
}

- (SUUIImageViewElement)image
{
  return (SUUIImageViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 49);
}

- (SUUILabelViewElement)message
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__69;
  v9 = __Block_byref_object_dispose__69;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__SUUIShareSheetActivityViewElement_message__block_invoke;
  v4[3] = &unk_2511F4B90;
  v4[4] = &v5;
  -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SUUILabelViewElement *)v2;
}

void __44__SUUIShareSheetActivityViewElement_message__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 138 && objc_msgSend(v6, "labelViewStyle") != 5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (SUUILabelViewElement)title
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__69;
  v9 = __Block_byref_object_dispose__69;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__SUUIShareSheetActivityViewElement_title__block_invoke;
  v4[3] = &unk_2511F4B90;
  v4[4] = &v5;
  -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SUUILabelViewElement *)v2;
}

void __42__SUUIShareSheetActivityViewElement_title__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 138 && objc_msgSend(v6, "labelViewStyle") == 5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (SUUIURLViewElement)URL
{
  return (SUUIURLViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 151);
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIShareSheetActivityViewElement *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *activityType;
  NSURL *v9;
  NSURL *contentSourceURL;
  objc_super v12;

  v4 = (SUUIShareSheetActivityViewElement *)a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUIShareSheetActivityViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v12, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    -[SUUIShareSheetActivityViewElement activityType](v4, "activityType");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    activityType = self->_activityType;
    self->_activityType = v7;

    -[SUUIShareSheetActivityViewElement contentSourceURL](v4, "contentSourceURL");
    v9 = (NSURL *)objc_claimAutoreleasedReturnValue();
    contentSourceURL = self->_contentSourceURL;
    self->_contentSourceURL = v9;

  }
  return v6;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (NSURL)contentSourceURL
{
  return self->_contentSourceURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentSourceURL, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
}

@end
