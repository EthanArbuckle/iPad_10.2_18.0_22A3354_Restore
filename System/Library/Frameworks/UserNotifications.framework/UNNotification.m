@implementation UNNotification

+ (UNNotification)notificationWithRequest:(id)a3 date:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNotificationRequest:date:sourceIdentifier:intentIdentifiers:", v6, v5, &stru_1E57F06A0, MEMORY[0x1E0C9AA60]);

  return (UNNotification *)v7;
}

+ (UNNotification)notificationWithRequest:(id)a3 date:(id)a4 sourceIdentifier:(id)a5 intentIdentifiers:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithNotificationRequest:date:sourceIdentifier:intentIdentifiers:", v12, v11, v10, v9);

  return (UNNotification *)v13;
}

- (UNNotification)initWithNotificationRequest:(id)a3 date:(id)a4 sourceIdentifier:(id)a5 intentIdentifiers:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  UNNotification *v14;
  uint64_t v15;
  NSDate *date;
  uint64_t v17;
  UNNotificationRequest *request;
  uint64_t v19;
  NSString *sourceIdentifier;
  uint64_t v21;
  void *v22;
  void *v23;
  objc_super v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)UNNotification;
  v14 = -[UNNotification init](&v25, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v11, "copy");
    date = v14->_date;
    v14->_date = (NSDate *)v15;

    v17 = objc_msgSend(v10, "copy");
    request = v14->_request;
    v14->_request = (UNNotificationRequest *)v17;

    v19 = objc_msgSend(v12, "copy");
    sourceIdentifier = v14->_sourceIdentifier;
    v14->_sourceIdentifier = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    v22 = (void *)v21;
    if (v21)
      v23 = (void *)v21;
    else
      v23 = (void *)MEMORY[0x1E0C9AA60];
    objc_storeStrong((id *)&v14->_intentIdentifiers, v23);

  }
  return v14;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[UNNotification date](self, "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[UNNotification request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[UNNotification sourceIdentifier](self, "sourceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[UNNotification intentIdentifiers](self, "intentIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UNNotification date](self, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (UNEqualObjects(v5, v6))
    {
      -[UNNotification request](self, "request");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "request");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (UNEqualObjects(v7, v8))
      {
        -[UNNotification intentIdentifiers](self, "intentIdentifiers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "intentIdentifiers");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (UNEqualObjects(v9, v10))
        {
          -[UNNotification sourceIdentifier](self, "sourceIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "sourceIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = UNEqualObjects(v11, v12);

        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[UNNotification sourceIdentifier](self, "sourceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotification date](self, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotification request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNNotification intentIdentifiers](self, "intentIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; source: %@ date: %@, request: %@, intents: %@>"),
    v4,
    self,
    v5,
    v6,
    v7,
    v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[UNNotification date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("date"));

  -[UNNotification request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("request"));

  -[UNNotification sourceIdentifier](self, "sourceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sourceIdentifier"));

  -[UNNotification intentIdentifiers](self, "intentIdentifiers");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("intentIdentifiers"));

}

- (UNNotification)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  UNNotification *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("request"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("intentIdentifiers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[UNNotification initWithNotificationRequest:date:sourceIdentifier:intentIdentifiers:](self, "initWithNotificationRequest:date:sourceIdentifier:intentIdentifiers:", v6, v5, v7, v11);
  return v12;
}

- (NSDate)date
{
  return self->_date;
}

- (UNNotificationRequest)request
{
  return self->_request;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (NSArray)intentIdentifiers
{
  return self->_intentIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentIdentifiers, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
