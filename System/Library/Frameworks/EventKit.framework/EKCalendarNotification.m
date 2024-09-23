@implementation EKCalendarNotification

- (void)setURL:(id)a3
{
  objc_storeStrong((id *)&self->_URL, a3);
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)setSource:(id)a3
{
  objc_storeStrong((id *)&self->_source, a3);
}

- (void)setRecipientName:(id)a3
{
  objc_storeStrong((id *)&self->_recipientName, a3);
}

- (void)setPhoneNumber:(id)a3
{
  objc_storeStrong((id *)&self->_phoneNumber, a3);
}

- (void)setObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_objectID, a3);
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void)setLastName:(id)a3
{
  objc_storeStrong((id *)&self->_lastName, a3);
}

- (void)setHiddenFromNotificationCenter:(BOOL)a3
{
  self->_hiddenFromNotificationCenter = a3;
}

- (void)setFirstName:(id)a3
{
  objc_storeStrong((id *)&self->_firstName, a3);
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (void)setEmailAddress:(id)a3
{
  objc_storeStrong((id *)&self->_emailAddress, a3);
}

- (void)setDotColor:(CGColor *)a3
{
  CGColor *dotColor;
  CGColor *Copy;

  dotColor = self->_dotColor;
  if (dotColor)
    CFRelease(dotColor);
  if (a3)
    Copy = CGColorCreateCopy(a3);
  else
    Copy = 0;
  self->_dotColor = Copy;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (void)setAlerted:(BOOL)a3
{
  self->_alerted = a3;
}

- (EKCalendarNotification)initWithType:(int64_t)a3
{
  EKCalendarNotification *v4;
  EKCalendarNotification *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKCalendarNotification;
  v4 = -[EKCalendarNotification init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[EKCalendarNotification setType:](v4, "setType:", a3);
  return v5;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (EKSource)source
{
  return self->_source;
}

- (void)dealloc
{
  CGColor *dotColor;
  objc_super v4;

  dotColor = self->_dotColor;
  if (dotColor)
    CFRelease(dotColor);
  v4.receiver = self;
  v4.super_class = (Class)EKCalendarNotification;
  -[EKCalendarNotification dealloc](&v4, sel_dealloc);
}

- (NSString)uniqueIdentifier
{
  void *v2;
  void *v3;

  -[EKCalendarNotification objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)needsAlert
{
  return !-[EKCalendarNotification alerted](self, "alerted");
}

- (BOOL)isSharedCalendarInvitation
{
  return 0;
}

- (BOOL)isInvitation
{
  return 0;
}

- (BOOL)acknowledgeWithEventStore:(id)a3 error:(id *)a4
{
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("EKErrorDomain"), 5, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)isProposedNewTime
{
  return 0;
}

- (BOOL)proposedStartDateIsInFutureForAttendee:(id)a3
{
  return 0;
}

- (BOOL)couldBeJunk
{
  return 0;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (NSURL)URL
{
  return self->_URL;
}

- (EKObjectID)objectID
{
  return self->_objectID;
}

- (CGColor)dotColor
{
  return self->_dotColor;
}

- (BOOL)hiddenFromNotificationCenter
{
  return self->_hiddenFromNotificationCenter;
}

- (BOOL)alerted
{
  return self->_alerted;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)recipientName
{
  return self->_recipientName;
}

- (EKCalendar)calendar
{
  return self->_calendar;
}

- (EKEvent)event
{
  return self->_event;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_recipientName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
