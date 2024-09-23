@implementation WKActionSheet

- (WKActionSheet)init
{
  WKActionSheet *v2;
  WKActionSheet *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WKActionSheet;
  v2 = -[WKActionSheet init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_arrowDirections = 15;
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom"))
      {
        v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_willRotate, *MEMORY[0x1E0CEBE58], 0);
        objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_didRotate, *MEMORY[0x1E0CEBE18], 0);
      }
    }
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[WKActionSheet _cleanup](self, "_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)WKActionSheet;
  -[WKActionSheet dealloc](&v3, sel_dealloc);
}

- (void)_cleanup
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self);
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
}

- (BOOL)presentSheet:(int64_t)a3
{
  double x;
  double y;
  double width;
  double height;
  CGRect v10;

  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice"), "userInterfaceIdiom"))
    {
      -[WKActionSheet _presentationRectForStyle:](self, "_presentationRectForStyle:", a3);
      x = v10.origin.x;
      y = v10.origin.y;
      width = v10.size.width;
      height = v10.size.height;
      if (CGRectIsEmpty(v10))
        return 0;
    }
  }
  self->_currentPresentationStyle = a3;
  return -[WKActionSheet presentSheetFromRect:](self, "presentSheetFromRect:", x, y, width, height);
}

- (CGRect)_presentationRectForStyle:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  if (a3 == 2)
  {
    -[WKActionSheetDelegate presentationRectForElementUsingClosestIndicatedRect](self->_sheetDelegate, "presentationRectForElementUsingClosestIndicatedRect");
  }
  else if (a3 == 1)
  {
    -[WKActionSheetDelegate presentationRectForIndicatedElement](self->_sheetDelegate, "presentationRectForIndicatedElement");
  }
  else
  {
    -[WKActionSheetDelegate initialPresentationRectInHostViewForSheet](self->_sheetDelegate, "initialPresentationRectInHostViewForSheet");
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (BOOL)presentSheetFromRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *m_ptr;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)-[WKActionSheetDelegate hostViewForSheet](self->_sheetDelegate, "hostViewForSheet");
  if (v8)
  {
    if (self->_presentedViewControllerWhileRotating.m_ptr)
      m_ptr = self->_presentedViewControllerWhileRotating.m_ptr;
    else
      m_ptr = self;
    objc_msgSend(m_ptr, "setModalPresentationStyle:", 7);
    v10 = (void *)objc_msgSend(m_ptr, "popoverPresentationController");
    objc_msgSend(v10, "setSourceView:", v8);
    objc_msgSend(v10, "setSourceRect:", x, y, width, height);
    objc_msgSend(v10, "setPermittedArrowDirections:", self->_arrowDirections);
    if (self->_popoverPresentationControllerDelegateWhileRotating.m_ptr)
      objc_msgSend(v10, "setDelegate:");
    v11 = (void *)objc_msgSend(v8, "_wk_viewControllerForFullScreenPresentation");
    v12 = v11;
    if (v11)
      CFRetain(v11);
    v13 = self->_currentPresentingViewController.m_ptr;
    self->_currentPresentingViewController.m_ptr = v12;
    if (v13)
    {
      CFRelease(v13);
      v12 = self->_currentPresentingViewController.m_ptr;
    }
    objc_msgSend(v12, "presentViewController:animated:completion:", m_ptr, 1, 0);
  }
  return v8 != 0;
}

- (void)doneWithSheet:(BOOL)a3
{
  WKActionSheet *v4;
  void *m_ptr;
  void *v6;
  void *v7;

  if (a3)
  {
    v4 = (WKActionSheet *)objc_msgSend(self->_currentPresentingViewController.m_ptr, "presentedViewController");
    if (v4 == self || self->_presentedViewControllerWhileRotating.m_ptr == v4)
      -[WKActionSheet dismissViewControllerAnimated:completion:](v4, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  m_ptr = self->_currentPresentingViewController.m_ptr;
  self->_currentPresentingViewController.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v6 = self->_presentedViewControllerWhileRotating.m_ptr;
  self->_presentedViewControllerWhileRotating.m_ptr = 0;
  if (v6)
    CFRelease(v6);
  v7 = self->_popoverPresentationControllerDelegateWhileRotating.m_ptr;
  self->_popoverPresentationControllerDelegateWhileRotating.m_ptr = 0;
  if (v7)
    CFRelease(v7);
  self->_currentPresentationStyle = 0;
  -[WKActionSheet _cleanup](self, "_cleanup");
}

- (void)willRotate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *m_ptr;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  v3 = (void *)-[WKActionSheetDelegate hostViewForSheet](self->_sheetDelegate, "hostViewForSheet");
  if (v3)
  {
    v4 = (void *)objc_msgSend(v3, "_wk_viewControllerForFullScreenPresentation");
    v5 = (void *)objc_msgSend(v4, "presentedViewController");
    if (objc_msgSend((id)objc_msgSend(v5, "presentationController"), "presentationStyle") == 7 && !self->_isRotating)
    {
      self->_isRotating = 1;
      self->_readyToPresentAfterRotation = 0;
      v6 = v5;
      if (-[WKActionSheet presentingViewController](self, "presentingViewController"))
        v6 = (void *)-[WKActionSheet presentedViewController](self, "presentedViewController");
      if (v6)
        CFRetain(v6);
      m_ptr = self->_presentedViewControllerWhileRotating.m_ptr;
      self->_presentedViewControllerWhileRotating.m_ptr = v6;
      if (m_ptr)
        CFRelease(m_ptr);
      v8 = (void *)objc_msgSend((id)objc_msgSend(v5, "popoverPresentationController"), "delegate");
      v9 = v8;
      if (v8)
        CFRetain(v8);
      v10 = self->_popoverPresentationControllerDelegateWhileRotating.m_ptr;
      self->_popoverPresentationControllerDelegateWhileRotating.m_ptr = v9;
      if (v10)
        CFRelease(v10);
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __27__WKActionSheet_willRotate__block_invoke;
      v11[3] = &unk_1E34BAF80;
      v11[4] = self;
      objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 0, v11);
    }
  }
}

uint64_t __27__WKActionSheet_willRotate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateSheetPosition");
}

- (void)updateSheetPosition
{
  WKActionSheet *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  int v11;
  double x;
  double y;
  double width;
  double height;
  void *m_ptr;
  void *v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v2 = self;
  if (self->_presentedViewControllerWhileRotating.m_ptr)
    self = (WKActionSheet *)self->_presentedViewControllerWhileRotating.m_ptr;
  if (!v2->_isRotating
    && v2->_readyToPresentAfterRotation
    && !-[WKActionSheet presentingViewController](self, "presentingViewController")
    && !-[WKActionSheet presentingViewController](v2, "presentingViewController"))
  {
    -[WKActionSheet _presentationRectForStyle:](v2, "_presentationRectForStyle:", v2->_currentPresentationStyle);
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v11 = objc_msgSend(v2->_presentedViewControllerWhileRotating.m_ptr, "isModalInPresentation");
    v19.origin.x = v4;
    v19.origin.y = v6;
    v19.size.width = v8;
    v19.size.height = v10;
    if (!CGRectIsEmpty(v19) || v11 != 0)
    {
      objc_msgSend((id)-[WKActionSheetDelegate hostViewForSheet](v2->_sheetDelegate, "hostViewForSheet"), "bounds");
      v22.origin.x = v4;
      v22.origin.y = v6;
      v22.size.width = v8;
      v22.size.height = v10;
      v21 = CGRectIntersection(v20, v22);
      x = v21.origin.x;
      y = v21.origin.y;
      width = v21.size.width;
      height = v21.size.height;
      if (CGRectIsEmpty(v21))
      {
        if (v11)
          -[WKActionSheet presentSheet:](v2, "presentSheet:", v2->_currentPresentationStyle);
      }
      else
      {
        -[WKActionSheet presentSheetFromRect:](v2, "presentSheetFromRect:", x, y, width, height);
      }
      m_ptr = v2->_presentedViewControllerWhileRotating.m_ptr;
      v2->_presentedViewControllerWhileRotating.m_ptr = 0;
      if (m_ptr)
        CFRelease(m_ptr);
      v18 = v2->_popoverPresentationControllerDelegateWhileRotating.m_ptr;
      v2->_popoverPresentationControllerDelegateWhileRotating.m_ptr = 0;
      if (v18)
        CFRelease(v18);
    }
  }
}

- (void)_didRotateAndLayout
{
  self->_isRotating = 0;
  self->_readyToPresentAfterRotation = 1;
  -[WKActionSheetDelegate updatePositionInformation](self->_sheetDelegate, "updatePositionInformation");
  -[WKActionSheet updateSheetPosition](self, "updateSheetPosition");
}

- (void)didRotate
{
  -[WKActionSheet performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__didRotateAndLayout, 0, 0.0);
}

- (WKActionSheetDelegate)sheetDelegate
{
  return self->_sheetDelegate;
}

- (void)setSheetDelegate:(id)a3
{
  self->_sheetDelegate = (WKActionSheetDelegate *)a3;
}

- (unint64_t)arrowDirections
{
  return self->_arrowDirections;
}

- (void)setArrowDirections:(unint64_t)a3
{
  self->_arrowDirections = a3;
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;
  void *v5;

  m_ptr = self->_popoverPresentationControllerDelegateWhileRotating.m_ptr;
  self->_popoverPresentationControllerDelegateWhileRotating.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_presentedViewControllerWhileRotating.m_ptr;
  self->_presentedViewControllerWhileRotating.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  v5 = self->_currentPresentingViewController.m_ptr;
  self->_currentPresentingViewController.m_ptr = 0;
  if (v5)
    CFRelease(v5);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 167) = 0;
  *((_QWORD *)self + 168) = 0;
  *((_QWORD *)self + 169) = 0;
  return self;
}

@end
