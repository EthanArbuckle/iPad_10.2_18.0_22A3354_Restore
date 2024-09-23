@implementation WKSelectMultiplePicker

- (WKSelectMultiplePicker)initWithView:(id)a3
{
  WKSelectMultiplePicker *v4;
  WKSelectMultiplePicker *v5;
  WKSelectPickerTableViewController *v6;
  void *m_ptr;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WKSelectMultiplePicker;
  v4 = -[WKSelectMultiplePicker init](&v11, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_view, a3);
    v6 = -[WKSelectPickerTableViewController initWithView:]([WKSelectPickerTableViewController alloc], "initWithView:", objc_loadWeak((id *)&v5->_view));
    m_ptr = v5->_tableViewController.m_ptr;
    v5->_tableViewController.m_ptr = v6;
    if (m_ptr)
      CFRelease(m_ptr);
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7B8]), "initWithRootViewController:", v5->_tableViewController.m_ptr);
    v9 = v5->_navigationController.m_ptr;
    v5->_navigationController.m_ptr = (void *)v8;
    if (v9)
      CFRelease(v9);
  }
  return v5;
}

- (void)configurePresentation
{
  int IsSmallScreen;
  void *m_ptr;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  WKContentView **p_view;
  _QWORD v10[3];
  CGRect v11;
  CGRect v12;

  v10[2] = *MEMORY[0x1E0C80C00];
  IsSmallScreen = PAL::currentUserInterfaceIdiomIsSmallScreen((PAL *)self);
  m_ptr = self->_navigationController.m_ptr;
  if (IsSmallScreen)
  {
    v5 = (void *)objc_msgSend(m_ptr, "navigationBar");
    objc_msgSend(v5, "setBarTintColor:", objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor"));
    v6 = (void *)objc_msgSend(self->_navigationController.m_ptr, "presentationController");
    objc_msgSend(v6, "setDelegate:", self);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if (v6)
    {
      if ((isKindOfClass & 1) != 0)
      {
        v10[0] = objc_msgSend(MEMORY[0x1E0CEA9A8], "mediumDetent");
        v10[1] = objc_msgSend(MEMORY[0x1E0CEA9A8], "largeDetent");
        objc_msgSend(v6, "setDetents:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2));
        objc_msgSend(v6, "setWidthFollowsPreferredContentSizeWhenEdgeAttached:", 1);
        objc_msgSend(v6, "setPrefersEdgeAttachedInCompactHeight:", 1);
      }
    }
  }
  else
  {
    objc_msgSend(m_ptr, "setModalPresentationStyle:", 7);
    objc_msgSend(self->_navigationController.m_ptr, "setNavigationBarHidden:", 1);
    objc_msgSend(self->_tableViewController.m_ptr, "setPreferredContentSize:", 320.0, 320.0);
    v8 = (void *)objc_msgSend(self->_navigationController.m_ptr, "popoverPresentationController");
    objc_msgSend(v8, "setDelegate:", self);
    p_view = &self->_view;
    objc_msgSend(v8, "setSourceView:", objc_loadWeak((id *)p_view));
    objc_msgSend(objc_loadWeak((id *)p_view), "focusedElementInformation");
    WebCore::IntRect::operator CGRect();
    v12 = CGRectIntegral(v11);
    objc_msgSend(v8, "setSourceRect:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
  }
}

- (id)controlView
{
  return 0;
}

- (void)controlBeginEditing
{
  WKContentView **p_view;

  p_view = &self->_view;
  objc_msgSend(objc_loadWeak((id *)&self->_view), "startRelinquishingFirstResponderToFocusedElement");
  -[WKSelectMultiplePicker configurePresentation](self, "configurePresentation");
  objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)p_view), "_wk_viewControllerForFullScreenPresentation"), "presentViewController:animated:completion:", self->_navigationController.m_ptr, 1, 0);
}

- (void)controlUpdateEditing
{
  objc_msgSend((id)objc_msgSend(self->_tableViewController.m_ptr, "tableView"), "reloadData");
}

- (void)controlEndEditing
{
  objc_msgSend(objc_loadWeak((id *)&self->_view), "stopRelinquishingFirstResponderToFocusedElement");
  objc_msgSend(self->_tableViewController.m_ptr, "dismissViewControllerAnimated:completion:", 0, 0);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  objc_msgSend(objc_loadWeak((id *)&self->_view), "accessoryDone");
}

- (id)_indexPathForRow:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  int v11;

  v4 = objc_msgSend(objc_loadWeak((id *)&self->_view), "focusedSelectElementOptions");
  v5 = *(unsigned int *)(v4 + 12);
  if (!(_DWORD)v5)
    return 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 16 * v5;
  v10 = (unsigned __int8 *)(*(_QWORD *)v4 + 8);
  while (1)
  {
    v11 = *v10;
    v10 += 16;
    if (!v11)
      break;
    v7 = 0;
    ++v6;
LABEL_7:
    v9 -= 16;
    if (!v9)
      return 0;
  }
  if (v8 != a3)
  {
    ++v7;
    ++v8;
    goto LABEL_7;
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v7, v6);
}

- (void)selectRow:(int64_t)a3 inComponent:(int64_t)a4 extendingSelection:(BOOL)a5
{
  id v6;
  id v7;

  v6 = -[WKSelectMultiplePicker _indexPathForRow:](self, "_indexPathForRow:", a3, a4, a5);
  if (v6)
  {
    v7 = v6;
    objc_msgSend((id)objc_msgSend(self->_tableViewController.m_ptr, "tableView"), "selectRowAtIndexPath:animated:scrollPosition:", v6, 0, 2);
    objc_msgSend(self->_tableViewController.m_ptr, "tableView:didSelectRowAtIndexPath:", objc_msgSend(self->_tableViewController.m_ptr, "tableView"), v7);
  }
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;

  m_ptr = self->_tableViewController.m_ptr;
  self->_tableViewController.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_navigationController.m_ptr;
  self->_navigationController.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  objc_destroyWeak((id *)&self->_view);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
