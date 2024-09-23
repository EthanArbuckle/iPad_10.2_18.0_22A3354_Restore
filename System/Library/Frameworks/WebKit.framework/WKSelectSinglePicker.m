@implementation WKSelectSinglePicker

- (WKSelectSinglePicker)initWithView:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  WKSelectSinglePicker *v8;
  WKSelectSinglePicker *v9;
  unint64_t v10;
  uint64_t v11;
  WKSelectSinglePicker *result;
  int64_t selectedIndex;
  objc_super v14;

  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v14.receiver = self;
  v14.super_class = (Class)WKSelectSinglePicker;
  v8 = -[WKSelectSinglePicker initWithFrame:](&v14, sel_initWithFrame_, v4, v5, v6, v7);
  v9 = v8;
  if (!v8)
    return v9;
  v8->_view = (WKContentView *)a3;
  -[WKSelectSinglePicker setDelegate:](v8, "setDelegate:", v8);
  -[WKSelectSinglePicker setDataSource:](v9, "setDataSource:", v9);
  -[WKSelectSinglePicker setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
  v9->_selectedIndex = 0x7FFFFFFFFFFFFFFFLL;
  if (!*(_DWORD *)(objc_msgSend(a3, "focusedSelectElementOptions") + 12))
  {
LABEL_9:
    -[WKSelectSinglePicker reloadAllComponents](v9, "reloadAllComponents");
    selectedIndex = v9->_selectedIndex;
    if (selectedIndex != 0x7FFFFFFFFFFFFFFFLL)
      -[WKSelectSinglePicker selectRow:inComponent:animated:](v9, "selectRow:inComponent:animated:", selectedIndex, 0, 0);
    return v9;
  }
  v10 = 0;
  v11 = 9;
  while (1)
  {
    result = -[WKContentView focusedSelectElementOptions](v9->_view, "focusedSelectElementOptions");
    if (v10 >= *((unsigned int *)&result->super.super.super._responderFlags + 1))
      break;
    if (*((_BYTE *)result->super.super.super.super.isa + v11))
    {
      v9->_selectedIndex = v10;
      goto LABEL_9;
    }
    ++v10;
    v11 += 16;
    if (v10 >= *(unsigned int *)(objc_msgSend(a3, "focusedSelectElementOptions") + 12))
      goto LABEL_9;
  }
  __break(0xC471u);
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[WKSelectSinglePicker setDelegate:](self, "setDelegate:", 0);
  -[WKSelectSinglePicker setDataSource:](self, "setDataSource:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WKSelectSinglePicker;
  -[WKSelectSinglePicker dealloc](&v3, sel_dealloc);
}

- (void)controlEndEditing
{
  int64_t selectedIndex;
  unsigned int *v4;
  unint64_t v5;

  selectedIndex = self->_selectedIndex;
  if (selectedIndex != 0x7FFFFFFFFFFFFFFFLL
    && selectedIndex < *(unsigned int *)(-[WKContentView focusedSelectElementOptions](self->_view, "focusedSelectElementOptions")+ 12))
  {
    v4 = -[WKContentView focusedSelectElementOptions](self->_view, "focusedSelectElementOptions");
    v5 = self->_selectedIndex;
    if (v5 >= v4[3])
    {
      __break(0xC471u);
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)v4 + 16 * v5 + 9) = 1;
      -[WKContentView updateFocusedElementSelectedIndex:allowsMultipleSelection:](self->_view, "updateFocusedElementSelectedIndex:allowsMultipleSelection:");
    }
  }
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  return *(unsigned int *)(-[WKContentView focusedElementInformation](self->_view, "focusedElementInformation", a3, a4)
                         + 212);
}

- (id)pickerView:(id)a3 attributedTitleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id result;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  CFTypeRef v14;

  if (a4 < 0
    || *(unsigned int *)(-[WKContentView focusedSelectElementOptions](self->_view, "focusedSelectElementOptions", a3)
                       + 12) <= (unint64_t)a4)
  {
    return 0;
  }
  result = -[WKContentView focusedSelectElementOptions](self->_view, "focusedSelectElementOptions");
  if (*((unsigned int *)result + 3) > (unint64_t)a4)
  {
    v8 = *(_QWORD *)result;
    if (*(_QWORD *)(*(_QWORD *)result + 16 * a4))
      v9 = (__CFString *)WTF::StringImpl::operator NSString *();
    else
      v9 = &stru_1E351F1B8;
    v10 = (__CFString *)-[__CFString mutableCopy](v9, "mutableCopy");
    CFStringTrimWhitespace(v10);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v10);
    if (*(_BYTE *)(v8 + 16 * a4 + 10))
    {
      v12 = objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.0, 0.300000012);
      v13 = -[__CFString length](v10, "length");
      objc_msgSend(v11, "addAttribute:value:range:", *MEMORY[0x1E0CEA0A0], v12, 0, v13);
    }
    v14 = (id)CFMakeCollectable(v11);
    if (v10)
      CFRelease(v10);
    return (id)v14;
  }
  __break(0xC471u);
  return result;
}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  unint64_t v5;
  unsigned int *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;
  int v11;
  uint64_t v12;
  unsigned int *v13;
  int v14;

  if ((a4 & 0x8000000000000000) == 0)
  {
    v5 = a4;
    if (*(unsigned int *)(-[WKContentView focusedSelectElementOptions](self->_view, "focusedSelectElementOptions", a3)
                         + 12) > (unint64_t)a4)
    {
      v7 = -[WKContentView focusedSelectElementOptions](self->_view, "focusedSelectElementOptions");
      if (v7[3] <= v5)
      {
LABEL_19:
        __break(0xC471u);
        JUMPOUT(0x1972B91FCLL);
      }
      if (*(_BYTE *)(*(_QWORD *)v7 + 16 * v5 + 10))
      {
        v8 = 16 * v5 - 6;
        v9 = v5;
        while (v9 > 0)
        {
          --v9;
          v10 = -[WKContentView focusedSelectElementOptions](self->_view, "focusedSelectElementOptions");
          if (v9 >= (unint64_t)v10[3])
            goto LABEL_19;
          v11 = *(unsigned __int8 *)(*(_QWORD *)v10 + v8);
          v8 -= 16;
          if (!v11)
          {
LABEL_14:
            -[WKSelectSinglePicker selectRow:inComponent:animated:](self, "selectRow:inComponent:animated:", v9, 0, 1);
            v5 = v9;
            goto LABEL_15;
          }
        }
        v12 = 16 * v5 + 26;
        v9 = v5;
        while (++v9 < (unint64_t)*(unsigned int *)(-[WKContentView focusedSelectElementOptions](self->_view, "focusedSelectElementOptions")+ 12))
        {
          v13 = -[WKContentView focusedSelectElementOptions](self->_view, "focusedSelectElementOptions");
          if (v9 >= (unint64_t)v13[3])
          {
            __break(0xC471u);
            JUMPOUT(0x1972B9204);
          }
          v14 = *(unsigned __int8 *)(*(_QWORD *)v13 + v12);
          v12 += 16;
          if (!v14)
            goto LABEL_14;
        }
      }
      else
      {
LABEL_15:
        self->_selectedIndex = v5;
      }
    }
  }
}

- (void)selectRow:(int64_t)a3 inComponent:(int64_t)a4 extendingSelection:(BOOL)a5
{
  -[WKSelectSinglePicker selectRow:inComponent:animated:](self, "selectRow:inComponent:animated:", a3, 0, 0);
  objc_msgSend((id)-[WKSelectSinglePicker delegate](self, "delegate"), "pickerView:didSelectRow:inComponent:", self, a3, 0);
}

@end
