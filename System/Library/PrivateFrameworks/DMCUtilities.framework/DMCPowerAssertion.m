@implementation DMCPowerAssertion

- (DMCPowerAssertion)initWithReason:(id)a3
{
  DMCPowerAssertion *v3;
  DMCPowerAssertion *v4;
  NSObject *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DMCPowerAssertion;
  v3 = -[DMCProcessAssertion initWithReason:](&v7, sel_initWithReason_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_parked = 0;
    _assertionQueue();
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_sync(v5, &__block_literal_global_17);

  }
  return v4;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  _QWORD block[5];

  _assertionQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__DMCPowerAssertion_dealloc__block_invoke;
  block[3] = &unk_1E4D37148;
  block[4] = self;
  dispatch_sync(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)DMCPowerAssertion;
  -[DMCProcessAssertion dealloc](&v4, sel_dealloc);
}

void __28__DMCPowerAssertion_dealloc__block_invoke(uint64_t a1)
{
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
    _releasePowerAssertion();
}

- (void)park
{
  NSObject *v3;
  _QWORD block[5];

  _assertionQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__DMCPowerAssertion_park__block_invoke;
  block[3] = &unk_1E4D37148;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __25__DMCPowerAssertion_park__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v1 + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Trying to park a power assertion that's already parked."), 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v2);
  }
  *(_BYTE *)(v1 + 24) = 1;
  _releasePowerAssertion();
}

- (void)unpark
{
  NSObject *v3;
  _QWORD block[5];

  _assertionQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__DMCPowerAssertion_unpark__block_invoke;
  block[3] = &unk_1E4D37148;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __27__DMCPowerAssertion_unpark__block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Trying to unpark a power assertion that's not parked."), 0);
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v2);
  }
  *(_BYTE *)(v1 + 24) = 0;
  _retainPowerAssertion();
}

- (BOOL)isParked
{
  return self->_parked;
}

@end
