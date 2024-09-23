@implementation SUUIViewElement

- (id)expandableLabelElementForWidth:(double)a3 context:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  double v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__16;
  v18 = __Block_byref_object_dispose__16;
  v19 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __85__SUUIViewElement_SUUIReviewListPageSection__expandableLabelElementForWidth_context___block_invoke;
  v10[3] = &unk_2511F4A28;
  v7 = v6;
  v13 = a3;
  v11 = v7;
  v12 = &v14;
  -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __85__SUUIViewElement_SUUIReviewListPageSection__expandableLabelElementForWidth_context___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "elementType") == 138 && objc_msgSend(v8, "labelViewStyle") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "editorialLayoutForLabelElement:width:", v8, *(double *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 32), "isEditorialLayoutExpanded:", v6) & 1) == 0)
    {
      objc_msgSend(v6, "bodyTextLayoutForOrientation:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "requiresTruncation"))
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
        *a3 = 1;
      }

    }
  }

}

- (SUUIViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8;
  SUUIViewElement *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUIViewElement;
  v9 = -[SUUIViewElement initWithDOMElement:parent:elementFactory:](&v15, sel_initWithDOMElement_parent_elementFactory_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "getAttribute:", CFSTR("pin"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("alone")) & 1) != 0)
    {
      v11 = 2;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("group")) & 1) != 0)
    {
      v11 = 3;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("rubberband")) & 1) != 0)
    {
      v11 = 4;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("group-rubberband")) & 1) != 0)
    {
      v11 = 5;
    }
    else
    {
      if (!objc_msgSend(v10, "length"))
      {
LABEL_14:
        objc_msgSend(v8, "getAttribute:", CFSTR("pinGroup"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v9->_pinGroup = objc_msgSend(v13, "isEqualToString:", CFSTR("before-top"));

        goto LABEL_15;
      }
      v12 = objc_msgSend(v10, "BOOLValue");
      v11 = 1;
      if (v12)
        v11 = 2;
    }
    v9->_pinStyle = v11;
    goto LABEL_14;
  }
LABEL_15:

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_entityProvider)
    -[SUUIViewElement _unregisterForNotificationsForEntityProvider:](self, "_unregisterForNotificationsForEntityProvider:");
  v3.receiver = self;
  v3.super_class = (Class)SUUIViewElement;
  -[SUUIViewElement dealloc](&v3, sel_dealloc);
}

- (BOOL)canMoveWithinCollection
{
  void *v2;
  void *v3;
  char v4;

  -[SUUIViewElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("canMoveWithinCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (id)ancestorElementMatchingPredicate:(id)a3
{
  unsigned int (**v4)(id, id);
  id v5;
  void *v6;

  v4 = (unsigned int (**)(id, id))a3;
  -[SUUIViewElement parent](self, "parent");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    while (!v4[2](v4, v5))
    {
      objc_msgSend(v5, "parent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v6;
      if (!v6)
        goto LABEL_7;
    }
    v5 = v5;
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
LABEL_7:

  return v5;
}

- (id)ancestorElementOfType:(unint64_t)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__SUUIViewElement_ancestorElementOfType___block_invoke;
  v4[3] = &__block_descriptor_40_e25_B16__0__SUUIViewElement_8l;
  v4[4] = a3;
  -[SUUIViewElement ancestorElementMatchingPredicate:](self, "ancestorElementMatchingPredicate:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL __41__SUUIViewElement_ancestorElementOfType___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "elementType") == *(_QWORD *)(a1 + 32);
}

- (BOOL)descendsFromElementWithType:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;

  -[SUUIViewElement parent](self, "parent");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    return 0;
  v5 = (void *)v4;
  do
  {
    v6 = objc_msgSend(v5, "elementType");
    objc_msgSend(v5, "parent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v7;
    v8 = v6 == a3;
  }
  while (!v8 && v7);

  return v8;
}

- (BOOL)isDescendentFromViewElement:(id)a3
{
  SUUIViewElement *v4;
  SUUIViewElement *v5;
  SUUIViewElement *v6;
  BOOL v7;
  BOOL v8;

  v4 = self;
  if (!v4)
    return 0;
  v5 = v4;
  do
  {
    -[SUUIViewElement parent](v5, "parent");
    v6 = (SUUIViewElement *)objc_claimAutoreleasedReturnValue();

    v7 = v5 == a3;
    v8 = v5 == a3;
    v5 = v6;
  }
  while (!v7 && v6);

  return v8;
}

- (SUUIViewElement)elementWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t *v7;
  SUUIViewElement *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__36;
  v19 = __Block_byref_object_dispose__36;
  v20 = 0;
  -[SUUIViewElement itmlID](self, "itmlID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if (v6)
  {
    v7 = v16;
    v8 = self;
    v9 = (void *)v7[5];
    v7[5] = (uint64_t)v8;
  }
  else
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __41__SUUIViewElement_elementWithIdentifier___block_invoke;
    v12[3] = &unk_2511F6C40;
    v14 = &v15;
    v13 = v4;
    -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v12);
    v9 = v13;
  }

  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return (SUUIViewElement *)v10;
}

void __41__SUUIViewElement_elementWithIdentifier___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a2, "elementWithIdentifier:", *(_QWORD *)(a1 + 32));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (SUUIEntityProviding)entityProvider
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[SUUIViewElement explicitEntityProvider](self, "explicitEntityProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SUUIViewElement parent](self, "parent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "entityProvider");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (SUUIEntityProviding *)v5;
}

- (IKEntityValueProviding)entityValueProvider
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  -[SUUIViewElement explicitEntityValueProvider](self, "explicitEntityValueProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SUUIViewElement entityProvider](self, "entityProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIViewElement parent](self, "parent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      while (1)
      {
        objc_msgSend(v5, "entityProvider");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4 != v6 && (objc_msgSend(v4, "isEqual:", v6) & 1) == 0)
          break;
        objc_msgSend(v5, "explicitEntityValueProvider");
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
          goto LABEL_12;
        objc_msgSend(v5, "parent");
        v8 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v8;
        if (!v8)
          goto LABEL_9;
      }

    }
LABEL_9:
    if (objc_msgSend(v4, "numberOfSections") && objc_msgSend(v4, "numberOfEntitiesInSection:", 0))
    {
      objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entityValueProviderAtIndexPath:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v3 = (void *)v7;

    }
    else
    {
      v3 = 0;
    }

  }
  return (IKEntityValueProviding *)v3;
}

- (SUUIEntityProviding)explicitEntityProvider
{
  void *v3;
  void *v4;
  void *v5;
  SUUIEntityProviding *v6;
  SUUIEntityProviding *entityProvider;
  void *v8;

  if (!self->_hasValidEntityProvider)
  {
    self->_hasValidEntityProvider = 1;
    -[SUUIViewElement attributes](self, "attributes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("entityProviderID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "length"))
    {
      -[IKViewElement entityProviderList](self, "entityProviderList");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "entityProviderWithIdentifier:", v4);
      v6 = (SUUIEntityProviding *)objc_claimAutoreleasedReturnValue();
      entityProvider = self->_entityProvider;
      self->_entityProvider = v6;

      if (self->_entityProvider)
      {
        -[SUUIViewElement _registerForNotificationsForEntityProvider:](self, "_registerForNotificationsForEntityProvider:");
      }
      else
      {
        -[SUUIViewElement description](self, "description");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("<Error>: no entity provider with identifier \"%@\" found for object %@"), v4, v8);

      }
    }

  }
  return self->_entityProvider;
}

- (IKEntityValueProviding)explicitEntityValueProvider
{
  return self->_entityValueProvider;
}

- (NSSet)entityValueProperties
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[SUUIViewElement children](self, "children");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "entityValueProperties");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          if (!v5)
            v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
          objc_msgSend(v5, "unionSet:", v8);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return (NSSet *)v5;
}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SUUIViewElement children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v7)
        objc_enumerationMutation(v5);
      v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = __47__SUUIViewElement_enumerateChildrenUsingBlock___block_invoke;
        v10[3] = &unk_2511F8088;
        v11 = v4;
        v12 = &v17;
        objc_msgSend(v9, "enumerateChildrenUsingBlock:", v10);

      }
      else
      {
        (*((void (**)(id, void *, uint64_t *))v4 + 2))(v4, v9, v18 + 3);
      }
      if (*((_BYTE *)v18 + 24))
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  _Block_object_dispose(&v17, 8);
}

uint64_t __47__SUUIViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

- (void)enumerateViewElementsWithDictionary:(id)a3 factory:(id)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  SUUIViewElement *v15;
  id v16;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "objectForKey:", CFSTR("c"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __74__SUUIViewElement_enumerateViewElementsWithDictionary_factory_usingBlock___block_invoke;
  v13[3] = &unk_2511F80B0;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v10 = v9;
  v11 = v8;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v13);

}

void __74__SUUIViewElement_enumerateViewElementsWithDictionary_factory_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "elementForDictionary:parent:", a2, *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v3 = v4;
  }

}

- (id)featureWithName:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SUUIViewElement features](self, "features");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "featureName", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)firstChildForElementType:(unint64_t)a3
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__36;
  v10 = __Block_byref_object_dispose__36;
  v11 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__SUUIViewElement_firstChildForElementType___block_invoke;
  v5[3] = &unk_2511F55E0;
  v5[4] = &v6;
  v5[5] = a3;
  -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__SUUIViewElement_firstChildForElementType___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  if (objc_msgSend(a2, "elementType") == *(_QWORD *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (id)firstChildForElementName:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__36;
  v15 = __Block_byref_object_dispose__36;
  v16 = 0;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __44__SUUIViewElement_firstChildForElementName___block_invoke;
  v8[3] = &unk_2511F80D8;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __44__SUUIViewElement_firstChildForElementName___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;

  objc_msgSend(a2, "elementName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

- (NSArray)flattenedChildren
{
  NSMutableArray *flattenedChildren;
  NSMutableArray *v4;
  NSMutableArray *v5;
  _QWORD v7[5];

  flattenedChildren = self->_flattenedChildren;
  if (!flattenedChildren)
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = self->_flattenedChildren;
    self->_flattenedChildren = v4;

    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __36__SUUIViewElement_flattenedChildren__block_invoke;
    v7[3] = &unk_2511F46F8;
    v7[4] = self;
    -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v7);
    flattenedChildren = self->_flattenedChildren;
  }
  return (NSArray *)flattenedChildren;
}

uint64_t __36__SUUIViewElement_flattenedChildren__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "addObject:", a2);
}

- (BOOL)isDynamicContainer
{
  return 0;
}

- (BOOL)isEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[SUUIViewElement parent](self, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "isEnabled");
  else
    v4 = 1;

  return v4;
}

- (int64_t)pageComponentType
{
  return 0;
}

- (NSSet)personalizationLibraryItems
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIViewElement children](self, "children");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementAccumulatePersonalizationLibraryItemsForChildren(v3, v4);

  return (NSSet *)v3;
}

- (BOOL)rendersWithPerspective
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[SUUIViewElement children](self, "children", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "rendersWithPerspective") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (BOOL)rendersWithParallax
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[SUUIViewElement children](self, "children", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "rendersWithParallax") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)setEntityValueProvider:(id)a3
{
  IKEntityValueProviding *v5;
  IKEntityValueProviding *entityValueProvider;
  char v7;
  IKEntityValueProviding *v8;

  v5 = (IKEntityValueProviding *)a3;
  entityValueProvider = self->_entityValueProvider;
  if (entityValueProvider != v5)
  {
    v8 = v5;
    v7 = -[IKEntityValueProviding isEqual:](entityValueProvider, "isEqual:", v5);
    v5 = v8;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_entityValueProvider, a3);
      -[SUUIViewElement _entityValueProviderDidChange](self, "_entityValueProviderDidChange");
      v5 = v8;
    }
  }

}

- (NSCopying)uniquingMapKey
{
  void *v2;
  void *v3;
  void *v4;

  -[SUUIViewElement parent](self, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "uniquingMapKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSCopying *)v4;
}

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIViewElement *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id *p_entityProvider;
  id v9;
  NSMutableArray *flattenedChildren;
  IKEntityValueProviding *v11;
  IKEntityValueProviding *entityValueProvider;
  int v13;
  id v14;
  char v16;
  objc_super v17;

  v4 = (SUUIViewElement *)a3;
  v17.receiver = self;
  v17.super_class = (Class)SUUIViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v17, sel_applyUpdatesWithElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 != self)
  {
    if (!v4)
      goto LABEL_17;
LABEL_6:
    self->_hasValidEntityProvider = 0;
    p_entityProvider = (id *)&self->_entityProvider;
    if (self->_entityProvider)
    {
      -[SUUIViewElement _unregisterForNotificationsForEntityProvider:](self, "_unregisterForNotificationsForEntityProvider:");
      v9 = *p_entityProvider;
      *p_entityProvider = 0;

    }
    flattenedChildren = self->_flattenedChildren;
    self->_flattenedChildren = 0;

    self->_pinStyle = -[SUUIViewElement pinStyle](v4, "pinStyle");
    -[SUUIViewElement explicitEntityValueProvider](v4, "explicitEntityValueProvider");
    v11 = (IKEntityValueProviding *)objc_claimAutoreleasedReturnValue();
    entityValueProvider = self->_entityValueProvider;
    if (entityValueProvider == v11
      || (-[IKEntityValueProviding isEqual:](entityValueProvider, "isEqual:", v11) & 1) != 0)
    {
      v13 = 0;
    }
    else
    {
      objc_storeStrong((id *)&self->_entityValueProvider, v11);
      v13 = 1;
    }
    -[SUUIViewElement explicitEntityProvider](v4, "explicitEntityProvider");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (*p_entityProvider == v14 || (objc_msgSend(*p_entityProvider, "isEqual:", v14) & 1) != 0)
    {
      if (!v13)
      {
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      if (*p_entityProvider)
        -[SUUIViewElement _unregisterForNotificationsForEntityProvider:](self, "_unregisterForNotificationsForEntityProvider:");
      objc_storeStrong((id *)&self->_entityProvider, v14);
      if (*p_entityProvider)
        -[SUUIViewElement _registerForNotificationsForEntityProvider:](self, "_registerForNotificationsForEntityProvider:");
      if (self->_entityValueProvider)
        v16 = v13;
      else
        v16 = 1;
      if ((v16 & 1) == 0)
        goto LABEL_16;
    }
    -[SUUIViewElement _entityValueProviderDidChange](self, "_entityValueProviderDidChange");
    goto LABEL_16;
  }
  v7 = objc_msgSend(v5, "updateType");
  if (v4 && v7)
    goto LABEL_6;
LABEL_17:

  return v6;
}

- (void)_entityProviderDidInvalidateNotification:(id)a3
{
  void (**v3)(_QWORD);
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__SUUIViewElement__entityProviderDidInvalidateNotification___block_invoke;
  aBlock[3] = &unk_2511F47C0;
  aBlock[4] = self;
  v3 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
    v3[2](v3);
  else
    dispatch_async(MEMORY[0x24BDAC9B8], v3);

}

uint64_t __60__SUUIViewElement__entityProviderDidInvalidateNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_entityValueProviderDidChange");
}

- (void)_entityValueProviderDidChange
{
  _QWORD v3[7];
  _QWORD v4[3];
  char v5;
  _QWORD v6[5];
  id v7;

  -[SUUIViewElement entityValueProviderDidChange](self, "entityValueProviderDidChange");
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__36;
  v6[4] = __Block_byref_object_dispose__36;
  v7 = 0;
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  v5 = 0;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__SUUIViewElement__entityValueProviderDidChange__block_invoke;
  v3[3] = &unk_2511F8100;
  v3[5] = v4;
  v3[6] = v6;
  v3[4] = self;
  -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v3);
  _Block_object_dispose(v4, 8);
  _Block_object_dispose(v6, 8);

}

void __48__SUUIViewElement__entityValueProviderDidChange__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "explicitEntityValueProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v11;
  if (!v3)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (!*(_BYTE *)(v5 + 24))
    {
      *(_BYTE *)(v5 + 24) = 1;
      objc_msgSend(*(id *)(a1 + 32), "entityProvider");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v4 = v11;
    }
    objc_msgSend(v4, "entityProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v10 == v9 || objc_msgSend(v10, "isEqual:", v9))
      objc_msgSend(v11, "_entityValueProviderDidChange");

    v4 = v11;
  }

}

- (void)_registerForNotificationsForEntityProvider:(id)a3
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16D0];
    v5 = a3;
    objc_msgSend(v4, "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__entityProviderDidInvalidateNotification_, *MEMORY[0x24BE51858], v5);

  }
}

- (void)_unregisterForNotificationsForEntityProvider:(id)a3
{
  void *v4;
  id v5;
  id v6;

  if (a3)
  {
    v4 = (void *)MEMORY[0x24BDD16D0];
    v5 = a3;
    objc_msgSend(v4, "defaultCenter");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BE51858], v5);

  }
}

- (int64_t)pinStyle
{
  return self->_pinStyle;
}

- (int64_t)pinGroup
{
  return self->_pinGroup;
}

- (void)setExplicitEntityValueProvider:(id)a3
{
  objc_storeStrong((id *)&self->_explicitEntityValueProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explicitEntityValueProvider, 0);
  objc_storeStrong((id *)&self->_flattenedChildren, 0);
  objc_storeStrong((id *)&self->_entityValueProvider, 0);
  objc_storeStrong((id *)&self->_entityProvider, 0);
}

- (id)firstDescendentWithIndexBarEntryID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  SUUIViewElement *v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[SUUIViewElement indexBarEntryID](self, "indexBarEntryID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqualToString:", v4);

    if (v6)
    {
      v7 = self;
    }
    else
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x3032000000;
      v15 = __Block_byref_object_copy__37;
      v16 = __Block_byref_object_dispose__37;
      v17 = 0;
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __77__SUUIViewElement_SUUIIndexBarAdditions__firstDescendentWithIndexBarEntryID___block_invoke;
      v9[3] = &unk_2511F80D8;
      v10 = v4;
      v11 = &v12;
      -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v9);
      v7 = (SUUIViewElement *)(id)v13[5];

      _Block_object_dispose(&v12, 8);
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __77__SUUIViewElement_SUUIIndexBarAdditions__firstDescendentWithIndexBarEntryID___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "indexBarEntryID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
LABEL_4:
    *a3 = 1;
    goto LABEL_5;
  }
  objc_msgSend(v11, "firstDescendentWithIndexBarEntryID:", *(_QWORD *)(a1 + 32));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    goto LABEL_4;
LABEL_5:

}

- (NSString)indexBarEntryID
{
  void *v2;
  void *v3;

  -[SUUIViewElement attributes](self, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("indexBarEntryID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && !objc_msgSend(v3, "length"))
  {

    v3 = 0;
  }
  return (NSString *)v3;
}

- (BOOL)handlesBackgroundColorDirectly
{
  SUUIViewElement *v3;
  uint64_t v4;

  if (-[SUUIViewElement elementType](self, "elementType") == 66)
  {
    v3 = self;
    if (-[SUUIViewElement lockupViewType](v3, "lockupViewType") == 7)
    {

      return 1;
    }
    v4 = -[SUUIViewElement lockupViewType](v3, "lockupViewType");

    if (v4 == 6)
      return 1;
  }
  return 0;
}

@end
