@implementation FigCaptureMachPortSendRight

- (void)dealloc
{
  objc_super v3;

  -[FigCaptureMachPortSendRight invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureMachPortSendRight;
  -[FigCaptureMachPortSendRight dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  if (!self->_invalid && self->_port + 1 >= 2)
  {
    FigMachPortReleaseSendRight_();
    self->_port = 0;
    self->_invalid = 1;
  }
}

- (FigCaptureMachPortSendRight)initWithPort:(unsigned int)a3
{
  FigCaptureMachPortSendRight *result;
  objc_super v5;

  if (a3 - 1 >= 0xFFFFFFFE)
  {

    return 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)FigCaptureMachPortSendRight;
    result = -[FigCaptureMachPortSendRight init](&v5, sel_init);
    if (result)
      result->_port = a3;
  }
  return result;
}

- (unsigned)port
{
  return self->_port;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("port=%d"), self->_port);
}

@end
