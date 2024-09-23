@implementation DummyWalrusStateController

- (DummyWalrusStateController)init
{
  DummyWalrusStateController *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DummyWalrusStateController;
  result = -[DummyWalrusStateController init](&v3, sel_init);
  if (result)
    result->walrusStatus = 2;
  return result;
}

- (void)walrusStatusWithCompletion:(id)a3
{
  (*((void (**)(id, unint64_t, _QWORD))a3 + 2))(a3, self->walrusStatus, 0);
}

- (unint64_t)walrusStatus:(id *)a3
{
  return self->walrusStatus;
}

- (void)updateWalrusStatus:(unint64_t)a3 completion:(id)a4
{
  self->walrusStatus = a3;
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

@end
