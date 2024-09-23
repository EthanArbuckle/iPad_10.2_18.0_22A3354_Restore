@implementation PARQueryTopicContext

- (PARQueryTopicContext)initWithTopic:(id)a3 index:(int64_t)a4
{
  id v6;
  PARQueryTopicContext *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PARQueryTopicContext;
  v7 = -[PARQueryTopicContext init](&v11, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PARQueryTopicContext setContextId:](v7, "setContextId:", v9);

    -[PARQueryTopicContext setTopic:](v7, "setTopic:", v6);
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PARQueryTopicContext contextId](self, "contextId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("contextId"));

  -[PARQueryTopicContext topic](self, "topic");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("topic"));

}

- (PARQueryTopicContext)initWithCoder:(id)a3
{
  id v4;
  PARQueryTopicContext *v5;
  uint64_t v6;
  NSString *contextId;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  SFQueryTopic *topic;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PARQueryTopicContext;
  v5 = -[PARQueryTopicContext init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextId"));
    v6 = objc_claimAutoreleasedReturnValue();
    contextId = v5->_contextId;
    v5->_contextId = (NSString *)v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("topic"));
    v12 = objc_claimAutoreleasedReturnValue();
    topic = v5->_topic;
    v5->_topic = (SFQueryTopic *)v12;

  }
  return v5;
}

- (int64_t)index
{
  void *v2;
  int64_t v3;

  -[PARQueryTopicContext contextId](self, "contextId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (SFQueryTopic)topic
{
  return self->_topic;
}

- (void)setTopic:(id)a3
{
  objc_storeStrong((id *)&self->_topic, a3);
}

- (NSString)contextId
{
  return self->_contextId;
}

- (void)setContextId:(id)a3
{
  objc_storeStrong((id *)&self->_contextId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextId, 0);
  objc_storeStrong((id *)&self->_topic, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
