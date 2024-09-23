@implementation SUUIIndexBarEntryViewElement

- (SUUIIndexBarEntryViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIIndexBarEntryViewElement *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUIIndexBarEntryViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v15, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("targetIndexBarEntryID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      objc_storeStrong((id *)&v9->_targetIndexBarEntryID, v10);
    objc_msgSend(v8, "getAttribute:", CFSTR("visibility"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("required"));
    v13 = 1000;
    if (!v12)
      v13 = 0;
    v9->_visibilityPriority = v13;

  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIIndexBarEntryViewElement *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *targetIndexBarEntryID;
  objc_super v10;

  v4 = (SUUIIndexBarEntryViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIIndexBarEntryViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    -[SUUIIndexBarEntryViewElement targetIndexBarEntryID](v4, "targetIndexBarEntryID");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    targetIndexBarEntryID = self->_targetIndexBarEntryID;
    self->_targetIndexBarEntryID = v7;

    self->_visibilityPriority = -[SUUIIndexBarEntryViewElement visibilityPriority](v4, "visibilityPriority");
  }

  return v6;
}

- (SUUIViewElement)childElement
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
  v8 = __Block_byref_object_copy__57;
  v9 = __Block_byref_object_dispose__57;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__SUUIIndexBarEntryViewElement_childElement__block_invoke;
  v4[3] = &unk_2511F4B90;
  v4[4] = &v5;
  -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (SUUIViewElement *)v2;
}

void __44__SUUIIndexBarEntryViewElement_childElement__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

- (NSString)targetIndexBarEntryID
{
  return self->_targetIndexBarEntryID;
}

- (int64_t)visibilityPriority
{
  return self->_visibilityPriority;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetIndexBarEntryID, 0);
}

@end
