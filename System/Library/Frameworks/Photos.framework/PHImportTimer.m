@implementation PHImportTimer

- (PHImportTimer)initWithType:(unsigned __int8)a3 subtype:(unsigned __int8)a4
{
  PHImportTimer *v7;
  PHImportTimer *v8;

  if (initWithType_subtype__onceToken != -1)
    dispatch_once(&initWithType_subtype__onceToken, &__block_literal_global_33244);
  v7 = -[PHImportTimer init](self, "init");
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v7->_subtype = a4;
    v7->_signpostId = os_signpost_id_make_with_pointer((os_log_t)importPerfLog, v7);
  }
  return v8;
}

- (void)start
{
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t signpostId;
  uint64_t type;
  uint64_t subtype;
  NSDate *v9;
  NSDate *startTime;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_startTime)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHImportTimer.m"), 156, CFSTR("Trying to start a timer that is already running."));

  }
  else
  {
    v4 = (id)importPerfLog;
    v5 = v4;
    signpostId = self->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      type = self->_type;
      subtype = self->_subtype;
      *(_DWORD *)buf = 134218240;
      v13 = type;
      v14 = 2048;
      v15 = subtype;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v5, OS_SIGNPOST_INTERVAL_BEGIN, signpostId, "PHImportTimer", "%lu-%lu", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    startTime = self->_startTime;
    self->_startTime = v9;

  }
}

- (void)stop
{
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t signpostId;
  uint64_t type;
  uint64_t subtype;
  NSDate *v9;
  NSDate *endTime;
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_startTime && !self->_endTime)
  {
    v4 = (id)importPerfLog;
    v5 = v4;
    signpostId = self->_signpostId;
    if (signpostId - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      type = self->_type;
      subtype = self->_subtype;
      *(_DWORD *)buf = 134218240;
      v13 = type;
      v14 = 2048;
      v15 = subtype;
      _os_signpost_emit_with_name_impl(&dword_1991EC000, v5, OS_SIGNPOST_INTERVAL_END, signpostId, "PHImportTimer", "%lu-%lu", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
    endTime = self->_endTime;
    self->_endTime = v9;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHImportTimer.m"), 166, CFSTR("Trying to stop a timer that is either not running or already done running."));

  }
}

- (double)duration
{
  double result;

  -[NSDate timeIntervalSinceDate:](self->_endTime, "timeIntervalSinceDate:", self->_startTime);
  return result;
}

- (id)description
{
  void *v3;
  id uuid;
  void *v5;
  uint64_t subtype;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  uuid = self->_uuid;
  objc_msgSend((id)importTypeNames, "objectAtIndexedSubscript:", self->_type);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  subtype = self->_subtype;
  -[PHImportTimer duration](self, "duration");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("uuid: %@, type: %@, sub type: %hhu, duration: %fl"), uuid, v5, subtype, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)uuid
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setUuid:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDate)startTime
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStartTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDate)endTime
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEndTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned __int8)a3
{
  self->_type = a3;
}

- (unsigned)subtype
{
  return self->_subtype;
}

- (void)setSubtype:(unsigned __int8)a3
{
  self->_subtype = a3;
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (void)setSignpostId:(unint64_t)a3
{
  self->_signpostId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong(&self->_uuid, 0);
}

void __38__PHImportTimer_initWithType_subtype___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  os_log_t v3;
  void *v4;

  v0 = (void *)importTypeNames;
  importTypeNames = (uint64_t)&unk_1E36574B0;

  v1 = (void *)mediaTypeNames;
  mediaTypeNames = (uint64_t)&unk_1E36574C8;

  v2 = (void *)aspectRatioNames;
  aspectRatioNames = (uint64_t)&unk_1E36574E0;

  v3 = os_log_create("com.apple.Photos.Import", "PointsOfInterest");
  v4 = (void *)importPerfLog;
  importPerfLog = (uint64_t)v3;

}

@end
