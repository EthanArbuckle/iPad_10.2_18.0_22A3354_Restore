@implementation WKRotatingPopover

- (WKRotatingPopover)initWithView:(id)a3
{
  WKRotatingPopover *v4;
  WKRotatingPopover *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WKRotatingPopover;
  v4 = -[WKRotatingPopover init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_view = (WKContentView *)a3;
    -[WKRotatingPopover setPresentationPoint:](v4, "setPresentationPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel_willRotate_, *MEMORY[0x1E0CEBE58], 0);
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel_didRotate_, *MEMORY[0x1E0CEBE18], 0);
  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  self->_view = 0;
  objc_msgSend(self->_popoverController.m_ptr, "dismissPopoverAnimated:", 1);
  objc_msgSend(self->_popoverController.m_ptr, "setDelegate:", 0);
  -[WKRotatingPopover setPopoverController:](self, "setPopoverController:", 0);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEBE58], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEBE18], 0);
  v4.receiver = self;
  v4.super_class = (Class)WKRotatingPopover;
  -[WKRotatingPopover dealloc](&v4, sel_dealloc);
}

- (UIPopoverController)popoverController
{
  return (UIPopoverController *)self->_popoverController.m_ptr;
}

- (void)setPopoverController:(id)a3
{
  id m_ptr;
  id v5;
  void *v6;

  m_ptr = self->_popoverController.m_ptr;
  if (m_ptr != a3)
  {
    v5 = a3;
    objc_msgSend(m_ptr, "setDelegate:", 0);
    if (v5)
      CFRetain(v5);
    v6 = self->_popoverController.m_ptr;
    self->_popoverController.m_ptr = v5;
    if (v6)
    {
      CFRelease(v6);
      v5 = self->_popoverController.m_ptr;
    }
    objc_msgSend(v5, "setDelegate:", self);
  }
}

- (unint64_t)popoverArrowDirections
{
  return 15;
}

- (void)presentPopoverAnimated:(BOOL)a3
{
  _BOOL8 v3;
  unint64_t v5;
  double v6;
  WKContentView *view;
  double v8;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  void *m_ptr;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v3 = a3;
  v5 = -[WKRotatingPopover popoverArrowDirections](self, "popoverArrowDirections");
  -[WKRotatingPopover presentationPoint](self, "presentationPoint");
  view = self->_view;
  if (v8 == *MEMORY[0x1E0C9D538] && v6 == *(double *)(MEMORY[0x1E0C9D538] + 8))
  {
    -[WKContentView focusedElementInformation](view, "focusedElementInformation");
    WebCore::IntRect::operator CGRect();
    v14 = v19;
    v16 = v20;
    v17 = v21;
    v18 = v22;
  }
  else
  {
    v10 = -[WKContentView page](view, "page");
    v11 = 672;
    if (!*(_BYTE *)(v10 + 857))
      v11 = 640;
    v12 = *(double *)(v10 + v11);
    -[WKRotatingPopover presentationPoint](self, "presentationPoint");
    v14 = v12 * v13;
    -[WKRotatingPopover presentationPoint](self, "presentationPoint");
    v16 = v12 * v15;
    v17 = 1.0;
    v18 = 1.0;
  }
  -[WKContentView bounds](self->_view, "bounds");
  v31.origin.x = v23;
  v31.origin.y = v24;
  v31.size.width = v25;
  v31.size.height = v26;
  v28.origin.x = v14;
  v28.origin.y = v16;
  v28.size.width = v17;
  v28.size.height = v18;
  if (CGRectIntersectsRect(v28, v31))
  {
    m_ptr = self->_popoverController.m_ptr;
    v29.origin.x = v14;
    v29.origin.y = v16;
    v29.size.width = v17;
    v29.size.height = v18;
    v30 = CGRectIntegral(v29);
    objc_msgSend(m_ptr, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", self->_view, v5, v3, v30.origin.x, v30.origin.y, v30.size.width, v30.size.height);
  }
}

- (void)dismissPopoverAnimated:(BOOL)a3
{
  objc_msgSend(self->_popoverController.m_ptr, "dismissPopoverAnimated:", a3);
}

- (void)willRotate:(id)a3
{
  self->_isRotating = 1;
  objc_msgSend(self->_popoverController.m_ptr, "dismissPopoverAnimated:", 0);
}

- (void)didRotate:(id)a3
{
  self->_isRotating = 0;
  -[WKRotatingPopover presentPopoverAnimated:](self, "presentPopoverAnimated:", 0);
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  if (!self->_isRotating)
    -[WKRotatingPopoverDelegate popoverWasDismissed:](self->_dismissionDelegate, "popoverWasDismissed:", self);
}

- (WKContentView)view
{
  return self->_view;
}

- (CGPoint)presentationPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_presentationPoint.x;
  y = self->_presentationPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPresentationPoint:(CGPoint)a3
{
  self->_presentationPoint = a3;
}

- (WKRotatingPopoverDelegate)dismissionDelegate
{
  return self->_dismissionDelegate;
}

- (void)setDismissionDelegate:(id)a3
{
  self->_dismissionDelegate = (WKRotatingPopoverDelegate *)a3;
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_popoverController.m_ptr;
  self->_popoverController.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  return self;
}

@end
