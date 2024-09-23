@implementation MTRSubscribeParams

- (MTRSubscribeParams)initWithMinInterval:(NSNumber *)minInterval maxInterval:(NSNumber *)maxInterval
{
  NSNumber *v6;
  NSNumber *v7;
  MTRSubscribeParams *v8;
  const char *v9;
  uint64_t v10;
  MTRSubscribeParams *v11;
  uint64_t v12;
  NSNumber *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSNumber *v17;
  objc_super v19;

  v6 = minInterval;
  v7 = maxInterval;
  v19.receiver = self;
  v19.super_class = (Class)MTRSubscribeParams;
  v8 = -[MTRReadParams init](&v19, sel_init);
  v11 = v8;
  if (v8)
  {
    v8->_reportEventsUrgently = 1;
    v8->_replaceExistingSubscriptions = 1;
    v8->_resubscribeAutomatically = 1;
    v12 = objc_msgSend_copy(v6, v9, v10);
    v13 = v11->_minInterval;
    v11->_minInterval = (NSNumber *)v12;

    v16 = objc_msgSend_copy(v7, v14, v15);
    v17 = v11->_maxInterval;
    v11->_maxInterval = (NSNumber *)v16;

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MTRSubscribeParams *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t shouldFilterByFabric;
  const char *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  uint64_t shouldAssumeUnknownAttributesReportable;
  const char *v24;
  const char *v25;
  uint64_t v26;
  uint64_t shouldReplaceExistingSubscriptions;
  const char *v28;
  const char *v29;
  uint64_t v30;
  uint64_t shouldReportEventsUrgently;
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t shouldResubscribeAutomatically;
  const char *v36;

  v4 = [MTRSubscribeParams alloc];
  objc_msgSend_minInterval(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_maxInterval(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend_initWithMinInterval_maxInterval_(v4, v11, (uint64_t)v7, v10);

  shouldFilterByFabric = objc_msgSend_shouldFilterByFabric(self, v13, v14);
  objc_msgSend_setFilterByFabric_(v12, v16, shouldFilterByFabric);
  objc_msgSend_minEventNumber(self, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setMinEventNumber_(v12, v20, (uint64_t)v19);

  shouldAssumeUnknownAttributesReportable = objc_msgSend_shouldAssumeUnknownAttributesReportable(self, v21, v22);
  objc_msgSend_setAssumeUnknownAttributesReportable_(v12, v24, shouldAssumeUnknownAttributesReportable);
  shouldReplaceExistingSubscriptions = objc_msgSend_shouldReplaceExistingSubscriptions(self, v25, v26);
  objc_msgSend_setReplaceExistingSubscriptions_(v12, v28, shouldReplaceExistingSubscriptions);
  shouldReportEventsUrgently = objc_msgSend_shouldReportEventsUrgently(self, v29, v30);
  objc_msgSend_setReportEventsUrgently_(v12, v32, shouldReportEventsUrgently);
  shouldResubscribeAutomatically = objc_msgSend_shouldResubscribeAutomatically(self, v33, v34);
  objc_msgSend_setResubscribeAutomatically_(v12, v36, shouldResubscribeAutomatically);
  return v12;
}

- (void)toReadPrepareParams:(void *)a3
{
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MTRSubscribeParams;
  -[MTRReadParams toReadPrepareParams:](&v17, sel_toReadPrepareParams_);
  objc_msgSend_minInterval(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *((_WORD *)a3 + 54) = objc_msgSend_unsignedShortValue(v7, v8, v9);

  objc_msgSend_maxInterval(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  *((_WORD *)a3 + 55) = objc_msgSend_unsignedShortValue(v12, v13, v14);

  *((_BYTE *)a3 + 112) = objc_msgSend_shouldReplaceExistingSubscriptions(self, v15, v16) ^ 1;
}

- (BOOL)shouldReplaceExistingSubscriptions
{
  return self->_replaceExistingSubscriptions;
}

- (void)setReplaceExistingSubscriptions:(BOOL)replaceExistingSubscriptions
{
  self->_replaceExistingSubscriptions = replaceExistingSubscriptions;
}

- (BOOL)shouldResubscribeAutomatically
{
  return self->_resubscribeAutomatically;
}

- (void)setResubscribeAutomatically:(BOOL)resubscribeAutomatically
{
  self->_resubscribeAutomatically = resubscribeAutomatically;
}

- (NSNumber)minInterval
{
  return self->_minInterval;
}

- (void)setMinInterval:(NSNumber *)minInterval
{
  objc_setProperty_nonatomic_copy(self, a2, minInterval, 32);
}

- (NSNumber)maxInterval
{
  return self->_maxInterval;
}

- (void)setMaxInterval:(NSNumber *)maxInterval
{
  objc_setProperty_nonatomic_copy(self, a2, maxInterval, 40);
}

- (BOOL)shouldReportEventsUrgently
{
  return self->_reportEventsUrgently;
}

- (void)setReportEventsUrgently:(BOOL)reportEventsUrgently
{
  self->_reportEventsUrgently = reportEventsUrgently;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxInterval, 0);
  objc_storeStrong((id *)&self->_minInterval, 0);
}

- (MTRSubscribeParams)init
{
  MTRSubscribeParams *v2;
  MTRSubscribeParams *v3;
  NSNumber *minInterval;
  NSNumber *maxInterval;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTRSubscribeParams;
  v2 = -[MTRReadParams init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_replaceExistingSubscriptions = 1;
    v2->_resubscribeAutomatically = 1;
    minInterval = v2->_minInterval;
    v2->_minInterval = (NSNumber *)&unk_250594488;

    maxInterval = v3->_maxInterval;
    v3->_maxInterval = (NSNumber *)&unk_2505944A0;

  }
  return v3;
}

- (void)setKeepPreviousSubscriptions:(NSNumber *)keepPreviousSubscriptions
{
  NSNumber *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  NSNumber *v9;

  v4 = keepPreviousSubscriptions;
  v9 = v4;
  if (v4)
  {
    v7 = objc_msgSend_BOOLValue(v4, v5, v6) ^ 1;
    objc_msgSend_setReplaceExistingSubscriptions_(self, v8, v7);
  }
  else
  {
    objc_msgSend_setReplaceExistingSubscriptions_(self, v5, 1);
  }

}

- (NSNumber)keepPreviousSubscriptions
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  const char *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  v4 = objc_msgSend_shouldReplaceExistingSubscriptions(self, a2, v2) ^ 1;
  return (NSNumber *)objc_msgSend_numberWithBool_(v3, v5, v4);
}

- (void)setAutoResubscribe:(NSNumber *)autoResubscribe
{
  NSNumber *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  NSNumber *v9;

  v4 = autoResubscribe;
  v9 = v4;
  if (v4)
  {
    v7 = objc_msgSend_BOOLValue(v4, v5, v6);
    objc_msgSend_setResubscribeAutomatically_(self, v8, v7);
  }
  else
  {
    objc_msgSend_setResubscribeAutomatically_(self, v5, 1);
  }

}

- (NSNumber)autoResubscribe
{
  uint64_t v2;
  void *v3;
  uint64_t shouldResubscribeAutomatically;
  const char *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  shouldResubscribeAutomatically = objc_msgSend_shouldResubscribeAutomatically(self, a2, v2);
  return (NSNumber *)objc_msgSend_numberWithBool_(v3, v5, shouldResubscribeAutomatically);
}

@end
