@implementation DRSRequestIssueCategoryStats

+ (id)keyName
{
  return CFSTR("IssueCategory");
}

+ (id)descriptionStringForRequest:(id)a3
{
  return (id)objc_msgSend(a3, "issueCategory");
}

+ (Class)childStatsClass
{
  return (Class)objc_opt_class();
}

@end
