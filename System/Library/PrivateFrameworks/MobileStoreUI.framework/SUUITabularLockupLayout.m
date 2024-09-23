@implementation SUUITabularLockupLayout

- (SUUITabularLockupLayout)initWithLockup:(id)a3 context:(id)a4
{
  id v5;
  SUUITabularLockupLayout *v6;
  SUUITabularLockupColumn *v7;
  SUUITabularLockupColumn *v8;
  SUUITabularLockupColumn *v9;
  uint64_t v10;
  NSArray *columns;
  _QWORD v13[4];
  SUUITabularLockupLayout *v14;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SUUITabularLockupLayout;
  v6 = -[SUUITabularLockupLayout init](&v15, sel_init);
  if (v6)
  {
    v7 = -[SUUITabularLockupColumn initWithColumnIdentifier:]([SUUITabularLockupColumn alloc], "initWithColumnIdentifier:", 0);
    v8 = -[SUUITabularLockupColumn initWithColumnIdentifier:]([SUUITabularLockupColumn alloc], "initWithColumnIdentifier:", 1);
    v9 = -[SUUITabularLockupColumn initWithColumnIdentifier:]([SUUITabularLockupColumn alloc], "initWithColumnIdentifier:", 2);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v7, v8, v9, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    columns = v6->_columns;
    v6->_columns = (NSArray *)v10;

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __50__SUUITabularLockupLayout_initWithLockup_context___block_invoke;
    v13[3] = &unk_2511F46F8;
    v14 = v6;
    objc_msgSend(v5, "enumerateChildrenUsingBlock:", v13);

  }
  return v6;
}

void __50__SUUITabularLockupLayout_initWithLockup_context___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SUUIViewElementAlignmentForStyle(v3);
  if (objc_msgSend(v7, "elementType") == 138)
  {
    if (v4 == 3)
      v5 = 2;
    else
      v5 = v4 == 2;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "objectAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_addChildViewElement:", v7);

  }
}

+ (id)fontForLabelViewElement:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SUUIViewElementFontWithStyle(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = objc_msgSend(v5, "labelViewStyle");
    if (v9 > 5)
    {
      v8 = 0;
    }
    else
    {
      if (((1 << v9) & 0x1B) != 0)
      {
        if (objc_msgSend(v6, "containerViewElementType") == 118)
          v10 = 8;
        else
          v10 = 7;
      }
      else if (objc_msgSend(v6, "containerViewElementType") == 118)
      {
        v10 = 6;
      }
      else
      {
        v10 = 19;
      }
      SUUIFontLimitedPreferredFontForTextStyle(v10, 5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

- (void)sizeColumnsToFitWidth:(double)a3 context:(id)a4
{
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = self->_columns;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v12, "childViewElements", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "sizeForViewElement:width:", v14, a3);
        objc_msgSend(v12, "setSize:");

      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (NSArray)columns
{
  return self->_columns;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
}

@end
