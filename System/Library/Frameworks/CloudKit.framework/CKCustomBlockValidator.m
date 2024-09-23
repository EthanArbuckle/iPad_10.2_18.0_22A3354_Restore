@implementation CKCustomBlockValidator

- (CKCustomBlockValidator)initWithBlock:(id)a3
{
  id v3;
  CKCustomBlockValidator *v4;
  const char *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKCustomBlockValidator;
  v3 = a3;
  v4 = -[CKCustomBlockValidator init](&v8, sel_init);
  objc_msgSend_setBlock_(v4, v5, (uint64_t)v3, v6, v8.receiver, v8.super_class);

  return v4;
}

- (BOOL)validate:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;

  v6 = a3;
  objc_msgSend_block(self, v7, v8, v9);
  v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v10)[2](v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && v11)
    *a4 = objc_retainAutorelease(v11);

  return v11 == 0;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
