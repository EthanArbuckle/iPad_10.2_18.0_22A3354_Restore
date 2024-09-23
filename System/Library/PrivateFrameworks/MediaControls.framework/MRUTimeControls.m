@implementation MRUTimeControls

- (MRUTimeControls)initWithResponseItem:(id)a3
{
  id v4;
  MRUTimeControls *v5;
  uint64_t v6;
  MPCPlayerSeekCommand *seekCommand;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *liveText;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BOOL8 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  double v23;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MRUTimeControls;
  v5 = -[MRUTimeControls init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "seekCommand");
    v6 = objc_claimAutoreleasedReturnValue();
    seekCommand = v5->_seekCommand;
    v5->_seekCommand = (MPCPlayerSeekCommand *)v6;

    -[MPCPlayerSeekCommand changePositionToElapsedInterval:](v5->_seekCommand, "changePositionToElapsedInterval:", 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_scrubbable = v8 != 0;

    if (v4)
    {
      objc_msgSend(v4, "duration");
      v5->_isEnabled = v23 > 0.0;
      objc_msgSend(v4, "duration", v23);
      *(_OWORD *)&v5->_durationSnapshot.snapshotTime = v19;
      *(_OWORD *)&v5->_durationSnapshot.endTime = v20;
      *(_OWORD *)&v5->_durationSnapshot.elapsedDuration = v21;
      *(_QWORD *)&v5->_durationSnapshot.isLiveContent = v22;
      objc_msgSend(v4, "duration");
      v9 = v18;
    }
    else
    {
      v9 = 0;
      v5->_isEnabled = 0;
      *(_QWORD *)&v5->_durationSnapshot.isLiveContent = 0;
      *(_OWORD *)&v5->_durationSnapshot.endTime = 0u;
      *(_OWORD *)&v5->_durationSnapshot.elapsedDuration = 0u;
      *(_OWORD *)&v5->_durationSnapshot.snapshotTime = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0;
    }
    v5->_isLive = v9;
    objc_msgSend(v4, "localizedDurationString", v15, v16, v17, v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      +[MRUStringsProvider scrubberLive](MRUStringsProvider, "scrubberLive");
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    }
    liveText = v5->_liveText;
    v5->_liveText = v12;

  }
  return v5;
}

- (MRUTimeControls)init
{
  return -[MRUTimeControls initWithResponseItem:](self, "initWithResponseItem:", 0);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[MRUTimeControls startTime](self, "startTime");
  v6 = v5;
  -[MRUTimeControls duration](self, "duration");
  v8 = CFSTR("Yes");
  if (self->_scrubbable)
    v9 = CFSTR("Yes");
  else
    v9 = CFSTR("No");
  if (self->_isEnabled)
    v10 = CFSTR("Yes");
  else
    v10 = CFSTR("No");
  if (!self->_isLive)
    v8 = CFSTR("No");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ start: %f | duration: %f | elapsed: %f | scrubbable: %@ | enabled: %@ | live: %@ - %@"), v4, v6, v7, *(_QWORD *)&self->_durationSnapshot.elapsedDuration, v9, v10, v8, self->_liveText);
}

- (BOOL)isEqual:(id)a3
{
  MRUTimeControls *v4;
  MRUTimeControls *v5;
  MRUTimeControls *v6;
  double v7;
  char v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  float v18;
  float v19;
  BOOL v20;
  NSString *v21;
  NSString *v22;
  char v23;
  double v25;
  double v26;
  double v27;

  v4 = (MRUTimeControls *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = v5;
      if (v5)
      {
        -[MRUTimeControls durationSnapshot](v5, "durationSnapshot");
        v7 = v27;
      }
      else
      {
        v7 = 0.0;
      }
      v9 = v7 == self->_durationSnapshot.snapshotTime;
      -[MRUTimeControls startTime](v6, "startTime");
      v11 = v10;
      -[MRUTimeControls startTime](self, "startTime");
      if (v11 != v12)
        v9 = 0;
      -[MRUTimeControls duration](v6, "duration");
      v14 = v13;
      -[MRUTimeControls duration](self, "duration");
      if (v14 != v15)
        v9 = 0;
      if (v6)
      {
        -[MRUTimeControls durationSnapshot](v6, "durationSnapshot");
        v16 = v26;
      }
      else
      {
        v16 = 0.0;
      }
      -[MRUTimeControls durationSnapshot](self, "durationSnapshot");
      if (v16 != v25)
        v9 = 0;
      -[MRUTimeControls rate](v6, "rate");
      v18 = v17;
      -[MRUTimeControls rate](self, "rate");
      if (v18 != v19)
        v9 = 0;
      if (self->_scrubbable != -[MRUTimeControls scrubbable](v6, "scrubbable"))
        v9 = 0;
      if (self->_isEnabled != -[MRUTimeControls isEnabled](v6, "isEnabled"))
        v9 = 0;
      v20 = self->_isLive == -[MRUTimeControls isLive](v6, "isLive") && v9;
      -[MRUTimeControls liveText](v6, "liveText");
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21 == self->_liveText)
        v23 = 1;
      else
        v23 = -[NSString isEqual:](v21, "isEqual:");
      v8 = v20 & v23;

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (double)startTime
{
  double startTime;
  double result;

  startTime = self->_durationSnapshot.startTime;
  -[MRUTimeControls duration](self, "duration");
  if (startTime < result)
    return startTime;
  return result;
}

- (double)elapsedTime
{
  double v3;
  double duration;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  duration = self->_durationSnapshot.elapsedDuration
           + (v3 - self->_durationSnapshot.snapshotTime) * self->_durationSnapshot.rate;
  if (duration >= self->_durationSnapshot.duration)
    duration = self->_durationSnapshot.duration;
  return fmax(duration, 0.0);
}

- (double)duration
{
  return self->_durationSnapshot.duration;
}

- (float)rate
{
  return self->_durationSnapshot.rate;
}

- (void)setElapsedTime:(double)a3
{
  double v5;
  double v6;
  NSObject *v7;
  double v8;
  void *v9;
  __int128 v10;
  double v11;
  _QWORD v12[6];
  __int128 v13;
  _BYTE buf[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[MRUTimeControls duration](self, "duration");
  v6 = v5;
  MCLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2050;
    *(double *)&buf[14] = a3;
    _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ set time to: %{public}f", buf, 0x16u);
  }
  v8 = fmax(a3, 0.0);
  if (v8 < v6)
    v6 = v8;

  -[MPCPlayerSeekCommand changePositionToElapsedInterval:](self->_seekCommand, "changePositionToElapsedInterval:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __34__MRUTimeControls_setElapsedTime___block_invoke;
  v12[3] = &unk_1E58196B0;
  v12[4] = self;
  *(double *)&v12[5] = a3;
  objc_msgSend(MEMORY[0x1E0D4B358], "performRequest:completion:", v9, v12);
  v10 = *(_OWORD *)&self->_durationSnapshot.startTime;
  *(double *)&buf[16] = self->_durationSnapshot.duration;
  v13 = *(_OWORD *)&self->_durationSnapshot.rate;
  *(_OWORD *)buf = v10;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_durationSnapshot.snapshotTime = v11;
  *(_OWORD *)&self->_durationSnapshot.startTime = *(_OWORD *)buf;
  self->_durationSnapshot.duration = *(double *)&buf[16];
  self->_durationSnapshot.elapsedDuration = v6;
  *(_OWORD *)&self->_durationSnapshot.rate = v13;

}

void __34__MRUTimeControls_setElapsedTime___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  MCLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138543874;
    v8 = v5;
    v9 = 2050;
    v10 = v6;
    v11 = 2114;
    v12 = v3;
    _os_log_impl(&dword_1AA991000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ complete set time to: %{public}f | error %{public}@", (uint8_t *)&v7, 0x20u);
  }

}

- (double)elapsedTimeForDate:(id)a3
{
  id v4;
  double v5;
  double duration;
  double v7;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  duration = self->_durationSnapshot.elapsedDuration
           + (v5 - self->_durationSnapshot.snapshotTime) * self->_durationSnapshot.rate;
  if (duration >= self->_durationSnapshot.duration)
    duration = self->_durationSnapshot.duration;
  v7 = fmax(duration, 0.0);

  return v7;
}

- (BOOL)scrubbable
{
  return self->_scrubbable;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (BOOL)isLive
{
  return self->_isLive;
}

- (NSString)liveText
{
  return self->_liveText;
}

- ($04B05C73ED6AEEF31C5815932084562D)durationSnapshot
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var7;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var4;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[1].var1;
  *(double *)&retstr->var7 = self[1].var3;
  return self;
}

- (void)setDurationSnapshot:(id *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&a3->var0;
  v4 = *(_OWORD *)&a3->var2;
  v5 = *(_OWORD *)&a3->var4;
  *(_QWORD *)&self->_durationSnapshot.isLiveContent = *(_QWORD *)&a3->var7;
  *(_OWORD *)&self->_durationSnapshot.endTime = v4;
  *(_OWORD *)&self->_durationSnapshot.elapsedDuration = v5;
  *(_OWORD *)&self->_durationSnapshot.snapshotTime = v3;
}

- (MPCPlayerSeekCommand)seekCommand
{
  return self->_seekCommand;
}

- (void)setSeekCommand:(id)a3
{
  objc_storeStrong((id *)&self->_seekCommand, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seekCommand, 0);
  objc_storeStrong((id *)&self->_liveText, 0);
}

@end
