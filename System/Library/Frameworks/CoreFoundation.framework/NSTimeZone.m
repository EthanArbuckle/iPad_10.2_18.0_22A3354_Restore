@implementation NSTimeZone

- (unint64_t)hash
{
  return CFHash(-[NSTimeZone name](self, "name"));
}

- (BOOL)isEqualToTimeZone:(NSTimeZone *)aTimeZone
{
  NSString *v4;
  NSString *v5;
  BOOL result;

  if (!aTimeZone)
    return 0;
  if (aTimeZone == self)
    return 1;
  v4 = -[NSTimeZone name](self, "name");
  v5 = -[NSTimeZone name](aTimeZone, "name");
  result = 0;
  if (v4)
  {
    if (v5)
      return CFEqual(v4, v5) != 0;
  }
  return result;
}

+ (NSTimeZone)defaultTimeZone
{
  return (NSTimeZone *)+[NSTimeZone _default](NSTimeZone, "_default");
}

+ (NSTimeZone)timeZoneWithName:(NSString *)tzName
{
  return (NSTimeZone *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithName:", tzName);
}

+ (NSTimeZone)allocWithZone:(_NSZone *)a3
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (NSTimeZone == a1)
    return (NSTimeZone *)&___immutablePlaceholderTimeZone;
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___NSTimeZone;
  return (NSTimeZone *)objc_msgSendSuper2(&v4, sel_allocWithZone_, a3);
}

- (BOOL)isEqual:(id)a3
{
  int v5;

  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else if (a3)
  {
    v5 = _NSIsNSTimeZone((uint64_t)a3);
    if (v5)
      LOBYTE(v5) = -[NSTimeZone isEqualToTimeZone:](self, "isEqualToTimeZone:", a3);
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)isNSTimeZone__
{
  return 1;
}

+ (NSTimeZone)localTimeZone
{
  NSTimeZone *v2;
  NSTimeZone *v3;

  v2 = (NSTimeZone *)+[NSTimeZone _autoupdating](NSTimeZone, "_autoupdating");
  if (_CFAppVersionCheckLessThan(CFSTR("com.ea.simpsonssocial.inc2"), -1, 4.7))
    v3 = v2;
  return v2;
}

+ (NSTimeZone)timeZoneForSecondsFromGMT:(NSInteger)seconds
{
  return (NSTimeZone *)+[NSTimeZone _timeZoneWithSecondsFromGMT:](NSTimeZone, "_timeZoneWithSecondsFromGMT:", seconds);
}

+ (NSTimeZone)systemTimeZone
{
  return (NSTimeZone *)+[NSTimeZone _current](NSTimeZone, "_current");
}

+ (NSTimeZone)timeZoneWithAbbreviation:(NSString *)abbreviation
{
  if (abbreviation)
    return (NSTimeZone *)+[NSTimeZone _timeZoneWithAbbreviation:](NSTimeZone, "_timeZoneWithAbbreviation:");
  else
    return 0;
}

+ (void)setDefaultTimeZone:(NSTimeZone *)defaultTimeZone
{
  +[NSTimeZone _setDefaultTimeZone:](NSTimeZone, "_setDefaultTimeZone:", defaultTimeZone);
}

- (NSTimeInterval)daylightSavingTimeOffsetForDate:(NSDate *)aDate
{
  return 0.0;
}

- (NSDate)nextDaylightSavingTimeTransitionAfterDate:(NSDate *)aDate
{
  return 0;
}

+ (void)resetSystemTimeZone
{
  ++__noteCount_0;
  +[NSTimeZone _resetSystemTimeZone](NSTimeZone, "_resetSystemTimeZone");
}

+ (NSArray)knownTimeZoneNames
{
  return (NSArray *)+[NSTimeZone _knownTimeZoneIdentifiers](NSTimeZone, "_knownTimeZoneIdentifiers");
}

+ (NSDictionary)abbreviationDictionary
{
  return (NSDictionary *)+[NSTimeZone _abbreviationDictionary](NSTimeZone, "_abbreviationDictionary");
}

+ (void)setAbbreviationDictionary:(NSDictionary *)abbreviationDictionary
{
  +[NSTimeZone _setAbbreviationDictionary:](NSTimeZone, "_setAbbreviationDictionary:", abbreviationDictionary);
}

+ (NSString)timeZoneDataVersion
{
  return (NSString *)+[NSTimeZone _timeZoneDataVersion](NSTimeZone, "_timeZoneDataVersion");
}

- (NSInteger)secondsFromGMT
{
  return -[NSTimeZone secondsFromGMTForDate:](self, "secondsFromGMTForDate:", +[NSDate date](NSDate, "date"));
}

- (NSString)abbreviation
{
  return -[NSTimeZone abbreviationForDate:](self, "abbreviationForDate:", +[NSDate date](NSDate, "date"));
}

- (BOOL)isDaylightSavingTime
{
  return -[NSTimeZone isDaylightSavingTimeForDate:](self, "isDaylightSavingTimeForDate:", +[NSDate date](NSDate, "date"));
}

- (NSTimeInterval)daylightSavingTimeOffset
{
  NSTimeInterval result;

  -[NSTimeZone daylightSavingTimeOffsetForDate:](self, "daylightSavingTimeOffsetForDate:", +[NSDate date](NSDate, "date"));
  return result;
}

- (NSDate)nextDaylightSavingTimeTransition
{
  return -[NSTimeZone nextDaylightSavingTimeTransitionAfterDate:](self, "nextDaylightSavingTimeTransitionAfterDate:", +[NSDate date](NSDate, "date"));
}

- (NSString)localizedName:(NSTimeZoneNameStyle)style locale:(NSLocale *)locale
{
  return 0;
}

- (NSString)description
{
  NSString *v3;
  NSString *v4;
  NSInteger v5;
  _BOOL4 v6;
  const char *v7;

  v3 = -[NSTimeZone name](self, "name");
  v4 = -[NSTimeZone abbreviation](self, "abbreviation");
  v5 = -[NSTimeZone secondsFromGMT](self, "secondsFromGMT");
  v6 = -[NSTimeZone isDaylightSavingTime](self, "isDaylightSavingTime");
  v7 = "";
  if (v6)
    v7 = " (Daylight)";
  CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("%@ (%@) offset %ld%s"), v3, v4, v5, v7);
  return (NSString *)_CFAutoreleasePoolAddObject();
}

+ (NSTimeZone)timeZoneWithName:(NSString *)tzName data:(NSData *)aData
{
  return (NSTimeZone *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithName:data:", tzName, aData);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSTimeZone)initWithCoder:(id)a3
{
  return 0;
}

- (NSString)name
{
  objc_class *v2;

  OUTLINED_FUNCTION_2_12();
  v2 = __CFLookUpClass("NSTimeZone");
  OUTLINED_FUNCTION_0_25(v2);
}

- (NSData)data
{
  objc_class *v2;

  OUTLINED_FUNCTION_2_12();
  v2 = __CFLookUpClass("NSTimeZone");
  OUTLINED_FUNCTION_0_25(v2);
}

- (NSInteger)secondsFromGMTForDate:(NSDate *)aDate
{
  objc_class *v3;

  OUTLINED_FUNCTION_2_12();
  v3 = __CFLookUpClass("NSTimeZone");
  OUTLINED_FUNCTION_0_25(v3);
}

- (NSString)abbreviationForDate:(NSDate *)aDate
{
  objc_class *v3;

  OUTLINED_FUNCTION_2_12();
  v3 = __CFLookUpClass("NSTimeZone");
  OUTLINED_FUNCTION_0_25(v3);
}

- (BOOL)isDaylightSavingTimeForDate:(NSDate *)aDate
{
  objc_class *v3;

  OUTLINED_FUNCTION_2_12();
  v3 = __CFLookUpClass("NSTimeZone");
  OUTLINED_FUNCTION_0_25(v3);
}

- (NSTimeZone)initWithName:(NSString *)tzName data:(NSData *)aData
{
  objc_class *v4;

  OUTLINED_FUNCTION_2_12();
  v4 = __CFLookUpClass("NSTimeZone");
  OUTLINED_FUNCTION_0_25(v4);
}

- (NSTimeZone)initWithName:(NSString *)tzName
{
  objc_class *v3;

  OUTLINED_FUNCTION_2_12();
  v3 = __CFLookUpClass("NSTimeZone");
  OUTLINED_FUNCTION_0_25(v3);
}

@end
