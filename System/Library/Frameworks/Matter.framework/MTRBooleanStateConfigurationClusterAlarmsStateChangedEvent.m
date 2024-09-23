@implementation MTRBooleanStateConfigurationClusterAlarmsStateChangedEvent

- (MTRBooleanStateConfigurationClusterAlarmsStateChangedEvent)init
{
  MTRBooleanStateConfigurationClusterAlarmsStateChangedEvent *v2;
  MTRBooleanStateConfigurationClusterAlarmsStateChangedEvent *v3;
  NSNumber *alarmsActive;
  NSNumber *alarmsSuppressed;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRBooleanStateConfigurationClusterAlarmsStateChangedEvent;
  v2 = -[MTRBooleanStateConfigurationClusterAlarmsStateChangedEvent init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    alarmsActive = v2->_alarmsActive;
    v2->_alarmsActive = (NSNumber *)&unk_250591B18;

    alarmsSuppressed = v3->_alarmsSuppressed;
    v3->_alarmsSuppressed = 0;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRBooleanStateConfigurationClusterAlarmsStateChangedEvent *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;

  v4 = objc_alloc_init(MTRBooleanStateConfigurationClusterAlarmsStateChangedEvent);
  objc_msgSend_alarmsActive(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlarmsActive_(v4, v8, (uint64_t)v7);

  objc_msgSend_alarmsSuppressed(self, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setAlarmsSuppressed_(v4, v12, (uint64_t)v11);

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
  objc_msgSend_stringWithFormat_(v3, v6, (uint64_t)CFSTR("<%@: alarmsActive:%@; alarmsSuppressed:%@; >"),
    v5,
    self->_alarmsActive,
    self->_alarmsSuppressed);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)alarmsActive
{
  return self->_alarmsActive;
}

- (void)setAlarmsActive:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSNumber)alarmsSuppressed
{
  return self->_alarmsSuppressed;
}

- (void)setAlarmsSuppressed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alarmsSuppressed, 0);
  objc_storeStrong((id *)&self->_alarmsActive, 0);
}

@end
