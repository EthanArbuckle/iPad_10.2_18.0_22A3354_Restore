@implementation SUUIIndexBarEntryListViewElement

- (SUUIIndexBarEntryListViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIIndexBarEntryListViewElement *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  objc_super v17;

  v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SUUIIndexBarEntryListViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v17, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("targetIndexBarEntryID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
      objc_storeStrong((id *)&v9->_targetIndexBarEntryID, v10);
    objc_msgSend(v8, "getAttribute:", CFSTR("type"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("dynamicElement")) & 1) != 0)
    {
      v12 = 1;
    }
    else
    {
      v13 = objc_msgSend(v11, "isEqualToString:", CFSTR("localeStandard"));
      v12 = 2;
      if (!v13)
        v12 = 0;
    }
    v9->_entryListElementType = v12;

    objc_msgSend(v8, "getAttribute:", CFSTR("indexBarHiddenWhenEmpty"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_indexBarHiddenWhenEmpty = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(v8, "getAttribute:", CFSTR("minimumEntityCount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_minimumEntityCount = objc_msgSend(v15, "integerValue");

  }
  return v9;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIIndexBarEntryListViewElement *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *targetIndexBarEntryID;
  objc_super v10;

  v4 = (SUUIIndexBarEntryListViewElement *)a3;
  v10.receiver = self;
  v10.super_class = (Class)SUUIIndexBarEntryListViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v10, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self || objc_msgSend(v5, "updateType"))
  {
    self->_entryListElementType = -[SUUIIndexBarEntryListViewElement entryListElementType](v4, "entryListElementType");
    self->_indexBarHiddenWhenEmpty = -[SUUIIndexBarEntryListViewElement isIndexBarHiddenWhenEmpty](v4, "isIndexBarHiddenWhenEmpty");
    self->_minimumEntityCount = -[SUUIIndexBarEntryListViewElement minimumEntityCount](v4, "minimumEntityCount");
    -[SUUIIndexBarEntryListViewElement targetIndexBarEntryID](v4, "targetIndexBarEntryID");
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    targetIndexBarEntryID = self->_targetIndexBarEntryID;
    self->_targetIndexBarEntryID = v7;

  }
  return v6;
}

- (NSArray)childIndexBarEntryElements
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
  v8 = __Block_byref_object_copy__30;
  v9 = __Block_byref_object_dispose__30;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __62__SUUIIndexBarEntryListViewElement_childIndexBarEntryElements__block_invoke;
  v4[3] = &unk_2511F4B90;
  v4[4] = &v5;
  -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __62__SUUIIndexBarEntryListViewElement_childIndexBarEntryElements__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "elementType") == 54)
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v3)
    {
      v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 1);
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v3, "addObject:", v7);
  }

}

- (int64_t)entryListElementType
{
  return self->_entryListElementType;
}

- (BOOL)isIndexBarHiddenWhenEmpty
{
  return self->_indexBarHiddenWhenEmpty;
}

- (int64_t)minimumEntityCount
{
  return self->_minimumEntityCount;
}

- (NSString)targetIndexBarEntryID
{
  return self->_targetIndexBarEntryID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetIndexBarEntryID, 0);
}

@end
