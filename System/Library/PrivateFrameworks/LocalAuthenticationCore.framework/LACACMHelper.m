@implementation LACACMHelper

- (id)initAndCreateContext
{
  void *v3;
  LACACMHelper *v4;

  objc_msgSend((id)objc_opt_class(), "createACMContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    self = -[LACACMHelper initWithExternalizedContext:](self, "initWithExternalizedContext:", v3);
    v4 = self;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (LACACMHelper)initWithACMContext:(__ACMHandle *)a3
{
  LACACMHelper *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LACACMHelper;
  result = -[LACACMHelper init](&v5, sel_init);
  if (result)
    result->_acmContext = a3;
  return result;
}

- (LACACMHelper)initWithExternalizedContext:(id)a3
{
  id v4;
  LACACMHelper *v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)LACACMHelper;
  v5 = -[LACACMHelper init](&v8, sel_init);
  if (v5)
  {
    v6 = objc_retainAutorelease(v4);
    v5->_acmContext = (__ACMHandle *)ACMContextCreateWithExternalForm((_OWORD *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
    v5->_contextOwner = 1;
  }

  return v5;
}

- (void)dealloc
{
  __ACMHandle *acmContext;
  objc_super v4;

  acmContext = self->_acmContext;
  if (acmContext && self->_contextOwner)
    ACMContextDelete(acmContext, 0);
  v4.receiver = self;
  v4.super_class = (Class)LACACMHelper;
  -[LACACMHelper dealloc](&v4, sel_dealloc);
}

- (NSData)externalizedContext
{
  __ACMHandle *acmContext;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = 0;
  acmContext = self->_acmContext;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__LACACMHelper_externalizedContext__block_invoke;
  v5[3] = &unk_2510C21E0;
  v5[4] = &v6;
  ACMContextGetExternalForm(acmContext, (uint64_t)v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSData *)v3;
}

void __35__LACACMHelper_externalizedContext__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (BOOL)setVariable:(unsigned int)a3 value:(id)a4 error:(id *)a5
{
  uint64_t v6;
  id v8;
  NSObject *v9;
  uint64_t bag_uuid;
  __ACMHandle *acmContext;
  id v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  uint64_t v17;
  uint8_t buf[24];
  uint64_t v19;

  v6 = *(_QWORD *)&a3;
  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  LACLogACM();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v6;
    _os_log_impl(&dword_2409DC000, v9, OS_LOG_TYPE_DEFAULT, "Setting ACM envrionment variable: %d", buf, 8u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = 0;
  bag_uuid = aks_get_bag_uuid(0, buf);
  if ((_DWORD)bag_uuid)
  {
    if (!a5)
    {
LABEL_10:
      v14 = 0;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to get keybag UUID with code: %d"), bag_uuid, v17);
LABEL_9:
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, v15);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  acmContext = self->_acmContext;
  v12 = objc_retainAutorelease(v8);
  v13 = ACMSetEnvironmentVariableWithAccessPolicy(v6, acmContext, buf, 16, (const void *)objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"));
  v14 = (_DWORD)v13 == 0;
  if (a5 && (_DWORD)v13)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to set variable: %d with status: %d"), v6, v13);
    goto LABEL_9;
  }
LABEL_11:

  return v14;
}

- (id)exchangeControlData:(id)a3 error:(id *)a4
{
  id v6;
  __ACMHandle *acmContext;
  id v8;
  const void *v9;
  size_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5;
  v19 = __Block_byref_object_dispose__5;
  v20 = (id)objc_opt_new();
  acmContext = self->_acmContext;
  v8 = objc_retainAutorelease(v6);
  v9 = (const void *)objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __42__LACACMHelper_exchangeControlData_error___block_invoke;
  v14[3] = &unk_2510C21E0;
  v14[4] = &v15;
  v11 = ACMSEPControlEx((uint64_t)acmContext, 0, 0, v9, v10, (uint64_t)v14);
  if ((_DWORD)v11)
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Control exchange data failed with error code: %d"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[LACError errorWithCode:debugDescription:](LACError, "errorWithCode:debugDescription:", -1000, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  else
  {
    a4 = (id *)(id)v16[5];
  }
  _Block_object_dispose(&v15, 8);

  return a4;
}

void __42__LACACMHelper_exchangeControlData_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  if (a2)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a2, a3);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

    }
  }
}

+ (id)createACMContext
{
  int v2;
  NSObject *v3;
  id v5;
  _QWORD v6[5];
  const void *v7;
  uint8_t buf[8];
  uint8_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  v2 = ACMContextCreate((uint64_t *)&v7);
  if (v2)
  {
    LACLogACM();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v2;
      _os_log_impl(&dword_2409DC000, v3, OS_LOG_TYPE_DEFAULT, "Unable to create ACM context with status: %d", buf, 8u);
    }

    return 0;
  }
  else
  {
    *(_QWORD *)buf = 0;
    v9 = buf;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__5;
    v12 = __Block_byref_object_dispose__5;
    v13 = 0;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __32__LACACMHelper_createACMContext__block_invoke;
    v6[3] = &unk_2510C21E0;
    v6[4] = buf;
    ACMContextGetExternalForm(v7, (uint64_t)v6);
    v5 = *((id *)v9 + 5);
    _Block_object_dispose(buf, 8);

    return v5;
  }
}

void __32__LACACMHelper_createACMContext__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", a2, a3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (__ACMHandle)acmContext
{
  return self->_acmContext;
}

- (void)setAcmContext:(__ACMHandle *)a3
{
  self->_acmContext = a3;
}

@end
