@implementation BPSCorrelateHandler

- (id)context
{
  return self->_context;
}

- (void)updateContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_context, 0);
}

- (BPSCorrelateHandler)initWithInitialContext:(id)a3
{
  id v5;
  BPSCorrelateHandler *v6;
  BPSCorrelateHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BPSCorrelateHandler;
  v6 = -[BPSCorrelateHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_context, a3);

  return v7;
}

- (void)receivePriorEvent:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Override method %@ in subclass %@"), v5, objc_opt_class());

}

- (void)receiveCurrentEvent:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Override method %@ in subclass %@"), v5, objc_opt_class());

}

- (id)correlateWithCurrentEvent:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Override method %@ in subclass %@"), v5, objc_opt_class());

  return 0;
}

- (void)setContext:(id)a3
{
  objc_storeStrong(&self->_context, a3);
}

+ (id)directStreamsAssociationWithBlock:(id)a3
{
  id v3;
  BPSDirectAssocationCorrelateHandler *v4;

  v3 = a3;
  v4 = -[BPSDirectAssocationCorrelateHandler initWithCorrelating:]([BPSDirectAssocationCorrelateHandler alloc], "initWithCorrelating:", v3);

  return v4;
}

@end
