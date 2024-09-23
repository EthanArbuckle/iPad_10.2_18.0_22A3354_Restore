@implementation LACExtractablePasswordPersistenceSimulatorAdapter

- (void)dealloc
{
  objc_super v3;

  -[NSMutableData resetBytesInRange:](self->_data, "resetBytesInRange:", 0, -[NSMutableData length](self->_data, "length"));
  v3.receiver = self;
  v3.super_class = (Class)LACExtractablePasswordPersistenceSimulatorAdapter;
  -[LACExtractablePasswordPersistenceSimulatorAdapter dealloc](&v3, sel_dealloc);
}

- (id)extractPassword:(id *)a3
{
  return self->_data;
}

- (void)extractPasswordWithCompletion:(id)a3
{
  (*((void (**)(id, NSMutableData *, _QWORD))a3 + 2))(a3, self->_data, 0);
}

- (void)stashPassword:(id)a3 completion:(id)a4
{
  objc_class *v6;
  id v7;
  NSMutableData *v8;
  NSMutableData *data;
  void (**v10)(id, _QWORD);

  v6 = (objc_class *)MEMORY[0x24BDBCEC8];
  v10 = (void (**)(id, _QWORD))a4;
  v7 = a3;
  v8 = (NSMutableData *)objc_msgSend([v6 alloc], "initWithData:", v7);

  data = self->_data;
  self->_data = v8;

  v10[2](v10, 0);
}

- (BOOL)stashPassword:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  NSMutableData *v7;
  NSMutableData *data;

  v5 = (objc_class *)MEMORY[0x24BDBCEC8];
  v6 = a3;
  v7 = (NSMutableData *)objc_msgSend([v5 alloc], "initWithData:", v6);

  data = self->_data;
  self->_data = v7;

  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
