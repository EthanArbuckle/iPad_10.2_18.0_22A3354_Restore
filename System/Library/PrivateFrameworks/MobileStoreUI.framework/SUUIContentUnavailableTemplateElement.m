@implementation SUUIContentUnavailableTemplateElement

- (SUUIButtonViewElement)button
{
  return (SUUIButtonViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 12);
}

- (SUUIImageViewElement)image
{
  return (SUUIImageViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 49);
}

- (SUUILabelViewElement)messageLabel
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
  v8 = __Block_byref_object_copy__45;
  v9 = __Block_byref_object_dispose__45;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__SUUIContentUnavailableTemplateElement_messageLabel__block_invoke;
  v4[3] = &unk_2511F4B90;
  v4[4] = &v5;
  -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SUUILabelViewElement *)v2;
}

void __53__SUUIContentUnavailableTemplateElement_messageLabel__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 138 && objc_msgSend(v6, "labelViewStyle") != 5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (SUUILabelViewElement)titleLabel
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
  v8 = __Block_byref_object_copy__45;
  v9 = __Block_byref_object_dispose__45;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__SUUIContentUnavailableTemplateElement_titleLabel__block_invoke;
  v4[3] = &unk_2511F4B90;
  v4[4] = &v5;
  -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SUUILabelViewElement *)v2;
}

void __51__SUUIContentUnavailableTemplateElement_titleLabel__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 138 && objc_msgSend(v6, "labelViewStyle") == 5)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (int64_t)pageComponentType
{
  return 24;
}

@end
