@implementation ICUlyssesAccessTokenContentMapping

- (void)getStringRepresentation:(id)a3 withInput:(id)a4 parameters:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDBCF50];
  v7 = a3;
  objc_msgSend(v6, "workflowUserDefaults");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringForKey:", CFSTR("WFUlyssesAccessToken"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD))a3 + 2))(v7, v8, 0);

}

@end
