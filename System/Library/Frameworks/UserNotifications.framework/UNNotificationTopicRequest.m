@implementation UNNotificationTopicRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topic, 0);
}

+ (id)topicRequestWithIdentifier:(id)a3 displayName:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIdentifier:displayName:priority:sortIdentifier:supportedOptions:enabledOptions:", v9, v8, 0, &stru_1E57F06A0, a5, a5);

  return v10;
}

+ (id)topicRequestWithIdentifier:(id)a3 displayName:(id)a4 priority:(unint64_t)a5 sortIdentifier:(id)a6 supportedOptions:(unint64_t)a7 enabledOptions:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;

  v14 = a6;
  v15 = a4;
  v16 = a3;
  v17 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIdentifier:displayName:priority:sortIdentifier:supportedOptions:enabledOptions:", v16, v15, a5, v14, a7, a8);

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UNNotificationTopicRequest topic](self, "topic");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (UNEqualObjects(v5, v6)
      && (v7 = -[UNNotificationTopicRequest supportedOptions](self, "supportedOptions"),
          v7 == objc_msgSend(v4, "supportedOptions")))
    {
      v8 = -[UNNotificationTopicRequest enabledOptions](self, "enabledOptions");
      v9 = v8 == objc_msgSend(v4, "enabledOptions");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[UNNotificationTopicRequest topic](self, "topic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("topic"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[UNNotificationTopicRequest supportedOptions](self, "supportedOptions"), CFSTR("supportedOptions"));
  objc_msgSend(v5, "encodeInteger:forKey:", -[UNNotificationTopicRequest enabledOptions](self, "enabledOptions"), CFSTR("enabledOptions"));

}

- (id)_description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[UNNotificationTopicRequest topic](self, "topic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; topic: %@, supportedOptions: %ld, enabledOptions: %ld"),
    v4,
    self,
    v5,
    -[UNNotificationTopicRequest supportedOptions](self, "supportedOptions"),
    -[UNNotificationTopicRequest enabledOptions](self, "enabledOptions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  -[UNNotificationTopicRequest topic](self, "topic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[UNNotificationTopicRequest supportedOptions](self, "supportedOptions");
  v6 = v5 ^ -[UNNotificationTopicRequest enabledOptions](self, "enabledOptions") ^ v4;

  return v6;
}

- (UNNotificationTopic)topic
{
  return self->_topic;
}

- (unint64_t)supportedOptions
{
  return self->_supportedOptions;
}

- (unint64_t)enabledOptions
{
  return self->_enabledOptions;
}

- (UNNotificationTopicRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  UNNotificationTopicRequest *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("topic"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("supportedOptions"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("enabledOptions"));

  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "priority");
  objc_msgSend(v6, "sortIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[UNNotificationTopicRequest _initWithIdentifier:displayName:priority:sortIdentifier:supportedOptions:enabledOptions:](self, "_initWithIdentifier:displayName:priority:sortIdentifier:supportedOptions:enabledOptions:", v9, v10, v11, v12, v7, v8);

  return v13;
}

- (id)_initWithIdentifier:(id)a3 displayName:(id)a4 priority:(unint64_t)a5 sortIdentifier:(id)a6 supportedOptions:(unint64_t)a7 enabledOptions:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  UNNotificationTopicRequest *v17;
  uint64_t v18;
  UNNotificationTopic *topic;
  objc_super v21;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v21.receiver = self;
  v21.super_class = (Class)UNNotificationTopicRequest;
  v17 = -[UNNotificationTopicRequest init](&v21, sel_init);
  if (v17)
  {
    +[UNNotificationTopic topicWithIdentifier:displayName:priority:sortIdentifier:](UNNotificationTopic, "topicWithIdentifier:displayName:priority:sortIdentifier:", v14, v15, a5, v16);
    v18 = objc_claimAutoreleasedReturnValue();
    topic = v17->_topic;
    v17->_topic = (UNNotificationTopic *)v18;

    v17->_supportedOptions = a7;
    v17->_enabledOptions = a8;
  }

  return v17;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[UNNotificationTopicRequest _description](self, "_description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)topicRequestWithIdentifier:(id)a3 displayName:(id)a4 priority:(unint64_t)a5 sortIdentifier:(id)a6 options:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIdentifier:displayName:priority:sortIdentifier:supportedOptions:enabledOptions:", v14, v13, a5, v12, a7, a7);

  return v15;
}

- (unint64_t)options
{
  return self->_supportedOptions;
}

@end
