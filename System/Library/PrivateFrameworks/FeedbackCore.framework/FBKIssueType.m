@implementation FBKIssueType

+ (id)entityName
{
  return CFSTR("IssueType");
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("display_name"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  FBKStringIfNSNull(v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKIssueType setDisplayName:](self, "setDisplayName:", v4);

}

@end
