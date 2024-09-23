@implementation _AFClockTimerMutation

- (_AFClockTimerMutation)initWithBase:(id)a3
{
  id v5;
  _AFClockTimerMutation *v6;
  _AFClockTimerMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFClockTimerMutation;
  v6 = -[_AFClockTimerMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (id)getTimerID
{
  NSUUID *v2;

  if ((*(_WORD *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_timerID;
  }
  else
  {
    -[AFClockTimer timerID](self->_base, "timerID");
    v2 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setTimerID:(id)a3
{
  objc_storeStrong((id *)&self->_timerID, a3);
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (id)getTimerURL
{
  NSURL *v2;

  if ((*(_WORD *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_timerURL;
  }
  else
  {
    -[AFClockTimer timerURL](self->_base, "timerURL");
    v2 = (NSURL *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setTimerURL:(id)a3
{
  objc_storeStrong((id *)&self->_timerURL, a3);
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (BOOL)getIsFiring
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0)
    return self->_isFiring;
  else
    return -[AFClockTimer isFiring](self->_base, "isFiring");
}

- (void)setIsFiring:(BOOL)a3
{
  self->_isFiring = a3;
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (id)getTitle
{
  NSString *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_title;
  }
  else
  {
    -[AFClockTimer title](self->_base, "title");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (int64_t)getState
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0)
    return self->_state;
  else
    return -[AFClockTimer state](self->_base, "state");
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (double)getDuration
{
  double result;

  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
    return self->_duration;
  -[AFClockTimer duration](self->_base, "duration");
  return result;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (int64_t)getType
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0)
    return self->_type;
  else
    return -[AFClockTimer type](self->_base, "type");
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (double)getFireTimeInterval
{
  double result;

  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0)
    return self->_fireTimeInterval;
  -[AFClockTimer fireTimeInterval](self->_base, "fireTimeInterval");
  return result;
}

- (void)setFireTimeInterval:(double)a3
{
  self->_fireTimeInterval = a3;
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (id)getFireDate
{
  NSDate *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0)
  {
    v2 = self->_fireDate;
  }
  else
  {
    -[AFClockTimer fireDate](self->_base, "fireDate");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setFireDate:(id)a3
{
  objc_storeStrong((id *)&self->_fireDate, a3);
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (id)getFiredDate
{
  NSDate *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0)
  {
    v2 = self->_firedDate;
  }
  else
  {
    -[AFClockTimer firedDate](self->_base, "firedDate");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setFiredDate:(id)a3
{
  objc_storeStrong((id *)&self->_firedDate, a3);
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (id)getDismissedDate
{
  NSDate *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x800) != 0)
  {
    v2 = self->_dismissedDate;
  }
  else
  {
    -[AFClockTimer dismissedDate](self->_base, "dismissedDate");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setDismissedDate:(id)a3
{
  objc_storeStrong((id *)&self->_dismissedDate, a3);
  *(_WORD *)&self->_mutationFlags |= 0x801u;
}

- (id)getLastModifiedDate
{
  NSDate *v2;

  if ((*(_WORD *)&self->_mutationFlags & 0x1000) != 0)
  {
    v2 = self->_lastModifiedDate;
  }
  else
  {
    -[AFClockTimer lastModifiedDate](self->_base, "lastModifiedDate");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setLastModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastModifiedDate, a3);
  *(_WORD *)&self->_mutationFlags |= 0x1001u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_dismissedDate, 0);
  objc_storeStrong((id *)&self->_firedDate, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_timerURL, 0);
  objc_storeStrong((id *)&self->_timerID, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
