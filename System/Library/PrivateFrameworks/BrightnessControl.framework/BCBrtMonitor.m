@implementation BCBrtMonitor

- (BCBrtMonitor)init
{
  BCBrtMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BCBrtMonitor;
  result = -[BCBrtMonitor init](&v3, sel_init);
  if (result)
    result->_cancel = 0;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[BCBrtMonitor cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)BCBrtMonitor;
  -[BCBrtMonitor dealloc](&v3, sel_dealloc);
}

- (void)setCancelHandler:(id)a3
{

  self->_cancel = (id)objc_msgSend(a3, "copy");
}

- (void)cancel
{
  void (**cancel)(id, SEL);

  cancel = (void (**)(id, SEL))self->_cancel;
  if (cancel)
  {
    cancel[2](cancel, a2);

    self->_cancel = 0;
  }
}

@end
