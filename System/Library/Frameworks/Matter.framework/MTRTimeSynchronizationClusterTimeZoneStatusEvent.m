@implementation MTRTimeSynchronizationClusterTimeZoneStatusEvent

- (MTRTimeSynchronizationClusterTimeZoneStatusEvent)init
{
  MTRTimeSynchronizationClusterTimeZoneStatusEvent *v2;
  MTRTimeSynchronizationClusterTimeZoneStatusEvent *v3;
  NSNumber *offset;
  NSString *name;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRTimeSynchronizationClusterTimeZoneStatusEvent;
  v2 = -[MTRTimeSynchronizationClusterTimeZoneStatusEvent init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    offset = v2->_offset;
    v2->_offset = (NSNumber *)&unk_250591B18;

    name = v3->_name;
    v3->_name = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRTimeSynchronizationClusterTimeZoneStatusEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRTimeSynchronizationClusterTimeZoneStatusEvent);
  objc_msgSend_offset(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setOffset_(v4, v8, (uint64_t)v7);

  objc_msgSend_name(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setName_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: offset:%@; name:%@; >"), v5, self->_offset, self->_name);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)offset
{
  return self->_offset;
}

- (void)setOffset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_offset, 0);
}

@end
