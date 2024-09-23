@implementation SUUIFilterBarViewElement

- (SUUIDividerViewElement)bottomDivider
{
  id v2;
  objc_super v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__35;
  v10 = __Block_byref_object_dispose__35;
  v11 = 0;
  v5[1] = 3221225472;
  v5[2] = __41__SUUIFilterBarViewElement_bottomDivider__block_invoke;
  v5[3] = &unk_2511F4B90;
  v5[4] = &v6;
  v4.receiver = self;
  v4.super_class = (Class)SUUIFilterBarViewElement;
  v5[0] = MEMORY[0x24BDAC760];
  -[SUUIViewElement enumerateChildrenUsingBlock:](&v4, sel_enumerateChildrenUsingBlock_, v5);
  v2 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUUIDividerViewElement *)v2;
}

void __41__SUUIFilterBarViewElement_bottomDivider__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "elementType") == 32)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (id)childViewElementsForAlignment:(unint64_t)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _QWORD v19[4];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 - 1 <= 2)
  {
    -[SUUIViewElement flattenedChildren](self, "flattenedChildren");
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v21;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v6);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v10), "elementType") == 127)
            ++v7;
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v8);
    }

    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x2020000000;
    v19[3] = 0;
    v11 = objc_msgSend(v6, "count");
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __58__SUUIFilterBarViewElement_childViewElementsForAlignment___block_invoke;
    v13[3] = &unk_2511F8010;
    v15 = v19;
    v16 = v7;
    v17 = v11;
    v18 = a3;
    v14 = v5;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v13);

    _Block_object_dispose(v19, 8);
  }
  return v5;
}

void __58__SUUIFilterBarViewElement_childViewElementsForAlignment___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "elementAlignment");

  if (v6)
    goto LABEL_2;
  if (*(uint64_t *)(a1 + 48) < 1)
  {
    if (*(_QWORD *)(a1 + 56) == 3)
    {
      v6 = qword_241EFC040[a3];
      goto LABEL_2;
    }
    v9 = objc_msgSend(v11, "elementType");
    if (v9 == 109)
    {
      v6 = 2;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 2;
      goto LABEL_2;
    }
    if (v9 == 69)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 2;
      v6 = 3;
      goto LABEL_2;
    }
LABEL_14:
    v6 = qword_241EFC040[*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)];
    goto LABEL_2;
  }
  if (objc_msgSend(v11, "elementType") != 127)
    goto LABEL_14;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_QWORD *)(a1 + 48) == 1)
  {
    v6 = 0;
    v8 = 2;
  }
  else
  {
    v6 = 0;
    v10 = *(_QWORD *)(v7 + 24);
    if (v10 >= 1)
      v10 = 1;
    v8 = v10 + 1;
  }
  *(_QWORD *)(v7 + 24) = v8;
LABEL_2:
  if (v6 == *(_QWORD *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);

}

- (void)enumerateChildrenUsingBlock:(id)a3
{
  id v4;
  objc_super v5;
  _QWORD v6[4];
  id v7;

  v6[1] = 3221225472;
  v6[2] = __56__SUUIFilterBarViewElement_enumerateChildrenUsingBlock___block_invoke;
  v6[3] = &unk_2511F4BE0;
  v7 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SUUIFilterBarViewElement;
  v6[0] = MEMORY[0x24BDAC760];
  v4 = v7;
  -[SUUIViewElement enumerateChildrenUsingBlock:](&v5, sel_enumerateChildrenUsingBlock_, v6);

}

void __56__SUUIFilterBarViewElement_enumerateChildrenUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  BOOL v4;
  id v5;

  v5 = a2;
  v3 = objc_msgSend(v5, "elementType");
  v4 = (unint64_t)(v3 - 8) > 0x3D || ((1 << (v3 - 8)) & 0x2000060000000031) == 0;
  if (!v4 || (unint64_t)(v3 - 106) <= 0x2E && ((1 << (v3 - 106)) & 0x400900200009) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (int64_t)pageComponentType
{
  return 24;
}

@end
