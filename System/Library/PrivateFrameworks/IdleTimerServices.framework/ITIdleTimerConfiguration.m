@implementation ITIdleTimerConfiguration

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (NSString)description
{
  return (NSString *)-[ITIdleTimerConfiguration descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (ITIdleTimerConfiguration)initWithBSXPCCoder:(id)a3
{
  id v4;
  ITIdleTimerConfiguration *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ITIdleTimerConfiguration;
  v5 = -[ITIdleTimerConfiguration init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeStringForKey:", CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_disablesTimer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("disablesIdleTimer"));
    v5->_idleEventMask = objc_msgSend(v4, "decodeUInt64ForKey:", CFSTR("idleEventMask"));
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_idleEventHandlerBlock, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[ITIdleTimerConfiguration descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_disablesTimer)
  {
    v5 = (id)objc_msgSend(v3, "appendObject:withName:", self->_identifier, CFSTR("identifier"));
    v6 = (id)objc_msgSend(v4, "appendBool:withName:", self->_disablesTimer, CFSTR("disablesTimer"));
    v7 = (id)objc_msgSend(v4, "appendUnsignedInteger:withName:", self->_idleEventMask, CFSTR("idleEventMask"));
  }
  return v4;
}

- (id)_copyWithNewIdentifier
{
  _QWORD *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (_QWORD *)-[ITIdleTimerConfiguration copy](self, "copy");
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v2[2];
  v2[2] = v4;

  return v2;
}

+ (id)configurationToDisableIdleTimer
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setDisablesTimer:", 1);
  return v2;
}

- (void)setDisablesTimer:(BOOL)a3
{
  self->_disablesTimer = a3;
}

- (ITIdleTimerConfiguration)initWithConfiguration:(id)a3
{
  id v4;
  ITIdleTimerConfiguration *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  id idleEventHandlerBlock;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ITIdleTimerConfiguration;
  v5 = -[ITIdleTimerConfiguration init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "_identifier");
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_disablesTimer = objc_msgSend(v4, "disablesTimer");
    v5->_idleEventMask = objc_msgSend(v4, "_idleEventMask");
    objc_msgSend(v4, "_idleEventHandlerBlock");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    idleEventHandlerBlock = v5->_idleEventHandlerBlock;
    v5->_idleEventHandlerBlock = (id)v9;

  }
  return v5;
}

- (NSString)_identifier
{
  return self->_identifier;
}

- (BOOL)disablesTimer
{
  return self->_disablesTimer;
}

- (unint64_t)_idleEventMask
{
  return self->_idleEventMask;
}

- (id)_idleEventHandlerBlock
{
  return self->_idleEventHandlerBlock;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithConfiguration:", self);
}

- (id)_uniquedReason:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  -[ITIdleTimerConfiguration _identifier](self, "_identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  NSString *identifier;
  id v5;

  if (a3)
  {
    identifier = self->_identifier;
    v5 = a3;
    objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
    objc_msgSend(v5, "encodeBool:forKey:", self->_disablesTimer, CFSTR("disablesIdleTimer"));
    objc_msgSend(v5, "encodeUInt64:forKey:", self->_idleEventMask, CFSTR("idleEventMask"));

  }
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[ITIdleTimerConfiguration succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_setIdleEventMask:(unint64_t)a3
{
  self->_idleEventMask = a3;
}

- (void)_setIdleEventHandlerBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
