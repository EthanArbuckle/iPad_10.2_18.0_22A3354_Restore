@implementation SHSyncedLyrics

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHSyncedLyrics)initWithLyricsStartDate:(id)a3 lines:(id)a4 songwriters:(id)a5
{
  id v9;
  id v10;
  id v11;
  SHSyncedLyrics *v12;
  SHSyncedLyrics *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SHSyncedLyrics;
  v12 = -[SHSyncedLyrics init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_lyricsStartDate, a3);
    objc_storeStrong((id *)&v13->_songwriters, a5);
    objc_storeStrong((id *)&v13->_lines, a4);
    v13->_timeWarp = 1.0;
  }

  return v13;
}

- (SHSyncedLyrics)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  SHSyncedLyrics *v18;
  SHSyncedLyrics *v19;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v22[0] = objc_opt_class();
  v22[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("lines"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDBCF20];
  v21[0] = objc_opt_class();
  v21[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v11, CFSTR("songwriters"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("preCueDuration"));
  v15 = v14;
  objc_msgSend(v5, "decodeDoubleForKey:", CFSTR("timeWarp"));
  v17 = v16;

  v18 = -[SHSyncedLyrics initWithLyricsStartDate:lines:songwriters:](self, "initWithLyricsStartDate:lines:songwriters:", v13, v8, v12);
  v19 = v18;
  if (v18)
  {
    v18->_preCueDuration = v15;
    v18->_timeWarp = v17;
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *lines;
  id v5;

  lines = self->_lines;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", lines, CFSTR("lines"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_songwriters, CFSTR("songwriters"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lyricsStartDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("preCueDuration"), self->_preCueDuration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("timeWarp"), self->_timeWarp);

}

- (SHSyncedLyricsDelegate)delegate
{
  return (SHSyncedLyricsDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  id v4;

  v4 = objc_storeWeak((id *)&self->_delegate, a3);
  if (a3)
    -[SHSyncedLyrics startSyncing](self, "startSyncing");
  else
    -[SHSyncedLyrics stopSyncing](self, "stopSyncing");

}

- (void)startSyncing
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  unint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  -[SHSyncedLyrics stopSyncing](self, "stopSyncing");
  -[SHSyncedLyrics lines](self, "lines");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[SHSyncedLyrics offsetFromStartDate](self, "offsetFromStartDate");
    v6 = v5;
    -[SHSyncedLyrics currentLyricLineForOffset:](self, "currentLyricLineForOffset:");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    -[SHSyncedLyrics lines](self, "lines");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "indexOfObject:", v23);

    v9 = v23;
    if (v23)
    {
      -[SHSyncedLyrics delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_opt_respondsToSelector();

      v9 = v23;
      if ((v11 & 1) != 0)
      {
        -[SHSyncedLyrics delegate](self, "delegate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lyricsDidUpdateToLine:atLineNumber:", v23, v8);

        v9 = v23;
      }
    }
    if (v9)
      v13 = v8 + 1;
    else
      v13 = 0;
    -[SHSyncedLyrics lines](self, "lines");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15 > v13)
    {
      -[SHSyncedLyrics lines](self, "lines");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectAtIndexedSubscript:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSyncedLyrics timeToLine:afterDuration:](self, "timeToLine:afterDuration:", v17, v6);
      v19 = v18;

      objc_msgSend(MEMORY[0x24BDBCF40], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_startSyncing, 0, 0, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSyncedLyrics setTimer:](self, "setTimer:", v20);

      objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SHSyncedLyrics timer](self, "timer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addTimer:forMode:", v22, *MEMORY[0x24BDBCB80]);

    }
  }
}

- (double)offsetFromStartDate
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SHSyncedLyrics lyricsStartDate](self, "lyricsStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

- (double)timeToLine:(id)a3 afterDuration:(double)a4
{
  double v5;

  -[SHSyncedLyrics fireTimeForLine:](self, "fireTimeForLine:", a3);
  return v5 - a4;
}

- (double)fireTimeForLine:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(a3, "offset");
  v5 = v4;
  -[SHSyncedLyrics preCueDuration](self, "preCueDuration");
  v7 = v5 - v6;
  -[SHSyncedLyrics timeWarp](self, "timeWarp");
  return v7 * (1.0 / v8);
}

- (double)preCueDuration
{
  return self->_preCueDuration;
}

- (void)setPreCueDuration:(double)a3
{
  if (a3 < 0.0)
    a3 = 0.0;
  self->_preCueDuration = a3;
}

- (double)timeWarp
{
  return self->_timeWarp;
}

- (void)setTimeWarp:(double)a3
{
  if (a3 > 0.0)
    self->_timeWarp = a3;
}

- (void)stopSyncing
{
  void *v3;

  -[SHSyncedLyrics timer](self, "timer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[SHSyncedLyrics setTimer:](self, "setTimer:", 0);
}

- (id)currentLyricLineForOffset:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SHSyncedLyrics lines](self, "lines", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      v10 = 0;
      v11 = v8;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        -[SHSyncedLyrics fireTimeForLine:](self, "fireTimeForLine:", v12);
        if (v13 > a3)
        {
          v8 = v11;
          goto LABEL_12;
        }
        v8 = v12;

        ++v10;
        v11 = v8;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_12:

  return v8;
}

- (NSArray)lines
{
  return self->_lines;
}

- (void)setLines:(id)a3
{
  objc_storeStrong((id *)&self->_lines, a3);
}

- (NSArray)songwriters
{
  return self->_songwriters;
}

- (void)setSongwriters:(id)a3
{
  objc_storeStrong((id *)&self->_songwriters, a3);
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (NSDate)lyricsStartDate
{
  return self->_lyricsStartDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lyricsStartDate, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_songwriters, 0);
  objc_storeStrong((id *)&self->_lines, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
