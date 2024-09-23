@implementation WKSelectPickerTableViewController

- (WKSelectPickerTableViewController)initWithView:(id)a3
{
  WKSelectPickerTableViewController *v4;
  WKSelectPickerTableViewController *v5;
  id v6;
  uint64_t v7;
  void *m_ptr;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  int v20;
  objc_super v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)WKSelectPickerTableViewController;
  v4 = -[WKSelectPickerTableViewController initWithStyle:](&v22, sel_initWithStyle_, 1);
  v5 = v4;
  if (v4)
  {
    objc_msgSend((id)-[WKSelectPickerTableViewController tableView](v4, "tableView"), "_setSectionContentInsetFollowsLayoutMargins:", 1);
    objc_storeWeak((id *)&v5->_contentView, a3);
    v6 = objc_alloc(MEMORY[0x1E0CEA380]);
    v7 = objc_msgSend(v6, "initWithImage:style:target:action:", objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("chevron.up")), 0, v5, sel_previous_);
    m_ptr = v5->_previousButton.m_ptr;
    v5->_previousButton.m_ptr = (void *)v7;
    if (m_ptr)
      CFRelease(m_ptr);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 6, 0, 0);
    objc_msgSend(v9, "setWidth:", 6.0);
    v10 = objc_alloc(MEMORY[0x1E0CEA380]);
    v11 = objc_msgSend(v10, "initWithImage:style:target:action:", objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("chevron.down")), 0, v5, sel_next_);
    v12 = v5->_nextButton.m_ptr;
    v5->_nextButton.m_ptr = (void *)v11;
    if (v12)
      CFRelease(v12);
    v13 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA380]), "initWithBarButtonSystemItem:target:action:", 24, v5, sel_close_);
    v23[0] = v5->_previousButton.m_ptr;
    v23[1] = v9;
    v23[2] = v5->_nextButton.m_ptr;
    objc_msgSend((id)-[WKSelectPickerTableViewController navigationItem](v5, "navigationItem"), "setLeftBarButtonItems:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3));
    objc_msgSend((id)-[WKSelectPickerTableViewController navigationItem](v5, "navigationItem"), "setRightBarButtonItem:", v13);
    v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v15 = v5->_collapsedSections.m_ptr;
    v5->_collapsedSections.m_ptr = v14;
    if (v15)
      CFRelease(v15);
    v5->_numberOfSections = 1;
    v16 = objc_msgSend(objc_loadWeak((id *)&v5->_contentView), "focusedSelectElementOptions");
    v17 = *(unsigned int *)(v16 + 12);
    if ((_DWORD)v17)
    {
      v18 = 16 * v17;
      v19 = (unsigned __int8 *)(*(_QWORD *)v16 + 8);
      do
      {
        v20 = *v19;
        v19 += 16;
        if (v20)
          ++v5->_numberOfSections;
        v18 -= 16;
      }
      while (v18);
    }
    if (v13)
      CFRelease(v13);
    if (v9)
      CFRelease(v9);
  }
  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WKSelectPickerTableViewController;
  -[WKSelectPickerTableViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  objc_msgSend(self->_previousButton.m_ptr, "setEnabled:", *(unsigned __int8 *)(objc_msgSend(objc_loadWeak((id *)&self->_contentView), "focusedElementInformation") + 156));
  objc_msgSend(self->_nextButton.m_ptr, "setEnabled:", *(unsigned __int8 *)(objc_msgSend(objc_loadWeak((id *)&self->_contentView), "focusedElementInformation") + 136));
}

- (int64_t)numberOfRowsInGroup:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  int64_t result;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  int64_t v11;

  v4 = objc_msgSend(objc_loadWeak((id *)&self->_contentView), "focusedSelectElementOptions");
  v5 = *(unsigned int *)(v4 + 12);
  if (!(_DWORD)v5)
    return 0;
  v6 = (uint64_t *)v4;
  result = 0;
  v8 = *v6;
  v9 = 16 * v5;
  v10 = (int *)(v8 + 12);
  do
  {
    if (!*((_BYTE *)v10 - 4))
    {
      v11 = *v10;
      if (v11 == a3)
        ++result;
      if (v11 > a3)
        break;
    }
    v10 += 4;
    v9 -= 16;
  }
  while (v9);
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return self->_numberOfSections;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (!*(_DWORD *)(objc_msgSend(objc_loadWeak((id *)&self->_contentView), "focusedSelectElementOptions") + 12))
    return 1;
  if ((objc_msgSend(self->_collapsedSections.m_ptr, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4)) & 1) != 0)return 0;
  return -[WKSelectPickerTableViewController numberOfRowsInGroup:](self, "numberOfRowsInGroup:", a4);
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result;
  double v6;

  if (a4
    && objc_msgSend(-[WKSelectPickerTableViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", a3), "length"))
  {
    +[WKSelectPickerGroupHeaderView preferredHeight](WKSelectPickerGroupHeaderView, "preferredHeight");
  }
  else
  {
    objc_msgSend(a3, "layoutMargins");
    return v6;
  }
  return result;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double v7;

  if (!a4
    && !-[WKSelectPickerTableViewController numberOfRowsInGroup:](self, "numberOfRowsInGroup:", 0)
    && self->_numberOfSections > 1)
  {
    return 2.22507386e-308;
  }
  objc_msgSend(a3, "layoutMargins");
  return v7;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;

  if (!a4)
    return 0;
  v5 = objc_msgSend(objc_loadWeak((id *)&self->_contentView), "focusedSelectElementOptions");
  v6 = *(unsigned int *)(v5 + 12);
  if (!(_DWORD)v6)
    return 0;
  v7 = 0;
  v8 = (_BYTE *)(*(_QWORD *)v5 + 8);
  v9 = 16 * v6;
  while (1)
  {
    if (*v8)
    {
      if (++v7 == a4)
        break;
    }
    v8 += 16;
    v9 -= 16;
    if (!v9)
      return 0;
  }
  if (*((_QWORD *)v8 - 1))
    return (id)WTF::StringImpl::operator NSString *();
  else
    return &stru_1E351F1B8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  WKSelectPickerGroupHeaderView *v7;

  if (!a4)
    return 0;
  v6 = -[WKSelectPickerTableViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", a3);
  if (!objc_msgSend(v6, "length"))
    return 0;
  v7 = -[WKSelectPickerGroupHeaderView initWithGroupName:section:isCollapsible:]([WKSelectPickerGroupHeaderView alloc], "initWithGroupName:section:isCollapsible:", v6, a4, -[WKSelectPickerTableViewController numberOfRowsInGroup:](self, "numberOfRowsInGroup:", a4) > 0);
  -[WKSelectPickerGroupHeaderView setCollapsed:animated:](v7, "setCollapsed:animated:", objc_msgSend(self->_collapsedSections.m_ptr, "containsObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4)), 0);
  -[WKSelectPickerGroupHeaderView setTableViewController:](v7, "setTableViewController:", self);
  return (id)(id)CFMakeCollectable(v7);
}

- (void)didTapSelectPickerGroupHeaderView:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t i;
  uint64_t v9;
  char v10;
  void *m_ptr;

  if (objc_msgSend(a3, "isCollapsible"))
  {
    v5 = objc_msgSend(a3, "section");
    v6 = -[WKSelectPickerTableViewController numberOfRowsInGroup:](self, "numberOfRowsInGroup:", v5);
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
    if (v6 >= 1)
    {
      for (i = 0; i != v6; ++i)
        objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", i, v5));
    }
    v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
    v10 = objc_msgSend(self->_collapsedSections.m_ptr, "containsObject:", v9);
    m_ptr = self->_collapsedSections.m_ptr;
    if ((v10 & 1) != 0)
    {
      objc_msgSend(m_ptr, "removeObject:", v9);
      objc_msgSend((id)-[WKSelectPickerTableViewController tableView](self, "tableView"), "insertRowsAtIndexPaths:withRowAnimation:", v7, 0);
    }
    else
    {
      objc_msgSend(m_ptr, "addObject:", v9);
      objc_msgSend((id)-[WKSelectPickerTableViewController tableView](self, "tableView"), "deleteRowsAtIndexPaths:withRowAnimation:", v7, 0);
    }
  }
}

- (int64_t)findItemIndexAt:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int *i;
  uint64_t v10;

  v4 = objc_msgSend(objc_loadWeak((id *)&self->_contentView), "focusedSelectElementOptions");
  v5 = *(unsigned int *)(v4 + 12);
  if (!(_DWORD)v5)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = 0;
  v7 = 0;
  v8 = 16 * v5;
  for (i = (int *)(*(_QWORD *)v4 + 12); *((_BYTE *)i - 4); i += 4)
  {
    v7 = 0;
LABEL_8:
    v8 -= 16;
    if (!v8)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  v10 = *i;
  if (objc_msgSend(a3, "section") != v10 || objc_msgSend(a3, "row") != v7)
  {
    ++v6;
    ++v7;
    goto LABEL_8;
  }
  return v6;
}

- (void)optionItemAtIndexPath:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = objc_msgSend(objc_loadWeak((id *)&self->_contentView), "focusedSelectElementOptions");
  v5 = *(unsigned int *)(v4 + 12);
  if ((_DWORD)v5)
  {
    v6 = 0;
    v7 = *(_QWORD *)v4;
    v8 = 16 * v5;
    do
    {
      if (!*(_BYTE *)(v7 + 8))
      {
        v9 = *(int *)(v7 + 12);
        if (objc_msgSend(a3, "section") == v9)
        {
          if (v6 == objc_msgSend(a3, "row"))
            return (void *)v7;
          ++v6;
        }
      }
      v7 += 16;
      v8 -= 16;
    }
    while (v8);
  }
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  _BYTE *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  WTF::StringImpl *v14;
  void *v15;
  void *v17;
  WTF::StringImpl *v18;

  v6 = (void *)objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("WKSelectPickerTableViewCell"));
  if (v6)
  {
    v7 = v6;
    CFRetain(v6);
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA60]), "initWithStyle:reuseIdentifier:", 0, CFSTR("WKSelectPickerTableViewCell"));
  }
  if (*(_DWORD *)(objc_msgSend(objc_loadWeak((id *)&self->_contentView), "focusedSelectElementOptions") + 12))
  {
    v8 = -[WKSelectPickerTableViewController optionItemAtIndexPath:](self, "optionItemAtIndexPath:", a4);
    if (v8)
    {
      if (*(_QWORD *)v8)
        v9 = (const __CFString *)WTF::StringImpl::operator NSString *();
      else
        v9 = &stru_1E351F1B8;
      objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setText:", v9);
      objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setEnabled:", v8[10] == 0);
      objc_msgSend(v7, "setUserInteractionEnabled:", v8[10] == 0);
      objc_msgSend((id)objc_msgSend(v7, "imageView"), "setPreferredSymbolConfiguration:", objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithTextStyle:scale:", *MEMORY[0x1E0CEB538], 3));
      if (v8[9])
      {
        v10 = objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
        v11 = (void *)objc_msgSend(v7, "imageView");
      }
      else
      {
        if (v8[10])
        {
          v15 = (void *)objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("circle"));
          v10 = objc_msgSend(v15, "imageWithTintColor:renderingMode:", objc_msgSend(MEMORY[0x1E0CEA478], "quaternaryLabelColor"), 1);
        }
        else
        {
          v17 = (void *)objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("circle"));
          v10 = objc_msgSend(v17, "imageWithTintColor:renderingMode:", objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor"), 1);
        }
        v11 = (void *)objc_msgSend(v7, "imageView");
      }
      objc_msgSend(v11, "setImage:", v10);
    }
    return (id)(id)CFMakeCollectable(v7);
  }
  else
  {
    objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setEnabled:", 0);
    WebCore::localizedString((WebCore *)CFSTR("No Options Select Popover"), v12);
    if (v18)
      v13 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v13 = &stru_1E351F1B8;
    objc_msgSend((id)objc_msgSend(v7, "textLabel"), "setText:", v13);
    if (v18)
    {
      if (*(_DWORD *)v18 == 2)
        WTF::StringImpl::destroy(v18, v14);
      else
        *(_DWORD *)v18 -= 2;
    }
    objc_msgSend(v7, "setUserInteractionEnabled:", 0);
    objc_msgSend((id)objc_msgSend(v7, "imageView"), "setImage:", 0);
    return (id)(id)CFMakeCollectable(v7);
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v7;
  _BYTE *v8;
  _BYTE *v9;
  void *v10;
  uint64_t v11;

  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", objc_msgSend(a3, "indexPathForSelectedRow"), 0);
  v7 = (void *)objc_msgSend(a3, "cellForRowAtIndexPath:", a4);
  if (objc_msgSend((id)objc_msgSend(v7, "textLabel"), "isEnabled"))
  {
    v8 = -[WKSelectPickerTableViewController optionItemAtIndexPath:](self, "optionItemAtIndexPath:", a4);
    if (v8)
    {
      v9 = v8;
      if (v8[9])
      {
        v10 = (void *)objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("circle"));
        v11 = objc_msgSend(v10, "imageWithTintColor:renderingMode:", objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor"), 1);
      }
      else
      {
        v11 = objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
      }
      objc_msgSend((id)objc_msgSend(v7, "imageView"), "setImage:", v11);
      objc_msgSend(objc_loadWeak((id *)&self->_contentView), "updateFocusedElementSelectedIndex:allowsMultipleSelection:", -[WKSelectPickerTableViewController findItemIndexAt:](self, "findItemIndexAt:", a4), 1);
      v9[9] ^= 1u;
    }
  }
}

- (id)groupHeaderFont
{
  void *v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x1E0CEB5C0]);
  v7 = *MEMORY[0x1E0CEB510];
  v5 = *MEMORY[0x1E0CEB608];
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0CEB5F8]);
  v8[0] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
  v3 = objc_msgSend(v2, "fontDescriptorByAddingAttributes:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1));
  return (id)objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v3, 0.0);
}

- (void)next:(id)a3
{
  id Weak;
  id v5;
  _QWORD v6[4];
  id v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3321888768;
  v6[2] = __42__WKSelectPickerTableViewController_next___block_invoke;
  v6[3] = &__block_descriptor_40_e8_32c55_ZTSKZ42__WKSelectPickerTableViewController_next__E3__4_e5_v8__0l;
  Weak = objc_loadWeak((id *)&self->_contentView);
  v5 = 0;
  objc_initWeak(&v5, Weak);
  v7 = 0;
  objc_copyWeak(&v7, &v5);
  -[WKSelectPickerTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v6);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
}

void __42__WKSelectPickerTableViewController_next___block_invoke(uint64_t a1)
{
  id WeakRetained;
  const void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "accessoryTab:", 1);
    CFRelease(v2);
  }
}

- (void)previous:(id)a3
{
  id Weak;
  id v5;
  _QWORD v6[4];
  id v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3321888768;
  v6[2] = __46__WKSelectPickerTableViewController_previous___block_invoke;
  v6[3] = &__block_descriptor_40_e8_32c59_ZTSKZ46__WKSelectPickerTableViewController_previous__E3__5_e5_v8__0l;
  Weak = objc_loadWeak((id *)&self->_contentView);
  v5 = 0;
  objc_initWeak(&v5, Weak);
  v7 = 0;
  objc_copyWeak(&v7, &v5);
  -[WKSelectPickerTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v6);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
}

void __46__WKSelectPickerTableViewController_previous___block_invoke(uint64_t a1)
{
  id WeakRetained;
  const void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "accessoryTab:", 0);
    CFRelease(v2);
  }
}

- (void)close:(id)a3
{
  id Weak;
  id v5;
  _QWORD v6[4];
  id v7;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3321888768;
  v6[2] = __43__WKSelectPickerTableViewController_close___block_invoke;
  v6[3] = &__block_descriptor_40_e8_32c56_ZTSKZ43__WKSelectPickerTableViewController_close__E3__6_e5_v8__0l;
  Weak = objc_loadWeak((id *)&self->_contentView);
  v5 = 0;
  objc_initWeak(&v5, Weak);
  v7 = 0;
  objc_copyWeak(&v7, &v5);
  -[WKSelectPickerTableViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v6);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
}

void __43__WKSelectPickerTableViewController_close___block_invoke(uint64_t a1)
{
  id WeakRetained;
  const void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "accessoryDone");
    CFRelease(v2);
  }
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;

  m_ptr = self->_nextButton.m_ptr;
  self->_nextButton.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_previousButton.m_ptr;
  self->_previousButton.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_collapsedSections.m_ptr;
  self->_collapsedSections.m_ptr = 0;
  if (v5)
    CFRelease(v5);
  objc_destroyWeak((id *)&self->_contentView);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 129) = 0;
  *((_QWORD *)self + 130) = 0;
  *((_QWORD *)self + 131) = 0;
  return self;
}

@end
