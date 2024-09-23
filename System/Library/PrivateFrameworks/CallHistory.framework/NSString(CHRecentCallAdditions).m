@implementation NSString(CHRecentCallAdditions)

+ (uint64_t)ch_stringWithCHRecentCallVerificationStatus:()CHRecentCallAdditions
{
  if (a3 > 4)
    return 0;
  else
    return *((_QWORD *)&off_1E6747290 + a3);
}

+ (uint64_t)ch_stringWithCHRecentCallJunkConfidence:()CHRecentCallAdditions
{
  if (a3 > 3)
    return 0;
  else
    return *((_QWORD *)&off_1E67472B8 + a3);
}

+ (const)ch_stringWithCHRecentCallAutoAnsweredReason:()CHRecentCallAdditions
{
  const __CFString *v3;

  v3 = CFSTR("CHRecentCallAutoAnsweredReasonScreened");
  if (a3 != 1)
    v3 = 0;
  if (a3)
    return v3;
  else
    return CFSTR("CHRecentCallAutoAnsweredReasonNone");
}

+ (__CFString)CHCallScreenSharingType:()CHRecentCallAdditions
{
  char v3;
  __CFString *v4;
  uint64_t v5;

  if (!a3)
  {
    v4 = CFSTR("CHCallScreenSharingTypeNone");
    return v4;
  }
  v3 = a3;
  if ((a3 & 1) != 0)
  {
    maybeAppendStringWithSeparator(&stru_1E6747850, CFSTR("CHCallScreenSharingTypeScreenShare"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((v3 & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  v4 = &stru_1E6747850;
  if ((a3 & 2) != 0)
  {
LABEL_7:
    maybeAppendStringWithSeparator(v4, CFSTR("CHCallScreenSharingTypeRemoteControl"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v5;
  }
LABEL_8:
  if (!-[__CFString length](v4, "length"))
  {

    v4 = CFSTR("Unknown");
  }
  return v4;
}

+ (__CFString)ch_stringWithCHCallScreenSharingType:()CHRecentCallAdditions
{
  char v3;
  __CFString *v4;
  uint64_t v5;

  if (!a3)
  {
    v4 = CFSTR("CHCallScreenSharingTypeNone");
    return v4;
  }
  v3 = a3;
  if ((a3 & 1) != 0)
  {
    maybeAppendStringWithSeparator(&stru_1E6747850, CFSTR("CHCallScreenSharingTypeScreenShare"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if ((v3 & 2) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
  v4 = &stru_1E6747850;
  if ((a3 & 2) != 0)
  {
LABEL_7:
    maybeAppendStringWithSeparator(v4, CFSTR("CHCallScreenSharingTypeRemoteControl"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v5;
  }
LABEL_8:
  if (!-[__CFString length](v4, "length"))
  {

    v4 = CFSTR("Unknown");
  }
  return v4;
}

@end
