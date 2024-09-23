@implementation EKInviteeAlternativeTime

- (EKInviteeAlternativeTime)initWithStartDate:(id)a3 endDate:(id)a4 conflictedParticipants:(id)a5
{
  id v8;
  id v9;
  id v10;
  EKInviteeAlternativeTime *v11;
  EKInviteeAlternativeTime *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)EKInviteeAlternativeTime;
  v11 = -[EKInviteeAlternativeTime init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[EKInviteeAlternativeTime setStartDate:](v11, "setStartDate:", v8);
    -[EKInviteeAlternativeTime setEndDate:](v12, "setEndDate:", v9);
    -[EKInviteeAlternativeTime setConflictedParticipants:](v12, "setConflictedParticipants:", v10);
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v16.receiver = self;
  v16.super_class = (Class)EKInviteeAlternativeTime;
  -[EKInviteeAlternativeTime description](&v16, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKInviteeAlternativeTime startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKInviteeAlternativeTime endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[EKInviteeAlternativeTime endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKInviteeAlternativeTime startDate](self, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v9);
  objc_msgSend(v7, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[EKInviteeAlternativeTime conflictedParticipants](self, "conflictedParticipants");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] startDate: [%@] endDate: [%@] duration: [%@ seconds] conflictedParticipants count: [%@]"), v4, v5, v6, v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (NSArray)conflictedParticipants
{
  return self->_conflictedParticipants;
}

- (void)setConflictedParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_conflictedParticipants, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conflictedParticipants, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
