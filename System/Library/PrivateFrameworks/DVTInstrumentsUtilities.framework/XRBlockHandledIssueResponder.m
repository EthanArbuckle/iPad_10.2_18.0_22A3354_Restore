@implementation XRBlockHandledIssueResponder

- (XRBlockHandledIssueResponder)initWithHandler:(id)a3
{
  id v4;
  XRBlockHandledIssueResponder *v5;
  uint64_t v6;
  id handler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)XRBlockHandledIssueResponder;
  v5 = -[XRBlockHandledIssueResponder init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x227696724](v4);
    handler = v5->_handler;
    v5->_handler = (id)v6;

  }
  return v5;
}

- (void)handleIssue:(id)a3 type:(signed __int16)a4 from:(id)a5
{
  (*((void (**)(void))self->_handler + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
