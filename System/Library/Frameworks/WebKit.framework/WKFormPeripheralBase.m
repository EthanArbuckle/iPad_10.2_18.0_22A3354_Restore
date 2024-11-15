@implementation WKFormPeripheralBase

- (WKFormPeripheralBase)initWithView:(id)a3 control:(void *)a4
{
  WKFormPeripheralBase *v6;
  WKFormPeripheralBase *v7;
  void *v8;
  void *m_ptr;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WKFormPeripheralBase;
  v6 = -[WKFormPeripheralBase init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_view = (WKContentView *)a3;
    v8 = *(void **)a4;
    *(_QWORD *)a4 = 0;
    m_ptr = v6->_control.m_ptr;
    v7->_control.m_ptr = v8;
    if (m_ptr)
      CFRelease(m_ptr);
  }
  return v7;
}

- (void)beginEditing
{
  if (!self->_editing)
  {
    self->_editing = 1;
    objc_msgSend(self->_control.m_ptr, "controlBeginEditing");
  }
}

- (void)updateEditing
{
  if (self->_editing)
    objc_msgSend(self->_control.m_ptr, "controlUpdateEditing");
}

- (void)endEditing
{
  if (self->_editing)
  {
    self->_editing = 0;
    objc_msgSend(self->_control.m_ptr, "controlEndEditing");
  }
}

- (id)assistantView
{
  return (id)objc_msgSend(self->_control.m_ptr, "controlView");
}

- (WKFormControl)control
{
  return (WKFormControl *)self->_control.m_ptr;
}

- (BOOL)handleKeyEvent:(id)a3
{
  int v5;
  void *v6;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(self->_control.m_ptr, "controlHandleKeyEvent:", a3) & 1) != 0)
  {
    goto LABEL_12;
  }
  v5 = objc_msgSend(a3, "_isKeyDown");
  if (v5)
  {
    if ((objc_msgSend(a3, "_inputFlags") & 0x20) == 0)
    {
      if (!self->_editing)
        goto LABEL_10;
      if (objc_msgSend(a3, "_keyCode") == 41
        || (v6 = (void *)objc_msgSend(a3, "_unmodifiedInput"),
            objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CEB740])))
      {
        -[WKContentView accessoryDone](self->_view, "accessoryDone");
LABEL_12:
        LOBYTE(v5) = 1;
        return v5;
      }
      if (!self->_editing)
      {
LABEL_10:
        if (objc_msgSend(a3, "_keyCode") == 44)
        {
          -[WKContentView accessoryOpen](self->_view, "accessoryOpen");
          goto LABEL_12;
        }
      }
    }
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (WKContentView)view
{
  return self->_view;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (BOOL)singleTapShouldEndEditing
{
  return self->_singleTapShouldEndEditing;
}

- (void)setSingleTapShouldEndEditing:(BOOL)a3
{
  self->_singleTapShouldEndEditing = a3;
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
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
