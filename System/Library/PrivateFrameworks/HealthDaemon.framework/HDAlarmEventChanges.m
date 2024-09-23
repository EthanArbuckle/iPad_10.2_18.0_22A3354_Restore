@implementation HDAlarmEventChanges

- (HDAlarmEventChanges)initWithOldEvents:(id)a3 scheduledEvents:(id)a4
{
  id v6;
  id v7;
  HDAlarmEventChanges *v8;
  uint64_t v9;
  NSArray *oldEvents;
  uint64_t v11;
  NSArray *scheduledEvents;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDAlarmEventChanges;
  v8 = -[HDAlarmEventChanges init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    oldEvents = v8->_oldEvents;
    v8->_oldEvents = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    scheduledEvents = v8->_scheduledEvents;
    v8->_scheduledEvents = (NSArray *)v11;

  }
  return v8;
}

- (NSSet)removedEvents
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", self->_oldEvents);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_scheduledEvents);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minusSet:", v4);

  v5 = (void *)objc_msgSend(v3, "copy");
  return (NSSet *)v5;
}

- (NSSet)addedEvents
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", self->_scheduledEvents);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_oldEvents);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minusSet:", v4);

  v5 = (void *)objc_msgSend(v3, "copy");
  return (NSSet *)v5;
}

- (BOOL)isEqual:(id)a3
{
  HDAlarmEventChanges *v4;
  HDAlarmEventChanges *v5;
  NSArray *oldEvents;
  NSArray *v7;
  NSArray *scheduledEvents;
  NSArray *v9;
  char v10;

  v4 = (HDAlarmEventChanges *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      oldEvents = self->_oldEvents;
      v7 = v5->_oldEvents;
      if (oldEvents != v7 && (!v7 || !-[NSArray isEqual:](oldEvents, "isEqual:")))
        goto LABEL_11;
      scheduledEvents = self->_scheduledEvents;
      v9 = v5->_scheduledEvents;
      if (scheduledEvents == v9)
      {
        v10 = 1;
        goto LABEL_13;
      }
      if (v9)
        v10 = -[NSArray isEqual:](scheduledEvents, "isEqual:");
      else
LABEL_11:
        v10 = 0;
LABEL_13:

      goto LABEL_14;
    }
    v10 = 0;
  }
LABEL_14:

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSArray hash](self->_oldEvents, "hash");
  return -[NSArray hash](self->_scheduledEvents, "hash") ^ v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ (%ld old, %ld new) old: %@ new: %@>"), objc_opt_class(), -[NSArray count](self->_oldEvents, "count"), -[NSArray count](self->_scheduledEvents, "count"), self->_oldEvents, self->_scheduledEvents);
}

- (NSArray)oldEvents
{
  return self->_oldEvents;
}

- (NSArray)scheduledEvents
{
  return self->_scheduledEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduledEvents, 0);
  objc_storeStrong((id *)&self->_oldEvents, 0);
}

@end
