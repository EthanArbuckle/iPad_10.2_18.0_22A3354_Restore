@implementation FBKIssueDefinition

+ (id)entityName
{
  return CFSTR("IssueDefinition");
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  void *v4;
  char IsNil;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("issue_type_id"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  IsNil = FBKJSONObjectIsNil(v4);

  if ((IsNil & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("issue_type_id"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v8, "unsignedIntegerValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("radar_keyword_id"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = FBKJSONObjectIsNil(v9);

  if ((v10 & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    v12 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("radar_keyword_id"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "numberWithInteger:", objc_msgSend(v13, "unsignedIntegerValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[FBKIssueDefinition setIssueTypeID:](self, "setIssueTypeID:", v6);
  -[FBKIssueDefinition setIssueAreaID:](self, "setIssueAreaID:", v11);
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("issue_file_matchers"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKIssueDefinition managedObjectContext](self, "managedObjectContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKManagedFeedbackObject importFromJSONArray:intoContext:](FBKFileMatcher, "importFromJSONArray:intoContext:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKIssueDefinition setFileMatchers:](self, "setFileMatchers:", v16);

}

@end
