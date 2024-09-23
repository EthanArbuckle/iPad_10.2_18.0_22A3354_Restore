@implementation HKMedicalDate(HealthRecordsUI)

- (uint64_t)hr_dateWithoutTime
{
  unint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "form");
  if (v2 <= 1)
    v3 = 1;
  else
    v3 = v2;
  return objc_msgSend(a1, "displayStringWithPreferredForm:includeTimeZone:", v3, 0);
}

@end
