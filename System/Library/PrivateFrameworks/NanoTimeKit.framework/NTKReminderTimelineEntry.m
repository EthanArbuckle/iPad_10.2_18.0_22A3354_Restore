@implementation NTKReminderTimelineEntry

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
  objc_super v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v12.receiver = self;
  v12.super_class = (Class)NTKReminderTimelineEntry;
  -[NTKReminderTimelineEntry description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKTimelineEntryModel entryDate](self, "entryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKReminderTimelineEntry primaryReminderTitle](self, "primaryReminderTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKReminderTimelineEntry primaryReminderId](self, "primaryReminderId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKReminderTimelineEntry secondaryReminderTitle](self, "secondaryReminderTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKReminderTimelineEntry dueDate](self, "dueDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ entryDate %@ title 1 %@ reminderId %@ title 2 %@ dueDate %@"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)templateForComplicationFamily:(int64_t)a3
{
  void *v3;

  switch(a3)
  {
    case 104:
      goto LABEL_6;
    case 8:
      -[NTKReminderTimelineEntry _createSignatureCornerTemplate](self, "_createSignatureCornerTemplate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    case 3:
LABEL_6:
      -[NTKReminderTimelineEntry _createLargeUtilityTemplate](self, "_createLargeUtilityTemplate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[NTKReminderTimelineEntry _createLargeModularTemplate](self, "_createLargeModularTemplate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return 0;
  }
  return v3;
}

+ (id)_reminderImageAnalog
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  os_unfair_lock_lock((os_unfair_lock_t)&_reminderImageAnalog___lock);
  WeakRetained = objc_loadWeakRetained(&_reminderImageAnalog___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(&_reminderImageAnalog___cachedDevice);
  if (v5 != v6)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&_reminderImageAnalog___cachedDevice, v12);

    v13 = objc_loadWeakRetained(&_reminderImageAnalog___cachedDevice);
    _reminderImageAnalog___previousCLKDeviceVersion = objc_msgSend(v13, "version");

    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __48__NTKReminderTimelineEntry__reminderImageAnalog__block_invoke();

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "version");
  v10 = _reminderImageAnalog___previousCLKDeviceVersion;

  if (v9 != v10)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_reminderImageAnalog___lock);
  return (id)_reminderImageAnalog_reminderImage;
}

void __48__NTKReminderTimelineEntry__reminderImageAnalog__block_invoke()
{
  uint64_t v0;
  void *v1;

  NTKImageNamed(CFSTR("UtilityReminders"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_reminderImageAnalog_reminderImage;
  _reminderImageAnalog_reminderImage = v0;

}

+ (id)_reminderImageCorner
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  os_unfair_lock_lock((os_unfair_lock_t)&_reminderImageCorner___lock);
  WeakRetained = objc_loadWeakRetained(&_reminderImageCorner___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(&_reminderImageCorner___cachedDevice);
  if (v5 != v6)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&_reminderImageCorner___cachedDevice, v12);

    v13 = objc_loadWeakRetained(&_reminderImageCorner___cachedDevice);
    _reminderImageCorner___previousCLKDeviceVersion = objc_msgSend(v13, "version");

    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __48__NTKReminderTimelineEntry__reminderImageCorner__block_invoke();

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "version");
  v10 = _reminderImageCorner___previousCLKDeviceVersion;

  if (v9 != v10)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_reminderImageCorner___lock);
  return (id)_reminderImageCorner_reminderImage;
}

void __48__NTKReminderTimelineEntry__reminderImageCorner__block_invoke()
{
  uint64_t v0;
  void *v1;

  NTKImageNamed(CFSTR("CornerReminders"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_reminderImageCorner_reminderImage;
  _reminderImageCorner_reminderImage = v0;

}

+ (id)_cornerReminderImageProvider
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  os_unfair_lock_lock((os_unfair_lock_t)&_cornerReminderImageProvider___lock);
  WeakRetained = objc_loadWeakRetained(&_cornerReminderImageProvider___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(&_cornerReminderImageProvider___cachedDevice);
  if (v5 != v6)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&_cornerReminderImageProvider___cachedDevice, v12);

    v13 = objc_loadWeakRetained(&_cornerReminderImageProvider___cachedDevice);
    _cornerReminderImageProvider___previousCLKDeviceVersion = objc_msgSend(v13, "version");

    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __56__NTKReminderTimelineEntry__cornerReminderImageProvider__block_invoke();

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "version");
  v10 = _cornerReminderImageProvider___previousCLKDeviceVersion;

  if (v9 != v10)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_cornerReminderImageProvider___lock);
  return (id)_cornerReminderImageProvider_imageProvider;
}

void __56__NTKReminderTimelineEntry__cornerReminderImageProvider__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)MEMORY[0x1E0C944D8];
  objc_msgSend((id)objc_opt_class(), "_reminderImageCorner");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "providerWithFullColorImage:monochromeFilterType:applyScalingAndCircularMasking:", v3, 1, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_cornerReminderImageProvider_imageProvider;
  _cornerReminderImageProvider_imageProvider = v1;

}

- (id)_createSignatureCornerTemplate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
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

  if (-[NTKReminderTimelineEntry overlappingReminderCount](self, "overlappingReminderCount"))
  {
    -[NTKReminderTimelineEntry primaryReminderParentListColor](self, "primaryReminderParentListColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      v5 = v3;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v5;

    if (CLKLanguageIsTallScript())
    {
      v13 = (void *)MEMORY[0x1E0C94530];
      -[NTKReminderTimelineEntry primaryReminderTitle](self, "primaryReminderTitle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "finalizedTextProviderWithText:", v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setTintColor:", v9);
      objc_msgSend((id)objc_opt_class(), "_cornerReminderImageProvider");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C94308], "templateWithTextProvider:imageProvider:", v11, v15);
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0C94560];
      -[NTKReminderTimelineEntry dueDate](self, "dueDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "textProviderWithDate:", v17);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)MEMORY[0x1E0C94530];
      -[NTKReminderTimelineEntry primaryReminderTitle](self, "primaryReminderTitle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "finalizedTextProviderWithText:", v19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setTintColor:", v9);
      objc_msgSend(MEMORY[0x1E0C94300], "templateWithInnerTextProvider:outerTextProvider:", v15, v11);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C94530];
    NTKClockFaceLocalizedString(CFSTR("REMINDERS_NONE_CORNER"), CFSTR("No Reminders Due"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NTKClockFaceLocalizedString(CFSTR("REMINDERS_NONE_CORNER_SHORT"), CFSTR("No Reminders"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "textProviderWithText:shortText:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTintColor:", v10);

    objc_msgSend((id)objc_opt_class(), "_cornerReminderImageProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C94308], "templateWithTextProvider:imageProvider:", v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)_createLargeModularTemplate
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
  void *v13;
  void *v14;

  if (-[NTKReminderTimelineEntry overlappingReminderCount](self, "overlappingReminderCount"))
  {
    v3 = (void *)MEMORY[0x1E0C94560];
    -[NTKReminderTimelineEntry dueDate](self, "dueDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "textProviderWithDate:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)MEMORY[0x1E0C94530];
    -[NTKReminderTimelineEntry primaryReminderTitle](self, "primaryReminderTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "finalizedTextProviderWithText:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C94530];
    NTKClockFaceLocalizedString(CFSTR("REMINDERS_TITLE"), CFSTR("Reminders"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textProviderWithText:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0C94530];
    NTKClockFaceLocalizedString(CFSTR("REMINDERS_NO_SCHEDULED_REMINDERS_LARGE_MODULAR"), CFSTR("No scheduled reminders"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textProviderWithText:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0C943F8], "templateWithHeaderTextProvider:body1TextProvider:", v5, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTintColor:", v14);

  return v13;
}

- (id)_createLargeUtilityTemplate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (-[NTKReminderTimelineEntry overlappingReminderCount](self, "overlappingReminderCount"))
  {
    -[NTKReminderTimelineEntry dueDate](self, "dueDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKReminderTimelineEntry primaryReminderTitle](self, "primaryReminderTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[NTKReminderTimelineEntry primaryReminderTitle](self, "primaryReminderTitle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uppercaseStringWithLocale:", v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = &stru_1E6BDC918;
    }

    objc_msgSend(MEMORY[0x1E0C94560], "textProviderWithDate:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setPrefersDesignatorToMinutes:", 1);
    v11 = (void *)MEMORY[0x1E0C94540];
    objc_msgSend(MEMORY[0x1E0C94530], "textProviderWithText:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textProviderWithFormat:", CFSTR("%@ %@"), v10, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C94530];
    NTKClockFaceLocalizedString(CFSTR("REMINDERS_NO_SCHEDULED_REMINDERS_LONG_UTILITY"), CFSTR("NO REMINDERS DUE"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textProviderWithText:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0C94460], "templateWithTextProvider:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_analogReminderImageProvider
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  os_unfair_lock_lock((os_unfair_lock_t)&_analogReminderImageProvider___lock);
  WeakRetained = objc_loadWeakRetained(&_analogReminderImageProvider___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "device");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(&_analogReminderImageProvider___cachedDevice);
  if (v5 != v6)
  {

LABEL_5:
    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "device");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak(&_analogReminderImageProvider___cachedDevice, v12);

    v13 = objc_loadWeakRetained(&_analogReminderImageProvider___cachedDevice);
    _analogReminderImageProvider___previousCLKDeviceVersion = objc_msgSend(v13, "version");

    objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __56__NTKReminderTimelineEntry__analogReminderImageProvider__block_invoke();

    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C94510], "sharedRenderingContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "device");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "version");
  v10 = _analogReminderImageProvider___previousCLKDeviceVersion;

  if (v9 != v10)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&_analogReminderImageProvider___lock);
  return (id)_analogReminderImageProvider_imageProvider;
}

void __56__NTKReminderTimelineEntry__analogReminderImageProvider__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v0 = (void *)MEMORY[0x1E0C944E8];
  objc_msgSend((id)objc_opt_class(), "_reminderImageAnalog");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageProviderWithOnePieceImage:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_analogReminderImageProvider_imageProvider;
  _analogReminderImageProvider_imageProvider = v2;

  v4 = (void *)_analogReminderImageProvider_imageProvider;
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTintColor:", v5);

}

+ (id)lockedEntryForFamily:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
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

  switch(a3)
  {
    case 104:
      v3 = (void *)MEMORY[0x1E0C94530];
      NTKClockFaceLocalizedString(CFSTR("COMPLICATION_LOCKED_PLACEHOLDER_LONG_UTILITY"), 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "textProviderWithText:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C94460], "templateWithTextProvider:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 8:
      v13 = (void *)MEMORY[0x1E0C94530];
      NTKClockFaceLocalizedString(CFSTR("COMPLICATION_LOCKED_PLACEHOLDER_CORNER"), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "textProviderWithText:", v14);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTintColor:", v15);

      objc_msgSend((id)objc_opt_class(), "_cornerReminderImageProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0C94308];
LABEL_9:
      objc_msgSend(v17, "templateWithTextProvider:imageProvider:", v5, v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    case 3:
      v18 = (void *)MEMORY[0x1E0C94530];
      NTKClockFaceLocalizedString(CFSTR("COMPLICATION_LOCKED_PLACEHOLDER_LONG_UTILITY"), 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "textProviderWithText:", v19);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_analogReminderImageProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0C94460];
      goto LABEL_9;
  }
  if (a3 != 1)
  {
    v6 = 0;
    goto LABEL_13;
  }
  v8 = (void *)MEMORY[0x1E0C94530];
  NTKClockFaceLocalizedString(CFSTR("REMINDERS_TITLE"), CFSTR("Reminders"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textProviderWithText:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C94530];
  NTKClockFaceLocalizedString(CFSTR("COMPLICATION_LOCKED_PLACEHOLDER_LARGE_MODULAR"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textProviderWithText:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C943F8], "templateWithHeaderTextProvider:body1TextProvider:", v5, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  if (!v6)
  {
LABEL_13:
    v22 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v6, "finalize");
  v20 = (void *)MEMORY[0x1E0C94490];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "entryWithDate:complicationTemplate:", v21, v6);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v22;
}

+ (id)loadingEntryForFamily:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
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

  switch(a3)
  {
    case 104:
      v3 = (void *)MEMORY[0x1E0C94530];
      NTKClockFaceLocalizedString(CFSTR("REMINDERS_FETCHING_LARGE_UTILITY"), CFSTR("GETTING REMINDERS..."));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "textProviderWithText:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C94460], "templateWithTextProvider:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    case 8:
      v13 = (void *)MEMORY[0x1E0C94530];
      NTKClockFaceLocalizedString(CFSTR("REMINDERS_FETCHING_CORNER"), CFSTR("Getting reminders..."));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NTKClockFaceLocalizedString(CFSTR("REMINDERS_FETCHING_CORNER_SHORT"), CFSTR("Loading..."));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "textProviderWithText:shortText:", v14, v15);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTintColor:", v16);

      objc_msgSend((id)objc_opt_class(), "_cornerReminderImageProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0C94308];
LABEL_9:
      objc_msgSend(v18, "templateWithTextProvider:imageProvider:", v5, v17);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    case 3:
      v19 = (void *)MEMORY[0x1E0C94530];
      NTKClockFaceLocalizedString(CFSTR("REMINDERS_FETCHING_LARGE_UTILITY"), CFSTR("GETTING REMINDERS..."));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "textProviderWithText:", v20);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "_analogReminderImageProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0C94460];
      goto LABEL_9;
  }
  if (a3 != 1)
  {
    v6 = 0;
    goto LABEL_13;
  }
  v8 = (void *)MEMORY[0x1E0C94530];
  NTKClockFaceLocalizedString(CFSTR("REMINDERS_TITLE"), CFSTR("Reminders"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textProviderWithText:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0C94530];
  NTKClockFaceLocalizedString(CFSTR("REMINDERS_FETCHING_LARGE_MODULAR"), CFSTR("Getting reminders..."));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textProviderWithText:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C943F8], "templateWithHeaderTextProvider:body1TextProvider:", v5, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  if (!v6)
  {
LABEL_13:
    v23 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v6, "finalize");
  v21 = (void *)MEMORY[0x1E0C94490];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "entryWithDate:complicationTemplate:", v22, v6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v23;
}

- (NSDate)dueDate
{
  return self->_dueDate;
}

- (void)setDueDate:(id)a3
{
  objc_storeStrong((id *)&self->_dueDate, a3);
}

- (NSString)primaryReminderTitle
{
  return self->_primaryReminderTitle;
}

- (void)setPrimaryReminderTitle:(id)a3
{
  objc_storeStrong((id *)&self->_primaryReminderTitle, a3);
}

- (NSString)primaryReminderId
{
  return self->_primaryReminderId;
}

- (void)setPrimaryReminderId:(id)a3
{
  objc_storeStrong((id *)&self->_primaryReminderId, a3);
}

- (NSString)secondaryReminderTitle
{
  return self->_secondaryReminderTitle;
}

- (void)setSecondaryReminderTitle:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryReminderTitle, a3);
}

- (BOOL)displayAsConflicting
{
  return self->_displayAsConflicting;
}

- (void)setDisplayAsConflicting:(BOOL)a3
{
  self->_displayAsConflicting = a3;
}

- (unint64_t)overlappingReminderCount
{
  return self->_overlappingReminderCount;
}

- (void)setOverlappingReminderCount:(unint64_t)a3
{
  self->_overlappingReminderCount = a3;
}

- (UIColor)primaryReminderParentListColor
{
  return self->_primaryReminderParentListColor;
}

- (void)setPrimaryReminderParentListColor:(id)a3
{
  objc_storeStrong((id *)&self->_primaryReminderParentListColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryReminderParentListColor, 0);
  objc_storeStrong((id *)&self->_secondaryReminderTitle, 0);
  objc_storeStrong((id *)&self->_primaryReminderId, 0);
  objc_storeStrong((id *)&self->_primaryReminderTitle, 0);
  objc_storeStrong((id *)&self->_dueDate, 0);
}

@end
