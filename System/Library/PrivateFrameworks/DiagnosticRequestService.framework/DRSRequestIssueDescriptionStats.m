@implementation DRSRequestIssueDescriptionStats

+ (id)keyName
{
  return CFSTR("IssueDescription");
}

+ (id)descriptionStringForRequest:(id)a3
{
  return (id)objc_msgSend(a3, "issueDescription");
}

+ (Class)childStatsClass
{
  return (Class)objc_opt_class();
}

@end
