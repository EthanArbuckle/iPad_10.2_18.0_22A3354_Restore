@implementation MNAnnouncementConflict

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (-[MNAnnouncementConflict announcementsAreSimilar](self, "announcementsAreSimilar"))
    v4 = "similar";
  else
    v4 = "dissimilar";
  -[MNAnnouncementConflict timeGap](self, "timeGap");
  v6 = v5;
  -[MNAnnouncementConflict desiredTimeGap](self, "desiredTimeGap");
  v8 = v7;
  -[MNAnnouncementConflict firstEvent](self, "firstEvent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "event");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MNAnnouncementConflict secondEvent](self, "secondEvent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "event");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%s announcements, time %.1f < %.1f\n  first %@\n  second %@"), v4, v6, v8, v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (MNAnnouncementPlanEvent)firstEvent
{
  return self->_firstEvent;
}

- (void)setFirstEvent:(id)a3
{
  objc_storeStrong((id *)&self->_firstEvent, a3);
}

- (MNAnnouncementPlanEvent)secondEvent
{
  return self->_secondEvent;
}

- (void)setSecondEvent:(id)a3
{
  objc_storeStrong((id *)&self->_secondEvent, a3);
}

- (double)timeGap
{
  return self->_timeGap;
}

- (void)setTimeGap:(double)a3
{
  self->_timeGap = a3;
}

- (double)desiredTimeGap
{
  return self->_desiredTimeGap;
}

- (void)setDesiredTimeGap:(double)a3
{
  self->_desiredTimeGap = a3;
}

- (BOOL)announcementsAreSimilar
{
  return self->_announcementsAreSimilar;
}

- (void)setAnnouncementsAreSimilar:(BOOL)a3
{
  self->_announcementsAreSimilar = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondEvent, 0);
  objc_storeStrong((id *)&self->_firstEvent, 0);
}

@end
