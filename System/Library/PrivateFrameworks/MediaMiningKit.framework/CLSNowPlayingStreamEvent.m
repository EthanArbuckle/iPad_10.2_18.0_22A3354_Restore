@implementation CLSNowPlayingStreamEvent

+ (id)playbackStreamEventDateSortDescriptors
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("localStartDate"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("localEndDate"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc(MEMORY[0x1E0CB3588]);
  -[CLSNowPlayingStreamEvent localStartDate](self, "localStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSNowPlayingStreamEvent localEndDate](self, "localEndDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", v4, v5);

  objc_msgSend(v6, "duration");
  v7 = (void *)MEMORY[0x1E0CB3940];
  v9 = v8 / 60.0;
  -[CLSNowPlayingStreamEvent metadata](self, "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSNowPlayingStreamEvent localStartDate](self, "localStartDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSNowPlayingStreamEvent localEndDate](self, "localEndDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("(%p) metadata: %@, (%@ - %@), duration: %f minutes"), self, v10, v11, v12, *(_QWORD *)&v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSDate)localStartDate
{
  return self->_localStartDate;
}

- (NSDate)localEndDate
{
  return self->_localEndDate;
}

- (CLSNowPlayingStreamEventMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_localEndDate, 0);
  objc_storeStrong((id *)&self->_localStartDate, 0);
}

- (CLSNowPlayingStreamEvent)initWithDuetKnowledgeEvent:(id)a3
{
  id v4;
  CLSNowPlayingStreamEvent *v5;
  CLSNowPlayingStreamEventMetadata *v6;
  CLSNowPlayingStreamEventMetadata *metadata;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDate *localStartDate;
  uint64_t v13;
  NSDate *localEndDate;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CLSNowPlayingStreamEvent;
  v5 = -[CLSNowPlayingStreamEvent init](&v16, sel_init);
  if (v5)
  {
    v6 = -[CLSNowPlayingStreamEventMetadata initWithDuetKnowledgeEvent:]([CLSNowPlayingStreamEventMetadata alloc], "initWithDuetKnowledgeEvent:", v4);
    metadata = v5->_metadata;
    v5->_metadata = v6;

    objc_msgSend(v4, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeZone");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CLSCalendar localDateFromUniversalDate:inTimeZone:](CLSCalendar, "localDateFromUniversalDate:inTimeZone:", v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    localStartDate = v5->_localStartDate;
    v5->_localStartDate = (NSDate *)v11;

    +[CLSCalendar localDateFromUniversalDate:inTimeZone:](CLSCalendar, "localDateFromUniversalDate:inTimeZone:", v9, v10);
    v13 = objc_claimAutoreleasedReturnValue();
    localEndDate = v5->_localEndDate;
    v5->_localEndDate = (NSDate *)v13;

  }
  return v5;
}

@end
