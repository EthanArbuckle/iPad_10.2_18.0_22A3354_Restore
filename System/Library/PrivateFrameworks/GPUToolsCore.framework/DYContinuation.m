@implementation DYContinuation

- (DYContinuation)init
{
  -[DYContinuation doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (DYContinuation)initWithQueue:(id)a3 block:(id)a4
{
  DYContinuation *v6;
  objc_super v8;

  if (!a3)
    dy_abort("queue cannot be NULL", a2, 0, a4);
  if (!a4)
    dy_abort("block cannot be NULL", a2);
  v8.receiver = self;
  v8.super_class = (Class)DYContinuation;
  v6 = -[DYContinuation init](&v8, sel_init);
  if (v6)
  {
    dispatch_retain((dispatch_object_t)a3);
    v6->queue = (OS_dispatch_queue *)a3;
    v6->block = (id)objc_msgSend(a4, "copy");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->queue);
  v3.receiver = self;
  v3.super_class = (Class)DYContinuation;
  -[DYContinuation dealloc](&v3, sel_dealloc);
}

- (void)dispatch
{
  dispatch_async((dispatch_queue_t)self->queue, self->block);
}

@end
