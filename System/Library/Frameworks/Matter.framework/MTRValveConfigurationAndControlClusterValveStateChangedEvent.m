@implementation MTRValveConfigurationAndControlClusterValveStateChangedEvent

- (MTRValveConfigurationAndControlClusterValveStateChangedEvent)init
{
  MTRValveConfigurationAndControlClusterValveStateChangedEvent *v2;
  MTRValveConfigurationAndControlClusterValveStateChangedEvent *v3;
  NSNumber *valveState;
  NSNumber *valveLevel;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRValveConfigurationAndControlClusterValveStateChangedEvent;
  v2 = -[MTRValveConfigurationAndControlClusterValveStateChangedEvent init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    valveState = v2->_valveState;
    v2->_valveState = (NSNumber *)&unk_250591B18;

    valveLevel = v3->_valveLevel;
    v3->_valveLevel = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRValveConfigurationAndControlClusterValveStateChangedEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRValveConfigurationAndControlClusterValveStateChangedEvent);
  objc_msgSend_valveState(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValveState_(v4, v8, (uint64_t)v7);

  objc_msgSend_valveLevel(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValveLevel_(v4, v12, (uint64_t)v11);

  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  const char *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: valveState:%@; valveLevel:%@; >"),
    v5,
    self->_valveState,
    self->_valveLevel);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)valveState
{
  return self->_valveState;
}

- (void)setValveState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)valveLevel
{
  return self->_valveLevel;
}

- (void)setValveLevel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valveLevel, 0);
  objc_storeStrong((id *)&self->_valveState, 0);
}

@end
