@implementation EKCalendarEventInvitationNotificationAttendee

- (EKCalendarEventInvitationNotificationAttendee)initWithParticipant:(id)a3 forEvent:(id)a4
{
  id v6;
  id v7;
  EKCalendarEventInvitationNotificationAttendee *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSString *firstName;
  uint64_t v13;
  NSString *lastName;
  uint64_t v15;
  NSString *emailAddress;
  uint64_t v17;
  NSString *phoneNumber;
  uint64_t v19;
  NSURL *URL;
  id v21;
  uint64_t v22;
  NSString *comment;
  uint64_t v24;
  NSDate *proposedStartDate;

  v6 = a3;
  v7 = a4;
  v8 = -[EKCalendarEventInvitationNotificationAttendee init](self, "init");
  if (v8)
  {
    objc_msgSend(v6, "name");
    v9 = objc_claimAutoreleasedReturnValue();
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_msgSend(v6, "firstName");
    v11 = objc_claimAutoreleasedReturnValue();
    firstName = v8->_firstName;
    v8->_firstName = (NSString *)v11;

    objc_msgSend(v6, "lastName");
    v13 = objc_claimAutoreleasedReturnValue();
    lastName = v8->_lastName;
    v8->_lastName = (NSString *)v13;

    objc_msgSend(v6, "emailAddress");
    v15 = objc_claimAutoreleasedReturnValue();
    emailAddress = v8->_emailAddress;
    v8->_emailAddress = (NSString *)v15;

    objc_msgSend(v6, "phoneNumber");
    v17 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v8->_phoneNumber;
    v8->_phoneNumber = (NSString *)v17;

    objc_msgSend(v6, "URL");
    v19 = objc_claimAutoreleasedReturnValue();
    URL = v8->_URL;
    v8->_URL = (NSURL *)v19;

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v6;
    else
      v21 = 0;
    if (CalAlertInviteeDeclines())
      v8->_statusChanged = objc_msgSend(v21, "statusChanged");
    v8->_participantType = objc_msgSend(v6, "participantType");
    v8->_participantStatus = objc_msgSend(v6, "participantStatus");
    v8->_commentChanged = objc_msgSend(v21, "commentChanged");
    objc_msgSend(v6, "comment");
    v22 = objc_claimAutoreleasedReturnValue();
    comment = v8->_comment;
    v8->_comment = (NSString *)v22;

    v8->_proposedStartDateChanged = objc_msgSend(v21, "proposedStartDateChanged");
    objc_msgSend(v21, "proposedStartDateForEvent:", v7);
    v24 = objc_claimAutoreleasedReturnValue();
    proposedStartDate = v8->_proposedStartDate;
    v8->_proposedStartDate = (NSDate *)v24;

    v8->_proposedStartDateDeclined = objc_msgSend(v21, "proposedStartDateStatus") == 3;
    v8->_isCurrentUser = objc_msgSend(v6, "isCurrentUser");

  }
  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)lastName
{
  return self->_lastName;
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

- (BOOL)statusChanged
{
  return self->_statusChanged;
}

- (BOOL)commentChanged
{
  return self->_commentChanged;
}

- (BOOL)proposedStartDateChanged
{
  return self->_proposedStartDateChanged;
}

- (int64_t)participantType
{
  return self->_participantType;
}

- (int64_t)participantStatus
{
  return self->_participantStatus;
}

- (NSString)comment
{
  return self->_comment;
}

- (NSDate)proposedStartDate
{
  return self->_proposedStartDate;
}

- (BOOL)proposedStartDateDeclined
{
  return self->_proposedStartDateDeclined;
}

- (BOOL)isCurrentUser
{
  return self->_isCurrentUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proposedStartDate, 0);
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
