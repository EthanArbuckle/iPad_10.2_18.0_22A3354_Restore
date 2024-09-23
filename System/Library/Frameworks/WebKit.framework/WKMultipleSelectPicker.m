@implementation WKMultipleSelectPicker

- (WKMultipleSelectPicker)initWithView:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  WKMultipleSelectPicker *v8;
  WKMultipleSelectPicker *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _BYTE *i;
  objc_super v21;

  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v21.receiver = self;
  v21.super_class = (Class)WKMultipleSelectPicker;
  v8 = -[WKMultipleSelectPicker initWithFrame:](&v21, sel_initWithFrame_, v4, v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_view = (WKContentView *)a3;
    v8->_allowsMultipleSelection = *(_BYTE *)(objc_msgSend(a3, "focusedElementInformation") + 178);
    v9->_singleSelectionIndex = 0x7FFFFFFFFFFFFFFFLL;
    -[WKMultipleSelectPicker setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
    -[WKMultipleSelectPicker setDataSource:](v9, "setDataSource:", v9);
    -[WKMultipleSelectPicker setDelegate:](v9, "setDelegate:", v9);
    -[WKMultipleSelectPicker _setUsesCheckedSelection:](v9, "_setUsesCheckedSelection:", 1);
    -[WKMultipleSelectPicker _setMagnifierEnabled:](v9, "_setMagnifierEnabled:", 0);
    v9->_textAlignment = 0;
    -[WKMultipleSelectPicker setAllowsMultipleSelection:](v9, "setAllowsMultipleSelection:", v9->_allowsMultipleSelection);
    -[WKMultipleSelectPicker frame](v9, "frame");
    v11 = v10;
    v13 = v12;
    objc_msgSend(a3, "sizeForLegacyFormControlPickerViews");
    -[WKMultipleSelectPicker setFrame:](v9, "setFrame:", v11, v13, v14, v15);
    -[WKMultipleSelectPicker reloadAllComponents](v9, "reloadAllComponents");
    if (!v9->_allowsMultipleSelection)
    {
      v16 = -[WKContentView focusedSelectElementOptions](v9->_view, "focusedSelectElementOptions");
      v17 = *(unsigned int *)(v16 + 12);
      if ((_DWORD)v17)
      {
        v18 = 0;
        for (i = (_BYTE *)(*(_QWORD *)v16 + 9); *(i - 1) || !*i; i += 16)
        {
          if (v17 == ++v18)
            return v9;
        }
        v9->_singleSelectionIndex = v18;
        -[WKMultipleSelectPicker selectRow:inComponent:animated:](v9, "selectRow:inComponent:animated:");
      }
    }
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[WKMultipleSelectPicker setDataSource:](self, "setDataSource:", 0);
  -[WKMultipleSelectPicker setDelegate:](self, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WKMultipleSelectPicker;
  -[WKMultipleSelectPicker dealloc](&v3, sel_dealloc);
}

- (void)layoutSubviews
{
  unint64_t singleSelectionIndex;
  double layoutWidth;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKMultipleSelectPicker;
  -[WKMultipleSelectPicker layoutSubviews](&v7, sel_layoutSubviews);
  singleSelectionIndex = self->_singleSelectionIndex;
  if (singleSelectionIndex != 0x7FFFFFFFFFFFFFFFLL)
    -[WKMultipleSelectPicker selectRow:inComponent:animated:](self, "selectRow:inComponent:animated:", singleSelectionIndex, 0, 0);
  layoutWidth = self->_layoutWidth;
  -[WKMultipleSelectPicker frame](self, "frame");
  if (layoutWidth != v5)
  {
    -[WKMultipleSelectPicker reloadAllComponents](self, "reloadAllComponents");
    -[WKMultipleSelectPicker frame](self, "frame");
    self->_layoutWidth = v6;
  }
}

- (id)pickerView:(id)a3 viewForRow:(int64_t)a4 forComponent:(int64_t)a5 reusingView:(id)a6
{
  id result;
  int64_t v10;
  __objc2_class **v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  double Width;
  double v24;
  double v25;
  void *v26;
  float v27;
  double v28;
  double v29;
  CGRect v30;
  CGRect v31;

  result = -[WKContentView focusedSelectElementOptions](self->_view, "focusedSelectElementOptions", a3, a4, a5, a6);
  if (*((unsigned int *)result + 3) <= (unint64_t)a4)
  {
    __break(0xC471u);
  }
  else
  {
    v10 = *(_QWORD *)result + 16 * a4;
    v11 = off_1E349EDA0;
    if (*(_BYTE *)(v10 + 8))
      v11 = off_1E349ED98;
    v12 = (void *)objc_msgSend(objc_alloc(*v11), "initWithOptionItem:", v10);
    v13 = (void *)objc_msgSend(a3, "tableViewForColumn:", 0);
    objc_msgSend(v13, "rectForRowAtIndexPath:", objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a4, 0));
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;
    objc_msgSend(v12, "setFrame:");
    v22 = (void *)objc_msgSend(v12, "titleLabel");
    v30.origin.x = v15;
    v30.origin.y = v17;
    v30.size.width = v19;
    v30.size.height = v21;
    Width = CGRectGetWidth(v30);
    v31.origin.x = v15;
    v31.origin.y = v17;
    v31.size.width = v19;
    v31.size.height = v21;
    objc_msgSend(v12, "labelWidthForBounds:", 0.0, 0.0, Width, CGRectGetHeight(v31));
    v25 = v24;
    v26 = (void *)objc_msgSend(v22, "font");
    v27 = v25;
    v28 = v27;
    if (self->_maximumTextWidth != v27 || self->_fontSize == 0.0)
    {
      self->_maximumTextWidth = v28;
      objc_msgSend((id)objc_msgSend(v22, "font"), "pointSize");
      self->_fontSize = adjustedFontSize((uint64_t)v26, (uint64_t)-[WKContentView focusedSelectElementOptions](self->_view, "focusedSelectElementOptions"), v28, v29);
    }
    objc_msgSend(v22, "setFont:", objc_msgSend(v26, "fontWithSize:"));
    objc_msgSend(v22, "setLineBreakMode:", 0);
    objc_msgSend(v22, "setNumberOfLines:", 2);
    objc_msgSend(v22, "setTextAlignment:", self->_textAlignment);
    return (id)(id)CFMakeCollectable(v12);
  }
  return result;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return *(unsigned int *)(-[WKContentView focusedSelectElementOptions](self->_view, "focusedSelectElementOptions", a3, a4)+ 12);
}

- (int64_t)findItemIndexAt:(int)a3
{
  unint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  int64_t result;

  if (a3 < 1)
  {
    return 0;
  }
  else
  {
    v4 = 0;
    v5 = 0;
    v6 = a3;
    for (i = 8; ; i += 16)
    {
      result = -[WKContentView focusedSelectElementOptions](self->_view, "focusedSelectElementOptions");
      if (v4 >= *(unsigned int *)(result + 12))
        break;
      if (!*(_BYTE *)(*(_QWORD *)result + i))
        ++v5;
      if (v6 == ++v4)
        return v5;
    }
    __break(0xC471u);
  }
  return result;
}

- (void)pickerView:(id)a3 row:(int)a4 column:(int)a5 checked:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v8;
  unint64_t v10;
  unsigned int *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  int v15;
  void *v16;
  void *v17;
  double v18;
  unsigned int *v19;
  unint64_t singleSelectionIndex;

  v6 = a6;
  v8 = *(_QWORD *)&a4;
  v10 = *(unsigned int *)(-[WKContentView focusedSelectElementOptions](self->_view, "focusedSelectElementOptions", a3)
                        + 12);
  if (v10 > (int)v8)
  {
    v11 = -[WKContentView focusedSelectElementOptions](self->_view, "focusedSelectElementOptions");
    if (v11[3] <= (unint64_t)(int)v8)
      goto LABEL_16;
    v12 = *(_QWORD *)v11;
    v13 = *(_QWORD *)v11 + 16 * (int)v8;
    v15 = *(unsigned __int8 *)(v13 + 8);
    v14 = (_BYTE *)(v13 + 8);
    if (v15 | v14[2])
    {
      v16 = (void *)-[WKMultipleSelectPicker viewForRow:forComponent:](self, "viewForRow:forComponent:", (int)v8, a5);
      objc_msgSend(v16, "setChecked:", 0);
      v17 = (void *)objc_msgSend(v16, "titleLabel");
      v18 = 0.5;
      if (!*v14)
        v18 = 0.300000012;
      objc_msgSend(v17, "setTextColor:", objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, v18));
    }
    else
    {
      if (-[WKMultipleSelectPicker allowsMultipleSelection](self, "allowsMultipleSelection"))
      {
        -[WKContentView updateFocusedElementSelectedIndex:allowsMultipleSelection:](self->_view, "updateFocusedElementSelectedIndex:allowsMultipleSelection:", -[WKMultipleSelectPicker findItemIndexAt:](self, "findItemIndexAt:", v8), 1);
        *(_BYTE *)(v12 + 16 * (int)v8 + 9) = v6;
        return;
      }
      if (v6)
      {
        if (self->_singleSelectionIndex >= v10)
        {
LABEL_13:
          self->_singleSelectionIndex = (int)v8;
          -[WKContentView updateFocusedElementSelectedIndex:allowsMultipleSelection:](self->_view, "updateFocusedElementSelectedIndex:allowsMultipleSelection:", -[WKMultipleSelectPicker findItemIndexAt:](self, "findItemIndexAt:", v8), 0);
          *(_BYTE *)(v12 + 16 * (int)v8 + 9) = 1;
          return;
        }
        v19 = -[WKContentView focusedSelectElementOptions](self->_view, "focusedSelectElementOptions");
        singleSelectionIndex = self->_singleSelectionIndex;
        if (singleSelectionIndex < v19[3])
        {
          *(_BYTE *)(*(_QWORD *)v19 + 16 * singleSelectionIndex + 9) = 0;
          goto LABEL_13;
        }
LABEL_16:
        __break(0xC471u);
        JUMPOUT(0x1972B8C84);
      }
      *(_BYTE *)(v12 + 16 * (int)v8 + 9) = 0;
    }
  }
}

- (void)selectRow:(int64_t)a3 inComponent:(int64_t)a4 extendingSelection:(BOOL)a5
{
  -[WKMultipleSelectPicker selectRow:inComponent:animated:](self, "selectRow:inComponent:animated:", a3, 0, 0);
  -[WKMultipleSelectPicker pickerView:row:column:checked:](self, "pickerView:row:column:checked:", self, a3, 0, 1);
}

- (BOOL)selectFormAccessoryHasCheckedItemAtRow:(int64_t)a3
{
  if (-[WKMultipleSelectPicker numberOfRowsInComponent:](self, "numberOfRowsInComponent:", 0) <= a3)
    return 0;
  else
    return objc_msgSend((id)-[WKMultipleSelectPicker viewForRow:forComponent:](self, "viewForRow:forComponent:", a3, 0), "isChecked");
}

@end
