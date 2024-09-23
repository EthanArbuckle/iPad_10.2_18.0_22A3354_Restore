@implementation CLSNowPlayingStreamSession

+ (id)playbackStreamSessionDateSortDescriptors
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
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  -[CLSNowPlayingStreamSession localEndDate](self, "localEndDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;
  -[CLSNowPlayingStreamSession localStartDate](self, "localStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = (v5 - v7) / 60.0;

  v9 = (void *)MEMORY[0x1E0CB3940];
  -[CLSNowPlayingStreamSession events](self, "events");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  -[CLSNowPlayingStreamSession localStartDate](self, "localStartDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSNowPlayingStreamSession localEndDate](self, "localEndDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("Session (%p) number of events: %u - (%@ - %@), %f minutes"), self, v11, v12, v13, *(_QWORD *)&v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)debugDescription
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[CLSNowPlayingStreamSession localEndDate](self, "localEndDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;
  -[CLSNowPlayingStreamSession localStartDate](self, "localStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = (v5 - v7) / 60.0;

  v9 = (void *)MEMORY[0x1E0CB3940];
  -[CLSNowPlayingStreamSession events](self, "events");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  -[CLSNowPlayingStreamSession localStartDate](self, "localStartDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSNowPlayingStreamSession localEndDate](self, "localEndDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSNowPlayingStreamSession events](self, "events");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("Session (%p) number of events: %u - (%@ - %@), %f minutes\nevents: %@"), self, v11, v12, v13, *(_QWORD *)&v8, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSDate)localEndDate
{
  return self->_localEndDate;
}

- (NSDate)localStartDate
{
  return self->_localStartDate;
}

- (NSArray)events
{
  return self->_events;
}

- (void)setEvents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_localStartDate, 0);
  objc_storeStrong((id *)&self->_localEndDate, 0);
}

- (CLSNowPlayingStreamSession)initWithEvents:(id)a3
{
  id v4;
  CLSNowPlayingStreamSession *v5;
  NSDate *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSDate *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSArray *events;
  NSDate *localStartDate;
  NSDate *v21;
  NSDate *localEndDate;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CLSNowPlayingStreamSession;
  v5 = -[CLSNowPlayingStreamSession init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v7 = objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v24 = v4;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        v12 = 0;
        v13 = v6;
        v14 = (void *)v7;
        do
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          v15 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v12);
          objc_msgSend(v15, "localStartDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDate earlierDate:](v13, "earlierDate:", v16);
          v6 = (NSDate *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "localEndDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "laterDate:", v17);
          v7 = objc_claimAutoreleasedReturnValue();

          ++v12;
          v13 = v6;
          v14 = (void *)v7;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      }
      while (v10);
    }

    objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_3938);
    v18 = objc_claimAutoreleasedReturnValue();
    events = v5->_events;
    v5->_events = (NSArray *)v18;

    localStartDate = v5->_localStartDate;
    v5->_localStartDate = v6;
    v21 = v6;

    localEndDate = v5->_localEndDate;
    v5->_localEndDate = (NSDate *)v7;

    v4 = v24;
  }

  return v5;
}

- (CLSNowPlayingStreamSession)initWithDataCluster:(id)a3
{
  void *v4;
  CLSNowPlayingStreamSession *v5;

  objc_msgSend(a3, "objects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CLSNowPlayingStreamSession initWithEvents:](self, "initWithEvents:", v4);

  return v5;
}

uint64_t __58__CLSNowPlayingStreamSession_DataCluster__initWithEvents___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "localStartDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

@end
