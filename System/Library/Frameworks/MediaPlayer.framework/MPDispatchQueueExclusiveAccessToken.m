@implementation MPDispatchQueueExclusiveAccessToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

+ (id)tokenWithQueue:(id)a3 owner:(id)a4
{
  id v5;
  _QWORD *v6;
  void *v7;

  v5 = a3;
  v6 = -[MPDispatchQueueExclusiveAccessToken _init]([MPDispatchQueueExclusiveAccessToken alloc], "_init");
  v7 = (void *)v6[1];
  v6[1] = v5;

  v6[2] = a4;
  return v6;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPDispatchQueueExclusiveAccessToken;
  return -[MPDispatchQueueExclusiveAccessToken init](&v3, sel_init);
}

- (void)assertHasExclusiveAccessForOwner:(id)a3
{
  id v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_accessQueue);
  if (self->_owner != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPExclusiveAccessToken.m"), 37, CFSTR("Exclusive access not for this owner %@ != %@"), self->_owner, a3);

  }
}

@end
