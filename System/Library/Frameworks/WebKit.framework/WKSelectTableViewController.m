@implementation WKSelectTableViewController

- (WKSelectTableViewController)initWithView:(id)a3 hasGroups:(BOOL)a4
{
  WKSelectTableViewController *v5;
  WKSelectTableViewController *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  int *v11;
  uint64_t v12;
  __CFString *v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WKSelectTableViewController;
  v5 = -[WKSelectTableViewController initWithStyle:](&v16, sel_initWithStyle_, 0, a4);
  v6 = v5;
  if (v5)
  {
    v5->_contentView = (WKContentView *)a3;
    v7 = objc_msgSend(a3, "focusedSelectElementOptions");
    v8 = *(unsigned __int8 *)(-[WKContentView focusedElementInformation](v6->_contentView, "focusedElementInformation")
                            + 178);
    v6->_allowsMultipleSelection = v8;
    v6->_numberOfSections = 1;
    v6->_singleSelectionIndex = 0x7FFFFFFFFFFFFFFFLL;
    v9 = *(unsigned int *)(v7 + 12);
    if ((_DWORD)v9)
    {
      v10 = 0;
      v11 = (int *)(*(_QWORD *)v7 + 12);
      do
      {
        if (*((_BYTE *)v11 - 4))
        {
          v10 = 0;
          ++v6->_numberOfSections;
        }
        else
        {
          if (!v8 && *((_BYTE *)v11 - 3))
          {
            v6->_singleSelectionIndex = v10;
            v6->_singleSelectionSection = *v11;
          }
          ++v10;
        }
        v11 += 4;
        --v9;
      }
      while (v9);
    }
    v12 = *(unsigned __int8 *)(-[WKContentView focusedElementInformation](v6->_contentView, "focusedElementInformation")
                             + 177);
    v6->_textAlignment = 2 * v12;
    if (v12)
      objc_msgSend((id)-[WKSelectTableViewController view](v6, "view"), "setSemanticContentAttribute:", 4);
    if (*(_QWORD *)(-[WKContentView focusedElementInformation](v6->_contentView, "focusedElementInformation") + 240))
      v13 = (__CFString *)WTF::StringImpl::operator NSString *();
    else
      v13 = &stru_1E351F1B8;
    if (-[__CFString length](v13, "length")
      && MEMORY[0x19AEBA3C8](-[__CFString characterAtIndex:](v13, "characterAtIndex:", 0)) != (_DWORD)v12)
    {
      v14 = 8234;
      if ((_DWORD)v12)
        v14 = 8235;
      v13 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%C%@%C"), v14, v13, 8236);
    }
    -[WKSelectTableViewController setTitle:](v6, "setTitle:", v13);
  }
  return v6;
}

- (void)viewWillAppear:(BOOL)a3
{
  unint64_t singleSelectionSection;
  unint64_t singleSelectionIndex;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKSelectTableViewController;
  -[WKSelectTableViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  if (self->_singleSelectionIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    singleSelectionSection = self->_singleSelectionSection;
    if (singleSelectionSection < objc_msgSend((id)-[WKSelectTableViewController tableView](self, "tableView"), "numberOfSections"))
    {
      singleSelectionIndex = self->_singleSelectionIndex;
      if (singleSelectionIndex < objc_msgSend((id)-[WKSelectTableViewController tableView](self, "tableView"), "numberOfRowsInSection:", self->_singleSelectionSection))objc_msgSend((id)-[WKSelectTableViewController tableView](self, "tableView"), "scrollToRowAtIndexPath:atScrollPosition:animated:", objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", self->_singleSelectionIndex, self->_singleSelectionSection), 2, 0);
    }
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return self->_numberOfSections;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v6;
  unint64_t v7;
  int v8;
  int64_t result;
  uint64_t v10;
  int64_t v11;

  if (!*(_DWORD *)(-[WKContentView focusedSelectElementOptions](self->_contentView, "focusedSelectElementOptions", a3)
                  + 12))
    return 1;
  if (*(_DWORD *)(-[WKContentView focusedSelectElementOptions](self->_contentView, "focusedSelectElementOptions") + 12))
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    while (1)
    {
      result = -[WKContentView focusedSelectElementOptions](self->_contentView, "focusedSelectElementOptions");
      if (v7 >= *(unsigned int *)(result + 12))
        break;
      v10 = *(_QWORD *)result + v6;
      if (*(_BYTE *)(v10 + 8))
        goto LABEL_17;
      v11 = *(int *)(v10 + 12);
      if (v11 == a4)
        ++v8;
      if (v11 <= a4)
      {
LABEL_17:
        ++v7;
        v6 += 16;
        if (v7 < *(unsigned int *)(-[WKContentView focusedSelectElementOptions](self->_contentView, "focusedSelectElementOptions")+ 12))continue;
      }
      return v8;
    }
    __break(0xC471u);
  }
  else
  {
    return 0;
  }
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v6;
  unint64_t v7;
  int v8;
  id result;

  if (!a4
    || !*(_DWORD *)(-[WKContentView focusedSelectElementOptions](self->_contentView, "focusedSelectElementOptions", a3)
                  + 12))
  {
    return 0;
  }
  v6 = 0;
  v7 = 0;
  v8 = 0;
  while (1)
  {
    result = -[WKContentView focusedSelectElementOptions](self->_contentView, "focusedSelectElementOptions");
    if (v7 >= *((unsigned int *)result + 3))
    {
      __break(0xC471u);
      return result;
    }
    if (*(_BYTE *)(*(_QWORD *)result + v6 + 8))
    {
      if (++v8 == a4)
        break;
    }
    ++v7;
    v6 += 16;
    if (v7 >= *(unsigned int *)(-[WKContentView focusedSelectElementOptions](self->_contentView, "focusedSelectElementOptions")+ 12))return 0;
  }
  if (*(_QWORD *)(*(_QWORD *)result + v6))
    return (id)WTF::StringImpl::operator NSString *();
  else
    return &stru_1E351F1B8;
}

- (void)populateCell:(id)a3 withItem:(const void *)a4
{
  void *v6;
  const __CFString *v7;
  uint64_t v8;

  v6 = (void *)objc_msgSend(a3, "textLabel");
  if (*(_QWORD *)a4)
    v7 = (const __CFString *)WTF::StringImpl::operator NSString *();
  else
    v7 = &stru_1E351F1B8;
  objc_msgSend(v6, "setText:", v7);
  objc_msgSend((id)objc_msgSend(a3, "textLabel"), "setEnabled:", *((_BYTE *)a4 + 10) == 0);
  objc_msgSend(a3, "setSelectionStyle:", *((_BYTE *)a4 + 10) == 0);
  if (*((_BYTE *)a4 + 9))
    v8 = 3;
  else
    v8 = 0;
  objc_msgSend(a3, "setAccessoryType:", v8);
}

- (int64_t)findItemIndexAt:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  int v7;
  int v8;
  int64_t result;
  uint64_t v10;
  uint64_t v11;

  if (!*(_DWORD *)(-[WKContentView focusedSelectElementOptions](self->_contentView, "focusedSelectElementOptions") + 12))
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  while (1)
  {
    result = -[WKContentView focusedSelectElementOptions](self->_contentView, "focusedSelectElementOptions");
    if (v6 >= *(unsigned int *)(result + 12))
      break;
    v10 = *(_QWORD *)result + v5;
    if (*(_BYTE *)(v10 + 8))
    {
      v7 = 0;
    }
    else
    {
      v11 = *(int *)(v10 + 12);
      if (objc_msgSend(a3, "section") == v11 && objc_msgSend(a3, "row") == v7)
        return v8;
      ++v8;
      ++v7;
    }
    ++v6;
    v5 += 16;
    if (v6 >= *(unsigned int *)(-[WKContentView focusedSelectElementOptions](self->_contentView, "focusedSelectElementOptions")+ 12))return 0x7FFFFFFFFFFFFFFFLL;
  }
  __break(0xC471u);
  return result;
}

- (void)findItemAt:(id)a3
{
  uint64_t v5;
  unint64_t v6;
  int v7;
  void *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (!*(_DWORD *)(-[WKContentView focusedSelectElementOptions](self->_contentView, "focusedSelectElementOptions") + 12))
    return 0;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  while (1)
  {
    result = -[WKContentView focusedSelectElementOptions](self->_contentView, "focusedSelectElementOptions");
    if (v6 >= *((unsigned int *)result + 3))
      break;
    v9 = *(_QWORD *)result;
    v10 = *(_QWORD *)result + v5;
    if (!*(_BYTE *)(v10 + 8))
    {
      v11 = *(int *)(v10 + 12);
      if (objc_msgSend(a3, "section") == v11)
      {
        if (objc_msgSend(a3, "row") == v7)
          return (void *)(v9 + v5);
        ++v7;
      }
    }
    ++v6;
    v5 += 16;
    if (v6 >= *(unsigned int *)(-[WKContentView focusedSelectElementOptions](self->_contentView, "focusedSelectElementOptions")+ 12))return 0;
  }
  __break(0xC471u);
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  const __CFString *v13;
  const __CFString *v14;
  WTF::StringImpl *v15;
  WTF::StringImpl *v16;

  v6 = (void *)objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("WKPopoverTableViewCellReuseIdentifier"));
  if (v6)
  {
    v7 = v6;
    CFRetain(v6);
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("WKPopoverTableViewCellReuseIdentifier"));
  }
  objc_msgSend(v7, "setSemanticContentAttribute:", objc_msgSend((id)-[WKSelectTableViewController view](self, "view"), "semanticContentAttribute"));
  objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setTextAlignment:", self->_textAlignment);
  if (*(_DWORD *)(-[WKContentView focusedElementInformation](self->_contentView, "focusedElementInformation") + 212))
  {
    objc_msgSend(v7, "bounds");
    objc_msgSend(v7, "contentRectForBounds:");
    objc_msgSend(v7, "textRectForContentRect:");
    v9 = v8;
    v10 = (void *)objc_msgSend((id)objc_msgSend(v7, "textLabel"), "font");
    objc_msgSend(v10, "pointSize");
    if (v9 != self->_maximumTextWidth || self->_fontSize == 0.0)
    {
      self->_maximumTextWidth = v9;
      self->_fontSize = adjustedFontSize((uint64_t)v10, (uint64_t)(-[WKContentView focusedElementInformation](self->_contentView, "focusedElementInformation")+ 200), v9, v11);
    }
    -[WKSelectTableViewController populateCell:withItem:](self, "populateCell:withItem:", v7, -[WKSelectTableViewController findItemAt:](self, "findItemAt:", a4));
    objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setFont:", objc_msgSend(v10, "fontWithSize:", self->_fontSize));
    objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setLineBreakMode:", 0);
    objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setNumberOfLines:", 2);
    return (id)(id)CFMakeCollectable(v7);
  }
  else
  {
    objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setEnabled:", 0);
    WebCore::localizedString((WebCore *)CFSTR("No Options Select Popover"), v13);
    if (v16)
      v14 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v14 = &stru_1E351F1B8;
    objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setText:", v14);
    if (v16)
    {
      if (*(_DWORD *)v16 == 2)
        WTF::StringImpl::destroy(v16, v15);
      else
        *(_DWORD *)v16 -= 2;
    }
    objc_msgSend(v7, "setAccessoryType:", 0);
    objc_msgSend(v7, "setSelectionStyle:", 0);
    return (id)(id)CFMakeCollectable(v7);
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int *v11;
  unint64_t singleSelectionIndex;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int *v17;
  _BYTE *v18;

  if (!*(_DWORD *)(-[WKContentView focusedElementInformation](self->_contentView, "focusedElementInformation") + 212))
    return;
  v7 = -[WKSelectTableViewController findItemIndexAt:](self, "findItemIndexAt:", a4);
  if (!self->_allowsMultipleSelection)
  {
    objc_msgSend(a3, "deselectRowAtIndexPath:animated:", a4, 0);
    singleSelectionIndex = self->_singleSelectionIndex;
    if (singleSelectionIndex == 0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = 0;
    }
    else
    {
      v13 = objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", singleSelectionIndex, self->_singleSelectionSection);
      if (objc_msgSend(a4, "isEqual:", v13))
        goto LABEL_24;
    }
    v14 = (void *)objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
    if (!objc_msgSend((id)objc_msgSend(v14, "textLabel"), "isEnabled"))
      return;
    if (v13)
    {
      v15 = (void *)objc_msgSend(a3, "cellForRowAtIndexPath:", v13);
      if (v15)
      {
        v16 = v15;
        if (objc_msgSend(v15, "accessoryType") == 3)
          objc_msgSend(v16, "setAccessoryType:", 0);
      }
    }
    if (v14 && !objc_msgSend(v14, "accessoryType"))
    {
      objc_msgSend(v14, "setAccessoryType:", 3);
      self->_singleSelectionIndex = objc_msgSend(a4, "row");
      self->_singleSelectionSection = objc_msgSend(a4, "section");
      -[WKContentView updateFocusedElementSelectedIndex:allowsMultipleSelection:](self->_contentView, "updateFocusedElementSelectedIndex:allowsMultipleSelection:", v7, 0);
      v17 = -[WKContentView focusedSelectElementOptions](self->_contentView, "focusedSelectElementOptions");
      if (v7 >= v17[3])
        goto LABEL_26;
      *(_BYTE *)(*(_QWORD *)v17 + 16 * v7 + 9) = 1;
    }
    if (v13)
    {
      v18 = -[WKSelectTableViewController findItemAt:](self, "findItemAt:", v13);
      if (v18)
        v18[9] = 0;
    }
LABEL_24:
    -[WKSelectPopover _userActionDismissedPopover:](self->_popover, "_userActionDismissedPopover:", 0);
    return;
  }
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", objc_msgSend(a3, "indexPathForSelectedRow"), 0);
  v8 = (void *)objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  if (objc_msgSend((id)objc_msgSend(v8, "textLabel"), "isEnabled"))
  {
    v9 = objc_msgSend(v8, "accessoryType");
    if (v9)
      v10 = 0;
    else
      v10 = 3;
    objc_msgSend(v8, "setAccessoryType:", v10);
    -[WKContentView updateFocusedElementSelectedIndex:allowsMultipleSelection:](self->_contentView, "updateFocusedElementSelectedIndex:allowsMultipleSelection:", v7, 1);
    v11 = -[WKContentView focusedSelectElementOptions](self->_contentView, "focusedSelectElementOptions");
    if (v7 < v11[3])
    {
      *(_BYTE *)(*(_QWORD *)v11 + 16 * v7 + 9) = v9 == 0;
      return;
    }
LABEL_26:
    __break(0xC471u);
    JUMPOUT(0x1972BCC78);
  }
}

- (BOOL)shouldDismissWithAnimation
{
  return -[WKContentView _shouldUseLegacySelectPopoverDismissalBehavior](self->_contentView, "_shouldUseLegacySelectPopoverDismissalBehavior");
}

- (WKSelectPopover)popover
{
  return self->_popover;
}

- (void)setPopover:(id)a3
{
  self->_popover = (WKSelectPopover *)a3;
}

@end
