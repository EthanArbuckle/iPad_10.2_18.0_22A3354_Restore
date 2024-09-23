@implementation EKCalendar

- (CGColorRef)CGColor
{
  void *v2;
  CGColor *v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __21__EKCalendar_CGColor__block_invoke;
  v5[3] = &unk_1E4784B98;
  v5[4] = self;
  -[EKObject cachedValueForKey:populateBlock:](self, "cachedValueForKey:populateBlock:", CFSTR("CGColor"), v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (CGColor *)objc_msgSend(v2, "color");

  return v3;
}

CGColorWrapper *__21__EKCalendar_CGColor__block_invoke(uint64_t a1)
{
  CGColorWrapper *v1;
  CGColorSpace *DeviceRGB;
  CGColor *v3;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  v6 = 0.0;
  v7 = 0.0;
  v5 = 0.0;
  v1 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "getColorRed:green:blue:", &v7, &v5, &v6))
  {
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    components[0] = v7;
    components[1] = v5;
    components[2] = v6;
    components[3] = 1.0;
    v3 = CGColorCreate(DeviceRGB, components);
    CFRelease(DeviceRGB);
    v1 = -[CGColorWrapper initWithCGColor:]([CGColorWrapper alloc], "initWithCGColor:", v3);
    CGColorRelease(v3);
  }
  return v1;
}

- (BOOL)getColorRed:(double *)a3 green:(double *)a4 blue:(double *)a5
{
  void *v8;
  void *v9;
  int v11;
  int v12;
  int v13;

  -[EKCalendar colorString](self, "colorString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v13 = 0;
    v11 = 0;
    v12 = 0;
    sscanf((const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"), "#%02X%02X%02X", &v13, &v12, &v11);
    if (a3)
      *a3 = (float)((float)v13 / 255.0);
    if (a4)
      *a4 = (float)((float)v12 / 255.0);
    if (a5)
      *a5 = (float)((float)v11 / 255.0);
  }

  return v9 != 0;
}

- (id)colorString
{
  void *v3;
  void *v4;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B598]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3
    || (objc_msgSend((id)EKSymbolicColorToRGBMapping(), "objectForKey:", v3),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[EKCalendar colorStringRaw](self, "colorStringRaw");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (unint64_t)lastSyncError
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[EKCalendar syncError](self, "syncError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "errorType"))
      v4 = 1;
    else
      v4 = objc_msgSend(v3, "errorCode");
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)syncError
{
  return -[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B5A0]);
}

- (id)symbolicColorName
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B598]);
}

- (BOOL)supportsJunkReporting
{
  void *v2;
  char v3;

  -[EKCalendar constraints](self, "constraints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsJunkReporting");

  return v3;
}

- (id)constraints
{
  void *v3;
  void *v4;

  -[EKObject eventStore](self, "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedConstraintsForCalendar:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)title
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  NSString *v11;

  v3 = (void *)MEMORY[0x1E0D0C320];
  -[EKCalendar unlocalizedTitle](self, "unlocalizedTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[EKCalendar isSuggestedEventCalendar](self, "isSuggestedEventCalendar");
  v6 = -[EKCalendar type](self, "type") == EKCalendarTypeBirthday;
  v7 = -[EKCalendar allowReminders](self, "allowReminders");
  -[EKCalendar source](self, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedTitleForTitle:isSuggestedEventCalendar:isBirthdayCalendar:allowsReminders:isIntegrationCalendar:", v4, v5, v6, v7, objc_msgSend(v8, "sourceType") == 6);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v10 = v9;
  else
    v10 = &stru_1E4789A58;
  v11 = v10;

  return v11;
}

- (id)unlocalizedTitle
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B5B0]);
}

- (BOOL)allowReminders
{
  return (-[EKCalendar allowedEntityTypes](self, "allowedEntityTypes") >> 1) & 1;
}

- (EKEntityMask)allowedEntityTypes
{
  int v2;
  EKEntityMask v3;

  v2 = -[EKCalendar allowedEntities](self, "allowedEntities");
  v3 = 2;
  if (v2 != 8)
    v3 = 3;
  if (v2 == 4)
    return 1;
  else
    return v3;
}

- (int)allowedEntities
{
  void *v2;
  int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B420]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (BOOL)isSuggestedEventCalendar
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 0x40000);
}

- (id)UUID
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B820]);
}

- (BOOL)isHolidayCalendar
{
  return -[EKCalendar isSyncedHolidayCalendar](self, "isSyncedHolidayCalendar")
      || -[EKCalendar isSubscribedHolidayCalendar](self, "isSubscribedHolidayCalendar");
}

- (BOOL)isSyncedHolidayCalendar
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 0x1000000);
}

- (BOOL)isSubscribedHolidayCalendar
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 4096);
}

- (EKCalendarType)type
{
  EKCalendarType result;
  void *v4;
  uint64_t v5;

  if (-[EKCalendar isSubscribed](self, "isSubscribed"))
    return 3;
  -[EKCalendar source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sourceType");

  result = EKCalendarTypeLocal;
  switch(v5)
  {
    case 1:
      result = EKCalendarTypeExchange;
      break;
    case 2:
      result = EKCalendarTypeCalDAV;
      break;
    case 4:
      return 3;
    case 5:
      if (-[EKCalendar isSuggestedEventCalendar](self, "isSuggestedEventCalendar"))
      {
        result = EKCalendarTypeBirthday|EKCalendarTypeCalDAV;
      }
      else if (-[EKCalendar isNaturalLanguageSuggestedEventCalendar](self, "isNaturalLanguageSuggestedEventCalendar"))
      {
        result = EKCalendarTypeBirthday|EKCalendarTypeCalDAV;
      }
      else
      {
        result = EKCalendarTypeBirthday;
      }
      break;
    case 6:
      result = EKCalendarTypeBirthday|EKCalendarTypeExchange;
      break;
    default:
      return result;
  }
  return result;
}

- (BOOL)_flagValueWithMask:(unsigned int)a3
{
  return (-[EKCalendar flags](self, "flags") & a3) != 0;
}

- (unsigned)flags
{
  void *v2;
  unsigned int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B468]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (EKSource)source
{
  return (EKSource *)-[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B578]);
}

- (BOOL)isSubscribed
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 8);
}

- (BOOL)isChinaHolidayCalendar
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 0x2000000);
}

- (BOOL)isNaturalLanguageSuggestedEventCalendar
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 0x80000);
}

- (BOOL)isHidden
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 2);
}

+ (id)EKObjectChangeSummarizer_singleValueDiffKeys
{
  if (EKObjectChangeSummarizer_singleValueDiffKeys_onceToken != -1)
    dispatch_once(&EKObjectChangeSummarizer_singleValueDiffKeys_onceToken, &__block_literal_global_53);
  return (id)EKObjectChangeSummarizer_singleValueDiffKeys_diffKeys;
}

void __84__EKCalendar_EKObjectChangeSummarizer__EKObjectChangeSummarizer_singleValueDiffKeys__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B438];
  v3[0] = *MEMORY[0x1E0D0B5B0];
  v3[1] = v0;
  v4[0] = CFSTR("EKChangedCalendarTitle");
  v4[1] = CFSTR("EKChangedCalendarColor");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)EKObjectChangeSummarizer_singleValueDiffKeys_diffKeys;
  EKObjectChangeSummarizer_singleValueDiffKeys_diffKeys = v1;

}

+ (id)EKObjectChangeSummarizer_multiValueDiffKeys
{
  if (EKObjectChangeSummarizer_multiValueDiffKeys_onceToken != -1)
    dispatch_once(&EKObjectChangeSummarizer_multiValueDiffKeys_onceToken, &__block_literal_global_96_0);
  return (id)EKObjectChangeSummarizer_multiValueDiffKeys_diffKeys;
}

void __83__EKCalendar_EKObjectChangeSummarizer__EKObjectChangeSummarizer_multiValueDiffKeys__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];
  _QWORD v5[3];
  _QWORD v6[3];
  _QWORD v7[3];
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = *MEMORY[0x1E0D0B418];
  v6[0] = CFSTR("add");
  v6[1] = CFSTR("remove");
  v7[0] = CFSTR("EKChangedAlarmsAdded");
  v7[1] = CFSTR("EKChangedAlarmsRemoved");
  v6[2] = CFSTR("modify");
  v7[2] = CFSTR("EKChangedAlarmsModified");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 3);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = *MEMORY[0x1E0D0B560];
  v9[0] = v0;
  v4[0] = CFSTR("add");
  v4[1] = CFSTR("remove");
  v5[0] = CFSTR("EKChangedShareesAdded");
  v5[1] = CFSTR("EKChangedShareesRemoved");
  v4[2] = CFSTR("modify");
  v5[2] = CFSTR("EKChangedShareesModified");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)EKObjectChangeSummarizer_multiValueDiffKeys_diffKeys;
  EKObjectChangeSummarizer_multiValueDiffKeys_diffKeys = v2;

}

+ (id)rowIDsForCalendars:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "objectID", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "rowID"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v12);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (Class)frozenClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)isWeakRelationship
{
  return 1;
}

+ (id)knownRelationshipWeakKeys
{
  if (knownRelationshipWeakKeys_onceToken_4 != -1)
    dispatch_once(&knownRelationshipWeakKeys_onceToken_4, &__block_literal_global_64);
  return (id)knownRelationshipWeakKeys_keys_4;
}

void __39__EKCalendar_knownRelationshipWeakKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0B578];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownRelationshipWeakKeys_keys_4;
  knownRelationshipWeakKeys_keys_4 = v0;

}

+ (id)knownRelationshipSingleValueKeys
{
  if (knownRelationshipSingleValueKeys_onceToken_3 != -1)
    dispatch_once(&knownRelationshipSingleValueKeys_onceToken_3, &__block_literal_global_29);
  return (id)knownRelationshipSingleValueKeys_keys_3;
}

void __46__EKCalendar_knownRelationshipSingleValueKeys__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[4];

  v3[3] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B5A0];
  v3[0] = *MEMORY[0x1E0D0B578];
  v3[1] = v0;
  v3[2] = *MEMORY[0x1E0D0B470];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 3);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)knownRelationshipSingleValueKeys_keys_3;
  knownRelationshipSingleValueKeys_keys_3 = v1;

}

+ (id)knownRelationshipMultiValueKeys
{
  if (knownRelationshipMultiValueKeys_onceToken_3 != -1)
    dispatch_once(&knownRelationshipMultiValueKeys_onceToken_3, &__block_literal_global_30);
  return (id)knownRelationshipMultiValueKeys_keys_3;
}

void __45__EKCalendar_knownRelationshipMultiValueKeys__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B560];
  v3[0] = *MEMORY[0x1E0D0B418];
  v3[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)knownRelationshipMultiValueKeys_keys_3;
  knownRelationshipMultiValueKeys_keys_3 = v1;

}

+ (id)knownIdentityKeysForComparison
{
  if (knownIdentityKeysForComparison_onceToken_7 != -1)
    dispatch_once(&knownIdentityKeysForComparison_onceToken_7, &__block_literal_global_31);
  return (id)knownIdentityKeysForComparison_keys_7;
}

void __44__EKCalendar_knownIdentityKeysForComparison__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = *MEMORY[0x1E0D0B820];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)knownIdentityKeysForComparison_keys_7;
  knownIdentityKeysForComparison_keys_7 = v0;

}

+ (id)knownSingleValueKeysForComparison
{
  if (knownSingleValueKeysForComparison_onceToken_6 != -1)
    dispatch_once(&knownSingleValueKeysForComparison_onceToken_6, &__block_literal_global_32);
  return (id)knownSingleValueKeysForComparison_keys_6;
}

void __47__EKCalendar_knownSingleValueKeysForComparison__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[31];

  v17[30] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D0B438];
  v17[0] = *MEMORY[0x1E0D0B420];
  v17[1] = v0;
  v1 = *MEMORY[0x1E0D0B448];
  v17[2] = *MEMORY[0x1E0D0B440];
  v17[3] = v1;
  v2 = *MEMORY[0x1E0D0B468];
  v17[4] = *MEMORY[0x1E0D0B460];
  v17[5] = v2;
  v3 = *MEMORY[0x1E0D0B480];
  v17[6] = *MEMORY[0x1E0D0B478];
  v17[7] = v3;
  v4 = *MEMORY[0x1E0D0B4C0];
  v17[8] = *MEMORY[0x1E0D0B4B0];
  v17[9] = v4;
  v5 = *MEMORY[0x1E0D0B4D0];
  v17[10] = *MEMORY[0x1E0D0B4C8];
  v17[11] = v5;
  v6 = *MEMORY[0x1E0D0B4E0];
  v17[12] = *MEMORY[0x1E0D0B4D8];
  v17[13] = v6;
  v7 = *MEMORY[0x1E0D0B4F0];
  v17[14] = *MEMORY[0x1E0D0B4E8];
  v17[15] = v7;
  v8 = *MEMORY[0x1E0D0B520];
  v17[16] = *MEMORY[0x1E0D0B500];
  v17[17] = v8;
  v9 = *MEMORY[0x1E0D0B530];
  v17[18] = *MEMORY[0x1E0D0B528];
  v17[19] = v9;
  v10 = *MEMORY[0x1E0D0B540];
  v17[20] = *MEMORY[0x1E0D0B538];
  v17[21] = v10;
  v11 = *MEMORY[0x1E0D0B558];
  v17[22] = *MEMORY[0x1E0D0B548];
  v17[23] = v11;
  v12 = *MEMORY[0x1E0D0B568];
  v17[24] = *MEMORY[0x1E0D0B550];
  v17[25] = v12;
  v13 = *MEMORY[0x1E0D0B580];
  v17[26] = *MEMORY[0x1E0D0B570];
  v17[27] = v13;
  v14 = *MEMORY[0x1E0D0B5B0];
  v17[28] = *MEMORY[0x1E0D0B598];
  v17[29] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 30);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)knownSingleValueKeysForComparison_keys_6;
  knownSingleValueKeysForComparison_keys_6 = v15;

}

+ (EKCalendar)calendarWithEventStore:(EKEventStore *)eventStore
{
  return (EKCalendar *)objc_msgSend(a1, "calendarForEntityType:eventStore:", 0, eventStore);
}

+ (EKCalendar)calendarForEntityType:(EKEntityType)entityType eventStore:(EKEventStore *)eventStore
{
  EKEventStore *v6;
  char IsReminderBridgeEnabled;
  void *v8;
  void *v9;

  v6 = eventStore;
  if (entityType >= 2)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid entity type passed: %d"), entityType);
  IsReminderBridgeEnabled = CalIsReminderBridgeEnabled();
  if (entityType && (IsReminderBridgeEnabled & 1) != 0)
  {
    -[EKEventStore reminderStore](v6, "reminderStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createNewReminderCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "calendarForEntityTypes:eventStore:", 1 << entityType, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (EKCalendar *)v9;
}

+ (id)calendarForEntityTypes:(unint64_t)a3 eventStore:(id)a4
{
  id v6;
  NSObject *v7;
  EKPersistentCalendar *v8;
  void *v9;
  void *v10;

  v6 = a4;
  if (!v6)
  {
    v7 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      +[EKCalendar calendarForEntityTypes:eventStore:].cold.1(v7);
  }
  v8 = objc_alloc_init(EKPersistentCalendar);
  objc_msgSend(v6, "_registerObject:", v8);
  v9 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPersistentObject:", v8);
  objc_msgSend(v9, "_updateToMaxDisplayOrder");
  EKUUIDString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCalendarIdentifier:", v10);

  objc_msgSend(v9, "setAllowedEntityTypes:", a3);
  return v9;
}

- (void)_updateToMaxDisplayOrder
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[EKObject eventStore](self, "eventStore", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_allCalendars");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v10, "displayOrder") != 0x7FFFFFFF)
        {
          v11 = objc_msgSend(v10, "displayOrder");
          if (v11 > v7)
            v7 = v11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  -[EKCalendar setDisplayOrder:](self, "setDisplayOrder:", (v7 + 1));
}

- (void)reorderBetweenEarlier:(id)a3 later:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v10[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EKCalendar reorderCalendars:betweenEarlier:later:](self, "reorderCalendars:betweenEarlier:later:", v8, v6, v7);

}

- (id)reorderCalendars:(id)a3 betweenEarlier:(id)a4 later:(id)a5
{
  id v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  _QWORD v32[4];
  id v33;
  EKCalendar *v34;
  int v35;

  v8 = a3;
  v9 = (unint64_t)a4;
  v10 = (unint64_t)a5;
  if (!(v9 | v10))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("earlier == nil && later == nil"));
  objc_msgSend((id)v9, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    objc_msgSend((id)v10, "source");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v13 = v14;
    }
    else
    {
      -[EKObject eventStore](self, "eventStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localSource");
      v13 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  v17 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v13, "allCalendars");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "orderSortDescriptors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sortedArrayUsingDescriptors:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrayWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "objectAtIndexedSubscript:", 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "displayOrder");

  objc_msgSend(v21, "removeObjectsInArray:", v8);
  if (v9)
    v24 = v9;
  else
    v24 = v10;
  v25 = objc_msgSend(v21, "indexOfObject:", v24);
  if (v9)
    v26 = v25 + 1;
  else
    v26 = v25;
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v26, objc_msgSend(v8, "count"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "insertObjects:atIndexes:", v8, v27);
  v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __52__EKCalendar_reorderCalendars_betweenEarlier_later___block_invoke;
  v32[3] = &unk_1E4787850;
  v35 = v23;
  v29 = v28;
  v33 = v29;
  v34 = self;
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v32);
  v30 = v29;

  return v30;
}

void __52__EKCalendar_reorderCalendars_betweenEarlier_later___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v5 = a2;
  v6 = (*(_DWORD *)(a1 + 48) + a3);
  v8 = v5;
  if ((_DWORD)v6 != objc_msgSend(v5, "displayOrder"))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
    objc_msgSend(v8, "setDisplayOrder:", v6);
    objc_msgSend(*(id *)(a1 + 40), "eventStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "saveCalendar:commit:error:", v8, 0, 0);

  }
}

+ (id)orderSortDescriptors
{
  if (orderSortDescriptors_onceToken != -1)
    dispatch_once(&orderSortDescriptors_onceToken, &__block_literal_global_40);
  return (id)orderSortDescriptors_descriptors;
}

void __34__EKCalendar_orderSortDescriptors__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("source.isDelegate"), 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("source._adjustedDisplayOrder"), 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("source.sourceType"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("displayOrder"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v6[1] = v1;
  v6[2] = v2;
  v6[3] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)orderSortDescriptors_descriptors;
  orderSortDescriptors_descriptors = v4;

}

- (EKCalendar)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], CFSTR("Can't directly init a calendar. Use calendarWithEventStore"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (int)entityType
{
  return 1;
}

- (void)rollback
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKCalendar;
  -[EKObject rollback](&v3, sel_rollback);
  -[EKCalendar _clearCGColorCache](self, "_clearCGColorCache");
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKCalendar;
  -[EKObject reset](&v3, sel_reset);
  -[EKCalendar _clearCGColorCache](self, "_clearCGColorCache");
}

- (BOOL)_reset
{
  _BOOL4 v3;
  uint64_t v4;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EKCalendar;
  v3 = -[EKObject _reset](&v7, sel__reset);
  if (v3)
  {
    v4 = objc_opt_class();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __20__EKCalendar__reset__block_invoke;
    v6[3] = &unk_1E47864F0;
    v6[4] = self;
    LOBYTE(v3) = -[EKObject _resetIfBackingObjectIsOfClass:fetchResetFrozenObjectBlock:](self, "_resetIfBackingObjectIsOfClass:fetchResetFrozenObjectBlock:", v4, v6);
  }
  return v3;
}

id __20__EKCalendar__reset__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "eventStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reminderStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "backingCalendarWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setUnlocalizedTitle:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B5B0]);
}

- (id)lastSyncTitle
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B498]);
}

- (void)setLastSyncTitle:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B498]);
}

+ (id)_eventKitBundle
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__EKCalendar__eventKitBundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_eventKitBundle_onceToken != -1)
    dispatch_once(&_eventKitBundle_onceToken, block);
  return (id)_eventKitBundle_bundle;
}

void __29__EKCalendar__eventKitBundle__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_eventKitBundle_bundle;
  _eventKitBundle_bundle = v1;

}

- (void)assignColorForNewCalendarIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[EKCalendar colorStringRaw](self, "colorStringRaw");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[EKObject eventStore](self, "eventStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "colorStringForNewCalendar");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    v5 = v6;
    if (v6)
    {
      -[EKCalendar setColorStringRaw:](self, "setColorStringRaw:", v6);
      -[EKCalendar setColorDisplayOnly:](self, "setColorDisplayOnly:", 1);
      v5 = v6;
    }

  }
}

- (void)setSymbolicColorName:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v5, *MEMORY[0x1E0D0B598]);
  objc_msgSend((id)EKSymbolicColorToRGBMapping(), "objectForKey:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[EKCalendar setColorStringRaw:](self, "setColorStringRaw:", v4);
  if (v5 && (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DDBBD0]) & 1) == 0)
    -[EKCalendar _clearCGColorCache](self, "_clearCGColorCache");

}

- (BOOL)isColorDisplayOnly
{
  void *v2;
  char v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B430]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setColorDisplayOnly:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B430]);

}

- (id)colorStringRaw
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B438]);
}

- (void)setColorStringRaw:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B438]);
}

- (void)setColorString:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    -[EKCalendar _clearCGColorCache](self, "_clearCGColorCache");
    v4 = 0;
  }
  -[EKCalendar setColorStringRaw:](self, "setColorStringRaw:", v4);
  -[EKCalendar setColorDisplayOnly:](self, "setColorDisplayOnly:", 0);
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", *MEMORY[0x1E0DDBBD0], *MEMORY[0x1E0D0B598]);

}

- (void)_clearCGColorCache
{
  -[EKObject clearCachedValueForKey:](self, "clearCachedValueForKey:", CFSTR("CGColor"));
}

- (void)setCGColor:(CGColorRef)CGColor
{
  CGColor *v5;
  const CGFloat *Components;
  char *__ptr32 *v7;
  uint64_t v8;
  uint64_t v9;
  CGColorWrapper *v10;
  id v11;

  v5 = -[EKCalendar CGColor](self, "CGColor");
  if (v5 != CGColor && ((CGColor != 0) != (v5 != 0) || !CGColorEqualToColor(CGColor, v5)))
  {
    if (CGColorGetNumberOfComponents(CGColor) < 3)
    {
      if (objc_msgSend(MEMORY[0x1E0D0C278], "isProgramSDKAtLeast:", 0x7E50901FFFFFFFFLL))
        -[EKCalendar setColorString:](self, "setColorString:", 0);
    }
    else
    {
      Components = CGColorGetComponents(CGColor);
      v7 = &off_1A244A000;
      LODWORD(v7) = llround(*Components * 255.0);
      LODWORD(v8) = llround(Components[1] * 255.0);
      LODWORD(v9) = llround(Components[2] * 255.0);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%02x%02x%02x"), v7, v8, v9);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[EKCalendar setColorStringRaw:](self, "setColorStringRaw:", v11);
      -[EKCalendar setColorDisplayOnly:](self, "setColorDisplayOnly:", 0);
      -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", *MEMORY[0x1E0DDBBD0], *MEMORY[0x1E0D0B598]);
      v10 = -[CGColorWrapper initWithCGColor:]([CGColorWrapper alloc], "initWithCGColor:", CGColor);
      -[EKObject setCachedValue:forKey:](self, "setCachedValue:forKey:", v10, CFSTR("CGColor"));

    }
  }
}

- (id)locale
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B4A0]);
}

- (void)setLocale:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B4A0]);
}

- (void)setUUID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B820]);
}

- (void)setFlags:(unsigned int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B468]);

}

- (void)_setFlagValue:(BOOL)a3 withMask:(unsigned int)a4
{
  _BOOL4 v5;
  unsigned int v7;
  uint64_t v8;

  v5 = a3;
  v7 = -[EKCalendar flags](self, "flags");
  if (v5)
    v8 = v7 | a4;
  else
    v8 = v7 & ~a4;
  -[EKCalendar setFlags:](self, "setFlags:", v8);
}

- (BOOL)allowsContentModifications
{
  void *v3;
  char v4;
  void *v5;
  EKCalendarType v6;
  char v7;
  BOOL v9;
  void *v10;
  void *v11;

  -[EKObject eventStore](self, "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "skipModificationValidation");

  if ((v4 & 1) != 0 || (objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessHasSyncClientEntitlement") & 1) != 0)
    return 1;
  -[EKObject eventStore](self, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "allowsBirthdayModifications"))
  {
    v6 = -[EKCalendar type](self, "type");

    if (v6 == EKCalendarTypeBirthday)
      return 1;
  }
  else
  {

  }
  v9 = -[EKCalendar readOnly](self, "readOnly");
  -[EKCalendar source](self, "source");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    v7 = 0;
  }
  else if (v10)
  {
    v7 = objc_msgSend(v10, "isWritable");
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)readOnly
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 1);
}

- (void)setReadOnly:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 1);
}

- (int)displayOrder
{
  void *v2;
  int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B448]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setDisplayOrder:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B448]);

}

+ (id)typeDescription:(int64_t)a3
{
  id v4;

  if ((unint64_t)a3 >= 7)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Encountered illegal value for EKCalendarType"), 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v4);
  }
  return off_1E4787A28[a3];
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EKCalendar title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "typeDescription:", -[EKCalendar type](self, "type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[EKCalendar allowsContentModifications](self, "allowsContentModifications"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  -[EKCalendar colorString](self, "colorString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> {title = %@; type = %@; allowsModify = %@; color = %@;}"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)refresh
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKCalendar;
  v3 = -[EKObject refresh](&v5, sel_refresh);
  if (v3)
    -[EKCalendar _clearCGColorCache](self, "_clearCGColorCache");
  return v3;
}

- (BOOL)isDefaultSchedulingCalendar
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 1024);
}

- (void)setIsDefaultSchedulingCalendar:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 1024);
}

- (BOOL)isInbox
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 32);
}

- (void)setInbox:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 32);
}

- (BOOL)isNotificationsCollection
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 64);
}

- (void)setNotificationsCollection:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 64);
}

- (void)setSubscribed:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 8);
}

- (void)setHidden:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 2);
}

- (BOOL)allowsDeletionOrPropertyModifications
{
  if (-[EKCalendar isDeletable](self, "isDeletable"))
    return 1;
  else
    return !-[EKCalendar isImmutable](self, "isImmutable");
}

- (BOOL)isImmutable
{
  void *v3;
  char v4;
  void *v5;
  char v6;
  void *v7;
  BOOL v8;

  if (-[EKCalendar type](self, "type") == EKCalendarTypeBirthday)
  {
    -[EKObject eventStore](self, "eventStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "allowsBirthdayModifications");

    if ((v4 & 1) != 0)
      return 0;
  }
  if (-[EKCalendar type](self, "type") == (EKCalendarTypeBirthday|EKCalendarTypeExchange))
  {
    -[EKObject eventStore](self, "eventStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "allowsIntegrationModifications");

    if ((v6 & 1) != 0)
      return 0;
  }
  -[EKObject eventStore](self, "eventStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "eventAccessLevel") == 1)
  {
    v8 = -[EKCalendar allowEvents](self, "allowEvents");

    if (v8)
      return 1;
  }
  else
  {

  }
  return !-[EKObject isNew](self, "isNew") && -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 4);
}

- (BOOL)isImmutableRaw
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 4);
}

- (void)setImmutable:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 4);
}

- (id)image
{
  return -[EKObject meltedAndCachedSingleRelationObjectForKey:](self, "meltedAndCachedSingleRelationObjectForKey:", *MEMORY[0x1E0D0B470]);
}

- (void)setImage:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x1E0D0B470];
  v5 = a3;
  -[EKObject updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:](self, "updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:", v5, v4, objc_opt_class());

}

- (BOOL)isSubscribedCalendarJunk
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 0x800000);
}

- (void)setIsSubscribedCalendarJunk:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 0x800000);
}

- (BOOL)isDeletable
{
  return -[EKCalendar isDeletableWithAllKnownCalendars:](self, "isDeletableWithAllKnownCalendars:", 0);
}

- (BOOL)isDeletableWithAllKnownCalendars:(id)a3
{
  return -[EKCalendar _validateDeletableWithAllKnownCalendars:error:](self, "_validateDeletableWithAllKnownCalendars:error:", a3, 0);
}

- (BOOL)_validateDeletable:(id *)a3
{
  return -[EKCalendar _validateDeletableWithAllKnownCalendars:error:](self, "_validateDeletableWithAllKnownCalendars:error:", 0, a3);
}

- (BOOL)_validateDeletableWithAllKnownCalendars:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (-[EKCalendar _validateDeletableDueToAccessConsent:](self, "_validateDeletableDueToAccessConsent:", a4))
    v7 = -[EKCalendar _validateDeletableHelperWithAllKnownCalendars:error:](self, "_validateDeletableHelperWithAllKnownCalendars:error:", v6, a4);
  else
    v7 = 0;

  return v7;
}

- (BOOL)_validateDeletableDueToAccessConsent:(id *)a3
{
  void *v5;
  int v6;
  BOOL v7;

  if (-[EKCalendar allowEvents](self, "allowEvents"))
  {
    -[EKObject eventStore](self, "eventStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "eventAccessLevel");

    if (v6 == 2)
      return 1;
  }
  if (!-[EKCalendar allowReminders](self, "allowReminders")
    || (v7 = 1,
        +[EKEventStore realAuthorizationStatusForEntityType:](EKEventStore, "realAuthorizationStatusForEntityType:", 1) != 3))
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 29);
      v7 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  return v7;
}

- (BOOL)_validateDeletableHelperWithAllKnownCalendars:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  int v19;
  void *v20;
  char v21;
  int v22;
  int v24;
  _BOOL4 v25;

  v6 = a3;
  if (!-[EKCalendar isMarkedUndeletable](self, "isMarkedUndeletable"))
  {
    v9 = 1;
    switch(-[EKCalendar type](self, "type"))
    {
      case EKCalendarTypeLocal:
      case EKCalendarTypeSubscription:
        goto LABEL_31;
      case EKCalendarTypeCalDAV:
        -[EKCalendar source](self, "source");
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10
          && (v11 = (void *)v10,
              -[EKCalendar source](self, "source"),
              v12 = (void *)objc_claimAutoreleasedReturnValue(),
              v13 = objc_msgSend(v12, "isWritable"),
              v12,
              v11,
              (v13 & 1) == 0))
        {
          if (!a4)
            goto LABEL_30;
          v7 = (void *)MEMORY[0x1E0CB35C8];
          v8 = 56;
        }
        else
        {
          -[EKCalendar source](self, "source");
          v14 = objc_claimAutoreleasedReturnValue();
          if (!v14)
            goto LABEL_21;
          v15 = (void *)v14;
          -[EKCalendar source](self, "source");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "allowsCalendarAddDeleteModify");

          if ((v17 & 1) != 0)
            goto LABEL_21;
          if (!a4)
            goto LABEL_30;
          v7 = (void *)MEMORY[0x1E0CB35C8];
          v8 = 52;
        }
        goto LABEL_4;
      case EKCalendarTypeExchange:
        -[EKCalendar source](self, "source");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isDelegate");

        if (v19)
        {
          if (!a4)
            goto LABEL_30;
          v7 = (void *)MEMORY[0x1E0CB35C8];
          v8 = 55;
          goto LABEL_4;
        }
        if (-[EKCalendar isDefaultSchedulingCalendar](self, "isDefaultSchedulingCalendar"))
        {
          if (!a4)
            goto LABEL_30;
          v7 = (void *)MEMORY[0x1E0CB35C8];
          v8 = 53;
          goto LABEL_4;
        }
LABEL_21:
        if (-[EKCalendar isSubscribed](self, "isSubscribed"))
        {
          v9 = 1;
          goto LABEL_31;
        }
        if (-[EKCalendar allowEvents](self, "allowEvents"))
        {
          if (!-[EKCalendar _anotherCalendarForDefaultSchedulingExistsWithAllKnownCalendars:](self, "_anotherCalendarForDefaultSchedulingExistsWithAllKnownCalendars:", v6))
          {
            if (a4)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 51);
              v9 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v9 = 0;
            }
            v22 = 1;
LABEL_36:
            if (-[EKCalendar allowReminders](self, "allowReminders"))
            {
              if (-[EKCalendar _anotherCalendarForRemindersExistsWithAllKnownCalendars:](self, "_anotherCalendarForRemindersExistsWithAllKnownCalendars:", v6))
              {
                v24 = 0;
LABEL_43:
                if (-[EKCalendar allowEvents](self, "allowEvents"))
                {
                  v25 = -[EKCalendar allowReminders](self, "allowReminders");
                  if ((v22 | v24) == 1 && v25 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
                    -[EKCalendar _validateDeletableHelperWithAllKnownCalendars:error:].cold.1();
                }
                goto LABEL_31;
              }
              if (a4)
              {
                objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 57);
                v9 = 0;
                *a4 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v9 = 0;
              }
            }
            v24 = 1;
            goto LABEL_43;
          }
          v22 = 0;
        }
        else
        {
          v22 = 1;
        }
        v9 = 1;
        goto LABEL_36;
      case EKCalendarTypeBirthday:
        -[EKObject eventStore](self, "eventStore");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "allowsBirthdayModifications");
        goto LABEL_17;
      case EKCalendarTypeBirthday|EKCalendarTypeExchange:
        -[EKObject eventStore](self, "eventStore");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "allowsIntegrationModifications");
LABEL_17:
        v9 = v21;

        goto LABEL_31;
      default:
        goto LABEL_21;
    }
  }
  if (!a4)
  {
LABEL_30:
    v9 = 0;
    goto LABEL_31;
  }
  v7 = (void *)MEMORY[0x1E0CB35C8];
  v8 = 54;
LABEL_4:
  objc_msgSend(v7, "errorWithEKErrorCode:", v8);
  v9 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_31:

  return v9;
}

- (int64_t)deletionWarningsMask
{
  int64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  int v13;

  if ((-[EKCalendar allowedEntityTypes](self, "allowedEntityTypes") & 2) != 0)
    v3 = 8 * (-[EKCalendar allowedEntityTypes](self, "allowedEntityTypes") & 1);
  else
    v3 = 0;
  if (-[EKCalendar sharingStatus](self, "sharingStatus") == 2)
    v3 |= 0x10uLL;
  -[EKCalendar source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "sourceType"))
  {
    -[EKCalendar source](self, "source");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "sourceType");

    if (v6 != 2)
      return v3;
  }
  else
  {

  }
  -[EKObject eventStore](self, "eventStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "futureScheduledEventsExistOnCalendar:", self);

  if (v8)
    v9 = v3 | 4;
  else
    v9 = v3;
  -[EKObject eventStore](self, "eventStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "eventsExistOnCalendar:", self);

  if (v11)
    v3 = v9 | 2;
  else
    v3 = v9;
  if (-[EKCalendar sharingStatus](self, "sharingStatus") != 2)
  {
    -[EKObject eventStore](self, "eventStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "eventsMarkedScheduleAgentClientExistOnCalendar:", self);

    if (v13)
      return v3 | 0x20;
  }
  return v3;
}

- (BOOL)canMergeWithCalendar:(id)a3
{
  EKCalendar *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  BOOL v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;

  v4 = (EKCalendar *)a3;
  if (self == v4
    || (-[EKObject uniqueIdentifier](self, "uniqueIdentifier"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        -[EKObject uniqueIdentifier](v4, "uniqueIdentifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "isEqualToString:", v6),
        v6,
        v5,
        v7))
  {
    v8 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      -[EKCalendar canMergeWithCalendar:].cold.1(v8, self, v4);
  }
  else
  {
    -[EKCalendar source](self, "source");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendar source](v4, "source");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uniqueIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "isEqualToString:", v14);

    if ((v15 & 1) != 0)
    {
      if (-[EKCalendar allowsContentModifications](self, "allowsContentModifications"))
      {
        if (-[EKCalendar allowsContentModifications](v4, "allowsContentModifications"))
        {
          if (-[EKCalendar sharingStatus](self, "sharingStatus") == 2)
          {
            if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
              -[EKCalendar canMergeWithCalendar:].cold.2();
          }
          else if (-[EKCalendar allowReminders](self, "allowReminders"))
          {
            if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
              -[EKCalendar canMergeWithCalendar:].cold.3();
          }
          else if (-[EKCalendar allowsScheduling](self, "allowsScheduling")
                 || !-[EKCalendar sharingStatus](v4, "sharingStatus")
                 || -[EKCalendar sharingStatus](self, "sharingStatus"))
          {
            if (-[EKCalendar isDeletable](self, "isDeletable"))
            {
              v9 = 1;
              goto LABEL_6;
            }
            if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
              -[EKCalendar canMergeWithCalendar:].cold.4();
          }
          else
          {
            v17 = (void *)EKLogHandle;
            if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
              -[EKCalendar canMergeWithCalendar:].cold.5(v17, self, v4);
          }
        }
        else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
        {
          -[EKCalendar canMergeWithCalendar:].cold.6();
        }
      }
      else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
      {
        -[EKCalendar canMergeWithCalendar:].cold.7();
      }
    }
    else
    {
      v16 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_DEBUG))
        -[EKCalendar canMergeWithCalendar:].cold.8(v16, self, v4);
    }
  }
  v9 = 0;
LABEL_6:

  return v9;
}

- (BOOL)eligibleForDefaultSchedulingCalendar
{
  EKCalendarType v3;
  _BOOL4 v4;

  v3 = -[EKCalendar type](self, "type");
  LOBYTE(v4) = 0;
  switch(v3)
  {
    case EKCalendarTypeLocal:
    case EKCalendarTypeExchange:
      goto LABEL_2;
    case EKCalendarTypeCalDAV:
      v4 = -[EKCalendar allowEvents](self, "allowEvents");
      if (v4)
      {
        if (-[EKCalendar sharingStatus](self, "sharingStatus") == 2)
          LOBYTE(v4) = 0;
        else
LABEL_2:
          LOBYTE(v4) = -[EKCalendar allowsScheduling](self, "allowsScheduling");
      }
      break;
    case EKCalendarTypeSubscription:
    case EKCalendarTypeBirthday:
      return v4;
    default:
      LOBYTE(v4) = 1;
      break;
  }
  return v4;
}

- (BOOL)_anotherCalendarForDefaultSchedulingExistsWithAllKnownCalendars:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  if (-[EKCalendar isDefaultSchedulingCalendar](self, "isDefaultSchedulingCalendar"))
    v5 = &__block_literal_global_84;
  else
    v5 = &__block_literal_global_85;
  v6 = -[EKCalendar _anyCalendarExistsInSameSourceOfType:withAllKnownCalendars:passingTest:](self, "_anyCalendarExistsInSameSourceOfType:withAllKnownCalendars:passingTest:", 0, v4, v5);

  return v6;
}

uint64_t __78__EKCalendar__anotherCalendarForDefaultSchedulingExistsWithAllKnownCalendars___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "eligibleForDefaultSchedulingCalendar");
}

uint64_t __78__EKCalendar__anotherCalendarForDefaultSchedulingExistsWithAllKnownCalendars___block_invoke_2()
{
  return 1;
}

- (BOOL)_anotherCalendarForRemindersExistsWithAllKnownCalendars:(id)a3
{
  return -[EKCalendar _anyCalendarExistsInSameSourceOfType:withAllKnownCalendars:passingTest:](self, "_anyCalendarExistsInSameSourceOfType:withAllKnownCalendars:passingTest:", 1, a3, &__block_literal_global_86);
}

uint64_t __70__EKCalendar__anotherCalendarForRemindersExistsWithAllKnownCalendars___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allowReminders");
}

- (BOOL)_anyCalendarExistsInSameSourceOfType:(unint64_t)a3 withAllKnownCalendars:(id)a4 passingTest:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  BOOL v19;
  uint64_t (**v21)(id, void *);
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v21 = (uint64_t (**)(id, void *))a5;
  -[EKCalendar source](self, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[EKObject eventStore](self, "eventStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_allCalendars");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v23;
LABEL_5:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v15);
      objc_msgSend(v16, "source");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqual:", v9);

      if (v18)
      {
        if (a3)
        {
          if (a3 == 1 && (objc_msgSend(v16, "allowReminders") & 1) != 0)
          {
LABEL_14:
            if ((objc_msgSend(v16, "isEqual:", self) & 1) == 0 && (v21[2](v21, v16) & 1) != 0)
            {
              v19 = 1;
              goto LABEL_20;
            }
          }
        }
        else if (objc_msgSend(v16, "allowEvents"))
        {
          goto LABEL_14;
        }
      }
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v13)
          goto LABEL_5;
        break;
      }
    }
  }
  v19 = 0;
LABEL_20:

  return v19;
}

- (BOOL)allowsScheduling
{
  return !-[EKCalendar prohibitsScheduling](self, "prohibitsScheduling");
}

- (void)setAllowsScheduling:(BOOL)a3
{
  -[EKCalendar setProhibitsScheduling:](self, "setProhibitsScheduling:", !a3);
}

- (BOOL)prohibitsScheduling
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 16);
}

- (void)setProhibitsScheduling:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 16);
}

- (BOOL)isSharingInvitation
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 128);
}

- (void)setSharingInvitation:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 128);
}

- (unint64_t)sharingStatus
{
  void *v2;
  unint64_t v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B570]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setSharingStatus:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B570]);

}

- (unint64_t)invitationStatus
{
  void *v2;
  unint64_t v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B478]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setInvitationStatus:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B478]);

}

- (void)clearInvitationStatus
{
  id v2;

  -[EKObject persistentObject](self, "persistentObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unloadPropertyForKey:", *MEMORY[0x1E0D0B478]);

}

- (void)setSharingInvitationResponse:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B568]);

}

- (unint64_t)sharingInvitationResponse
{
  void *v2;
  unint64_t v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B568]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setSharedOwnerName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B550]);
}

- (id)sharedOwnerName
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B550]);
}

- (void)setSharedOwnerURLString:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B558]);
}

- (id)sharedOwnerURLString
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B558]);
}

- (void)setSharedOwnerURL:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKCalendar setSharedOwnerURLString:](self, "setSharedOwnerURLString:", v4);

}

- (id)sharedOwnerURL
{
  void *v2;
  void *v3;

  -[EKCalendar sharedOwnerURLString](self, "sharedOwnerURLString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setSharedOwnerAddress:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKCalendar setSharedOwnerURL:](self, "setSharedOwnerURL:", v4);

}

- (id)sharedOwnerAddress
{
  void *v2;
  void *v3;

  -[EKCalendar sharedOwnerURL](self, "sharedOwnerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sharedOwnerEmail
{
  void *v2;
  void *v3;

  -[EKCalendar sharedOwnerURL](self, "sharedOwnerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cal_emailAddressString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sharedOwnerPhoneNumber
{
  void *v2;
  void *v3;

  -[EKCalendar sharedOwnerURL](self, "sharedOwnerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cal_phoneNumberString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cachedExternalInfoData
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B428]);
}

- (void)setCachedExternalInfoData:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B428]);
}

- (id)cachedExternalInfo
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__EKCalendar_cachedExternalInfo__block_invoke;
  v3[3] = &unk_1E4784B98;
  v3[4] = self;
  -[EKObject cachedValueForKey:populateBlock:](self, "cachedValueForKey:populateBlock:", CFSTR("cachedExternalInfoDictionary"), v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __32__EKCalendar_cachedExternalInfo__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "cachedExternalInfoData");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v7 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v1, 0, 0, &v7);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v7;
    if (v2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v4 = v2;
LABEL_11:

        goto LABEL_12;
      }
      v5 = (void *)EKLogHandle;
      if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
        __32__EKCalendar_cachedExternalInfo__block_invoke_cold_2(v5);
    }
    else if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      __32__EKCalendar_cachedExternalInfo__block_invoke_cold_1();
    }
    v4 = 0;
    goto LABEL_11;
  }
  v4 = 0;
LABEL_12:

  return v4;
}

- (void)setCachedExternalInfo:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  if (!v4)
  {
    v7 = 0;
    goto LABEL_5;
  }
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v8);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v8;
  v7 = v6;
  if (v5)
  {

    v7 = (void *)v5;
LABEL_5:
    -[EKObject setCachedValue:forKey:](self, "setCachedValue:forKey:", v4, CFSTR("cachedExternalInfoDictionary"));
    -[EKCalendar setCachedExternalInfoData:](self, "setCachedExternalInfoData:", v7);
    goto LABEL_8;
  }
  if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    -[EKCalendar setCachedExternalInfo:].cold.1();
LABEL_8:

}

- (id)externalInfoForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[EKCalendar cachedExternalInfo](self, "cachedExternalInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)sharedOwnerAddresses
{
  return -[EKCalendar externalInfoForKey:](self, "externalInfoForKey:", *MEMORY[0x1E0D0B250]);
}

- (id)sharedOwnerAddressesWithoutScheme
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[EKCalendar sharedOwnerAddresses](self, "sharedOwnerAddresses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(id *)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v9, "hasMailto", (_QWORD)v13))
          {
            objc_msgSend(v9, "stringRemovingMailto");
            v10 = objc_claimAutoreleasedReturnValue();

            v9 = (id)v10;
          }
          if (objc_msgSend(v9, "hasTel"))
          {
            objc_msgSend(v9, "stringRemovingTel");
            v11 = objc_claimAutoreleasedReturnValue();

            v9 = (id)v11;
          }
          objc_msgSend(v3, "addObject:", v9);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)publishURLString
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B500]);
}

- (void)setPublishURLString:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B500]);
}

- (id)publishURL
{
  void *v2;
  void *v3;

  -[EKCalendar publishURLString](self, "publishURLString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setPublishURL:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKCalendar setPublishURLString:](self, "setPublishURLString:", v4);

}

- (void)setIsPublished:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B480]);

}

- (BOOL)isPublished
{
  void *v2;
  char v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B480]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (BOOL)canBePublished
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 256);
}

- (void)setCanBePublished:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 256);
}

- (BOOL)canBeShared
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 2048);
  if (v3)
  {
    -[EKCalendar source](self, "source");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "supportsSharedCalendars");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (void)setCanBeShared:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 2048);
}

- (BOOL)isFacebookBirthdayCalendar
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 512);
}

- (void)setFacebookBirthdayCalendar:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 512);
}

- (void)setSyncedHolidayCalendar:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 0x1000000);
}

- (void)setSubscribedHolidayCalendar:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 4096);
}

- (void)setChinaHolidayCalendar:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 0x2000000);
}

- (BOOL)isFamilyCalendar
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 0x2000);
}

- (void)setFamilyCalendar:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 0x2000);
}

- (BOOL)isMarkedUndeletable
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 0x4000);
}

- (void)setMarkedUndeletable:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 0x4000);
}

- (BOOL)isMarkedImmutableSharees
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 0x8000);
}

- (void)setMarkedImmutableSharees:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 0x8000);
}

- (int64_t)maxAttendees
{
  void *v2;
  int64_t v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B4A8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setMaxAttendees:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B4A8]);

}

- (BOOL)isMutableSuggestionsCalendar
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[EKCalendar isSuggestedEventCalendar](self, "isSuggestedEventCalendar");
  if (v3)
  {
    -[EKObject eventStore](self, "eventStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "canModifySuggestedEventCalendar");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isMutableNaturalLanguageSuggestionsCalendar
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[EKCalendar isNaturalLanguageSuggestedEventCalendar](self, "isNaturalLanguageSuggestedEventCalendar");
  if (v3)
  {
    -[EKObject eventStore](self, "eventStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "canModifySuggestedEventCalendar");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isIgnoringEventAlerts
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 0x10000);
}

- (void)setIsIgnoringEventAlerts:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 0x10000);
}

- (BOOL)allowsIgnoringSharedEventChangeNotifications
{
  void *v2;
  BOOL v3;

  -[EKCalendar sharees](self, "sharees");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (BOOL)isIgnoringSharedCalendarNotifications
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 0x20000);
}

- (void)setIsIgnoringSharedCalendarNotifications:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 0x20000);
}

- (BOOL)isAffectingAvailability
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 0x100000);
}

- (void)setIsAffectingAvailability:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 0x100000);
}

- (id)externalID
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B828]);
}

- (void)setExternalID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B828]);
}

- (id)externalIDTag
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B450]);
}

- (void)setExternalIDTag:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B450]);
}

- (id)externalModificationTag
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B458]);
}

- (void)setExternalModificationTag:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B458]);
}

- (id)syncToken
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B5A8]);
}

- (void)setSyncToken:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B5A8]);
}

- (id)externalRepresentation
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B460]);
}

- (void)setExternalRepresentation:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B460]);
}

- (int)migrationVersion
{
  void *v2;
  void *v3;
  int v4;

  -[EKCalendar externalRepresentation](self, "externalRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0C3C8], "dictionaryWithExternalRepresentationData:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(MEMORY[0x1E0D0C3C8], "migrationVersionFromDictionary:", v3);

  return v4;
}

- (void)setMigrationVersion:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(_QWORD *)&a3;
  -[EKCalendar externalRepresentation](self, "externalRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0C3C8], "dictionaryWithExternalRepresentationData:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D0C3C8], "setMigrationVersion:inDictionary:", v3, v6);
  objc_msgSend(MEMORY[0x1E0D0C3C8], "externalRepresentationDataWithDictionary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendar setExternalRepresentation:](self, "setExternalRepresentation:", v7);

}

- (id)syncHash
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  const char *v7;
  CC_LONG v8;
  id v9;
  const char *v10;
  CC_LONG v11;
  void *v12;
  char data;
  CC_MD5_CTX c;
  unsigned __int8 md[16];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[EKCalendar externalID](self, "externalID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    memset(&c, 0, sizeof(c));
    CC_MD5_Init(&c);
    -[EKCalendar title](self, "title");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = (const char *)objc_msgSend(v6, "UTF8String");

    if (v7)
    {
      v8 = strlen(v7);
      CC_MD5_Update(&c, v7, v8);
    }
    data = -[EKCalendar type](self, "type");
    CC_MD5_Update(&c, &data, 1u);
    -[EKCalendar colorString](self, "colorString");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = (const char *)objc_msgSend(v9, "UTF8String");

    if (v10)
    {
      v11 = strlen(v10);
      CC_MD5_Update(&c, v10, v11);
    }
    CC_MD5_Final(md, &c);
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", md, 16, 0);
    objc_msgSend(v12, "base64EncodedStringWithOptions:", 2);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)selectionSyncIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 100);
  -[EKCalendar source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "sourceType"))
  {
    v6 = CFSTR("LOCAL");
    goto LABEL_5;
  }
  if (objc_msgSend(v4, "sourceType") == 5)
  {
    v6 = CFSTR("BIRTHDAYS");
LABEL_5:

    v5 = (void *)v6;
LABEL_9:
    objc_msgSend(v3, "appendString:", v5);

    goto LABEL_10;
  }
  if (objc_msgSend(v4, "sourceType") == 6)
  {
    objc_msgSend(v4, "externalID");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  if (v5)
    goto LABEL_9;
LABEL_10:
  objc_msgSend(v3, "appendString:", CFSTR(";"));
  -[EKCalendar externalID](self, "externalID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v3, "appendString:", v8);
  }
  else
  {
    -[EKCalendar title](self, "title");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (const __CFString *)v9;
    else
      v11 = CFSTR("-");
    objc_msgSend(v3, "appendString:", v11);

    objc_msgSend(v3, "appendFormat:", CFSTR(";%d;"), -[EKCalendar type](self, "type"));
    -[EKCalendar colorString](self, "colorString");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v12)
      v14 = (const __CFString *)v12;
    else
      v14 = CFSTR("-");
    objc_msgSend(v3, "appendString:", v14);

  }
  v15 = (void *)objc_msgSend(v3, "copy");

  return v15;
}

- (id)externalURI
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[EKCalendar calendarIdentifier](self, "calendarIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if (externalURI_onceToken_0 != -1)
      dispatch_once(&externalURI_onceToken_0, &__block_literal_global_106);
    objc_msgSend(v2, "stringByAddingPercentEncodingWithAllowedCharacters:", externalURI_allowedCharacters_0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("x-apple-calendar://%@"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __25__EKCalendar_externalURI__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "URLFragmentAllowedCharacterSet");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v3, "removeCharactersInString:", CFSTR("/?&:$+,;=@"));
  v1 = objc_msgSend(v3, "copy");
  v2 = (void *)externalURI_allowedCharacters_0;
  externalURI_allowedCharacters_0 = v1;

}

- (void)setSource:(EKSource *)source
{
  uint64_t v4;
  EKSource *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = *MEMORY[0x1E0D0B578];
  v5 = source;
  -[EKObject updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:](self, "updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:", v5, v4, +[EKSource frozenClass](EKSource, "frozenClass"));
  -[EKCalendar setCanBeShared:](self, "setCanBeShared:", -[EKSource supportsSharedCalendars](v5, "supportsSharedCalendars"));
  v6 = -[EKSource supportsSharedCalendars](v5, "supportsSharedCalendars");

  -[EKCalendar setCanBePublished:](self, "setCanBePublished:", v6);
  if ((-[EKCalendar allowedEntityTypes](self, "allowedEntityTypes") & 2) != 0
    && CalIsReminderBridgeEnabled())
  {
    -[EKCalendar source](self, "source");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "backingObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v7;
      -[EKObject eventStore](self, "eventStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "reminderSourceForEventSource:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v10, "frozenObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setReminderSource:", v11);

      }
    }

  }
}

- (void)setAllowedEntities:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B420]);

}

- (void)setAllowedEntityTypes:(unint64_t)a3
{
  uint64_t v3;

  if (a3 == 2)
    v3 = 8;
  else
    v3 = 4 * (a3 == 1);
  -[EKCalendar setAllowedEntities:](self, "setAllowedEntities:", v3);
}

- (BOOL)hasEvents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[EKObject eventStore](self, "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CADOperationProxySync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject CADObjectID](self, "CADObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __23__EKCalendar_hasEvents__block_invoke;
  v8[3] = &unk_1E4787938;
  v8[4] = &v9;
  objc_msgSend(v5, "CADCalendar:hasEvents:", v6, v8);

  LOBYTE(v3) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v3;
}

void __23__EKCalendar_hasEvents__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  id v3;

  if ((_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error checking whether calendar has events: %@"), v3);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (BOOL)hasEventsWithRoomAsAttendee
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[EKObject eventStore](self, "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CADOperationProxySync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject CADObjectID](self, "CADObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__EKCalendar_hasEventsWithRoomAsAttendee__block_invoke;
  v8[3] = &unk_1E4787938;
  v8[4] = &v9;
  objc_msgSend(v5, "CADCalendar:hasEventsWithRoomAsAttendee:", v6, v8);

  LOBYTE(v3) = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v3;
}

void __41__EKCalendar_hasEventsWithRoomAsAttendee__block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  id v3;

  if ((_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithCADResult:", a2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("Error checking whether calendar has events: %@"), v3);

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  }
}

- (BOOL)allowEvents
{
  return -[EKCalendar allowedEntityTypes](self, "allowedEntityTypes") & 1;
}

- (void)setAllowsEvents:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Not implemented"), CFSTR("This stub exists for compatibility with macOS"));
}

- (void)setAllowReminders:(BOOL)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Not implemented"), CFSTR("This stub exists for compatibility with macOS"));
}

- (EKCalendarEventAvailabilityMask)supportedEventAvailabilities
{
  void *v3;
  int v4;
  void *v5;
  int v6;

  if (-[EKCalendar isSubscribed](self, "isSubscribed"))
    return 0;
  -[EKCalendar constraints](self, "constraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canSetAvailability");

  if (!v4)
    return 0;
  -[EKCalendar constraints](self, "constraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "eventAvailabilityLimited");

  if (v6)
    return 3;
  else
    return 15;
}

- (id)refreshDate
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B510]);
}

- (void)setRefreshDate:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B510]);
}

- (int)refreshInterval
{
  void *v2;
  int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B518]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setRefreshInterval:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B518]);

}

- (id)subscriptionID
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B590]);
}

- (void)setSubscriptionID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B590]);
}

- (id)subcalURL
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B588]);
}

- (void)setSubcalURL:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B588]);
}

- (void)setLastSyncError:(unint64_t)a3 userInfo:(id)a4
{
  id v6;
  EKSyncError *v7;
  id v8;

  v6 = a4;
  v8 = v6;
  if (a3 || v6)
  {
    v7 = -[EKSyncError initWithAccountError:userInfo:]([EKSyncError alloc], "initWithAccountError:userInfo:", a3, v6);
    -[EKCalendar setSyncError:](self, "setSyncError:", v7);

  }
  else
  {
    -[EKCalendar setSyncError:](self, "setSyncError:", 0);
  }

}

- (id)lastSyncErrorUserInfo
{
  void *v2;
  void *v3;

  -[EKCalendar syncError](self, "syncError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setSyncError:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = *MEMORY[0x1E0D0B5A0];
  v5 = a3;
  -[EKObject updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:](self, "updateMeltedAndCachedSingleRelationObject:forKey:frozenClass:", v5, v4, +[EKSyncError frozenClass](EKSyncError, "frozenClass"));

}

- (id)calendarError
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString **v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  -[EKCalendar syncError](self, "syncError");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    goto LABEL_11;
  v5 = objc_msgSend(v3, "errorType");
  v6 = objc_msgSend(v4, "errorCode");
  v7 = v6;
  if (v5 == 2)
  {
    if (v6)
    {
      v8 = kEKCalendarErrorDomain;
      goto LABEL_8;
    }
    goto LABEL_11;
  }
  if (v5)
  {
    v13 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKCalendar calendarError].cold.1(v5, (uint64_t)self, v13);
    goto LABEL_11;
  }
  if (!v6)
  {
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  v8 = kEKAccountErrorDomain;
LABEL_8:
  v9 = *v8;
  objc_msgSend(v4, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[EKSyncError augmentSyncErrorUserInfo:for:](EKSyncError, "augmentSyncErrorUserInfo:for:", v10, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v9, v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  return v12;
}

- (void)setLastSyncStartDate:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B490]);
}

- (id)lastSyncStartDate
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B490]);
}

- (void)setLastSyncEndDate:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B488]);
}

- (id)lastSyncEndDate
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B488]);
}

- (BOOL)isSyncing
{
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;

  -[EKCalendar lastSyncStartDate](self, "lastSyncStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendar lastSyncEndDate](self, "lastSyncEndDate");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
  {
    if (!v4)
    {
      v6 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v3, "isEqualToDate:", v4) & 1) == 0)
    {
      objc_msgSend(v3, "laterDate:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "isEqualToDate:", v3);

      goto LABEL_7;
    }
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (BOOL)stripAlarms
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 0x200000);
}

- (void)setStripAlarms:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 0x200000);
}

- (BOOL)stripAttachments
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 0x400000);
}

- (void)setStripAttachments:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 0x400000);
}

- (void)moveSubscribedCalendarToSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__19;
  v21 = __Block_byref_object_dispose__19;
  v22 = 0;
  -[EKObject eventStore](self, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CADOperationProxySync");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject CADObjectID](self, "CADObjectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CADObjectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __45__EKCalendar_moveSubscribedCalendarToSource___block_invoke;
  v14 = &unk_1E4787960;
  v16 = &v17;
  v10 = v5;
  v15 = v10;
  objc_msgSend(v7, "CADDatabaseMigrateSubscribedCalendar:toSource:reply:", v8, v9, &v11);

  if (v18[5])
  {
    -[EKObject setBackingObject:](self, "setBackingObject:", v11, v12, v13, v14);
    -[EKObject _resetAfterUpdatingChangeSetOrBackingObject](self, "_resetAfterUpdatingChangeSetOrBackingObject");
  }

  _Block_object_dispose(&v17, 8);
}

void __45__EKCalendar_moveSubscribedCalendarToSource___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = a3;
  if ((_DWORD)a2)
  {
    v6 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __45__EKCalendar_moveSubscribedCalendarToSource___block_invoke_cold_1(v6, a2);
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    +[EKObjectID objectIDWithCADObjectID:](EKObjectID, "objectIDWithCADObjectID:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerFetchedObjectWithID:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
}

- (BOOL)removeServerRefreshRelatedPropertiesForSelfAndAllEventsSaveAndCommitWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  id v18;
  char v19;
  BOOL v20;
  void *v22;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[EKCalendar setExternalModificationTag:](self, "setExternalModificationTag:", 0);
  -[EKCalendar setDigest:](self, "setDigest:", 0);
  -[EKCalendar setRefreshDate:](self, "setRefreshDate:", 0);
  -[EKObject eventStore](self, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateForCalendarItemsOfType:inCalendar:", 1, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventsMatchingPredicate:", v6);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v22 = v6;
    v10 = a3;
    v11 = 0;
    v12 = *(_QWORD *)v27;
    while (2)
    {
      v13 = 0;
      v14 = v11;
      do
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v7);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
        objc_msgSend(v15, "removeServerRefreshRelatedProperties", v22);
        v25 = v14;
        v16 = objc_msgSend(v5, "saveEvent:span:commit:error:", v15, 3, 0, &v25);
        v11 = v25;

        if ((v16 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
            -[EKCalendar removeServerRefreshRelatedPropertiesForSelfAndAllEventsSaveAndCommitWithError:].cold.3();
          goto LABEL_12;
        }
        ++v13;
        v14 = v11;
      }
      while (v9 != v13);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v9)
        continue;
      break;
    }
LABEL_12:

    a3 = v10;
    v6 = v22;
    if (v11)
    {
LABEL_20:
      objc_msgSend(v5, "rollback");
      if (!a3)
      {
LABEL_24:
        v20 = 0;
        goto LABEL_25;
      }
LABEL_21:
      v11 = objc_retainAutorelease(v11);
      v20 = 0;
      *a3 = v11;
      goto LABEL_25;
    }
  }
  else
  {

  }
  v24 = 0;
  v17 = objc_msgSend(v5, "saveCalendar:commit:error:", self, 0, &v24);
  v18 = v24;
  v11 = v18;
  if ((v17 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKCalendar removeServerRefreshRelatedPropertiesForSelfAndAllEventsSaveAndCommitWithError:].cold.2();
    goto LABEL_20;
  }

  v23 = 0;
  v19 = objc_msgSend(v5, "commitWithRollback:", &v23);
  v11 = v23;
  if ((v19 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    {
      -[EKCalendar removeServerRefreshRelatedPropertiesForSelfAndAllEventsSaveAndCommitWithError:].cold.1();
      if (!a3)
        goto LABEL_24;
    }
    else if (!a3)
    {
      goto LABEL_24;
    }
    goto LABEL_21;
  }
  v20 = 1;
LABEL_25:

  return v20;
}

- (BOOL)completable
{
  return -[EKCalendar _flagValueWithMask:](self, "_flagValueWithMask:", 0x400000);
}

- (void)setCompletable:(BOOL)a3
{
  -[EKCalendar _setFlagValue:withMask:](self, "_setFlagValue:withMask:", a3, 0x400000);
}

- (id)sharees
{
  void *v2;
  id v3;

  -[EKObject meltedAndCachedMultiRelationObjectsForKey:](self, "meltedAndCachedMultiRelationObjectsForKey:", *MEMORY[0x1E0D0B560]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (void)setSharees:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = *MEMORY[0x1E0D0B560];
  v5 = a3;
  -[EKObject updateMeltedAndCachedMultiRelationObjects:forKey:](self, "updateMeltedAndCachedMultiRelationObjects:forKey:", v5, v4);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend(v5, "count");

  objc_msgSend(v6, "numberWithInt:", v7 != 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setCachedValue:forKey:](self, "setCachedValue:forKey:", v8, v4);

}

- (void)addSharee:(id)a3
{
  -[EKObject addCachedMeltedObject:forMultiValueKey:](self, "addCachedMeltedObject:forMultiValueKey:", a3, *MEMORY[0x1E0D0B560]);
  -[EKObject setCachedValue:forKey:](self, "setCachedValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("hasSharees"));
}

- (void)removeSharee:(id)a3
{
  -[EKObject removeCachedMeltedObject:forMultiValueKey:](self, "removeCachedMeltedObject:forMultiValueKey:", a3, *MEMORY[0x1E0D0B560]);
  -[EKObject clearCachedValueForKey:](self, "clearCachedValueForKey:", CFSTR("hasSharees"));
}

- (BOOL)hasSharees
{
  void *v2;
  char v3;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__EKCalendar_hasSharees__block_invoke;
  v5[3] = &unk_1E4784B98;
  v5[4] = self;
  -[EKObject cachedValueForKey:populateBlock:](self, "cachedValueForKey:populateBlock:", CFSTR("hasSharees"), v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

uint64_t __24__EKCalendar_hasSharees__block_invoke(uint64_t a1)
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(*(id *)(a1 + 32), "sharees");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") != 0;

  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
}

- (id)shareesAndOwner
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[EKCalendar sharees](self, "sharees");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v3, "count") + 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        +[EKCalendarShareeOrOwner shareeWithEKSharee:forCalendar:](EKCalendarShareeOrOwner, "shareeWithEKSharee:forCalendar:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9), self, (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  +[EKCalendarShareeOrOwner ownerForEKCalendar:](EKCalendarShareeOrOwner, "ownerForEKCalendar:", self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v4, "addObject:", v11);
  v12 = (void *)objc_msgSend(v4, "copy", (_QWORD)v14);

  return v12;
}

- (id)alarms
{
  void *v2;
  void *v3;
  void *v4;

  -[EKCalendar allAlarms](self, "allAlarms");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_128);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "filteredSetUsingPredicate:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __20__EKCalendar_alarms__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isSnoozed") ^ 1;
}

- (void)setAlarms:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if ((objc_msgSend(v11, "isSnoozed") & 1) == 0)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v8);
  }

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v17, "snoozedAlarms", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v24;
          do
          {
            for (k = 0; k != v20; ++k)
            {
              if (*(_QWORD *)v24 != v21)
                objc_enumerationMutation(v18);
              objc_msgSend(v5, "addObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * k));
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
          }
          while (v20);
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v14);
  }

  -[EKCalendar setAllAlarms:](self, "setAllAlarms:", v5);
}

- (id)allAlarms
{
  void *v2;
  id v3;

  -[EKObject cachedMeltedObjectsForMultiValueKey:](self, "cachedMeltedObjectsForMultiValueKey:", *MEMORY[0x1E0D0B418]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (void)setAllAlarms:(id)a3
{
  -[EKObject updateMeltedAndCachedMultiRelationObjects:forKey:](self, "updateMeltedAndCachedMultiRelationObjects:forKey:", a3, *MEMORY[0x1E0D0B418]);
}

- (void)addAlarms:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __24__EKCalendar_addAlarms___block_invoke;
  v5[3] = &unk_1E47879C8;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

uint64_t __24__EKCalendar_addAlarms___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addCachedMeltedObject:forMultiValueKey:", a2, *MEMORY[0x1E0D0B418]);
}

- (void)removeAlarms:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__EKCalendar_removeAlarms___block_invoke;
  v5[3] = &unk_1E47879C8;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

uint64_t __27__EKCalendar_removeAlarms___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeCachedMeltedObject:forMultiValueKey:", a2, *MEMORY[0x1E0D0B418]);
}

- (void)snoozeAlarm:(id)a3 withTimeIntervalFromNow:(double)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a3;
  objc_msgSend(v6, "date");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAcknowledgedDate:", v12);
  objc_msgSend(v7, "duplicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateByAddingTimeInterval:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAbsoluteDate:", v9);

  -[EKCalendar findOriginalAlarmStartingWith:](self, "findOriginalAlarmStartingWith:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setOriginalAlarm:", v10);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendar addAlarms:](self, "addAlarms:", v11);

}

- (void)snoozeAlarm:(id)a3 withLocation:(id)a4 proximity:(int64_t)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v9 = a4;
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EKCalendar.m"), 2118, CFSTR("Can't snooze an alarm with location but no proximity."));

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAcknowledgedDate:", v10);

  objc_msgSend(v15, "duplicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setStructuredLocation:", v9);
  objc_msgSend(v11, "setProximity:", a5);
  -[EKCalendar findOriginalAlarmStartingWith:](self, "findOriginalAlarmStartingWith:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOriginalAlarm:", v12);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendar addAlarms:](self, "addAlarms:", v13);

}

- (BOOL)isAlarmAcknowledgedPropertyDirty
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (!-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B418]))
    return 0;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[EKCalendar allAlarms](self, "allAlarms", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = *MEMORY[0x1E0D0B150];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "_hasChangesForKey:", v7) & 1) != 0)
        {
          v9 = 1;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_13:

  return v9;
}

- (void)removeAcknowledgedSnoozedAlarms
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[EKCalendar allAlarms](self, "allAlarms", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "isSnoozed"))
        {
          objc_msgSend(v9, "acknowledgedDate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
            objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendar removeAlarms:](self, "removeAlarms:", v11);

}

- (void)removeAllSnoozedAlarms
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[EKCalendar allAlarms](self, "allAlarms", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v9, "isSnoozed"))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendar removeAlarms:](self, "removeAlarms:", v10);

}

- (id)findOriginalAlarmStartingWith:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;

  v3 = a3;
  objc_msgSend(v3, "originalAlarm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "originalAlarm");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v3;
  }
  v6 = v5;

  objc_msgSend(v6, "originalAlarm");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    while (1)
    {
      objc_msgSend(v6, "externalID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "externalID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if ((v11 & 1) != 0)
        break;
      objc_msgSend(v6, "originalAlarm");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "originalAlarm");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v12;
      if (!v8)
        goto LABEL_10;
    }
  }
  v12 = v6;
LABEL_10:

  return v12;
}

- (id)selfIdentityDisplayName
{
  void *v3;
  void *v4;
  void *v5;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B528]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[EKCalendar selfIdentityFirstName](self, "selfIdentityFirstName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendar selfIdentityLastName](self, "selfIdentityLastName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    DisplayNameStringForIdentityWithProperties();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setSelfIdentityDisplayName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B528]);
}

- (id)selfIdentityEmail
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B530]);
}

- (void)setSelfIdentityEmail:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B530]);
}

- (id)selfIdentityPhoneNumber
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B548]);
}

- (void)setSelfIdentityPhoneNumber:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B548]);
}

- (id)selfIdentityAddressString
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B520]);
}

- (void)setSelfIdentityAddressString:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B520]);
}

- (id)selfIdentityAddress
{
  void *v2;
  void *v3;

  -[EKCalendar selfIdentityAddressString](self, "selfIdentityAddressString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setSelfIdentityAddress:(id)a3
{
  id v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKCalendar setSelfIdentityAddressString:](self, "setSelfIdentityAddressString:", v4);

}

- (id)selfIdentityFirstName
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B538]);
}

- (void)setSelfIdentityFirstName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B538]);
}

- (id)selfIdentityLastName
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B540]);
}

- (void)setSelfIdentityLastName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B540]);
}

- (id)ownerIdentityDisplayName
{
  void *v3;
  void *v4;
  void *v5;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B4C8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[EKCalendar ownerIdentityFirstName](self, "ownerIdentityFirstName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendar ownerIdentityLastName](self, "ownerIdentityLastName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    DisplayNameStringForIdentityWithProperties();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)setOwnerIdentityDisplayName:(id)a3
{
  id v4;

  v4 = a3;
  -[EKCalendar setOwnerIdentityId:](self, "setOwnerIdentityId:", 0xFFFFFFFFLL);
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B4C8]);

}

- (int)ownerIdentityId
{
  void *v2;
  int v3;

  -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B4E0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (void)setOwnerIdentityId:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", v4, *MEMORY[0x1E0D0B4E0]);

}

- (id)ownerIdentityEmail
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B4D0]);
}

- (void)setOwnerIdentityEmail:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B4D0]);
}

- (id)ownerIdentityPhoneNumber
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B4F0]);
}

- (void)setOwnerIdentityPhoneNumber:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B4F0]);
}

- (id)ownerIdentityAddressString
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B4C0]);
}

- (void)setOwnerIdentityAddressString:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B4C0]);
}

- (id)ownerIdentityAddress
{
  void *v2;
  void *v3;

  -[EKCalendar ownerIdentityAddressString](self, "ownerIdentityAddressString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setOwnerIdentityAddress:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[EKCalendar setOwnerIdentityId:](self, "setOwnerIdentityId:", 0xFFFFFFFFLL);
  objc_msgSend(v4, "absoluteString");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[EKCalendar setOwnerIdentityAddressString:](self, "setOwnerIdentityAddressString:", v5);
}

- (id)ownerIdentityFirstName
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B4D8]);
}

- (void)setOwnerIdentityFirstName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B4D8]);
}

- (id)ownerIdentityLastName
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B4E8]);
}

- (void)setOwnerIdentityLastName:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B4E8]);
}

- (id)ownerIdentityOrganizer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  EKOrganizer *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  EKOrganizer *v15;

  -[EKCalendar ownerIdentityEmail](self, "ownerIdentityEmail");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[EKCalendar ownerIdentityAddress](self, "ownerIdentityAddress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v7 = 1;
      goto LABEL_8;
    }
  }
  objc_msgSend(MEMORY[0x1E0D0C298], "defaultProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendar ownerIdentityEmail](self, "ownerIdentityEmail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "matchesOneOfMyEmails:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D0C298], "defaultProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendar ownerIdentityAddress](self, "ownerIdentityAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "urlMatchesOneOfMyEmails:", v9);

  }
LABEL_8:
  v10 = [EKOrganizer alloc];
  -[EKCalendar ownerIdentityDisplayName](self, "ownerIdentityDisplayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendar ownerIdentityEmail](self, "ownerIdentityEmail");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendar ownerIdentityPhoneNumber](self, "ownerIdentityPhoneNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendar ownerIdentityAddress](self, "ownerIdentityAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[EKOrganizer initWithName:emailAddress:phoneNumber:address:isCurrentUser:](v10, "initWithName:emailAddress:phoneNumber:address:isCurrentUser:", v11, v12, v13, v14, v7);

  return v15;
}

- (id)pubcalAccountID
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B4F8]);
}

- (void)setPubcalAccountID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B4F8]);
}

- (id)subcalAccountID
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B580]);
}

- (void)setSubcalAccountID:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B580]);
}

- (BOOL)supportsMultipleAlarms
{
  void *v2;
  unsigned int v3;

  -[EKCalendar constraints](self, "constraints");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "maxAlarmsAllowed");

  return v3 > 1;
}

- (id)notes
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B4B0]);
}

- (void)setNotes:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B4B0]);
}

- (id)pushKey
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B508]);
}

- (void)setPushKey:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B508]);
}

- (id)digest
{
  return -[EKObject singleChangedValueForKey:](self, "singleChangedValueForKey:", *MEMORY[0x1E0D0B440]);
}

- (void)setDigest:(id)a3
{
  -[EKObject setSingleChangedValue:forKey:](self, "setSingleChangedValue:forKey:", a3, *MEMORY[0x1E0D0B440]);
}

- (BOOL)automaticEventLocationGeocodingAllowed
{
  return !-[EKCalendar isSuggestedEventCalendar](self, "isSuggestedEventCalendar")
      || +[EKFeatureSet automaticGeocodingEnabled](EKFeatureSet, "automaticGeocodingEnabled");
}

- (BOOL)validate:(id *)a3
{
  void *v3;
  EKCalendar *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  _BOOL4 v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;
  char v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void *i;
  void *v27;
  uint64_t v28;
  id v29;
  EKCalendar *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  int v36;
  uint64_t v37;
  char v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  BOOL v45;
  void *v46;
  void *v47;
  _BOOL4 v48;
  uint64_t v49;
  EKCalendar *v50;
  void *v51;
  char v52;
  id *v54;
  unsigned int v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  objc_super v60;
  _BYTE v61[128];
  uint64_t v62;

  v5 = self;
  v62 = *MEMORY[0x1E0C80C00];
  v60.receiver = self;
  v60.super_class = (Class)EKCalendar;
  if (!-[EKObject validate:](&v60, sel_validate_))
    return 0;
  if (a3)
    *a3 = 0;
  -[EKCalendar source](v5, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (!a3)
      return 0;
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = 14;
LABEL_63:
    objc_msgSend(v19, "errorWithEKErrorCode:", v20);
    v45 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    return v45;
  }
  if ((-[EKCalendar allowedEntityTypes](v5, "allowedEntityTypes") & 2) != 0)
  {
    -[EKCalendar source](v5, "source");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "allowsTasks");

    if ((v8 & 1) == 0)
    {
      if (!a3)
        return 0;
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = 24;
      goto LABEL_63;
    }
  }
  if ((-[EKCalendar allowedEntityTypes](v5, "allowedEntityTypes") & 1) != 0)
  {
    -[EKCalendar source](v5, "source");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "allowsEvents");

    if ((v10 & 1) == 0)
    {
      if (!a3)
        return 0;
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = 25;
      goto LABEL_63;
    }
  }
  v11 = -[EKCalendar isImmutable](v5, "isImmutable");
  v12 = (uint64_t *)MEMORY[0x1E0D0B468];
  if (v11)
  {
    v13 = *MEMORY[0x1E0D0B468];
    -[EKObject _previousValueForKey:](v5, "_previousValueForKey:", *MEMORY[0x1E0D0B468]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedIntValue");

    if ((v15 & 4) != 0)
    {
      if (validate__onceToken != -1)
        dispatch_once(&validate__onceToken, &__block_literal_global_142);
      -[EKObject changeSet](v5, "changeSet", a3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "changedKeys");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = objc_msgSend(v3, "count");
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v59 = 0u;
      v23 = v3;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      if (v24)
      {
        v3 = (void *)v24;
        v25 = *(_QWORD *)v57;
        do
        {
          for (i = 0; i != v3; i = (char *)i + 1)
          {
            if (*(_QWORD *)v57 != v25)
              objc_enumerationMutation(v23);
            v27 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend((id)validate____DirtyPropertiesToIgnore, "containsObject:", v27))
            {
              --v22;
            }
            else if (objc_msgSend(v27, "isEqualToString:", v13))
            {
              v55 = -[EKCalendar flags](v5, "flags");
              -[EKObject _previousValueForKey:](v5, "_previousValueForKey:", v13);
              v28 = v13;
              v29 = v23;
              v30 = v5;
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = v3;
              v33 = v22;
              v34 = v25;
              v35 = objc_msgSend(v31, "unsignedIntValue");

              v5 = v30;
              v23 = v29;
              v13 = v28;
              v36 = v35 ^ v55;
              v25 = v34;
              v37 = v33;
              v3 = v32;
              v22 = v37 - ((v36 & 0xFFFEFFFF) == 0);
            }
          }
          v3 = (void *)objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
        }
        while (v3);
      }

      a3 = v54;
      if (v54 && v22 >= 1)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", 16);
        *v54 = (id)objc_claimAutoreleasedReturnValue();

        return 0;
      }

      v12 = (uint64_t *)MEMORY[0x1E0D0B468];
      if (v22 > 0)
        return 0;
    }
  }
  v16 = -[EKObject isNew](v5, "isNew");
  v17 = *MEMORY[0x1E0D0B578];
  if (!v16 && -[EKObject _hasChangesForKey:](v5, "_hasChangesForKey:", *MEMORY[0x1E0D0B578]))
  {
    -[EKObject eventStore](v5, "eventStore");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "skipModificationValidation") & 1) != 0)
    {

    }
    else
    {
      v38 = objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessHasSyncClientEntitlement");

      if ((v38 & 1) == 0)
      {
        if (!objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessIsFirstPartyCalendarApp"))
          goto LABEL_61;
        -[EKObject committedValueForKey:](v5, "committedValueForKey:", v17);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[EKCalendar source](v5, "source");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v46, "sourceType"))
          v48 = 0;
        else
          v48 = objc_msgSend(v47, "sourceType") == 0;

        if (a3 && !v48)
          goto LABEL_62;
        if (!v48)
          return 0;
      }
    }
  }
  if (!-[EKObject _hasChangesForKey:](v5, "_hasChangesForKey:", v17))
    goto LABEL_50;
  -[EKObject eventStore](v5, "eventStore");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v39, "eventAccessLevel") == 1)
  {
    v40 = -[EKCalendar allowEvents](v5, "allowEvents");

    if (v40)
    {
LABEL_61:
      if (a3)
      {
LABEL_62:
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v20 = 15;
        goto LABEL_63;
      }
      return 0;
    }
  }
  else
  {

  }
  -[EKObject eventStore](v5, "eventStore");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v41, "skipModificationValidation") & 1) != 0)
    goto LABEL_49;
  -[EKCalendar source](v5, "source");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v42, "supportsCalendarCreation") & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessHasSyncClientEntitlement") & 1) != 0)
  {
LABEL_48:

LABEL_49:
    goto LABEL_50;
  }
  v49 = -[EKCalendar type](v5, "type");
  if (v49 != 4)
  {
    if (-[EKCalendar type](v5, "type") == (EKCalendarTypeBirthday|EKCalendarTypeExchange))
      goto LABEL_75;
LABEL_80:

    goto LABEL_81;
  }
  -[EKObject eventStore](v5, "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "allowsBirthdayModifications"))
  {

    goto LABEL_48;
  }
  if (-[EKCalendar type](v5, "type") != (EKCalendarTypeBirthday|EKCalendarTypeExchange))
  {

    goto LABEL_80;
  }
LABEL_75:
  v50 = v5;
  -[EKObject eventStore](v5, "eventStore");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "allowsIntegrationModifications");

  if (v49 == 4)
  v5 = v50;
  if ((v52 & 1) == 0)
  {
LABEL_81:
    if (a3)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v20 = 17;
      goto LABEL_63;
    }
    return 0;
  }
LABEL_50:
  v43 = *v12;
  if (!-[EKObject _hasChangesForKey:](v5, "_hasChangesForKey:", *v12)
    || !-[EKCalendar isDefaultSchedulingCalendar](v5, "isDefaultSchedulingCalendar"))
  {
    return 1;
  }
  -[EKObject _previousValueForKey:](v5, "_previousValueForKey:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v44, "unsignedIntValue") & 0x400) != 0)
  {

    return 1;
  }
  v45 = -[EKCalendar eligibleForDefaultSchedulingCalendar](v5, "eligibleForDefaultSchedulingCalendar");

  if (a3 && !v45)
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = 70;
    goto LABEL_63;
  }
  return v45;
}

void __23__EKCalendar_validate___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0D0B448], *MEMORY[0x1E0D0B438], *MEMORY[0x1E0D0B430], *MEMORY[0x1E0D0B598], 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)validate____DirtyPropertiesToIgnore;
  validate____DirtyPropertiesToIgnore = v0;

}

- (BOOL)save:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3)
    *a3 = 0;
  -[EKObject insertPersistentObjectIfNeeded](self, "insertPersistentObjectIfNeeded");
  if (-[EKCalendar isAlarmAcknowledgedPropertyDirty](self, "isAlarmAcknowledgedPropertyDirty"))
    -[EKCalendar removeAcknowledgedSnoozedAlarms](self, "removeAcknowledgedSnoozedAlarms");
  -[EKCalendar assignColorForNewCalendarIfNeeded](self, "assignColorForNewCalendarIfNeeded");
  if (-[EKObject _hasChangesForKey:](self, "_hasChangesForKey:", *MEMORY[0x1E0D0B470]))
  {
    -[EKCalendar image](self, "image");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "saveInCalendar:", self);

    -[EKObject changeSet](self, "changeSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendar image](self, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backingObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "forceChangeValue:forKey:", v7, *MEMORY[0x1E0D0B698]);

  }
  -[EKObject updatePersistentObject](self, "updatePersistentObject");
  return 1;
}

- (BOOL)remove:(id *)a3
{
  void *v5;
  char v6;
  BOOL result;
  void *v8;
  char v9;
  uint64_t v10;
  id v11;

  if (a3)
    *a3 = 0;
  -[EKObject eventStore](self, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "skipModificationValidation") & 1) != 0)
  {

LABEL_6:
    -[EKObject deletePersistentObject](self, "deletePersistentObject");
    return 1;
  }
  v6 = objc_msgSend(MEMORY[0x1E0D0C2E8], "currentProcessHasSyncClientEntitlement");

  if ((v6 & 1) != 0)
    goto LABEL_6;
  if (!-[EKCalendar isImmutable](self, "isImmutable"))
  {
    if (-[EKCalendar _validateDeletable:](self, "_validateDeletable:", a3))
      goto LABEL_6;
    return 0;
  }
  if (!a3)
    return 0;
  -[EKCalendar constraints](self, "constraints");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "allowsCalendarAddDeleteModify");

  if ((v9 & 1) != 0)
    v10 = 16;
  else
    v10 = 17;
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithEKErrorCode:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a3 = v11;
  return result;
}

- (BOOL)isManaged
{
  void *v3;
  void *v4;
  char v5;

  -[EKObject eventStore](self, "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKCalendar source](self, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isSourceManaged:", v4);

  return v5;
}

- (id)exportData
{
  return -[EKCalendar exportDataWithOptions:](self, "exportDataWithOptions:", 0);
}

- (id)exportDataWithOptions:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__19;
  v16 = __Block_byref_object_dispose__19;
  v17 = 0;
  -[EKObject eventStore](self, "eventStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "CADOperationProxySync");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKObject CADObjectID](self, "CADObjectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__EKCalendar_exportDataWithOptions___block_invoke;
  v11[3] = &unk_1E4785988;
  v11[4] = &v12;
  objc_msgSend(v7, "CADDatabaseExportICSDataForCalendar:options:reply:", v8, a3, v11);

  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __36__EKCalendar_exportDataWithOptions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6;
  void *v7;

  v6 = a3;
  if ((_DWORD)a2)
  {
    v7 = (void *)EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      __36__EKCalendar_exportDataWithOptions___block_invoke_cold_1(v7, a2);
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  }

}

- (void)setIsJunk:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a3)
  {
    -[EKCalendar setCachedJunkStatus:](self, "setCachedJunkStatus:", 1);
    objc_msgSend(MEMORY[0x1E0D1C3F8], "sharedConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendar calendarIdentifier](self, "calendarIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendar source](self, "source");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "externalID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reportSharedCalendarInviteAsJunkForCalendarWithID:accountID:queue:completionBlock:", v5, v7, MEMORY[0x1E0C80D38], &__block_literal_global_146);

    -[EKCalendar setCachedJunkStatus:](self, "setCachedJunkStatus:", 1);
  }
  else
  {
    -[EKCalendar setCachedJunkStatus:](self, "setCachedJunkStatus:", 2);
    -[EKCalendar sharedOwnerName](self, "sharedOwnerName");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[EKCalendar sharedOwnerEmail](self, "sharedOwnerEmail");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKCalendar sharedOwnerPhoneNumber](self, "sharedOwnerPhoneNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKRecents recordRecentForContactWithName:emailAddress:phoneNumber:](EKRecents, "recordRecentForContactWithName:emailAddress:phoneNumber:", v10, v8, v9);

  }
}

void __24__EKCalendar_setIsJunk___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;

  v6 = a2;
  v7 = a3;
  v8 = a4;
  if (v8 && os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
    __24__EKCalendar_setIsJunk___block_invoke_cold_1();

}

- (BOOL)couldBeJunk
{
  if (!-[EKCalendar cachedJunkStatus](self, "cachedJunkStatus"))
    -[EKCalendar setCachedJunkStatus:](self, "setCachedJunkStatus:", +[EKJunkInvitationProtocol_Shared junkStatusForInvitation:](EKJunkInvitationProtocol_Shared, "junkStatusForInvitation:", self));
  return -[EKCalendar cachedJunkStatus](self, "cachedJunkStatus") == 3
      || -[EKCalendar cachedJunkStatus](self, "cachedJunkStatus") == 1;
}

- (unint64_t)cachedJunkStatus
{
  return self->_cachedJunkStatus;
}

- (void)setCachedJunkStatus:(unint64_t)a3
{
  self->_cachedJunkStatus = a3;
}

+ (void)calendarForEntityTypes:(os_log_t)log eventStore:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A2318000, log, OS_LOG_TYPE_ERROR, "API MISUSE: nil event store in initialization of EKCalendar instance", v1, 2u);
}

- (void)_validateDeletableHelperWithAllKnownCalendars:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Validating deletion on an EKCalendar that allows both events and reminders. This may not work as expected: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)canMergeWithCalendar:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  v5 = OUTLINED_FUNCTION_9_0(a1);
  objc_msgSend(a2, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_7_5(&dword_1A2318000, v8, v9, "Can't merge %@ with %@ because they are the same calendar.", v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1_1();
}

- (void)canMergeWithCalendar:.cold.2()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_8_1(v3);
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "title");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_12_1(), "title");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2_8(&dword_1A2318000, v5, v6, "Can't merge %@ with %@ because %@ is a shared calendar", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_5_0();
}

- (void)canMergeWithCalendar:.cold.3()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_8_1(v3);
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "title");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_12_1(), "title");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2_8(&dword_1A2318000, v5, v6, "Can't merge %@ with %@ because %@ is a reminder list", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_5_0();
}

- (void)canMergeWithCalendar:.cold.4()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_8_1(v3);
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "title");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_12_1(), "title");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2_8(&dword_1A2318000, v5, v6, "Can't merge %@ with %@ because %@ isn't deletable", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_5_0();
}

- (void)canMergeWithCalendar:(void *)a3 .cold.5(void *a1, void *a2, void *a3)
{
  void *v3;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a1;
  objc_msgSend(a2, "title");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138413058;
  v11 = v3;
  v12 = 2112;
  v13 = v7;
  v14 = 2112;
  v15 = v8;
  v16 = 2112;
  v17 = v9;
  _os_log_debug_impl(&dword_1A2318000, v6, OS_LOG_TYPE_DEBUG, "Can't merge %@ with %@ because this account doesn't support sharing scheduling and %@ is a shared calendar and %@ isn't.", (uint8_t *)&v10, 0x2Au);

}

- (void)canMergeWithCalendar:.cold.6()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_8_1(v3);
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "title");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_12_1(), "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_8(&dword_1A2318000, v5, v6, "Can't merge %@ with %@ because %@ doesn't allow content modifications", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_5_0();
}

- (void)canMergeWithCalendar:.cold.7()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_8_1(v3);
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "title");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_12_1(), "title");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_2_8(&dword_1A2318000, v5, v6, "Can't merge %@ with %@ because %@ doesn't allow content modifications", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_5_0();
}

- (void)canMergeWithCalendar:(void *)a3 .cold.8(void *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t v14;

  v5 = OUTLINED_FUNCTION_9_0(a1);
  objc_msgSend(a2, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_7_5(&dword_1A2318000, v8, v9, "Can't merge %@ with %@ because they are in different sources.", v10, v11, v12, v13, v14);

  OUTLINED_FUNCTION_1_1();
}

void __32__EKCalendar_cachedExternalInfo__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Error deserializing external info: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __32__EKCalendar_cachedExternalInfo__block_invoke_cold_2(void *a1)
{
  NSObject *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint8_t v5[24];

  v1 = OUTLINED_FUNCTION_9_0(a1);
  objc_opt_class();
  OUTLINED_FUNCTION_3();
  v3 = v2;
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v1, v4, "Unexpected type for external info: %{public}@", v5);

}

- (void)setCachedExternalInfo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Error serializing external info: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)calendarError
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109378;
  v3[1] = a1;
  v4 = 2112;
  v5 = a2;
  _os_log_error_impl(&dword_1A2318000, log, OS_LOG_TYPE_ERROR, "Unexpected error type (%d) in calendar error on calendar %@", (uint8_t *)v3, 0x12u);
  OUTLINED_FUNCTION_1_0();
}

void __45__EKCalendar_moveSubscribedCalendarToSource___block_invoke_cold_1(void *a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = a1;
  objc_msgSend(v3, "errorWithCADResult:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v4, v6, "Error moving subscribed calendar: %@", v7);

  OUTLINED_FUNCTION_1_1();
}

- (void)removeServerRefreshRelatedPropertiesForSelfAndAllEventsSaveAndCommitWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Error committing calendar & events during removeServerRefreshRelatedProperties. Error: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)removeServerRefreshRelatedPropertiesForSelfAndAllEventsSaveAndCommitWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Error saving calendar during removeServerRefreshRelatedProperties. Error: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)removeServerRefreshRelatedPropertiesForSelfAndAllEventsSaveAndCommitWithError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Error saving event during removeServerRefreshRelatedProperties. Error: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __36__EKCalendar_exportDataWithOptions___block_invoke_cold_1(void *a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = a1;
  objc_msgSend(v3, "errorWithCADResult:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v4, v6, "Unable to export calendar data: %@", v7);

  OUTLINED_FUNCTION_1_1();
}

void __24__EKCalendar_setIsJunk___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_5(&dword_1A2318000, v0, v1, "Error trying to report calendar invite as junk. Error: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

@end
