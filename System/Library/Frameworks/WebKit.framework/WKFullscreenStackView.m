@implementation WKFullscreenStackView

- (WKFullscreenStackView)init
{
  WKFullscreenStackView *v2;
  WKFullscreenStackView *v3;
  void *v4;
  void *m_ptr;
  void *v6;

  v2 = -[WKFullscreenStackView initWithFrame:](self, "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
  v3 = v2;
  if (v2)
  {
    -[WKFullscreenStackView setClipsToBounds:](v2, "setClipsToBounds:", 1);
    v4 = (void *)objc_msgSend(objc_alloc((Class)getAVBackgroundViewClass()), "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
    m_ptr = v3->_backgroundView.m_ptr;
    v3->_backgroundView.m_ptr = v4;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      v4 = v3->_backgroundView.m_ptr;
    }
    objc_msgSend(v4, "setClipsToBounds:", 1);
    objc_msgSend((id)objc_msgSend(v3->_backgroundView.m_ptr, "layer"), "setContinuousCorners:", 1);
    objc_msgSend((id)objc_msgSend(v3->_backgroundView.m_ptr, "layer"), "setCornerRadius:", 16.0);
    v6 = (void *)objc_msgSend(v3->_backgroundView.m_ptr, "layer");
    objc_msgSend(v6, "setCornerCurve:", *MEMORY[0x1E0CD2A60]);
    -[WKFullscreenStackView addSubview:](v3, "addSubview:", v3->_backgroundView.m_ptr);
  }
  return v3;
}

- (void)addArrangedSubview:(id)a3 applyingMaterialStyle:(int64_t)a4 tintEffectStyle:(int64_t)a5
{
  objc_msgSend(self->_backgroundView.m_ptr, "addSubview:applyingMaterialStyle:tintEffectStyle:", a3, a4, a5);
  -[WKFullscreenStackView addArrangedSubview:](self, "addArrangedSubview:", a3);
}

- (void)layoutSubviews
{
  void *m_ptr;
  objc_super v4;

  m_ptr = self->_backgroundView.m_ptr;
  -[WKFullscreenStackView bounds](self, "bounds");
  objc_msgSend(m_ptr, "setFrame:");
  v4.receiver = self;
  v4.super_class = (Class)WKFullscreenStackView;
  -[WKFullscreenStackView layoutSubviews](&v4, sel_layoutSubviews);
}

- (void).cxx_destruct
{
  void *m_ptr;

  m_ptr = self->_backgroundView.m_ptr;
  self->_backgroundView.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 56) = 0;
  return self;
}

@end
