@implementation SGMIBiomeReducedMessageEvents

- (SGMIBiomeReducedMessageEvents)init
{
  SGMIBiomeReducedMessageEvents *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SGMIBiomeReducedMessageEvents;
  result = -[SGMIBiomeReducedMessageEvents init](&v8, sel_init);
  if (result)
  {
    result->_scrolledToEnd = 0;
    result->_messageViewMaxDwellTime = 0.0;
    result->_messageViewTotalDwellTime = 0.0;
    result->_timeBeforeViewStartSinceAvailable = -1.0;
    result->_numberOfMoreRecentUnreadMessageAtFirstViewTime = 0;
    *(_QWORD *)&result->_messageViewCount = 0;
    result->_numberOfMailsViewedBeforeSinceAvailable = 0;
    *(_QWORD *)&result->_userReplied = 0;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&result->_firstAppLaunchFollowingFetch = _Q0;
  }
  return result;
}

- (SGMIBiomeReducedMessageEvents)initWithScrolledToEnd:(BOOL)a3 messageViewMaxDwellTime:(double)a4 messageViewTotalDwellTime:(double)a5 messageViewCount:(unsigned int)a6 timeBeforeViewStartSinceAvailable:(double)a7 numberOfMailsViewedBeforeSinceAvailable:(unsigned int)a8 userReplied:(BOOL)a9 replyDraftStarted:(BOOL)a10 forwardDraftStarted:(BOOL)a11 numberOfUnreadMessageAtFirstViewTime:(unsigned int)a12 numberOfMoreRecentUnreadMessageAtFirstViewTime:(unsigned int)a13 markedAsRead:(BOOL)a14 markedAsUnread:(BOOL)a15 markedAsJunk:(BOOL)a16 mailGotFlagged:(BOOL)a17 linkClicked:(BOOL)a18
{
  SGMIBiomeReducedMessageEvents *result;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)SGMIBiomeReducedMessageEvents;
  result = -[SGMIBiomeReducedMessageEvents init](&v33, sel_init);
  if (result)
  {
    result->_scrolledToEnd = a3;
    result->_messageViewMaxDwellTime = a4;
    result->_messageViewTotalDwellTime = a5;
    result->_timeBeforeViewStartSinceAvailable = a7;
    result->_numberOfMailsViewedBeforeSinceAvailable = a8;
    result->_messageViewCount = a6;
    result->_userReplied = a9;
    result->_replyDraftStarted = a10;
    result->_forwardDraftStarted = a11;
    result->_numberOfUnreadMessageAtFirstViewTime = a12;
    result->_numberOfMoreRecentUnreadMessageAtFirstViewTime = a13;
    result->_markedAsRead = a14;
    result->_markedAsUnread = a15;
    result->_markedAsJunk = a16;
    result->_mailGotFlagged = a17;
    result->_linkClicked = a18;
    __asm { FMOV            V0.2D, #-1.0 }
    *(_OWORD *)&result->_firstAppLaunchFollowingFetch = _Q0;
  }
  return result;
}

- (void)updateWithAppLaunchAtTime:(double)a3
{
  if (self->_messageFetchTime > 0.0 && self->_firstAppLaunchFollowingFetch < 0.0)
    self->_firstAppLaunchFollowingFetch = a3;
}

- (void)updateWithViewStartAtTime:(double)a3 unreadMessageCount:(unsigned int)a4
{
  unsigned int messageViewCount;
  double v8;

  messageViewCount = self->_messageViewCount;
  if (!messageViewCount)
  {
    -[SGMIBiomeReducedMessageEvents messageAvailableTime](self, "messageAvailableTime");
    self->_timeBeforeViewStartSinceAvailable = a3 - v8;
    self->_numberOfUnreadMessageAtFirstViewTime = a4;
    messageViewCount = self->_messageViewCount;
  }
  self->_messageViewCount = messageViewCount + 1;
}

- (void)updateWithViewEndWithPayload:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scrolled_to_end"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    self->_scrolledToEnd = 1;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("duration"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doubleValue");
  if (v6 > self->_messageViewMaxDwellTime)
  {
    objc_msgSend(v9, "doubleValue");
    self->_messageViewMaxDwellTime = v7;
  }
  objc_msgSend(v9, "doubleValue");
  self->_messageViewTotalDwellTime = v8 + self->_messageViewTotalDwellTime;

}

- (void)updateWithMessageFetchedEventAtTime:(double)a3
{
  self->_messageFetchTime = a3;
}

- (void)updateWithFlagChangedEvent
{
  self->_mailGotFlagged = 1;
}

- (void)updateWithReadChangedEventWithPayload:(id)a3
{
  BOOL v4;
  void *v5;
  uint64_t v6;
  id v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("value"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "intValue"))
  {
    v4 = objc_msgSend(v7, "intValue") == 1;
    v5 = v7;
    if (!v4)
      goto LABEL_7;
    v6 = 10;
  }
  else
  {
    v6 = 11;
    v5 = v7;
  }
  *((_BYTE *)&self->super.isa + v6) = 1;
LABEL_7:

}

- (void)updateWithMessageMovedEventWithPayload:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mailbox_type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("mailbox_type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "intValue") == 1)
      self->_markedAsJunk = 1;

    v5 = v7;
  }

}

- (void)updateWithEvent:(id)a3 eventTimestamp:(double)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  sgLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "eventName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v16;
    _os_log_debug_impl(&dword_1C3607000, v6, OS_LOG_TYPE_DEBUG, "Processing event with eventName: %@", (uint8_t *)&v17, 0xCu);

  }
  objc_msgSend(v5, "eventName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("reply_sent"));

  if ((v8 & 1) != 0)
  {
    v9 = 9;
LABEL_11:
    *((_BYTE *)&self->super.isa + v9) = 1;
    goto LABEL_12;
  }
  objc_msgSend(v5, "eventName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("reply_draft_started"));

  if ((v11 & 1) != 0)
  {
    v9 = 13;
    goto LABEL_11;
  }
  objc_msgSend(v5, "eventName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("forward_draft_started"));

  if ((v13 & 1) != 0)
  {
    v9 = 14;
    goto LABEL_11;
  }
  objc_msgSend(v5, "eventName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("link_clicked"));

  if (v15)
  {
    v9 = 16;
    goto LABEL_11;
  }
LABEL_12:

}

- (double)messageAvailableTime
{
  double result;

  result = -1.0;
  if (self->_messageFetchTime >= 0.0)
  {
    result = self->_firstAppLaunchFollowingFetch;
    if (result < 0.0)
      return self->_messageFetchTime;
  }
  return result;
}

- (void)incrementNumberOfMailsViewedBeforeSinceAvailable
{
  ++self->_numberOfMailsViewedBeforeSinceAvailable;
}

- (void)incrementNumberOfMoreRecentUnreadMessageAtFirstViewTime
{
  if (!self->_messageViewCount)
    ++self->_numberOfMoreRecentUnreadMessageAtFirstViewTime;
}

- (BOOL)scrolledToEnd
{
  return self->_scrolledToEnd;
}

- (BOOL)userReplied
{
  return self->_userReplied;
}

- (unsigned)numberOfMailsViewedBeforeSinceAvailable
{
  return self->_numberOfMailsViewedBeforeSinceAvailable;
}

- (double)timeBeforeViewStartSinceAvailable
{
  return self->_timeBeforeViewStartSinceAvailable;
}

- (unsigned)messageViewCount
{
  return self->_messageViewCount;
}

- (double)messageViewMaxDwellTime
{
  return self->_messageViewMaxDwellTime;
}

- (double)messageViewTotalDwellTime
{
  return self->_messageViewTotalDwellTime;
}

- (unsigned)numberOfUnreadMessageAtFirstViewTime
{
  return self->_numberOfUnreadMessageAtFirstViewTime;
}

- (unsigned)numberOfMoreRecentUnreadMessageAtFirstViewTime
{
  return self->_numberOfMoreRecentUnreadMessageAtFirstViewTime;
}

- (BOOL)markedAsRead
{
  return self->_markedAsRead;
}

- (BOOL)markedAsUnread
{
  return self->_markedAsUnread;
}

- (BOOL)mailGotFlagged
{
  return self->_mailGotFlagged;
}

- (BOOL)replyDraftStarted
{
  return self->_replyDraftStarted;
}

- (BOOL)forwardDraftStarted
{
  return self->_forwardDraftStarted;
}

- (BOOL)markedAsJunk
{
  return self->_markedAsJunk;
}

- (BOOL)linkClicked
{
  return self->_linkClicked;
}

- (double)firstAppLaunchFollowingFetch
{
  return self->_firstAppLaunchFollowingFetch;
}

- (double)messageFetchTime
{
  return self->_messageFetchTime;
}

@end
