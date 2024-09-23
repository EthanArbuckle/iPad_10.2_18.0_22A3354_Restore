@implementation MessageItemViewModel

- (NSDate)sendLaterDate
{
  return self->_sendLaterDate;
}

- (EMFollowUp)followUp
{
  return self->_followUp;
}

- (void)setVIP:(BOOL)a3
{
  self->_VIP = a3;
}

- (void)setUnsubscribeType:(int64_t)a3
{
  self->_unsubscribeType = a3;
}

- (void)setSendLaterDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setReplied:(BOOL)a3
{
  self->_replied = a3;
}

- (void)setReadLaterDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setRead:(BOOL)a3
{
  self->_read = a3;
}

- (void)setNotify:(BOOL)a3
{
  self->_notify = a3;
}

- (void)setMute:(BOOL)a3
{
  self->_mute = a3;
}

- (void)setHasAttachments:(BOOL)a3
{
  self->_hasAttachments = a3;
}

- (void)setForwarded:(BOOL)a3
{
  self->_forwarded = a3;
}

- (void)setFollowUp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setFlagged:(BOOL)a3
{
  self->_flagged = a3;
}

- (void)setFlagColors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setDisplayDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setBlockedSender:(BOOL)a3
{
  self->_blockedSender = a3;
}

- (NSDate)readLaterDate
{
  return self->_readLaterDate;
}

- (BOOL)isVIP
{
  return self->_VIP;
}

- (BOOL)isReplied
{
  return self->_replied;
}

- (BOOL)isRead
{
  return self->_read;
}

- (BOOL)isNotify
{
  return self->_notify;
}

- (BOOL)isMute
{
  return self->_mute;
}

- (BOOL)isForwarded
{
  return self->_forwarded;
}

- (BOOL)isFlagged
{
  return self->_flagged;
}

- (BOOL)isBlockedSender
{
  return self->_blockedSender;
}

- (BOOL)hasAttachments
{
  return self->_hasAttachments;
}

- (NSIndexSet)flagColors
{
  return self->_flagColors;
}

- (NSDate)displayDate
{
  return self->_displayDate;
}

- (NSDate)date
{
  return self->_date;
}

- (MessageItemViewModel)initWithItemBuilder:(id)a3
{
  void (**v5)(id, MessageItemViewModel *);
  MessageItemViewModel *v6;
  void *v8;
  objc_super v9;

  v5 = (void (**)(id, MessageItemViewModel *))a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MessageItemViewModel.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("builderBlock"));

  }
  v9.receiver = self;
  v9.super_class = (Class)MessageItemViewModel;
  v6 = -[MessageItemViewModel init](&v9, sel_init);
  if (v6)
    v5[2](v5, v6);

  return v6;
}

- (BOOL)isRedirected
{
  return self->_redirected;
}

- (void)setRedirected:(BOOL)a3
{
  self->_redirected = a3;
}

- (BOOL)isJunk
{
  return self->_junk;
}

- (void)setJunk:(BOOL)a3
{
  self->_junk = a3;
}

- (int64_t)unsubscribeType
{
  return self->_unsubscribeType;
}

- (BOOL)isUnscreenedSender
{
  return self->_unscreenedSender;
}

- (void)setUnscreenedSender:(BOOL)a3
{
  self->_unscreenedSender = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_followUp, 0);
  objc_storeStrong((id *)&self->_displayDate, 0);
  objc_storeStrong((id *)&self->_sendLaterDate, 0);
  objc_storeStrong((id *)&self->_readLaterDate, 0);
  objc_storeStrong((id *)&self->_flagColors, 0);
}

@end
