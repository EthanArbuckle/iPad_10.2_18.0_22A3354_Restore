@implementation DRSRequestTeamIDStats

+ (id)keyName
{
  return CFSTR("TeamID");
}

+ (id)descriptionStringForRequest:(id)a3
{
  return (id)objc_msgSend(a3, "teamID");
}

+ (Class)childStatsClass
{
  return (Class)objc_opt_class();
}

@end
