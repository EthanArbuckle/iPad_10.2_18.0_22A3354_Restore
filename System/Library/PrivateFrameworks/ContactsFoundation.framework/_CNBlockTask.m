@implementation _CNBlockTask

- (_CNBlockTask)initWithName:(id)a3
{
  return -[_CNBlockTask initWithName:block:](self, "initWithName:block:", a3, &__block_literal_global_48);
}

- (_CNBlockTask)initWithBlock:(id)a3
{
  return -[_CNBlockTask initWithName:block:](self, "initWithName:block:", &stru_1E29BCC70, a3);
}

- (_CNBlockTask)initWithName:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _CNBlockTask *v9;
  uint64_t v10;
  id block;
  _CNBlockTask *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    if (CNGuardOSLog_cn_once_token_0_5 != -1)
      dispatch_once(&CNGuardOSLog_cn_once_token_0_5, &__block_literal_global_14);
    v8 = CNGuardOSLog_cn_once_object_0_5;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_5, OS_LOG_TYPE_FAULT))
      -[_CNBlockTask initWithName:block:].cold.1(v8);
  }
  v14.receiver = self;
  v14.super_class = (Class)_CNBlockTask;
  v9 = -[CNTask initWithName:](&v14, sel_initWithName_, v6);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    block = v9->_block;
    v9->_block = (id)v10;

    v12 = v9;
  }

  return v9;
}

- (id)run:(id *)a3
{
  return (id)(*((uint64_t (**)(void))self->_block + 2))();
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

- (void)initWithName:(os_log_t)log block:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_18F80C000, log, OS_LOG_TYPE_FAULT, "parameter ‘block’ must be nonnull", v1, 2u);
}

@end
