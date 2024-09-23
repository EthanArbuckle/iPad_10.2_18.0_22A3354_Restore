@implementation _AFHomeAnnouncementMutation

- (_AFHomeAnnouncementMutation)initWithBase:(id)a3
{
  id v5;
  _AFHomeAnnouncementMutation *v6;
  _AFHomeAnnouncementMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFHomeAnnouncementMutation;
  v6 = -[_AFHomeAnnouncementMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (id)getIdentifier
{
  NSString *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
  {
    v2 = self->_identifier;
  }
  else
  {
    -[AFHomeAnnouncement identifier](self->_base, "identifier");
    v2 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (unint64_t)getStartedHostTime
{
  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
    return self->_startedHostTime;
  else
    return -[AFHomeAnnouncement startedHostTime](self->_base, "startedHostTime");
}

- (void)setStartedHostTime:(unint64_t)a3
{
  self->_startedHostTime = a3;
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (unint64_t)getFinishedHostTime
{
  if ((*(_BYTE *)&self->_mutationFlags & 8) != 0)
    return self->_finishedHostTime;
  else
    return -[AFHomeAnnouncement finishedHostTime](self->_base, "finishedHostTime");
}

- (void)setFinishedHostTime:(unint64_t)a3
{
  self->_finishedHostTime = a3;
  *(_BYTE *)&self->_mutationFlags |= 9u;
}

- (id)getStartedDate
{
  NSDate *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x10) != 0)
  {
    v2 = self->_startedDate;
  }
  else
  {
    -[AFHomeAnnouncement startedDate](self->_base, "startedDate");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setStartedDate:(id)a3
{
  objc_storeStrong((id *)&self->_startedDate, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x11u;
}

- (id)getFinishedDate
{
  NSDate *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 0x20) != 0)
  {
    v2 = self->_finishedDate;
  }
  else
  {
    -[AFHomeAnnouncement finishedDate](self->_base, "finishedDate");
    v2 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setFinishedDate:(id)a3
{
  objc_storeStrong((id *)&self->_finishedDate, a3);
  *(_BYTE *)&self->_mutationFlags |= 0x21u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedDate, 0);
  objc_storeStrong((id *)&self->_startedDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
