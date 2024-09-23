@implementation SUUIComposeTextFieldListView

- (SUUIComposeTextFieldListView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  SUUIComposeTextFieldListView *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUIComposeTextFieldListView;
  result = -[SUUIComposeTextFieldListView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
    result->_style = a4;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[NSMutableArray makeObjectsPerformSelector:withObject:](self->_fields, "makeObjectsPerformSelector:withObject:", sel_setDelegate_, 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIComposeTextFieldListView;
  -[SUUIComposeTextFieldListView dealloc](&v3, sel_dealloc);
}

- (double)height
{
  void *v3;
  double MaxY;
  CGRect v6;

  if (!-[NSMutableArray count](self->_fields, "count"))
    return 0.0;
  -[NSMutableArray lastObject](self->_fields, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  MaxY = CGRectGetMaxY(v6);

  return MaxY;
}

- (UIResponder)initialFirstResponder
{
  NSMutableArray *v2;
  void *v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_fields;
  v3 = (void *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "text", (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "length");

        if (!v8)
        {
          objc_msgSend(v6, "textField");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v3 = (void *)-[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (UIResponder *)v3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)layoutSubviews
{
  uint64_t v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  float v7;
  void *v8;
  double v9;
  float v10;

  -[SUUIComposeTextFieldListView bounds](self, "bounds");
  -[SUUIComposeTextFieldListView safeAreaInsets](self, "safeAreaInsets");
  v3 = -[NSMutableArray count](self->_fields, "count");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_msgSend(WeakRetained, "numberOfColumnsInTextFieldList:", self);

  if (v3 >= 1)
  {
    v6 = 0;
    v7 = 0.0;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_fields, "objectAtIndex:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "frame");
      if (v6 % v5 >= v5 - 1)
      {
        v10 = v9 + v7;
        v7 = v10;
      }
      objc_msgSend(v8, "setFrame:");

      ++v6;
    }
    while (v3 != v6);
  }
}

- (void)reloadData
{
  NSMutableArray *fields;
  NSMutableArray *v4;
  NSMutableArray *v5;
  void *v6;
  double v7;
  double v8;
  id WeakRetained;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  SUUIComposeTextField *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;

  fields = self->_fields;
  if (fields)
  {
    -[NSMutableArray makeObjectsPerformSelector:withObject:](fields, "makeObjectsPerformSelector:withObject:", sel_setDelegate_, 0);
    -[NSMutableArray makeObjectsPerformSelector:withObject:](self->_fields, "makeObjectsPerformSelector:withObject:", sel_removeFromSuperview, 0);
    -[NSMutableArray removeAllObjects](self->_fields, "removeAllObjects");
  }
  else
  {
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v5 = self->_fields;
    self->_fields = v4;

  }
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_msgSend(WeakRetained, "numberOfFieldsInTextFieldList:", self);

  v11 = objc_loadWeakRetained((id *)&self->_delegate);
  v12 = objc_msgSend(v11, "numberOfColumnsInTextFieldList:", self);

  if (v10 >= 1)
  {
    v13 = 0;
    v14 = 1.0 / v8;
    do
    {
      v15 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v15, "textFieldList:configurationForFieldAtIndex:", self, v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 % v12 >= v12 - 1)
        v17 = 0.0;
      else
        v17 = v14;
      if (v13 / v12 == v10 / v12 - 1)
        v18 = v14;
      else
        v18 = 0.0;
      objc_msgSend(v16, "setBorderInsets:", v14, 0.0, v18, v17);
      v19 = -[SUUIComposeTextField initWithConfiguration:style:]([SUUIComposeTextField alloc], "initWithConfiguration:style:", v16, self->_style);
      -[SUUIComposeTextField setDelegate:](v19, "setDelegate:", self);
      -[NSMutableArray addObject:](self->_fields, "addObject:", v19);
      -[SUUIComposeTextFieldListView addSubview:](self, "addSubview:", v19);

      ++v13;
    }
    while (v10 != v13);
  }
  -[SUUIComposeTextFieldListView _updateValidity](self, "_updateValidity");
  -[SUUIComposeTextFieldListView layoutSubviews](self, "layoutSubviews");
  -[SUUIComposeTextFieldListView frame](self, "frame");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[SUUIComposeTextFieldListView height](self, "height");
  -[SUUIComposeTextFieldListView setFrame:](self, "setFrame:", v21, v23, v25, v26);
  -[SUUIComposeTextFieldListView setNeedsLayout](self, "setNeedsLayout");
}

- (id)textForFieldAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;

  if (-[NSMutableArray count](self->_fields, "count") <= a3)
  {
    v6 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_fields, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (void)composeTextFieldValidityChanged:(id)a3
{
  _BOOL4 isValid;
  id WeakRetained;
  char v6;
  id v7;
  id v8;
  char v9;
  id v10;

  isValid = self->_isValid;
  -[SUUIComposeTextFieldListView _updateValidity](self, "_updateValidity", a3);
  if (self->_isValid != isValid)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v7, "textFieldListValidityDidChange:", self);

    }
  }
  v8 = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v10, "textFieldListValuesDidChange:", self);

  }
}

- (void)_updateValidity
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  int v8;

  v3 = -[NSMutableArray count](self->_fields, "count");
  if (v3)
  {
    v4 = v3;
    v5 = 1;
    do
    {
      -[NSMutableArray objectAtIndex:](self->_fields, "objectAtIndex:", v5 - 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "configuration");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isRequired"))
        v8 = objc_msgSend(v6, "isValid");
      else
        v8 = 1;

      if (!v8)
        break;
    }
    while (v5++ < v4);
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  self->_isValid = v8;
}

- (int64_t)composeReviewStyle
{
  return self->_style;
}

- (SUUIComposeTextFieldListViewDelegate)delegate
{
  return (SUUIComposeTextFieldListViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fields, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
