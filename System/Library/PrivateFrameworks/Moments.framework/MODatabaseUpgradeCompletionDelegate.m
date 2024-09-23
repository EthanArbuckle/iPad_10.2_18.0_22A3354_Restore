@implementation MODatabaseUpgradeCompletionDelegate

- (MODatabaseUpgradeCompletionDelegate)initWithHandler:(id)a3
{
  id v4;
  MODatabaseUpgradeCompletionDelegate *v5;
  uint64_t v6;
  id handler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MODatabaseUpgradeCompletionDelegate;
  v5 = -[MODatabaseUpgradeCompletionDelegate init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1D1799054](v4);
    handler = v5->_handler;
    v5->_handler = (id)v6;

  }
  return v5;
}

- (void)didUpdateWithStatus:(unint64_t)a3 andError:(id)a4
{
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v8 = a4;
  -[MODatabaseUpgradeCompletionDelegate handler](self, "handler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MODatabaseUpgradeCompletionDelegate handler](self, "handler");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, unint64_t, id))v7)[2](v7, a3, v8);

  }
}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
