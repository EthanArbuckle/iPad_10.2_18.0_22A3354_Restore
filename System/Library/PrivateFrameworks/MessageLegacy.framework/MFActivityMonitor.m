@implementation MFActivityMonitor

- (void)setCanBeCancelled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 73) = *((_BYTE *)self + 73) & 0xDF | v3;
}

- (void)finishedActivity:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0DE7910], "mf_clearLocks");
  v5 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "threadDictionary");
  objc_msgSend(v5, "removeObjectForKey:", *MEMORY[0x1E0D1EDD8]);
  *((_BYTE *)self + 73) &= ~0x80u;
  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");

  self->_runningThread = 0;
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  -[MFActivityMonitor postActivityFinished:](self, "postActivityFinished:", a3);
}

- (void)startActivity
{
  NSMutableDictionary *v3;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  self->_runningThread = (NSThread *)(id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  v3 = -[NSThread threadDictionary](self->_runningThread, "threadDictionary");
  -[NSMutableDictionary setObject:forKey:](v3, "setObject:forKey:", self, *MEMORY[0x1E0D1EDD8]);
  *((_BYTE *)self + 73) |= 0x80u;
  self->_startTime = CFAbsoluteTimeGetCurrent();
  -[MFActivityMonitor resetConnectionStats](self, "resetConnectionStats");
  -[MFActivityMonitor setError:](self, "setError:", 0);
  -[MFActivityMonitor postActivityStarting](self, "postActivityStarting");
}

- (void)postActivityFinished:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", a3, CFSTR("MonitoredActivityInvocation"), 0, 0);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("MonitoredActivityEnded"), self, v4);

}

- (BOOL)shouldCancel
{
  return (*((unsigned __int8 *)self + 73) >> 6) & 1;
}

- (void)setError:(id)a3
{
  MFError *error;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  error = self->_error;
  if (error != a3)
  {

    self->_error = (MFError *)a3;
  }
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
}

- (void)resetConnectionStats
{
  self->_bytesWritten = 0;
  self->_bytesRead = 0;
}

- (void)postActivityStarting
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("MonitoredActivityStarted"), self);
}

+ (id)currentMonitor
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___MFActivityMonitor;
  return objc_msgSendSuper2(&v3, sel_currentDesignator);
}

- (MFActivityMonitor)init
{
  MFActivityMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFActivityMonitor;
  result = -[MFActivityMonitor init](&v3, sel_init);
  if (result)
  {
    result->_statusMessage = (NSString *)&stru_1E81CBE50;
    result->_taskName = (NSString *)&stru_1E81CBE50;
    result->_percentDone = 0.0;
    *((_BYTE *)result + 73) |= 0x20u;
    *((_BYTE *)result + 73) &= ~0x40u;
    *((_WORD *)result + 36) &= 0xE000u;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFActivityMonitor;
  -[MFActivityMonitor dealloc](&v3, sel_dealloc);
}

- (BOOL)isActive
{
  return *((unsigned __int8 *)self + 73) >> 7;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (void)cancelMessage
{
  __CFRunLoop *Current;

  if (-[MFActivityMonitor shouldCancel](self, "shouldCancel"))
  {
    Current = CFRunLoopGetCurrent();
    CFRunLoopStop(Current);
  }
}

- (void)notifyConnectionEstablished
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("NetworkConnectionEstablished"), self);
}

- (id)userInfoForNotification
{
  unint64_t maxCount;
  float v4;
  int *v5;
  NSString *displayName;
  void *v7;
  double v8;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  maxCount = self->_maxCount;
  if (!maxCount)
  {
    v5 = &OBJC_IVAR___MFActivityMonitor__percentDone;
    goto LABEL_7;
  }
  if (self->_currentCount > maxCount)
    maxCount = self->_currentCount;
  self->_maxCount = maxCount;
  v4 = 0.0;
  if ((*((_BYTE *)self + 136) & 1) != 0)
  {
    v5 = &OBJC_IVAR___MFActivityMonitor__currentItemPercentDone;
LABEL_7:
    v4 = *(double *)((char *)&self->super.super.isa + *v5);
  }
  if (-[NSString length](self->_displayName, "length"))
  {
    if (!self->_maxCount
      && -[NSString rangeOfString:](self->_displayName, "rangeOfString:", CFSTR("…")) == 0x7FFFFFFFFFFFFFFFLL
      && -[NSString rangeOfString:](self->_displayName, "rangeOfString:", CFSTR("...")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      displayName = (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", MFLookupLocalizedString((uint64_t)CFSTR("MF_INDETERMINATE_PROGRESS_FORMAT"), (uint64_t)CFSTR("%@..."), 0), self->_displayName);
    }
    else
    {
      displayName = self->_displayName;
    }
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend(v7, "setObject:forKey:", displayName, CFSTR("MonitoredActivityDictMessage"));
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maxCount), CFSTR("MonitoredActivityMaxCount"));
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_currentCount), CFSTR("MonitoredActivityCurrentCount"));
    *(float *)&v8 = v4;
    objc_msgSend(v7, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8), CFSTR("MonitoredActivityCurrentItemProgress"));
  }
  else
  {
    v7 = 0;
  }
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  return v7;
}

- (void)postDidChangeWithUserInfo:(id)a3
{
  if (a3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("MonitoredActivityMessage"), self, a3);
}

- (void)_didChange
{
  -[MFActivityMonitor postDidChangeWithUserInfo:](self, "postDidChangeWithUserInfo:", -[MFActivityMonitor userInfoForNotification](self, "userInfoForNotification"));
}

- (void)setMaxCount:(unint64_t)a3
{
  id v5;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  self->_maxCount = a3;
  self->_lastTime = 0.0;
  v5 = -[MFActivityMonitor userInfoForNotification](self, "userInfoForNotification");
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  -[MFActivityMonitor postDidChangeWithUserInfo:](self, "postDidChangeWithUserInfo:", v5);
}

- (void)setCurrentCount:(unint64_t)a3
{
  id v5;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  self->_currentCount = a3;
  self->_currentItemPercentDone = 0.0;
  v5 = -[MFActivityMonitor userInfoForNotification](self, "userInfoForNotification");
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  -[MFActivityMonitor postDidChangeWithUserInfo:](self, "postDidChangeWithUserInfo:", v5);
}

- (void)setSupportsPerItemProgress:(BOOL)a3
{
  *((_BYTE *)self + 136) = *((_BYTE *)self + 136) & 0xFE | a3;
}

- (id)_ntsThrottledUserInfoDict
{
  double Current;
  double v4;
  id result;

  Current = CFAbsoluteTimeGetCurrent();
  v4 = Current;
  if (self->_currentCount != self->_maxCount && Current - self->_lastTime < 0.0333333351)
    return 0;
  result = -[MFActivityMonitor userInfoForNotification](self, "userInfoForNotification");
  self->_lastTime = v4;
  return result;
}

- (void)setPercentDoneOfCurrentItem:(double)a3
{
  id v5;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  self->_currentItemPercentDone = a3;
  v5 = -[MFActivityMonitor _ntsThrottledUserInfoDict](self, "_ntsThrottledUserInfoDict");
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  if (v5)
    -[MFActivityMonitor postDidChangeWithUserInfo:](self, "postDidChangeWithUserInfo:", v5);
}

- (void)reset
{
  id v3;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  self->_maxCount = 0;
  self->_currentCount = 0;
  self->_percentDone = 0.0;
  self->_currentItemPercentDone = 0.0;
  -[MFActivityMonitor setSupportsPerItemProgress:](self, "setSupportsPerItemProgress:", 0);
  self->_lastTime = 0.0;

  self->_taskName = 0;
  self->_displayName = 0;
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  if (self->_mailbox)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v3, "setObject:forKey:", CFSTR("RESET"), CFSTR("MonitoredActivityReset"));
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("MonitoredActivityMessage"), self, v3);

  }
}

- (void)setGotNewMessagesState:(unint64_t)a3
{
  if (self->_gotNewMessagesState < a3)
    self->_gotNewMessagesState = a3;
}

- (unint64_t)gotNewMessagesState
{
  return self->_gotNewMessagesState;
}

- (void)addReason:(id)a3
{
  NSMutableSet *reasons;

  reasons = self->_reasons;
  if (!reasons)
  {
    reasons = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    self->_reasons = reasons;
  }
  -[NSMutableSet addObject:](reasons, "addObject:", a3);
}

- (BOOL)hasReason:(id)a3
{
  return -[NSMutableSet containsObject:](self->_reasons, "containsObject:", a3);
}

- (id)reasons
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", self->_reasons);
}

- (int)changeCount
{
  return *((char *)self + 74);
}

- (void)setStatusMessage:(id)a3
{
  -[MFActivityMonitor percentDone](self, "percentDone");
  -[MFActivityMonitor setStatusMessage:percentDone:](self, "setStatusMessage:percentDone:", a3);
}

- (void)setStatusMessage:(id)a3 percentDone:(double)a4
{
  -[MFActivityMonitor setStatusMessage:percentDone:withKey:](self, "setStatusMessage:percentDone:withKey:", a3, 0, a4);
}

- (id)statusMessage
{
  NSString **p_statusMessage;
  NSString *statusMessage;
  NSString *v5;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  p_statusMessage = &self->_statusMessage;
  statusMessage = self->_statusMessage;
  if (!statusMessage || -[NSString isEqualToString:](statusMessage, "isEqualToString:", &stru_1E81CBE50))
    p_statusMessage = &self->_taskName;
  v5 = *p_statusMessage;
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  return v5;
}

- (void)setPercentDone:(double)a3
{
  -[MFActivityMonitor setPercentDone:withKey:](self, "setPercentDone:withKey:", 0, a3);
}

- (double)percentDone
{
  return self->_percentDone;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setExpectedLength:(unint64_t)a3
{
  self->_expectedLength = a3;
}

- (unint64_t)expectedLength
{
  return self->_expectedLength;
}

- (NSString)description
{
  NSString *descriptionString;
  id v4;
  uint64_t v5;
  const __CFString *taskName;
  __CFString *v7;
  NSString *v8;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  descriptionString = self->_descriptionString;
  if (!descriptionString)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend((id)objc_msgSend(self->_target, "displayName"), "length"))
    {
      v4 = objc_alloc(MEMORY[0x1E0CB3940]);
      v5 = objc_msgSend(self->_target, "displayName");
      taskName = (const __CFString *)self->_taskName;
      if (!taskName)
        taskName = &stru_1E81CBE50;
      descriptionString = (NSString *)objc_msgSend(v4, "initWithFormat:", CFSTR("[%@] %@"), v5, taskName);
    }
    else
    {
      v7 = (__CFString *)self->_taskName;
      if (!v7)
        v7 = &stru_1E81CBE50;
      descriptionString = v7;
    }
    self->_descriptionString = descriptionString;
  }
  v8 = descriptionString;
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  return v8;
}

- (id)taskName
{
  NSString *v3;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  v3 = self->_taskName;
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  return v3;
}

- (void)setTaskName:(id)a3
{
  NSString *taskName;
  NSString *v6;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  taskName = self->_taskName;
  if (taskName != a3)
  {
    v6 = taskName;
    self->_taskName = (NSString *)a3;
  }
  self->_currentCount = 0;
  self->_maxCount = 0;
  self->_lastTime = 0.0;
  self->_percentDone = 0.0;
  self->_currentItemPercentDone = 0.0;

  self->_displayName = 0;
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
}

- (id)displayName
{
  NSString *v3;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  v3 = self->_displayName;
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  return v3;
}

- (void)setDisplayName:(id)a3 maxCount:(unint64_t)a4
{
  NSString *displayName;
  NSString *v8;
  id v9;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  displayName = self->_displayName;
  if (displayName != a3)
  {
    v8 = displayName;
    self->_displayName = (NSString *)a3;
  }
  self->_maxCount = a4;
  self->_currentCount = 0;
  self->_lastTime = 0.0;
  self->_percentDone = 0.0;
  self->_currentItemPercentDone = 0.0;
  v9 = -[MFActivityMonitor userInfoForNotification](self, "userInfoForNotification");
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  -[MFActivityMonitor postDidChangeWithUserInfo:](self, "postDidChangeWithUserInfo:", v9);
}

- (void)setDisplayName:(id)a3
{
  -[MFActivityMonitor setDisplayName:maxCount:](self, "setDisplayName:maxCount:", a3, 0);
}

- (void)setActivityTarget:(id)a3
{
  id target;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  if (self->_target == a3)
  {
    target = 0;
  }
  else
  {
    target = self->_target;
    self->_target = a3;

    self->_descriptionString = 0;
  }
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");

}

- (id)activityTarget
{
  id v3;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  v3 = self->_target;
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  return v3;
}

- (BOOL)_lockedAddActivityTarget:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    self->_target = objc_alloc_init(_MFActivityMonitorMultiTarget);

    self->_descriptionString = 0;
  }
  return objc_msgSend(self->_target, "addActivityTarget:", a3);
}

- (void)addActivityTarget:(id)a3
{
  id target;
  _BOOL4 v6;
  void *v7;
  void *v8;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  target = self->_target;
  v6 = -[MFActivityMonitor _lockedAddActivityTarget:](self, "_lockedAddActivityTarget:", a3);
  if (self->_target == target)
    v7 = 0;
  else
    v7 = target;
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");

  if (v6)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("MonitoredActivityDidAddActivityTarget"), self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a3, CFSTR("AddedTarget"), 0));
  }
}

- (void)addActivityTargets:(id)a3
{
  id target;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  target = self->_target;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(a3);
        v8 |= -[MFActivityMonitor _lockedAddActivityTarget:](self, "_lockedAddActivityTarget:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
    if (self->_target == target)
      v11 = 0;
    else
      v11 = target;
    +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");

    if ((v8 & 1) != 0)
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("MonitoredActivityDidAddActivityTarget"), self, 0);
  }
  else
  {
    if (self->_target == target)
      v12 = 0;
    else
      v12 = target;
    +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");

  }
}

- (void)removeActivityTarget:(id)a3
{
  id v4;
  int v5;
  void *v6;

  v4 = a3;
  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(self->_target, "removeActivityTarget:", a3);
    +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
    if (v5)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("MonitoredActivityDidRemoveActivityTarget"), self, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a3, CFSTR("RemovedTarget"), 0));
    }
  }
  else
  {
    +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  }

}

- (void)setPrimaryTarget:(id)a3
{
  void *v5;
  id v6;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
    goto LABEL_5;
  }
  v6 = (id)objc_msgSend(self->_target, "primaryTarget");
  objc_msgSend(self->_target, "setPrimaryTarget:", a3);

  self->_descriptionString = 0;
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  if (!v6)
  {
LABEL_5:
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", a3, CFSTR("MonitoredActivityNewPrimaryTarget"), 0, CFSTR("MonitoredActivityOldPrimaryTarget"), 0);
    v6 = 0;
    goto LABEL_6;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v6, CFSTR("MonitoredActivityOldPrimaryTarget"), a3, CFSTR("MonitoredActivityNewPrimaryTarget"), 0);
LABEL_6:
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("MonitoredActivityPrimaryTargetChanged"), self, v5);

}

- (id)primaryTarget
{
  id v3;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (id)objc_msgSend(self->_target, "primaryTarget");
  else
    v3 = 0;
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  return v3;
}

- (id)activityTargets
{
  id v3;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = (id)objc_msgSend(self->_target, "allTargets");
  else
    v3 = 0;
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  return v3;
}

- (BOOL)canBeCancelled
{
  return (*((unsigned __int8 *)self + 73) >> 5) & 1;
}

- (void)setShouldCancel:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  NSThread *v6;
  uint8_t v7[16];

  if ((*((_BYTE *)self + 73) & 0x20) != 0)
  {
    if (a3)
    {
      if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      {
        v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3978], "currentThread"), "threadDictionary");
        if ((MFActivityMonitor *)objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0D1EDD8]) == self)
        {
          v5 = MFLogGeneral();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v7 = 0;
            _os_log_impl(&dword_1C8839000, v5, OS_LOG_TYPE_DEFAULT, "#Warning Activity monitor cancelled on the Main Thread.  Why?", v7, 2u);
          }
        }
      }
      *((_BYTE *)self + 73) |= 0x40u;
      -[MFActivityMonitor _cancelAssociatedCancelables](self, "_cancelAssociatedCancelables");
    }
    else
    {
      *((_BYTE *)self + 73) &= ~0x40u;
    }
    +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
    v6 = self->_runningThread;
    +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
    if (v6)
      -[MFActivityMonitor performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel_cancelMessage, v6, 0, 0);
    else
      -[MFActivityMonitor cancelMessage](self, "cancelMessage");

    -[MFInvocationQueue didCancel:](self->_ourQueue, "didCancel:", self);
    -[MFActivityMonitor _didChange](self, "_didChange");
  }
}

- (void)addCancelable:(id)a3
{
  NSMutableSet *associatedCancelables;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  associatedCancelables = self->_associatedCancelables;
  if (!associatedCancelables)
  {
    associatedCancelables = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    self->_associatedCancelables = associatedCancelables;
  }
  -[NSMutableSet addObject:](associatedCancelables, "addObject:", a3);
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  if ((*((_BYTE *)self + 73) & 0x40) != 0)
    objc_msgSend(a3, "cancel");
}

- (void)removeCancelable:(id)a3
{
  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  -[NSMutableSet removeObject:](self->_associatedCancelables, "removeObject:", a3);
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
}

- (void)_cancelAssociatedCancelables
{
  id v3;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  v3 = (id)-[NSMutableSet copy](self->_associatedCancelables, "copy");
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_cancel);

}

- (void)cancel
{
  -[MFActivityMonitor setShouldCancel:](self, "setShouldCancel:", 1);
}

- (void)setInvocationQueue:(id)a3
{
  MFInvocationQueue *v4;

  v4 = (MFInvocationQueue *)a3;

  self->_ourQueue = v4;
}

+ (void)destroyMonitor
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___MFActivityMonitor;
  objc_msgSendSuper2(&v2, sel_destroyCurrentDesignator);
}

- (int)acquireExclusiveAccessKey
{
  int v3;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  if ((*((_WORD *)self + 36) & 0x1FFF) != 0)
  {
    v3 = 0;
  }
  else
  {
    *((_WORD *)self + 36) = *((_WORD *)self + 36) & 0xE000 | 1;
    v3 = 1;
  }
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  return v3;
}

- (void)relinquishExclusiveAccessKey:(int)a3
{
  int v5;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  v5 = *((unsigned __int16 *)self + 36);
  if (a3 == v5 << 19 >> 19)
    *((_WORD *)self + 36) = v5 & 0xE000;
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
}

- (void)setStatusMessage:(id)a3 percentDone:(double)a4 withKey:(int)a5
{
  uint64_t v5;

  v5 = *(_QWORD *)&a5;
  -[MFActivityMonitor setStatusMessage:withKey:](self, "setStatusMessage:withKey:", a3);
  -[MFActivityMonitor setPercentDone:withKey:](self, "setPercentDone:withKey:", v5, a4);
}

- (void)setStatusMessage:(id)a3 withKey:(int)a4
{
  NSString *statusMessage;
  id v8;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  if (a4 != *((unsigned __int16 *)self + 36) << 19 >> 19 || (statusMessage = self->_statusMessage, statusMessage == a3))
  {
    +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  }
  else
  {

    self->_statusMessage = (NSString *)a3;
    v8 = -[MFActivityMonitor userInfoForNotification](self, "userInfoForNotification");
    +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
    if (v8)
      -[MFActivityMonitor postDidChangeWithUserInfo:](self, "postDidChangeWithUserInfo:", v8);
  }
}

- (void)setPercentDone:(double)a3 withKey:(int)a4
{
  double v7;
  id v8;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  if (a4 != *((unsigned __int16 *)self + 36) << 19 >> 19)
    goto LABEL_7;
  v7 = 1.0;
  if (a3 <= 1.0)
    v7 = a3;
  if (v7 == self->_percentDone)
  {
LABEL_7:
    +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  }
  else
  {
    self->_percentDone = v7;
    v8 = -[MFActivityMonitor userInfoForNotification](self, "userInfoForNotification");
    +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
    if (v8)
      -[MFActivityMonitor postDidChangeWithUserInfo:](self, "postDidChangeWithUserInfo:", v8);
  }
}

- (id)error
{
  MFError *v3;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  v3 = self->_error;
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  return v3;
}

- (void)recordBytesRead:(unint64_t)a3
{
  self->_bytesRead += a3;
}

- (void)recordBytesWritten:(unint64_t)a3
{
  self->_bytesWritten += a3;
}

- (unint64_t)bytesRead
{
  return self->_bytesRead;
}

- (unint64_t)bytesWritten
{
  return self->_bytesWritten;
}

- (MFMailboxUid)mailbox
{
  return (MFMailboxUid *)objc_getProperty(self, a2, 144, 1);
}

- (void)setMailbox:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (BOOL)isRemoteSearch
{
  return self->_isRemoteSearch;
}

- (void)setIsRemoteSearch:(BOOL)a3
{
  self->_isRemoteSearch = a3;
}

@end
