@implementation GEOMessageLink

- (GEOMessageLink)initWithMessageLink:(id)a3
{
  id *v5;
  GEOMessageLink *v6;
  GEOMessageLink *v7;
  id v8;
  id *v9;
  void *v10;
  uint64_t v11;
  NSTimeZone *timeZone;
  uint64_t v13;
  NSTimeZone *v14;
  GEOMessageLink *v15;
  objc_super v17;

  v5 = (id *)a3;
  v17.receiver = self;
  v17.super_class = (Class)GEOMessageLink;
  v6 = -[GEOMessageLink init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_messageLink, a3);
    if (v5)
    {
      -[GEOPDMessageLink _readTimezone]((uint64_t)v5);
      if (v5[8])
      {
        v8 = objc_alloc(MEMORY[0x1E0C99E80]);
        -[GEOPDMessageLink timezone](v5);
        v9 = (id *)objc_claimAutoreleasedReturnValue();
        -[GEOTimezone identifier](v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v8, "initWithName:", v10);
        timeZone = v7->_timeZone;
        v7->_timeZone = (NSTimeZone *)v11;

      }
    }
    if (!v7->_timeZone)
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = v7->_timeZone;
      v7->_timeZone = (NSTimeZone *)v13;

    }
    v15 = v7;
  }

  return v7;
}

- (NSString)messageID
{
  GEOPDMessageLink *messageLink;
  void *v4;

  messageLink = self->_messageLink;
  if (messageLink && (-[GEOPDMessageLink _readMessageId]((uint64_t)self->_messageLink), messageLink->_messageId))
  {
    -[GEOPDMessageLink messageId]((id *)&self->_messageLink->super.super.isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)messageURLString
{
  GEOPDMessageLink *messageLink;
  void *v4;

  messageLink = self->_messageLink;
  if (messageLink && (-[GEOPDMessageLink _readMessageUrl]((uint64_t)self->_messageLink), messageLink->_messageUrl))
  {
    -[GEOPDMessageLink messageUrl]((id *)&self->_messageLink->super.super.isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)navBackgroundColorString
{
  GEOPDMessageLink *messageLink;
  void *v4;

  messageLink = self->_messageLink;
  if (messageLink
    && (-[GEOPDMessageLink _readNavBackgroundColor]((uint64_t)self->_messageLink), messageLink->_navBackgroundColor))
  {
    -[GEOPDMessageLink navBackgroundColor]((id *)&self->_messageLink->super.super.isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (NSString)navTintColorString
{
  GEOPDMessageLink *messageLink;
  void *v4;

  messageLink = self->_messageLink;
  if (messageLink && (-[GEOPDMessageLink _readNavTintColor]((uint64_t)self->_messageLink), messageLink->_navTintColor))
  {
    -[GEOPDMessageLink navTintColor]((id *)&self->_messageLink->super.super.isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (BOOL)isVerified
{
  GEOPDMessageLink *messageLink;

  messageLink = self->_messageLink;
  return messageLink && (*(_WORD *)&messageLink->_flags & 2) != 0 && messageLink->_isVerified;
}

- (int)responseTime
{
  GEOPDMessageLink *messageLink;

  messageLink = self->_messageLink;
  if (messageLink && (*(_WORD *)&messageLink->_flags & 1) != 0)
    return -[GEOPDMessageLink responseTime]((uint64_t)messageLink);
  else
    return 0;
}

- (id)messageBusinessHours
{
  GEOPDMessageLink *messageLink;
  void *v4;
  GEOBusinessHours *v5;
  void *v6;
  GEOBusinessHours *v7;

  messageLink = self->_messageLink;
  if (messageLink
    && (-[GEOPDMessageLink _readHoursOfOperations]((uint64_t)self->_messageLink),
        -[NSMutableArray count](messageLink->_hoursOfOperations, "count")))
  {
    -[GEOPDMessageLink hoursOfOperations]((id *)&self->_messageLink->super.super.isa);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [GEOBusinessHours alloc];
    -[GEOMessageLink timeZone](self, "timeZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[GEOBusinessHours initWithGEOPDHours:timeZone:](v5, "initWithGEOPDHours:timeZone:", v4, v6);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_messageLink, 0);
}

@end
