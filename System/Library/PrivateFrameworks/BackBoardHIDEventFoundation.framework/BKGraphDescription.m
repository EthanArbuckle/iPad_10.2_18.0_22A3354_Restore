@implementation BKGraphDescription

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_stackIndexesHighlighted, 0);
  objc_storeStrong((id *)&self->_itemRemainingStack, 0);
  objc_storeStrong((id *)&self->_itemCountStack, 0);
}

- (void)appendNode:(uint64_t)a3
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  __CFString *v19;
  const __CFString *v20;
  __CFString *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  __CFString *v34;

  if (a1)
  {
    v10 = a1[1];
    v11 = a2;
    objc_msgSend(v10, "lastObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "integerValue");

    objc_msgSend(a1[2], "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    objc_msgSend(a1[2], "removeLastObject");
    v16 = a1[2];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15 - 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v17);

    v18 = objc_msgSend(a1[1], "count");
    v19 = CFSTR("middle");
    if (v15 == 1)
      v20 = CFSTR("bottom");
    else
      v20 = CFSTR("middle");
    if (v15 == 1)
      v19 = CFSTR("bottom");
    if (v15 == v13)
      v19 = CFSTR("top");
    if (v13 == 1)
      v19 = CFSTR("single");
    if (v18 != 1)
      v19 = (__CFString *)v20;
    v21 = v19;
    v22 = v11;
    -[BKGraphDescription _themeForItemIndex:]((uint64_t)a1, objc_msgSend(a1[1], "count") - 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v21;
    objc_msgSend(v23, "objectForKey:", v21);
    v33 = objc_claimAutoreleasedReturnValue();
    v24 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v25 = objc_msgSend(a1[2], "count") - 1;
    if (v25 < 1)
    {
      v27 = v23;
    }
    else
    {
      for (i = 0; i != v25; ++i)
      {
        -[BKGraphDescription _themeForItemIndex:]((uint64_t)a1, i);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(a1[2], "objectAtIndex:", i);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "integerValue");

        if (v29)
          v30 = CFSTR("dropline");
        else
          v30 = CFSTR("indent");
        objc_msgSend(v27, "objectForKey:", v30, v33);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "appendString:", v31);

        v23 = v27;
      }
    }
    v32 = (void *)v33;
    objc_msgSend(v24, "appendString:", v33, v33);
    objc_msgSend(a1[4], "writePrefix:label:args:", v24, v22, &a9);

  }
}

- (uint64_t)appendSubnodesWithCount:(void *)a3 block:
{
  uint64_t v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;

  if (result)
  {
    v4 = result;
    v5 = *(void **)(result + 8);
    v6 = (void *)MEMORY[0x1E0CB37E8];
    v7 = a3;
    objc_msgSend(v6, "numberWithInteger:", a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);

    v9 = *(void **)(v4 + 16);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);

    v7[2](v7);
    objc_msgSend(*(id *)(v4 + 16), "removeLastObject");
    return objc_msgSend(*(id *)(v4 + 8), "removeLastObject");
  }
  return result;
}

- (id)_themeForItemIndex:(uint64_t)a1
{
  uint64_t *v2;

  if (objc_msgSend(*(id *)(a1 + 24), "containsIndex:", a2))
  {
    if (_BKHighlightedTheme_onceToken != -1)
      dispatch_once(&_BKHighlightedTheme_onceToken, &__block_literal_global_1976);
    v2 = &_BKHighlightedTheme_dictionary;
  }
  else
  {
    if (_BKNormalTheme_onceToken != -1)
      dispatch_once(&_BKNormalTheme_onceToken, &__block_literal_global_136);
    v2 = &_BKNormalTheme_dictionary;
  }
  return (id)*v2;
}

- (_QWORD)initWithTopLevelCount:(void *)a3 target:
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  objc_super v19;

  v6 = a3;
  if (a1)
  {
    v19.receiver = a1;
    v19.super_class = (Class)BKGraphDescription;
    v7 = objc_msgSendSuper2(&v19, sel_init);
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 4, a3);
      v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v9 = (void *)a1[1];
      a1[1] = v8;

      v10 = (void *)a1[1];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v13 = (void *)a1[2];
      a1[2] = v12;

      v14 = (void *)a1[2];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v15);

      v16 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v17 = (void *)a1[3];
      a1[3] = v16;

    }
  }

  return a1;
}

@end
