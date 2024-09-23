@implementation ITIdleTimeout

- (ITIdleTimeout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ITIdleTimeout.m"), 20, CFSTR("wrong initializer"));

  return 0;
}

- (ITIdleTimeout)initWithDuration:(double)a3 identifier:(unint64_t)a4
{
  ITIdleTimeout *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ITIdleTimeout;
  result = -[ITIdleTimeout init](&v7, sel_init);
  if (result)
  {
    result->_duration = a3;
    result->_identifier = a4;
  }
  return result;
}

- (ITIdleTimeout)initWithDuration:(double)a3
{
  return -[ITIdleTimeout initWithDuration:identifier:](self, "initWithDuration:identifier:", 0, a3);
}

+ (id)timeoutGeneratorUsingIdentifier:(unint64_t)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__ITIdleTimeout_timeoutGeneratorUsingIdentifier___block_invoke;
  v4[3] = &__block_descriptor_40_e23___ITIdleTimeout_16__0d8l;
  v4[4] = a3;
  return (id)MEMORY[0x2199F2B14](v4, a2);
}

ITIdleTimeout *__49__ITIdleTimeout_timeoutGeneratorUsingIdentifier___block_invoke(uint64_t a1, double a2)
{
  return -[ITIdleTimeout initWithDuration:identifier:]([ITIdleTimeout alloc], "initWithDuration:identifier:", *(_QWORD *)(a1 + 32), a2);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  char v6;

  v4 = a3;
  if (v4 && (v5 = objc_opt_class(), v5 == objc_opt_class()) && v4[2] == self->_identifier)
    v6 = BSFloatEqualToFloat();
  else
    v6 = 0;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ITIdleTimeout initWithDuration:identifier:](+[ITIdleTimeout allocWithZone:](ITIdleTimeout, "allocWithZone:", a3), "initWithDuration:identifier:", self->_identifier, self->_duration);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[ITIdleTimeout succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUInt64:withName:", self->_identifier, CFSTR("identifier"));
  v5 = (id)objc_msgSend(v3, "appendTimeInterval:withName:decomposeUnits:", CFSTR("duration"), 0, self->_duration);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[ITIdleTimeout descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)duration
{
  return self->_duration;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

@end
