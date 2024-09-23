@implementation MTROperationalStateClusterOperationalErrorEvent

- (MTROperationalStateClusterOperationalErrorEvent)init
{
  MTROperationalStateClusterOperationalErrorEvent *v2;
  uint64_t v3;
  MTROperationalStateClusterErrorStateStruct *errorState;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTROperationalStateClusterOperationalErrorEvent;
  v2 = -[MTROperationalStateClusterOperationalErrorEvent init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    errorState = v2->_errorState;
    v2->_errorState = (MTROperationalStateClusterErrorStateStruct *)v3;

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTROperationalStateClusterOperationalErrorEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;

  v4 = objc_alloc_init(MTROperationalStateClusterOperationalErrorEvent);
  objc_msgSend_errorState(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setErrorState_(v4, v8, (uint64_t)v7);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: errorState:%@; >"), v5, self->_errorState);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (MTROperationalStateClusterErrorStateStruct)errorState
{
  return self->_errorState;
}

- (void)setErrorState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorState, 0);
}

@end
