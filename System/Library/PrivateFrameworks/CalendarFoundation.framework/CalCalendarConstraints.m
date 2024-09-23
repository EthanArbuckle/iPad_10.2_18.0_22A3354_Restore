@implementation CalCalendarConstraints

+ (id)constraintsURLForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  v4 = a3;
  objc_msgSend(a1, "_strippedConstraintsNameForStoredConstraintsName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5
    || (objc_msgSend(a1, "_bundle"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "URLForResource:withExtension:", v5, CFSTR("plist")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    if (objc_msgSend(v4, "isAbsolutePath")
      && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "fileExistsAtPath:", v4),
          v8,
          v9))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

+ (id)backwardsCompatibleConstraintsPathForName:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v4 = backwardsCompatibleConstraintsPathForName__onceToken;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&backwardsCompatibleConstraintsPathForName__onceToken, &__block_literal_global_27);
  objc_msgSend(a1, "_strippedConstraintsNameForStoredConstraintsName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)backwardsCompatibleConstraintsPathForName__map, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __68__CalCalendarConstraints_backwardsCompatibleConstraintsPathForName___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[14];
  _QWORD v3[15];

  v3[14] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("CalDAVCalendarConstraints");
  v2[1] = CFSTR("CalDAVCalendarConstraintsNoComments");
  v3[0] = CFSTR("/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DACalDAV.framework/CalDAVCalendarConstraints.plist");
  v3[1] = CFSTR("/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DACalDAV.framework/CalDAVCalendarConstraintsNoComments.plist");
  v2[2] = CFSTR("CalDAVCalendarConstraintsNoSchedule");
  v2[3] = CFSTR("CalDAVCalendarConstraintsNoScheduleNoComments");
  v3[2] = CFSTR("/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DACalDAV.framework/CalDAVCalendarConstraintsNoSchedule.plist");
  v3[3] = CFSTR("/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DACalDAV.framework/CalDAVCalendarConstraintsNoScheduleNoComments.plist");
  v2[4] = CFSTR("FutureLimitedCalDAVCalendarConstraints");
  v2[5] = CFSTR("FutureLimitedCalDAVCalendarConstraintsNoComments");
  v3[4] = CFSTR("/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DACalDAV.framework/FutureLimitedCalDAVCalendarConstraints.plist");
  v3[5] = CFSTR("/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DACalDAV.framework/FutureLimitedCalDAVCalendarConstraintsNoComments.plist");
  v2[6] = CFSTR("FutureLimitedCalDAVCalendarConstraintsNoSchedule");
  v2[7] = CFSTR("FutureLimitedCalDAVCalendarConstraintsNoScheduleNoComments");
  v3[6] = CFSTR("/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DACalDAV.framework/FutureLimitedCalDAVCalendarConstraintsNoSchedule.plist");
  v3[7] = CFSTR("/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DACalDAV.framework/FutureLimitedCalDAVCalendarConstraintsNoScheduleNoComments.plist");
  v2[8] = CFSTR("EAS12CalendarConstraints");
  v2[9] = CFSTR("EAS14CalendarConstraints");
  v3[8] = CFSTR("/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DAEAS.framework/EAS12CalendarConstraints.plist");
  v3[9] = CFSTR("/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DAEAS.framework/EAS14CalendarConstraints.plist");
  v2[10] = CFSTR("EAS16CalendarConstraints");
  v2[11] = CFSTR("EAS161CalendarConstraints");
  v3[10] = CFSTR("/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DAEAS.framework/EAS16CalendarConstraints.plist");
  v3[11] = CFSTR("/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DAEAS.framework/EAS161CalendarConstraints.plist");
  v2[12] = CFSTR("EAS25CalendarConstraints");
  v2[13] = CFSTR("SubCalCalendarConstraints");
  v3[12] = CFSTR("/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DAEAS.framework/EAS25CalendarConstraints.plist");
  v3[13] = CFSTR("/System/Library/PrivateFrameworks/DataAccess.framework/Frameworks/DASubCal.framework/SubCalCalendarConstraints.plist");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 14);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)backwardsCompatibleConstraintsPathForName__map;
  backwardsCompatibleConstraintsPathForName__map = v0;

}

+ (id)_strippedConstraintsNameForStoredConstraintsName:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  v4 = v3;
  if (objc_msgSend(v3, "isAbsolutePath"))
  {
    objc_msgSend(v3, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v4, "hasSuffix:", CFSTR(".plist")))
  {
    objc_msgSend(v4, "stringByDeletingPathExtension");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }

  return v4;
}

+ (id)_bundle
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CalCalendarConstraints__bundle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_bundle_onceToken != -1)
    dispatch_once(&_bundle_onceToken, block);
  return (id)_bundle_bundle;
}

void __33__CalCalendarConstraints__bundle__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", *(_QWORD *)(a1 + 32));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_bundle_bundle;
  _bundle_bundle = v1;

}

@end
