@implementation HMDUserActivityStateType6DetectorTransitionLogEvent

- (HMDUserActivityStateType6DetectorTransitionLogEvent)initWithTrackerType:(unint64_t)a3 reason:(unint64_t)a4
{
  return -[HMDUserActivityStateType6DetectorTransitionLogEvent initWithTrackerType:reason:stateEndOffset:](self, "initWithTrackerType:reason:stateEndOffset:", a3, a4, 0);
}

- (HMDUserActivityStateType6DetectorTransitionLogEvent)initWithTrackerType:(unint64_t)a3 reason:(unint64_t)a4 stateEndOffset:(int64_t)a5
{
  HMDUserActivityStateType6DetectorTransitionLogEvent *v8;
  HMDUserActivityStateType6DetectorTransitionLogEvent *v9;
  const __CFString *v10;
  const __CFString *v11;
  uint64_t v12;
  NSString *eventString;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HMDUserActivityStateType6DetectorTransitionLogEvent;
  v8 = -[HMMLogEvent init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_trackerType = a3;
    v8->_reason = a4;
    v8->_stateEndOffset = a5;
    v10 = CFSTR("Unknown");
    if (a3 == 2)
      v10 = CFSTR("CoreLocation");
    if (a3 == 1)
      v10 = CFSTR("None");
    if (a4 - 1 > 9)
      v11 = CFSTR("Other");
    else
      v11 = off_24E778F28[a4 - 1];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    eventString = v9->_eventString;
    v9->_eventString = (NSString *)v12;

  }
  return v9;
}

- (unint64_t)trackerType
{
  return self->_trackerType;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (int64_t)stateEndOffset
{
  return self->_stateEndOffset;
}

- (NSString)eventString
{
  return self->_eventString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventString, 0);
}

@end
