@implementation CUIKDefaultAlarmPreferences

- (id)defaultAlarmOffsetForAlarmType:(int)a3 sources:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a4;
  if (a3)
  {
    if (a3 == 1)
    {
      -[CUIKDefaultAlarmPreferences defaultAllDayAlarmOffset](self, "defaultAllDayAlarmOffset");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 != 2)
      {
        v8 = 0;
        goto LABEL_9;
      }
      -[CUIKDefaultAlarmPreferences defaultBirthdayAlarmOffsetForSources:](self, "defaultBirthdayAlarmOffsetForSources:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[CUIKDefaultAlarmPreferences defaultTimedAlarmOffset](self, "defaultTimedAlarmOffset");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_9:

  return v8;
}

- (void)setDefaultAlarmOffset:(id)a3 forAlarmType:(int)a4 sources:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v20;
  char v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "integerValue") == 0x7FFFFFFFFFFFFFFFLL)
  {

    v8 = 0;
  }
  switch(a4)
  {
    case 2:
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v11 = (__CFString *)v9;
      v12 = -[__CFString countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (!v12)
      {
LABEL_19:

        break;
      }
      v13 = v12;
      v14 = *(_QWORD *)v25;
LABEL_9:
      v15 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v15);
        if (objc_msgSend(v16, "sourceType") == 5)
          break;
        if (v13 == ++v15)
        {
          v13 = -[__CFString countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v13)
            goto LABEL_9;
          goto LABEL_19;
        }
      }
      objc_msgSend(v16, "setDefaultAlarmOffset:", v8);
      objc_msgSend(v16, "eventStore");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      v21 = objc_msgSend(v20, "saveSource:commit:error:", v16, 1, &v23);
      v22 = v23;

      if ((v21 & 1) == 0)
      {
        NSLog(CFSTR("An error occurred saving source %@: %@"), v16, v22);

        goto LABEL_19;
      }
      v18 = (const __CFString *)(id)*MEMORY[0x1E0D0C460];

      if (v18)
        goto LABEL_18;
      break;
    case 1:
      CalAlarmSetDefaultAllDayAlarmOffset();
      v10 = 8;
LABEL_17:
      v17 = *(Class *)((char *)&self->super.isa + v10);
      *(Class *)((char *)&self->super.isa + v10) = 0;

      v18 = CFSTR("com.apple.calendar.defaultAlarmChangedNotification");
LABEL_18:
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, v18, 0, 0, 1u);
      v11 = (__CFString *)v18;
      goto LABEL_19;
    case 0:
      CalAlarmSetDefaultTimedAlarmOffset();
      v10 = 16;
      goto LABEL_17;
  }

}

- (NSNumber)defaultTimedAlarmOffset
{
  NSNumber *defaultTimedAlarmOffset;
  void *v4;
  void *v5;
  NSNumber *v6;
  NSNumber *v7;

  defaultTimedAlarmOffset = self->_defaultTimedAlarmOffset;
  if (!defaultTimedAlarmOffset)
  {
    CalAlarmCopyDefaultTimedAlarmOffset();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0x7FFFFFFFFFFFFFFFLL);
      v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    v7 = self->_defaultTimedAlarmOffset;
    self->_defaultTimedAlarmOffset = v6;

    defaultTimedAlarmOffset = self->_defaultTimedAlarmOffset;
  }
  return defaultTimedAlarmOffset;
}

- (NSNumber)defaultAllDayAlarmOffset
{
  NSNumber *defaultAllDayAlarmOffset;
  void *v4;
  void *v5;
  NSNumber *v6;
  NSNumber *v7;

  defaultAllDayAlarmOffset = self->_defaultAllDayAlarmOffset;
  if (!defaultAllDayAlarmOffset)
  {
    CalAlarmCopyDefaultAllDayAlarmOffset();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0x7FFFFFFFFFFFFFFFLL);
      v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    }
    v7 = self->_defaultAllDayAlarmOffset;
    self->_defaultAllDayAlarmOffset = v6;

    defaultAllDayAlarmOffset = self->_defaultAllDayAlarmOffset;
  }
  return defaultAllDayAlarmOffset;
}

- (id)defaultBirthdayAlarmOffsetForSources:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v12 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
      if (objc_msgSend(v8, "sourceType", (_QWORD)v11) == 5)
        break;
      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v5)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    objc_msgSend(v8, "defaultAlarmOffset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 0x7FFFFFFFFFFFFFFFLL, (_QWORD)v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v9;
}

- (void)setDefaultAllDayAlarmOffset:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAllDayAlarmOffset, a3);
}

- (void)setDefaultTimedAlarmOffset:(id)a3
{
  objc_storeStrong((id *)&self->_defaultTimedAlarmOffset, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTimedAlarmOffset, 0);
  objc_storeStrong((id *)&self->_defaultAllDayAlarmOffset, 0);
}

@end
