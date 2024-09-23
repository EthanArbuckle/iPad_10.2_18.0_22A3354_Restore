@implementation WKEditCommand

- (WKEditCommand)initWithWebEditCommandProxy:(void *)a3
{
  WKEditCommand *v4;
  WKEditCommand *v5;
  WebEditCommandProxy *v6;
  WebEditCommandProxy *m_ptr;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WKEditCommand;
  v4 = -[WKEditCommand init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = *(WebEditCommandProxy **)a3;
    *(_QWORD *)a3 = 0;
    m_ptr = v4->_command.m_ptr;
    v4->_command.m_ptr = v6;
    if (m_ptr)
      CFRelease(*((CFTypeRef *)m_ptr + 1));
  }
  return v5;
}

- (void)command
{
  return self->_command.m_ptr;
}

- (void).cxx_destruct
{
  WebEditCommandProxy *m_ptr;

  m_ptr = self->_command.m_ptr;
  self->_command.m_ptr = 0;
  if (m_ptr)
    CFRelease(*((CFTypeRef *)m_ptr + 1));
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
