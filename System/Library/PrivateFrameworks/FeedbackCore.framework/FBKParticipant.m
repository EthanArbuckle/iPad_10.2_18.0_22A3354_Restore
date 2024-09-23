@implementation FBKParticipant

+ (id)entityName
{
  return CFSTR("Participant");
}

+ (id)currentParticipantForContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    v4 = a3;
    +[FBKData sharedInstance](FBKData, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentUser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "entityName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "findFeedbackObjectWithEntityName:remoteID:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

+ (id)keyPathsForValuesAffectingFullName
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("givenName"), CFSTR("familyName"), 0);
}

- (void)setPropertiesFromJSONObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("first_name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKParticipant setGivenName:](self, "setGivenName:", v6);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("last_name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  FBKNilIfNSNull(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKParticipant setFamilyName:](self, "setFamilyName:", v8);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("email_address"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  FBKNilIfNSNull(v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKParticipant setEmailAddress:](self, "setEmailAddress:", v9);

}

- (NSString)fullName
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  if (fullName_onceToken != -1)
    dispatch_once(&fullName_onceToken, &__block_literal_global_30);
  v3 = objc_alloc_init(MEMORY[0x24BDD1730]);
  -[FBKParticipant givenName](self, "givenName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGivenName:", v4);

  -[FBKParticipant familyName](self, "familyName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFamilyName:", v5);

  objc_msgSend((id)fullName_formatter, "stringFromPersonNameComponents:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

void __26__FBKParticipant_fullName__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1738]);
  v1 = (void *)fullName_formatter;
  fullName_formatter = (uint64_t)v0;

}

+ (NSArray)sortDescriptors
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBAD10], "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sortOrder");

  if (v3 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("givenName"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v4;
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("familyName"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = v5;
    v6 = v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("familyName"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("givenName"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v5;
    v6 = v9;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("Participant"));
}

@end
