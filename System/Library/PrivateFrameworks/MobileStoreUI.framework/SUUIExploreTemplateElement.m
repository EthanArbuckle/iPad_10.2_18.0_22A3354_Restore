@implementation SUUIExploreTemplateElement

- (SUUIExploreTemplateElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIExploreTemplateElement *v9;
  void *v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUIExploreTemplateElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v12, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "childElementsByTagName:", CFSTR("split"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_usesSplits = objc_msgSend(v10, "count") == 2;

  }
  return v9;
}

- (NSArray)childViewElements
{
  void *v3;
  SUUIExploreTemplateElement *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self;
  v5 = v4;
  if (v4->_usesSplits)
  {
    -[SUUIExploreTemplateElement leftSplit](v4, "leftSplit");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__SUUIExploreTemplateElement_childViewElements__block_invoke;
  v9[3] = &unk_2511F46F8;
  v7 = v3;
  v10 = v7;
  objc_msgSend(v5, "enumerateChildrenUsingBlock:", v9);

  return (NSArray *)v7;
}

void __47__SUUIExploreTemplateElement_childViewElements__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (SUUIViewElement)leftSplit
{
  id v3;

  if (!self->_usesSplits)
    return (SUUIViewElement *)0;
  v3 = 0;
  -[SUUIExploreTemplateElement _getLeftSplit:rightSplit:](self, "_getLeftSplit:rightSplit:", &v3, 0);
  return (SUUIViewElement *)v3;
}

- (SUUINavigationBarViewElement)navigationBarElement
{
  return (SUUINavigationBarViewElement *)-[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 74);
}

- (SUUIViewElement)rightSplit
{
  id v3;

  if (!self->_usesSplits)
    return (SUUIViewElement *)0;
  v3 = 0;
  -[SUUIExploreTemplateElement _getLeftSplit:rightSplit:](self, "_getLeftSplit:rightSplit:", 0, &v3);
  return (SUUIViewElement *)v3;
}

- (void)_getLeftSplit:(id *)a3 rightSplit:(id *)a4
{
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__11;
  v18 = __Block_byref_object_dispose__11;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__11;
  v12 = __Block_byref_object_dispose__11;
  v13 = 0;
  -[SUUIExploreTemplateElement children](self, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__SUUIExploreTemplateElement__getLeftSplit_rightSplit___block_invoke;
  v7[3] = &unk_2511F5958;
  v7[4] = &v14;
  v7[5] = &v8;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

  if (a3)
    *a3 = objc_retainAutorelease((id)v15[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v9[5]);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
}

void __55__SUUIExploreTemplateElement__getLeftSplit_rightSplit___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  id *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "elementType") == 128)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(_QWORD *)(v7 + 40);
    v8 = (id *)(v7 + 40);
    if (v9)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
      *a4 = 1;
    }
    else
    {
      objc_storeStrong(v8, a2);
    }
  }

}

- (BOOL)usesSplits
{
  return self->_usesSplits;
}

@end
