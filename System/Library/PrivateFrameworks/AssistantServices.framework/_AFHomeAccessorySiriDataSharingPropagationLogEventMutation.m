@implementation _AFHomeAccessorySiriDataSharingPropagationLogEventMutation

- (_AFHomeAccessorySiriDataSharingPropagationLogEventMutation)initWithBase:(id)a3
{
  id v5;
  _AFHomeAccessorySiriDataSharingPropagationLogEventMutation *v6;
  _AFHomeAccessorySiriDataSharingPropagationLogEventMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFHomeAccessorySiriDataSharingPropagationLogEventMutation;
  v6 = -[_AFHomeAccessorySiriDataSharingPropagationLogEventMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getDate
{
  NSDate *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_date;
  }
  else
  {
    -[AFHomeAccessorySiriDataSharingPropagationLogEvent date](self->_base, "date");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getAccessoryIdentifier
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_accessoryIdentifier;
  }
  else
  {
    -[AFHomeAccessorySiriDataSharingPropagationLogEvent accessoryIdentifier](self->_base, "accessoryIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setAccessoryIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryIdentifier, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (int64_t)getPropagationEvent
{
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
    return self->_propagationEvent;
  else
    return -[AFHomeAccessorySiriDataSharingPropagationLogEvent propagationEvent](self->_base, "propagationEvent");
}

- (void)setPropagationEvent:(int64_t)a3
{
  self->_propagationEvent = a3;
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (id)getPropagationEventReason
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_propagationEventReason;
  }
  else
  {
    -[AFHomeAccessorySiriDataSharingPropagationLogEvent propagationEventReason](self->_base, "propagationEventReason");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setPropagationEventReason:(id)a3
{
  objc_storeStrong((id *)&self->_propagationEventReason, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (id)getAssociatedChangeLogEventIdentifier
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_associatedChangeLogEventIdentifier;
  }
  else
  {
    -[AFHomeAccessorySiriDataSharingPropagationLogEvent associatedChangeLogEventIdentifier](self->_base, "associatedChangeLogEventIdentifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setAssociatedChangeLogEventIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_associatedChangeLogEventIdentifier, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedChangeLogEventIdentifier, 0);
  objc_storeStrong((id *)&self->_propagationEventReason, 0);
  objc_storeStrong((id *)&self->_accessoryIdentifier, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
