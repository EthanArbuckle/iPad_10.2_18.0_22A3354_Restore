@implementation NSError(EventKit)

+ (id)_defaultDescriptionForCADErrorCode:()EventKit
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  EKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if ((a3 - 1001) > 0x15
    || ((0x3FFEC1u >> (a3 + 23)) & 1) == 0
    || (objc_msgSend(v4, "localizedStringForKey:value:table:", off_1E4786740[a3 - 1001], &stru_1E4789A58, 0),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v7 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_FAULT))
      +[NSError(EventKit) _defaultDescriptionForCADErrorCode:].cold.1(a3, v7);
    v6 = 0;
  }

  return v6;
}

+ (__CFString)_defaultDescriptionForEKErrorCode:()EventKit
{
  void *v4;
  void *v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  const __CFString *v10;

  EKBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = 0;
  switch(a3)
  {
    case 0:
      v7 = CFSTR("The event cannot be edited.");
      goto LABEL_53;
    case 1:
      v7 = CFSTR("No calendar has been set.");
      goto LABEL_53;
    case 2:
      v7 = CFSTR("No start date has been set.");
      goto LABEL_53;
    case 3:
      v7 = CFSTR("No end date has been set.");
      goto LABEL_53;
    case 4:
      v7 = CFSTR("The start date must be before the end date.");
      goto LABEL_53;
    case 5:
      v7 = CFSTR("An unexpected error occurred.");
      goto LABEL_53;
    case 6:
      v7 = CFSTR("The calendar is read only.");
      goto LABEL_53;
    case 7:
      v7 = CFSTR("The event is too long to repeat this often.");
      goto LABEL_53;
    case 8:
      v7 = CFSTR("The event repeats before the alert occurs.");
      goto LABEL_53;
    case 9:
      v7 = CFSTR("The event is too far in the future.");
      goto LABEL_53;
    case 10:
      v7 = CFSTR("Another instance of this event occurs on this date.");
      goto LABEL_53;
    case 11:
      v7 = CFSTR("That event does not belong to that event store.");
      goto LABEL_53;
    case 12:
      v7 = CFSTR("Invites cannot be moved to another calendar.");
      goto LABEL_53;
    case 13:
      v7 = CFSTR("An invalid span was specified.");
      goto LABEL_53;
    case 14:
      v7 = CFSTR("Calendar has no source");
      goto LABEL_53;
    case 15:
      v7 = CFSTR("That calendar may not be moved to another account.");
      goto LABEL_53;
    case 16:
      v7 = CFSTR("That calendar can not be changed or deleted.");
      goto LABEL_53;
    case 17:
      v7 = CFSTR("That account does not allow calendars to be added or removed.");
      goto LABEL_53;
    case 18:
      v7 = CFSTR("A repeating reminder must have a due date.");
      goto LABEL_53;
    case 19:
      v7 = CFSTR("Locations with geo information are not supported by this account.");
      goto LABEL_53;
    case 20:
      v7 = CFSTR("Locations for reminders are not supported by this account.");
      goto LABEL_53;
    case 21:
      v7 = CFSTR("Proximity-based alarms are not supported by this account.");
      goto LABEL_53;
    case 22:
      v7 = CFSTR("That calendar does not allow events to be added.");
      goto LABEL_53;
    case 23:
      v7 = CFSTR("That calendar does not allow reminders to be added.");
      goto LABEL_53;
    case 24:
      v7 = CFSTR("That account does not support reminders.");
      goto LABEL_53;
    case 25:
      v7 = CFSTR("That account does not support events.");
      goto LABEL_53;
    case 26:
      v8 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Priorities must be between %d and %d."), &stru_1E4789A58, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringWithFormat:", v9, 0, 9);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    case 27:
      v7 = CFSTR("This is not a valid EKEntityType.");
      goto LABEL_53;
    case 36:
      v7 = CFSTR("A reminder alarm should not contain emailAddress or urlString because these properties are unsupported");
      goto LABEL_53;
    case 37:
      v6 = CFSTR("Calendar does not match parent event");
      break;
    case 38:
      v7 = CFSTR("The privacy level field cannot be changed.");
      goto LABEL_53;
    case 39:
      v7 = CFSTR("The repeat field cannot be changed.");
      goto LABEL_53;
    case 40:
      v7 = CFSTR("Alarms cannot be changed.");
      goto LABEL_53;
    case 41:
      v7 = CFSTR("Attendees cannot be changed.");
      goto LABEL_53;
    case 42:
      v7 = CFSTR("Actions are not supported by this account.");
      goto LABEL_53;
    case 43:
      v7 = CFSTR("You can’t move events with attendees between accounts.");
      goto LABEL_53;
    case 44:
      v7 = CFSTR("The Suggested Event Calendar cannot be modified.");
      v10 = CFSTR("The Suggested Event Calendar cannot be modified.");
      goto LABEL_54;
    case 45:
    case 46:
    case 47:
      v7 = CFSTR("Choose another way to repeat this event or move it to another calendar.");
      goto LABEL_53;
    case 48:
      v7 = CFSTR("That calendar does not allow events to start outside of their recurrence patterns.");
      goto LABEL_53;
    case 60:
      v7 = CFSTR("-requestAccessToEntityType:completion: has been deprecated-calling this method is no longer allowed. Instead, use -requestFullAccessToEventsWithCompletion:, -requestWriteOnlyAccessToEventsWithCompletion:, or -requestFullAccessToRemindersWithCompletion:.");
      goto LABEL_53;
    case 61:
      v7 = CFSTR("A client with write-only access cannot move event to a new created calendar");
      goto LABEL_53;
    case 62:
      v7 = CFSTR("Cannot create calendar with limited access");
      goto LABEL_53;
    case 64:
      v7 = CFSTR("You can’t move events with attachments between accounts.");
      goto LABEL_53;
    case 65:
      v7 = CFSTR("A source must have a sourceIdentifier");
      goto LABEL_53;
    case 66:
      v7 = CFSTR("A new attachment can only be created by adding to an event and saving the event");
      goto LABEL_53;
    case 67:
      v7 = CFSTR("Cannot modify detachedItems directly");
      goto LABEL_53;
    case 71:
      v7 = CFSTR("Colors cannot be shared between source.");
      goto LABEL_53;
    case 72:
      v7 = CFSTR("Colors cannot be moved to another source.");
      goto LABEL_53;
    case 73:
      v7 = CFSTR("New colors must be created by assigning them to an event and saving the event.");
      goto LABEL_53;
    case 74:
      v7 = CFSTR("Color UUID cannot be changed");
      goto LABEL_53;
    case 75:
      v7 = CFSTR("Color identifier missing");
LABEL_53:
      v10 = &stru_1E4789A58;
LABEL_54:
      objc_msgSend(v4, "localizedStringForKey:value:table:", v7, v10, 0);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return v6;
}

+ (id)errorWithCADResult:()EventKit
{
  if ((a3 - 1001) > 0x15)
    objc_msgSend(a1, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2D98], a3, 0);
  else
    objc_msgSend(a1, "errorWithCADErrorCode:");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)errorWithCADErrorCode:()EventKit
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "_defaultDescriptionForCADErrorCode:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithCADErrorCode:description:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)errorWithCADErrorCode:()EventKit description:
{
  return objc_msgSend(a1, "errorWithDomain:code:description:underlyingError:reason:", CFSTR("EKCADErrorDomain"), a3, a4, 0, 0);
}

+ (id)errorWithEKErrorCode:()EventKit
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "_defaultDescriptionForEKErrorCode:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithEKErrorCode:description:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)errorWithEKErrorCode:()EventKit underlyingError:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "_defaultDescriptionForEKErrorCode:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "errorWithEKErrorCode:description:underlyingError:reason:", a3, v7, v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (uint64_t)errorWithEKErrorCode:()EventKit description:
{
  return objc_msgSend(a1, "errorWithEKErrorCode:description:underlyingError:reason:", a3, a4, 0, 0);
}

+ (uint64_t)errorWithEKErrorCode:()EventKit description:reason:
{
  return objc_msgSend(a1, "errorWithEKErrorCode:description:underlyingError:reason:", a3, a4, 0, a5);
}

+ (uint64_t)errorWithEKErrorCode:()EventKit description:underlyingError:reason:
{
  return objc_msgSend(a1, "errorWithDomain:code:description:underlyingError:reason:", CFSTR("EKErrorDomain"), a3, a4, a5, a6);
}

+ (id)errorWithDomain:()EventKit code:description:underlyingError:reason:
{
  id v12;
  unint64_t v13;
  id v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (v13 | v15)
  {
    v16 = (void *)objc_opt_new();
    v17 = v16;
    if (v13)
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CB2D50]);
    if (v14)
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CB3388]);
    if (v15)
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CB2D68]);
  }
  else
  {
    v17 = 0;
  }
  v18 = (void *)objc_msgSend([a1 alloc], "initWithDomain:code:userInfo:", v12, a4, v17);

  return v18;
}

+ (void)_defaultDescriptionForCADErrorCode:()EventKit .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1A2318000, a2, OS_LOG_TYPE_FAULT, "Unexpected error code given to +_defaultDescriptionForCADErrorCode: %d", (uint8_t *)v2, 8u);
}

@end
