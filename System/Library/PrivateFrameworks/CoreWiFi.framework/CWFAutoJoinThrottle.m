@implementation CWFAutoJoinThrottle

- (NSDictionary)intervalsBasedOnTriggerTimestamp
{
  return self->_intervalsBasedOnTriggerTimestamp;
}

- (NSDictionary)intervals
{
  return self->_intervals;
}

- (id)description
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0CB3940];
  sub_1B063D5D0(self->_trigger, a2, v2, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v6, v8, (uint64_t)CFSTR("trigger=%@, intervals=(%@), intervalsBasedOnTriggerTimestamp=(%@)"), v9, v10, v7, self->_intervals, self->_intervalsBasedOnTriggerTimestamp);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)autoJoinThrottleWithTrigger:(int64_t)a3 intervals:(id)a4
{
  id v5;
  CWFAutoJoinThrottle *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a4;
  v6 = objc_alloc_init(CWFAutoJoinThrottle);
  objc_msgSend_setTrigger_(v6, v7, a3, v8, v9);
  objc_msgSend_setIntervals_(v6, v10, (uint64_t)v5, v11, v12);

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = (void *)objc_msgSend_allocWithZone_(CWFAutoJoinThrottle, a2, (uint64_t)a3, v3, v4);
  v11 = (void *)objc_msgSend_init(v6, v7, v8, v9, v10);
  objc_msgSend_setTrigger_(v11, v12, self->_trigger, v13, v14);
  objc_msgSend_setIntervals_(v11, v15, (uint64_t)self->_intervals, v16, v17);
  objc_msgSend_setIntervalsBasedOnTriggerTimestamp_(v11, v18, (uint64_t)self->_intervalsBasedOnTriggerTimestamp, v19, v20);
  return v11;
}

- (int64_t)trigger
{
  return self->_trigger;
}

- (void)setTrigger:(int64_t)a3
{
  self->_trigger = a3;
}

- (void)setIntervals:(id)a3
{
  objc_storeStrong((id *)&self->_intervals, a3);
}

- (void)setIntervalsBasedOnTriggerTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_intervalsBasedOnTriggerTimestamp, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intervalsBasedOnTriggerTimestamp, 0);
  objc_storeStrong((id *)&self->_intervals, 0);
}

@end
