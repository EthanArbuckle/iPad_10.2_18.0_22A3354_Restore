@implementation DummyWebAccessStateController

- (DummyWebAccessStateController)init
{
  DummyWebAccessStateController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DummyWebAccessStateController;
  result = -[DummyWebAccessStateController init](&v3, sel_init);
  if (result)
    result->webAccessStatus = 2;
  return result;
}

- (void)webAccessStatusWithCompletion:(id)a3
{
  (*((void (**)(id, unint64_t, _QWORD))a3 + 2))(a3, self->webAccessStatus, 0);
}

- (unint64_t)webAccessStatus:(id *)a3
{
  return self->webAccessStatus;
}

- (void)updateWebAccessStatus:(unint64_t)a3 completion:(id)a4
{
  self->webAccessStatus = a3;
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

@end
