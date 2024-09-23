@implementation EKSourceConstraints

- (BOOL)supportsJunkReporting
{
  return (*((_QWORD *)&self->_flags + 2) >> 57) & 1;
}

- (BOOL)recurrencesShouldPinToMonthDays
{
  return (*((_QWORD *)&self->_flags + 2) >> 22) & 1;
}

- (EKSourceConstraints)initWithData:(id)a3
{
  id v4;
  EKSourceConstraints *v5;
  EKSourceConstraints *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD v16[2];
  _OWORD v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  memset(v17, 0, 28);
  if (objc_msgSend(v4, "length") == 28)
  {
    objc_msgSend(v4, "getBytes:length:", v17, 28);
    v5 = [EKSourceConstraints alloc];
    v16[0] = v17[0];
    *(_OWORD *)((char *)v16 + 12) = *(_OWORD *)((char *)v17 + 12);
    v6 = -[EKSourceConstraints initWithCDBSourceConstraintFlags:](v5, "initWithCDBSourceConstraintFlags:", v16);
  }
  else
  {
    v7 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKSourceConstraints initWithData:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    v6 = 0;
  }

  return v6;
}

- (EKSourceConstraints)initWithCDBSourceConstraintFlags:(id *)a3
{
  EKSourceConstraints *result;
  __int128 v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKSourceConstraints;
  result = -[EKSourceConstraints init](&v6, sel_init);
  if (result)
  {
    v5 = *(_OWORD *)&a3->var0;
    *(_OWORD *)&result->_flags.strictestEventPrivateValue = *(_OWORD *)&a3->var3;
    *(_OWORD *)&result->_flags.maxAlarmsAllowed = v5;
  }
  return result;
}

+ (id)allAllowSourceConstraints
{
  _OWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = xmmword_1A244A294;
  *(_OWORD *)((char *)v3 + 12) = *(__int128 *)((char *)&xmmword_1A244A294 + 12);
  return -[EKSourceConstraints initWithCDBSourceConstraintFlags:]([EKSourceConstraints alloc], "initWithCDBSourceConstraintFlags:", v3);
}

- (EKSourceConstraints)init
{
  _OWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0D0BEF0];
  *(_OWORD *)((char *)v3 + 12) = *(_OWORD *)(MEMORY[0x1E0D0BEF0] + 12);
  return -[EKSourceConstraints initWithCDBSourceConstraintFlags:](self, "initWithCDBSourceConstraintFlags:", v3);
}

- (id)serialized
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &self->_flags, 28);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBytes:length:forKey:", &self->_flags, 28, CFSTR("flags"));
}

- (EKSourceConstraints)initWithCoder:(id)a3
{
  id v4;
  char *v5;
  __int128 *v6;
  __int128 v7;
  EKSourceConstraints *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)EKSourceConstraints;
  v5 = -[EKSourceConstraints init](&v19, sel_init);
  if (!v5)
    goto LABEL_4;
  v18 = 0;
  v6 = (__int128 *)objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("flags"), &v18);
  if (v18 == 28)
  {
    v7 = *v6;
    *(_OWORD *)(v5 + 20) = *(__int128 *)((char *)v6 + 12);
    *(_OWORD *)(v5 + 8) = v7;
LABEL_4:
    v8 = v5;
    goto LABEL_8;
  }
  v9 = EKLogHandle;
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    -[EKSourceConstraints initWithData:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
  v8 = 0;
LABEL_8:

  return v8;
}

- (int)maxAlarmsAllowed
{
  return self->_flags.maxAlarmsAllowed;
}

- (void)setMaxAlarmsAllowed:(int)a3
{
  self->_flags.maxAlarmsAllowed = a3;
}

- (int)maxRecurrencesAllowed
{
  return self->_flags.maxRecurrencesAllowed;
}

- (void)setMaxRecurrencesAllowed:(int)a3
{
  self->_flags.maxRecurrencesAllowed = a3;
}

- (unsigned)externalDataFormat
{
  return self->_flags.externalDataFormat;
}

- (void)setExternalDataFormat:(unsigned int)a3
{
  self->_flags.externalDataFormat = a3;
}

- (int)strictestEventPrivateValue
{
  return self->_flags.strictestEventPrivateValue;
}

- (void)setStrictestEventPrivateValue:(int)a3
{
  self->_flags.strictestEventPrivateValue = a3;
}

- (BOOL)isLocalStore
{
  return *((_DWORD *)&self->_flags + 4) & 1;
}

- (void)setIsLocalStore:(BOOL)a3
{
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)supportsAlarmTriggerIntervals
{
  return (*((_QWORD *)&self->_flags + 2) >> 1) & 1;
}

- (void)setSupportsAlarmTriggerIntervals:(BOOL)a3
{
  uint64_t v3;

  v3 = 2;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)supportsAlarmTriggerDates
{
  return (*((_QWORD *)&self->_flags + 2) >> 2) & 1;
}

- (void)setSupportsAlarmTriggerDates:(BOOL)a3
{
  uint64_t v3;

  v3 = 4;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)supportsAlarmsTriggeringAfterStartDate
{
  return (*((_QWORD *)&self->_flags + 2) >> 3) & 1;
}

- (void)setSupportsAlarmsTriggeringAfterStartDate:(BOOL)a3
{
  uint64_t v3;

  v3 = 8;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)snoozeAlarmRequiresDetach
{
  return (*((_QWORD *)&self->_flags + 2) >> 4) & 1;
}

- (void)setSnoozeAlarmRequiresDetach:(BOOL)a3
{
  uint64_t v3;

  v3 = 16;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)organizerCanSeeAttendeeStatuses
{
  return (*((_QWORD *)&self->_flags + 2) >> 5) & 1;
}

- (void)setOrganizerCanSeeAttendeeStatuses:(BOOL)a3
{
  uint64_t v3;

  v3 = 32;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)inviteesCanSeeAttendeeStatuses
{
  return (*((_QWORD *)&self->_flags + 2) >> 6) & 1;
}

- (void)setInviteesCanSeeAttendeeStatuses:(BOOL)a3
{
  uint64_t v3;

  v3 = 64;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)statusesAreAccurate
{
  return (*((_QWORD *)&self->_flags + 2) >> 7) & 1;
}

- (void)setStatusesAreAccurate:(BOOL)a3
{
  uint64_t v3;

  v3 = 128;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)supportsIncomingInvitations
{
  return (*((_QWORD *)&self->_flags + 2) >> 8) & 1;
}

- (void)setSupportsIncomingInvitations:(BOOL)a3
{
  uint64_t v3;

  v3 = 256;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)supportsOutgoingInvitations
{
  return (*((_QWORD *)&self->_flags + 2) >> 9) & 1;
}

- (void)setSupportsOutgoingInvitations:(BOOL)a3
{
  uint64_t v3;

  v3 = 512;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)requiresOutgoingInvitationsInDefaultCalendar
{
  return (*((_QWORD *)&self->_flags + 2) >> 10) & 1;
}

- (void)setRequiresOutgoingInvitationsInDefaultCalendar:(BOOL)a3
{
  uint64_t v3;

  v3 = 1024;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)supportsInvitationModifications
{
  return (*((_QWORD *)&self->_flags + 2) >> 11) & 1;
}

- (void)setSupportsInvitationModifications:(BOOL)a3
{
  uint64_t v3;

  v3 = 2048;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)supportsEventForwarding
{
  return (*((_QWORD *)&self->_flags + 2) >> 12) & 1;
}

- (void)setSupportsEventForwarding:(BOOL)a3
{
  uint64_t v3;

  v3 = 4096;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)supportsResponseComments
{
  return (*((_QWORD *)&self->_flags + 2) >> 13) & 1;
}

- (void)setSupportsResponseComments:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)deliverySourceOrExternalIDRequiredForResponse
{
  return (*((_QWORD *)&self->_flags + 2) >> 14) & 1;
}

- (void)setDeliverySourceOrExternalIDRequiredForResponse:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)proposedStatusRequiredForResponse
{
  return (*((_QWORD *)&self->_flags + 2) >> 15) & 1;
}

- (void)setProposedStatusRequiredForResponse:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)declinedStatusChangeRequiresNoPendingStatus
{
  return (*((_QWORD *)&self->_flags + 2) >> 16) & 1;
}

- (void)setDeclinedStatusChangeRequiresNoPendingStatus:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)eventDurationConstrainedToRecurrenceInterval
{
  return (*((_QWORD *)&self->_flags + 2) >> 17) & 1;
}

- (void)setEventDurationConstrainedToRecurrenceInterval:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)occurrencesMustOccurOnSeparateDays
{
  return (*((_QWORD *)&self->_flags + 2) >> 19) & 1;
}

- (void)setOccurrencesMustOccurOnSeparateDays:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)futureStartDateLimitedToOccurrenceCacheBounds
{
  return (*((_QWORD *)&self->_flags + 2) >> 20) & 1;
}

- (void)setFutureStartDateLimitedToOccurrenceCacheBounds:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)supportsRecurrencesOnDetachedEvents
{
  return (*((_QWORD *)&self->_flags + 2) >> 21) & 1;
}

- (void)setSupportsRecurrencesOnDetachedEvents:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (void)setRecurrencesShouldPinToMonthDays:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)requiresAttendeeSearchInSingleAccount
{
  return (*((_QWORD *)&self->_flags + 2) >> 23) & 1;
}

- (void)setRequiresAttendeeSearchInSingleAccount:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)mustAcknowledgeMasterEvent
{
  return (*((_QWORD *)&self->_flags + 2) >> 24) & 1;
}

- (void)setMustAcknowledgeMasterEvent:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)canSetAvailability
{
  return (*((_QWORD *)&self->_flags + 2) >> 25) & 1;
}

- (void)setCanSetAvailability:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)eventAvailabilityLimited
{
  return (*((_QWORD *)&self->_flags + 2) >> 26) & 1;
}

- (void)setEventAvailabilityLimited:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)requiresMSFormattedUID
{
  return (*((_QWORD *)&self->_flags + 2) >> 27) & 1;
}

- (void)setRequiresMSFormattedUID:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)shouldCancelDeletedEvents
{
  return (*((_QWORD *)&self->_flags + 2) >> 28) & 1;
}

- (void)setShouldCancelDeletedEvents:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)shouldDeclineDeletedInvitations
{
  return (*((_QWORD *)&self->_flags + 2) >> 29) & 1;
}

- (void)setShouldDeclineDeletedInvitations:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)supportsStructuredLocations
{
  return (*((_QWORD *)&self->_flags + 2) >> 30) & 1;
}

- (void)setSupportsStructuredLocations:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)supportsReminderActions
{
  return (*((_QWORD *)&self->_flags + 2) >> 31) & 1;
}

- (void)setSupportsReminderActions:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)supportsReminderLocations
{
  return HIDWORD(*((_QWORD *)&self->_flags + 2)) & 1;
}

- (void)setSupportsReminderLocations:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (BOOL)supportsAlarmProximity
{
  return (*((_QWORD *)&self->_flags + 2) >> 33) & 1;
}

- (void)setSupportsAlarmProximity:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)allowsCalendarAddDeleteModify
{
  return (*((_QWORD *)&self->_flags + 2) >> 34) & 1;
}

- (void)setAllowsCalendarAddDeleteModify:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)allowsTasks
{
  return (*((_QWORD *)&self->_flags + 2) >> 35) & 1;
}

- (void)setAllowsTasks:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)allowsEvents
{
  return (*((_QWORD *)&self->_flags + 2) >> 36) & 1;
}

- (void)setAllowsEvents:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (BOOL)supportsURLField
{
  return (*((_QWORD *)&self->_flags + 2) >> 37) & 1;
}

- (void)setSupportsURLField:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)supportsAllDayDueDates
{
  return (*((_QWORD *)&self->_flags + 2) >> 38) & 1;
}

- (void)setSupportsAllDayDueDates:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)supportsSharedCalendars
{
  return (*((_QWORD *)&self->_flags + 2) >> 39) & 1;
}

- (void)setSupportsSharedCalendars:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (BOOL)isFacebook
{
  return (*((_QWORD *)&self->_flags + 2) >> 40) & 1;
}

- (void)setIsFacebook:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)recurrenceSeriesMustIncludeMoreThanFirstOccurrence
{
  return (*((_QWORD *)&self->_flags + 2) >> 41) & 1;
}

- (void)setRecurrenceSeriesMustIncludeMoreThanFirstOccurrence:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)supportsPrivateEvents
{
  return (*((_QWORD *)&self->_flags + 2) >> 42) & 1;
}

- (void)setSupportsPrivateEvents:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)prohibitsPrivateEventsWithAttendees
{
  return (*((_QWORD *)&self->_flags + 2) >> 43) & 1;
}

- (void)setProhibitsPrivateEventsWithAttendees:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)supportsAvailabilityRequests
{
  return (*((_QWORD *)&self->_flags + 2) >> 44) & 1;
}

- (void)setSupportsAvailabilityRequests:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (BOOL)supportsIgnoringEventsInAvailabilityRequests
{
  return (*((_QWORD *)&self->_flags + 2) >> 45) & 1;
}

- (void)setSupportsIgnoringEventsInAvailabilityRequests:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)supportsLocationDirectorySearches
{
  return (*((_QWORD *)&self->_flags + 2) >> 46) & 1;
}

- (void)setSupportsLocationDirectorySearches:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)requiresSamePrivacyLevelAcrossRecurrenceSeries
{
  return (*((_QWORD *)&self->_flags + 2) >> 47) & 1;
}

- (void)setRequiresSamePrivacyLevelAcrossRecurrenceSeries:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (BOOL)supportsInboxAvailability
{
  return HIWORD(*((_QWORD *)&self->_flags + 2)) & 1;
}

- (void)setSupportsInboxAvailability:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (BOOL)prohibitsMultipleMonthsInYearlyRecurrence
{
  return (*((_QWORD *)&self->_flags + 2) >> 49) & 1;
}

- (void)setProhibitsMultipleMonthsInYearlyRecurrence:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFDFFFFFFFFFFFFLL | v3;
}

- (BOOL)prohibitsMultipleDaysInMonthlyRecurrence
{
  return (*((_QWORD *)&self->_flags + 2) >> 50) & 1;
}

- (void)setProhibitsMultipleDaysInMonthlyRecurrence:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (BOOL)prohibitsYearlyRecurrenceInterval
{
  return (*((_QWORD *)&self->_flags + 2) >> 51) & 1;
}

- (void)setProhibitsYearlyRecurrenceInterval:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x8000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFF7FFFFFFFFFFFFLL | v3;
}

- (BOOL)requiresOccurrencesConformToRecurrenceRule
{
  return (*((_QWORD *)&self->_flags + 2) >> 52) & 1;
}

- (void)setRequiresOccurrencesConformToRecurrenceRule:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x10000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (BOOL)prohibitsDetachmentOnCommentChange
{
  return (*((_QWORD *)&self->_flags + 2) >> 53) & 1;
}

- (void)setProhibitsDetachmentOnCommentChange:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x20000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (BOOL)allowsProposeNewTime
{
  return (*((_QWORD *)&self->_flags + 2) >> 54) & 1;
}

- (void)setAllowsProposeNewTime:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x40000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFFBFFFFFFFFFFFFFLL | v3;
}

- (BOOL)prohibitsICSImport
{
  return (*((_QWORD *)&self->_flags + 2) >> 55) & 1;
}

- (void)setProhibitsICSImport:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x80000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (BOOL)supportsAutoGeocodingStructuredLocations
{
  return HIBYTE(*((_QWORD *)&self->_flags + 2)) & 1;
}

- (void)setSupportsAutoGeocodingStructuredLocations:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x100000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (void)setSupportsJunkReporting:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x200000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFDFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)supportsPhoneNumbers
{
  return (*((_QWORD *)&self->_flags + 2) >> 58) & 1;
}

- (void)setSupportsPhoneNumbers:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x400000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xFBFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)attendeesUseDeletedByOrganizerStatus
{
  return (*((_QWORD *)&self->_flags + 2) >> 59) & 1;
}

- (void)setAttendeesUseDeletedByOrganizerStatus:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x800000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xF7FFFFFFFFFFFFFFLL | v3;
}

- (BOOL)prohibitsSlicingEventsWithAttendees
{
  return (*((_QWORD *)&self->_flags + 2) >> 60) & 1;
}

- (void)setProhibitsSlicingEventsWithAttendees:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x1000000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xEFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)supportsSubscribedCalendars
{
  return (*((_QWORD *)&self->_flags + 2) >> 61) & 1;
}

- (void)setSupportsSubscribedCalendars:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x2000000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)supportsManagedSubscribedCalendars
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 7) & 1;
}

- (void)setSupportsManagedSubscribedCalendars:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 128;
  else
    v3 = 0;
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xFF7F | v3;
}

- (BOOL)supportsSubscriptionMirroring
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 8) & 1;
}

- (void)setSupportsSubscriptionMirroring:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xFEFF | v3;
}

- (BOOL)supportsParticipantRoles
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 9) & 1;
}

- (void)setSupportsParticipantRoles:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xFDFF | v3;
}

- (BOOL)supportsAttachments
{
  return (*((_QWORD *)&self->_flags + 2) >> 62) & 1;
}

- (void)setSupportsAttachments:(BOOL)a3
{
  uint64_t v3;

  v3 = 0x4000000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = *((_QWORD *)&self->_flags + 2) & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)requiresOpeningAttachmentAsLink
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 4) & 1;
}

- (void)setRequiresOpeningAttachmentAsLink:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xFFEF | v3;
}

- (BOOL)supportsClearingPrivateComments
{
  return (unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 15;
}

- (void)setSupportsClearingPrivateComments:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x8000;
  else
    v3 = 0;
  *((_WORD *)&self->_flags + 12) = v3 & 0x8000 | *((_WORD *)&self->_flags + 12) & 0x7FFF;
}

- (BOOL)shouldUseDeleteAndAddInsteadOfMoveBetweenCalendars
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 5) & 1;
}

- (void)setShouldUseDeleteAndAddInsteadOfMoveBetweenCalendars:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xFFDF | v3;
}

- (BOOL)supportsFloatingTimeZone
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 1) & 1;
}

- (void)setSupportsFloatingTimeZone:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xFFFD | v3;
}

- (BOOL)prohibitsUsingEventOrganizerEmailWhenComposingMail
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 2) & 1;
}

- (void)setProhibitsUsingEventOrganizerEmailWhenComposingMail:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xFFFB | v3;
}

- (BOOL)supportsDelegation
{
  return *((_QWORD *)&self->_flags + 2) >> 63;
}

- (void)setSupportsDelegation:(BOOL)a3
{
  unint64_t v3;

  v3 = 0x8000000000000000;
  if (!a3)
    v3 = 0;
  *((_QWORD *)&self->_flags + 2) = v3 & 0x8000000000000000 | *((_QWORD *)&self->_flags + 2) & 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)supportsDelegateEnumeration
{
  return *((_WORD *)&self->_flags + 12) & 1;
}

- (void)setSupportsDelegateEnumeration:(BOOL)a3
{
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xFFFE | a3;
}

- (BOOL)supportsInvitationModificationsWithoutNotification
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 6) & 1;
}

- (void)setSupportsInvitationModificationsWithoutNotification:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xFFBF | v3;
}

- (BOOL)supportsRecurrenceSplit
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 3) & 1;
}

- (void)setSupportsRecurrenceSplit:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xFFF7 | v3;
}

- (BOOL)supportsPush
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 10) & 1;
}

- (void)setSupportsPush:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xFBFF | v3;
}

- (BOOL)supportsTravelTime
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 11) & 1;
}

- (void)setSupportsTravelTime:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xF7FF | v3;
}

- (BOOL)requiresSeparateFilesForAllAttachments
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 12) & 1;
}

- (void)setRequiresSeparateFilesForAllAttachments:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xEFFF | v3;
}

- (BOOL)occurrenceOrderEnforcedAfterDetachment
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 13) & 1;
}

- (void)setOccurrenceOrderEnforcedAfterDetachment:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xDFFF | v3;
}

- (BOOL)allowsPrivateEventAccessByDelegate
{
  return ((unint64_t)*((unsigned __int16 *)&self->_flags + 12) >> 14) & 1;
}

- (void)setAllowsPrivateEventAccessByDelegate:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *((_WORD *)&self->_flags + 12) = *((_WORD *)&self->_flags + 12) & 0xBFFF | v3;
}

- (void)initWithData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A2318000, a1, a3, "Constraints data size is wrong. Your version of EventKit is incompatible with the running version of calaccessd.", a5, a6, a7, a8, 0);
}

@end
