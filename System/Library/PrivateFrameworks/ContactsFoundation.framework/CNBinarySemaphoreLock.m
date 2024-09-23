@implementation CNBinarySemaphoreLock

- (CNBinarySemaphoreLock)init
{
  CNBinarySemaphoreLock *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *semaphore;
  CNBinarySemaphoreLock *v5;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNBinarySemaphoreLock;
  v2 = -[CNBinarySemaphoreLock init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_semaphore_create(1);
    semaphore = v2->_semaphore;
    v2->_semaphore = (OS_dispatch_semaphore *)v3;

    if (!v2->_semaphore)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("dispatch_semaphore_wait failed"), 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_exception_throw(v7);
    }
    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CNBinarySemaphoreLock invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CNBinarySemaphoreLock;
  -[CNBinarySemaphoreLock dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  OS_dispatch_semaphore *semaphore;

  semaphore = self->_semaphore;
  self->_semaphore = 0;

}

- (void)lock
{
  id v3;

  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dispatch_semaphore_wait failed: %@"), self);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], objc_claimAutoreleasedReturnValue(), 0);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v3);
  }
}

- (void)unlock
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  +[CNDescriptionBuilder descriptionBuilderWithObject:](CNDescriptionBuilder, "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:pointerValue:", CFSTR("semaphore"), self->_semaphore);
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("name"), self->_name);
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
}

@end
