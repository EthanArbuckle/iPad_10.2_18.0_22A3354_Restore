@implementation CLSManagedPublicEvent

+ (NSString)entityName
{
  return (NSString *)CFSTR("PublicEvent");
}

- (NSTimeZone)timeZone
{
  return (NSTimeZone *)objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", -[CLSManagedPublicEvent timeZoneOffset](self, "timeZoneOffset"));
}

- (int64_t)expectedAttendance
{
  void *v2;
  void *v3;
  int64_t v4;

  -[CLSManagedPublicEvent expectedAttendanceAsNumber](self, "expectedAttendanceAsNumber");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (void)setExpectedAttendance:(int64_t)a3
{
  id v4;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CLSManagedPublicEvent setExpectedAttendanceAsNumber:](self, "setExpectedAttendanceAsNumber:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CLSManagedPublicEvent setExpectedAttendanceAsNumber:](self, "setExpectedAttendanceAsNumber:", v4);

  }
}

@end
