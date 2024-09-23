@implementation DABabysitterRegistrationToken

- (DABabysitterRegistrationToken)initWithBlock:(id)a3
{
  id v4;
  DABabysitterRegistrationToken *v5;
  uint64_t v6;
  id unregisterBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DABabysitterRegistrationToken;
  v5 = -[DABabysitterRegistrationToken init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x1C3BB541C](v4);
    unregisterBlock = v5->_unregisterBlock;
    v5->_unregisterBlock = (id)v6;

  }
  return v5;
}

- (void)dealloc
{
  id unregisterBlock;
  void (**v4)(_QWORD);
  id v5;
  objc_super v6;

  unregisterBlock = self->_unregisterBlock;
  if (unregisterBlock)
  {
    v4 = (void (**)(_QWORD))MEMORY[0x1C3BB541C](unregisterBlock, a2);
    v5 = self->_unregisterBlock;
    self->_unregisterBlock = 0;

    v4[2](v4);
  }
  v6.receiver = self;
  v6.super_class = (Class)DABabysitterRegistrationToken;
  -[DABabysitterRegistrationToken dealloc](&v6, sel_dealloc);
}

- (id)unregisterBlock
{
  return self->_unregisterBlock;
}

- (void)setUnregisterBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unregisterBlock, 0);
}

@end
