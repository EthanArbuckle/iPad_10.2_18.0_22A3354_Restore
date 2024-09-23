@implementation GEODataURLSessionWaiter

- (GEODataURLSessionWaiter)init
{
  GEODataURLSessionWaiter *result;

  result = (GEODataURLSessionWaiter *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (void)dataURLSession:(id)a3 didCompleteTask:(id)a4
{
  id v6;
  void (**v7)(id, id);
  SEL v8;
  id strongReferenceToSelf;
  id v10;

  v10 = a3;
  v6 = a4;
  if (!self)
  {
    v7 = (void (**)(id, id))MEMORY[0x20];
    MEMORY[0x20] = 0;
    goto LABEL_4;
  }
  v7 = (void (**)(id, id))self->_handler;
  objc_setProperty_nonatomic_copy(self, v8, 0, 24);
  strongReferenceToSelf = self->_strongReferenceToSelf;
  self->_strongReferenceToSelf = 0;

  if (v7)
  {
    v7[2](v7, v6);
LABEL_4:

  }
}

- (void)cancel
{
  -[GEODataURLSessionTask cancel](self->_task, "cancel");
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_strongReferenceToSelf, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
