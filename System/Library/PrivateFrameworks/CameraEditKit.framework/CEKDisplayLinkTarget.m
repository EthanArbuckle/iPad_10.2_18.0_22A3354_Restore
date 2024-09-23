@implementation CEKDisplayLinkTarget

- (void)displayLinkDidFire:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[CEKDisplayLinkTarget handler](self, "handler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CEKDisplayLinkTarget handler](self, "handler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (id)handler
{
  return self->_handler;
}

- (CEKDisplayLinkTarget)initWithHandler:(id)a3
{
  id v4;
  CEKDisplayLinkTarget *v5;
  uint64_t v6;
  id handler;
  CEKDisplayLinkTarget *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CEKDisplayLinkTarget;
  v5 = -[CEKDisplayLinkTarget init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    handler = v5->_handler;
    v5->_handler = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
