@implementation _AFClockTimerSnapshotMutation

- (_AFClockTimerSnapshotMutation)initWithBase:(id)a3
{
  id v5;
  _AFClockTimerSnapshotMutation *v6;
  _AFClockTimerSnapshotMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFClockTimerSnapshotMutation;
  v6 = -[_AFClockTimerSnapshotMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (unint64_t)getGeneration
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_generation;
  else
    return -[AFClockTimerSnapshot generation](self->_base, "generation");
}

- (void)setGeneration:(unint64_t)a3
{
  self->_generation = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getDate
{
  NSDate *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_date;
  }
  else
  {
    -[AFClockTimerSnapshot date](self->_base, "date");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (id)getTimersByID
{
  NSDictionary *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
  {
    v2 = self->_timersByID;
  }
  else
  {
    -[AFClockTimerSnapshot timersByID](self->_base, "timersByID");
    v2 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setTimersByID:(id)a3
{
  objc_storeStrong((id *)&self->_timersByID, a3);
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (id)getNotifiedFiringTimerIDs
{
  NSOrderedSet *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_notifiedFiringTimerIDs;
  }
  else
  {
    -[AFClockTimerSnapshot notifiedFiringTimerIDs](self->_base, "notifiedFiringTimerIDs");
    v2 = (NSOrderedSet *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setNotifiedFiringTimerIDs:(id)a3
{
  objc_storeStrong((id *)&self->_notifiedFiringTimerIDs, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifiedFiringTimerIDs, 0);
  objc_storeStrong((id *)&self->_timersByID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
