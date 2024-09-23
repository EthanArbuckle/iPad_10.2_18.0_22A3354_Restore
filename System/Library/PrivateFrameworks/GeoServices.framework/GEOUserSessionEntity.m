@implementation GEOUserSessionEntity

- (double)sessionRelativeTimestampForEventTime:(double)a3
{
  return a3 - self->_sessionCreationTime;
}

- (GEOUserSessionEntity)initWithSessionID:(GEOSessionID)a3 sessionCreationTime:(double)a4 sequenceNumber:(unsigned int)a5
{
  unint64_t low;
  unint64_t high;
  GEOUserSessionEntity *v9;
  GEOUserSessionEntity *v10;
  void *v11;
  _QWORD v13[4];
  GEOUserSessionEntity *v14;

  low = a3._low;
  high = a3._high;
  v9 = -[GEOUserSessionEntity init](self, "init");
  v10 = v9;
  if (v9)
  {
    v9->_sessionID._high = high;
    v9->_sessionID._low = low;
    v9->_sessionCreationTime = a4;
    v9->_sequenceNumber = a5;
    +[GEOReferenceTimeManager sharedManager](GEOReferenceTimeManager, "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __77__GEOUserSessionEntity_initWithSessionID_sessionCreationTime_sequenceNumber___block_invoke;
    v13[3] = &unk_1E1C04468;
    v14 = v10;
    objc_msgSend(v11, "referenceTimeResult:", v13);

  }
  return v10;
}

double __77__GEOUserSessionEntity_initWithSessionID_sessionCreationTime_sequenceNumber___block_invoke(uint64_t a1, double a2)
{
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(a1 + 32);
  result = a2 - *(double *)(v2 + 32);
  *(double *)(v2 + 40) = result;
  return result;
}

- (GEOUserSessionEntity)initWithSessionEntityString:(id)a3
{
  id v4;
  GEOUserSessionEntity *v5;
  GEOUserSessionEntity *v6;

  v4 = a3;
  v5 = -[GEOUserSessionEntity init](self, "init");
  v6 = v5;
  if (v5)
    -[GEOUserSessionEntity updateWithSessionEntityString:](v5, "updateWithSessionEntityString:", v4);

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GEOUserSessionEntity sessionIDHighString](self, "sessionIDHighString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOUserSessionEntity sessionIDLowString](self, "sessionIDLowString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SessionID high:%@ low:%@ CreationTime=%f SequenceNumber=%d"), v4, v5, *(_QWORD *)&self->_sessionCreationTime, self->_sequenceNumber);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)sessionEntityString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GEOUserSessionEntity sessionIDHighString](self, "sessionIDHighString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOUserSessionEntity sessionIDLowString](self, "sessionIDLowString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("user_session_entity=%@,%@,%f,%u"), v4, v5, *(_QWORD *)&self->_sessionCreationTime, self->_sequenceNumber);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)sessionIDString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GEOUserSessionEntity sessionIDHighString](self, "sessionIDHighString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOUserSessionEntity sessionIDLowString](self, "sessionIDLowString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)sessionUUIDString
{
  unint64_t v3;
  unint64_t v4;
  const __CFUUID *v5;
  __CFString *v6;
  NSObject *v7;
  int v9;
  GEOUserSessionEntity *v10;
  __int16 v11;
  __CFString *v12;
  uint64_t v13;
  CFUUIDBytes v14;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = -[GEOUserSessionEntity sessionID](self, "sessionID");
  *(_QWORD *)&v14.byte8 = bswap64(v4);
  *(_QWORD *)&v14.byte0 = bswap64(v3);
  v5 = CFUUIDCreateFromUUIDBytes(0, v14);
  v6 = (__CFString *)CFUUIDCreateString(0, v5);
  CFRelease(v5);
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOUserSession");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138478083;
    v10 = self;
    v11 = 2113;
    v12 = v6;
    _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "uuidString returned for %{private}@ is: %{private}@", (uint8_t *)&v9, 0x16u);
  }

  return (NSString *)v6;
}

- (NSNumber)sessionIDLow
{
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_sessionID._low);
}

- (NSNumber)sessionIDHigh
{
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_sessionID._high);
}

- (NSString)sessionIDLowString
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0*llu"), 20, self->_sessionID._low);
}

- (NSString)sessionIDHighString
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0*llu"), 20, self->_sessionID._high);
}

- (BOOL)_isValidSessionIDHighOrLowString:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  BOOL v7;

  v3 = a3;
  if (objc_msgSend(v3, "length") == 20
    && (v4 = objc_msgSend(objc_retainAutorelease(v3), "cStringUsingEncoding:", 1)) != 0)
  {
    v5 = 0;
    do
    {
      v6 = *(unsigned __int8 *)(v4 + v5) - 48;
      v7 = v6 < 0xA;
    }
    while (v6 <= 9 && (_DWORD)v5++ != 19);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)updateWithSessionEntityString:(id)a3
{
  GEOUserSessionEntity *v4;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  const char *v13;
  const char *v14;
  unint64_t v15;
  void *v16;
  double v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint32_t v23;
  int v24;
  GEOUserSessionEntity *v25;
  __int16 v26;
  GEOUserSessionEntity *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = (GEOUserSessionEntity *)a3;
  if (-[GEOUserSessionEntity length](v4, "length"))
  {
    -[GEOUserSessionEntity componentsSeparatedByString:](v4, "componentsSeparatedByString:", CFSTR("="));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = -[NSObject count](v5, "count");
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOUserSession");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
    if (v6 < 2)
    {
      if (v8)
      {
        v24 = 138477827;
        v25 = v4;
        _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "Incoming the sessionEntityString (%{private}@) is raw entity data continue parsing", (uint8_t *)&v24, 0xCu);
      }
    }
    else
    {
      if (v8)
      {
        v24 = 138477827;
        v25 = v4;
        _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "Incoming sessionEntityString (%{private}@) is a full entityString", (uint8_t *)&v24, 0xCu);
      }

      -[NSObject objectAtIndexedSubscript:](v5, "objectAtIndexedSubscript:", 1);
      v9 = objc_claimAutoreleasedReturnValue();

      GEOFindOrCreateLog("com.apple.GeoServices", "GEOUserSession");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v24 = 138477827;
        v25 = (GEOUserSessionEntity *)v9;
        _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEBUG, "Parsed the sessionEntityString as (%{private}@) to continue parsing the raw data", (uint8_t *)&v24, 0xCu);
      }
      v4 = (GEOUserSessionEntity *)v9;
    }

    -[GEOUserSessionEntity componentsSeparatedByString:](v4, "componentsSeparatedByString:", CFSTR(","));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count") != 4)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOUserSession");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v24 = 138543362;
        v25 = v4;
        _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, "Invalid user_session_entity - does not have all 4 components (%{public}@) in queryString", (uint8_t *)&v24, 0xCu);
      }
      goto LABEL_30;
    }
    objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[GEOUserSessionEntity _isValidSessionIDHighOrLowString:](self, "_isValidSessionIDHighOrLowString:", v11))
    {
      if (-[GEOUserSessionEntity _isValidSessionIDHighOrLowString:](self, "_isValidSessionIDHighOrLowString:", v12))
      {
        v13 = (const char *)-[NSObject UTF8String](objc_retainAutorelease(v11), "UTF8String");
        v14 = (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
        self->_sessionID._high = strtoull(v13, 0, 10);
        v15 = strtoull(v14, 0, 10);
        self->_sessionID._low = v15;
        if (self->_sessionID._high && v15)
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "doubleValue");
          self->_sessionCreationTime = v17;

          objc_msgSend(v10, "objectAtIndexedSubscript:", 3);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          self->_sequenceNumber = objc_msgSend(v18, "integerValue");

          GEOFindOrCreateLog("com.apple.GeoServices", "GEOUserSession");
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            v24 = 138478083;
            v25 = self;
            v26 = 2113;
            v27 = v4;
            v20 = "Extracted user_session_entity (%{private}@) from queryString (%{private}@).";
            v21 = v19;
            v22 = OS_LOG_TYPE_DEBUG;
            v23 = 22;
LABEL_28:
            _os_log_impl(&dword_1885A9000, v21, v22, v20, (uint8_t *)&v24, v23);
          }
LABEL_29:

LABEL_30:
          goto LABEL_31;
        }
        GEOFindOrCreateLog("com.apple.GeoServices", "GEOUserSession");
        v19 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          goto LABEL_29;
        v24 = 138543362;
        v25 = v4;
        v20 = "Invalid user_session_entity - Either High or Low values is Zero (%{public}@) in queryString";
      }
      else
      {
        GEOFindOrCreateLog("com.apple.GeoServices", "GEOUserSession");
        v19 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          goto LABEL_29;
        v24 = 138543362;
        v25 = v4;
        v20 = "Invalid user_session_entity - - invalid Low Value (%{public}@) in queryString";
      }
    }
    else
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOUserSession");
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        goto LABEL_29;
      v24 = 138543362;
      v25 = v4;
      v20 = "Invalid user_session_entity - invalid High Value (%{public}@) in queryString";
    }
    v21 = v19;
    v22 = OS_LOG_TYPE_ERROR;
    v23 = 12;
    goto LABEL_28;
  }
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOUserSession");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v24) = 0;
    _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, " sessionEntityString is empty.", (uint8_t *)&v24, 2u);
  }
LABEL_31:

}

- (void)updateSessionIDFromUUIDString:(id)a3
{
  __CFString *v4;
  const __CFUUID *v5;
  const __CFUUID *v6;
  CFUUIDBytes v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  __CFString *v14;
  __int16 v15;
  GEOUserSessionEntity *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  self->_sessionID._high = 0;
  self->_sessionID._low = 0;
  if (!-[__CFString length](v4, "length"))
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOUserSession");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    LOWORD(v13) = 0;
    v9 = "Incoming uuidString is empty. so set the sessionID to 0";
LABEL_9:
    v10 = v8;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 2;
    goto LABEL_10;
  }
  v5 = CFUUIDCreateFromString(0, v4);
  if (!v5)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOUserSession");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    LOWORD(v13) = 0;
    v9 = "Incoming uuidString is invalid, Unable to create CFUUID from string. so set the sessionID to 0";
    goto LABEL_9;
  }
  v6 = v5;
  v7 = CFUUIDGetUUIDBytes(v5);
  self->_sessionID._high = bswap64(*(unint64_t *)&v7.byte0);
  self->_sessionID._low = bswap64(*(unint64_t *)&v7.byte8);
  CFRelease(v6);
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOUserSession");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138478083;
    v14 = v4;
    v15 = 2113;
    v16 = self;
    v9 = "updateSessionIDFromUUIDString:(%{private}@) updated value (%{private}@)";
    v10 = v8;
    v11 = OS_LOG_TYPE_DEBUG;
    v12 = 22;
LABEL_10:
    _os_log_impl(&dword_1885A9000, v10, v11, v9, (uint8_t *)&v13, v12);
  }
LABEL_11:

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSessionID:sessionCreationTime:sequenceNumber:", self->_sessionID._high, self->_sessionID._low, self->_sequenceNumber, self->_sessionCreationTime);
}

- (GEOSessionID)sessionID
{
  unint64_t low;
  unint64_t high;
  GEOSessionID result;

  low = self->_sessionID._low;
  high = self->_sessionID._high;
  result._low = low;
  result._high = high;
  return result;
}

- (double)sessionCreationTime
{
  return self->_sessionCreationTime;
}

- (void)setSessionCreationTime:(double)a3
{
  self->_sessionCreationTime = a3;
}

- (double)sessionRelativeTimestamp
{
  return self->_sessionRelativeTimestamp;
}

- (unsigned)sequenceNumber
{
  return self->_sequenceNumber;
}

@end
