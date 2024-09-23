@implementation WKSelectPopover

- (WKSelectPopover)initWithView:(id)a3 hasGroups:(BOOL)a4
{
  _BOOL8 v4;
  WKSelectPopover *v6;
  WKSelectTableViewController *v7;
  void *m_ptr;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  const void *v18;
  objc_super v20;

  v4 = a4;
  v20.receiver = self;
  v20.super_class = (Class)WKSelectPopover;
  v6 = -[WKFormRotatingAccessoryPopover initWithView:](&v20, sel_initWithView_);
  if (v6)
  {
    v7 = -[WKSelectTableViewController initWithView:hasGroups:]([WKSelectTableViewController alloc], "initWithView:hasGroups:", a3, v4);
    m_ptr = v6->_tableViewController.m_ptr;
    v6->_tableViewController.m_ptr = v7;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      v7 = (WKSelectTableViewController *)v6->_tableViewController.m_ptr;
    }
    -[WKSelectTableViewController setPopover:](v7, "setPopover:", v6);
    v9 = v6->_tableViewController.m_ptr;
    if (v9)
      CFRetain(v6->_tableViewController.m_ptr);
    v10 = *(_QWORD *)(objc_msgSend(a3, "focusedElementInformation") + 240);
    if (v10 && *(_DWORD *)(v10 + 4))
    {
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v6->_tableViewController.m_ptr);
      if (v9)
        CFRelease(v9);
      v12 = 0;
      v9 = (void *)v11;
    }
    else
    {
      v12 = 1;
    }
    objc_msgSend((id)objc_msgSend(v6->_tableViewController.m_ptr, "tableView"), "sizeThatFits:", 320.0, 1.79769313e308);
    v14 = v13;
    v16 = v15;
    v17 = v9;
    if ((v12 & 1) == 0)
      v17 = (void *)objc_msgSend(v9, "topViewController");
    objc_msgSend(v17, "setPreferredContentSize:", v14, v16);
    v18 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA888]), "initWithContentViewController:", v9);
    -[WKRotatingPopover setPopoverController:](v6, "setPopoverController:", v18);
    if (v18)
      CFRelease(v18);
    if (v9)
      CFRelease(v9);
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(self->_tableViewController.m_ptr, "setPopover:", 0);
  objc_msgSend((id)objc_msgSend(self->_tableViewController.m_ptr, "tableView"), "setDataSource:", 0);
  objc_msgSend((id)objc_msgSend(self->_tableViewController.m_ptr, "tableView"), "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WKSelectPopover;
  -[WKRotatingPopover dealloc](&v3, sel_dealloc);
}

- (id)controlView
{
  return 0;
}

- (void)controlBeginEditing
{
  -[WKRotatingPopover presentPopoverAnimated:](self, "presentPopoverAnimated:", 0);
}

- (void)controlUpdateEditing
{
  objc_msgSend((id)objc_msgSend(self->_tableViewController.m_ptr, "tableView"), "reloadData");
}

- (void)controlEndEditing
{
  -[WKRotatingPopover dismissPopoverAnimated:](self, "dismissPopoverAnimated:", objc_msgSend(self->_tableViewController.m_ptr, "shouldDismissWithAnimation"));
}

- (UITableViewController)tableViewController
{
  return (UITableViewController *)self->_tableViewController.m_ptr;
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_tableViewController.m_ptr;
  self->_tableViewController.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  return self;
}

- (void)selectRow:(int64_t)a3 inComponent:(int64_t)a4 extendingSelection:(BOOL)a5
{
  uint64_t v6;

  v6 = objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, a4, a5);
  objc_msgSend((id)objc_msgSend(self->_tableViewController.m_ptr, "tableView"), "selectRowAtIndexPath:animated:scrollPosition:", v6, 0, 2);
  objc_msgSend(self->_tableViewController.m_ptr, "tableView:didSelectRowAtIndexPath:", objc_msgSend(self->_tableViewController.m_ptr, "tableView"), v6);
}

@end
