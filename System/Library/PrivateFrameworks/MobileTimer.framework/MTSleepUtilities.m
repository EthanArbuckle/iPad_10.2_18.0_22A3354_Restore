@implementation MTSleepUtilities

+ (id)alarmFromSleepOccurrence:(id)a3 scheduleEnabled:(BOOL)a4 keepOffUntilDate:(id)a5
{
  id v8;
  id v9;
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

  v8 = a3;
  v9 = a5;
  +[MTAlarm sleepAlarmWithSchedule:](MTMutableAlarm, "sleepAlarmWithSchedule:", objc_msgSend(a1, "alarmRepeatScheduleFrom:", objc_msgSend(v8, "weekdays")));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bedtimeComponents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBedtimeHour:", objc_msgSend(v11, "hour"));

  objc_msgSend(v8, "bedtimeComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBedtimeMinute:", objc_msgSend(v12, "minute"));

  objc_msgSend(v8, "wakeUpComponents");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setHour:", objc_msgSend(v13, "hour"));

  objc_msgSend(v8, "wakeUpComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMinute:", objc_msgSend(v14, "minute"));

  if (objc_msgSend(v8, "isSingleDayOverride"))
  {
    objc_msgSend(v8, "wakeUpComponents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDay:", objc_msgSend(v15, "day"));

    objc_msgSend(v8, "wakeUpComponents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMonth:", objc_msgSend(v16, "month"));

    objc_msgSend(v8, "wakeUpComponents");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setYear:", objc_msgSend(v17, "year"));

  }
  if (a4)
  {
    objc_msgSend(v8, "alarmConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEnabled:", objc_msgSend(v18, "isEnabled"));

  }
  else
  {
    objc_msgSend(v10, "setEnabled:", 0);
  }
  objc_msgSend(v8, "alarmConfiguration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "toneIdentifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alarmConfiguration");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "vibrationIdentifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alarmConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "soundVolume");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTSound toneSoundWithIdentifier:vibrationIdentifer:volume:](MTSound, "toneSoundWithIdentifier:vibrationIdentifer:volume:", v20, v22, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSound:", v25);

  objc_msgSend(v10, "setBedtimeReminder:", 0);
  objc_msgSend(v10, "setBedtimeReminderMinutes:", 0);
  objc_msgSend(v10, "setKeepOffUntilDate:", v9);

  objc_msgSend(v8, "alarmConfiguration");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAllowsSnooze:", objc_msgSend(v26, "allowsSnooze"));

  v27 = (void *)objc_msgSend(v10, "copy");
  return v27;
}

+ (unint64_t)alarmRepeatScheduleFrom:(unint64_t)a3
{
  return a3 & 0x7F;
}

@end
