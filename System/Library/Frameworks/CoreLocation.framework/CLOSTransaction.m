@implementation CLOSTransaction

- (CLOSTransaction)initWithDescription:(const char *)a3
{
  const char *v4;
  uint64_t v5;
  CLOSTransaction *v6;
  NSObject *v7;
  NSString *description;
  NSString *v10;
  char *v11;
  objc_super v12;
  int v13;
  OS_os_transaction **v14;
  __int16 v15;
  NSString *v16;
  uint8_t buf[4];
  OS_os_transaction **p_transaction;
  __int16 v19;
  NSString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)CLOSTransaction;
  v6 = -[CLOSTransaction init](&v12, sel_init);
  if (v6)
  {
    v6->_description = (NSString *)(id)objc_msgSend_stringWithUTF8String_(MEMORY[0x1E0CB3940], v4, (uint64_t)a3, v5);
    v6->_transaction = (OS_os_transaction *)os_transaction_create();
    if (qword_1EE172188 != -1)
      dispatch_once(&qword_1EE172188, &unk_1E2990690);
    v7 = qword_1EE172190;
    if (os_log_type_enabled((os_log_t)qword_1EE172190, OS_LOG_TYPE_DEFAULT))
    {
      description = v6->_description;
      *(_DWORD *)buf = 134218242;
      p_transaction = &v6->_transaction;
      v19 = 2112;
      v20 = description;
      _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_DEFAULT, "os_transaction created: (%p) %@", buf, 0x16u);
    }
    if (sub_18F5C4AE0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EE172188 != -1)
        dispatch_once(&qword_1EE172188, &unk_1E2990690);
      v10 = v6->_description;
      v13 = 134218242;
      v14 = &v6->_transaction;
      v15 = 2112;
      v16 = v10;
      v11 = (char *)_os_log_send_and_compose_impl();
      sub_18F5F2740("Generic", 1, 0, 2, "-[CLOSTransaction initWithDescription:]", "CoreLocation: %s\n", v11);
      if (v11 != (char *)buf)
        free(v11);
    }
  }
  return v6;
}

- (void)dealloc
{
  NSObject *v3;
  NSString *description;
  NSString *v5;
  char *v6;
  objc_super v7;
  int v8;
  OS_os_transaction **v9;
  __int16 v10;
  NSString *v11;
  uint8_t buf[4];
  OS_os_transaction **p_transaction;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (qword_1EE172188 != -1)
    dispatch_once(&qword_1EE172188, &unk_1E2990690);
  v3 = qword_1EE172190;
  if (os_log_type_enabled((os_log_t)qword_1EE172190, OS_LOG_TYPE_DEFAULT))
  {
    description = self->_description;
    *(_DWORD *)buf = 134218242;
    p_transaction = &self->_transaction;
    v14 = 2112;
    v15 = description;
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_DEFAULT, "os_transaction released: (%p) %@", buf, 0x16u);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172188 != -1)
      dispatch_once(&qword_1EE172188, &unk_1E2990690);
    v5 = self->_description;
    v8 = 134218242;
    v9 = &self->_transaction;
    v10 = 2112;
    v11 = v5;
    v6 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLOSTransaction dealloc]", "CoreLocation: %s\n", v6);
    if (v6 != (char *)buf)
      free(v6);
  }

  self->_transaction = 0;
  self->_description = 0;
  v7.receiver = self;
  v7.super_class = (Class)CLOSTransaction;
  -[CLOSTransaction dealloc](&v7, sel_dealloc);
}

@end
