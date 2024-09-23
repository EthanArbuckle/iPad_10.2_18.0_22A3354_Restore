@implementation EKCalendarNotification(CUIKNotificationUtils)

- (uint64_t)cuik_shouldShowNotificationWithUnselectedCalendarsForFocus:()CUIKNotificationUtils
{
  id v4;
  void *v5;
  NSObject *v6;
  char v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a1, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[EKCalendarNotification(CUIKNotificationUtils) cuik_shouldShowNotificationWithUnselectedCalendarsForFocus:].cold.1(a1, v6);
    goto LABEL_8;
  }
  if (!objc_msgSend(v4, "count"))
  {
LABEL_9:
    v8 = 1;
    goto LABEL_10;
  }
  objc_msgSend(a1, "calendar");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "containsObject:", v6))
  {
LABEL_8:

    goto LABEL_9;
  }
  v7 = objc_msgSend(a1, "cuik_isTimeSensitive");

  if ((v7 & 1) != 0)
    goto LABEL_9;
  v8 = 0;
LABEL_10:

  return v8;
}

- (uint64_t)cuik_isTimeSensitive
{
  uint64_t v2;
  int v3;
  unint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  const char *v21;
  NSObject *v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "couldBeJunk") & 1) == 0)
  {
    v3 = objc_msgSend(a1, "isProposedNewTime");
    v4 = objc_msgSend(a1, "type");
    if (v4 >= 2)
    {
      if (v4 != 3)
      {
        if (v4 == 2)
        {
          v5 = 0;
          goto LABEL_9;
        }
        +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(a1, "objectID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543362;
          v26 = v20;
          v21 = "Notification %{public}@ is not time-sensitive because it is not an invitation, invitation response, or cancellation.";
LABEL_28:
          _os_log_impl(&dword_1B8A6A000, v6, OS_LOG_TYPE_INFO, v21, (uint8_t *)&v25, 0xCu);

          goto LABEL_29;
        }
        goto LABEL_29;
      }
      if ((v3 & 1) == 0)
      {
        +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(a1, "objectID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138543362;
          v26 = v20;
          v21 = "Notification %{public}@ is not time-sensitive because it is an invitation response but not a proposed time.";
          goto LABEL_28;
        }
LABEL_29:
        v2 = 0;
        goto LABEL_30;
      }
    }
    v5 = 1;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0C99D68], "CalSimulatedDateForNow");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "event");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "earliestOccurrenceEndingAfter:excludeSignificantDetachments:excludeCanceledDetachments:excludeDeclinedDetachments:", v6, 1, v5, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(a1, "objectID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543362;
        v26 = v17;
        _os_log_impl(&dword_1B8A6A000, v16, OS_LOG_TYPE_INFO, "Notification %{public}@ is not time-sensitive because there is no occurrence ending after now", (uint8_t *)&v25, 0xCu);

      }
      goto LABEL_18;
    }
    objc_msgSend(v9, "timeIntervalSinceDate:", v6);
    v10 = *MEMORY[0x1E0D0C4C0];
    if (v11 <= *MEMORY[0x1E0D0C4C0])
    {
      +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(a1, "objectID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543362;
        v26 = v19;
        _os_log_impl(&dword_1B8A6A000, v18, OS_LOG_TYPE_INFO, "Event %{public}@ is time-sensitive because it starts within the time-sensitive window", (uint8_t *)&v25, 0xCu);

      }
    }
    else
    {
      if (!v3)
      {
LABEL_18:
        v2 = 0;
LABEL_23:

LABEL_30:
        return v2;
      }
      v12 = a1;
      objc_msgSend(v12, "nearestProposedTime");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (!v13 || (objc_msgSend(v13, "timeIntervalSinceDate:", v6), v15 > v10))
      {

        goto LABEL_18;
      }
      +[CUIKLogSubsystem defaultCategory](CUIKLogSubsystem, "defaultCategory");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v12, "objectID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 138543362;
        v26 = v24;
        _os_log_impl(&dword_1B8A6A000, v23, OS_LOG_TYPE_INFO, "Event %{public}@ is time-sensitive because it is an attendee proposed time within the time-sensitive window", (uint8_t *)&v25, 0xCu);

      }
    }
    v2 = 1;
    goto LABEL_23;
  }
  return 0;
}

- (void)cuik_shouldShowNotificationWithUnselectedCalendarsForFocus:()CUIKNotificationUtils .cold.1(void *a1, NSObject *a2)
{
  int v3;
  void *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = objc_msgSend(a1, "type");
  _os_log_error_impl(&dword_1B8A6A000, a2, OS_LOG_TYPE_ERROR, "No calendar for notification %@ with type %d", (uint8_t *)&v3, 0x12u);
}

@end
