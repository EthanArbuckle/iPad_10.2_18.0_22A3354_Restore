@implementation WKLayerHostView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (unsigned)contextID
{
  return objc_msgSend(-[WKLayerHostView layerHost](self, "layerHost"), "contextId");
}

- (void)setContextID:(unsigned int)a3
{
  objc_msgSend(-[WKLayerHostView layerHost](self, "layerHost"), "setContextId:", *(_QWORD *)&a3);
}

- (BOOL)clipsToBounds
{
  return 0;
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v5;

  objc_storeWeak(&self->_window.m_weakReference, a3);
  v5.receiver = self;
  v5.super_class = (Class)WKLayerHostView;
  -[WKLayerHostView willMoveToWindow:](&v5, sel_willMoveToWindow_, a3);
}

- (id)window
{
  id result;
  objc_super v4;

  result = objc_loadWeak(&self->_window.m_weakReference);
  if (result)
  {
    v4.receiver = self;
    v4.super_class = (Class)WKLayerHostView;
    return -[WKLayerHostView window](&v4, sel_window);
  }
  return result;
}

- (UIView)visibilityPropagationView
{
  return (UIView *)self->_visibilityPropagationView.m_ptr;
}

- (void)setVisibilityPropagationView:(id)a3
{
  void *m_ptr;

  objc_msgSend(self->_visibilityPropagationView.m_ptr, "removeFromSuperview");
  if (a3)
    CFRetain(a3);
  m_ptr = self->_visibilityPropagationView.m_ptr;
  self->_visibilityPropagationView.m_ptr = a3;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    a3 = self->_visibilityPropagationView.m_ptr;
  }
  -[WKLayerHostView addSubview:](self, "addSubview:", a3);
}

- (void).cxx_destruct
{
  void *m_ptr;
  void *v4;

  m_ptr = self->_hostingView.m_ptr;
  self->_hostingView.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
  v4 = self->_visibilityPropagationView.m_ptr;
  self->_visibilityPropagationView.m_ptr = 0;
  if (v4)
    CFRelease(v4);
  objc_destroyWeak(&self->_window.m_weakReference);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 52) = 0;
  *((_QWORD *)self + 53) = 0;
  *((_QWORD *)self + 54) = 0;
  return self;
}

@end
