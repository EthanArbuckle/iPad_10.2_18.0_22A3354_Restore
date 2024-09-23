@implementation CAMNebulaSecondaryState

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CAMNebulaSecondaryState)initWithCoder:(id)a3
{
  id v4;
  CAMNebulaSecondaryState *v5;
  uint64_t v6;
  uint64_t v7;
  NSDate *stopTime;
  uint64_t v9;
  NSDate *lastMovieWriteAttemptTime;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAMNebulaSecondaryState;
  v5 = -[CAMNebulaSecondaryState init](&v12, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("stopReasons")))
      v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("stopReasons"));
    else
      v6 = 0;
    v5->_stopReasons = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stopTime"));
    v7 = objc_claimAutoreleasedReturnValue();
    stopTime = v5->_stopTime;
    v5->_stopTime = (NSDate *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastMovieWriteAttemptTime"));
    v9 = objc_claimAutoreleasedReturnValue();
    lastMovieWriteAttemptTime = v5->_lastMovieWriteAttemptTime;
    v5->_lastMovieWriteAttemptTime = (NSDate *)v9;

    v5->_movieWriteAttemptsCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("movieWriteAttemptsCount"));
    v5->_failedStateReadAttemptsCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("failedStateReadAttemptsCount"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t stopReasons;
  id v5;

  stopReasons = self->_stopReasons;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", stopReasons, CFSTR("stopReasons"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stopTime, CFSTR("stopTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastMovieWriteAttemptTime, CFSTR("lastMovieWriteAttemptTime"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_movieWriteAttemptsCount, CFSTR("movieWriteAttemptsCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_failedStateReadAttemptsCount, CFSTR("failedStateReadAttemptsCount"));

}

- (id)description
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)CAMNebulaSecondaryState;
  -[CAMNebulaSecondaryState description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAMNebulaSecondaryState stopReasons](self, "stopReasons");
  -[CAMNebulaSecondaryState stopTime](self, "stopTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: stopReasons=%ld stopTime=%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)addStopReasons:(int64_t)a3 stopTime:(id)a4
{
  id v6;
  int64_t v7;
  BOOL v8;
  BOOL v9;
  uint64_t v10;
  void *v11;

  v6 = a4;
  v7 = -[CAMNebulaSecondaryState stopReasons](self, "stopReasons");
  v8 = (v7 | a3) == v7;
  v9 = (v7 | a3) != v7;
  if (!v8)
    -[CAMNebulaSecondaryState setStopReasons:](self, "setStopReasons:");
  -[CAMNebulaSecondaryState stopTime](self, "stopTime");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v6 && !v10)
  {
    -[CAMNebulaSecondaryState setStopTime:](self, "setStopTime:", v6);
    v9 = 1;
  }

  return v9;
}

- (void)notifyWillAttemptToWriteMovie
{
  NSDate *v3;
  NSDate *lastMovieWriteAttemptTime;

  ++self->_movieWriteAttemptsCount;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastMovieWriteAttemptTime = self->_lastMovieWriteAttemptTime;
  self->_lastMovieWriteAttemptTime = v3;

}

- (BOOL)writeToFile:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v23 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v23);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v23;
    if (v6)
    {
      v7 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CAMNebulaSecondaryState writeToFile:].cold.2((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    }
    v14 = objc_msgSend(v5, "writeToFile:atomically:", v4, 1);
    if ((v14 & 1) == 0)
    {
      v15 = os_log_create("com.apple.camera", "Nebula");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[CAMNebulaSecondaryState writeToFile:].cold.1((uint64_t)v4, v15, v16, v17, v18, v19, v20, v21);

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)secondaryStateWithContentsOfFile:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v15 = 0;
      objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v15);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v15;
      if (v6)
      {
        v7 = os_log_create("com.apple.camera", "Nebula");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          +[CAMNebulaSecondaryState secondaryStateWithContentsOfFile:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

      }
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSDate)stopTime
{
  return self->_stopTime;
}

- (void)setStopTime:(id)a3
{
  objc_storeStrong((id *)&self->_stopTime, a3);
}

- (int64_t)stopReasons
{
  return self->_stopReasons;
}

- (void)setStopReasons:(int64_t)a3
{
  self->_stopReasons = a3;
}

- (NSDate)lastMovieWriteAttemptTime
{
  return self->_lastMovieWriteAttemptTime;
}

- (int64_t)movieWriteAttemptsCount
{
  return self->_movieWriteAttemptsCount;
}

- (int64_t)failedStateReadAttemptsCount
{
  return self->_failedStateReadAttemptsCount;
}

- (void)setFailedStateReadAttemptsCount:(int64_t)a3
{
  self->_failedStateReadAttemptsCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastMovieWriteAttemptTime, 0);
  objc_storeStrong((id *)&self->_stopTime, 0);
}

- (void)writeToFile:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, a2, a3, "Error: failed to save secondary state to file %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)writeToFile:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, a2, a3, "Error: failed to archive secondary state: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)secondaryStateWithContentsOfFile:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1DB760000, a2, a3, "Error: failed to unarchive secondary state: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
