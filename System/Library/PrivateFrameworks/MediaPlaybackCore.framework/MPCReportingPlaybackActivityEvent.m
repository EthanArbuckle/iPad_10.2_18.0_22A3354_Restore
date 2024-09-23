@implementation MPCReportingPlaybackActivityEvent

- (NSString)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("YES");
  if (!self->_shouldReportToStore)
    v7 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p shouldReportToStore:%@ playActivityEvent:%@>"), v5, self, v7, self->_playActivityEvent);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (BOOL)isValidReportingEvent
{
  return self->_playActivityEvent != 0;
}

- (unint64_t)reportingEventType
{
  return 2;
}

- (ICPlayActivityEvent)playActivityEvent
{
  return self->_playActivityEvent;
}

- (void)setPlayActivityEvent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)shouldReportToStore
{
  return self->_shouldReportToStore;
}

- (void)setShouldReportToStore:(BOOL)a3
{
  self->_shouldReportToStore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playActivityEvent, 0);
}

@end
