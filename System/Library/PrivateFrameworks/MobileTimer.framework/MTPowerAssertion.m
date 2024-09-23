@implementation MTPowerAssertion

- (MTPowerAssertion)initWithName:(id)a3
{
  return -[MTPowerAssertion initWithName:assertionTimeout:](self, "initWithName:assertionTimeout:", a3, 0.0);
}

- (MTPowerAssertion)initWithName:(id)a3 assertionTimeout:(double)a4
{
  id v7;
  MTPowerAssertion *v8;
  MTPowerAssertion *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MTPowerAssertion;
  v8 = -[MTPowerAssertion init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_assertionTimeout = a4;
    v9->_assertionID = 0;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_assertionID)
    -[MTPowerAssertion releaseAssertion](self, "releaseAssertion");
  v3.receiver = self;
  v3.super_class = (Class)MTPowerAssertion;
  -[MTPowerAssertion dealloc](&v3, sel_dealloc);
}

- (void)takeAssertion
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_19AC4E000, v0, v1, "%{public}@ Taking power assert for %{public}@. when assertion already taken.", v2, v3, v4, v5, v6);
}

- (void)releaseAssertion
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "IOReturn __IOPMAssertionRelease(IOPMAssertionID)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTPowerAssertion.m"), 20, CFSTR("%s"), dlerror());

  __break(1u);
}

- (NSString)name
{
  return self->_name;
}

- (double)assertionTimeout
{
  return self->_assertionTimeout;
}

- (unsigned)assertionID
{
  return self->_assertionID;
}

- (void)setAssertionID:(unsigned int)a3
{
  self->_assertionID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
