@implementation SUUIPickerView

- (SUUIPickerView)initWithCoder:(id)a3
{
  return -[SUUIPickerView initWithTitles:](self, "initWithTitles:", 0);
}

- (SUUIPickerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  SUUIPickerView *v7;
  SUUIPickerView *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = -[SUUIPickerView initWithTitles:](self, "initWithTitles:", 0);
  v8 = v7;
  if (v7)
    -[SUUIPickerView setFrame:](v7, "setFrame:", x, y, width, height);
  return v8;
}

- (SUUIPickerView)initWithTitles:(id)a3
{
  id v4;
  SUUIPickerView *v5;
  uint64_t v6;
  NSArray *titles;
  uint64_t v8;
  _UIBackdropView *backdropView;
  UIView *v10;
  UIView *separatorView;
  UIView *v12;
  void *v13;
  id v14;
  uint64_t v15;
  UIPickerView *pickerView;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUUIPickerView;
  v5 = -[SUUIPickerView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    titles = v5->_titles;
    v5->_titles = (NSArray *)v6;

    v8 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDB78]), "initWithPrivateStyle:", 2010);
    backdropView = v5->_backdropView;
    v5->_backdropView = (_UIBackdropView *)v8;

    -[SUUIPickerView addSubview:](v5, "addSubview:", v5->_backdropView);
    v10 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    separatorView = v5->_separatorView;
    v5->_separatorView = v10;

    v12 = v5->_separatorView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v12, "setBackgroundColor:", v13);

    -[SUUIPickerView addSubview:](v5, "addSubview:", v5->_separatorView);
    v14 = objc_alloc(MEMORY[0x24BEBD800]);
    -[SUUIPickerView bounds](v5, "bounds");
    v15 = objc_msgSend(v14, "initWithFrame:");
    pickerView = v5->_pickerView;
    v5->_pickerView = (UIPickerView *)v15;

    -[UIPickerView setDataSource:](v5->_pickerView, "setDataSource:", v5);
    -[UIPickerView setDelegate:](v5->_pickerView, "setDelegate:", v5);
    -[UIPickerView setShowsSelectionIndicator:](v5->_pickerView, "setShowsSelectionIndicator:", 1);
    -[SUUIPickerView addSubview:](v5, "addSubview:", v5->_pickerView);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIPickerView setBackgroundColor:](v5, "setBackgroundColor:", v17);

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[UIPickerView setDataSource:](self->_pickerView, "setDataSource:", 0);
  -[UIPickerView setDelegate:](self->_pickerView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUUIPickerView;
  -[SUUIPickerView dealloc](&v3, sel_dealloc);
}

- (int64_t)selectedItemIndex
{
  return -[UIPickerView selectedRowInComponent:](self->_pickerView, "selectedRowInComponent:", 0);
}

- (void)setSelectedItemIndex:(int64_t)a3
{
  -[UIPickerView selectRow:inComponent:animated:](self->_pickerView, "selectRow:inComponent:animated:", a3, 0, 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIPickerView sizeThatFits:](self->_pickerView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIView *separatorView;
  double v12;
  id v13;

  -[SUUIPickerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[_UIBackdropView setFrame:](self->_backdropView, "setFrame:");
  -[UIPickerView setFrame:](self->_pickerView, "setFrame:", v4, v6, v8, v10);
  separatorView = self->_separatorView;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "scale");
  -[UIView setFrame:](separatorView, "setFrame:", v4, v6, v8, 1.0 / v12);

}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return -[NSArray count](self->_titles, "count", a3, a4);
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  SUUIPickerViewDelegate **p_delegate;
  id WeakRetained;
  char v9;
  id v10;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v10, "pickerView:didSelectItemAtIndex:", self, a4);

  }
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  return -[NSArray objectAtIndex:](self->_titles, "objectAtIndex:", a4);
}

- (SUUIPickerViewDelegate)delegate
{
  return (SUUIPickerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_pickerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
