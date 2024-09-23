@implementation MTRPowerSourceClusterWiredFaultChangeEvent

- (MTRPowerSourceClusterWiredFaultChangeEvent)init
{
  const char *v2;
  uint64_t v3;
  MTRPowerSourceClusterWiredFaultChangeEvent *v4;
  uint64_t v5;
  NSArray *current;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  NSArray *previous;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MTRPowerSourceClusterWiredFaultChangeEvent;
  v4 = -[MTRPowerSourceClusterWiredFaultChangeEvent init](&v12, sel_init);
  if (v4)
  {
    objc_msgSend_array(MEMORY[0x24BDBCE30], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    current = v4->_current;
    v4->_current = (NSArray *)v5;

    objc_msgSend_array(MEMORY[0x24BDBCE30], v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    previous = v4->_previous;
    v4->_previous = (NSArray *)v9;

  }
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRPowerSourceClusterWiredFaultChangeEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRPowerSourceClusterWiredFaultChangeEvent);
  objc_msgSend_current(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCurrent_(v4, v8, (uint64_t)v7);

  objc_msgSend_previous(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setPrevious_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: current:%@; previous:%@; >"),
    v5,
    self->_current,
    self->_previous);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSArray)current
{
  return self->_current;
}

- (void)setCurrent:(NSArray *)current
{
  objc_setProperty_nonatomic_copy(self, a2, current, 8);
}

- (NSArray)previous
{
  return self->_previous;
}

- (void)setPrevious:(NSArray *)previous
{
  objc_setProperty_nonatomic_copy(self, a2, previous, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previous, 0);
  objc_storeStrong((id *)&self->_current, 0);
}

@end
