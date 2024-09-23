@implementation EDAMClientUsageMetrics

+ (id)structName
{
  return CFSTR("ClientUsageMetrics");
}

+ (id)structFields
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];

  v9[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)structFields_structFields_868;
  if (!structFields_structFields_868)
  {
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 1, 8, 1, CFSTR("sessions"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 2, 11, 1, CFSTR("subjectConsumerKey"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9[1] = v4;
    +[FATField fieldWithIndex:type:optional:name:](FATField, "fieldWithIndex:type:optional:name:", 3, 11, 1, CFSTR("subjectConsumerSecret"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 3);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)structFields_structFields_868;
    structFields_structFields_868 = v6;

    v2 = (void *)structFields_structFields_868;
  }
  return v2;
}

- (NSNumber)sessions
{
  return self->_sessions;
}

- (void)setSessions:(id)a3
{
  objc_storeStrong((id *)&self->_sessions, a3);
}

- (NSString)subjectConsumerKey
{
  return self->_subjectConsumerKey;
}

- (void)setSubjectConsumerKey:(id)a3
{
  objc_storeStrong((id *)&self->_subjectConsumerKey, a3);
}

- (NSString)subjectConsumerSecret
{
  return self->_subjectConsumerSecret;
}

- (void)setSubjectConsumerSecret:(id)a3
{
  objc_storeStrong((id *)&self->_subjectConsumerSecret, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subjectConsumerSecret, 0);
  objc_storeStrong((id *)&self->_subjectConsumerKey, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
}

@end
