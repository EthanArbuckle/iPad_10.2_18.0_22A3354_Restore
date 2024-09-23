@implementation MTRBooleanStateClusterStateChangeEvent

- (MTRBooleanStateClusterStateChangeEvent)init
{
  MTRBooleanStateClusterStateChangeEvent *v2;
  MTRBooleanStateClusterStateChangeEvent *v3;
  NSNumber *stateValue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTRBooleanStateClusterStateChangeEvent;
  v2 = -[MTRBooleanStateClusterStateChangeEvent init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    stateValue = v2->_stateValue;
    v2->_stateValue = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRBooleanStateClusterStateChangeEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;

  v4 = objc_alloc_init(MTRBooleanStateClusterStateChangeEvent);
  objc_msgSend_stateValue(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setStateValue_(v4, v8, (uint64_t)v7);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: stateValue:%@; >"), v5, self->_stateValue);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)stateValue
{
  return self->_stateValue;
}

- (void)setStateValue:(NSNumber *)stateValue
{
  objc_setProperty_nonatomic_copy(self, a2, stateValue, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateValue, 0);
}

@end
