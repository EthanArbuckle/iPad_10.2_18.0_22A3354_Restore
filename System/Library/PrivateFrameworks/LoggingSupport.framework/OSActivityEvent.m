@implementation OSActivityEvent

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[OSActivityEvent process](self, "process");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSActivityEvent sender](self, "sender");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSActivityEvent eventMessage](self, "eventMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p process:%@ sender:%@>{%@}"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSTimeZone)timezone
{
  OSActivityEvent *v2;
  uint64_t v3;
  NSTimeZone *timezone;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_timezone)
  {
    if (-[NSString length](v2->_timezoneName, "length"))
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v2->_timezoneName);
    else
      objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 3600 * v2->_tz.tz_dsttime + -60 * v2->_tz.tz_minuteswest);
    v3 = objc_claimAutoreleasedReturnValue();
    timezone = v2->_timezone;
    v2->_timezone = (NSTimeZone *)v3;

  }
  objc_sync_exit(v2);

  return v2->_timezone;
}

- (void)fillFromStreamEntry:(os_activity_stream_entry_s *)a3 eventMessage:(const char *)a4 persisted:(BOOL)a5
{
  NSUUID *v9;
  NSUUID *processImageUUID;
  NSString *v11;
  NSString *processImagePath;
  NSDate *v13;
  NSDate *timestamp;
  NSString *timezoneName;
  NSTimeZone *timezone;
  NSString *v17;
  NSString *eventMessage;
  NSUUID *v19;
  NSUUID *senderImageUUID;
  NSString *v21;
  NSString *senderImagePath;

  self->_eventType = a3->var0;
  self->_processID = a3->var1;
  self->_processUniqueID = a3->var2;
  self->_userID = a3->var3;
  if (a3->var4)
  {
    v9 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a3->var4);
    processImageUUID = self->_processImageUUID;
    self->_processImageUUID = v9;

  }
  if (a3->var5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    processImagePath = self->_processImagePath;
    self->_processImagePath = v11;

  }
  self->_parentActivityID = a3->var7 & 0xFFFFFFFFFFFFFFLL;
  self->_activityID = a3->var6 & 0xFFFFFFFFFFFFFFLL;
  self->_traceID = a3->var8.var0.var0;
  self->_threadID = a3->var8.var0.var2;
  self->_machTimestamp = a3->var8.var0.var1;
  self->_timeGMT = a3->var8.var12.var5;
  self->_tz = a3->var8.var12.var6;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)a3->var8.var0.var5.tv_usec / 1000000.0 + (double)a3->var8.var0.var5.tv_sec);
  v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  self->_timestamp = v13;

  timezoneName = self->_timezoneName;
  self->_timezoneName = (NSString *)&stru_1E4158990;

  timezone = self->_timezone;
  self->_timezone = 0;

  self->_persisted = a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a4);
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  eventMessage = self->_eventMessage;
  self->_eventMessage = v17;

  if (!self->_eventMessage)
    self->_eventMessage = (NSString *)CFSTR("<compose failure [invalid utf8]>");
  if (a3->var8.var0.var3)
  {
    v19 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a3->var8.var0.var3);
    senderImageUUID = self->_senderImageUUID;
    self->_senderImageUUID = v19;

  }
  if (a3->var8.var0.var4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:");
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    senderImagePath = self->_senderImagePath;
    self->_senderImagePath = v21;

  }
}

- (id)properties
{
  void *v3;

  v3 = (void *)objc_opt_new();
  -[OSActivityEvent _addProperties:](self, "_addProperties:", v3);
  return v3;
}

- (void)_initWithProperties:(id)a3
{
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
  void *v15;
  void *v16;
  void *v17;
  NSUUID *v18;
  NSUUID *senderImageUUID;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  objc_msgSend(v23, "objectForKey:", CFSTR("processID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    self->_processID = objc_msgSend(v4, "intValue");
  objc_msgSend(v23, "objectForKey:", CFSTR("processUniqueID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    self->_processUniqueID = objc_msgSend(v6, "unsignedLongLongValue");
  objc_msgSend(v23, "objectForKey:", CFSTR("processImageUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_storeStrong((id *)&self->_processImageUUID, v7);
  objc_msgSend(v23, "objectForKey:", CFSTR("processImagePath"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_storeStrong((id *)&self->_processImagePath, v8);
  objc_msgSend(v23, "objectForKey:", CFSTR("userID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    self->_userID = objc_msgSend(v9, "unsignedIntValue");
  objc_msgSend(v23, "objectForKey:", CFSTR("eventType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    self->_eventType = objc_msgSend(v10, "unsignedLongValue");
  objc_msgSend(v23, "objectForKey:", CFSTR("parentActivityID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    self->_parentActivityID = objc_msgSend(v11, "unsignedLongLongValue");
  objc_msgSend(v23, "objectForKey:", CFSTR("activityID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    self->_activityID = objc_msgSend(v12, "unsignedLongLongValue");
  objc_msgSend(v23, "objectForKey:", CFSTR("traceID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    self->_traceID = objc_msgSend(v13, "unsignedLongLongValue");
  objc_msgSend(v23, "objectForKey:", CFSTR("threadID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    self->_threadID = objc_msgSend(v14, "unsignedLongLongValue");
  objc_msgSend(v23, "objectForKey:", CFSTR("machTimestamp"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    self->_machTimestamp = objc_msgSend(v15, "unsignedLongLongValue");
  objc_msgSend(v23, "objectForKey:", CFSTR("timestamp"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_storeStrong((id *)&self->_timestamp, v16);
  objc_msgSend(v23, "objectForKey:", CFSTR("senderImageUUID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v17);
    senderImageUUID = self->_senderImageUUID;
    self->_senderImageUUID = v18;

  }
  objc_msgSend(v23, "objectForKey:", CFSTR("senderImagePath"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    objc_storeStrong((id *)&self->_senderImagePath, v20);
  objc_msgSend(v23, "objectForKey:", CFSTR("eventMessage"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    objc_storeStrong((id *)&self->_eventMessage, v21);
  objc_msgSend(v23, "objectForKey:", CFSTR("persisted"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    self->_persisted = objc_msgSend(v22, "BOOLValue");

}

- (void)_addProperties:(id)a3
{
  id v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  tm *v25;
  const tm *v26;
  int v27;
  unsigned int v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  NSString *timezoneName;
  time_t v34;
  tm v35;
  char __str[32];
  char v37[16];
  __int128 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[OSActivityEvent processID](self, "processID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("processID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[OSActivityEvent processUniqueID](self, "processUniqueID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("processUniqueID"));

  -[OSActivityEvent processImageUUID](self, "processImageUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[OSActivityEvent processImageUUID](self, "processImageUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("processImageUUID"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[OSActivityEvent userID](self, "userID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v10, CFSTR("userID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[OSActivityEvent traceID](self, "traceID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("traceID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[OSActivityEvent threadID](self, "threadID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("threadID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[OSActivityEvent machTimestamp](self, "machTimestamp"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v13, CFSTR("machTimestamp"));

  -[OSActivityEvent processImagePath](self, "processImagePath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[OSActivityEvent processImagePath](self, "processImagePath");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("processImagePath"));

  }
  if (-[OSActivityEvent parentActivityID](self, "parentActivityID"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[OSActivityEvent parentActivityID](self, "parentActivityID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v16, CFSTR("parentActivityID"));

  }
  if (-[OSActivityEvent activityID](self, "activityID"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[OSActivityEvent activityID](self, "activityID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v17, CFSTR("activityID"));

  }
  -[OSActivityEvent senderImageUUID](self, "senderImageUUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[OSActivityEvent senderImageUUID](self, "senderImageUUID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("senderImageUUID"));

  }
  -[OSActivityEvent senderImagePath](self, "senderImagePath");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[OSActivityEvent senderImagePath](self, "senderImagePath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("senderImagePath"));

  }
  -[OSActivityEvent eventMessage](self, "eventMessage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[OSActivityEvent eventMessage](self, "eventMessage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v24, CFSTR("eventMessage"));

  }
  memset(&v35, 0, sizeof(v35));
  v39 = 0;
  *(_OWORD *)v37 = 0u;
  v38 = 0u;
  v34 = self->_timeGMT.tv_sec - 60 * self->_tz.tz_minuteswest + 3600 * self->_tz.tz_dsttime;
  v25 = gmtime_r(&v34, &v35);
  if (v25)
  {
    v26 = v25;
    v27 = self->_tz.tz_minuteswest - 60 * self->_tz.tz_dsttime;
    v28 = ((int)(((unint64_t)(2004318071 * v27) >> 32) - v27) >> 5)
        + ((((unint64_t)(2004318071 * v27) >> 32) - v27) >> 31);
    v29 = v27 % 60;
    if (v29 < 0)
      v29 = -v29;
    snprintf(__str, 0x20uLL, "%%F %%T.%06d%+03d%02d", self->_timeGMT.tv_usec, v28, v29);
    strftime(v37, 0x24uLL, __str, v26);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v37);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v30, CFSTR("timestamp"));
  }
  else
  {
    if (_addProperties__once != -1)
      dispatch_once(&_addProperties__once, &__block_literal_global_358);
    v31 = (void *)_addProperties__dateFormat;
    -[OSActivityEvent timestamp](self, "timestamp");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringFromDate:", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v32, CFSTR("timestamp"));

  }
  timezoneName = self->_timezoneName;
  if (timezoneName)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", timezoneName, CFSTR("timezoneName"));

}

- (NSString)process
{
  return -[NSString lastPathComponent](self->_processImagePath, "lastPathComponent");
}

- (NSString)sender
{
  return -[NSString lastPathComponent](self->_senderImagePath, "lastPathComponent");
}

- (int)processID
{
  return self->_processID;
}

- (unint64_t)processUniqueID
{
  return self->_processUniqueID;
}

- (NSUUID)processImageUUID
{
  return self->_processImageUUID;
}

- (NSString)processImagePath
{
  return self->_processImagePath;
}

- (unsigned)userID
{
  return self->_userID;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (unint64_t)parentActivityID
{
  return self->_parentActivityID;
}

- (unint64_t)activityID
{
  return self->_activityID;
}

- (unint64_t)traceID
{
  return self->_traceID;
}

- (unint64_t)threadID
{
  return self->_threadID;
}

- (unint64_t)machTimestamp
{
  return self->_machTimestamp;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSUUID)senderImageUUID
{
  return self->_senderImageUUID;
}

- (NSString)senderImagePath
{
  return self->_senderImagePath;
}

- (NSString)eventMessage
{
  return self->_eventMessage;
}

- (void)setEventMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (BOOL)persisted
{
  return self->_persisted;
}

- (timeval)timeGMT
{
  uint64_t v2;
  __darwin_time_t tv_sec;
  timeval result;

  v2 = *(_QWORD *)&self->_timeGMT.tv_usec;
  tv_sec = self->_timeGMT.tv_sec;
  result.tv_usec = v2;
  result.tv_sec = tv_sec;
  return result;
}

- (timezone)tz
{
  return self->_tz;
}

- (NSString)timezoneName
{
  return self->_timezoneName;
}

- (void)setTimezoneName:(id)a3
{
  objc_storeStrong((id *)&self->_timezoneName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timezoneName, 0);
  objc_storeStrong((id *)&self->_eventMessage, 0);
  objc_storeStrong((id *)&self->_senderImagePath, 0);
  objc_storeStrong((id *)&self->_senderImageUUID, 0);
  objc_storeStrong((id *)&self->_timezone, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_processImagePath, 0);
  objc_storeStrong((id *)&self->_processImageUUID, 0);
}

uint64_t __34__OSActivityEvent__addProperties___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_addProperties__dateFormat;
  _addProperties__dateFormat = (uint64_t)v0;

  return objc_msgSend((id)_addProperties__dateFormat, "setDateFormat:", CFSTR("MMM dd HH:mm:ss.SSSSSS"));
}

+ (id)activityEventFromStreamEntry:(os_activity_stream_entry_s *)a3
{
  signed int var0;
  __objc2_class **v4;
  void *v5;

  var0 = a3->var0;
  if ((int)a3->var0 <= 1023)
  {
    if (var0 > 514)
    {
      if (var0 == 515)
      {
        v4 = off_1E4155340;
        goto LABEL_23;
      }
      if (var0 == 768)
      {
        v4 = off_1E4155330;
        goto LABEL_23;
      }
    }
    else
    {
      if (var0 == 513)
      {
        v4 = off_1E41552F0;
        goto LABEL_23;
      }
      if (var0 == 514)
      {
        v4 = off_1E4155338;
        goto LABEL_23;
      }
    }
  }
  else if (var0 <= 1279)
  {
    if (var0 == 1024 || var0 == 1152)
    {
      v4 = off_1E4155308;
      goto LABEL_23;
    }
  }
  else
  {
    switch(var0)
    {
      case 1280:
        v4 = off_1E4155328;
        goto LABEL_23;
      case 1792:
        v4 = off_1E4155310;
        goto LABEL_23;
      case 2560:
        v4 = off_1E4155320;
        goto LABEL_23;
    }
  }
  if ((var0 & 0xFFFFFF00) != 0x600)
  {
    v5 = 0;
    return v5;
  }
  v4 = off_1E4155318;
LABEL_23:
  v5 = (void *)objc_msgSend(objc_alloc(*v4), "initWithEntry:", a3);
  return v5;
}

@end
