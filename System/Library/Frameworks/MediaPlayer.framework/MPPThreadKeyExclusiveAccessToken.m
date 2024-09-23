@implementation MPPThreadKeyExclusiveAccessToken

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPPThreadKeyExclusiveAccessToken;
  return -[MPPThreadKeyExclusiveAccessToken init](&v3, sel_init);
}

- (void)assertHasExclusiveAccessForOwner:(id)a3
{
  void *v6;
  id v7;

  if (!pthread_getspecific(self->_key))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPExclusiveAccessToken.m"), 59, CFSTR("Exclusive access failed"));

  }
  if (self->_owner != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPExclusiveAccessToken.m"), 60, CFSTR("Exclusive access not for this owner %@ != %@"), self->_owner, a3);

  }
}

+ (id)tokenWithKey:(unint64_t)a3 owner:(id)a4
{
  _QWORD *v6;

  v6 = -[MPPThreadKeyExclusiveAccessToken _init]([MPPThreadKeyExclusiveAccessToken alloc], "_init");
  v6[1] = a3;
  v6[2] = a4;
  return v6;
}

@end
