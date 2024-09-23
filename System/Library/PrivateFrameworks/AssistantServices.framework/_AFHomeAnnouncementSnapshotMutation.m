@implementation _AFHomeAnnouncementSnapshotMutation

- (_AFHomeAnnouncementSnapshotMutation)initWithBase:(id)a3
{
  id v5;
  _AFHomeAnnouncementSnapshotMutation *v6;
  _AFHomeAnnouncementSnapshotMutation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_AFHomeAnnouncementSnapshotMutation;
  v6 = -[_AFHomeAnnouncementSnapshotMutation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_base, a3);

  return v7;
}

- (BOOL)isDirty
{
  return *(_BYTE *)&self->_mutationFlags & 1;
}

- (unint64_t)getState
{
  if ((*(_BYTE *)&self->_mutationFlags & 2) != 0)
    return self->_state;
  else
    return -[AFHomeAnnouncementSnapshot state](self->_base, "state");
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
  *(_BYTE *)&self->_mutationFlags |= 3u;
}

- (id)getLastPlayedAnnouncement
{
  AFHomeAnnouncement *v2;

  if ((*(_BYTE *)&self->_mutationFlags & 4) != 0)
  {
    v2 = self->_lastPlayedAnnouncement;
  }
  else
  {
    -[AFHomeAnnouncementSnapshot lastPlayedAnnouncement](self->_base, "lastPlayedAnnouncement");
    v2 = (AFHomeAnnouncement *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (void)setLastPlayedAnnouncement:(id)a3
{
  objc_storeStrong((id *)&self->_lastPlayedAnnouncement, a3);
  *(_BYTE *)&self->_mutationFlags |= 5u;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPlayedAnnouncement, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

@end
