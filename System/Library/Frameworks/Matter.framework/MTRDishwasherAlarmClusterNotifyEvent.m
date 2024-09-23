@implementation MTRDishwasherAlarmClusterNotifyEvent

- (MTRDishwasherAlarmClusterNotifyEvent)init
{
  MTRDishwasherAlarmClusterNotifyEvent *v2;
  MTRDishwasherAlarmClusterNotifyEvent *v3;
  NSNumber *active;
  NSNumber *inactive;
  NSNumber *state;
  NSNumber *mask;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTRDishwasherAlarmClusterNotifyEvent;
  v2 = -[MTRDishwasherAlarmClusterNotifyEvent init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    active = v2->_active;
    v2->_active = (NSNumber *)&unk_250591B18;

    inactive = v3->_inactive;
    v3->_inactive = (NSNumber *)&unk_250591B18;

    state = v3->_state;
    v3->_state = (NSNumber *)&unk_250591B18;

    mask = v3->_mask;
    v3->_mask = (NSNumber *)&unk_250591B18;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRDishwasherAlarmClusterNotifyEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;

  v4 = objc_alloc_init(MTRDishwasherAlarmClusterNotifyEvent);
  objc_msgSend_active(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setActive_(v4, v8, (uint64_t)v7);

  objc_msgSend_inactive(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInactive_(v4, v12, (uint64_t)v11);

  objc_msgSend_state(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setState_(v4, v16, (uint64_t)v15);

  objc_msgSend_mask(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMask_(v4, v20, (uint64_t)v19);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: active:%@; inactive:%@; state:%@; mask:%@; >"),
    v5,
    self->_active,
    self->_inactive,
    self->_state,
    self->_mask);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)active
{
  return self->_active;
}

- (void)setActive:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)inactive
{
  return self->_inactive;
}

- (void)setInactive:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)mask
{
  return self->_mask;
}

- (void)setMask:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mask, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_inactive, 0);
  objc_storeStrong((id *)&self->_active, 0);
}

@end
