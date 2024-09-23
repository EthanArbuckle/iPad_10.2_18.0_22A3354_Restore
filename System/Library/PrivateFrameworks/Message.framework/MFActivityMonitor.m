@implementation MFActivityMonitor

- (void)setCanBeCancelled:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_BYTE *)self + 49) = *((_BYTE *)self + 49) & 0xDF | v3;
}

- (MFActivityMonitor)init
{
  MFActivityMonitor *v2;
  MFActivityMonitor *v3;
  NSString *statusMessage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFActivityMonitor;
  v2 = -[MFActivityMonitor init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    statusMessage = v2->_statusMessage;
    v2->_statusMessage = (NSString *)&stru_1E4F1C8F8;

    v3->_percentDone = 0.0;
    *((_BYTE *)v3 + 49) |= 0x20u;
    *((_BYTE *)v3 + 49) &= ~0x40u;
    *((_WORD *)v3 + 24) &= 0xE000u;
  }
  return v3;
}

- (BOOL)shouldCancel
{
  return (*((unsigned __int8 *)self + 49) >> 6) & 1;
}

- (void)postActivityStarting
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("MonitoredActivityStarted"), self);

}

- (void)startActivity
{
  NSThread *v3;
  NSThread *runningThread;
  void *v5;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (NSThread *)objc_claimAutoreleasedReturnValue();
  runningThread = self->_runningThread;
  self->_runningThread = v3;

  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  -[NSThread threadDictionary](self->_runningThread, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", self, *MEMORY[0x1E0D1EDD8]);

  *((_BYTE *)self + 49) |= 0x80u;
  self->_startTime = CFAbsoluteTimeGetCurrent();
  -[MFActivityMonitor resetConnectionStats](self, "resetConnectionStats");
  -[MFActivityMonitor setError:](self, "setError:", 0);
  -[MFActivityMonitor postActivityStarting](self, "postActivityStarting");
}

- (void)setError:(id)a3
{
  id v5;

  v5 = a3;
  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  objc_storeStrong((id *)&self->_error, a3);
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");

}

- (void)resetConnectionStats
{
  self->_transportType = 0;
  self->_bytesWritten = 0;
  self->_bytesRead = 0;
}

- (void)finishedActivity:(id)a3
{
  void *v4;
  void *v5;
  NSThread *runningThread;
  id v7;

  v7 = a3;
  objc_msgSend(MEMORY[0x1E0DE7910], "mf_clearLocks");
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "threadDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", *MEMORY[0x1E0D1EDD8]);

  *((_BYTE *)self + 49) &= ~0x80u;
  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  runningThread = self->_runningThread;
  self->_runningThread = 0;

  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  -[MFActivityMonitor postActivityFinished:](self, "postActivityFinished:", v7);

}

- (void)postActivityFinished:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v6, CFSTR("MonitoredActivityInvocation"), 0, 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("MonitoredActivityEnded"), self, v4);

}

- (MFError)error
{
  MFError *v3;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  v3 = self->_error;
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  return v3;
}

- (void)setStartedFetch:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_startedFetch, 0);
  objc_storeStrong((id *)&self->_associatedCancelables, 0);
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_statusMessage, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_runningThread, 0);
}

- (unint64_t)gotNewMessagesState
{
  return self->_gotNewMessagesState;
}

- (unint64_t)bytesWritten
{
  return self->_bytesWritten;
}

- (unint64_t)bytesRead
{
  return self->_bytesRead;
}

- (void)reset
{
  NSString *displayName;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  self->_maxCount = 0;
  self->_currentCount = 0;
  self->_percentDone = 0.0;
  self->_lastTime = 0.0;
  displayName = self->_displayName;
  self->_displayName = 0;

  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  if (self->_mailbox)
  {
    v5 = CFSTR("MonitoredActivityReset");
    v6[0] = CFSTR("RESET");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFActivityMonitor postDidChangeWithUserInfo:](self, "postDidChangeWithUserInfo:", v4);

  }
}

+ (MFActivityMonitor)currentMonitor
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___MFActivityMonitor;
  objc_msgSendSuper2(&v3, sel_currentDesignator);
  return (MFActivityMonitor *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)addReason:(id)a3
{
  id v4;
  NSMutableSet *reasons;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  reasons = self->_reasons;
  v8 = v4;
  if (!reasons)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_reasons;
    self->_reasons = v6;

    reasons = self->_reasons;
    v4 = v8;
  }
  -[NSMutableSet addObject:](reasons, "addObject:", v4);

}

- (id)startedFetch
{
  return objc_getProperty(self, a2, 160, 1);
}

- (void)setMailbox:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void)setDisplayName:(id)a3 maxCount:(unint64_t)a4
{
  void *v7;
  id v8;

  v8 = a3;
  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  objc_storeStrong((id *)&self->_displayName, a3);
  self->_maxCount = a4;
  self->_currentCount = 0;
  self->_lastTime = 0.0;
  self->_percentDone = 0.0;
  -[MFActivityMonitor userInfoForNotification](self, "userInfoForNotification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  -[MFActivityMonitor postDidChangeWithUserInfo:](self, "postDidChangeWithUserInfo:", v7);

}

- (void)postDidChangeWithUserInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("MonitoredActivityMessage"), self, v6);

    v4 = v6;
  }

}

- (id)userInfoForNotification
{
  unint64_t maxCount;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  maxCount = self->_maxCount;
  if (maxCount)
  {
    if (self->_currentCount > maxCount)
      maxCount = self->_currentCount;
    self->_maxCount = maxCount;
  }
  if (-[NSString length](self->_displayName, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_maxCount);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("MonitoredActivityMaxCount"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_currentCount);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("MonitoredActivityCurrentCount"));

    v7 = v4;
  }
  else
  {
    v7 = 0;
  }
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  return v7;
}

- (void)setDisplayName:(id)a3
{
  -[MFActivityMonitor setDisplayName:maxCount:](self, "setDisplayName:maxCount:", a3, 0);
}

- (BOOL)isActive
{
  return *((unsigned __int8 *)self + 49) >> 7;
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

- (void)_didChange
{
  id v3;

  -[MFActivityMonitor userInfoForNotification](self, "userInfoForNotification");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MFActivityMonitor postDidChangeWithUserInfo:](self, "postDidChangeWithUserInfo:");

}

- (void)setCurrentCount:(unint64_t)a3
{
  id v5;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  self->_currentCount = a3;
  -[MFActivityMonitor userInfoForNotification](self, "userInfoForNotification");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  -[MFActivityMonitor postDidChangeWithUserInfo:](self, "postDidChangeWithUserInfo:", v5);

}

- (id)_ntsThrottledUserInfoDict
{
  double Current;
  double v4;
  void *v5;

  Current = CFAbsoluteTimeGetCurrent();
  v4 = Current;
  if (self->_currentCount == self->_maxCount || Current - self->_lastTime >= 0.0333333351)
  {
    -[MFActivityMonitor userInfoForNotification](self, "userInfoForNotification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_lastTime = v4;
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setPercentDoneOfCurrentItem:(double)a3
{
  id v4;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock", a3);
  -[MFActivityMonitor _ntsThrottledUserInfoDict](self, "_ntsThrottledUserInfoDict");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  if (v4)
    -[MFActivityMonitor postDidChangeWithUserInfo:](self, "postDidChangeWithUserInfo:", v4);

}

- (void)setGotNewMessagesState:(unint64_t)a3
{
  if (self->_gotNewMessagesState < a3)
    self->_gotNewMessagesState = a3;
}

- (id)reasons
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", self->_reasons);
}

- (void)setStatusMessage:(id)a3 percentDone:(double)a4
{
  -[MFActivityMonitor setStatusMessage:percentDone:withKey:](self, "setStatusMessage:percentDone:withKey:", a3, 0, a4);
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

- (BOOL)canBeCancelled
{
  return (*((unsigned __int8 *)self + 49) >> 5) & 1;
}

- (void)setShouldCancel:(BOOL)a3
{
  void *v4;
  void *v5;
  MFActivityMonitor *v6;
  NSObject *v7;
  NSThread *v8;
  uint8_t v9[16];

  if ((*((_BYTE *)self + 49) & 0x20) != 0)
  {
    if (a3)
    {
      if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "threadDictionary");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D1EDD8]);
        v6 = (MFActivityMonitor *)objc_claimAutoreleasedReturnValue();

        if (v6 == self)
        {
          MFLogGeneral();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v9 = 0;
            _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_DEFAULT, "#Warning Activity monitor cancelled on the Main Thread.  Why?", v9, 2u);
          }

        }
      }
      *((_BYTE *)self + 49) |= 0x40u;
      -[MFActivityMonitor _cancelAssociatedCancelables](self, "_cancelAssociatedCancelables");
    }
    else
    {
      *((_BYTE *)self + 49) &= ~0x40u;
    }
    +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
    v8 = self->_runningThread;
    +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
    if (v8)
      -[MFActivityMonitor performSelector:onThread:withObject:waitUntilDone:](self, "performSelector:onThread:withObject:waitUntilDone:", sel_cancelMessage, v8, 0, 0);
    else
      -[MFActivityMonitor cancelMessage](self, "cancelMessage");
    -[MFActivityMonitor _didChange](self, "_didChange");

  }
}

- (void)addCancelable:(id)a3
{
  NSMutableSet *associatedCancelables;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;

  v7 = a3;
  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  associatedCancelables = self->_associatedCancelables;
  if (!associatedCancelables)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v6 = self->_associatedCancelables;
    self->_associatedCancelables = v5;

    associatedCancelables = self->_associatedCancelables;
  }
  -[NSMutableSet addObject:](associatedCancelables, "addObject:", v7);
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  if ((*((_BYTE *)self + 49) & 0x40) != 0)
    objc_msgSend(v7, "cancel");

}

- (void)removeCancelable:(id)a3
{
  id v4;

  v4 = a3;
  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  -[NSMutableSet removeObject:](self->_associatedCancelables, "removeObject:", v4);
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

+ (id)pushNewMonitor
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___MFActivityMonitor;
  objc_msgSendSuper2(&v3, sel_pushNewDesignator);
  return (id)objc_claimAutoreleasedReturnValue();
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
  if ((*((_WORD *)self + 24) & 0x1FFF) != 0)
  {
    v3 = 0;
  }
  else
  {
    *((_WORD *)self + 24) = *((_WORD *)self + 24) & 0xE000 | 1;
    v3 = 1;
  }
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  return v3;
}

- (void)relinquishExclusiveAccessKey:(int)a3
{
  int v5;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  v5 = *((unsigned __int16 *)self + 24);
  if (a3 == v5 << 19 >> 19)
    *((_WORD *)self + 24) = v5 & 0xE000;
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
}

- (void)setStatusMessage:(id)a3 percentDone:(double)a4 withKey:(int)a5
{
  uint64_t v5;
  id v8;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  -[MFActivityMonitor setStatusMessage:withKey:](self, "setStatusMessage:withKey:");
  -[MFActivityMonitor setPercentDone:withKey:](self, "setPercentDone:withKey:", v5, a4);

}

- (void)setStatusMessage:(id)a3 withKey:(int)a4
{
  void *v7;
  NSString *v8;

  v8 = (NSString *)a3;
  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  if (a4 != *((unsigned __int16 *)self + 24) << 19 >> 19 || self->_statusMessage == v8)
  {
    v7 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_statusMessage, a3);
    -[MFActivityMonitor userInfoForNotification](self, "userInfoForNotification");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  if (v7)
    -[MFActivityMonitor postDidChangeWithUserInfo:](self, "postDidChangeWithUserInfo:", v7);

}

- (void)setPercentDone:(double)a3 withKey:(int)a4
{
  double v7;
  uint64_t v8;
  id v9;

  +[MFActivityMonitor mf_lock](MFActivityMonitor, "mf_lock");
  if (a4 != *((unsigned __int16 *)self + 24) << 19 >> 19)
    goto LABEL_6;
  v7 = 1.0;
  if (a3 <= 1.0)
    v7 = a3;
  if (v7 == self->_percentDone)
  {
LABEL_6:
    v8 = 0;
  }
  else
  {
    self->_percentDone = v7;
    -[MFActivityMonitor userInfoForNotification](self, "userInfoForNotification");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (id)v8;
  +[MFActivityMonitor mf_unlock](MFActivityMonitor, "mf_unlock");
  if (v9)
    -[MFActivityMonitor postDidChangeWithUserInfo:](self, "postDidChangeWithUserInfo:", v9);

}

- (void)recordBytesRead:(unint64_t)a3
{
  self->_bytesRead += a3;
}

- (void)recordBytesWritten:(unint64_t)a3
{
  self->_bytesWritten += a3;
}

- (void)recordTransportType:(int64_t)a3
{
  int64_t transportType;
  BOOL v4;
  BOOL v5;
  BOOL v6;

  transportType = self->_transportType;
  if (transportType != a3)
  {
    v4 = transportType < a3 && transportType < 3;
    if (v4 || (transportType >= 3 ? (v5 = a3 < 3) : (v5 = 1), !v5 ? (v6 = transportType <= a3) : (v6 = 1), !v6))
      self->_transportType = a3;
  }
}

- (MFMailboxUid)mailbox
{
  return (MFMailboxUid *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)isRemoteSearch
{
  return self->_isRemoteSearch;
}

- (void)setIsRemoteSearch:(BOOL)a3
{
  self->_isRemoteSearch = a3;
}

- (int64_t)transportType
{
  return self->_transportType;
}

@end
