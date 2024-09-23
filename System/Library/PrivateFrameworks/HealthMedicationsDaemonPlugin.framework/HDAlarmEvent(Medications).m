@implementation HDAlarmEvent(Medications)

- (uint64_t)isFollowUpNotificationEvent
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v10;
  void *v11;

  objc_msgSend(a1, "eventIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "eventIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDRestorableAlarm+Medications.m"), 53, CFSTR("Invalid Event Identifier '%@' called with '%s'"), v11, "-[HDAlarmEvent(Medications) isFollowUpNotificationEvent]");

  }
  objc_msgSend(a1, "eventIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = BoolValueFromIdentifierForKey(v7, CFSTR("isFollowUp"));

  return v8;
}

- (uint64_t)isCriticalNotificationEvent
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v10;
  void *v11;

  objc_msgSend(a1, "eventIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(","));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "eventIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDRestorableAlarm+Medications.m"), 59, CFSTR("Invalid Event Identifier '%@' called with '%s'"), v11, "-[HDAlarmEvent(Medications) isCriticalNotificationEvent]");

  }
  objc_msgSend(a1, "eventIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = BoolValueFromIdentifierForKey(v7, CFSTR("isCritical"));

  return v8;
}

- (id)scheduleItemIdentifier
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  _QWORD v19[4];
  __CFString *v20;

  objc_msgSend(a1, "eventIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "eventIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsString:", CFSTR(",")))
  {

  }
  else
  {
    objc_msgSend(a1, "eventIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    if (v8 > 0.0)
    {
      v9 = v4;
      goto LABEL_8;
    }
  }
  objc_msgSend(a1, "eventIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(","));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "eventIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDRestorableAlarm+Medications.m"), 73, CFSTR("Invalid Event identifier '%@' called with '%s'"), v18, "-[HDAlarmEvent(Medications) scheduleItemIdentifier]");

  }
  objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(","));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __KeyValuePairFromIdentifierForKey_block_invoke;
  v19[3] = &unk_1E6E011C8;
  v20 = CFSTR("scheduleItemId");
  objc_msgSend(v13, "hk_firstObjectPassingTest:", v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "componentsSeparatedByString:", CFSTR(":"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lastObject");
  v9 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v9;
}

@end
