@implementation SUUIPredicateListViewElement

- (id)applyUpdatesWithElement:(id)a3
{
  SUUIPredicateListViewElement *v4;
  SUUIPredicateListViewElement *v5;
  objc_super v9;

  v4 = (SUUIPredicateListViewElement *)a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIPredicateListViewElement;
  -[SUUIViewElement applyUpdatesWithElement:](&v9, sel_applyUpdatesWithElement_, v4);
  v5 = (SUUIPredicateListViewElement *)objc_claimAutoreleasedReturnValue();
  if (v5 == self && v4 != self && v4 != 0)
    objc_storeStrong((id *)&self->_compoundEntityValuePredicate, v4->_compoundEntityValuePredicate);

  return v5;
}

- (NSArray)predicateViewElements
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
  v8 = __Block_byref_object_copy__0;
  v9 = __Block_byref_object_dispose__0;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__SUUIPredicateListViewElement_predicateViewElements__block_invoke;
  v4[3] = &unk_2511F4B90;
  v4[4] = &v5;
  -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSArray *)v2;
}

void __53__SUUIPredicateListViewElement_predicateViewElements__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "elementType") == 88)
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

- (NSPredicate)compoundEntityValuePredicate
{
  NSPredicate *compoundEntityValuePredicate;
  void *v4;
  id v5;
  NSPredicate *v6;
  NSPredicate *v7;
  _QWORD v9[4];
  id v10;

  compoundEntityValuePredicate = self->_compoundEntityValuePredicate;
  if (!compoundEntityValuePredicate)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __60__SUUIPredicateListViewElement_compoundEntityValuePredicate__block_invoke;
    v9[3] = &unk_2511F4BB8;
    v10 = v4;
    v5 = v4;
    -[SUUIPredicateListViewElement _enumeratePredicateViewElementsUsingBlock:](self, "_enumeratePredicateViewElementsUsingBlock:", v9);
    objc_msgSend(MEMORY[0x24BDD14C0], "andPredicateWithSubpredicates:", v5);
    v6 = (NSPredicate *)objc_claimAutoreleasedReturnValue();
    v7 = self->_compoundEntityValuePredicate;
    self->_compoundEntityValuePredicate = v6;

    compoundEntityValuePredicate = self->_compoundEntityValuePredicate;
  }
  return compoundEntityValuePredicate;
}

void __60__SUUIPredicateListViewElement_compoundEntityValuePredicate__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "entityValuePredicate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (void)_enumeratePredicateViewElementsUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (v4)
  {
    v6[1] = 3221225472;
    v6[2] = __74__SUUIPredicateListViewElement__enumeratePredicateViewElementsUsingBlock___block_invoke;
    v6[3] = &unk_2511F4BE0;
    v5 = v4;
    v6[0] = MEMORY[0x24BDAC760];
    v7 = v4;
    -[SUUIViewElement enumerateChildrenUsingBlock:](self, "enumerateChildrenUsingBlock:", v6);

    v4 = v5;
  }

}

void __74__SUUIPredicateListViewElement__enumeratePredicateViewElementsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "elementType") == 88)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compoundEntityValuePredicate, 0);
}

@end
