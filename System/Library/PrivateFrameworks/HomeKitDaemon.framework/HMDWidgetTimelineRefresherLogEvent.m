@implementation HMDWidgetTimelineRefresherLogEvent

- (HMDWidgetTimelineRefresherLogEvent)initWithKind:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDWidgetTimelineRefresherLogEvent *v9;
  uint64_t v10;
  NSString *kind;
  uint64_t v12;
  NSString *reason;
  HMDWidgetTimelineRefresherLogEvent *v15;
  SEL v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    v15 = (HMDWidgetTimelineRefresherLogEvent *)_HMFPreconditionFailure();
    return (HMDWidgetTimelineRefresherLogEvent *)-[HMDWidgetTimelineRefresherLogEvent kind](v15, v16);
  }
  v17.receiver = self;
  v17.super_class = (Class)HMDWidgetTimelineRefresherLogEvent;
  v9 = -[HMMLogEvent init](&v17, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    kind = v9->_kind;
    v9->_kind = (NSString *)v10;

    v12 = objc_msgSend(v8, "copy");
    reason = v9->_reason;
    v9->_reason = (NSString *)v12;

  }
  return v9;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_kind, 0);
}

@end
