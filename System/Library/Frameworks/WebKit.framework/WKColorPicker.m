@implementation WKColorPicker

- (WKColorPicker)initWithView:(id)a3
{
  WKColorPicker *v4;
  WKColorPicker *v5;
  id v6;
  void *m_ptr;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WKColorPicker;
  v4 = -[WKColorPicker init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_view, a3);
    v6 = objc_alloc_init(MEMORY[0x1E0CEA488]);
    m_ptr = v5->_colorPickerViewController.m_ptr;
    v5->_colorPickerViewController.m_ptr = v6;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      v6 = v5->_colorPickerViewController.m_ptr;
    }
    objc_msgSend(v6, "setDelegate:", v5);
    objc_msgSend(v5->_colorPickerViewController.m_ptr, "setSupportsAlpha:", 0);
  }
  return v5;
}

- (void)selectColor:(id)a3
{
  objc_msgSend(self->_colorPickerViewController.m_ptr, "setSelectedColor:", a3);
  -[WKColorPicker colorPickerViewControllerDidSelectColor:](self, "colorPickerViewControllerDidSelectColor:", self->_colorPickerViewController.m_ptr);
}

- (id)focusedElementSuggestedColors
{
  uint64_t v2;
  uint64_t v3;
  const Color *v4;
  void *v5;
  uint64_t v6;
  WebCore *v7;
  uint64_t v8;
  const void *v9;
  CFTypeRef cf;

  v2 = objc_msgSend(objc_loadWeak((id *)&self->_view), "focusedElementInformation");
  if (!*(_DWORD *)(v2 + 356))
    return 0;
  v3 = v2;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(unsigned int *)(v2 + 356));
  v6 = *(unsigned int *)(v3 + 356);
  if ((_DWORD)v6)
  {
    v7 = *(WebCore **)(v3 + 344);
    v8 = 8 * v6;
    do
    {
      WebCore::cocoaColor(v7, v4);
      if (cf)
      {
        objc_msgSend(v5, "addObject:");
        v9 = cf;
        cf = 0;
        CFRelease(v9);
      }
      v7 = (WebCore *)((char *)v7 + 8);
      v8 -= 8;
    }
    while (v8);
  }
  return (id)(id)CFMakeCollectable(v5);
}

- (void)updateColorPickerState
{
  void *m_ptr;
  uint64_t v4;
  const Color *v5;
  CFTypeRef cf;

  m_ptr = self->_colorPickerViewController.m_ptr;
  v4 = objc_msgSend(objc_loadWeak((id *)&self->_view), "focusedElementInformation");
  WebCore::cocoaColor((WebCore *)(v4 + 336), v5);
  objc_msgSend(m_ptr, "setSelectedColor:", cf);
  if (cf)
    CFRelease(cf);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(self->_colorPickerViewController.m_ptr, "_setSuggestedColors:", -[WKColorPicker focusedElementSuggestedColors](self, "focusedElementSuggestedColors"));
}

- (void)configurePresentation
{
  WKColorPicker *v2;
  void *v3;
  CGRect v4;
  CGRect v5;

  v2 = self;
  objc_msgSend(self->_colorPickerViewController.m_ptr, "setModalPresentationStyle:", 7);
  v3 = (void *)objc_msgSend(v2->_colorPickerViewController.m_ptr, "popoverPresentationController");
  objc_msgSend(v3, "setDelegate:", v2);
  v2 = (WKColorPicker *)((char *)v2 + 8);
  objc_msgSend(v3, "setSourceView:", objc_loadWeak((id *)&v2->super.isa));
  objc_msgSend(objc_loadWeak((id *)&v2->super.isa), "focusedElementInformation");
  WebCore::IntRect::operator CGRect();
  v5 = CGRectIntegral(v4);
  objc_msgSend(v3, "setSourceRect:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
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
  -[WKColorPicker updateColorPickerState](self, "updateColorPickerState");
  -[WKColorPicker configurePresentation](self, "configurePresentation");
  objc_msgSend((id)objc_msgSend(objc_loadWeak((id *)p_view), "_wk_viewControllerForFullScreenPresentation"), "presentViewController:animated:completion:", self->_colorPickerViewController.m_ptr, 1, 0);
}

- (void)controlEndEditing
{
  objc_msgSend(objc_loadWeak((id *)&self->_view), "stopRelinquishingFirstResponderToFocusedElement");
  objc_msgSend(self->_colorPickerViewController.m_ptr, "dismissViewControllerAnimated:completion:", 0, 0);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  objc_msgSend(objc_loadWeak((id *)&self->_view), "accessoryDone");
}

- (void)colorPickerViewControllerDidSelectColor:(id)a3
{
  objc_msgSend(objc_loadWeak((id *)&self->_view), "updateFocusedElementValueAsColor:", objc_msgSend(a3, "selectedColor"));
}

- (void)colorPickerViewControllerDidFinish:(id)a3
{
  objc_msgSend(objc_loadWeak((id *)&self->_view), "accessoryDone");
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_colorPickerViewController.m_ptr;
  self->_colorPickerViewController.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  objc_destroyWeak((id *)&self->_view);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
