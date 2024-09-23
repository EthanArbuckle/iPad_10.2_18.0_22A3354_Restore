@implementation SUUISplitViewTemplateElement

- (SUUISplitViewTemplateElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUISplitViewTemplateElement *v9;
  SUUISplitViewTemplateElement *v10;
  uint64_t v11;
  SUUIJSDOMFeatureNavigationDocument *leftNavigationDocument;
  uint64_t v13;
  SUUIJSDOMFeatureNavigationDocument *rightNavigationDocument;
  void *v15;
  uint64_t v16;
  objc_super v18;

  v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SUUISplitViewTemplateElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v18, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  v10 = v9;
  if (v9)
  {
    -[SUUIViewElement featureWithName:](v9, "featureWithName:", 0x251208108);
    v11 = objc_claimAutoreleasedReturnValue();
    leftNavigationDocument = v10->_leftNavigationDocument;
    v10->_leftNavigationDocument = (SUUIJSDOMFeatureNavigationDocument *)v11;

    -[SUUIViewElement featureWithName:](v10, "featureWithName:", 0x251208128);
    v13 = objc_claimAutoreleasedReturnValue();
    rightNavigationDocument = v10->_rightNavigationDocument;
    v10->_rightNavigationDocument = (SUUIJSDOMFeatureNavigationDocument *)v13;

    objc_msgSend(v8, "getAttribute:", CFSTR("displayMode"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("all")))
    {
      v16 = 2;
    }
    else if (objc_msgSend(v15, "isEqualToString:", CFSTR("hidden")))
    {
      v16 = 1;
    }
    else
    {
      if (!objc_msgSend(v15, "isEqualToString:", CFSTR("overlay")))
      {
        v10->_preferredDisplayMode = 0;
        goto LABEL_9;
      }
      v16 = 3;
    }
    v10->_preferredDisplayMode = v16;
LABEL_9:

  }
  return v10;
}

- (SUUIJSDOMFeatureNavigationDocument)leftNavigationDocument
{
  return self->_leftNavigationDocument;
}

- (SUUIViewElement)leftSplitElement
{
  return (SUUIViewElement *)-[SUUISplitViewTemplateElement _splitElementForIndex:](self, "_splitElementForIndex:", 0);
}

- (SUUIJSDOMFeatureNavigationDocument)rightNavigationDocument
{
  return self->_rightNavigationDocument;
}

- (SUUIViewElement)rightSplitElement
{
  return (SUUIViewElement *)-[SUUISplitViewTemplateElement _splitElementForIndex:](self, "_splitElementForIndex:", 1);
}

- (BOOL)usesInlineSplitContent
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[SUUISplitViewTemplateElement leftSplitElement](self, "leftSplitElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 1;
  }
  else
  {
    -[SUUISplitViewTemplateElement rightSplitElement](self, "rightSplitElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "children");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "count") != 0;

  }
  return v5;
}

+ (id)supportedFeatures
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = 0x251208108;
  v3[1] = 0x251208128;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUISplitViewTemplateElement *v4;
  SUUISplitViewTemplateElement *v5;
  SUUISplitViewTemplateElement *v6;
  objc_super v8;

  v4 = (SUUISplitViewTemplateElement *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SUUISplitViewTemplateElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v8, sel_applyUpdatesWithElement_, v4);
  v5 = (SUUISplitViewTemplateElement *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self && v5 == self)
    self->_preferredDisplayMode = -[SUUISplitViewTemplateElement preferredDisplayMode](v4, "preferredDisplayMode");

  return v6;
}

- (id)_splitElementForIndex:(int64_t)a3
{
  void *v4;
  id v5;
  _QWORD v7[7];
  _QWORD v8[4];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__85;
  v13 = __Block_byref_object_dispose__85;
  v14 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  -[SUUISplitViewTemplateElement children](self, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __54__SUUISplitViewTemplateElement__splitElementForIndex___block_invoke;
  v7[3] = &unk_2511FC7D8;
  v7[5] = &v9;
  v7[6] = a3;
  v7[4] = v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  v5 = (id)v10[5];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __54__SUUISplitViewTemplateElement__splitElementForIndex___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "elementType") == 128)
  {
    v7 = *(_QWORD *)(a1[4] + 8);
    v8 = *(_QWORD *)(v7 + 24);
    if (v8 == a1[6])
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
      *a4 = 1;
      v7 = *(_QWORD *)(a1[4] + 8);
      v8 = *(_QWORD *)(v7 + 24);
    }
    *(_QWORD *)(v7 + 24) = v8 + 1;
  }

}

- (int64_t)preferredDisplayMode
{
  return self->_preferredDisplayMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightNavigationDocument, 0);
  objc_storeStrong((id *)&self->_leftNavigationDocument, 0);
}

@end
