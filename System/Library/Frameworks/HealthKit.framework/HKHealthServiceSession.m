@implementation HKHealthServiceSession

- (HKHealthServiceSession)initWithService:(id)a3
{
  id v5;
  HKHealthServiceSession *v6;
  NSLock *v7;
  NSLock *propertyLock;
  HKHealthServiceSession *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKHealthServiceSession;
  v6 = -[HKHealthServiceSession init](&v11, sel_init);
  if (!v6)
    goto LABEL_5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("*** HKHealthService required."));
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v7 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
  propertyLock = v6->_propertyLock;
  v6->_propertyLock = v7;

  objc_storeStrong((id *)&v6->_service, a3);
  v6->_sessionIdentifier = 0;
  v9 = v6;
LABEL_6:

  return v9;
}

- (HKHealthService)service
{
  return self->_service;
}

- (NSLock)propertyLock
{
  return self->_propertyLock;
}

- (void)setPropertyLock:(id)a3
{
  objc_storeStrong((id *)&self->_propertyLock, a3);
}

- (unint64_t)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(unint64_t)a3
{
  self->_sessionIdentifier = a3;
}

- (id)sessionHandler
{
  return self->_sessionHandler;
}

- (void)setSessionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)characteristicsHandler
{
  return self->_characteristicsHandler;
}

- (void)setCharacteristicsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_characteristicsHandler, 0);
  objc_storeStrong(&self->_sessionHandler, 0);
  objc_storeStrong((id *)&self->_propertyLock, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end
