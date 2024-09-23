@implementation NTKAlarmTimelineEntry

+ (id)companionModelWithDevice:(id)a3
{
  id v3;
  NTKAlarmTimelineEntry *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = -[NTKAlarmTimelineEntry initWithDevice:]([NTKAlarmTimelineEntry alloc], "initWithDevice:", v3);

  -[NTKAlarmTimelineEntry setEntryType:](v4, "setEntryType:", 4);
  NTKClockFaceLocalizedString(CFSTR("ALARMS_TITLE"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKAlarmTimelineEntry setAlarmLabel:](v4, "setAlarmLabel:", v5);

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CLKDate unmodifiedDate](NTKDate, "unmodifiedDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateBySettingHour:minute:second:ofDate:options:", 7, 0, 0, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKAlarmTimelineEntry setFireDate:](v4, "setFireDate:", v8);

  return v4;
}

- (NTKAlarmTimelineEntry)initWithDevice:(id)a3
{
  id v5;
  NTKAlarmTimelineEntry *v6;
  NTKAlarmTimelineEntry *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKAlarmTimelineEntry;
  v6 = -[NTKAlarmTimelineEntry init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_device, a3);

  return v7;
}

- (id)templateForComplicationFamily:(int64_t)a3
{
  void *v5;
  id v6;
  id v7;
  void *v8;

  v5 = 0;
  switch(a3)
  {
    case 0:
      v6 = -[NTKAlarmTimelineEntry _newSmallModularTemplate](self, "_newSmallModularTemplate");
      goto LABEL_13;
    case 1:
      v6 = -[NTKAlarmTimelineEntry _newLargeModularTemplate](self, "_newLargeModularTemplate");
      goto LABEL_13;
    case 2:
    case 6:
      v6 = -[NTKAlarmTimelineEntry _newSmallFlatUtilityTemplate](self, "_newSmallFlatUtilityTemplate");
      goto LABEL_13;
    case 3:
      v6 = -[NTKAlarmTimelineEntry _newLargeUtilityTemplate](self, "_newLargeUtilityTemplate");
      goto LABEL_13;
    case 4:
      v6 = -[NTKAlarmTimelineEntry _newCircularSmallTemplate](self, "_newCircularSmallTemplate");
      goto LABEL_13;
    case 7:
      v6 = -[NTKAlarmTimelineEntry _newExtraLargeTemplate](self, "_newExtraLargeTemplate");
      goto LABEL_13;
    case 8:
      v6 = -[NTKAlarmTimelineEntry _newSignatureCornerTemplate](self, "_newSignatureCornerTemplate");
      goto LABEL_13;
    case 9:
      v6 = -[NTKAlarmTimelineEntry _newSignatureBezelTemplate](self, "_newSignatureBezelTemplate");
      goto LABEL_13;
    case 10:
      v6 = -[NTKAlarmTimelineEntry _newSignatureCircularTemplate](self, "_newSignatureCircularTemplate");
      goto LABEL_13;
    case 11:
      v6 = -[NTKAlarmTimelineEntry _newSignatureRectangularTemplate](self, "_newSignatureRectangularTemplate");
      goto LABEL_13;
    case 12:
      v6 = -[NTKAlarmTimelineEntry _newSignatureExtraLargeCircularTemplate](self, "_newSignatureExtraLargeCircularTemplate");
LABEL_13:
      v5 = v6;
      break;
    default:
      break;
  }
  if (*MEMORY[0x1E0C93E90] == a3)
  {
    v7 = -[NTKAlarmTimelineEntry _newCircularMediumTemplate](self, "_newCircularMediumTemplate");

    v5 = v7;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v8);

  return v5;
}

- (id)_newSmallModularTemplate
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  switch(-[NTKAlarmTimelineEntry entryType](self, "entryType"))
  {
    case 0uLL:
      -[NTKAlarmTimelineEntry _modularSmallAlarmInactiveImageProvider](self, "_modularSmallAlarmInactiveImageProvider");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0C94530];
      v5 = CFSTR("UNKNOWN_TIME");
      v6 = CFSTR("‒‒:‒‒");
      goto LABEL_6;
    case 1uLL:
    case 3uLL:
      -[NTKAlarmTimelineEntry _modularSmallAlarmInactiveImageProvider](self, "_modularSmallAlarmInactiveImageProvider");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0C94530];
      v5 = CFSTR("ALARMS_NONE_SMALL");
      v6 = CFSTR("NONE");
      goto LABEL_6;
    case 2uLL:
      -[NTKAlarmTimelineEntry _modularSmallAlarmInactiveImageProvider](self, "_modularSmallAlarmInactiveImageProvider");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0C94530];
      v5 = CFSTR("ALARMS_OFF_SMALL");
      v6 = CFSTR("OFF");
LABEL_6:
      NTKClockFaceLocalizedString(v5, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "textProviderWithText:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 4uLL:
      if (-[NTKAlarmTimelineEntry _pairedDeviceSupportsComplicationSymbols](self, "_pairedDeviceSupportsComplicationSymbols"))
      {
        objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", CFSTR("alarm.waves.left.and.right.fill"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = (void *)MEMORY[0x1E0C944E8];
        NTKImageNamed(CFSTR("modularAlarmActive"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "imageProviderWithOnePieceImage:", v14);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTintColor:", v15);

      -[NTKAlarmTimelineEntry _activeStateTimeTextProvider](self, "_activeStateTimeTextProvider");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 5uLL:
      if (-[NTKAlarmTimelineEntry _pairedDeviceSupportsComplicationSymbols](self, "_pairedDeviceSupportsComplicationSymbols"))
      {
        objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", CFSTR("zzz"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = (void *)MEMORY[0x1E0C944E8];
        NTKImageNamed(CFSTR("modularAlarmSnoozing"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "imageProviderWithOnePieceImage:", v10);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTintColor:", v11);

      -[NTKAlarmTimelineEntry _snoozeStateDateTextProvider](self, "_snoozeStateDateTextProvider");
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v7 = (void *)v12;
      break;
    default:
      v3 = 0;
      v7 = 0;
      break;
  }
  objc_msgSend(MEMORY[0x1E0C94448], "templateWithLine1ImageProvider:line2TextProvider:", v3, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_newLargeModularTemplate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;

  switch(-[NTKAlarmTimelineEntry entryType](self, "entryType"))
  {
    case 0uLL:
      v3 = (void *)MEMORY[0x1E0C94530];
      NTKClockFaceLocalizedString(CFSTR("ALARMS_TITLE"), CFSTR("Alarm"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "textProviderWithText:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = (void *)MEMORY[0x1E0C94530];
      NTKClockFaceLocalizedString(CFSTR("UNKNOWN_TIME"), CFSTR("‒‒:‒‒"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "textProviderWithText:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 1uLL:
      v9 = (void *)MEMORY[0x1E0C94530];
      NTKClockFaceLocalizedString(CFSTR("ALARMS_TITLE"), CFSTR("Alarm"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textProviderWithText:", v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x1E0C94530];
      v12 = CFSTR("ALARMS_NONE_LARGE");
      v13 = CFSTR("No Alarms");
      goto LABEL_7;
    case 2uLL:
      v14 = (void *)MEMORY[0x1E0C94530];
      NTKClockFaceLocalizedString(CFSTR("ALARMS_TITLE"), CFSTR("Alarm"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "textProviderWithText:", v15);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x1E0C94530];
      v12 = CFSTR("ALARMS_OFF_LARGE");
      v13 = CFSTR("All alarms off");
      goto LABEL_7;
    case 3uLL:
      v16 = (void *)MEMORY[0x1E0C94530];
      NTKClockFaceLocalizedString(CFSTR("ALARMS_TITLE"), CFSTR("Alarm"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "textProviderWithText:", v17);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)MEMORY[0x1E0C94530];
      v12 = CFSTR("ALARMS_NOT_UPCOMING_LARGE");
      v13 = CFSTR("None upcoming");
LABEL_7:
      NTKClockFaceLocalizedString(v12, v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "textProviderWithText:", v18);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C943F8], "templateWithHeaderTextProvider:body1TextProvider:", v5, v8);
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 4uLL:
      v20 = (void *)MEMORY[0x1E0C94530];
      NTKClockFaceLocalizedString(CFSTR("ALARMS_TITLE"), CFSTR("Alarm"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "textProviderWithText:", v21);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[NTKAlarmTimelineEntry _activeStateTimeTextProvider](self, "_activeStateTimeTextProvider");
      v22 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 5uLL:
      v23 = (void *)MEMORY[0x1E0C94530];
      NTKClockFaceLocalizedString(CFSTR("ALARMS_SNOOZE"), CFSTR("Snooze"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "textProviderWithText:", v24);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[NTKAlarmTimelineEntry _snoozeStateDateTextProvider](self, "_snoozeStateDateTextProvider");
      v22 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v8 = (void *)v22;
      break;
    default:
      v5 = 0;
      v8 = 0;
      break;
  }
  objc_msgSend(MEMORY[0x1E0C94408], "templateWithHeaderTextProvider:bodyTextProvider:", v5, v8);
  v19 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v25 = (void *)v19;

  return v25;
}

- (id)_circularTemplateForAlarm:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  id v5;
  void *v6;
  BOOL v7;
  void *v9;
  void *v10;
  void **v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v17;
  id v18;
  __int16 v19;

  v3 = a3;
  v19 = 0;
  v17 = 0;
  v18 = 0;
  -[NTKAlarmTimelineEntry _makeAlarmStackTextTimeProvider:designatorProvider:designatorExists:designatorLeads:](self, "_makeAlarmStackTextTimeProvider:designatorProvider:designatorExists:designatorLeads:", &v18, &v17, (char *)&v19 + 1, &v19);
  v4 = v18;
  v5 = v17;
  v6 = v5;
  if (HIBYTE(v19))
    v7 = v4 == 0;
  else
    v7 = 1;
  if (v7 || v5 == 0)
  {
    if (v3)
      v9 = (void *)MEMORY[0x1E0C94188];
    else
      v9 = (void *)MEMORY[0x1E0C941C8];
    objc_msgSend(v9, "templateWithTextProvider:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((_BYTE)v19)
      v10 = v5;
    else
      v10 = v4;
    v11 = (void **)0x1E0C94198;
    if ((_BYTE)v19)
      v12 = v4;
    else
      v12 = v5;
    if (!v3)
      v11 = (void **)0x1E0C941D8;
    v13 = *v11;
    v14 = v10;
    objc_msgSend(v13, "templateWithLine1TextProvider:line2TextProvider:", v14, v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (void)_makeAlarmStackTextTimeProvider:(id *)a3 designatorProvider:(id *)a4 designatorExists:(BOOL *)a5 designatorLeads:(BOOL *)a6
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;

  v18 = (id)objc_opt_new();
  -[NTKAlarmTimelineEntry fireDate](self, "fireDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setOverrideDate:", v11);

  objc_msgSend(v18, "_setUseNarrowDesignatorTextForGerman:", 1);
  if (a3)
  {
    v12 = (void *)MEMORY[0x1E0C94530];
    objc_msgSend(v18, "timeText");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "textProviderWithText:", v13);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (a4)
  {
    v14 = (void *)MEMORY[0x1E0C94530];
    objc_msgSend(v18, "designatorText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "textProviderWithText:", v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v16 = v18;
  if (a5)
  {
    *a5 = objc_msgSend(v18, "timeAndDesignatorTextHasDesignator");
    v16 = v18;
  }
  if (a6)
  {
    v17 = objc_msgSend(v16, "timeAndDesignatorTextHasDesignator");
    if (v17)
      LOBYTE(v17) = objc_msgSend(v18, "timeAndDesignatorTextStartsWithDesignator");
    *a6 = v17;
    v16 = v18;
  }

}

- (id)_newCircularSmallTemplate
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = -[NTKAlarmTimelineEntry entryType](self, "entryType");
  if (v3 >= 4)
  {
    if (v3 == 5)
    {
      if (-[NTKAlarmTimelineEntry _pairedDeviceSupportsComplicationSymbols](self, "_pairedDeviceSupportsComplicationSymbols"))
      {
        objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", CFSTR("zzz"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = (void *)MEMORY[0x1E0C944E8];
        NTKImageNamed(CFSTR("colorAnalogAlarmSnooze"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "imageProviderWithOnePieceImage:", v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTintColor:", v13);

      -[NTKAlarmTimelineEntry _snoozeStateDateTextProvider](self, "_snoozeStateDateTextProvider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C941D0], "templateWithLine1ImageProvider:line2TextProvider:", v10, v14);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (v3 == 4)
    {
      -[NTKAlarmTimelineEntry _circularTemplateForAlarm:](self, "_circularTemplateForAlarm:", 0);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (-[NTKAlarmTimelineEntry _pairedDeviceSupportsComplicationSymbols](self, "_pairedDeviceSupportsComplicationSymbols"))
    {
      objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", CFSTR("alarm"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0C944E8];
      NTKImageNamed(CFSTR("colorAnalogAlarm"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageProviderWithOnePieceImage:", v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTintColor:", v8);

    objc_msgSend(MEMORY[0x1E0C941C0], "templateWithImageProvider:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_newCircularMediumTemplate
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = -[NTKAlarmTimelineEntry entryType](self, "entryType");
  if (v3 >= 4)
  {
    if (v3 == 5)
    {
      if (-[NTKAlarmTimelineEntry _pairedDeviceSupportsComplicationSymbols](self, "_pairedDeviceSupportsComplicationSymbols"))
      {
        objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", CFSTR("zzz"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = (void *)MEMORY[0x1E0C944E8];
        NTKImageNamed(CFSTR("victoryNTKAlarmSnooze"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "imageProviderWithOnePieceImage:", v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTintColor:", v15);

      -[NTKAlarmTimelineEntry _snoozeStateDateTextProvider](self, "_snoozeStateDateTextProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94190], "templateWithLine1ImageProvider:line2TextProvider:", v12, v16);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (v3 == 4)
    {
      -[NTKAlarmTimelineEntry _circularTemplateForAlarm:](self, "_circularTemplateForAlarm:", 1);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    if (-[NTKAlarmTimelineEntry _pairedDeviceSupportsComplicationSymbols](self, "_pairedDeviceSupportsComplicationSymbols"))
    {
      objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", CFSTR("alarm"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0C944E8];
      NTKImageNamed(CFSTR("victoryNTKAlarm"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NTKImageNamed(CFSTR("victoryNTKAlarmBackground"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NTKImageNamed(CFSTR("victoryNTKAlarmForeground"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageProviderWithOnePieceImage:twoPieceImageBackground:twoPieceImageForeground:", v7, v8, v9);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTintColor:", v10);

    objc_msgSend(MEMORY[0x1E0C94180], "templateWithImageProvider:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_newSmallFlatUtilityTemplate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
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
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  switch(-[NTKAlarmTimelineEntry entryType](self, "entryType"))
  {
    case 0uLL:
      if (-[NTKAlarmTimelineEntry _pairedDeviceSupportsComplicationSymbols](self, "_pairedDeviceSupportsComplicationSymbols"))
      {
        objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", CFSTR("alarm"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = (void *)MEMORY[0x1E0C944E8];
        NTKImageNamed(CFSTR("analogAlarmInactive"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "imageProviderWithOnePieceImage:", v8);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTintColor:", v9);

      v10 = (void *)MEMORY[0x1E0C94530];
      v11 = CFSTR("UNKNOWN_TIME");
      v12 = CFSTR("‒‒:‒‒");
      goto LABEL_22;
    case 1uLL:
      if (-[NTKAlarmTimelineEntry _pairedDeviceSupportsComplicationSymbols](self, "_pairedDeviceSupportsComplicationSymbols"))
      {
        goto LABEL_9;
      }
      v4 = (void *)MEMORY[0x1E0C944E8];
      NTKImageNamed(CFSTR("analogAlarmInactive"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "imageProviderWithOnePieceImage:", v5);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 2uLL:
      if (-[NTKAlarmTimelineEntry _pairedDeviceSupportsComplicationSymbols](self, "_pairedDeviceSupportsComplicationSymbols"))
      {
        objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", CFSTR("alarm"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = (void *)MEMORY[0x1E0C944E8];
        NTKImageNamed(CFSTR("analogAlarmInactive"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        NTKImageNamed(CFSTR("analogAlarmInactiveBackground"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        NTKImageNamed(CFSTR("analogAlarmInactiveForeground"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "imageProviderWithOnePieceImage:twoPieceImageBackground:twoPieceImageForeground:", v14, v15, v16);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTintColor:", v17);

      v10 = (void *)MEMORY[0x1E0C94530];
      v11 = CFSTR("ALARMS_OFF_SMALL");
      v12 = CFSTR("OFF");
      goto LABEL_22;
    case 3uLL:
      if (-[NTKAlarmTimelineEntry _pairedDeviceSupportsComplicationSymbols](self, "_pairedDeviceSupportsComplicationSymbols"))
      {
LABEL_9:
        objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", CFSTR("alarm"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = (void *)MEMORY[0x1E0C944E8];
        NTKImageNamed(CFSTR("analogAlarmInactive"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        NTKImageNamed(CFSTR("analogAlarmInactiveBackground"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        NTKImageNamed(CFSTR("analogAlarmInactiveForeground"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "imageProviderWithOnePieceImage:twoPieceImageBackground:twoPieceImageForeground:", v5, v19, v20);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
      }
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTintColor:", v21);

      v10 = (void *)MEMORY[0x1E0C94530];
      v11 = CFSTR("ALARMS_NONE_SMALL");
      v12 = CFSTR("NONE");
LABEL_22:
      NTKClockFaceLocalizedString(v11, v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textProviderWithText:", v22);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 4uLL:
      if (-[NTKAlarmTimelineEntry _pairedDeviceSupportsComplicationSymbols](self, "_pairedDeviceSupportsComplicationSymbols"))
      {
        objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", CFSTR("alarm.waves.left.and.right.fill"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = (void *)MEMORY[0x1E0C944E8];
        NTKImageNamed(CFSTR("analogAlarmActive"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "imageProviderWithOnePieceImage:", v24);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTintColor:", v25);

      -[NTKAlarmTimelineEntry _activeStateTimeTextProvider](self, "_activeStateTimeTextProvider");
      v26 = objc_claimAutoreleasedReturnValue();
      goto LABEL_27;
    case 5uLL:
      if (-[NTKAlarmTimelineEntry _pairedDeviceSupportsComplicationSymbols](self, "_pairedDeviceSupportsComplicationSymbols"))
      {
        objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", CFSTR("zzz"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v27 = (void *)MEMORY[0x1E0C944E8];
        NTKImageNamed(CFSTR("analogAlarmSnooze"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "imageProviderWithOnePieceImage:", v28);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTintColor:", v29);

      -[NTKAlarmTimelineEntry _snoozeStateDateTextProvider](self, "_snoozeStateDateTextProvider");
      v26 = objc_claimAutoreleasedReturnValue();
LABEL_27:
      v6 = (void *)v26;
      break;
    default:
      v3 = 0;
      v6 = 0;
      break;
  }
  objc_msgSend(MEMORY[0x1E0C94468], "templateWithTextProvider:imageProvider:", v6, v3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)_newLargeUtilityTemplate
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  switch(-[NTKAlarmTimelineEntry entryType](self, "entryType"))
  {
    case 0uLL:
      -[NTKAlarmTimelineEntry _largeUtilityInactiveImageProvider](self, "_largeUtilityInactiveImageProvider");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0C94530];
      v5 = CFSTR("UNKNOWN_TIME");
      v6 = CFSTR("‒‒:‒‒");
      goto LABEL_6;
    case 1uLL:
      -[NTKAlarmTimelineEntry _largeUtilityInactiveImageProvider](self, "_largeUtilityInactiveImageProvider");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0C94530];
      v5 = CFSTR("ALARMS_NONE_LARGE_ALL_CAPS");
      v6 = CFSTR("NO ALARMS");
      goto LABEL_6;
    case 2uLL:
      -[NTKAlarmTimelineEntry _largeUtilityInactiveImageProvider](self, "_largeUtilityInactiveImageProvider");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0C94530];
      NTKClockFaceLocalizedString(CFSTR("ALARMS_OFF_LARGE_ALL_CAPS"), CFSTR("ALL ALARMS OFF"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NTKClockFaceLocalizedString(CFSTR("ALARMS_OFF_LARGE_ALL_CAPS_SHORT"), CFSTR("ALARMS OFF"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "textProviderWithText:shortText:", v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    case 3uLL:
      -[NTKAlarmTimelineEntry _largeUtilityInactiveImageProvider](self, "_largeUtilityInactiveImageProvider");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0C94530];
      v5 = CFSTR("ALARMS_NOT_UPCOMING_LARGE_ALL_CAPS");
      v6 = CFSTR("NONE UPCOMING");
LABEL_6:
      NTKClockFaceLocalizedString(v5, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "textProviderWithText:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

      break;
    case 4uLL:
      if (-[NTKAlarmTimelineEntry _pairedDeviceSupportsComplicationSymbols](self, "_pairedDeviceSupportsComplicationSymbols"))
      {
        objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", CFSTR("alarm.waves.left.and.right.fill"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = (void *)MEMORY[0x1E0C944E8];
        NTKImageNamed(CFSTR("analogAlarmActive"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "imageProviderWithOnePieceImage:", v12);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTintColor:", v13);

      -[NTKAlarmTimelineEntry _activeStateTimeTextProvider](self, "_activeStateTimeTextProvider");
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 5uLL:
      if (-[NTKAlarmTimelineEntry _pairedDeviceSupportsComplicationSymbols](self, "_pairedDeviceSupportsComplicationSymbols"))
      {
        objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", CFSTR("zzz"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = (void *)MEMORY[0x1E0C944E8];
        NTKImageNamed(CFSTR("analogAlarmSnooze"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "imageProviderWithOnePieceImage:", v16);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTintColor:", v17);

      -[NTKAlarmTimelineEntry _snoozeStateDateTextProvider](self, "_snoozeStateDateTextProvider");
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_17:
      v10 = (void *)v14;
      break;
    default:
      v3 = 0;
      v10 = 0;
      break;
  }
  objc_msgSend(MEMORY[0x1E0C94460], "templateWithTextProvider:imageProvider:", v10, v3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_newExtraLargeTemplate
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  switch(-[NTKAlarmTimelineEntry entryType](self, "entryType"))
  {
    case 0uLL:
      -[NTKAlarmTimelineEntry _extraLargeAlarmInactiveImageProvider](self, "_extraLargeAlarmInactiveImageProvider");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0C94530];
      v5 = CFSTR("UNKNOWN_TIME");
      v6 = CFSTR("‒‒:‒‒");
      goto LABEL_6;
    case 1uLL:
    case 3uLL:
      -[NTKAlarmTimelineEntry _extraLargeAlarmInactiveImageProvider](self, "_extraLargeAlarmInactiveImageProvider");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0C94530];
      v5 = CFSTR("ALARMS_NONE_SMALL");
      v6 = CFSTR("NONE");
      goto LABEL_6;
    case 2uLL:
      -[NTKAlarmTimelineEntry _extraLargeAlarmInactiveImageProvider](self, "_extraLargeAlarmInactiveImageProvider");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0C94530];
      v5 = CFSTR("ALARMS_OFF_SMALL");
      v6 = CFSTR("OFF");
LABEL_6:
      NTKClockFaceLocalizedString(v5, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "textProviderWithText:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 4uLL:
      if (-[NTKAlarmTimelineEntry _pairedDeviceSupportsComplicationSymbols](self, "_pairedDeviceSupportsComplicationSymbols"))
      {
        objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", CFSTR("alarm.waves.left.and.right.fill"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = (void *)MEMORY[0x1E0C944E8];
        NTKImageNamed(CFSTR("XLmodularAlarmActive"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "imageProviderWithOnePieceImage:", v14);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTintColor:", v15);

      -[NTKAlarmTimelineEntry _activeStateTimeTextProvider](self, "_activeStateTimeTextProvider");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    case 5uLL:
      if (-[NTKAlarmTimelineEntry _pairedDeviceSupportsComplicationSymbols](self, "_pairedDeviceSupportsComplicationSymbols"))
      {
        objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", CFSTR("zzz"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = (void *)MEMORY[0x1E0C944E8];
        NTKImageNamed(CFSTR("XLmodularAlarmSnoozing"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "imageProviderWithOnePieceImage:", v10);
        v3 = (void *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setTintColor:", v11);

      -[NTKAlarmTimelineEntry _snoozeStateDateTextProvider](self, "_snoozeStateDateTextProvider");
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_15:
      v7 = (void *)v12;
      break;
    default:
      v3 = 0;
      v7 = 0;
      break;
  }
  objc_msgSend(MEMORY[0x1E0C94228], "templateWithLine1ImageProvider:line2TextProvider:", v3, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_newSignatureCornerTemplate
{
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  switch(-[NTKAlarmTimelineEntry entryType](self, "entryType"))
  {
    case 0uLL:
      -[NTKAlarmTimelineEntry _getAlarmImageProviderWithActiveStatus:](self, "_getAlarmImageProviderWithActiveStatus:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0C94530];
      v5 = CFSTR("UNKNOWN_TIME");
      v6 = CFSTR("‒‒:‒‒");
      goto LABEL_7;
    case 1uLL:
      -[NTKAlarmTimelineEntry _getAlarmImageProviderWithActiveStatus:](self, "_getAlarmImageProviderWithActiveStatus:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0C94530];
      v5 = CFSTR("ALARMS_NONE_CORNER");
      v6 = CFSTR("NO ALARMS");
      goto LABEL_7;
    case 2uLL:
      -[NTKAlarmTimelineEntry _getAlarmImageProviderWithActiveStatus:](self, "_getAlarmImageProviderWithActiveStatus:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0C94530];
      NTKClockFaceLocalizedString(CFSTR("ALARMS_OFF_CORNER"), CFSTR("ALL ALARMS OFF"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NTKClockFaceLocalizedString(CFSTR("ALARMS_OFF_CORNER_SHORT"), CFSTR("ALARMS OFF"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textProviderWithText:shortText:", v9, v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    case 3uLL:
      -[NTKAlarmTimelineEntry _getAlarmImageProviderWithActiveStatus:](self, "_getAlarmImageProviderWithActiveStatus:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)MEMORY[0x1E0C94530];
      v5 = CFSTR("ALARMS_NOT_UPCOMING_CORNER");
      v6 = CFSTR("NONE UPCOMING");
LABEL_7:
      NTKClockFaceLocalizedString(v5, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "textProviderWithText:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 4uLL:
      -[NTKAlarmTimelineEntry _getAlarmImageProviderWithActiveStatus:](self, "_getAlarmImageProviderWithActiveStatus:", 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0C94540];
      NTKClockFaceLocalizedString(CFSTR("ALARM_LABEL_CORNER_FORMAT"), CFSTR("ALARM %@"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKAlarmTimelineEntry _activeStateTimeTextProvider](self, "_activeStateTimeTextProvider");
      v12 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 5uLL:
      -[NTKAlarmTimelineEntry _getAlarmImageProviderWithActiveStatus:](self, "_getAlarmImageProviderWithActiveStatus:", 1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0C94540];
      NTKClockFaceLocalizedString(CFSTR("SNOOZING_LABEL_CORNER_FORMAT"), CFSTR("SNOOZING %@"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKAlarmTimelineEntry _snoozeStateDateTextProvider](self, "_snoozeStateDateTextProvider");
      v12 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v13 = (void *)v12;
      objc_msgSend(v11, "textProviderWithFormat:", v9, v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
      break;
    default:
      v3 = 0;
      v7 = 0;
      break;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v14);

  objc_msgSend(MEMORY[0x1E0C94308], "templateWithTextProvider:imageProvider:", v7, v3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_getAlarmImageProviderWithActiveStatus:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v3 = a3;
  v20[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v5;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v6;
    v7 = v20;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v5;
    objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v6;
    v7 = v19;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3888], "_configurationWithHierarchicalColors:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithScale:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configurationByApplyingConfiguration:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("alarm.waves.left.and.right.fill"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("alarm"), v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NTKAlarmTimelineEntry _pairedDeviceSupportsComplicationSymbols](self, "_pairedDeviceSupportsComplicationSymbols"))
  {
    if (v3)
      v14 = v12;
    else
      v14 = v13;
    v15 = v14;
  }
  else
  {
    NTKImageNamed(CFSTR("fullColorAnalogAlarm"));
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  objc_msgSend(MEMORY[0x1E0C944D8], "providerWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:", v15, 1, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_richCircularMetadata
{
  void *v3;
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v16;
  id v17;
  __int16 v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NTKAlarmTimelineEntry entryType](self, "entryType");
  if (v4 == 4)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("NTKAlarmComplicationMetadataStateValue_Set"), CFSTR("NTKAlarmComplicationMetadataStateKey"));
    v18 = 0;
    v16 = 0;
    v17 = 0;
    -[NTKAlarmTimelineEntry _makeAlarmStackTextTimeProvider:designatorProvider:designatorExists:designatorLeads:](self, "_makeAlarmStackTextTimeProvider:designatorProvider:designatorExists:designatorLeads:", &v17, &v16, (char *)&v18 + 1, &v18);
    v6 = v17;
    v12 = v16;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("NTKAlarmComplicationMetadataTimeTextProviderKey"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("NTKAlarmComplicationMetadataDesignatorTextProviderKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", HIBYTE(v18));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("NTKAlarmComplicationMetadataDesignatorExistsKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("NTKAlarmComplicationMetadataDesignatorLeadsKey"));

    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C94118]);
  }
  else
  {
    if (v4 != 5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("NTKAlarmComplicationMetadataStateValue_Idle"), CFSTR("NTKAlarmComplicationMetadataStateKey"));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C94118]);
      return v3;
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("NTKAlarmComplicationMetadataStateValue_Snooze"), CFSTR("NTKAlarmComplicationMetadataStateKey"));
    -[NTKAlarmTimelineEntry _snoozeStateDateTextProvider](self, "_snoozeStateDateTextProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("NTKAlarmComplicationMetadataTimeTextProviderKey"));

    -[NTKAlarmTimelineEntry snoozeDate](self, "snoozeDate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateByAddingTimeInterval:", -540.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C94558];
    objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "gaugeProviderWithStyle:gaugeColors:gaugeColorLocations:startDate:endDate:", 1, v10, 0, v7, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("NTKAlarmComplicationMetadataGaugeProviderKey"));

  }
  return v3;
}

- (id)_newSignatureCircularTemplate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C94268];
  -[NTKAlarmTimelineEntry _richCircularMetadata](self, "_richCircularMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "templateWithMetadata:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_newSignatureExtraLargeCircularTemplate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C94338];
  -[NTKAlarmTimelineEntry _richCircularMetadata](self, "_richCircularMetadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "templateWithMetadata:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_newSignatureBezelTemplate
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C94238];
  v3 = -[NTKAlarmTimelineEntry _newSignatureCircularTemplate](self, "_newSignatureCircularTemplate");
  objc_msgSend(v2, "templateWithCircularTemplate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_newSignatureRectangularTemplate
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
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

  switch(-[NTKAlarmTimelineEntry entryType](self, "entryType"))
  {
    case 0uLL:
      v3 = (void *)MEMORY[0x1E0C94530];
      v4 = CFSTR("UNKNOWN_TIME");
      v5 = CFSTR("‒‒:‒‒");
      goto LABEL_7;
    case 1uLL:
      v3 = (void *)MEMORY[0x1E0C94530];
      v4 = CFSTR("ALARMS_NONE_LARGE");
      v5 = CFSTR("No Alarms");
      goto LABEL_7;
    case 2uLL:
      v3 = (void *)MEMORY[0x1E0C94530];
      v4 = CFSTR("ALARMS_OFF_LARGE");
      v5 = CFSTR("All alarms off");
      goto LABEL_7;
    case 3uLL:
      v3 = (void *)MEMORY[0x1E0C94530];
      v4 = CFSTR("ALARMS_NOT_UPCOMING_LARGE");
      v5 = CFSTR("None upcoming");
LABEL_7:
      NTKClockFaceLocalizedString(v4, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "textProviderWithText:", v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = 0;
      break;
    case 4uLL:
      -[NTKAlarmTimelineEntry _activeStateTimeTextProvider](self, "_activeStateTimeTextProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NTKAlarmTimelineEntry _activeStateTimeRelativeDateTextProvider](self, "_activeStateTimeRelativeDateTextProvider");
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 5uLL:
      v10 = (void *)MEMORY[0x1E0C94530];
      NTKClockFaceLocalizedString(CFSTR("ALARMS_SNOOZE"), CFSTR("Snooze"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "textProviderWithText:", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[NTKAlarmTimelineEntry _snoozeStateDateTextProvider](self, "_snoozeStateDateTextProvider");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v6 = (void *)v9;
      break;
    default:
      v6 = 0;
      v7 = 0;
      break;
  }
  v12 = (void *)MEMORY[0x1E0C944D8];
  NTKImageNamed(CFSTR("fullColorRectangularAlarm"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "providerWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:", v13, 1, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTintColor:", v15);

  v16 = (void *)MEMORY[0x1E0C94530];
  NTKClockFaceLocalizedString(CFSTR("ALARMS_TITLE"), CFSTR("Alarm"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "textProviderWithText:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setTintColor:", v19);

  objc_msgSend(MEMORY[0x1E0C943C8], "templateWithHeaderImageProvider:headerTextProvider:body1TextProvider:body2TextProvider:", v14, v18, v7, v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)_activeStateTimeTextProvider
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C94560];
  -[NTKAlarmTimelineEntry fireDate](self, "fireDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textProviderWithDate:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setDisallowBothMinutesAndDesignator:", 0);
  return v4;
}

- (id)_activeStateTimeRelativeDateTextProvider
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C94508];
  -[NTKAlarmTimelineEntry fireDate](self, "fireDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textProviderWithDate:style:units:", v3, 0, 96);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_snoozeStateDateTextProvider
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C94508];
  -[NTKAlarmTimelineEntry snoozeDate](self, "snoozeDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textProviderWithDate:style:units:", v3, 2, 224);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_modularSmallAlarmInactiveImageProvider
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[5];

  os_unfair_lock_lock((os_unfair_lock_t)&_modularSmallAlarmInactiveImageProvider___lock);
  WeakRetained = objc_loadWeakRetained(&_modularSmallAlarmInactiveImageProvider___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v4 = WeakRetained;
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained(&_modularSmallAlarmInactiveImageProvider___cachedDevice);
  if (v6 != v7)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&_modularSmallAlarmInactiveImageProvider___cachedDevice, v13);

    v14 = objc_loadWeakRetained(&_modularSmallAlarmInactiveImageProvider___cachedDevice);
    _modularSmallAlarmInactiveImageProvider___previousCLKDeviceVersion = objc_msgSend(v14, "version");

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __64__NTKAlarmTimelineEntry__modularSmallAlarmInactiveImageProvider__block_invoke;
    v18[3] = &unk_1E6BD0658;
    v18[4] = self;
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "device");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __64__NTKAlarmTimelineEntry__modularSmallAlarmInactiveImageProvider__block_invoke((uint64_t)v18);

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "version");
  v11 = _modularSmallAlarmInactiveImageProvider___previousCLKDeviceVersion;

  if (v10 != v11)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_modularSmallAlarmInactiveImageProvider___lock);
  return (id)_modularSmallAlarmInactiveImageProvider_glyphImageProvider;
}

void __64__NTKAlarmTimelineEntry__modularSmallAlarmInactiveImageProvider__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if ((objc_msgSend(*(id *)(a1 + 32), "_pairedDeviceSupportsComplicationSymbols") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", CFSTR("alarm"));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)_modularSmallAlarmInactiveImageProvider_glyphImageProvider;
    _modularSmallAlarmInactiveImageProvider_glyphImageProvider = v1;
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C944E8];
    NTKImageNamed(CFSTR("modularAlarmInactive"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    NTKImageNamed(CFSTR("modularAlarmInactiveBackground"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NTKImageNamed(CFSTR("modularAlarmInactiveForeground"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageProviderWithOnePieceImage:twoPieceImageBackground:twoPieceImageForeground:", v2, v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)_modularSmallAlarmInactiveImageProvider_glyphImageProvider;
    _modularSmallAlarmInactiveImageProvider_glyphImageProvider = v6;

  }
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_modularSmallAlarmInactiveImageProvider_glyphImageProvider, "setTintColor:", v8);

}

- (id)_extraLargeAlarmInactiveImageProvider
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[5];

  os_unfair_lock_lock((os_unfair_lock_t)&_extraLargeAlarmInactiveImageProvider___lock);
  WeakRetained = objc_loadWeakRetained(&_extraLargeAlarmInactiveImageProvider___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v4 = WeakRetained;
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained(&_extraLargeAlarmInactiveImageProvider___cachedDevice);
  if (v6 != v7)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&_extraLargeAlarmInactiveImageProvider___cachedDevice, v13);

    v14 = objc_loadWeakRetained(&_extraLargeAlarmInactiveImageProvider___cachedDevice);
    _extraLargeAlarmInactiveImageProvider___previousCLKDeviceVersion = objc_msgSend(v14, "version");

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __62__NTKAlarmTimelineEntry__extraLargeAlarmInactiveImageProvider__block_invoke;
    v18[3] = &unk_1E6BD0658;
    v18[4] = self;
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "device");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __62__NTKAlarmTimelineEntry__extraLargeAlarmInactiveImageProvider__block_invoke((uint64_t)v18);

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "version");
  v11 = _extraLargeAlarmInactiveImageProvider___previousCLKDeviceVersion;

  if (v10 != v11)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_extraLargeAlarmInactiveImageProvider___lock);
  return (id)_extraLargeAlarmInactiveImageProvider_glyphImageProvider;
}

void __62__NTKAlarmTimelineEntry__extraLargeAlarmInactiveImageProvider__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if ((objc_msgSend(*(id *)(a1 + 32), "_pairedDeviceSupportsComplicationSymbols") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", CFSTR("alarm"));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)_extraLargeAlarmInactiveImageProvider_glyphImageProvider;
    _extraLargeAlarmInactiveImageProvider_glyphImageProvider = v1;
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C944E8];
    NTKImageNamed(CFSTR("XLmodularAlarmInactive"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    NTKImageNamed(CFSTR("XLmodularAlarmInactiveBackground"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NTKImageNamed(CFSTR("XLmodularAlarmInactiveForeground"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageProviderWithOnePieceImage:twoPieceImageBackground:twoPieceImageForeground:", v2, v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)_extraLargeAlarmInactiveImageProvider_glyphImageProvider;
    _extraLargeAlarmInactiveImageProvider_glyphImageProvider = v6;

  }
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_extraLargeAlarmInactiveImageProvider_glyphImageProvider, "setTintColor:", v8);

}

- (id)_largeUtilityInactiveImageProvider
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[5];

  os_unfair_lock_lock((os_unfair_lock_t)&_largeUtilityInactiveImageProvider___lock);
  WeakRetained = objc_loadWeakRetained(&_largeUtilityInactiveImageProvider___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v4 = WeakRetained;
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "device");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_loadWeakRetained(&_largeUtilityInactiveImageProvider___cachedDevice);
  if (v6 != v7)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&_largeUtilityInactiveImageProvider___cachedDevice, v13);

    v14 = objc_loadWeakRetained(&_largeUtilityInactiveImageProvider___cachedDevice);
    _largeUtilityInactiveImageProvider___previousCLKDeviceVersion = objc_msgSend(v14, "version");

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __59__NTKAlarmTimelineEntry__largeUtilityInactiveImageProvider__block_invoke;
    v18[3] = &unk_1E6BD0658;
    v18[4] = self;
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "device");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    __59__NTKAlarmTimelineEntry__largeUtilityInactiveImageProvider__block_invoke((uint64_t)v18);

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "version");
  v11 = _largeUtilityInactiveImageProvider___previousCLKDeviceVersion;

  if (v10 != v11)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_largeUtilityInactiveImageProvider___lock);
  return (id)_largeUtilityInactiveImageProvider_glyphImageProvider;
}

void __59__NTKAlarmTimelineEntry__largeUtilityInactiveImageProvider__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if ((objc_msgSend(*(id *)(a1 + 32), "_pairedDeviceSupportsComplicationSymbols") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C94538], "symbolImageProviderWithSystemName:", CFSTR("alarm"));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)_largeUtilityInactiveImageProvider_glyphImageProvider;
    _largeUtilityInactiveImageProvider_glyphImageProvider = v1;
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C944E8];
    NTKImageNamed(CFSTR("analogAlarmInactive"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    NTKImageNamed(CFSTR("analogAlarmInactiveBackground"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    NTKImageNamed(CFSTR("analogAlarmInactiveForeground"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageProviderWithOnePieceImage:twoPieceImageBackground:twoPieceImageForeground:", v2, v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)_largeUtilityInactiveImageProvider_glyphImageProvider;
    _largeUtilityInactiveImageProvider_glyphImageProvider = v6;

  }
  objc_msgSend(MEMORY[0x1E0DC3658], "systemOrangeColor");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_largeUtilityInactiveImageProvider_glyphImageProvider, "setTintColor:", v8);

}

- (BOOL)_pairedDeviceSupportsComplicationSymbols
{
  return -[CLKDevice isRunningGloryGMOrLater](self->_device, "isRunningGloryGMOrLater");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (description_onceToken != -1)
    dispatch_once(&description_onceToken, &__block_literal_global_35);
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NTKTimelineEntryModel entryDate](self, "entryDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _FormattedDate(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)description_typeNames, "objectAtIndexedSubscript:", -[NTKAlarmTimelineEntry entryType](self, "entryType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKAlarmTimelineEntry alarmLabel](self, "alarmLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKAlarmTimelineEntry fireDate](self, "fireDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _FormattedDate(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKAlarmTimelineEntry snoozeDate](self, "snoozeDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _FormattedDate(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("EntryDate: %@\tType: %@\tLabel: %@\tFireDate: %@\tSnoozeDate: %@"), v5, v6, v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __36__NTKAlarmTimelineEntry_description__block_invoke()
{
  void *v0;

  v0 = (void *)description_typeNames;
  description_typeNames = (uint64_t)&unk_1E6CA9658;

}

- (unint64_t)entryType
{
  return self->_entryType;
}

- (void)setEntryType:(unint64_t)a3
{
  self->_entryType = a3;
}

- (NSString)alarmLabel
{
  return self->_alarmLabel;
}

- (void)setAlarmLabel:(id)a3
{
  objc_storeStrong((id *)&self->_alarmLabel, a3);
}

- (NSDate)fireDate
{
  return self->_fireDate;
}

- (void)setFireDate:(id)a3
{
  objc_storeStrong((id *)&self->_fireDate, a3);
}

- (NSDate)snoozeDate
{
  return self->_snoozeDate;
}

- (void)setSnoozeDate:(id)a3
{
  objc_storeStrong((id *)&self->_snoozeDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snoozeDate, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
  objc_storeStrong((id *)&self->_alarmLabel, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
