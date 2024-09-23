@implementation EKCalendarEventInvitationNotification

- (EKCalendarEventInvitationNotification)initWithEvent:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  EKCalendarEventInvitationNotification *v8;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  NSString *invitedBy;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  NSArray *attendees;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _BOOL8 v55;
  void *v56;
  EKCalendarEventInvitationNotificationAttendee *v57;
  void *v58;
  uint64_t v59;
  EKCalendarEventInvitationNotificationAttendee *owner;
  _QWORD v62[5];
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  objc_super v72;

  v4 = a3;
  v5 = objc_msgSend(v4, "status");
  if (v5 == 3)
  {
    v6 = 0;
    v7 = 2;
  }
  else if ((objc_msgSend(v4, "attendeeReplyChanged") & 1) != 0)
  {
    v6 = 1;
    v7 = 3;
  }
  else if ((objc_msgSend(v4, "dateChanged") & 1) != 0
         || (objc_msgSend(v4, "timeChanged") & 1) != 0
         || (objc_msgSend(v4, "titleChanged") & 1) != 0
         || (objc_msgSend(v4, "locationChanged") & 1) != 0
         || (objc_msgSend(v4, "videoConferenceChanged") & 1) != 0)
  {
    v6 = 0;
    v7 = 1;
  }
  else
  {
    v6 = 0;
    v7 = objc_msgSend(v4, "recurrenceChanged");
  }
  v72.receiver = self;
  v72.super_class = (Class)EKCalendarEventInvitationNotification;
  v8 = -[EKCalendarNotification initWithType:](&v72, sel_initWithType_, v7);
  if (v8)
  {
    objc_msgSend(v4, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarNotification setTitle:](v8, "setTitle:", v9);

    objc_msgSend(v4, "locationWithoutPrediction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarEventInvitationNotification setLocation:](v8, "setLocation:", v10);

    objc_msgSend(v4, "organizer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarNotification setName:](v8, "setName:", v12);

    objc_msgSend(v4, "selfAttendee");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarNotification setRecipientName:](v8, "setRecipientName:", v14);

    objc_msgSend(v4, "organizer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarNotification setFirstName:](v8, "setFirstName:", v16);

    objc_msgSend(v4, "organizer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarNotification setLastName:](v8, "setLastName:", v18);

    objc_msgSend(v4, "organizer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "emailAddress");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarNotification setEmailAddress:](v8, "setEmailAddress:", v20);

    objc_msgSend(v4, "organizer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "phoneNumber");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarNotification setPhoneNumber:](v8, "setPhoneNumber:", v22);

    -[EKCalendarNotification setHiddenFromNotificationCenter:](v8, "setHiddenFromNotificationCenter:", objc_msgSend(v4, "invitationStatus") == 1);
    objc_msgSend(v4, "calendar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarNotification setDotColor:](v8, "setDotColor:", objc_msgSend(v23, "CGColor"));

    -[EKCalendarNotification setAlerted:](v8, "setAlerted:", objc_msgSend(v4, "invitationStatus") != 3);
    objc_msgSend(v4, "calendar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "source");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarNotification setSource:](v8, "setSource:", v25);

    objc_msgSend(v4, "objectID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarNotification setObjectID:](v8, "setObjectID:", v26);

    objc_msgSend(v4, "externalURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarNotification setURL:](v8, "setURL:", v27);

    -[EKCalendarEventInvitationNotification setStatus:](v8, "setStatus:", objc_msgSend(v4, "status"));
    objc_msgSend(v4, "startDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarEventInvitationNotification setStartDate:](v8, "setStartDate:", v28);

    objc_msgSend(MEMORY[0x1E0C99D68], "CalSimulatedDateForNow");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "earliestOccurrenceEndingAfter:excludeSignificantDetachments:excludeCanceledDetachments:excludeDeclinedDetachments:", v29, 1, v5 != 3, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "startDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarEventInvitationNotification setStartDateForNextOccurrence:](v8, "setStartDateForNextOccurrence:", v31);

    objc_msgSend(v4, "endDateUnadjustedForLegacyClients");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarEventInvitationNotification setEndDate:](v8, "setEndDate:", v32);

    -[EKCalendarEventInvitationNotification setAllDay:](v8, "setAllDay:", objc_msgSend(v4, "isAllDay"));
    objc_msgSend(v4, "timeZone");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarEventInvitationNotification setTimeZone:](v8, "setTimeZone:", v33);

    objc_msgSend(v4, "recurrenceRules");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarEventInvitationNotification setRecurrenceRule:](v8, "setRecurrenceRule:", v35);

    objc_msgSend(v4, "participationStatusModifiedDate");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarEventInvitationNotification setParticipationStatusModifiedDate:](v8, "setParticipationStatusModifiedDate:", v36);

    -[EKCalendarEventInvitationNotification setParticipationStatus:](v8, "setParticipationStatus:", objc_msgSend(v4, "participationStatus"));
    -[EKCalendarEventInvitationNotification setTimeChanged:](v8, "setTimeChanged:", objc_msgSend(v4, "timeChanged"));
    -[EKCalendarEventInvitationNotification setDateChanged:](v8, "setDateChanged:", objc_msgSend(v4, "dateChanged"));
    -[EKCalendarEventInvitationNotification setTitleChanged:](v8, "setTitleChanged:", objc_msgSend(v4, "titleChanged"));
    -[EKCalendarEventInvitationNotification setLocationChanged:](v8, "setLocationChanged:", objc_msgSend(v4, "locationChanged"));
    -[EKCalendarEventInvitationNotification setVideoConferenceChanged:](v8, "setVideoConferenceChanged:", objc_msgSend(v4, "videoConferenceChanged"));
    -[EKCalendarEventInvitationNotification setRecurrenceChanged:](v8, "setRecurrenceChanged:", objc_msgSend(v4, "recurrenceChanged"));
    -[EKCalendarEventInvitationNotification setAttendeeReplyChanged:](v8, "setAttendeeReplyChanged:", objc_msgSend(v4, "attendeeReplyChanged"));
    -[EKCalendarNotification setEvent:](v8, "setEvent:", v4);
    objc_msgSend(v4, "calendar");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendarNotification setCalendar:](v8, "setCalendar:", v37);

    objc_msgSend(v4, "selfAttendee");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "inviterNameString");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "length");

    if (v40)
    {
      objc_msgSend(v4, "selfAttendee");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "inviterNameString");
      v42 = objc_claimAutoreleasedReturnValue();
      invitedBy = v8->_invitedBy;
      v8->_invitedBy = (NSString *)v42;

    }
    if (v6)
    {
      v44 = (void *)objc_opt_new();
      objc_msgSend(v4, "attendees");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = MEMORY[0x1E0C809B0];
      v69[0] = MEMORY[0x1E0C809B0];
      v69[1] = 3221225472;
      v69[2] = __55__EKCalendarEventInvitationNotification_initWithEvent___block_invoke;
      v69[3] = &unk_1E4785FD8;
      v70 = v4;
      v47 = v44;
      v71 = v47;
      objc_msgSend(v45, "enumerateObjectsUsingBlock:", v69);

      objc_storeStrong((id *)&v8->_attendees, v44);
      v63 = 0;
      v64 = &v63;
      v65 = 0x3032000000;
      v66 = __Block_byref_object_copy__9;
      v67 = __Block_byref_object_dispose__9;
      v68 = 0;
      attendees = v8->_attendees;
      v62[0] = v46;
      v62[1] = 3221225472;
      v62[2] = __55__EKCalendarEventInvitationNotification_initWithEvent___block_invoke_8;
      v62[3] = &unk_1E4786000;
      v62[4] = &v63;
      -[NSArray enumerateObjectsUsingBlock:](attendees, "enumerateObjectsUsingBlock:", v62);
      v49 = (void *)v64[5];
      if (v49)
      {
        objc_msgSend(v49, "name");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarNotification setName:](v8, "setName:", v50);

        objc_msgSend((id)v64[5], "firstName");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarNotification setFirstName:](v8, "setFirstName:", v51);

        objc_msgSend((id)v64[5], "lastName");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarNotification setLastName:](v8, "setLastName:", v52);

        objc_msgSend((id)v64[5], "emailAddress");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarNotification setEmailAddress:](v8, "setEmailAddress:", v53);

        objc_msgSend((id)v64[5], "phoneNumber");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendarNotification setPhoneNumber:](v8, "setPhoneNumber:", v54);

        v55 = objc_msgSend((id)v64[5], "participantType") == 2 && objc_msgSend((id)v64[5], "participantStatus") == 3;
        -[EKCalendarEventInvitationNotification setIsLocationDecline:](v8, "setIsLocationDecline:", v55);
      }
      _Block_object_dispose(&v63, 8);

    }
    objc_msgSend(v4, "organizer");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      v57 = [EKCalendarEventInvitationNotificationAttendee alloc];
      objc_msgSend(v4, "organizer");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      v59 = -[EKCalendarEventInvitationNotificationAttendee initWithParticipant:forEvent:](v57, "initWithParticipant:forEvent:", v58, v4);
      owner = v8->_owner;
      v8->_owner = (EKCalendarEventInvitationNotificationAttendee *)v59;

    }
  }

  return v8;
}

- (void)setVideoConferenceChanged:(BOOL)a3
{
  self->_attendeeReplyChanged = a3;
}

- (void)setTitleChanged:(BOOL)a3
{
  self->_videoConferenceChanged = a3;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (void)setTimeChanged:(BOOL)a3
{
  self->_titleChanged = a3;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (void)setStartDateForNextOccurrence:(id)a3
{
  objc_storeStrong((id *)&self->_startDateForNextOccurrence, a3);
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (void)setRecurrenceRule:(id)a3
{
  objc_storeStrong((id *)&self->_recurrenceRule, a3);
}

- (void)setRecurrenceChanged:(BOOL)a3
{
  self->_isLocationDecline = a3;
}

- (void)setParticipationStatusModifiedDate:(id)a3
{
  objc_storeStrong((id *)&self->_participationStatusModifiedDate, a3);
}

- (void)setParticipationStatus:(int64_t)a3
{
  self->_participationStatus = a3;
}

- (void)setLocationChanged:(BOOL)a3
{
  self->_recurrenceChanged = a3;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (void)setDateChanged:(BOOL)a3
{
  self->_locationChanged = a3;
}

- (void)setAttendeeReplyChanged:(BOOL)a3
{
  self->_expanded = a3;
}

- (void)setAllDay:(BOOL)a3
{
  self->_dateChanged = a3;
}

void __55__EKCalendarEventInvitationNotification_initWithEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  EKCalendarEventInvitationNotificationAttendee *v4;

  v3 = a2;
  v4 = -[EKCalendarEventInvitationNotificationAttendee initWithParticipant:forEvent:]([EKCalendarEventInvitationNotificationAttendee alloc], "initWithParticipant:forEvent:", v3, *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
}

void __55__EKCalendarEventInvitationNotification_initWithEvent___block_invoke_8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "proposedStartDateDeclined") && (objc_msgSend(v10, "isCurrentUser") & 1) != 0)
    goto LABEL_13;
  if (objc_msgSend(v10, "statusChanged") && objc_msgSend(v10, "participantStatus") == 3)
  {
LABEL_12:
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
LABEL_13:
    *a4 = 1;
    goto LABEL_14;
  }
  if (!objc_msgSend(v10, "proposedStartDateChanged"))
  {
    if (!objc_msgSend(v10, "commentChanged"))
      goto LABEL_14;
LABEL_11:
    objc_msgSend(v10, "comment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
      goto LABEL_12;
    goto LABEL_14;
  }
  objc_msgSend(v10, "proposedStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

    goto LABEL_12;
  }
  if ((objc_msgSend(v10, "commentChanged") & 1) != 0)
    goto LABEL_11;
LABEL_14:

}

- (id)eventFromEventStore:(id)a3
{
  return (id)objc_msgSend(a3, "publicObjectWithObjectID:", self->super._objectID);
}

- (id)copyWithZone:(_NSZone *)a3
{
  EKCalendarEventInvitationNotification *v4;
  void *v5;
  EKCalendarEventInvitationNotification *v6;

  v4 = [EKCalendarEventInvitationNotification alloc];
  -[EKCalendarNotification event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[EKCalendarEventInvitationNotification initWithEvent:](v4, "initWithEvent:", v5);

  return v6;
}

- (BOOL)hasRecurrenceRules
{
  void *v2;
  BOOL v3;

  -[EKCalendarEventInvitationNotification recurrenceRule](self, "recurrenceRule");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isInvitation
{
  return 1;
}

- (BOOL)needsReply
{
  void *v2;
  BOOL v3;
  void *v4;

  -[EKCalendarNotification event](self, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isSelfOrganizedInvitation") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "selfAttendee");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (objc_msgSend(v4, "rsvpRequested") & 1) != 0
      || objc_msgSend(v4, "participantStatus") == 1
      || objc_msgSend(v4, "participantStatus") == 0;

  }
  return v3;
}

- (BOOL)isProposedNewTime
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (-[EKCalendarEventInvitationNotification expanded](self, "expanded"))
  {
    -[EKCalendarEventInvitationNotification expandedProposedTimeAttendee](self, "expandedProposedTimeAttendee");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "proposedStartDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 0;
    -[EKCalendarEventInvitationNotification attendees](self, "attendees");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __58__EKCalendarEventInvitationNotification_isProposedNewTime__block_invoke;
    v8[3] = &unk_1E4786028;
    v8[4] = &v13;
    v8[5] = &v9;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

    if (*((_BYTE *)v10 + 24))
      v5 = 0;
    else
      v5 = v14[3] > 0;
    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v13, 8);
  }
  return v5;
}

void __58__EKCalendarEventInvitationNotification_isProposedNewTime__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "proposedStartDateChanged"))
  {
    objc_msgSend(v7, "proposedStartDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
      if (objc_msgSend(v7, "proposedStartDateDeclined"))
      {
        if (objc_msgSend(v7, "isCurrentUser"))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          *a4 = 1;
        }
      }
    }
  }

}

- (id)nearestProposedTime
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (-[EKCalendarEventInvitationNotification expanded](self, "expanded"))
  {
    -[EKCalendarEventInvitationNotification expandedProposedTimeAttendee](self, "expandedProposedTimeAttendee");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "proposedStartDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "CalSimulatedDateForNow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[EKCalendarEventInvitationNotification attendees](self, "attendees", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = v6;
      v4 = 0;
      v8 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v10, "proposedStartDateChanged"))
          {
            objc_msgSend(v10, "proposedStartDate");
            v11 = objc_claimAutoreleasedReturnValue();
            if (v11)
            {
              v12 = (void *)v11;
              objc_msgSend(v10, "proposedStartDate");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "isAfterDate:", v3);

              if (v14)
              {
                if ((objc_msgSend(v10, "proposedStartDateDeclined") & 1) == 0)
                {
                  if (!v4
                    || (objc_msgSend(v10, "proposedStartDate"),
                        v15 = (void *)objc_claimAutoreleasedReturnValue(),
                        v16 = objc_msgSend(v15, "isBeforeDate:", v4),
                        v15,
                        v16))
                  {
                    objc_msgSend(v10, "proposedStartDate");
                    v17 = objc_claimAutoreleasedReturnValue();

                    v4 = (void *)v17;
                  }
                }
              }
            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v7);
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

- (BOOL)proposedStartDateIsInFutureForAttendee:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C99D68];
  v4 = a3;
  objc_msgSend(v3, "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "proposedStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v6, "isAfterDate:", v5);
  return (char)v4;
}

- (BOOL)acknowledgeWithEventStore:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  id v13;

  v6 = a3;
  -[EKCalendarEventInvitationNotification eventFromEventStore:](self, "eventFromEventStore:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (-[EKCalendarNotification type](self, "type") == 3)
    {
      objc_msgSend(v7, "dismissAttendeeRepliedNotification");
    }
    else
    {
      objc_msgSend(v7, "setInvitationStatus:", 0);
      objc_msgSend(v7, "setIsAlerted:", 1);
    }
    v13 = 0;
    v9 = objc_msgSend(v6, "saveEvent:span:commit:error:", v7, 2, 1, &v13);
    v10 = v13;
    if ((v9 & 1) != 0)
      goto LABEL_12;
    v11 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      -[EKCalendarEventInvitationNotification acknowledgeWithEventStore:error:].cold.2(v11, self, (uint64_t)v10);
      if (!a4)
        goto LABEL_12;
    }
    else if (!a4)
    {
LABEL_12:

      goto LABEL_13;
    }
    *a4 = objc_retainAutorelease(v10);
    goto LABEL_12;
  }
  v8 = (void *)EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    -[EKCalendarEventInvitationNotification acknowledgeWithEventStore:error:].cold.1(v8, self);
  v9 = 1;
LABEL_13:

  return v9;
}

- (BOOL)couldBeJunk
{
  void *v2;
  char v3;

  -[EKCalendarNotification event](self, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "couldBeJunk");

  return v3;
}

- (NSString)location
{
  return self->_location;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)startDateForNextOccurrence
{
  return self->_startDateForNextOccurrence;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDate)participationStatusModifiedDate
{
  return self->_participationStatusModifiedDate;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (int64_t)participationStatus
{
  return self->_participationStatus;
}

- (int64_t)status
{
  return self->_status;
}

- (BOOL)isAllDay
{
  return self->_dateChanged;
}

- (EKRecurrenceRule)recurrenceRule
{
  return self->_recurrenceRule;
}

- (BOOL)timeChanged
{
  return self->_titleChanged;
}

- (BOOL)dateChanged
{
  return self->_locationChanged;
}

- (BOOL)titleChanged
{
  return self->_videoConferenceChanged;
}

- (BOOL)locationChanged
{
  return self->_recurrenceChanged;
}

- (BOOL)videoConferenceChanged
{
  return self->_attendeeReplyChanged;
}

- (BOOL)recurrenceChanged
{
  return self->_isLocationDecline;
}

- (BOOL)attendeeReplyChanged
{
  return self->_expanded;
}

- (NSArray)attendees
{
  return self->_attendees;
}

- (void)setAttendees:(id)a3
{
  objc_storeStrong((id *)&self->_attendees, a3);
}

- (EKCalendarEventInvitationNotificationAttendee)owner
{
  return self->_owner;
}

- (void)setOwner:(id)a3
{
  objc_storeStrong((id *)&self->_owner, a3);
}

- (NSString)invitedBy
{
  return self->_invitedBy;
}

- (BOOL)isLocationDecline
{
  return self->_isForReReply;
}

- (void)setIsLocationDecline:(BOOL)a3
{
  self->_isForReReply = a3;
}

- (EKCalendarEventInvitationNotificationAttendee)expandedProposedTimeAttendee
{
  return self->_expandedProposedTimeAttendee;
}

- (void)setExpandedProposedTimeAttendee:(id)a3
{
  objc_storeStrong((id *)&self->_expandedProposedTimeAttendee, a3);
}

- (BOOL)expanded
{
  return *(&self->_isForReReply + 1);
}

- (void)setExpanded:(BOOL)a3
{
  *(&self->_isForReReply + 1) = a3;
}

- (BOOL)isForReReply
{
  return *(&self->_isForReReply + 2);
}

- (void)setIsForReReply:(BOOL)a3
{
  *(&self->_isForReReply + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expandedProposedTimeAttendee, 0);
  objc_storeStrong((id *)&self->_invitedBy, 0);
  objc_storeStrong((id *)&self->_owner, 0);
  objc_storeStrong((id *)&self->_attendees, 0);
  objc_storeStrong((id *)&self->_recurrenceRule, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_participationStatusModifiedDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDateForNextOccurrence, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

- (void)acknowledgeWithEventStore:(void *)a1 error:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A2318000, v3, OS_LOG_TYPE_ERROR, "Failed to fetch event for attendee replied notification %{public}@ when attempting to acknowledge. Silently ignoring.", (uint8_t *)&v5, 0xCu);

}

- (void)acknowledgeWithEventStore:(uint64_t)a3 error:.cold.2(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v6;
  v9 = 2112;
  v10 = a3;
  _os_log_error_impl(&dword_1A2318000, v5, OS_LOG_TYPE_ERROR, "Failed to clear attendee replied notification %{public}@: %@", (uint8_t *)&v7, 0x16u);

}

@end
