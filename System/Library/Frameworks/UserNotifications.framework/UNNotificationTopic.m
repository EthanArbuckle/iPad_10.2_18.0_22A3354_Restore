@implementation UNNotificationTopic

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortIdentifier, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UNNotificationTopic identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (UNEqualStrings(v5, v6))
    {
      -[UNNotificationTopic displayName](self, "displayName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "displayName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = UNEqualObjects(v7, v8);

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
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[UNNotificationTopic identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[UNNotificationTopic displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("displayName"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[UNNotificationTopic priority](self, "priority"), CFSTR("priority"));
  -[UNNotificationTopic sortIdentifier](self, "sortIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sortIdentifier"));

}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;

  -[UNNotificationTopic identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[UNNotificationTopic displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  v7 = -[UNNotificationTopic priority](self, "priority");
  -[UNNotificationTopic sortIdentifier](self, "sortIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6 ^ v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)sortIdentifier
{
  return self->_sortIdentifier;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (UNNotificationTopic)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  UNNotificationTopic *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("displayName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("priority"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sortIdentifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[UNNotificationTopic _initWithIdentifier:displayName:priority:sortIdentifier:](self, "_initWithIdentifier:displayName:priority:sortIdentifier:", v6, v11, v12, v13);
  return v14;
}

+ (id)topicWithIdentifier:(id)a3 displayName:(id)a4 priority:(unint64_t)a5 sortIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithIdentifier:displayName:priority:sortIdentifier:", v12, v11, a5, v10);

  return v13;
}

- (id)_initWithIdentifier:(id)a3 displayName:(id)a4 priority:(unint64_t)a5 sortIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  UNNotificationTopic *v13;
  uint64_t v14;
  NSString *identifier;
  uint64_t v16;
  NSString *displayName;
  uint64_t v18;
  NSString *sortIdentifier;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)UNNotificationTopic;
  v13 = -[UNNotificationTopic init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    displayName = v13->_displayName;
    v13->_displayName = (NSString *)v16;

    v13->_priority = a5;
    v18 = objc_msgSend(v12, "copy");
    sortIdentifier = v13->_sortIdentifier;
    v13->_sortIdentifier = (NSString *)v18;

  }
  return v13;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[UNNotificationTopic _description](self, "_description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[UNNotificationTopic identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotificationTopic displayName](self, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier: %@, displayName: %@"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
