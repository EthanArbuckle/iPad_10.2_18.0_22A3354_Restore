@implementation WKFormSelectControl

- (WKFormSelectControl)initWithView:(id)a3
{
  unint64_t v5;
  uint64_t v6;
  WKFormSelectControl *result;
  _BOOL8 v8;
  PAL *v9;
  uint64_t v10;
  __objc2_class **v11;
  objc_super *v12;
  __objc2_class *v13;
  WKSelectPopover *v14;
  WKFormSelectControl *v15;
  CFTypeRef v16;
  objc_super v17;
  WKFormSelectControl *v18;
  CFTypeRef cf;

  if (*(_DWORD *)(objc_msgSend(a3, "focusedElementInformation") + 212))
  {
    v5 = 0;
    v6 = 8;
    while (1)
    {
      result = (WKFormSelectControl *)objc_msgSend(a3, "focusedElementInformation");
      if (v5 >= HIDWORD(result[5].super._control.m_ptr))
        break;
      v8 = *((_BYTE *)result[5].super.super.isa + v6) != 0;
      if (!*((_BYTE *)result[5].super.super.isa + v6))
      {
        ++v5;
        v6 += 16;
        if (v5 < *(unsigned int *)(objc_msgSend(a3, "focusedElementInformation") + 212))
          continue;
      }
      goto LABEL_8;
    }
    __break(0xC471u);
  }
  else
  {
    v8 = 0;
LABEL_8:
    cf = 0;
    v9 = (PAL *)objc_msgSend(a3, "_shouldUseContextMenusForFormControls");
    if ((_DWORD)v9)
    {
      v10 = objc_msgSend(a3, "focusedElementInformation");
      v11 = off_1E349EDF0;
      if (*(_BYTE *)(v10 + 178))
        v11 = off_1E349EDE8;
      cf = (CFTypeRef)objc_msgSend(objc_alloc(*v11), "initWithView:", a3);
      v18 = self;
      v12 = (objc_super *)&v18;
    }
    else
    {
      if ((PAL::currentUserInterfaceIdiomIsSmallScreen(v9) & 1) != 0)
      {
        if (*(_BYTE *)(objc_msgSend(a3, "focusedElementInformation") + 178) == 0 && ~v8)
          v13 = WKSelectSinglePicker;
        else
          v13 = WKMultipleSelectPicker;
        v14 = (WKSelectPopover *)objc_msgSend([v13 alloc], "initWithView:", a3);
      }
      else
      {
        v14 = -[WKSelectPopover initWithView:hasGroups:]([WKSelectPopover alloc], "initWithView:hasGroups:", a3, v8);
      }
      cf = v14;
      v17.receiver = self;
      v12 = &v17;
    }
    v12->super_class = (Class)WKFormSelectControl;
    v15 = -[objc_super initWithView:control:](v12, sel_initWithView_control_, a3, &cf);
    v16 = cf;
    cf = 0;
    if (v16)
      CFRelease(v16);
    return v15;
  }
  return result;
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_control.m_ptr;
  self->_control.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  return self;
}

- (void)selectRow:(int64_t)a3 inComponent:(int64_t)a4 extendingSelection:(BOOL)a5
{
  _BOOL8 v5;

  v5 = a5;
  -[WKFormPeripheralBase control](self, "control");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[WKFormControl selectRow:inComponent:extendingSelection:](-[WKFormPeripheralBase control](self, "control"), "selectRow:inComponent:extendingSelection:", a3, a4, v5);
}

- (NSString)selectFormPopoverTitle
{
  -[WKFormPeripheralBase control](self, "control");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (NSString *)objc_msgSend((id)-[WKFormControl tableViewController](-[WKFormPeripheralBase control](self, "control"), "tableViewController"), "title");
  else
    return 0;
}

- (BOOL)selectFormAccessoryHasCheckedItemAtRow:(int64_t)a3
{
  -[WKFormPeripheralBase control](self, "control");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[WKFormControl selectFormAccessoryHasCheckedItemAtRow:](-[WKFormPeripheralBase control](self, "control"), "selectFormAccessoryHasCheckedItemAtRow:", a3);
  else
    return 0;
}

- (NSArray)menuItemTitles
{
  -[WKFormPeripheralBase control](self, "control");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (NSArray *)-[WKFormControl menuItemTitles](-[WKFormPeripheralBase control](self, "control"), "menuItemTitles");
  else
    return 0;
}

@end
