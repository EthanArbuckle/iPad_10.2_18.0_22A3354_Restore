@implementation EKInviteeTimeSpan

- (EKInviteeTimeSpan)init
{
  EKInviteeTimeSpan *v2;
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKInviteeTimeSpan;
  v2 = -[EKInviteeTimeSpan init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[EKInviteeTimeSpan setConflictedParticipants:](v2, "setConflictedParticipants:", v3);

  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[EKInviteeTimeSpan startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setStartDate:", v6);

  -[EKInviteeTimeSpan endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setEndDate:", v8);

  -[EKInviteeTimeSpan conflictedParticipants](self, "conflictedParticipants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setConflictedParticipants:", v10);

  return v4;
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
  v16.super_class = (Class)EKInviteeTimeSpan;
  -[EKInviteeTimeSpan description](&v16, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKInviteeTimeSpan startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKInviteeTimeSpan endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[EKInviteeTimeSpan endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKInviteeTimeSpan startDate](self, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v9);
  objc_msgSend(v7, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[EKInviteeTimeSpan conflictedParticipants](self, "conflictedParticipants");
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

- (NSMutableArray)conflictedParticipants
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
