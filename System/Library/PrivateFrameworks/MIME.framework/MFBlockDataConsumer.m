@implementation MFBlockDataConsumer

- (MFBlockDataConsumer)initWithAppendHandler:(id)a3 doneHandler:(id)a4
{
  id v6;
  id v7;
  MFBlockDataConsumer *v8;
  uint64_t v9;
  id appendHandler;
  uint64_t v11;
  id doneHandler;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MFBlockDataConsumer;
  v8 = -[MFBlockDataConsumer init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    appendHandler = v8->_appendHandler;
    v8->_appendHandler = (id)v9;

    v11 = objc_msgSend(v7, "copy");
    doneHandler = v8->_doneHandler;
    v8->_doneHandler = (id)v11;

  }
  return v8;
}

- (int64_t)appendData:(id)a3
{
  id v4;
  uint64_t (**appendHandler)(id, id);
  uint64_t v6;
  int64_t v7;

  v4 = a3;
  appendHandler = (uint64_t (**)(id, id))self->_appendHandler;
  if (appendHandler)
    v6 = appendHandler[2](appendHandler, v4);
  else
    v6 = objc_msgSend(v4, "length");
  v7 = v6;

  return v7;
}

- (void)done
{
  void (**doneHandler)(id, SEL);
  id appendHandler;
  id v5;

  doneHandler = (void (**)(id, SEL))self->_doneHandler;
  if (doneHandler)
    doneHandler[2](doneHandler, a2);
  appendHandler = self->_appendHandler;
  self->_appendHandler = 0;

  v5 = self->_doneHandler;
  self->_doneHandler = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_doneHandler, 0);
  objc_storeStrong(&self->_appendHandler, 0);
}

@end
